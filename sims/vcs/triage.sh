#!/usr/bin/env bash
# Classify the per-test artifacts a run_regr.sh regression leaves under
# <regr-dir>/<group>/<test>/.  run_regr.sh keys on "*** PASSED ***", which the
# bare bring-up tests never print, so it reports PASS and HANG alike as UNKNOWN.
#
# Usage: ./triage.sh <regr-dir>
#
# Verdict, in precedence order:
#   ASSERT   an "Assertion failed" / "Error:" line from the DUT
#   MISMATCH cosim divergence -- ONLY "Register Mismatch" / "Checker Mismatch".
#            "ChangeCount Mismatch" fires on every vector op incl. passing ones.
#   HANG     "Pipeline has hung" or a HANGPROBE line
#   TIMEOUT  "*** FAILED *** (timeout)" with no other signature
#   FAIL     tohost got an odd non-1 code, or an explicit *** FAILED ***
#   PASS     tohost got gp=1, or "*** PASSED ***"
#   NOSTART  the cosim bridge never got going -- iss_cosim.log is tiny/absent.
#            This is a HARNESS failure (whisper socket collision), not a design
#            failure, and must not be counted as one.
#   UNKNOWN  none of the above matched; read it by hand.

set -uo pipefail

REGR="${1:?usage: triage.sh <regr-dir>}"
[[ -d "$REGR" ]] || { echo "no such dir: $REGR" >&2; exit 1; }

printf '%-24s  %-8s  %-9s  %s\n' TEST VERDICT COSIM DETAIL
printf '%-24s  %-8s  %-9s  %s\n' ---- ------- ----- ------

for d in "$REGR"/*/*/; do
    t="$(basename "$d")"
    out="$d/$t.out"; log="$d/$t.log"; iss="$d/iss_cosim.log"
    # Search BOTH files, never just one.  They are not redundant: .log is raw
    # stdout and holds the assertion/$finish text, while .out is the
    # spike-dasm-decoded pipe and is where TestDriver's "*** PASSED ***" marker
    # lands.  On a fatal assertion the decoder is torn down early so .out
    # truncates at the DRAMSim banner; on a clean pass .log lacks the marker.
    # Reading either one alone misclassifies the other's cases.
    src=""
    for f in "$log" "$out"; do [[ -s "$f" ]] && src+="$f "; done

    isssz=0
    [[ -f "$iss" ]] && isssz=$(stat -c%s "$iss")

    if [[ -z "$src" ]]; then
        printf '%-24s  %-8s  %-9s  %s\n' "$t" NOSTART "$isssz" "no .out/.log produced"
        continue
    fi

    verdict=UNKNOWN detail=""
    # A PASSED marker is checked FIRST: a run that reached tohost cleanly is a
    # pass even if a benign "Error"-shaped line appears earlier in the log.
    if     grep -qh '\*\*\* PASSED \*\*\*' $src; then
        verdict=PASS
    # "Assertion failed" only -- NOT a bare /^Error:/.  The cosim checker reports
    # divergence as "Error: Core Arch Checker Mismatch", so matching ^Error: here
    # steals every mismatch into the ASSERT bucket and loses its line count.  A
    # real DUT assertion always prints "Assertion failed", including the TL
    # monitor ones whose VCS banner line happens to start with Error:.
    elif   grep -qhE 'Assertion failed|^Fatal:' $src; then
        verdict=ASSERT
        # Name the source line the assertion came from -- that is the thing that
        # groups tests into defect classes.  Prefer the Chisel/SV path in the
        # assertion text over the generated-collateral path in the VCS banner.
        detail="$(grep -hoE '\(connected at [^)]+\)|[A-Za-z0-9_./-]+\.scala:[0-9]+' $src \
                  | grep -v gen-collateral | head -1)"
        detail="${detail:-$(grep -m1 -hE 'Assertion failed' $src | cut -c1-90)}"
    elif   grep -qhE 'Register Mismatch|Checker Mismatch' $src; then
        verdict=MISMATCH
        detail="$(grep -chE 'Register Mismatch|Checker Mismatch' $src | paste -sd+ | bc) mismatch line(s)"
    elif   grep -qhE 'Pipeline has hung|HANGPROBE' $src; then
        verdict=HANG
        detail="$(grep -m1 -hoE 'HANGPROBE.*' $src | cut -c1-80)"
    elif   grep -qh 'timeout' $src && grep -qh '\*\*\* FAILED \*\*\*' $src; then
        verdict=TIMEOUT
    elif   grep -qh '\*\*\* FAILED \*\*\*' $src; then
        verdict=FAIL
        detail="$(grep -m1 -hoE '\*\*\* FAILED \*\*\*.*' $src | cut -c1-80)"
    elif   (( isssz < 2048 )); then
        verdict=NOSTART; detail="iss_cosim.log ${isssz}B -- bridge never ran"
    else
        verdict=UNKNOWN; detail="no marker, cosim ran ${isssz}B"
    fi
    printf '%-24s  %-8s  %-9s  %s\n' "$t" "$verdict" "$isssz" "$detail"
done
