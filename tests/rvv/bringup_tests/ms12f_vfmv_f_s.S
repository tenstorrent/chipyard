# ms12f_vfmv_f_s.S
#
# Caracal M2 B3b-FP: vfmv.f.s (FP scalar-DESTINATION). Extracts element 0 of a
# vector register into an FP register. Exercises the CII FP scalar-dest writeback
# path: a vector-issued uop (IQ_V_ALU -> CII -> VPU) whose dest is renamed through
# the FP rename (dst_rtype=RT_FLT), completing via the dedicated FP ll_wport
# (IEEE->RecFN recode + NaN-box + FP wakeup + rob clear).
#
# Self-checking: moves the FP element back to a GPR (fmv.x.d / fmv.x.w) and
# branches to fail on mismatch, so the recode round-trip is validated by the
# pass/fail code (not only cosim).
#   e64: src {1.0,2.0,3.0,4.0}; vfmv.f.s f1,v8 -> f1=1.0 -> fmv.x.d = 0x3FF0000000000000
#   e32: src {1.5,...};         vfmv.f.s f2,v8 -> f2=1.5 -> fmv.x.w = 0x3FC00000

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)      # mstatus.VS + FS = Dirty
    csrs    mstatus, t0

    li      gp, 1

    # ---- e64 (double) ----
    la      t0, src_d
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v8, (t0)                       # v8 <- {1.0,2.0,3.0,4.0}
    vfmv.f.s f1, v8                        # f1 = v8[0] = 1.0
    fmv.x.d x7, f1                         # x7 = raw bits of 1.0
    li      t2, 0x3FF0000000000000
    bne     x7, t2, fail

    # ---- e32 (single) ----
    # vl=8 (e32,m1) fills the whole 256b register -> no tail, so the cosim tail
    # policy doesn't flag the load (this test targets vfmv.f.s, not tail handling).
    la      t0, src_s
    li      a0, 8
    vsetvli a1, a0, e32, m1, ta, ma
    vle32.v v9, (t0)                       # v9 <- {1.5,...} (single, 8 elems)
    vfmv.f.s f2, v9                        # f2 = v9[0] = 1.5 (NaN-boxed)
    fmv.x.w x8, f2                         # x8 = raw single bits (sign-extended)
    li      t3, 0x3FC00000
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
src_d:
    .dword 0x3FF0000000000000              # 1.0
    .dword 0x4000000000000000              # 2.0
    .dword 0x4008000000000000              # 3.0
    .dword 0x4010000000000000              # 4.0
.align 6
src_s:
    .word 0x3FC00000                       # 1.5
    .word 0x40000000                       # 2.0
    .word 0x40400000                       # 3.0
    .word 0x40800000                       # 4.0
    .word 0x40A00000                       # 5.0
    .word 0x40C00000                       # 6.0
    .word 0x40E00000                       # 7.0
    .word 0x41000000                       # 8.0
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
