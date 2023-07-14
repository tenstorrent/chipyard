#make -C sims/vcs run-binary-debug-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms2_vse64.elf SIM_FLAGS="+cosim" 
#make -C sims/vcs run-binary-debug-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms2p5_loadblock.elf SIM_FLAGS="+cosim" 
make -C sims/vcs run-binary-debug-hex CONFIG=SmallBobcatConfig BINARY=/root/my-chipyard/tests/rvv/bringup_tests/ms3p5_pureload.elf SIM_FLAGS="+cosim" 
