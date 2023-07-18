.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x29, 0x40201123
                  csrw 0x301, x29
                  csrr x31, 0x301
kernel_sp:        
                  la x23, kernel_stack_end

trap_vec_init:    
                  la x29, mtvec_handler
                  ori x29, x29, 1

mepc_setup:       
                  la x29, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x533c568f
                  li x1, 0xe596c373
                  li x2, 0x80000000
                  li x3, 0xf43cadd1
                  li x4, 0xf9b43ffc
                  li x5, 0x81a275ab
                  li x6, 0x80000000
                  li x7, 0xeb1cd1cb
                  li x8, 0xf69761ae
                  li x9, 0x80000000
                  li x10, 0x1367de40
                  li x11, 0x80000000
                  li x12, 0xf9cb3db6
                  li x13, 0xa62cabff
                  li x15, 0x22f56840
                  li x16, 0xf2856778
                  li x17, 0x674d8c1c
                  li x18, 0xf2f25fd8
                  li x19, 0x2d01a040
                  li x20, 0xfabea418
                  li x21, 0xfbf5aa8a
                  li x22, 0x80000000
                  li x24, 0x80000000
                  li x25, 0x77e023f0
                  li x26, 0x80000000
                  li x27, 0xfb20487d
                  li x28, 0xff0dd85f
                  li x29, 0x8f545d8
                  li x30, 0x80000000
                  li x31, 0xf45825fa
                  la x14, user_stack_end
                  csrwi vxsat, 1
                  csrwi vxrm, 0
li x20, 8
                  vsetvli x29, x20, e16, m1
