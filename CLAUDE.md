# Running BOOM Tests in This Chipyard

This repo is set up to run BOOM (Tenstorrent Caracal fork) tests under Verilator (free) or VCS / Xcelium (commercial). Workflow is: launch the container with tool licenses, build a simulator for a config, then run riscv-tests benchmarks or ISA tests through it — with optional waveform dumping.

## Repo state — non-obvious

| Submodule | Branch / SHA | Why |
|---|---|---|
| `generators/boom` | `tenstorrent/riscv-ocelot.git` branch `Caracal/main` | switched off upstream riscv-boom |
| `generators/rocket-chip` | `46343c89a` (chipsalliance master tip) | required for Caracal's `TraceCoreInterface.ctx` and 3-arg `TraceEncoderController(addr, beatBytes, hartId)` |
| `generators/diplomacy` | `fe5e131` | required by rocket-chip@46343c89a |

Local patches (not on upstream branches):
- `generators/shuttle/src/main/scala/common/Tile.scala:220` — added `tileId` as 3rd arg to `TraceEncoderController`
- `generators/shuttle/src/main/scala/exu/Core.scala` — added `io.trace_core_ingress.get.ctx := csr.io.ptbr.asid`
- `sims/xcelium/Makefile` — added `debug-ida` target, `$(sim_debug_ida)`, `%.ida.db` pattern rule for Verisium Debug
- `common.mk:462` — added `%.ida.db` to the `-include` filter

If `generators/boom`, `generators/rocket-chip`, or `generators/diplomacy` get reset, the build will fail with the Caracal trace-API errors documented in this file's `Troubleshooting` section.

## 1. Launch the container

```bash
cd /proj_risc/user_dev/ading/chipyard_current/chipyard_try

# Required env on the host before running:
export VCS_HOME=/path/to/vcs                   # Synopsys VCS install root
export VERDI_HOME=/path/to/verdi               # Verdi install root
export LM_LICENSE_FILE=<...>
export SNPSLMD_LICENSE_FILE=<...>
# For Xcelium (optional, only if running Cadence flows):
export XCELIUM_HOME=/path/to/cadence/xcelium/25.03.001
export CDS_LIC_FILE=<...>

podman run --security-opt seccomp=unconfined --security-opt label=disable \
  --env VCS_HOME="$VCS_HOME" \
  --env LM_LICENSE_FILE="$LM_LICENSE_FILE" \
  --env SNPSLMD_LICENSE_FILE="$SNPSLMD_LICENSE_FILE" \
  --env VERDI_HOME="$VERDI_HOME" \
  --env CDS_LIC_FILE="$CDS_LIC_FILE" \
  -it --rm -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/.ssh:/root/.ssh \
  -v $(pwd):/root/my-chipyard \
  -v $VCS_HOME:$VCS_HOME \
  -v $VERDI_HOME:$VERDI_HOME \
  -v $XCELIUM_HOME:/tools_vendor/cadence/xcelium/25.03.001 \
  -w /root/my-chipyard \
  ghcr.io/kychentt/tt-chipyard-whisper:latest bash
```

Important about the Xcelium mount: the container's conda env hardcodes `/tools_vendor/cadence/xcelium/25.03.001` as the install path. **Remap** the host install onto that path — don't use `-v $XCELIUM_HOME:$XCELIUM_HOME` if your host has Xcelium at a different location.

If you don't need Xcelium, drop both `--env CDS_LIC_FILE` and the `$XCELIUM_HOME` mount.

If the container is already running, you can enter it with `podman exec` instead of starting a new one:

```bash
podman exec -it <container-id-or-name> bash
```

If you just want to run a single command inside the container:

```bash
podman exec <container-id-or-name> <command>
```

## 2. Inside the container

```bash
source /root/my-chipyard/env.sh         # sets RISCV, LD_LIBRARY_PATH, etc.
echo "$RISCV"                            # must print a non-empty path
```

`env.sh` activates the conda env baked into the image and sets `RISCV` to where riscv-tests benchmarks/ISA tests are installed.

## 3. Build a simulator

The Scala→Verilog elaboration step is the slow part and is shared across debug/non-debug variants of the same config. `firtool` must be at version 1.55 or newer to parse the FIR file BOOM emits (backtick-escaped numeric Bundle field names from `MixedVec`). Chipyard pins firtool-1.75.0 in `conda-reqs/circt.json`.

### Verilator (free, slower)

```bash
cd /root/my-chipyard/sims/verilator
make CONFIG=MediumBoomV4Config -j$(nproc) debug   # builds simulator-…-debug
```

### VCS (commercial, fastest)

```bash
cd /root/my-chipyard/sims/vcs
make CONFIG=MediumBoomV4Config -j$(nproc) debug   # builds simv-…-debug
```

