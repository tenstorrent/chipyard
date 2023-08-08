#!/bin/bash

commands=(
  "make -C sims/vcs clean"

  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_arithmetic_smoke_test.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_ms5_smoke_test.elf SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_arithmetic_smoke_test.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=MegaBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_ms5_smoke_test.elf SIM_FLAGS=\"+cosim\""

)

for cmd in "${commands[@]}"
do
  echo "Executing: $cmd"
  output=$(eval $cmd 2>&1)
  if [[ $output == *"Assertion failed"* ]] || [[ $output == *"Core Arch Checker Mismatch"* ]] || [[ $output == *"Register Mismatch"* ]]; then
    echo "$output"
    echo "*******************FAILED*******************"
    echo "$cmd"
    exit 1
  fi
done

echo "PASSED"

