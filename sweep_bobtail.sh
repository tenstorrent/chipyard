#!/usr/bin/env bash
# Serial bobtail sweep -- ONE cosim run at a time (shared whisper_connect socket).
# $1 = tag prefix, $2 = extra sim flags (e.g. +vec_strict_pnr=1)
set -uo pipefail
BASE="/proj_risc/user_dev/ading/chipyard_current/chipyard_try"
PREFIX="${1:-sw}"
XFLAGS="${2:-}"
CONFIG=MegaBoomV4VectorWideConfig
SUM="$BASE/sims/vcs/${PREFIX}_summary.txt"
: > "$SUM"
for elf in "$BASE"/tests/riscv-vectorized-benchmark-suite/bobtail/*.elf; do
  b=$(basename "$elf" .elf)
  "$BASE/run_vtx_bsub.sh" "$CONFIG" "$elf" "${PREFIX}_$b" "$XFLAGS"
  out="$BASE/sims/vcs/output/chipyard.harness.TestHarness.$CONFIG/${PREFIX}_${b}_$b.out"
  log="$BASE/sims/vcs/${PREFIX}_${b}_$CONFIG.log"
  res="UNKNOWN"; cyc=""
  if grep -aq "PASSED" "$out" 2>/dev/null; then res=PASS
  elif grep -aq "Pipeline has hung" "$log" 2>/dev/null; then res=HANG
  elif grep -aq "Mismatch" "$log" 2>/dev/null; then res=MISMATCH
  elif grep -aq "Assertion failed" "$log" 2>/dev/null; then res=ASSERT
  elif grep -aq "FAILED" "$out" 2>/dev/null; then res=FAILED
  fi
  cyc=$(grep -a "Completed after" "$out" 2>/dev/null | tail -1 | grep -oE "[0-9]+" | tail -1)
  steps=$(grep -ac "^Step: " "$out" 2>/dev/null)
  echo "$b $res cycles=${cyc:-NA} steps=${steps:-NA}" >> "$SUM"
  echo "=== $b $res cycles=${cyc:-NA} steps=${steps:-NA}"
done
