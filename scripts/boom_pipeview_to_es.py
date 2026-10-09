#!/usr/bin/env python3
"""Convert BOOM v4 `O3PV` printf lines (WithBoomPipeViewPrintf) to a perf-streams event stream for catscan.

Run with catscan's venv python (needs perf_streams + capstone):
  catscan/.venv/bin/python scripts/boom_pipeview_to_es.py $OD/test.out -o test.es
  catscan/.venv/bin/catscan --view transactions test.es
"""

import argparse
import re
import sys

from perf_streams.event_stream import EventStreamWriterWith
from perf_streams.extensions.transactions import Transactions

# point events, in same-cycle order
STAGES = ["fetch", "decode", "rename", "dispatch", "issue", "cii_send", "cii_opreq", "cii_wb",
          "complete", "retire", "retire_squashed"]
STAGE_RANK = {s: i for i, s in enumerate(STAGES)}
ROB_KEYED = ("issue", "cii_send", "cii_opreq", "cii_wb", "complete", "retire")
# state a uop is in from a point event until its next one; filled per cycle as in_<state>
STATE_AFTER = {"fetch": "fb", "decode": "dec", "rename": "ren", "dispatch": "iq", "issue": "exe",
               "cii_send": "vpu_q", "cii_opreq": "vpu_exe", "cii_wb": "vpu_wb", "complete": "rob"}
STATES = list(dict.fromkeys(STATE_AFTER.values()))
LINE_RE = re.compile(r"O3PV\s+(\w+)\s+(\d+)\s+(\d+)(.*)")
FETCH_RE = re.compile(r"\s+0x([0-9a-fA-F]+)\s+0x([0-9a-fA-F]+)\s*(.*)")


class Inst:
    __slots__ = ("seq", "pc", "inst", "disasm", "rob_idx", "events")

    def __init__(self, seq, pc, inst, disasm):
        self.seq, self.pc, self.inst, self.disasm = seq, pc, inst, disasm
        self.rob_idx = None
        self.events = []  # (cycle, stage)


def make_disassembler():
    try:
        import capstone

        md = capstone.Cs(capstone.CS_ARCH_RISCV, capstone.CS_MODE_RISCV64 | capstone.CS_MODE_RISCVC)
    except Exception:
        return lambda inst: f"0x{inst:08x}"

    def dis(inst):
        size = 2 if (inst & 3) != 3 else 4
        for i in md.disasm(inst.to_bytes(size, "little"), 0):
            return f"{i.mnemonic} {i.op_str}".strip()
        return f"0x{inst:08x}"

    return dis


def parse(lines, dis):
    insts = {}
    rob = {}
    recs = []
    for n, line in enumerate(lines):
        m = LINE_RE.search(line)
        if not m:
            continue
        stage, cyc, key, rest = m.group(1), int(m.group(2)), int(m.group(3)), m.group(4)
        # same-cycle ordering: retire/complete/issue of an old ROB occupant before a new dispatch into it
        recs.append((cyc, 1 if stage == "dispatch" else 0, n, stage, key, rest))
    recs.sort()

    for cyc, _, _, stage, key, rest in recs:
        if stage == "fetch":
            f = FETCH_RE.match(rest)
            if not f:
                continue
            pc, inst, text = int(f.group(1), 16), int(f.group(2), 16), f.group(3).strip()
            if not text or text.startswith("DASM("):
                text = dis(inst)
            text = " ".join(text.split())
            ins = Inst(key, pc, inst, text)
            ins.events.append((cyc, "fetch"))
            insts[key] = ins
        elif stage in ("decode", "rename"):
            ins = insts.get(key)
            if ins and not any(s == stage for _, s in ins.events):
                ins.events.append((cyc, stage))
        elif stage == "dispatch":
            ins = insts.get(key)
            if not ins:
                continue
            ins.rob_idx = int(rest.split()[0])
            ins.events.append((cyc, "dispatch"))
            rob[ins.rob_idx] = ins
        elif stage in ROB_KEYED:
            ins = rob.get(key)
            if not ins or cyc < ins.events[-1][0]:
                continue
            ins.events.append((cyc, stage))
            if stage == "retire":
                del rob[key]
    for ins in insts.values():
        ins.events.sort(key=lambda e: (e[0], STAGE_RANK[e[1]]))
    return insts