vec_reg_init:

                  fmv.w.x ft0, x0
                  fmv.w.x ft1, x1
                  fmv.w.x ft2, x2
                  fmv.w.x ft3, x3
                  fmv.w.x ft4, x4
                  fmv.w.x ft5, x5
                  fmv.w.x ft6, x6
                  fmv.w.x ft7, x7
                  fmv.w.x fs0, x8
                  fmv.w.x fs1, x9
                  fmv.w.x fa0, x10
                  fmv.w.x fa1, x11
                  fmv.w.x fa2, x12
                  fmv.w.x fa3, x13
                  fmv.w.x fa4, x14
                  fmv.w.x fa5, x15
                  fmv.w.x fa6, x16
                  fmv.w.x fa7, x17
                  fmv.w.x fs2, x18
                  fmv.w.x fs3, x19
                  fmv.w.x fs4, x20
                  fmv.w.x fs5, x21
                  fmv.w.x fs6, x22
                  fmv.w.x fs7, x23
                  fmv.w.x fs8, x24
                  fmv.w.x fs9, x25
                  fmv.w.x fs10, x26
                  fmv.w.x fs11, x27
                  fmv.w.x ft8, x28
                  fmv.w.x ft9, x29
                  fmv.w.x ft10, x30
                  fmv.w.x ft11, x31

                  vmv.v.x v0, x0
                  vmv.v.x v1, x1
                  li x29, 0x3f39bc13
                  vslide1up.vx v0, v1, x29
                  vmv.v.v v0, v0
                  li x29, 0x1c410d24
                  vslide1up.vx v0, v1, x29
                  vmv.v.v v0, v0
                  li x29, 0xade1430e
                  vslide1up.vx v0, v1, x29
                  vmv.v.v v0, v0
                  li x29, 0x45bdd334
                  vslide1up.vx v0, v1, x29
                  li x29, 0xe9729c45
                  vslide1up.vx v1, v0, x29
                  vmv.v.v v0, v1
                  li x29, 0xb9903991
                  vslide1up.vx v1, v0, x29
                  vmv.v.v v0, v1
                  li x29, 0x7b18d20
                  vslide1up.vx v1, v0, x29
                  vmv.v.v v0, v1
                  li x29, 0xda1a29bc
                  vslide1up.vx v1, v0, x29
                  li x29, 0x829f5e6
                  vslide1up.vx v2, v0, x29
                  vmv.v.v v0, v2
                  li x29, 0xa6ab4261
                  vslide1up.vx v2, v0, x29
                  vmv.v.v v0, v2
                  li x29, 0xc7f44a81
                  vslide1up.vx v2, v0, x29
                  vmv.v.v v0, v2
                  li x29, 0x61dc524f
                  vslide1up.vx v2, v0, x29
                  li x29, 0xb35b2eea
                  vslide1up.vx v3, v0, x29
                  vmv.v.v v0, v3
                  li x29, 0x6376ee43
                  vslide1up.vx v3, v0, x29
                  vmv.v.v v0, v3
                  li x29, 0x4f00c30f
                  vslide1up.vx v3, v0, x29
                  vmv.v.v v0, v3
                  li x29, 0x41002565
                  vslide1up.vx v3, v0, x29
                  li x29, 0x822326a
                  vslide1up.vx v4, v0, x29
                  vmv.v.v v0, v4
                  li x29, 0xa562e902
                  vslide1up.vx v4, v0, x29
                  vmv.v.v v0, v4
                  li x29, 0xe6b19ceb
                  vslide1up.vx v4, v0, x29
                  vmv.v.v v0, v4
                  li x29, 0xdfec8517
                  vslide1up.vx v4, v0, x29
                  li x29, 0x797e0ccf
                  vslide1up.vx v5, v0, x29
                  vmv.v.v v0, v5
                  li x29, 0x8f92fb39
                  vslide1up.vx v5, v0, x29
                  vmv.v.v v0, v5
                  li x29, 0x1b25e
                  vslide1up.vx v5, v0, x29
                  vmv.v.v v0, v5
                  li x29, 0xd8863139
                  vslide1up.vx v5, v0, x29
                  li x29, 0x69911ba2
                  vslide1up.vx v6, v0, x29
                  vmv.v.v v0, v6
                  li x29, 0x9be40642
                  vslide1up.vx v6, v0, x29
                  vmv.v.v v0, v6
                  li x29, 0xb5408de0
                  vslide1up.vx v6, v0, x29
                  vmv.v.v v0, v6
                  li x29, 0x2a6e6711
                  vslide1up.vx v6, v0, x29
                  li x29, 0x70896c91
                  vslide1up.vx v7, v0, x29
                  vmv.v.v v0, v7
                  li x29, 0x32444883
                  vslide1up.vx v7, v0, x29
                  vmv.v.v v0, v7
                  li x29, 0x8e2fc50b
                  vslide1up.vx v7, v0, x29
                  vmv.v.v v0, v7
                  li x29, 0x803d51c7
                  vslide1up.vx v7, v0, x29
                  li x29, 0x6b8e904d
                  vslide1up.vx v8, v0, x29
                  vmv.v.v v0, v8
                  li x29, 0xa0dd3c39
                  vslide1up.vx v8, v0, x29
                  vmv.v.v v0, v8
                  li x29, 0xc4c95eaf
                  vslide1up.vx v8, v0, x29
                  vmv.v.v v0, v8
                  li x29, 0x361d7758
                  vslide1up.vx v8, v0, x29
                  li x29, 0x64e44dc7
                  vslide1up.vx v9, v0, x29
                  vmv.v.v v0, v9
                  li x29, 0x1cbda3e2
                  vslide1up.vx v9, v0, x29
                  vmv.v.v v0, v9
                  li x29, 0xb40e661a
                  vslide1up.vx v9, v0, x29
                  vmv.v.v v0, v9
                  li x29, 0xa0d0c55d
                  vslide1up.vx v9, v0, x29
                  li x29, 0x36b2a670
                  vslide1up.vx v10, v0, x29
                  vmv.v.v v0, v10
                  li x29, 0x830be83a
                  vslide1up.vx v10, v0, x29
                  vmv.v.v v0, v10
                  li x29, 0xb60a168c
                  vslide1up.vx v10, v0, x29
                  vmv.v.v v0, v10
                  li x29, 0xd89ef680
                  vslide1up.vx v10, v0, x29
                  li x29, 0x6e04b4fd
                  vslide1up.vx v11, v0, x29
                  vmv.v.v v0, v11
                  li x29, 0xddf95913
                  vslide1up.vx v11, v0, x29
                  vmv.v.v v0, v11
                  li x29, 0x63a938ae
                  vslide1up.vx v11, v0, x29
                  vmv.v.v v0, v11
                  li x29, 0x14e4b96c
                  vslide1up.vx v11, v0, x29
                  li x29, 0xc98b506f
                  vslide1up.vx v12, v0, x29
                  vmv.v.v v0, v12
                  li x29, 0x7295aacf
                  vslide1up.vx v12, v0, x29
                  vmv.v.v v0, v12
                  li x29, 0xed6300e9
                  vslide1up.vx v12, v0, x29
                  vmv.v.v v0, v12
                  li x29, 0x4aa66406
                  vslide1up.vx v12, v0, x29
                  li x29, 0x8769f207
                  vslide1up.vx v13, v0, x29
                  vmv.v.v v0, v13
                  li x29, 0xb63b9943
                  vslide1up.vx v13, v0, x29
                  vmv.v.v v0, v13
                  li x29, 0x8cb61521
                  vslide1up.vx v13, v0, x29
                  vmv.v.v v0, v13
                  li x29, 0xd660b88c
                  vslide1up.vx v13, v0, x29
                  li x29, 0x667b8b6e
                  vslide1up.vx v14, v0, x29
                  vmv.v.v v0, v14
                  li x29, 0x39fd46c
                  vslide1up.vx v14, v0, x29
                  vmv.v.v v0, v14
                  li x29, 0x4adde47e
                  vslide1up.vx v14, v0, x29
                  vmv.v.v v0, v14
                  li x29, 0x9ab06d65
                  vslide1up.vx v14, v0, x29
                  li x29, 0x1ab48806
                  vslide1up.vx v15, v0, x29
                  vmv.v.v v0, v15
                  li x29, 0x5494add0
                  vslide1up.vx v15, v0, x29
                  vmv.v.v v0, v15
                  li x29, 0x78f053b6
                  vslide1up.vx v15, v0, x29
                  vmv.v.v v0, v15
                  li x29, 0xdb436b4e
                  vslide1up.vx v15, v0, x29
                  li x29, 0xcb970856
                  vslide1up.vx v16, v0, x29
                  vmv.v.v v0, v16
                  li x29, 0xd3e28e9b
                  vslide1up.vx v16, v0, x29
                  vmv.v.v v0, v16
                  li x29, 0xf0281e61
                  vslide1up.vx v16, v0, x29
                  vmv.v.v v0, v16
                  li x29, 0xe86ffe90
                  vslide1up.vx v16, v0, x29
                  li x29, 0xb64e73d0
                  vslide1up.vx v17, v0, x29
                  vmv.v.v v0, v17
                  li x29, 0x3f4171b0
                  vslide1up.vx v17, v0, x29
                  vmv.v.v v0, v17
                  li x29, 0xacd68676
                  vslide1up.vx v17, v0, x29
                  vmv.v.v v0, v17
                  li x29, 0x40445a2f
                  vslide1up.vx v17, v0, x29
                  li x29, 0xd197b646
                  vslide1up.vx v18, v0, x29
                  vmv.v.v v0, v18
                  li x29, 0xf1c4c987
                  vslide1up.vx v18, v0, x29
                  vmv.v.v v0, v18
                  li x29, 0x6bc2ee09
                  vslide1up.vx v18, v0, x29
                  vmv.v.v v0, v18
                  li x29, 0xcff551d1
                  vslide1up.vx v18, v0, x29
                  li x29, 0xb1e7815e
                  vslide1up.vx v19, v0, x29
                  vmv.v.v v0, v19
                  li x29, 0x61770841
                  vslide1up.vx v19, v0, x29
                  vmv.v.v v0, v19
                  li x29, 0xc3769576
                  vslide1up.vx v19, v0, x29
                  vmv.v.v v0, v19
                  li x29, 0x729e1abb
                  vslide1up.vx v19, v0, x29
                  li x29, 0x921c28c8
                  vslide1up.vx v20, v0, x29
                  vmv.v.v v0, v20
                  li x29, 0x3633e0d
                  vslide1up.vx v20, v0, x29
                  vmv.v.v v0, v20
                  li x29, 0xa5fec009
                  vslide1up.vx v20, v0, x29
                  vmv.v.v v0, v20
                  li x29, 0x5d8c129
                  vslide1up.vx v20, v0, x29
                  li x29, 0xe36e22b9
                  vslide1up.vx v21, v0, x29
                  vmv.v.v v0, v21
                  li x29, 0x686cf20d
                  vslide1up.vx v21, v0, x29
                  vmv.v.v v0, v21
                  li x29, 0x276446cd
                  vslide1up.vx v21, v0, x29
                  vmv.v.v v0, v21
                  li x29, 0xba4045f4
                  vslide1up.vx v21, v0, x29
                  li x29, 0x8e63614d
                  vslide1up.vx v22, v0, x29
                  vmv.v.v v0, v22
                  li x29, 0xc7d3d684
                  vslide1up.vx v22, v0, x29
                  vmv.v.v v0, v22
                  li x29, 0xf600ffe0
                  vslide1up.vx v22, v0, x29
                  vmv.v.v v0, v22
                  li x29, 0x33d890c8
                  vslide1up.vx v22, v0, x29
                  li x29, 0xbdfe2545
                  vslide1up.vx v23, v0, x29
                  vmv.v.v v0, v23
                  li x29, 0x5df6cde0
                  vslide1up.vx v23, v0, x29
                  vmv.v.v v0, v23
                  li x29, 0x7f90685
                  vslide1up.vx v23, v0, x29
                  vmv.v.v v0, v23
                  li x29, 0x109b78cf
                  vslide1up.vx v23, v0, x29
                  li x29, 0xe62acbc5
                  vslide1up.vx v24, v0, x29
                  vmv.v.v v0, v24
                  li x29, 0x104afd2c
                  vslide1up.vx v24, v0, x29
                  vmv.v.v v0, v24
                  li x29, 0xec2ac7ab
                  vslide1up.vx v24, v0, x29
                  vmv.v.v v0, v24
                  li x29, 0x1c27a1e8
                  vslide1up.vx v24, v0, x29
                  li x29, 0x7fd14e4c
                  vslide1up.vx v25, v0, x29
                  vmv.v.v v0, v25
                  li x29, 0x558be40
                  vslide1up.vx v25, v0, x29
                  vmv.v.v v0, v25
                  li x29, 0xabe7e4d4
                  vslide1up.vx v25, v0, x29
                  vmv.v.v v0, v25
                  li x29, 0xae4f8d5c
                  vslide1up.vx v25, v0, x29
                  li x29, 0x80133535
                  vslide1up.vx v26, v0, x29
                  vmv.v.v v0, v26
                  li x29, 0xc96be258
                  vslide1up.vx v26, v0, x29
                  vmv.v.v v0, v26
                  li x29, 0xf3568690
                  vslide1up.vx v26, v0, x29
                  vmv.v.v v0, v26
                  li x29, 0x854a3af5
                  vslide1up.vx v26, v0, x29
                  li x29, 0x3e8156be
                  vslide1up.vx v27, v0, x29
                  vmv.v.v v0, v27
                  li x29, 0x650d8839
                  vslide1up.vx v27, v0, x29
                  vmv.v.v v0, v27
                  li x29, 0x23130fc9
                  vslide1up.vx v27, v0, x29
                  vmv.v.v v0, v27
                  li x29, 0x25b7edb1
                  vslide1up.vx v27, v0, x29
                  li x29, 0xba758805
                  vslide1up.vx v28, v0, x29
                  vmv.v.v v0, v28
                  li x29, 0x866baa3e
                  vslide1up.vx v28, v0, x29
                  vmv.v.v v0, v28
                  li x29, 0x61faf420
                  vslide1up.vx v28, v0, x29
                  vmv.v.v v0, v28
                  li x29, 0x1e60635c
                  vslide1up.vx v28, v0, x29
                  li x29, 0xa0b76ba1
                  vslide1up.vx v29, v0, x29
                  vmv.v.v v0, v29
                  li x29, 0x54f2ced7
                  vslide1up.vx v29, v0, x29
                  vmv.v.v v0, v29
                  li x29, 0x69239090
                  vslide1up.vx v29, v0, x29
                  vmv.v.v v0, v29
                  li x29, 0x390a3f9f
                  vslide1up.vx v29, v0, x29
                  li x29, 0x755d9d59
                  vslide1up.vx v30, v0, x29
                  vmv.v.v v0, v30
                  li x29, 0x521fb701
                  vslide1up.vx v30, v0, x29
                  vmv.v.v v0, v30
                  li x29, 0xccef3258
                  vslide1up.vx v30, v0, x29
                  vmv.v.v v0, v30
                  li x29, 0xf14d60f6
                  vslide1up.vx v30, v0, x29
                  li x29, 0x44951bdf
                  vslide1up.vx v31, v0, x29
                  vmv.v.v v0, v31
                  li x29, 0xaa388610
                  vslide1up.vx v31, v0, x29
                  vmv.v.v v0, v31
                  li x29, 0x1cde5e60
                  vslide1up.vx v31, v0, x29
                  vmv.v.v v0, v31
                  li x29, 0x639ad8fd
                  vslide1up.vx v31, v0, x29
