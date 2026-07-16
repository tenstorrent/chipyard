# ms12e_vmv_x_s.S
#
# Caracal M2 B3b: vmv.x.s (scalar-DESTINATION). Extracts element 0 of a vector
# register into an integer GPR. Exercises the CII scalar-dest writeback path
# end-to-end: a vector-issued uop (IQ_V_ALU -> CII -> VPU) whose dest is renamed
# through the INTEGER rename (dst_rtype=RT_FIX), completing via the dedicated INT
# writeback trio (iregfile write + int wakeup + rob clear).
#
# Self-checking: reads element 0 back into a GPR and branches to fail on mismatch,
# so the scalar path is validated by the pass/fail code itself (not only cosim).
#   src_a = {10,20,30,40}; vle64 v8; vmv.x.s x7,v8 -> x7 must be 10.
#   vmv.v.i v2,-5; vmv.x.s x8,v2 -> x8 must be -5 (sign-extended).

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)      # mstatus.VS + FS = Initial/Dirty
    csrs    mstatus, t0

    li      gp, 1
    la      t0, src_a
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v8, (t0)                       # v8 <- {10,20,30,40}

    vmv.x.s x7, v8                         # x7 = v8[0] = 10
    li      t2, 10
    bne     x7, t2, fail

    vmv.v.i v2, -5                         # v2 = splat(-5)
    vmv.x.s x8, v2                         # x8 = v2[0] = -5 (sign-extended)
    li      t3, -5
    bne     x8, t3, fail

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
