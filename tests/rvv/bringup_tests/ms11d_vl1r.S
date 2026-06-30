# ms11d_vl1r.S
#
# Caracal Step 11d: WHOLE-REGISTER load/store (vl1re64 / vs1r).
#
# vl1re64.v loads a whole vector register (VLEN/64 = 4 e64 elements) regardless
# of vl; vs1r.v stores the whole register (VLEN bytes). Routes as a "good stride"
# unit-stride op (is_whole). Load v4 from src, store to dst, scalar self-check.

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
    la      t0, src_data        # base set up EARLY (slack before the vector load)
    # establish a valid vtype (whole-reg ignores vl but keep the unit happy)
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma

    vl1re64.v v4, (t0)          # whole-register load (4 e64)
    la      t1, vec_dst
    vs1r.v  v4, (t1)            # whole-register store (32 bytes)

    fence
    la      t1, vec_dst
    la      t4, src_data
    li      a0, 4
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
src_data:
    .dword 0x1122334455667788
    .dword 0x99aabbccddeeff00
    .dword 0x0102030405060708
    .dword 0xdeadbeefcafef00d
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
