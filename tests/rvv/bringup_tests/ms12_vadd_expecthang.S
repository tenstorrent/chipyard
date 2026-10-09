# ms12_vadd_expecthang.S
#
# Caracal Step 12: vector ARITHMETIC sanity — EXPECTED TO HANG in Milestone 1.
#
# IQ_V_ALU is dormant in M1: vadd.vv is decoded, renamed, and queued into the
# vector-ALU issue queue, but there is NO vector-ALU / CII execution unit yet
# (Milestone 2). So the vadd never issues, never completes, and the pipeline
# stalls at its ROB entry -> boom_timeout ("Pipeline has hung"). This is the
# expected, observable M1 outcome for vector arithmetic. The Step-12 hard assert
# (core.scala: !valu_iss_unit.iss_uops(0).valid) additionally guards against any
# accidental IQ_V_ALU grant (which would silently mis-execute).
#
# DO NOT add to the pass regression -- it hangs to +max-cycles by design. Kept as
# documentation of the M1 vector-arith tie-off.

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
    la      t0, src_a
    la      t1, src_b
    li      a0, 4
    vsetvli a1, a0, e64, m1, ta, ma
    vle64.v v4, (t0)          # v4 <- a   (load path works)
    vle64.v v8, (t1)          # v8 <- b
    vadd.vv v12, v4, v8       # <-- HANGS: IQ_V_ALU dormant in M1 (no EU)

    # unreachable in M1
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
src_a:
    .dword 1
    .dword 2
    .dword 3
    .dword 4
.align 6
src_b:
    .dword 10
    .dword 20
    .dword 30
    .dword 40
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
