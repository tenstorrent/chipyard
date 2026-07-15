# ms12c_vadd_vx.S
#
# Caracal M2 arith cosim: vadd.vx (scalar operand). Exercises the CII SRC_SCALAR
# path (rs1 delivered onto i_if_scalar_opnd) end-to-end through the real host/VPU.
# vd = vs2 + x[rs1]. Validated by Whisper cosim.

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)
    csrs    mstatus, t0

    li      gp, 1
    la      t0, src_a
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v8, (t0)                       # v8 <- a
    li      t2, 100
    vadd.vx v4, v8, t2                     # v4 = a + 100  (scalar rs1 = t2)

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
    .dword 10
    .dword 20
    .dword 30
    .dword 40
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
