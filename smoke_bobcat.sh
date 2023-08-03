#!/bin/bash

commands=(
  "make -C sims/vcs clean"

  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBoomConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""

  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-lb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-sb SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uf-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ud-p-ldst SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-add SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64ui-p-addi SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-mul SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64um-p-div SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=$RISCV/riscv64-unknown-elf/share/riscv-tests/isa/rv64uc-p-rvc SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms1_vmv_vi.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms2_vse64.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms2p5_loadblock.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms3_vmv_xf.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms3p5_pureload.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4_vle64.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p5_vle64_2.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p6_vle32_2.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p6_vle32_8.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p7_vlnr_vsnr.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p8_vlm.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms4p9_vl.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms5p1_vse64_m.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms5p2_vle64_m.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms5p3_stride_m.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms5p4_index.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms5p5_index_mask.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_arithmetic_smoke_test.elf SIM_FLAGS=\"+cosim\""
  "make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_ms4_smoke_test.elf SIM_FLAGS=\"+cosim\""
  #"make -C sims/vcs run-binary-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/isg/riscv_vector_ms5_smoke_test.elf SIM_FLAGS=\"+cosim\""

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

