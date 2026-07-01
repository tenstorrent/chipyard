# ms14_vls_e8_m2.S  (Step-14 matrix: unit-stride vle8/vse8 LMUL=2, AVL=vlmax=64)
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
    li      a0, 64
    vsetvli a1, a0, e8, m2, ta, ma
    vle8.v v8, (t0)
    vse8.v v8, (t1)
    fence
    la      t1, dst
    la      t4, src
    li      a0, 8
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
    .byte 0
    .byte 1
    .byte 2
    .byte 3
    .byte 4
    .byte 5
    .byte 6
    .byte 7
    .byte 8
    .byte 9
    .byte 10
    .byte 11
    .byte 12
    .byte 13
    .byte 14
    .byte 15
    .byte 16
    .byte 17
    .byte 18
    .byte 19
    .byte 20
    .byte 21
    .byte 22
    .byte 23
    .byte 24
    .byte 25
    .byte 26
    .byte 27
    .byte 28
    .byte 29
    .byte 30
    .byte 31
    .byte 32
    .byte 33
    .byte 34
    .byte 35
    .byte 36
    .byte 37
    .byte 38
    .byte 39
    .byte 40
    .byte 41
    .byte 42
    .byte 43
    .byte 44
    .byte 45
    .byte 46
    .byte 47
    .byte 48
    .byte 49
    .byte 50
    .byte 51
    .byte 52
    .byte 53
    .byte 54
    .byte 55
    .byte 56
    .byte 57
    .byte 58
    .byte 59
    .byte 60
    .byte 61
    .byte 62
    .byte 63
.align 6
dst:
    .skip 64
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
