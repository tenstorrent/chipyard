#!/usr/bin/env bash
# IPC report from a cosim .out: total retired instructions (whisper steps),
# vector instructions (mnemonics beginning with 'v'), and cycles.
# Retired-instruction data lives in the RUN LOG (whisper cosim stream), the cycle
# count in the .out (TestDriver summary) -- pass the log; the .out is derived.
# Usage: ipc_report.sh <run-log> ...
printf "%-22s %9s %9s %9s %7s %7s %6s\n" kernel cycles instrs vec_instrs IPC vecIPC vec%
for f in "$@"; do
  [ -s "$f" ] || continue
  k=$(basename "$f" _MegaBoomV4VectorWideConfig.log)
  cyc=$(grep -a "Completed after" "$f" | tail -1 | grep -oE "[0-9]+" | tail -1)
  if [ -z "$cyc" ]; then
    # TestDriver's summary lands in the spike-dasm'd .out, not the log.
    b=${k#*_}; od=$(dirname "$f")/output/chipyard.harness.TestHarness.MegaBoomV4VectorWideConfig
    for c in "$od/$k"*.out; do
      [ -s "$c" ] && cyc=$(grep -a "Completed after" "$c" | tail -1 | grep -oE "[0-9]+" | tail -1) && break
    done
  fi
  # One "Whisper Step #N: [... Opcode=0x..., <mnemonic> ...]" line per retired instr
  # (a step may print extra Resource= lines; count only the ChangeCount header).
  read -r tot vec < <(grep -a "Whisper Step #" "$f" | grep -a "ChangeCount=" \
    | sed 's/.*ChangeCount=[0-9]*, PC=0x[0-9a-f]*, Opcode=0x[0-9a-f]*, *//' \
    | awk '{n++; if ($1 ~ /^v/) v++} END{print n+0, v+0}')
  if [ -n "$cyc" ] && [ "$cyc" -gt 0 ] 2>/dev/null; then
    awk -v k="$k" -v c="$cyc" -v t="$tot" -v v="$vec" 'BEGIN{
      printf "%-22s %9d %9d %9d %7.3f %7.3f %5.1f%%\n", k, c, t, v, t/c, v/c, (t?100.0*v/t:0)}'
  else
    printf "%-22s %9s %9d %9d %7s %7s %6s\n" "$k" "NA" "$tot" "$vec" "-" "-" "-"
  fi
done
