#!/bin/bash

FORCE_REBUILD=0

print_usage() {
  echo "Usage: $0 [options] <elf-file1> <elf-file2> ..."
  echo "Options:"
  echo "  -s    Search for the ELF file(s) in tests/ directory (single match)"
  echo "  -f    Search for the ELF file(s) and use first match"
  echo "  -b    Build the ELF file(s)"
  echo "  -n    Skip the ELF file(s) that are not found"
  echo "  -h    Show this help message"
}

# Parse command line options (default: all flags off)
HELP=0            # will print help message
MODE_SEARCH=0     # will search for file (single match)
MODE_FIND_FIRST=0 # will find first match and exit
MODE_BUILD=0      # will build the file
SKIP_NOT_FOUND=0  # will skip if file not found

# Search return codes
FILE_VALID=0
FILE_SEARCHED=1
FILE_FIRST_FOUND=2
FILE_MULTIPLE=3
FILE_BUILT=4
FILE_BUILD_ERR=5
FILE_NOT_FOUND=6

check_file() {
  local filename="$1"
  local matches=()
  local test_path=""
  local elf_path="/root/my-chipyard/$filename"
  local linker_path="tests/rvv/bringup_tests/bobcat_linker.ld"

  # Check if file exists directly
  if [ -f "$elf_path" ]; then
    echo "$elf_path"
    return $FILE_VALID
  fi

  # Search mode: find all matches
  if [ "$MODE_SEARCH" -eq 1 ] || [ "$MODE_FIND_FIRST" -eq 1 ]; then
    mapfile -t matches < <(find /root/my-chipyard/tests/ -type f -name "$filename")
    if [ "${#matches[@]}" -gt 1 ]; then
      if [ "$MODE_FIND_FIRST" -eq 1 ]; then
        echo "${matches[0]}"
        return $FILE_FIRST_FOUND
      else
        return $FILE_MULTIPLE
      fi
    elif [ "${#matches[@]}" -eq 1 ]; then
      echo "${matches[0]}"
      return $FILE_SEARCHED
    fi
  fi

  # Build mode: try to build if not found
  if [ "$MODE_BUILD" -eq 1 ]; then
    # Try to find the .S file
    test_path=$(find /root/my-chipyard/tests/ -type f -name "${filename%.*}.S" | head -n 1)
    if [ -n "$test_path" ]; then
      elf_out="${test_path%.*}.elf"
      build_output=$(riscv64-unknown-elf-gcc -march=rv64imafdcv -mabi=lp64d -Wl,--no-relax -nostdlib -T "$linker_path" "$test_path" -o "$elf_out" -static 2>&1 | tee /dev/tty)
      if [ $? -eq 0 ] && [ -f "$elf_out" ] && ! echo "$build_output" | grep -q "Error"; then
        echo "$elf_out"
        return $FILE_BUILT
      else
        return $FILE_BUILD_ERR
      fi
    fi
  fi

  # Not found
  return $FILE_NOT_FOUND
}

while getopts ":sfbnh" opt; do
  case $opt in
    h)  HELP=1 ;
        print_usage;
        exit 0 ;;
    s)  MODE_SEARCH=1 ;;
    f)  MODE_FIND_FIRST=1 ;;
    b)  MODE_BUILD=1 ;;
    n)  SKIP_NOT_FOUND=1 ;;
    \?) echo "Invalid option: -$OPTARG" >&2; 
        print_usage;
        exit 1;;
  esac
done

shift $((OPTIND - 1))

# Make sure we get at least one file name as command line argument
if [ "$#" -lt 1 ]; then
  print_usage
  exit 1
fi

# parse through the files and see if present. (if not, find in tests/)
ELF_FILES=()

# Loop through all provided arguments
for ARG in "$@"; do
  # Check if the file exists and is valid
  ELF_PATH="$(check_file "$ARG")"
  FILE_STATUS="$?"

  case "$FILE_STATUS" in
    $FILE_VALID)
      echo "INFO: Running given file: $ELF_PATH"
      ELF_FILES+=("$ELF_PATH")
      ;;
    $FILE_SEARCHED)
      echo "INFO: Running searched file: $ELF_PATH"
      ELF_FILES+=("$ELF_PATH")
      ;;
    $FILE_FIRST_FOUND)
      echo "INFO: Running first found file: $ELF_PATH"
      ELF_FILES+=("$ELF_PATH")
      ;;
    $FILE_MULTIPLE)
      echo "ERROR: Multiple files found for $ARG"
      exit 1
      ;;
    $FILE_BUILT)
      echo "SUCCESS: Built file: $ELF_PATH"
      ELF_FILES+=("$ELF_PATH")
      ;;
    $FILE_BUILD_ERR)
      echo "ERROR: Failed to build file: $ARG"
      exit 1
      ;;
    $FILE_NOT_FOUND)
      if [ "$SKIP_NOT_FOUND" -eq 0 ]; then
        echo "ERROR: File not found: $ARG"
        exit 1
      else
        echo "WARNING: Skipping missing file: $ARG"
      fi
      ;;
    *)
      echo "ERROR: Unknown status for file: $ARG"
      exit 1
      ;;
  esac
done


# Exit immediately if a command exits with a non-zero status
set -e

# I am doing this to change the timestamp and trigger
# a rebuild (Makefile doesnt seem to recognize changes in sv files)
if [ "$FORCE_REBUILD" -eq 1 ]; then
  echo "INFO: Forcing rebuild by touching rob.scala"
  touch /root/my-chipyard/generators/boom/src/main/scala/exu/rob.scala
fi

# Now run the make command for each elf file
for ELF_FILE in "${ELF_FILES[@]}"; do
  # Print the ELF file being processed
  echo "=================================================="
  echo "      Running simulation for: $ELF_FILE           "
  echo "=================================================="
  # Run the simulation with the specified ELF file
  make -C sims/vcs run-binary-debug-hex CONFIG=SmallBobcatConfig BINARY="$ELF_FILE" SIM_FLAGS="+cosim+vcs+loopreport"
done 2>&1 | tee report.log

exit 0
# ===================================================
# to make your own test (update variables and copy paste):
TEST_NAME=o3_vload_test.S; \
TEST_PATH="$(find /root/my-chipyard/tests/ -type f -name "$TEST_NAME" | head -n 1 | sed 's/\.[^.]*$//')"; \
riscv64-unknown-elf-gcc -march=rv64imafdcv -mabi=lp64d -Wl,--no-relax -nostdlib -T tests/rvv/bringup_tests/bobcat_linker.ld ${TEST_PATH}.S -o ${TEST_PATH}.elf -static
