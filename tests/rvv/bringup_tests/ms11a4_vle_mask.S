# ms11a4_vle_mask.S
#
# Caracal Step 11a (hardening): MASKED unit-stride vector LOAD (e64, mask-undisturbed).
#
# Sequence:
#   1. v0  <- mask 0x0A (bits 3..0 = 1010 -> elements 1,3 active; 0,2 masked off)
#   2. v4  <- background [b0,b1,b2,b3]  (unmasked)
#   3. v4  <- masked vle64 from src, v0.t, mu  -> active lanes get src, masked
#            lanes keep background:  v4 = [b0, s1, b2, s3]
#   4. vse64 v4 to dst (unmasked) + scalar load-back self-check.
#
# mu (mask-undisturbed) is REQUIRED so masked-off lanes are deterministic (keep
# old value) and match Whisper; mask-agnostic (ma) would let the model pick 1s.

.section .text
.globl _start
.option norvc

_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)     # mstatus.VS=11, FS=11
    csrs    mstatus, t0

    li      gp, 1
    # 1. mask register v0 <- {0x0A,0,0,0}  (vl=4, full register -> no tail garbage;
    #    mask bits 0..3 live in lane 0's low nibble = 1010 -> elements 1,3 active)
    la      t0, mask_buf
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v0, (t0)

    # 2. background v4 <- [b0,b1,b2,b3]  (vl=4, unmasked)
    la      t0, bg_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v4, (t0)

    # 3. masked load: v4 <- src under v0.t, mask-undisturbed
    la      t0, src_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, mu
    vle64.v v4, (t0), v0.t

    # 4. store v4 (unmasked) and self-check
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
mask_buf:
    .dword 0x000000000000000A      # element masks 0..3: 0,1,0,1 (elements 1,3 active)
    .dword 0x0000000000000000
    .dword 0x0000000000000000
    .dword 0x0000000000000000
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
    .dword 0xb0b0b0b0b0b0b0b0      # lane 0 masked off -> background
    .dword 0x5151515151515151      # lane 1 active     -> src
    .dword 0xb2b2b2b2b2b2b2b2      # lane 2 masked off -> background
    .dword 0x5353535353535353      # lane 3 active     -> src
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
