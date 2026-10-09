# ms11b_vlse_walk.S
#
# Caracal Step 11b: STRIDED vle with a NON-"good" stride (-> Walker path).
#
# stride = 24 bytes (3 dwords, not 1/2/4x EEW) for e64 -> routes to the Walker
# (is_good_stride false). Loads dwords 0,3,6,9: v4 = [s0,s3,s6,s9]. Store + check.

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
    li      t6, 24                      # stride = 24 bytes (non-good -> Walker)
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vlse64.v v4, (t0), t6

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
    .dword 0x00000000000000a0   # [0] -> lane 0
    .dword 0x1111111111111111
    .dword 0x2222222222222222
    .dword 0x00000000000000a3   # [3] -> lane 1
    .dword 0x4444444444444444
    .dword 0x5555555555555555
    .dword 0x00000000000000a6   # [6] -> lane 2
    .dword 0x7777777777777777
    .dword 0x8888888888888888
    .dword 0x00000000000000a9   # [9] -> lane 3
.align 6
expected:
    .dword 0x00000000000000a0
    .dword 0x00000000000000a3
    .dword 0x00000000000000a6
    .dword 0x00000000000000a9
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
