#!/usr/bin/env bash
# Wrapper around the real whisper binary that injects extra command-line args
# without modifying the cosim submodule (sims/cosim/bridge/bridge.cc).
#
# The cosim bridge builds the whisper invocation as:
#   <whisper_path> <testfile.elf> <bootcode> --harts N --raw --configfile ... \
#                  --logfile ... --traceload --commandlog ... --server ... &
# Because of --raw, whisper won't parse the ELF symbol table, so it can't
# auto-locate tohost/fromhost. This wrapper:
#   1. Prepends static extras (default: --isa imcadf to override misa.F gating)
#   2. Extracts tohost/fromhost addresses from the testfile ELF and passes them
#      as --tohost / --fromhost so HTIF stores match BOOM's HTIF interceptor.
#
# Override behavior via env vars (no code change):
#   WHISPER_REAL        = path to the actual whisper executable
#   WHISPER_EXTRA_ARGS  = always-prepended static args  (default: --isa imcadf)
#   WHISPER_NM          = riscv-elf nm binary used to read symbols
#   WHISPER_NO_HTIF=1   = skip the auto-tohost/fromhost injection

WHISPER_REAL="${WHISPER_REAL:-/chipyard/sims/whisper/build-Linux/whisper}"
WHISPER_EXTRA_ARGS="${WHISPER_EXTRA_ARGS:---isa imcadf}"
WHISPER_NM="${WHISPER_NM:-riscv64-unknown-elf-nm}"

HTIF_ARGS=""
if [ -z "$WHISPER_NO_HTIF" ] && [ -n "$1" ] && [ -f "$1" ] && command -v "$WHISPER_NM" >/dev/null 2>&1; then
  TESTFILE="$1"
  TOHOST=$("$WHISPER_NM"  "$TESTFILE" 2>/dev/null | awk '$3=="tohost"   {print "0x"$1; exit}')
  FROMHOST=$("$WHISPER_NM" "$TESTFILE" 2>/dev/null | awk '$3=="fromhost" {print "0x"$1; exit}')
  [ -n "$TOHOST" ]   && HTIF_ARGS="$HTIF_ARGS --tohost $TOHOST"
  [ -n "$FROMHOST" ] && HTIF_ARGS="$HTIF_ARGS --fromhost $FROMHOST"
fi

exec "$WHISPER_REAL" $WHISPER_EXTRA_ARGS $HTIF_ARGS "$@"
