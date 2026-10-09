# ms11b_vsse.S
#
# Caracal Step 11b: STRIDED vector STORE (vsse64).
#
# Load v4 = [a,b,c,d] (unit). Pre-fill dst (8 dwords) with background. Strided
# store stride=16 -> dst[0]=a, dst[2]=b, dst[4]=c, dst[6]=d; dst[1,3,5,7] keep
# background. Scalar self-check.

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
    # v4 <- src (unit)
    la      t0, src_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v4, (t0)

    # pre-fill dst with background (8 dwords)
    la      t1, vec_dst
    la      t4, bg_data
    li      a0, 8
1:
    ld      t2, 0(t4)
    sd      t2, 0(t1)
    addi    t1, t1, 8
    addi    t4, t4, 8
    addi    a0, a0, -1
    bnez    a0, 1b
    fence

    # strided store, stride=16
    la      t1, vec_dst
    li      t6, 16
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vsse64.v v4, (t1), t6

    fence
    la      t1, vec_dst
    la      t4, expected
    li      a0, 8
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
    .dword 0xaaaaaaaaaaaaaaaa
    .dword 0xbbbbbbbbbbbbbbbb
    .dword 0xcccccccccccccccc
    .dword 0xdddddddddddddddd
.align 6
bg_data:
    .dword 0xe0e0e0e0e0e0e0e0
    .dword 0xe1e1e1e1e1e1e1e1
    .dword 0xe2e2e2e2e2e2e2e2
    .dword 0xe3e3e3e3e3e3e3e3
    .dword 0xe4e4e4e4e4e4e4e4
    .dword 0xe5e5e5e5e5e5e5e5
    .dword 0xe6e6e6e6e6e6e6e6
    .dword 0xe7e7e7e7e7e7e7e7
.align 6
expected:
    .dword 0xaaaaaaaaaaaaaaaa   # [0] <- a
    .dword 0xe1e1e1e1e1e1e1e1   # [1] bg
    .dword 0xbbbbbbbbbbbbbbbb   # [2] <- b
    .dword 0xe3e3e3e3e3e3e3e3   # [3] bg
    .dword 0xcccccccccccccccc   # [4] <- c
    .dword 0xe5e5e5e5e5e5e5e5   # [5] bg
    .dword 0xdddddddddddddddd   # [6] <- d
    .dword 0xe7e7e7e7e7e7e7e7   # [7] bg
.align 6
vec_dst:
    .skip 64
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