li x20, 8
                  vsetvli x29, x20, e16, m1
main:             mul        s6, s4, sp
                  ori        a0, a4, -563
                  addi       t0, s10, -526
                  and        a7, s3, s4
                  xor        t6, ra, sp
                  mulh       t2, a4, zero
                  divu       s8, a4, t5
                  mulhu      t5, s8, t5
                  sra        a5, s4, s10
                  mulhu      s2, s4, t5
                  sra        s0, sp, sp
                  rem        s3, a1, s7
                  srl        a3, t4, a2
                  mulhsu     s4, s10, a4
                  addi       s8, s0, -480
                  or         t0, s8, t6
                  sub        a3, a5, a6
                  addi       s10, t4, 989
                  srl        a7, s8, t3
                  mulh       s2, t4, t3
                  mulhu      t5, s9, a7
                  add        t2, s10, a7
                  rem        s2, s1, t2
                  srl        s9, tp, a5
                  srli       a0, a5, 19
                  add        a1, a2, t0
                  andi       t2, tp, -451
                  div        a3, s10, t1
                  auipc      zero, 80689
                  slt        a3, a7, s5
                  rem        s6, t4, s8
                  sltu       t2, s10, t6
                  sltiu      s6, t3, 322
                  srl        s10, s8, a1
                  vfmul.vf   v28,v2,fs2,v0.t
                  ori        t4, a0, 991
                  sltu       s2, t6, a0
                  sub        t0, t2, s9
                  auipc      a7, 263572
                  xor        a5, s0, s6
                  addi       a1, gp, -402
                  auipc      zero, 34057
                  slli       t4, t2, 16
                  srli       ra, tp, 22
                  sub        a3, s3, a0
                  addi       a1, t4, 218
                  mulh       t1, a1, a1
                  slt        t5, s0, a2
                  srai       ra, t3, 20
                  slti       s2, tp, 101
                  ori        s3, a5, -27
                  and        s11, a4, a6
                  xor        a2, a0, sp
                  srl        sp, t2, a5
                  addi       t5, a4, 955
                  sra        tp, a4, s7
                  slti       t1, a6, -178
                  vfmul.vv   v24,v22,v25
                  sll        s3, a1, a4
                  sra        t2, t6, gp
                  add        s1, t3, a6
                  slt        t5, t0, zero
                  remu       ra, ra, s2
                  srli       s1, a3, 0
                  lui        zero, 690631
                  sub        s6, s1, t0
                  slt        s10, s2, s11
                  vfmul.vf   v2,v18,fs8
                  sll        sp, tp, a0
                  srli       a6, s6, 10
                  divu       s8, a3, t0
                  div        t5, s6, ra
                  div        a0, a4, s5
                  mul        t0, a1, zero
                  mulhu      tp, s1, t4
                  sub        t0, zero, s7
                  sra        a2, ra, s9
                  add        s2, s3, gp
                  remu       s3, s9, s6
                  vfmul.vv   v6,v27,v26
                  slli       s3, ra, 18
                  slli       s3, a1, 3
                  andi       zero, a1, -449
                  andi       a0, s8, -650
                  or         a2, gp, s9
                  sltiu      s0, tp, -434
                  srli       t1, tp, 10
                  slli       s5, t0, 25
                  mul        s0, t4, a3
                  sll        t4, t1, s10
                  sltiu      t4, a5, -408
                  addi       t4, s3, 335
                  ori        a0, t2, -593
                  mul        a1, tp, a1
                  sll        a5, tp, s9
                  rem        ra, s8, t5
                  slti       t1, a0, 314
                  sra        s1, s3, tp
                  add        t1, s11, t3
                  remu       a2, s11, a6
                  mul        s4, zero, s0
                  div        a0, a1, s0
                  sll        s6, a6, ra
                  slt        s0, a1, t1
                  sub        a1, t2, s7
                  addi       s10, s10, 876
                  srai       t6, a3, 11
                  sltu       s3, t0, a4
                  lui        a2, 928487
                  and        s5, ra, s9
                  div        s8, a5, t5
                  rem        s8, zero, s0
                  slti       t6, s9, -631
                  lui        t4, 388579
                  addi       a2, s2, 321
                  sltiu      a2, s9, 814
                  mulhsu     a2, ra, s1
                  lui        a6, 649284
                  sub        s0, sp, t2
                  mulh       ra, t4, s2
                  sltiu      a5, s10, -640
                  sltiu      s4, a6, 325
                  remu       ra, s6, a1
                  rem        s11, t2, s10
                  srl        a7, s0, tp
                  rem        t4, a5, a0
                  mulh       zero, s4, a6
                  srai       s0, a4, 20
                  sll        s2, s11, t1
                  xori       s1, s10, -1007
                  addi       s0, s3, 187
                  mul        s6, t5, s6
                  srli       s8, s3, 6
                  and        t2, t2, a6
                  xor        t0, zero, s8
                  sll        s8, zero, t0
                  srli       t5, a0, 24
                  lui        s9, 180732
                  srli       t0, t1, 3
                  andi       tp, a6, -690
                  mulhu      tp, a2, s8
                  sra        ra, ra, s9
                  sra        t4, s2, s3
                  vfmul.vf   v20,v7,ft4
                  mul        zero, s10, s4
                  and        s0, s11, s7
                  rem        s8, t1, t1
                  xori       s11, t6, -130
                  srli       s10, s4, 20
                  sll        a5, s3, a1
                  rem        t0, s4, a5
                  sltu       s9, a7, sp
                  addi       t4, a4, -674
                  addi       a3, t5, -572
                  sll        a1, t2, zero
                  xor        s11, s10, t3
                  srai       t2, s11, 3
                  mulh       t4, s9, a5
                  auipc      a7, 135338
                  sll        s1, s4, t5
                  sltiu      ra, zero, -264
                  or         s10, a7, s0
                  sll        a7, s11, t6
                  vfmul.vf   v14,v11,fs11
                  addi       t4, gp, 294
                  ori        s4, s1, 426
                  xor        s6, tp, s0
                  lui        a5, 687228
                  addi       t5, gp, -885
                  auipc      s9, 44839
                  lui        gp, 859094
                  sub        ra, a1, s4
                  lui        ra, 104221
                  sll        a1, s9, s3
                  mulhu      tp, s9, a1
                  sltu       ra, t5, s10
                  add        tp, sp, s3
                  xor        s10, ra, s5
                  ori        gp, s10, 755
                  or         s4, s10, s2
                  srli       t4, s4, 14
                  div        a1, tp, t1
                  mulhu      s1, ra, sp
                  vfmul.vv   v14,v30,v0
                  vfmul.vv   v10,v25,v5,v0.t
                  or         a6, s7, gp
                  addi       s4, t2, -330
                  xori       a2, t2, -473
                  srl        s11, s10, t0
                  vfmul.vv   v16,v7,v8
                  div        s6, a1, t4
                  slti       s6, s8, 224
                  mulhsu     s8, tp, a3
                  mulhu      s10, s8, s10
                  divu       s2, t2, t2
                  sltiu      t4, t3, -554
                  and        s10, s1, s1
                  srli       a5, a7, 28
                  mulhu      a3, s3, a3
                  srai       t2, s4, 16
                  la x28, test_done
                  jalr x0, x28, 0
