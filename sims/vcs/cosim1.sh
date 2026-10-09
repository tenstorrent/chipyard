#!/usr/bin/env bash
# Run exactly one cosim test cleanly: kill stragglers, run, print verdict.
# Usage: cosim1.sh <ELF> [CONFIG]
set -o pipefail
ELF="$1"; CFG="${2:-MegaBoomV4VectorConfig}"
cd /root/my-chipyard/sims/vcs
pkill -f "simv-chipyard.harness-${CFG}" 2>/dev/null
pkill -f "whisper --tohost" 2>/dev/null
sleep 2
rm -f whisper_connect
source /opt/conda/etc/profile.d/conda.sh
source /root/my-chipyard/env.sh >/dev/null
USE_IMAGE_WHISPER=1 make CONFIG="$CFG" run-binary-debug-hex BINARY="$ELF" >/tmp/cosim1.$$.log 2>&1
NAME=$(basename "${ELF%.elf}")
OD=/root/my-chipyard/sims/vcs/output/chipyard.harness.TestHarness.${CFG}
echo "=== VERDICT $NAME ==="
grep -nE "PASSED|FAILED|Mismatch|has hung|Whisper connect" "$OD/$NAME.log" | tail -5
