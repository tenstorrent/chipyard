# ms11b_vluxei.S
#
# Caracal Step 11b: INDEXED (gather) unit... vector LOAD (vluxei64).
#
# Index vector v8 holds per-element BYTE offsets [0,24,8,16] -> gather dwords
# [0,3,1,2] from base:  v4 = [s0, s3, s1, s2]. Index EEW = data EEW = e64 (M1).
# Load v8 (the index vector) first, then vluxei64; store v4 + scalar self-check.

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
    # 1. index vector v8 <- [0,24,8,16] (byte offsets), vl=4 full
    la      t0, idx_buf
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v8, (t0)

    # 2. indexed gather: v4[i] = mem[base + v8[i]]
    la      t0, src_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vluxei64.v v4, (t0), v8

    # 3. store v4 (unit) + self-check
    la      t1, vec_dst
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vse64.v v4, (t1)

    fence
    la      t1, vec_dst
    la      t4, expected
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
idx_buf:                        # byte offsets (e64 indices)
    .dword 0
    .dword 24
    .dword 8
    .dword 16
.align 6
src_data:
    .dword 0x0000000000000000
    .dword 0x1111111111111111
    .dword 0x2222222222222222
    .dword 0x3333333333333333
.align 6
expected:
    .dword 0x0000000000000000   # offset 0  -> dword 0
    .dword 0x3333333333333333   # offset 24 -> dword 3
    .dword 0x1111111111111111   # offset 8  -> dword 1
    .dword 0x2222222222222222   # offset 16 -> dword 2
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
