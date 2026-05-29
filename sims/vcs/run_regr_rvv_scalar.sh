#!/usr/bin/env bash
# Run every tests/rvv/kernels/<kernel>/*scalar*.elf through the VCS debug sim
# and collect per-test artifacts under sims/vcs/regr_rvv_scalar/<kernel>/.
#
# Usage (from inside sims/vcs/):
#   ./run_regr_rvv_scalar.sh [CONFIG]
#
# CONFIG defaults to MediumBoomV4Config and can also be set via env.
# SKIP_BUILD=1 to skip the upfront `make debug` (assumes simv already exists).
# MAKE_JOBS=N to override the parallelism of the upfront build (default: nproc).

set -uo pipefail   # NOT -e: one failing test must not abort the rest.

CONFIG="${1:-${CONFIG:-MediumBoomV4Config}}"
SKIP_BUILD="${SKIP_BUILD:-0}"
MAKE_JOBS="${MAKE_JOBS:-$(nproc 2>/dev/null || echo 1)}"

SIMS_VCS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHIPYARD_DIR="$(cd "$SIMS_VCS_DIR/../.." && pwd)"
KERNELS_DIR="$CHIPYARD_DIR/tests/rvv/kernels"
REGR_DIR="$SIMS_VCS_DIR/regr_rvv_scalar_$CONFIG/"
OD="$SIMS_VCS_DIR/output/chipyard.harness.TestHarness.${CONFIG}"

# Whisper / cosim side-files written into sims/vcs/ (CWD) by every run.
# They get overwritten each invocation, so we snapshot per test.
WHISPER_FILES=(isscmd.log iss_cosim.log issfinal.log wsolo.log whisper_connect)

mkdir -p "$REGR_DIR"
SUMMARY="$REGR_DIR/results.txt"
{
    printf '# RVV scalar regression — CONFIG=%s\n' "$CONFIG"
    printf '# Started: %s\n' "$(date -Iseconds)"
    printf '\n'
    printf '%-18s  %-7s  %-12s  %s\n' "KERNEL" "STATUS" "CYCLES" "ELF"
    printf '%-18s  %-7s  %-12s  %s\n' "------" "-------" "------" "---"
} > "$SUMMARY"

mapfile -t ELFS < <(find "$KERNELS_DIR" -maxdepth 2 -name '*scalar*.elf' | sort)
if (( ${#ELFS[@]} == 0 )); then
    echo "ERROR: no *scalar*.elf found under $KERNELS_DIR" >&2
    exit 1
fi

echo "Found ${#ELFS[@]} scalar test(s); writing results to $REGR_DIR"

# Build the debug sim once upfront with output visible on the terminal.
# Otherwise the first test pays this ~10-20 min cost silently (output is
# redirected to make.log per-test), making the regression look hung.
if [[ "$SKIP_BUILD" != "1" ]]; then
    echo
    echo "============================================================"
    echo "Pre-building debug sim for CONFIG=$CONFIG  (-j$MAKE_JOBS)"
    echo "============================================================"
    if ! ( cd "$SIMS_VCS_DIR" \
           && make CONFIG="$CONFIG" -j"$MAKE_JOBS" debug ) \
         2>&1 | tee "$REGR_DIR/build.log"; then
        echo "ERROR: pre-build failed. See $REGR_DIR/build.log" >&2
        exit 1
    fi
fi

run_one() {
    local elf="$1"
    local kdir
    kdir="$(basename "$(dirname "$elf")")"
    local stem
    stem="$(basename "${elf%.elf}")"        # e.g. conv1d-scalar
    local od_stem="$OD/$stem"
    local out_subdir="$REGR_DIR/$kdir"
    mkdir -p "$out_subdir"

    echo
    echo "============================================================"
    echo "[$kdir] $(basename "$elf")"
    echo "============================================================"

    # Drop stale per-test outputs and stale whisper side-files so we don't
    # archive artifacts from a previous run if this sim aborts early.
    rm -f "$od_stem".log "$od_stem".out "$od_stem".dump "$od_stem".fsdb
    for f in "${WHISPER_FILES[@]}"; do rm -f "$SIMS_VCS_DIR/$f"; done

    local make_rc=0
    ( cd "$SIMS_VCS_DIR" \
      && make CONFIG="$CONFIG" run-binary-debug-hex BINARY="$elf" ) \
        > "$out_subdir/make.log" 2>&1 || make_rc=$?

    # Per-test artifacts dropped by the sim into $OD.
    for ext in log out dump fsdb; do
        [[ -f "$od_stem.$ext" ]] && cp -f "$od_stem.$ext" "$out_subdir/"
    done
    # Whisper side-files from sims/vcs/ CWD.
    for f in "${WHISPER_FILES[@]}"; do
        [[ -f "$SIMS_VCS_DIR/$f" ]] && cp -f "$SIMS_VCS_DIR/$f" "$out_subdir/"
    done

    local status="UNKNOWN" cycles="-"
    local outfile="$out_subdir/$stem.out"
    if [[ -f "$outfile" ]]; then
        # TestDriver.v emits either:
        #   *** PASSED *** Completed after   <N> simulation cycles
        #   *** FAILED *** [(reason)] after  <N> simulation cycles
        local marker
        marker="$(grep -E '\*\*\* (PASSED|FAILED) \*\*\*' "$outfile" | tail -1)"
        if [[ -n "$marker" ]]; then
            if [[ "$marker" == *PASSED* ]]; then status="PASS"; else status="FAIL"; fi
            cycles="$(printf '%s\n' "$marker" \
                      | grep -oE '[0-9]+[[:space:]]+simulation cycles' \
                      | awk '{print $1}')"
            [[ -z "$cycles" ]] && cycles="-"
        fi
    fi
    # Build/sim error before any marker was written.
    if (( make_rc != 0 )) && [[ "$status" == "UNKNOWN" ]]; then status="ERROR"; fi

    printf '%-18s  %-7s  %-12s  %s\n' "$kdir" "$status" "$cycles" "$elf" \
        | tee -a "$SUMMARY"
}

for elf in "${ELFS[@]}"; do
    run_one "$elf"
done

{
    printf '\n# Finished: %s\n' "$(date -Iseconds)"
} >> "$SUMMARY"

echo
echo "===== Summary ====="
cat "$SUMMARY"
