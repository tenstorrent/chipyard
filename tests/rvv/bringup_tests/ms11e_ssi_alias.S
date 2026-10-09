# ms11e_ssi_alias.S
#
# Directed SSI store->load disambiguation test (Track A, loadstore.rst mem-order).
# A STRIDED store (vsse64 -> the SSI/Walker path) scatters known data into vec_dst at
# dwords 0,2,4,6 (16-byte stride). A YOUNGER strided load (vlse64) reads the SAME strided
# addresses with NO fence in between, so the speculative SSI load may issue ahead of the
# older SSI store. It MUST observe the store's data: if it reads the pre-store sentinel
# (reordered ahead of the store without disambiguation) the check fails. Passes iff the
# gathered vector equals the stored data -- i.e. A2's full-range order_fail replay (or
# A3's SSI->SSI hold) correctly ordered the pair. gp=1 pass; odd gp fail.

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)   # mstatus.FS + mstatus.VS = Initial/Clean
    csrs    mstatus, t0
    li      gp, 1

    # 1) Pre-fill all 8 dwords of vec_dst with a WRONG sentinel so a stale (reordered)
    #    load is detectable, and make it globally visible before the vector ops.
    la      t1, vec_dst
    li      t2, 0xBAD0BAD0BAD0BAD0
    li      a0, 8
1:
    sd      t2, 0(t1)
    addi    t1, t1, 8
    addi    a0, a0, -1
    bnez    a0, 1b
    fence

    # 2) Load the 4 dwords of data to scatter.
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    la      t0, src_data
    vle64.v v4, (t0)

    # 3) SSI STORE: scatter v4 -> vec_dst, 16B stride (writes dwords 0,2,4,6).
    la      t1, vec_dst
    li      t3, 16
    vsse64.v v4, (t1), t3

    # 4) YOUNGER SSI LOAD, no fence: gather the same strided addresses into v8.
    la      t1, vec_dst
    li      t3, 16
    vlse64.v v8, (t1), t3

    # 5) Write v8 out and scalar-compare against src_data (the values just stored).
    la      t4, result
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vse64.v v8, (t4)
    fence

    la      t1, result
    la      t4, src_data
    li      a0, 4
2:
    ld      t2, 0(t1)
    ld      t3, 0(t4)
    bne     t2, t3, fail
    addi    t1, t1, 8
    addi    t4, t4, 8
    addi    a0, a0, -1
    bnez    a0, 2b
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
    .skip 64
.align 6
result:
    .skip 32

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
