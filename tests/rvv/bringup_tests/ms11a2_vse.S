# ms11a2_vse.S
#
# Caracal Step 11a.2 (store half) end-to-end test: OoO unit-stride vector STORE.
#
# vmv/vector-ALU is dormant, so the source vector is populated with a vle from
# .data, then vse'd to a destination .data buffer. The Whisper cosim validates
# the store's memory writes (and the v3 load). M1 store = execute-time drain
# (single-hart, non-speculative); full commit-gated RVWMO is a later refinement.

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
    # e64 m1, vl=4 (one full 256b register).
    #   v3 <- vec_src_data ; then vec_dst <- v3
    #============================================================
    li      gp, 1
    la      t0, vec_src_data
    la      t1, vec_dst
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v3, (t0)
    vse64.v v3, (t1)

    # Self-check: fence so the vector store drains (its address is not LCAM-
    # registered for store->load forwarding in M1), then scalar-load it back.
    fence
    ld      t2, 0(t1)
    li      t3, 0x1122334455667788
    bne     t2, t3, fail
    ld      t2, 8(t1)
    li      t3, 0x99aabbccddeeff00
    bne     t2, t3, fail
    ld      t2, 16(t1)
    li      t3, 0x0102030405060708
    bne     t2, t3, fail
    ld      t2, 24(t1)
    li      t3, 0xdeadbeefcafef00d
    bne     t2, t3, fail

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
.align 6
vec_dst:
    .dword 0
    .dword 0
    .dword 0
    .dword 0

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
