# ms11b_vlse.S
#
# Caracal Step 11b: STRIDED unit... non-unit-stride vector LOAD (vlse64).
#
# stride = 16 bytes (2 dwords) for e64 -> loads every OTHER dword:
#   v4 = [src[0], src[2], src[4], src[6]]
# Exercises the rs2 (stride) operand read + the strided address path. Store v4 +
# scalar self-check.

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
    la      t0, src_data
    li      t6, 16                      # stride = 16 bytes
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vlse64.v v4, (t0), t6               # strided load

    # store v4 (unit) + self-check
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
src_data:
    .dword 0x0000000000000000      # [0] loaded -> lane 0
    .dword 0x1111111111111111      # [1] skipped
    .dword 0x2222222222222222      # [2] loaded -> lane 1
    .dword 0x3333333333333333      # [3] skipped
    .dword 0x4444444444444444      # [4] loaded -> lane 2
    .dword 0x5555555555555555      # [5] skipped
    .dword 0x6666666666666666      # [6] loaded -> lane 3
    .dword 0x7777777777777777      # [7] skipped
.align 6
expected:
    .dword 0x0000000000000000
    .dword 0x2222222222222222
    .dword 0x4444444444444444
    .dword 0x6666666666666666
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
