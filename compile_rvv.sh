#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Make sure we get at least one file name as command line argument
if [ "$#" -lt 1 ]; then
  echo "Usage: compile_riscv <source-file1> <source-file2> ..."
  exit 1
fi

# Now run the gcc command for each source file
for SRCFILE in "$@"; do
  # Derive output file name by replacing .S with .elf
  OUTFILE="${SRCFILE%.*}.elf"
  riscv64-unknown-elf-gcc -march=rv64imafdcv -mabi=lp64d -Wl,--no-relax -nostdlib -T tests/rvv/bringup_tests/bobcat_linker.ld "$SRCFILE" -o "$OUTFILE" -static
done

