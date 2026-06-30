# ms11a4_vle_tail.S
#
# Caracal Step 11a (hardening): TAIL-undisturbed partial-register vle (e64).
#
# Load v4 FULL with a background [b0,b1,b2,b3], then a PARTIAL load (vl=2, tu)
# from src -> v4 = [s0, s1, b2, b3] (tail lanes 2,3 keep background, undisturbed).
# Store v4 (vl=4) + scalar self-check. Exercises the stale_pvdest group-copy on a
# partial load (vl < group capacity), gated by the AGEN's tail_undist flag.

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
    # 1. v4 <- background (vl=4, full)
    la      t0, bg_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v4, (t0)

    # 2. PARTIAL load vl=2, tail-undisturbed -> lanes 0,1 = src; 2,3 keep bg
    la      t0, src_data
    li      a0, 2
    vsetvli a1, a0, e64, m1, tu, ma
    vle64.v v4, (t0)

    # 3. store v4 (vl=4) + self-check
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
bg_data:
    .dword 0xb0b0b0b0b0b0b0b0
    .dword 0xb1b1b1b1b1b1b1b1
    .dword 0xb2b2b2b2b2b2b2b2
    .dword 0xb3b3b3b3b3b3b3b3
.align 6
src_data:
    .dword 0x5050505050505050
    .dword 0x5151515151515151
    .dword 0x5252525252525252
    .dword 0x5353535353535353
.align 6
expected:
    .dword 0x5050505050505050      # lane 0 active (vl=2) -> src
    .dword 0x5151515151515151      # lane 1 active        -> src
    .dword 0xb2b2b2b2b2b2b2b2      # lane 2 tail          -> background (undisturbed)
    .dword 0xb3b3b3b3b3b3b3b3      # lane 3 tail          -> background (undisturbed)
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
