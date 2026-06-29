# ms11a2_pure_vle.S
#
# Caracal Step 11a.2 (sub-step B) end-to-end test: OoO unit-stride vector LOAD.
#
# PURE load: the source vector lives in .data (loaded identically by the RTL sim
# and the Whisper cosim reference), so there is NO scalar-store -> vector-load
# ordering dependency to disambiguate (the M1 vle holds an LDQ entry but does not
# register its address in the LCAM yet -- that is a post-M1 refinement).
#
# It does NOT use any vector store (vse) or vector->scalar move (vmv.x.s): those
# paths are still dormant (IQ_V_STORE / IQ_V_ALU never grant), so issuing one
# would never complete. Validation is therefore by the Whisper cosim, which
# compares the v3/v4 register writes against the reference; and simply REACHING
# `pass` requires each vle to commit (exercising the ld_done + vec_clr_bsy
# completion path).
#
# Build (inside the container, after `source env.sh`):
#   riscv64-unknown-elf-gcc -march=rv64gcv -mabi=lp64d -mcmodel=medany \
#       -nostdlib -nostartfiles -static -T bobcat_linker.ld \
#       ms11a2_pure_vle.S -o ms11a2_pure_vle.elf

.section .text
.globl _start
.option norvc

_start:
    # --- stack ---
    la      sp, stack_top

    # --- trap vector: any unexpected trap is a hard failure ---
    la      t0, trap_vector
    csrw    mtvec, t0

    # --- enable the vector unit: mstatus.VS = 11, mstatus.FS = 11 ---
    li      t0, (3 << 9) | (3 << 13)     # VS[10:9], FS[14:13]
    csrs    mstatus, t0

    #============================================================
    # vle64.v: e64, m1, AVL=4 -> vl=4 (VLEN=256 => one full 256b
    # register, 4 lanes, fully lane-aligned: the M1 fast path).
    #============================================================
    li      gp, 1
    la      t0, vec_src_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v3, (t0)

    #============================================================
    # vle32.v: e32, m1, AVL=8 -> vl=8 (8 * 32b = 256b). Exercises
    # sub-64b EEW lane placement (2 elements per 64b beat/lane).
    #============================================================
    li      gp, 2
    li      a0, 8
    vsetvli a1, a0, e32, m1, ta, ma
    vle32.v v4, (t0)

    # done -- cosim has validated v3/v4 and both vle's committed.
    j       pass

#----------------------------------------------------------------
# Exit paths (HTIF tohost)
#----------------------------------------------------------------
pass:
    li      gp, 1                        # (0<<1)|1  -> exit code 0
    j       write_tohost

fail:
    slli    gp, gp, 1
    ori     gp, gp, 1                    # (testnum<<1)|1
    j       write_tohost

write_tohost:
    la      t5, tohost
    sd      gp, 0(t5)
1:  j       1b                           # spin until fesvr tears down the sim

#----------------------------------------------------------------
# Trap handler: any unexpected trap is a hard failure.
#----------------------------------------------------------------
.align 2
trap_vector:
    li      gp, 0x1F
    j       fail

#----------------------------------------------------------------
# Data / HTIF symbols (fesvr locates these by name in the symbol table)
#----------------------------------------------------------------
.section .data
.align 6
.global tohost
tohost:   .dword 0
.align 6
.global fromhost
fromhost: .dword 0

# Pre-initialized vle source (64-byte aligned). 4 dwords = one 256b e64/m1 group.
.align 6
vec_src_data:
    .dword 0x1122334455667788
    .dword 0x99aabbccddeeff00
    .dword 0x0102030405060708
    .dword 0xdeadbeefcafef00d

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
