# ms_stld_nofence.S
#
# Diagnostic: vector store -> load-back to the SAME address, with a FENCE between.
# If this PASSES but the fence-less version (ms3p5_pureload pattern) mismatches,
# the bug is a store->load memory ORDERING race (younger vle executes its dcache
# beats before the older vse drains), not a broken store. Self-checking via
# vmv.x.s (B3b) so it does not depend on cosim VRF comparison of the load tail.

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
    la      t1, scratch
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vmv.v.i v2, 12                         # v2 = {12,12,12,12}
    vse64.v v2, (t1)                       # store 12s to scratch
    vle64.v v3, (t1)                       # load them back -> v3 should be {12,...}
    vmv.x.s x5, v3                         # x5 = v3[0]
    li      t2, 12
    bne     x5, t2, fail

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
scratch:
    .dword 0
    .dword 0
    .dword 0
    .dword 0
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
