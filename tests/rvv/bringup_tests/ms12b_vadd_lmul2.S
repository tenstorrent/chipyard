# ms12b_vadd_lmul2.S
#
# Caracal M2 arith cosim: vadd.vv at LMUL=2, SEW=32 (16 elements, 2 members).
# Exercises the CII member walk (2 dest members) through the real host<->VPU path.
# Validated by Whisper cosim (register writes checked lock-step); reaching `pass`
# requires the vadd group to complete.

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)     # mstatus.VS=11, FS=11
    csrs    mstatus, t0

    li      gp, 1
    la      t0, src_a
    la      t1, src_b
    li      a0, 16
    vsetvli a1, a0, e32, m2, ta, ma       # LMUL=2 -> v8,v9 / v12,v13 groups
    vle32.v v8,  (t0)                      # v8 group <- a
    vle32.v v12, (t1)                      # v12 group <- b
    vadd.vv v4, v12, v8                    # v4 group = a + b

    j       pass

pass:
    li      gp, 1
    j       write_tohost
fail:
    slli    gp, gp, 1
    ori     gp, gp, 1
    j       write_tohost
write_tohost:
    la      t5, tohost
    sd      gp, 0(t5)
1:  j       1b

.align 2
trap_vector:
    li      gp, 0x1F
    j       fail

.section .data
.align 6
.global tohost
tohost:   .dword 0
.align 6
.global fromhost
fromhost: .dword 0
.align 6
src_a:
    .word 1, 2, 3, 4, 5, 6, 7, 8
    .word 9, 10, 11, 12, 13, 14, 15, 16
.align 6
src_b:
    .word 100, 200, 300, 400, 500, 600, 700, 800
    .word 900, 1000, 1100, 1200, 1300, 1400, 1500, 1600
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
