# ms11a3_vle_lmul2.S
#
# Caracal Step 11a (hardening): OoO unit-stride vector LOAD with LMUL>1.
#
# vsetvli e64,m2 with AVL=8 -> vl=8 = TWO 256b registers (v4 holds elements 0-3,
# v5 holds elements 4-7). This exercises the multi-MEMBER load path: the AGEN
# must advance v_reg across the group and remap each beat's pdst to pvdest_grp(0)
# then pvdest_grp(1). Pure load (source in .data); the Whisper cosim validates
# v4 AND v5 against the reference.

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)     # mstatus.VS=11, FS=11
    csrs    mstatus, t0

    #============================================================
    # e64, m2, AVL=8 -> vl=8 (two 256b members: v4, v5).
    #============================================================
    li      gp, 1
    la      t0, vec_src_data
    li      a0, 8
    vsetvli a1, a0, e64, m2, ta, ma
    vle64.v v4, (t0)

    j       pass

pass:
    li      gp, 1                        # (0<<1)|1 -> exit 0
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
# 8 dwords = two 256b e64/m2 group members.
vec_src_data:
    .dword 0x1122334455667788
    .dword 0x99aabbccddeeff00
    .dword 0x0102030405060708
    .dword 0xdeadbeefcafef00d
    .dword 0xa5a5a5a5a5a5a5a5
    .dword 0x5a5a5a5a5a5a5a5a
    .dword 0x0f0f0f0f0f0f0f0f
    .dword 0xf0f0f0f0f0f0f0f0

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
