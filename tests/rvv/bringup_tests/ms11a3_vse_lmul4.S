# ms11a3_vse_lmul4.S
#
# Caracal Step 11a (hardening): OoO unit-stride vector LOAD+STORE with LMUL=4.
#
# vsetvli e64,m4 with AVL=16 -> vl=16 = FOUR 256b registers (v8..v11). Load the
# whole group from .data, vse64 it to a dst, then fence + scalar load-back check
# all 16 dwords. Confirms the multi-MEMBER path scales past 2 (member_cur 0..3,
# 16 store beats, pdst remap across 4 group members).

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
    la      t0, vec_src_data
    la      t1, vec_dst
    li      a0, 16
    vsetvli a1, a0, e64, m4, ta, ma
    vle64.v v8, (t0)
    vse64.v v8, (t1)

    fence
    la      t1, vec_dst
    la      t4, vec_src_data
    li      a0, 16
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
vec_src_data:
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
    .dword 0x3333333333333333
    .dword 0x4444444444444444
    .dword 0x5555555555555555
    .dword 0x6666666666666666
    .dword 0x7777777777777777
    .dword 0x8888888888888888
.align 6
vec_dst:
    .skip 128
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