Other BOOM configs you can substitute for `MediumBoomV4Config`: `SmallBoomV4Config`, `LargeBoomV4Config`, `MegaBoomV4Config`, `GigaBoomV4Config`, dual-core variants, etc. — see `generators/boom/src/main/scala/v4/common/config-mixins.scala` and `chipyard/src/main/scala/config/BoomConfigs.scala`.

## 4. Run tests

### Output path layout (read this — it's the #1 footgun)

`$(output_dir)` is **absolute and per-config**:
```
/root/my-chipyard/sims/<vcs|verilator|xcelium>/output/chipyard.harness.TestHarness.<Config>/
```

When invoking `make <something>.fsdb` or `<something>.vcd`, you must pass the **full absolute path** — `make` pattern rules do not canonicalize relative paths.

Convenience:
```bash
OD=$(pwd)/output/chipyard.harness.TestHarness.MediumBoomV4Config
```

### Run a single test, no waveform

```bash
make CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.out
# Or:
make CONFIG=MediumBoomV4Config run-binary BINARY=/abs/path/to/your.riscv
```

Outputs: `$OD/dhrystone.riscv.log` (stdout), `$OD/dhrystone.riscv.out` (spike-dasm decoded), `$OD/dhrystone.riscv` (symlink to the ELF).

### Run a single test, with waveform

#### VCS — FSDB (default, recommended for Verdi)

```bash
cd /root/my-chipyard/sims/vcs
OD=$(pwd)/output/chipyard.harness.TestHarness.MediumBoomV4Config
make CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.fsdb
```

Output: `$OD/dhrystone.riscv.fsdb`. Requires `$VERDI_HOME` set so VCS links the FSDB PLI — without it, the file is created but empty.

#### VCS — VPD (for DVE or older Verdi)

Rebuild without `+define+FSDB`:
```bash
rm -f simv-chipyard.harness-MediumBoomV4Config-debug
make USE_VPD=1 CONFIG=MediumBoomV4Config -j$(nproc) debug
make USE_VPD=1 CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.vpd
```

`USE_VPD` must match between build and run — it gates `+define+FSDB` at compile time.

#### Verilator — VCD or FST

```bash
cd /root/my-chipyard/sims/verilator
OD=$(pwd)/output/chipyard.harness.TestHarness.MediumBoomV4Config
make CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.vcd
# Or compressed FST:
make USE_FST=1 CONFIG=MediumBoomV4Config debug    # rebuild needed for FST
make USE_FST=1 CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.fst
```

#### Xcelium — IDA database (Verisium Debug)

```bash
cd /root/my-chipyard/sims/xcelium
OD=$(pwd)/output/chipyard.harness.TestHarness.MediumBoomV4Config
make CONFIG=MediumBoomV4Config -j$(nproc) debug-ida
make CONFIG=MediumBoomV4Config $OD/dhrystone.riscv.ida.db
```

The `debug-ida` target and `.ida.db` rule are added by the local patch in `sims/xcelium/Makefile`. If the `-indago` flag in `$(sim_debug_ida_run_tcl)` isn't accepted by your Xcelium version, swap it for `-shm` or `-ida` (see `xrun -helpflag database`).

### Run all bmark tests

```bash
cd /root/my-chipyard/sims/vcs
make CONFIG=MediumBoomV4Config -j$(nproc) run-bmark-tests          # no wave, fastest
```

For waveforms on all bmark tests, no built-in `-fsdb` aggregate target exists. Spell out the 12 ELFs:

```bash
OD=$(pwd)/output/chipyard.harness.TestHarness.MediumBoomV4Config
make CONFIG=MediumBoomV4Config -j$(nproc) \
  $OD/median.riscv.fsdb $OD/multiply.riscv.fsdb $OD/qsort.riscv.fsdb \
  $OD/rsort.riscv.fsdb $OD/pmp.riscv.fsdb $OD/towers.riscv.fsdb \
  $OD/vvadd.riscv.fsdb $OD/dhrystone.riscv.fsdb $OD/mt-matmul.riscv.fsdb \
  $OD/mm.riscv.fsdb $OD/spmv.riscv.fsdb $OD/mt-vvadd.riscv.fsdb
```

Or use VPD via the built-in aggregate (requires `USE_VPD=1` rebuild):
```bash
make USE_VPD=1 CONFIG=MediumBoomV4Config -j$(nproc) run-bmark-tests-debug
```

### Run all ISA tests

```bash
make CONFIG=MediumBoomV4Config -j$(nproc) run-asm-tests             # no wave
make USE_VPD=1 CONFIG=MediumBoomV4Config -j$(nproc) run-asm-tests-debug   # VPD
```

