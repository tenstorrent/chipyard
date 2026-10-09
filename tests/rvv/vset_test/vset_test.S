# vset_test.S
#
# Minimal self-checking bare-metal test for the RVV "vset" instruction family:
#   - vsetvli   rd, rs1, vtypei      (AVL in GPR,  vtype immediate)
#   - vsetivli  rd, uimm, vtypei     (AVL immediate, vtype immediate)
#   - vsetvl    rd, rs1, rs2         (AVL in GPR,  vtype in GPR)
#
# It does NOT touch any vector data registers — it only exercises the three
# vset forms and verifies that each correctly:
#   * writes the new vtype CSR (exact, VLEN-independent), and
#   * writes vl into rd according to vl = min(AVL, VLMAX).
#
# Config coverage (tests 6-16): all four SEW (e8/e16/e32/e64), LMUL m1/m2/m8 and
# fractional mf2/mf4/mf8, the tu/mu policy bits, AVL at {0, mid, VLMAX-1, VLMAX,
# >>VLMAX}, and a back-to-back reconfigure. Every VLMAX check is VLEN-independent:
# VLMAX(elements) = LMUL * vlenb / SEW_bytes, computed from the vlenb CSR by shifts.
#
# vtype encoding (RVV 1.0):  [7]=vma [6]=vta [5:3]=vsew [2:0]=vlmul
#   vsew:  e8=000 e16=001 e32=010 e64=011
#   vlmul: m1=000 m2=001  m4=010  m8=011  mf2=111 mf4=110 mf8=101
#
# Pass/fail uses the HTIF tohost convention: tohost = (code<<1)|1.
#   code == 0  -> PASS (exit 0)
#   code != 0  -> FAIL, code == the test number that failed.
#
# Build (inside the container, see CLAUDE.md):
#   riscv64-unknown-elf-gcc -march=rv64gcv -mabi=lp64d -mcmodel=medany \
#       -nostdlib -nostartfiles -static -T bobcat_linker.ld \
#       vset_test.S -o vset_test.elf

.section .text
.globl _start
.option norvc