test_done:        
                  li gp, 0x1
                  j write_tohost
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

debug_rom:        
                  dret

debug_exception:  
                  dret

instr_end:        
                  nop

.section .data
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.section .user_stack,"aw",@progbits;
.align 2
user_stack_start:
.rept 4999
.4byte 0x0
.endr
user_stack_end:
.4byte 0x0
.align 2
kernel_instr_start:
.text
.align           8
mtvec_handler:    
                  .option norvc;
                  j mmode_exception_handler

mmode_exception_handler:
                  1: addi x14, x14, -124
                  sw  x1, 4(x14)
                  sw  x2, 8(x14)
                  sw  x3, 12(x14)
                  sw  x4, 16(x14)
                  sw  x5, 20(x14)
                  sw  x6, 24(x14)
                  sw  x7, 28(x14)
                  sw  x8, 32(x14)
                  sw  x9, 36(x14)
                  sw  x10, 40(x14)
                  sw  x11, 44(x14)
                  sw  x12, 48(x14)
                  sw  x13, 52(x14)
                  sw  x14, 56(x14)
                  sw  x15, 60(x14)
                  sw  x16, 64(x14)
                  sw  x17, 68(x14)
                  sw  x18, 72(x14)
                  sw  x19, 76(x14)
                  sw  x20, 80(x14)
                  sw  x21, 84(x14)
                  sw  x22, 88(x14)
                  sw  x23, 92(x14)
                  sw  x24, 96(x14)
                  sw  x25, 100(x14)
                  sw  x26, 104(x14)
                  sw  x27, 108(x14)
                  sw  x28, 112(x14)
                  sw  x29, 116(x14)
                  sw  x30, 120(x14)
                  sw  x31, 124(x14)
                  csrr x29, 0x341 # MEPC
                  csrr x29, 0x342 # MCAUSE
                  li x20, 0x3 # BREAKPOINT
                  beq x29, x20, ebreak_handler
                  li x20, 0x8 # ECALL_UMODE
                  beq x29, x20, ecall_handler
                  li x20, 0x9 # ECALL_SMODE
                  beq x29, x20, ecall_handler
                  li x20, 0xb # ECALL_MMODE
                  beq x29, x20, ecall_handler
                  li x20, 0x1
                  beq x29, x20, instr_fault_handler
                  li x20, 0x5
                  beq x29, x20, load_fault_handler
                  li x20, 0x7
                  beq x29, x20, store_fault_handler
                  li x20, 0xc
                  beq x29, x20, pt_fault_handler
                  li x20, 0xd
                  beq x29, x20, pt_fault_handler
                  li x20, 0xf
                  beq x29, x20, pt_fault_handler
                  li x20, 0x2 # ILLEGAL_INSTRUCTION
                  beq x29, x20, illegal_instr_handler
                  csrr x20, 0x343 # MTVAL
                  1: la x28, test_done
                  jalr x1, x28, 0

