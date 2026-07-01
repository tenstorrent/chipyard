# ms11d_vlm.S
#
# Caracal Step 11d: MASK load/store (vlm.v / vsm.v).
#
# vlm.v loads ceil(vl/8) bytes (EEW=8) into a vector register; vsm.v stores them.
# With vl=16 -> evl = ceil(16/8) = 2 bytes. Load v1 FULL background first, then
# vlm (2 bytes) -> bytes 0-1 = mask data, tail undisturbed; store v1 (vsm, 2
# bytes) and scalar-check.

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
    # background: v1 <- all-0xCC (full reg, vl=4 e64)
    la      t0, bg_data
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v1, (t0)

    # mask load: vl=16 -> 2 bytes into v1[1:0]; tail undisturbed
    li      a0, 16
    vsetvli a1, a0, e8, m1, ta, ma
    la      t0, mask_src
    vlm.v   v1, (t0)

    # mask store back 2 bytes to dst (vsm), then check
    la      t1, vec_dst
    vsm.v   v1, (t1)

    fence
    la      t1, vec_dst
    lbu     t2, 0(t1)
    li      t3, 0xA5
    bne     t2, t3, fail
    lbu     t2, 1(t1)
    li      t3, 0x5A
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
bg_data:
    .dword 0xcccccccccccccccc
    .dword 0xcccccccccccccccc
    .dword 0xcccccccccccccccc
    .dword 0xcccccccccccccccc
.align 6
mask_src:
    .byte 0xA5
    .byte 0x5A
    .byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
.align 6
vec_dst:
    .skip 32
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
