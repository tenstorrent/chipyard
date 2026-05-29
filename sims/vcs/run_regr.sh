#!/usr/bin/env bash
# Run every ELF listed in a tests-list file through the VCS debug sim and
# collect per-test artifacts under sims/vcs/regr_<list-name>_<CONFIG>/.
#
# Usage (from inside sims/vcs/):
#   ./run_regr.sh <LIST_FILE> [CONFIG]
#
# LIST_FILE  required. One absolute ELF path per line; blank lines and '#'
#            comments are ignored. Output dir derives from its basename
#            (e.g. tests_regr/vset_loadstore_tests.txt → regr_vset_loadstore_tests_<CONFIG>/).
# CONFIG     defaults to MediumBoomV4Config (env-overridable).
# REGR_DIR   override the output dir entirely via env.
# SKIP_BUILD=1 to skip the upfront `make debug` (assumes simv already exists).
# MAKE_JOBS=N to override the parallelism of the upfront build (default: nproc).

set -uo pipefail   # NOT -e: one failing test must not abort the rest.

if [[ $# -lt 1 && -z "${LIST_FILE:-}" ]]; then
    echo "Usage: $(basename "$0") <LIST_FILE> [CONFIG]" >&2
    exit 2
fi

LIST_FILE="${1:-${LIST_FILE}}"
CONFIG="${2:-${CONFIG:-MediumBoomV4Config}}"
SKIP_BUILD="${SKIP_BUILD:-0}"
MAKE_JOBS="${MAKE_JOBS:-$(nproc 2>/dev/null || echo 1)}"

SIMS_VCS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHIPYARD_DIR="$(cd "$SIMS_VCS_DIR/../.." && pwd)"
LIST_STEM="$(basename "${LIST_FILE%.txt}")"
REGR_DIR="${REGR_DIR:-$SIMS_VCS_DIR/regr_${LIST_STEM}_${CONFIG}}"
OD="$SIMS_VCS_DIR/output/chipyard.harness.TestHarness.${CONFIG}"

# Whisper / cosim side-files written into sims/vcs/ (CWD) by every run.
# They get overwritten each invocation, so we snapshot per test.
WHISPER_FILES=(isscmd.log iss_cosim.log issfinal.log wsolo.log whisper_connect)

if [[ ! -f "$LIST_FILE" ]]; then
    echo "ERROR: test list file not found: $LIST_FILE" >&2
    exit 1
fi

mkdir -p "$REGR_DIR"
SUMMARY="$REGR_DIR/results.txt"
{
    printf '# Regression from list — CONFIG=%s\n' "$CONFIG"
    printf '# List file: %s\n' "$LIST_FILE"
    printf '# Started:   %s\n' "$(date -Iseconds)"
    printf '\n'
    printf '%-18s  %-22s  %-7s  %-12s  %s\n' "GROUP" "TEST" "STATUS" "CYCLES" "ELF"
    printf '%-18s  %-22s  %-7s  %-12s  %s\n' "-----" "----" "-------" "------" "---"
} > "$SUMMARY"

# Read list: strip comments / blank lines, keep order.
mapfile -t ELFS < <(sed -e 's/[[:space:]]*#.*//' -e '/^[[:space:]]*$/d' "$LIST_FILE")
if (( ${#ELFS[@]} == 0 )); then
    echo "ERROR: no ELF entries in $LIST_FILE" >&2
    exit 1
fi

# Validate each path before kicking off a long build.
missing=0
for elf in "${ELFS[@]}"; do
    if [[ ! -f "$elf" ]]; then
        echo "ERROR: ELF not found: $elf" >&2
        missing=1
    fi
done
(( missing )) && exit 1

echo "Found ${#ELFS[@]} test(s) in $LIST_FILE; writing results to $REGR_DIR"

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
    kdir="$(basename "$(dirname "$elf")")"  # e.g. bringup_tests
    local stem
    stem="$(basename "${elf%.elf}")"        # e.g. ms2_vse64
    local od_stem="$OD/$stem"
    local out_subdir="$REGR_DIR/$kdir/$stem"
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

    printf '%-18s  %-22s  %-7s  %-12s  %s\n' "$kdir" "$stem" "$status" "$cycles" "$elf" \
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