## 5. Viewing waves

```bash
verdi -ssf $OD/dhrystone.riscv.fsdb &           # FSDB → Verdi
dve  -vpd $OD/dhrystone.riscv.vpd &             # VPD → DVE
gtkwave $OD/dhrystone.riscv.vcd &               # VCD → GTKWave (or Verdi)
verisium debug $OD/dhrystone.riscv.ida.db &     # IDA → Verisium Debug
```

X11 forwarding is set up via the `-v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY` lines in the podman launch.

## 6. Test source locations

| Source | Path |
|---|---|
| riscv-tests benchmarks (`dhrystone`, `qsort`, …) | `toolchains/riscv-tools/riscv-tests/benchmarks/` |
| riscv-tests ISA tests (`rv64ui`, `rv64um`, …) | `toolchains/riscv-tools/riscv-tests/isa/` |
| Installed ELFs (what the sim runs) | `$RISCV/riscv64-unknown-elf/share/riscv-tests/{benchmarks,isa}/` |
| Custom tests | `tests/` (has its own Makefile) |

To rebuild benchmarks after editing source:
```bash
cd toolchains/riscv-tools/riscv-tests
./configure --prefix=$RISCV/riscv64-unknown-elf
make && make install
```

## 7. Clean

| Scope | Command |
|---|---|
| One simv (keep generated Verilog) | `make CONFIG=… clean-sim-debug` |
| Full per-config wipe (Verilog + simv + classpath cache) | `make CONFIG=… clean` |
| Nuke Scala compile cache too | `find generators -type d \( -name target -o -name project \) -prune -exec rm -rf {} +` |
| Just clear output (logs/waves) | `rm -rf sims/vcs/output sims/verilator/output sims/xcelium/output` |

## 8. Troubleshooting

### `No rule to make target 'output/foo.fsdb'`
`$(output_dir)` is absolute and per-config. Pass `$(pwd)/output/chipyard.harness.TestHarness.<Config>/foo.fsdb`. Verify with `make CONFIG=… print-output_dir`.

### `unexpected character` from firtool, columns 2000+
`firtool` too old; it can't parse backtick-escaped numeric field names from BOOM's `MixedVec` dispatch bundle. Update to firtool ≥ 1.55 (1.75.0 is the chipyard pin):
```bash
mamba install -c ucb-bar firtool=1.75.0
```

### `too many arguments (found 3, expected 2) for constructor TraceEncoderController`
The rocket-chip submodule was reset to an older commit. Restore:
```bash
cd generators/rocket-chip && git checkout 46343c89a
cd ../diplomacy && git checkout fe5e131
```

### `value ctx is not a member of TraceCoreInterface`
Same as above — rocket-chip needs to be ≥ commit `bff9532e7` (where the `ctx` field was added).

### `Error: host directory cannot be empty` from podman
A volume mount's source is empty. One of `$VCS_HOME`, `$VERDI_HOME`, `$XCELIUM_HOME`, `$HOME` was unset on the host. Check:
```bash
for v in VCS_HOME VERDI_HOME XCELIUM_HOME HOME LM_LICENSE_FILE; do
  printf '%-20s = %q\n' "$v" "${!v}"
done
```

### `bash: /tools_vendor/.../xrun: No such file or directory` (inside container)
Two possibilities:
1. Xcelium not bind-mounted to the path the container's conda env expects. Use `-v <host-xcelium-install>:/tools_vendor/cadence/xcelium/25.03.001` (remapping mount).
2. ELF interpreter or shared libs missing inside the container. Run `file <xrun>` and `ldd <xrun>` to check. Install missing libs via the image's package manager (`apt-get`/`dnf`/`microdnf`).

### `XCELIUM_WAVEFORM_FLAG` undefined in TCL
The `%.vcd` and `%.ida.db` pattern rules set this env var. If you're invoking `simx-…-debug-ida` directly (not through `make`), export it first:
```bash
XCELIUM_WAVEFORM_FLAG=/abs/path/out.ida.db ./simx-…-debug-ida +permissive ./mytest.riscv +permissive-off
```

## 9. Common config variants

| Config | Cores | Notes |
|---|---|---|
| `SmallBoomV4Config` | 1 small core | smallest BOOM, fastest sim |
| `MediumBoomV4Config` | 1 medium core | default used in this doc |
| `LargeBoomV4Config` | 1 large core | bigger ROB, more issue slots |
| `MegaBoomV4Config` | 1 mega core | widest dispatch |
| `GigaBoomV4Config` | 1 giga core | widest yet |
| `DualBoomV4Config` | 2 medium cores | for multi-core/coherence work |

Add `WithTrace` or other config fragments by editing `chipyard/src/main/scala/config/BoomConfigs.scala`.