_start:
    # --- stack ---
    la      sp, stack_top

    # --- trap vector: any unexpected trap is a hard failure ---
    la      t0, trap_vector
    csrw    mtvec, t0

    # --- enable the vector unit: mstatus.VS = 11, mstatus.FS = 11 ---
    li      t0, (3 << 9) | (3 << 13)     # VS[10:9], FS[14:13]
    csrs    mstatus, t0

    #============================================================
    # Test 1: vsetvli  (AVL in GPR, vtype immediate)
    #   AVL = 1, e32, m1, ta, ma  ->  vl = 1, vtype = 0xD0
    #============================================================
    li      gp, 1
    li      a0, 1
    vsetvli a1, a0, e32, m1, ta, ma
    li      t0, 1
    bne     a1, t0, fail                 # vl must be 1
    csrr    t1, vtype
    li      t0, 0xD0
    bne     t1, t0, fail                 # vtype must be e32/m1/ta/ma

    #============================================================
    # Test 2: vsetivli (AVL immediate, vtype immediate)
    #   AVL = 1, e16, m2, ta, ma  ->  vl = 1, vtype = 0xC9
    #============================================================
    li      gp, 2
    vsetivli a1, 1, e16, m2, ta, ma
    li      t0, 1
    bne     a1, t0, fail
    csrr    t1, vtype
    li      t0, 0xC9
    bne     t1, t0, fail

    #============================================================
    # Test 3: vsetvl  (AVL in GPR, vtype in GPR)
    #   AVL = 1, vtype = e64/m4/tu/mu (0x1A)  ->  vl = 1, vtype = 0x1A
    #============================================================
    li      gp, 3
    li      a0, 1
    li      a2, 0x1A                     # e64,m4,tu,mu
    vsetvl  a1, a0, a2
    li      t0, 1
    bne     a1, t0, fail
    csrr    t1, vtype
    li      t0, 0x1A
    bne     t1, t0, fail

    #============================================================
    # Test 4: vl clamping  (AVL >> VLMAX)
    #   e8, m1  ->  VLMAX = VLEN/8 = vlenb.
    #   With a huge AVL, vl must clamp to VLMAX (== vlenb).
    #   This is VLEN-independent: we read vlenb and compare.
    #============================================================
    li      gp, 4
    li      a0, 0x7fffffff               # AVL far larger than any VLMAX
    vsetvli a1, a0, e8, m1, ta, ma
    csrr    a2, vlenb                    # vlenb = VLEN/8 = VLMAX for e8/m1
    bne     a1, a2, fail                 # vl must equal VLMAX
    csrr    t1, vtype
    li      t0, 0xC0                     # e8,m1,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 5: vsetvl reproduces a prior vtype, and vl=0 is legal
    #   AVL = 0  -> vl = 0, vtype unchanged from the requested value
    #============================================================
    li      gp, 5
    li      a0, 0
    li      a2, 0xD0                     # e32,m1,ta,ma
    vsetvl  a1, a0, a2
    bnez    a1, fail                     # vl must be 0
    csrr    t1, vtype
    li      t0, 0xD0
    bne     t1, t0, fail

    #============================================================
    # Test 6: SEW sweep clamp — e16/m1, AVL huge -> vl = VLMAX = vlenb/2
    #============================================================
    li      gp, 6
    li      a0, 0x7fffffff
    vsetvli a1, a0, e16, m1, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 1                    # VLMAX(e16,m1) = vlenb/2
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xC8                     # e16,m1,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 7: e32/m1, AVL huge -> vl = VLMAX = vlenb/4
    #============================================================
    li      gp, 7
    li      a0, 0x7fffffff
    vsetvli a1, a0, e32, m1, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 2                    # VLMAX(e32,m1) = vlenb/4
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xD0
    bne     t1, t0, fail

    #============================================================
    # Test 8: e64/m1, AVL huge -> vl = VLMAX = vlenb/8
    #============================================================
    li      gp, 8
    li      a0, 0x7fffffff
    vsetvli a1, a0, e64, m1, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 3                    # VLMAX(e64,m1) = vlenb/8
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xD8                     # e64,m1,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 9: LMUL grouping — e8/m8, AVL huge -> vl = VLMAX = vlenb*8
    #============================================================
    li      gp, 9
    li      a0, 0x7fffffff
    vsetvli a1, a0, e8, m8, ta, ma
    csrr    a2, vlenb
    slli    a2, a2, 3                    # VLMAX(e8,m8) = vlenb*8
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xC3                     # e8,m8,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 10: fractional LMUL — e8/mf2, AVL huge -> vl = vlenb/2
    #============================================================
    li      gp, 10
    li      a0, 0x7fffffff
    vsetvli a1, a0, e8, mf2, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 1                    # VLMAX(e8,mf2) = vlenb/2
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xC7                     # e8,mf2,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 11: fractional LMUL — e8/mf8, AVL huge -> vl = vlenb/8
    #============================================================
    li      gp, 11
    li      a0, 0x7fffffff
    vsetvli a1, a0, e8, mf8, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 3                    # VLMAX(e8,mf8) = vlenb/8
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xC5                     # e8,mf8,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 12: tail/mask-undisturbed policy — e32/m1/tu/mu
    #   AVL = 3 (< VLMAX) -> vl = 3, vtype = 0x10
    #============================================================
    li      gp, 12
    li      a0, 3
    vsetvli a1, a0, e32, m1, tu, mu
    li      t0, 3
    bne     a1, t0, fail
    csrr    t1, vtype
    li      t0, 0x10                     # e32,m1,tu,mu
    bne     t1, t0, fail

    #============================================================
    # Test 13: AVL exactly VLMAX — e64/m8 (VLMAX = vlenb), AVL = vlenb -> vl = vlenb
    #============================================================
    li      gp, 13
    csrr    a0, vlenb                    # AVL = vlenb == VLMAX(e64,m8)
    vsetvli a1, a0, e64, m8, ta, ma
    csrr    a2, vlenb
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xDB                     # e64,m8,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 14: AVL = VLMAX-1 (no clamp) — e16/m2 (VLMAX = vlenb)
    #============================================================
    li      gp, 14
    csrr    a0, vlenb
    addi    a0, a0, -1                   # AVL = vlenb - 1 < VLMAX
    vsetvli a1, a0, e16, m2, ta, ma
    csrr    a2, vlenb
    addi    a2, a2, -1
    bne     a1, a2, fail
    csrr    t1, vtype
    li      t0, 0xC9                     # e16,m2,ta,ma
    bne     t1, t0, fail

    #============================================================
    # Test 15: vsetvl with vtype in GPR — e8/mf4 (0xC6), AVL huge -> vl = vlenb/4
    #============================================================
    li      gp, 15
    li      a0, 0x7fffffff
    li      a2, 0xC6                     # e8,mf4,ta,ma
    vsetvl  a1, a0, a2
    csrr    a3, vlenb
    srli    a3, a3, 2                    # VLMAX(e8,mf4) = vlenb/4
    bne     a1, a3, fail
    csrr    t1, vtype
    li      t0, 0xC6
    bne     t1, t0, fail

    #============================================================
    # Test 16: back-to-back reconfigure — vtype/vl reflect the LAST vset
    #   e8/m1 (vl=vlenb) then e64/m1 (vl=vlenb/8)
    #============================================================
    li      gp, 16
    li      a0, 0x7fffffff
    vsetvli a1, a0, e8, m1, ta, ma
    csrr    a2, vlenb
    bne     a1, a2, fail                 # vl = vlenb
    vsetvli a1, a0, e64, m1, ta, ma
    csrr    a2, vlenb
    srli    a2, a2, 3
    bne     a1, a2, fail                 # vl = vlenb/8
    csrr    t1, vtype
    li      t0, 0xD8                     # e64,m1,ta,ma
    bne     t1, t0, fail

    # all tests passed
    j       pass

#----------------------------------------------------------------
# Exit paths (HTIF tohost)
#----------------------------------------------------------------
pass:
    li      gp, 1                        # (0<<1)|1  -> exit code 0
    j       write_tohost

fail:
    slli    gp, gp, 1
    ori     gp, gp, 1                    # (testnum<<1)|1
    j       write_tohost

write_tohost:
    la      t5, tohost
    sd      gp, 0(t5)
1:  j       1b                           # spin until fesvr tears down the sim

#----------------------------------------------------------------
# Trap handler: an unexpected trap means a vset (or setup) faulted.
# Report a distinctive failure code (0x1F).
#----------------------------------------------------------------
.align 2
trap_vector:
    li      gp, 0x1F
    j       fail

#----------------------------------------------------------------
# Data / HTIF symbols (fesvr locates these by name in the symbol table)
#----------------------------------------------------------------
.section .data
.align 6
.global tohost
tohost:   .dword 0
.align 6
.global fromhost
fromhost: .dword 0

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
