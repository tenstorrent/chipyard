#makefile
export CC=/tools_risc/opensrc/riscv-toolchain-06-13-23/llvm/linux/bin
export TESTGEN=/home/jzhang/ws/ws1/testgen/generators/cc/rv_cc/resources
OPTS := -mcmodel=medany -static -std=gnu99 -O3 -fno-builtin-printf -fno-common -nostdlib -nostartfiles
VECTOR_TARGET := bin/vector
SERIAL_TARGET := bin/serial
SIZE := TINY

start:
	mkdir -p bin; \
	rm bin/*.*

vector:
	$(CC)/clang $(OPTS) \
	-march=rv64imafdv -mabi=lp64d \
	-I$(TESTGEN) \
	-I../common/ \
	../common/mem.c $(TESTGEN)/syscalls.c $(TESTGEN)/crt.S src/* \
	-lm -lgcc -T../common/test.ld \
	-D$(SIZE) -DUSE_RISCV_VECTOR \
	-o $(VECTOR_TARGET).exe
	$(CC)/llvm-objdump $(VECTOR_TARGET).exe -D > $(VECTOR_TARGET).dump

clean:
	rm bin/*.dump; \
	rm bin/*.exe;
