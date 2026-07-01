# ms14_stripmine.S
#
# Caracal Step 14: canonical strip-mined vector memcpy (the realistic AVL>VLMAX
# pattern). Copies N=10 e64 elements (VLMAX=4) via vle64/vse64 in a loop where
# vsetvli's AVL is the remaining element count (10 -> vl=4, 6 -> vl=4, 2 -> vl=2).
#
# Exercises TWO bugs the Step-14 matrix uncovered:
#   1. vsetvli AVL>VLMAX must saturate vl to VLMAX (was truncating AVL -> vl=0).
#   2. back-to-back vle+vse must not drop the store's issue grant (load+store
#      granting the same cycle silently lost the store -> hang).
# Self-checks dst == src over all 10 dwords.

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
    la      t0, src
    la      t1, dst
    li      a0, 10                        # total elements (> vlmax=4)
loop:
    vsetvli t2, a0, e64, m1, ta, ma        # t2 = vl = min(a0, 4)
    vle64.v v8, (t0)
    vse64.v v8, (t1)
    sub     a0, a0, t2                     # remaining -= vl
    slli    t3, t2, 3                      # byte stride = vl * 8
    add     t0, t0, t3
    add     t1, t1, t3
    bnez    a0, loop

    fence
    la      t1, dst
    la      t4, src
    li      a0, 10
1:
    ld      t2, 0(t1)
    ld      t3, 0(t4)
    bne     t2, t3, fail
    addi    t1, t1, 8
    addi    t4, t4, 8
    addi    a0, a0, -1
    bnez    a0, 1b
    j       pass

pass:
    li      gp, 1
    j       wt
fail:
    slli    gp, gp, 1
    ori     gp, gp, 1
    j       wt
wt:
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
src:
    .dword 0x1122334455667788
    .dword 0x99aabbccddeeff00
    .dword 0x0102030405060708
    .dword 0xdeadbeefcafef00d
    .dword 0xa5a5a5a5a5a5a5a5
    .dword 0x5a5a5a5a5a5a5a5a
    .dword 0x0f0f0f0f0f0f0f0f
    .dword 0xf0f0f0f0f0f0f0f0
    .dword 0x1111111111111111
    .dword 0x2222222222222222
.align 6
dst:
    .skip 80
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
