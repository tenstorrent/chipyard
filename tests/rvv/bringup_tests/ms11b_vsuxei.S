# ms11b_vsuxei.S
#
# Caracal Step 11b: INDEXED (scatter) vector STORE (vsuxei64).
#
# v8 = byte offsets [0,24,8,16]; v4 = [a,b,c,d]. Scatter: mem[base+v8[i]] = v4[i]:
#   dst dword0=a (off0), dword3=b (off24), dword1=c (off8), dword2=d (off16)
#   -> dst = [a, c, d, b]. Both VecIdxGen (indices, pvs2) and VecDgen (store data,
# pvs3) are active. Scalar self-check.

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
    # v8 <- offsets
    la      t0, idx_buf
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v8, (t0)
    # v4 <- src
    la      t0, src_data
    vle64.v v4, (t0)

    # pre-fill dst with background (4 dwords)
    la      t1, vec_dst
    la      t4, bg_data
    li      a0, 4
1:
    ld      t2, 0(t4)
    sd      t2, 0(t1)
    addi    t1, t1, 8
    addi    t4, t4, 8
    addi    a0, a0, -1
    bnez    a0, 1b
    fence

    # scatter store
    la      t0, vec_dst
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vsuxei64.v v4, (t0), v8

    fence
    la      t1, vec_dst
    la      t4, expected
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
idx_buf:
    .dword 0
    .dword 24
    .dword 8
    .dword 16
.align 6
src_data:
    .dword 0xaaaaaaaaaaaaaaaa   # a
    .dword 0xbbbbbbbbbbbbbbbb   # b
    .dword 0xcccccccccccccccc   # c
    .dword 0xdddddddddddddddd   # d
.align 6
bg_data:
    .dword 0xe0e0e0e0e0e0e0e0
    .dword 0xe1e1e1e1e1e1e1e1
    .dword 0xe2e2e2e2e2e2e2e2
    .dword 0xe3e3e3e3e3e3e3e3
.align 6
expected:
    .dword 0xaaaaaaaaaaaaaaaa   # dword0 <- a (off 0)
    .dword 0xcccccccccccccccc   # dword1 <- c (off 8)
    .dword 0xdddddddddddddddd   # dword2 <- d (off 16)
    .dword 0xbbbbbbbbbbbbbbbb   # dword3 <- b (off 24)
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
