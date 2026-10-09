# ms11a4_vse_mask.S
#
# Caracal Step 11a (hardening): MASKED unit-stride vector STORE (e64).
#
# Masked store writes ONLY active elements to memory; masked-off memory keeps its
# prior value (no register-undisturbed copy needed -- this is memory, not a dest
# reg). Sequence:
#   1. v0 <- mask 0x0A (elements 1,3 active; 0,2 masked off)
#   2. v4 <- src [s0,s1,s2,s3]
#   3. pre-fill dst memory with background [d0,d1,d2,d3] (scalar stores)
#   4. vse64.v v4, (dst), v0.t  -> dst = [d0, s1, d2, s3]
#   5. scalar load-back self-check.

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
    # 1. v0 mask <- {0x0A,0,0,0} (full reg)
    la      t0, mask_buf
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v0, (t0)

    # 2. v4 <- src
    la      t0, src_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v4, (t0)

    # 3. pre-fill dst with background via scalar stores
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

    # 4. masked store
    la      t1, vec_dst
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, mu
    vse64.v v4, (t1), v0.t

    # 5. self-check
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
mask_buf:
    .dword 0x000000000000000A
    .dword 0
    .dword 0
    .dword 0
.align 6
src_data:
    .dword 0x5050505050505050
    .dword 0x5151515151515151
    .dword 0x5252525252525252
    .dword 0x5353535353535353
.align 6
bg_data:
    .dword 0xd0d0d0d0d0d0d0d0
    .dword 0xd1d1d1d1d1d1d1d1
    .dword 0xd2d2d2d2d2d2d2d2
    .dword 0xd3d3d3d3d3d3d3d3
.align 6
expected:
    .dword 0xd0d0d0d0d0d0d0d0      # lane 0 masked off -> background kept
    .dword 0x5151515151515151      # lane 1 active     -> src
    .dword 0xd2d2d2d2d2d2d2d2      # lane 2 masked off -> background kept
    .dword 0x5353535353535353      # lane 3 active     -> src
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
