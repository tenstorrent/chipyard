#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Make sure we get at least one file name as command line argument
if [ "$#" -lt 1 ]; then
  echo "Usage: run_rvv <elf-file1> <elf-file2> ..."
  exit 1
fi

# Now run the make command for each elf file
for ELF_FILE in "$@"; do
  make -C sims/vcs run-binary-debug-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/"$ELF_FILE" SIM_FLAGS="+cosim"
done