def write(insts, out, keep_squashed, period, fill):
    w = EventStreamWriterWith(Transactions)(out)
    w.set_parameter("source_format", "boom.o3pv", "Original trace format")
    w.set_parameter("time_unit", "ps", "Timestamp unit")
    ev = {s: w.define_event(s, f"BOOM uop stage '{s}'") for s in STAGES}
    ev_fill = {st: w.define_event(f"in_{st}", f"BOOM uop waiting/in '{st}' this cycle") for st in STATES}
    d_seq = w.define_data("seq_num", "Fetch sequence number")
    d_pc = w.define_data("program_counter", "Instruction program counter")
    d_inst = w.define_data("inst", "Instruction bits")
    d_dis = w.define_data("disasm", "Instruction disassembly")
    d_op = w.define_data("op", "Instruction mnemonic")
    d_rob = w.define_data("rob_idx", "ROB index")
    d_dur = w.define_data("cycles_in_stage", "Cycles until this uop's next stage event")
    d_sum = w.define_data("stage_cycles", "Cycles spent in each stage over the uop's lifetime")
    w.start_simulation()

    actions = []  # (time, order, kind, seq, stage)
    for ins in insts.values():
        retired = any(s == "retire" for _, s in ins.events)
        if not retired:
            if not keep_squashed:
                continue
            ins.events.append((ins.events[-1][0], "retire_squashed"))
        t0, t1 = ins.events[0][0], ins.events[-1][0]
        actions.append((t0, 0, ins.seq, None))
        actions.extend((c, 1, ins.seq, i) for i, (c, _) in enumerate(ins.events))
        if fill:
            for i, (c, st) in enumerate(ins.events[:-1]):
                actions.extend((t, 1, ins.seq, -1 - i) for t in range(c + 1, ins.events[i + 1][0]))
        actions.append((t1, 2, ins.seq, None))
    actions.sort(key=lambda a: (a[0], a[1], a[2], abs(a[3] or 0)))

    open_tx = {}
    durs, sums = {}, {}
    for ins in insts.values():
        if not ins.events or ins.events[-1][1] not in ("retire", "retire_squashed"):
            continue
        d = [ins.events[i + 1][0] - c for i, (c, _) in enumerate(ins.events[:-1])] + [0]
        per = {}
        for (_, st), n in zip(ins.events[:-1], d):
            per[STATE_AFTER[st]] = per.get(STATE_AFTER[st], 0) + n
        durs[ins.seq] = d
        sums[ins.seq] = " ".join(f"{st}:{n}" for st, n in per.items()) + \
            f" total:{ins.events[-1][0] - ins.events[0][0]}"

    for t, order, seq, idx in actions:
        ins = insts[seq]
        time = t * period
        if order == 0:
            open_tx[seq] = w.begin_transaction(time)
        elif order == 2:
            w.end_transaction(open_tx.pop(seq), time)
        elif idx < 0:
            w.post_event(ev_fill[STATE_AFTER[ins.events[-1 - idx][1]]], time,
                         {d_seq: ins.seq, d_op: ins.disasm.split()[0]}, transaction=open_tx[seq])
        else:
            stage = ins.events[idx][1]
            vals = {d_seq: ins.seq, d_pc: ins.pc, d_inst: ins.inst, d_dis: ins.disasm, d_op: ins.disasm.split()[0],
                    d_dur: durs[seq][idx], d_sum: sums[seq]}
            if ins.rob_idx is not None and stage not in ("fetch", "decode", "rename"):
                vals[d_rob] = ins.rob_idx
            w.post_event(ev[stage], time, vals, transaction=open_tx[seq])
    w.close()


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("input", nargs="?", default="-", help="sim .out/.log containing O3PV lines (default: stdin)")
    ap.add_argument("-o", "--output", required=True, help="event stream output path")
    ap.add_argument("--drop-squashed", action="store_true", help="omit uops that never retired")
    ap.add_argument("--period", type=int, default=1000, help="ps per cycle (default 1000); match catscan --period")
    ap.add_argument("--no-fill", action="store_true", help="don't emit per-cycle in_<state> events between stages")
    args = ap.parse_args()

    f = sys.stdin if args.input == "-" else open(args.input, errors="replace")
    insts = parse(f, make_disassembler())
    write(insts, args.output, not args.drop_squashed, args.period, not args.no_fill)
    n_ret = sum(any(s == "retire" for _, s in i.events) for i in insts.values())
    print(f"{len(insts)} uops, {n_ret} retired, {len(insts) - n_ret} squashed -> {args.output}", file=sys.stderr)


if __name__ == "__main__":
    main()
