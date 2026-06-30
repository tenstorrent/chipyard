# ms11a3_vse_lmul2.S
#
# Caracal Step 11a (hardening): OoO unit-stride vector STORE with LMUL>1.
#
# vsetvli e64,m2 with AVL=8 -> vl=8 = TWO 256b registers. Load v4 (members v4,v5)
# from .data, then vse64 the whole group to a dst buffer, then fence + scalar
# load-back self-check all 8 dwords. This exercises the multi-MEMBER store path:
# VecDgen must stream member 0 (pvs3_grp(0)) then member 1 (pvs3_grp(1)).

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
    li      a0, 8
    vsetvli a1, a0, e64, m2, ta, ma
    vle64.v v4, (t0)
    vse64.v v4, (t1)

    # Self-check: fence so the vector store drains, then scalar load-back all 8.
    fence
    la      t1, vec_dst
    la      t4, vec_src_data
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
.align 6
vec_dst:
    .dword 0
    .dword 0
    .dword 0
    .dword 0
    .dword 0
    .dword 0
    .dword 0
    .dword 0

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
