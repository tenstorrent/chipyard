#!/usr/bin/env bash
# Run one test ELF through a built VCS debug simv on an LSF compute host, inside
# apptainer. Same container/quota reasoning as build_bsub.sh -- see its header.
#
#   bsub -n 4 -R "span[hosts=1]" -R "rusage[mem=64]" -M 64G -cwd "$PWD" \
#        -o lsf.out -e lsf.err \
#        "VCS_HOME=$VCS_HOME VERDI_HOME=$VERDI_HOME \
#         SNPSLMD_LICENSE_FILE=$SNPSLMD_LICENSE_FILE \
#         $PWD/run_bsub.sh <CONFIG> <ELF> [TAG]"
#
# Cosim rule: ONE cosim test at a time -- concurrent runs collide on the shared
# whisper_connect socket. USE_IMAGE_WHISPER=1 is mandatory in-container.
set -uo pipefail

CONFIG="${1:?usage: run_bsub.sh <CONFIG> <ELF> [TAG]}"
ELF="${2:?}"
TAG="${3:-run}"
XFLAGS="${4:-}"
BASE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG="$BASE/sims/vcs/${TAG}_${CONFIG}.log"

export APPTAINER_CACHEDIR=/localdev/$USER/apptainer-cache
export APPTAINER_TMPDIR=/localdev/$USER/apptainer-tmp
SIF=/localdev/$USER/sif/tt-chipyard-whisper.sif
mkdir -p "$APPTAINER_CACHEDIR" "$APPTAINER_TMPDIR" "$(dirname "$SIF")"

{
  echo "=== host=$(hostname) config=$CONFIG elf=$ELF $(date -Iseconds)"
  if [[ ! -f "$SIF" ]]; then
    echo "=== building SIF (first job on this host)"
    apptainer build "$SIF" docker://ghcr.io/kychentt/tt-chipyard-whisper:latest || exit 1
  fi
  apptainer exec \
    --env VCS_HOME="$VCS_HOME" \
    --env VERDI_HOME="$VERDI_HOME" \
    --env SNPSLMD_LICENSE_FILE="$SNPSLMD_LICENSE_FILE" \
    -B /proj_risc:/proj_risc -B /tools_vendor:/tools_vendor \
    -B "$BASE":/root/my-chipyard \
    "$SIF" bash -lc "set -o pipefail; \
      source /opt/conda/etc/profile.d/conda.sh && \
      source /root/my-chipyard/env.sh && \
      cd /root/my-chipyard/sims/vcs && \
      rm -f whisper_connect && \
      OD=/root/my-chipyard/sims/vcs/output/chipyard.harness.TestHarness.$CONFIG && \
      B=\$(basename $ELF) && B=\${B%.*} && \
      rm -f \$OD/\$B.out \$OD/\$B.log \$OD/\$B.fsdb && \
      EXTRA_SIM_FLAGS='+verbose +vecTrace=1 $XFLAGS' USE_IMAGE_WHISPER=1 make CONFIG=$CONFIG run-binary-debug-hex BINARY=$ELF && \
      { [ -s \$OD/\$B.out ] || { echo 'NO OUTPUT PRODUCED -- aborting'; exit 1; }; } && \
      cp \$OD/\$B.out \$OD/${TAG}_\$B.out"
  rc=$?
  apptainer exec -B /proj_risc:/proj_risc -B "$BASE":/root/my-chipyard "$SIF" bash -lc \
    "OD=/root/my-chipyard/sims/vcs/output/chipyard.harness.TestHarness.$CONFIG; \
     B=\$(basename $ELF); B=\${B%.*}; \
     [ -s \$OD/\$B.out ] && cp -f \$OD/\$B.out \$OD/${TAG}_\$B.out" || true
  echo "=== make exit=$rc $(date -Iseconds)"
} > "$LOG" 2>&1