ecall_handler:    
                  la x29, _start
                  sw x0, 0(x29)
                  sw x1, 4(x29)
                  sw x2, 8(x29)
                  sw x3, 12(x29)
                  sw x4, 16(x29)
                  sw x5, 20(x29)
                  sw x6, 24(x29)
                  sw x7, 28(x29)
                  sw x8, 32(x29)
                  sw x9, 36(x29)
                  sw x10, 40(x29)
                  sw x11, 44(x29)
                  sw x12, 48(x29)
                  sw x13, 52(x29)
                  sw x14, 56(x29)
                  sw x15, 60(x29)
                  sw x16, 64(x29)
                  sw x17, 68(x29)
                  sw x18, 72(x29)
                  sw x19, 76(x29)
                  sw x20, 80(x29)
                  sw x21, 84(x29)
                  sw x22, 88(x29)
                  sw x23, 92(x29)
                  sw x24, 96(x29)
                  sw x25, 100(x29)
                  sw x26, 104(x29)
                  sw x27, 108(x29)
                  sw x28, 112(x29)
                  sw x29, 116(x29)
                  sw x30, 120(x29)
                  sw x31, 124(x29)
                  la x28, write_tohost
                  jalr x0, x28, 0

instr_fault_handler:
                  li x29, 0
                  csrw 0x340, x29
                  li x12, 0
                  0: csrr x29, 0x340
                  mv x28, x29
                  li x28, 0
                  beq x29, x28, 1f
                  1: csrr x20, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  17: li x16, 4
                  csrr x29, 0x340
                  slli x29, x29, 30
                  srli x29, x29, 30
                  sub x28, x16, x29
                  addi x28, x28, -1
                  slli x28, x28, 3
                  sll x16, x18, x28
                  slli x29, x29, 3
                  add x28, x28, x29
                  srl x16, x16, x28
                  slli x28, x16, 27
                  srli x28, x28, 30
                  beqz x28, 20f
                  li x29, 1
                  beq x28, x29, 21f
                  li x29, 2
                  beq x28, x29, 25f
                  li x29, 3
                  beq x28, x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: csrr x29, 0x340
                  mv x12, x20
                  addi x29, x29, 1
                  csrw 0x340, x29
                  li x20, 1
                  ble x20, x29, 19f
                  j 0b
                  19: la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: csrr x29, 0x340
                  csrr x28, 0x343
                  srli x28, x28, 2
                  bnez x29, 22f
                  bltz x28, 18b
                  j 23f
                  22: bgtu x12, x28, 18b
                  23: bleu x20, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 24f
                  la x29, test_done
                  jalr x0, x29, 0
                  24: j 29f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x28, x20, 2
                  srli x28, x28, 2
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 26f
                  la x29, test_done
                  jalr x0, x29, 0
                  26: j 29f
                  27: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x28, x20, 2
                  srli x28, x28, 2
                  srli x28, x28, 0
                  slli x28, x28, 0
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 29f
                  la x29, test_done
                  jalr x0, x29, 0
                  28: j 29f
                  29: ori x16, x16, 4
                  csrr x29, 0x340
                  li x28, 30
                  sll x29, x29, x28
                  srl x29, x29, x28
                  slli x28, x29, 3
                  sll x16, x16, x28
                  or x18, x18, x16
                  csrr x29, 0x340
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x28, 1
                  beq x29, x28, 31f
                  li x28, 2
                  beq x29, x28, 32f
                  li x28, 3
                  beq x29, x28, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret

load_fault_handler:
                  li x29, 0
                  csrw 0x340, x29
                  li x12, 0
                  0: csrr x29, 0x340
                  mv x28, x29
                  li x28, 0
                  beq x29, x28, 1f
                  1: csrr x20, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  17: li x16, 4
                  csrr x29, 0x340
                  slli x29, x29, 30
                  srli x29, x29, 30
                  sub x28, x16, x29
                  addi x28, x28, -1
                  slli x28, x28, 3
                  sll x16, x18, x28
                  slli x29, x29, 3
                  add x28, x28, x29
                  srl x16, x16, x28
                  slli x28, x16, 27
                  srli x28, x28, 30
                  beqz x28, 20f
                  li x29, 1
                  beq x28, x29, 21f
                  li x29, 2
                  beq x28, x29, 25f
                  li x29, 3
                  beq x28, x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: csrr x29, 0x340
                  mv x12, x20
                  addi x29, x29, 1
                  csrw 0x340, x29
                  li x20, 1
                  ble x20, x29, 19f
                  j 0b
                  19: la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: csrr x29, 0x340
                  csrr x28, 0x343
                  srli x28, x28, 2
                  bnez x29, 22f
                  bltz x28, 18b
                  j 23f
                  22: bgtu x12, x28, 18b
                  23: bleu x20, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 24f
                  la x29, test_done
                  jalr x0, x29, 0
                  24: j 29f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x28, x20, 2
                  srli x28, x28, 2
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 26f
                  la x29, test_done
                  jalr x0, x29, 0
                  26: j 29f
                  27: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x28, x20, 2
                  srli x28, x28, 2
                  srli x28, x28, 0
                  slli x28, x28, 0
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 29f
                  la x29, test_done
                  jalr x0, x29, 0
                  28: j 29f
                  29: ori x16, x16, 1
                  csrr x29, 0x340
                  li x28, 30
                  sll x29, x29, x28
                  srl x29, x29, x28
                  slli x28, x29, 3
                  sll x16, x16, x28
                  or x18, x18, x16
                  csrr x29, 0x340
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x28, 1
                  beq x29, x28, 31f
                  li x28, 2
                  beq x29, x28, 32f
                  li x28, 3
                  beq x29, x28, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret

store_fault_handler:
                  li x29, 0
                  csrw 0x340, x29
                  li x12, 0
                  0: csrr x29, 0x340
                  mv x28, x29
                  li x28, 0
                  beq x29, x28, 1f
                  1: csrr x20, 0x3b0
                  csrr x18, 0x3a0
                  j 17f
                  17: li x16, 4
                  csrr x29, 0x340
                  slli x29, x29, 30
                  srli x29, x29, 30
                  sub x28, x16, x29
                  addi x28, x28, -1
                  slli x28, x28, 3
                  sll x16, x18, x28
                  slli x29, x29, 3
                  add x28, x28, x29
                  srl x16, x16, x28
                  slli x28, x16, 27
                  srli x28, x28, 30
                  beqz x28, 20f
                  li x29, 1
                  beq x28, x29, 21f
                  li x29, 2
                  beq x28, x29, 25f
                  li x29, 3
                  beq x28, x29, 27f
                  la x29, test_done
                  jalr x0, x29, 0
                  18: csrr x29, 0x340
                  mv x12, x20
                  addi x29, x29, 1
                  csrw 0x340, x29
                  li x20, 1
                  ble x20, x29, 19f
                  j 0b
                  19: la x29, test_done
                  jalr x0, x29, 0
                  20: j 18b
                  21: csrr x29, 0x340
                  csrr x28, 0x343
                  srli x28, x28, 2
                  bnez x29, 22f
                  bltz x28, 18b
                  j 23f
                  22: bgtu x12, x28, 18b
                  23: bleu x20, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 24f
                  la x29, test_done
                  jalr x0, x29, 0
                  24: j 29f
                  25: csrr x29, 0x343
                  srli x29, x29, 2
                  slli x28, x20, 2
                  srli x28, x28, 2
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 26f
                  la x29, test_done
                  jalr x0, x29, 0
                  26: j 29f
                  27: csrr x29, 0x343
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  slli x28, x20, 2
                  srli x28, x28, 2
                  srli x28, x28, 0
                  slli x28, x28, 0
                  bne x29, x28, 18b
                  andi x28, x16, 128
                  beqz x28, 29f
                  la x29, test_done
                  jalr x0, x29, 0
                  28: j 29f
                  29: ori x16, x16, 3
                  csrr x29, 0x340
                  li x28, 30
                  sll x29, x29, x28
                  srl x29, x29, x28
                  slli x28, x29, 3
                  sll x16, x16, x28
                  or x18, x18, x16
                  csrr x29, 0x340
                  srli x29, x29, 2
                  beqz x29, 30f
                  li x28, 1
                  beq x29, x28, 31f
                  li x28, 2
                  beq x29, x28, 32f
                  li x28, 3
                  beq x29, x28, 33f
                  30: csrw 0x3a0, x18
                  j 34f
                  31: csrw 0x3a1, x18
                  j 34f
                  32: csrw 0x3a2, x18
                  j 34f
                  33: csrw 0x3a3, x18
                  34: nop
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret

ebreak_handler:   
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret

illegal_instr_handler:
                  csrr  x29, 0x341
                  addi  x29, x29, 4
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x29, 0x300 # MSTATUS;
                  csrr  x29, 0x304 # MIE;
                  csrr  x29, 0x344 # MIP;
                  csrrc x29, 0x344, x29 # MIP;
                  lw  x1, 4(x14)
                  lw  x2, 8(x14)
                  lw  x3, 12(x14)
                  lw  x4, 16(x14)
                  lw  x5, 20(x14)
                  lw  x6, 24(x14)
                  lw  x7, 28(x14)
                  lw  x8, 32(x14)
                  lw  x9, 36(x14)
                  lw  x10, 40(x14)
                  lw  x11, 44(x14)
                  lw  x12, 48(x14)
                  lw  x13, 52(x14)
                  lw  x14, 56(x14)
                  lw  x15, 60(x14)
                  lw  x16, 64(x14)
                  lw  x17, 68(x14)
                  lw  x18, 72(x14)
                  lw  x19, 76(x14)
                  lw  x20, 80(x14)
                  lw  x21, 84(x14)
                  lw  x22, 88(x14)
                  lw  x23, 92(x14)
                  lw  x24, 96(x14)
                  lw  x25, 100(x14)
                  lw  x26, 104(x14)
                  lw  x27, 108(x14)
                  lw  x28, 112(x14)
                  lw  x29, 116(x14)
                  lw  x30, 120(x14)
                  lw  x31, 124(x14)
                  addi x14, x14, 124
                  mret;

kernel_instr_end: nop
.section .kernel_stack,"aw",@progbits;
.align 2
kernel_stack_start:
.rept 3999
.4byte 0x0
.endr
kernel_stack_end:
.4byte 0x0
