#!/bin/bash

commands=(
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/sgemm/sgemm64.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/axpy/axpy-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/arith_mean/arith-mean-unroll-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/conv1d/conv1d-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/conv2d/conv2d-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/inner_product/inner-prod-unroll-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/relu/relu-unroll-vector.elf SIM_FLAGS=+cosim"
  "make -C sims/vcs run-binary-debug-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/kernels/transpose/transpose-unroll-vector.elf SIM_FLAGS=+cosim"

)

for cmd in "${commands[@]}"
do
  echo "Executing: $cmd"
  output=$(eval $cmd 2>&1)

  # Extract the last lines of the output using `tail`
  last_lines=$(echo "$output" | tail -10)

  if [[ $last_lines != *"TestDriver.v"* ]]; then
    echo "$output"
    echo "*******************FAILED*******************"
    echo "Expected '$finish' at the end of the printout, but it was not found."
    echo "$cmd"
    exit 1
  fi
done

echo "PASSED"

