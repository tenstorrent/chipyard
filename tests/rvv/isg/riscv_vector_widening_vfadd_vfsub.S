.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x19, 0x40201123
                  csrw 0x301, x19
                  csrr x31, 0x301
kernel_sp:        
                  la x22, kernel_stack_end

trap_vec_init:    
                  la x19, mtvec_handler
                  ori x19, x19, 1

mepc_setup:       
                  la x19, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x99efe22c
                  li x1, 0xb4c8487
                  li x2, 0x80000000
                  li x3, 0x204d2c36
                  li x4, 0xf175981c
                  li x5, 0x7cb1c4e5
                  li x6, 0x80000000
                  li x7, 0x80000000
                  li x8, 0xf6efbe96
                  li x9, 0x3630380e
                  li x10, 0x8deef466
                  li x11, 0x80000000
                  li x12, 0x80000000
                  li x13, 0xf1f96292
                  li x14, 0x80000000
                  li x15, 0x818bbcc
                  li x16, 0xf5924408
                  li x17, 0xfbcec37e
                  li x18, 0x44f352b4
                  li x19, 0xf10e0f80
                  li x20, 0xf9419d77
                  li x21, 0x80000000
                  li x23, 0x790c07c8
                  li x25, 0xfe3feea6
                  li x26, 0x80000000
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0xfc279aba
                  li x30, 0x4d2eeafa
                  li x31, 0xf289a9ff
                  la x24, user_stack_end
                  csrwi vxsat, 1
                  csrwi vxrm, 0
li x27, 4
                  vsetvli x19, x27, e32, m1
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
                  li x19, 0x266ef3e0
                  vslide1up.vx v0, v1, x19
                  vmv.v.v v0, v0
                  li x19, 0x5533ae77
                  vslide1up.vx v0, v1, x19
                  vmv.v.v v0, v0
                  li x19, 0xcc30134e
                  vslide1up.vx v0, v1, x19
                  vmv.v.v v0, v0
                  li x19, 0xb27ed7bb
                  vslide1up.vx v0, v1, x19
                  li x19, 0x405dd922
                  vslide1up.vx v1, v0, x19
                  vmv.v.v v0, v1
                  li x19, 0xf95e8d4d
                  vslide1up.vx v1, v0, x19
                  vmv.v.v v0, v1
                  li x19, 0xce96792b
                  vslide1up.vx v1, v0, x19
                  vmv.v.v v0, v1
                  li x19, 0xfc7fa587
                  vslide1up.vx v1, v0, x19
                  li x19, 0xf66978a8
                  vslide1up.vx v2, v0, x19
                  vmv.v.v v0, v2
                  li x19, 0x2ade69ee
                  vslide1up.vx v2, v0, x19
                  vmv.v.v v0, v2
                  li x19, 0x4ba16e02
                  vslide1up.vx v2, v0, x19
                  vmv.v.v v0, v2
                  li x19, 0xdd4f9b6d
                  vslide1up.vx v2, v0, x19
                  li x19, 0xbc364f38
                  vslide1up.vx v3, v0, x19
                  vmv.v.v v0, v3
                  li x19, 0x87da334c
                  vslide1up.vx v3, v0, x19
                  vmv.v.v v0, v3
                  li x19, 0xb9c3791f
                  vslide1up.vx v3, v0, x19
                  vmv.v.v v0, v3
                  li x19, 0x11e7ba09
                  vslide1up.vx v3, v0, x19
                  li x19, 0xdf5c2165
                  vslide1up.vx v4, v0, x19
                  vmv.v.v v0, v4
                  li x19, 0xd446630c
                  vslide1up.vx v4, v0, x19
                  vmv.v.v v0, v4
                  li x19, 0xd5618633
                  vslide1up.vx v4, v0, x19
                  vmv.v.v v0, v4
                  li x19, 0x7c5bb69c
                  vslide1up.vx v4, v0, x19
                  li x19, 0xc91a25a2
                  vslide1up.vx v5, v0, x19
                  vmv.v.v v0, v5
                  li x19, 0x977397b6
                  vslide1up.vx v5, v0, x19
                  vmv.v.v v0, v5
                  li x19, 0xe330dffb
                  vslide1up.vx v5, v0, x19
                  vmv.v.v v0, v5
                  li x19, 0x33db067
                  vslide1up.vx v5, v0, x19
                  li x19, 0xa399f47e
                  vslide1up.vx v6, v0, x19
                  vmv.v.v v0, v6
                  li x19, 0x7b5933d7
                  vslide1up.vx v6, v0, x19
                  vmv.v.v v0, v6
                  li x19, 0x83705abe
                  vslide1up.vx v6, v0, x19
                  vmv.v.v v0, v6
                  li x19, 0xb4a2bb70
                  vslide1up.vx v6, v0, x19
                  li x19, 0x1381ebba
                  vslide1up.vx v7, v0, x19
                  vmv.v.v v0, v7
                  li x19, 0x5c18ecd0
                  vslide1up.vx v7, v0, x19
                  vmv.v.v v0, v7
                  li x19, 0xcae06ba8
                  vslide1up.vx v7, v0, x19
                  vmv.v.v v0, v7
                  li x19, 0xac6f48e3
                  vslide1up.vx v7, v0, x19
                  li x19, 0xec47a975
                  vslide1up.vx v8, v0, x19
                  vmv.v.v v0, v8
                  li x19, 0xf14d31f5
                  vslide1up.vx v8, v0, x19
                  vmv.v.v v0, v8
                  li x19, 0x21fe4d00
                  vslide1up.vx v8, v0, x19
                  vmv.v.v v0, v8
                  li x19, 0x9c47d371
                  vslide1up.vx v8, v0, x19
                  li x19, 0xaaf65fdf
                  vslide1up.vx v9, v0, x19
                  vmv.v.v v0, v9
                  li x19, 0xb51c2416
                  vslide1up.vx v9, v0, x19
                  vmv.v.v v0, v9
                  li x19, 0x1be5ecf0
                  vslide1up.vx v9, v0, x19
                  vmv.v.v v0, v9
                  li x19, 0x130aa33b
                  vslide1up.vx v9, v0, x19
                  li x19, 0xeae46c50
                  vslide1up.vx v10, v0, x19
                  vmv.v.v v0, v10
                  li x19, 0xb2777603
                  vslide1up.vx v10, v0, x19
                  vmv.v.v v0, v10
                  li x19, 0x5e17826
                  vslide1up.vx v10, v0, x19
                  vmv.v.v v0, v10
                  li x19, 0xd2684167
                  vslide1up.vx v10, v0, x19
                  li x19, 0xfee49100
                  vslide1up.vx v11, v0, x19
                  vmv.v.v v0, v11
                  li x19, 0x64be7b4c
                  vslide1up.vx v11, v0, x19
                  vmv.v.v v0, v11
                  li x19, 0x89c137b3
                  vslide1up.vx v11, v0, x19
                  vmv.v.v v0, v11
                  li x19, 0x55a605ca
                  vslide1up.vx v11, v0, x19
                  li x19, 0xc9a995f
                  vslide1up.vx v12, v0, x19
                  vmv.v.v v0, v12
                  li x19, 0x177c74d
                  vslide1up.vx v12, v0, x19
                  vmv.v.v v0, v12
                  li x19, 0x9c5fac10
                  vslide1up.vx v12, v0, x19
                  vmv.v.v v0, v12
                  li x19, 0xda558a39
                  vslide1up.vx v12, v0, x19
                  li x19, 0xc3cd4937
                  vslide1up.vx v13, v0, x19
                  vmv.v.v v0, v13
                  li x19, 0xad1e58f1
                  vslide1up.vx v13, v0, x19
                  vmv.v.v v0, v13
                  li x19, 0xb80bedd7
                  vslide1up.vx v13, v0, x19
                  vmv.v.v v0, v13
                  li x19, 0x7e4f3989
                  vslide1up.vx v13, v0, x19
                  li x19, 0x20778ba
                  vslide1up.vx v14, v0, x19
                  vmv.v.v v0, v14
                  li x19, 0xe2f25c8c
                  vslide1up.vx v14, v0, x19
                  vmv.v.v v0, v14
                  li x19, 0x2b2a09c0
                  vslide1up.vx v14, v0, x19
                  vmv.v.v v0, v14
                  li x19, 0x6002b998
                  vslide1up.vx v14, v0, x19
                  li x19, 0x8719df6f
                  vslide1up.vx v15, v0, x19
                  vmv.v.v v0, v15
                  li x19, 0x9dc24563
                  vslide1up.vx v15, v0, x19
                  vmv.v.v v0, v15
                  li x19, 0xab0cd689
                  vslide1up.vx v15, v0, x19
                  vmv.v.v v0, v15
                  li x19, 0x573b5095
                  vslide1up.vx v15, v0, x19
                  li x19, 0x3617ccde
                  vslide1up.vx v16, v0, x19
                  vmv.v.v v0, v16
                  li x19, 0x496623a0
                  vslide1up.vx v16, v0, x19
                  vmv.v.v v0, v16
                  li x19, 0xf402cfc6
                  vslide1up.vx v16, v0, x19
                  vmv.v.v v0, v16
                  li x19, 0xda0548c4
                  vslide1up.vx v16, v0, x19
                  li x19, 0x13b9e574
                  vslide1up.vx v17, v0, x19
                  vmv.v.v v0, v17
                  li x19, 0x5a6058ad
                  vslide1up.vx v17, v0, x19
                  vmv.v.v v0, v17
                  li x19, 0x20ba2d68
                  vslide1up.vx v17, v0, x19
                  vmv.v.v v0, v17
                  li x19, 0xf1d3c070
                  vslide1up.vx v17, v0, x19
                  li x19, 0x1f334103
                  vslide1up.vx v18, v0, x19
                  vmv.v.v v0, v18
                  li x19, 0x10e53989
                  vslide1up.vx v18, v0, x19
                  vmv.v.v v0, v18
                  li x19, 0x4ddaafe
                  vslide1up.vx v18, v0, x19
                  vmv.v.v v0, v18
                  li x19, 0x20a790bc
                  vslide1up.vx v18, v0, x19
                  li x19, 0xf65361eb
                  vslide1up.vx v19, v0, x19
                  vmv.v.v v0, v19
                  li x19, 0xe37eb6bd
                  vslide1up.vx v19, v0, x19
                  vmv.v.v v0, v19
                  li x19, 0xf5afd302
                  vslide1up.vx v19, v0, x19
                  vmv.v.v v0, v19
                  li x19, 0xffb1e2e2
                  vslide1up.vx v19, v0, x19
                  li x19, 0x8ee17465
                  vslide1up.vx v20, v0, x19
                  vmv.v.v v0, v20
                  li x19, 0x287c91a2
                  vslide1up.vx v20, v0, x19
                  vmv.v.v v0, v20
                  li x19, 0xa843a3a2
                  vslide1up.vx v20, v0, x19
                  vmv.v.v v0, v20
                  li x19, 0x43c2709c
                  vslide1up.vx v20, v0, x19
                  li x19, 0xee8d2e76
                  vslide1up.vx v21, v0, x19
                  vmv.v.v v0, v21
                  li x19, 0x93d5a8e3
                  vslide1up.vx v21, v0, x19
                  vmv.v.v v0, v21
                  li x19, 0xca00fd11
                  vslide1up.vx v21, v0, x19
                  vmv.v.v v0, v21
                  li x19, 0xa18e4714
                  vslide1up.vx v21, v0, x19
                  li x19, 0xadb6fc59
                  vslide1up.vx v22, v0, x19
                  vmv.v.v v0, v22
                  li x19, 0x38e761f3
                  vslide1up.vx v22, v0, x19
                  vmv.v.v v0, v22
                  li x19, 0x6c622d85
                  vslide1up.vx v22, v0, x19
                  vmv.v.v v0, v22
                  li x19, 0xe00c3778
                  vslide1up.vx v22, v0, x19
                  li x19, 0x5ed8c9c0
                  vslide1up.vx v23, v0, x19
                  vmv.v.v v0, v23
                  li x19, 0x1d8e40e3
                  vslide1up.vx v23, v0, x19
                  vmv.v.v v0, v23
                  li x19, 0x1c08620a
                  vslide1up.vx v23, v0, x19
                  vmv.v.v v0, v23
                  li x19, 0x3211f6f2
                  vslide1up.vx v23, v0, x19
                  li x19, 0x51e88044
                  vslide1up.vx v24, v0, x19
                  vmv.v.v v0, v24
                  li x19, 0xdd72d6b4
                  vslide1up.vx v24, v0, x19
                  vmv.v.v v0, v24
                  li x19, 0x3b088875
                  vslide1up.vx v24, v0, x19
                  vmv.v.v v0, v24
                  li x19, 0xb5f297e2
                  vslide1up.vx v24, v0, x19
                  li x19, 0xa9d2797d
                  vslide1up.vx v25, v0, x19
                  vmv.v.v v0, v25
                  li x19, 0x6d4f1f92
                  vslide1up.vx v25, v0, x19
                  vmv.v.v v0, v25
                  li x19, 0x403d23a6
                  vslide1up.vx v25, v0, x19
                  vmv.v.v v0, v25
                  li x19, 0xf325248b
                  vslide1up.vx v25, v0, x19
                  li x19, 0xc186e112
                  vslide1up.vx v26, v0, x19
                  vmv.v.v v0, v26
                  li x19, 0xba86b48f
                  vslide1up.vx v26, v0, x19
                  vmv.v.v v0, v26
                  li x19, 0xd9649de3
                  vslide1up.vx v26, v0, x19
                  vmv.v.v v0, v26
                  li x19, 0x937c1f80
                  vslide1up.vx v26, v0, x19
                  li x19, 0x147d320f
                  vslide1up.vx v27, v0, x19
                  vmv.v.v v0, v27
                  li x19, 0x5a031b14
                  vslide1up.vx v27, v0, x19
                  vmv.v.v v0, v27
                  li x19, 0x484760a
                  vslide1up.vx v27, v0, x19
                  vmv.v.v v0, v27
                  li x19, 0xa880428f
                  vslide1up.vx v27, v0, x19
                  li x19, 0x2e4dbc66
                  vslide1up.vx v28, v0, x19
                  vmv.v.v v0, v28
                  li x19, 0x36bcbde6
                  vslide1up.vx v28, v0, x19
                  vmv.v.v v0, v28
                  li x19, 0xd0f1088c
                  vslide1up.vx v28, v0, x19
                  vmv.v.v v0, v28
                  li x19, 0x340b754c
                  vslide1up.vx v28, v0, x19
                  li x19, 0xdb6b1733
                  vslide1up.vx v29, v0, x19
                  vmv.v.v v0, v29
                  li x19, 0x5ee7b50
                  vslide1up.vx v29, v0, x19
                  vmv.v.v v0, v29
                  li x19, 0xa6385f21
                  vslide1up.vx v29, v0, x19
                  vmv.v.v v0, v29
                  li x19, 0x840eb22d
                  vslide1up.vx v29, v0, x19
                  li x19, 0x51921f53
                  vslide1up.vx v30, v0, x19
                  vmv.v.v v0, v30
                  li x19, 0x92087339
                  vslide1up.vx v30, v0, x19
                  vmv.v.v v0, v30
                  li x19, 0x127c10ec
                  vslide1up.vx v30, v0, x19
                  vmv.v.v v0, v30
                  li x19, 0x4a295a9d
                  vslide1up.vx v30, v0, x19
                  li x19, 0xb6f40d9f
                  vslide1up.vx v31, v0, x19
                  vmv.v.v v0, v31
                  li x19, 0x3d67ca42
                  vslide1up.vx v31, v0, x19
                  vmv.v.v v0, v31
                  li x19, 0xa60683c8
                  vslide1up.vx v31, v0, x19
                  vmv.v.v v0, v31
                  li x19, 0x1cd7e30b
                  vslide1up.vx v31, v0, x19
li x27, 4
                  vsetvli x19, x27, e16, m1
main:             sltiu      s1, t1, -744
                  slt        s1, t2, a7
                  xori       ra, a2, -228
                  or         s3, a4, a1
                  mulh       t5, s10, s0
                  lui        s9, 195562
                  div        a5, s3, s0
                  slti       a3, a0, 24
                  vfwadd.vf   v12,v8,ft3,v0.t
                  and        t2, s5, tp
                  remu       s2, s0, sp
                  ori        t3, a4, 380
                  add        a0, s0, zero
                  srli       s7, a0, 19
                  srl        t2, ra, s4
                  addi       s2, s6, 611
                  divu       s7, gp, s7
                  slti       s9, zero, 91
                  xori       t6, s5, 605
                  auipc      a4, 78336
                  slt        s0, s0, t0
                  ori        s4, ra, -704
                  or         zero, s6, s1
                  mulhu      s3, t4, a5
                  divu       a3, s8, a6
                  mulhu      ra, s5, t4
                  andi       a0, s2, 322
                  and        t4, t6, t6
                  srl        t2, s2, t6
                  divu       s4, t5, s10
                  mulh       a7, t3, s0
                  mulhsu     t6, t6, t3
                  addi       sp, a5, 542
                  sra        s1, a4, t5
                  srl        t1, gp, s5
                  xor        t0, a2, a3
                  slt        a0, s8, tp
                  slt        s2, s5, s10
                  xor        t5, s11, a1
                  auipc      ra, 677327
                  remu       s11, s5, a0
                  xor        ra, s4, tp
                  vfwsub.vf   v12,v10,ft9,v0.t
                  lui        gp, 381350
                  mul        t3, t6, a2
                  div        s9, t3, a7
                  divu       s9, a7, t1
                  or         t5, ra, t2
                  lui        s4, 389718
                  sltu       a0, s1, t2
                  slt        gp, s9, s5
                  xor        t4, a2, gp
                  sub        s3, s1, s5
                  mul        a7, ra, zero
                  srl        t1, a3, s8
                  mulh       a0, s2, a7
                  and        a4, s1, a3
                  lui        a1, 718668
                  mulh       t0, s4, zero
                  auipc      a2, 102531
                  or         ra, a4, s11
                  slt        sp, a3, s3
                  slli       ra, a4, 3
                  srai       t0, s3, 7
                  slt        zero, s11, zero
                  srli       t0, gp, 2
                  sll        a7, s8, t3
                  vfwsub.vv   v18,v24,v4
                  xor        a4, a3, a7
                  divu       t0, t3, zero
                  andi       s2, a2, -963
                  srli       a5, zero, 8
                  sltu       s2, a5, a4
                  rem        s0, t0, tp
                  addi       t2, a4, 246
                  mul        a0, t3, s3
                  srl        s9, a1, s6
                  vfwadd.vv   v20,v14,v31,v0.t
                  mulh       a2, zero, a4
                  mul        a6, s10, a4
                  andi       s2, a0, 113
                  srli       a2, s6, 27
                  and        s2, a3, s1
                  slti       t3, ra, 210
                  xor        a2, s0, s9
                  sra        a7, t5, s2
                  remu       ra, s8, s6
                  rem        a3, t6, t1
                  rem        ra, s8, s6
                  add        s3, a6, s3
                  ori        gp, s2, -364
                  srl        t5, s7, a4
                  xor        ra, zero, ra
                  or         s11, s1, s9
                  mulhsu     t4, t6, tp
                  or         t5, a2, t2
                  srai       zero, t5, 20
                  andi       t4, a2, 614
                  xori       s9, s8, -393
                  sub        ra, s11, t6
                  mulhsu     t1, zero, t4
                  slli       a2, a2, 18
                  divu       s2, a1, sp
                  addi       a7, t5, 347
                  sltiu      sp, t2, 263
                  rem        gp, a1, t1
                  vfwsub.vv   v18,v12,v1,v0.t
                  srai       ra, t3, 26
                  andi       s4, a1, 846
                  rem        ra, a3, zero
                  lui        ra, 1000250
                  srai       t5, s11, 5
                  sub        a0, sp, s11
                  divu       s9, t0, ra
                  add        s10, a5, sp
                  add        sp, a0, zero
                  slli       tp, s6, 3
                  sltiu      s0, t6, 291
                  sltiu      s4, a1, -254
                  mulh       a2, ra, t5
                  mulhsu     s9, a7, s2
                  divu       s3, ra, a6
                  div        a2, tp, s6
                  divu       s4, a2, s10
                  and        t5, t0, a2
                  remu       sp, s6, s10
                  andi       a5, ra, -810
                  slti       s3, a5, -501
                  lui        s10, 985865
                  mul        sp, s11, t3
                  vfwadd.vv   v30,v2,v18,v0.t
                  srai       a6, s8, 18
                  div        s10, sp, a2
                  lui        t3, 942678
                  sll        t4, s10, a0
                  sra        a3, sp, s11
                  ori        t4, a2, -650
                  mulh       sp, s10, s1
                  sll        a6, s9, s6
                  div        a6, zero, a4
                  andi       a2, a6, 613
                  srli       a7, zero, 8
                  slti       s10, s11, -255
                  slli       a2, t5, 28
                  divu       a3, s10, t6
                  lui        s1, 1011770
                  mulh       sp, t3, ra
                  and        sp, s7, a2
                  xor        s2, s11, s4
                  auipc      sp, 943864
                  remu       s0, t6, s6
                  vfwsub.vf   v2,v27,fs11
                  andi       t5, t2, -1002
                  remu       a0, t2, t5
                  vfwsub.vv   v16,v29,v19
                  div        t0, t4, a4
                  xor        t4, t4, s4
                  sra        t6, a1, a4
                  divu       s10, t3, a4
                  addi       a2, t0, 752
                  vfwadd.vf   v18,v1,fs4,v0.t
                  slt        tp, s9, t0
                  ori        t2, t2, 88
                  slti       a3, s3, 99
                  ori        a6, t2, 59
                  sub        ra, s2, zero
                  xori       t2, a4, -522
                  mulhsu     a1, s1, t0
                  sltiu      s3, a7, 925
                  div        s4, t3, t3
                  srli       ra, t6, 6
                  sll        zero, t6, ra
                  sll        s4, s0, s9
                  mulh       s10, tp, a0
                  auipc      s9, 915356
                  remu       ra, s10, a3
                  ori        t2, t5, 888
                  srai       a3, ra, 27
                  mulhu      s4, a2, t5
                  vfwsub.vv   v22,v3,v7
                  addi       sp, t2, -236
                  srli       a1, t2, 22
                  and        a2, s4, s5
                  slli       gp, t3, 20
                  mulhsu     s1, t4, tp
                  add        sp, s8, s0
                  addi       zero, t5, -902
                  div        zero, s9, t5
                  or         s3, s10, s2
                  sra        t5, s7, s4
                  srli       s11, s6, 5
                  sub        s10, a5, a2
                  srai       t6, s7, 5
                  xori       a5, s5, 706
                  slti       t2, t3, 585
                  srl        s3, gp, a5
                  xori       s2, ra, -319
                  mulh       t5, s8, s4
                  vfwsub.vf   v22,v29,fs7
                  rem        s3, s6, t5
                  lui        sp, 807920
                  srli       t2, s6, 20
                  sub        s0, s0, s1
                  mul        a2, s8, a7
                  mulhu      t0, t6, a6
                  vfwsub.vv   v24,v17,v19,v0.t
                  add        t1, t6, s11
                  slt        t4, ra, s8
                  lui        a7, 417716
                  remu       s2, t0, s4
                  sra        s7, t2, a0
                  ori        t5, a5, -285
                  lui        a7, 294828
                  vfwadd.vv   v14,v28,v2,v0.t
                  srli       s0, t3, 16
                  add        s0, s7, s8
                  xori       s10, t5, 818
                  vfwsub.vf   v8,v4,fa2,v0.t
                  vfwsub.vf   v4,v30,fs8
                  vfwadd.vv   v30,v11,v8,v0.t
                  ori        a0, s0, 854
                  auipc      s2, 527606
                  sub        t5, t6, t4
                  slt        s0, a6, zero
                  vfwadd.vv   v26,v6,v0
                  auipc      a3, 4877
                  vfwsub.vv   v8,v13,v2,v0.t
                  andi       s3, a2, 970
                  vfwsub.vf   v8,v20,fa4
                  sltu       t2, s3, t3
                  mulh       ra, tp, gp
                  divu       ra, a2, s1
                  auipc      s0, 105758
                  mulh       s4, gp, a3
                  lui        ra, 645936
                  sra        gp, t1, tp
                  mul        s2, s2, s9
                  mulhsu     s3, a6, s5
                  mul        sp, a4, s9
                  mulhsu     t1, a3, a5
                  xor        s10, a0, tp
                  vfwadd.vv   v20,v15,v31,v0.t
                  mulhu      s7, s5, a0
                  sll        a1, s4, sp
                  rem        tp, t0, a1
                  lui        a2, 283931
                  rem        s1, t5, s5
                  div        s7, t2, s0
                  mulhsu     t2, t1, s3
                  divu       t4, s2, a3
                  sra        t6, a2, t6
                  xor        s11, s8, a5
                  mulhsu     t0, s1, s0
                  vfwsub.vf   v24,v20,fa5
                  mul        s10, s2, a4
                  divu       zero, sp, t3
                  srl        a1, t4, s11
                  andi       t0, s3, -547
                  vfwsub.vv   v18,v25,v2
                  and        t5, s10, s2
                  divu       a1, sp, s2
                  or         s10, s2, s8
                  slli       a4, a5, 0
                  div        t0, t5, ra
                  mulh       sp, t0, a7
                  xori       a7, s5, -646
                  slt        sp, ra, a0
                  xori       a4, a4, 315
                  vfwsub.vv   v22,v6,v18,v0.t
                  sll        a0, a3, t1
                  sra        s7, t0, s11
                  mulhu      t4, a5, t6
                  mulhsu     s4, gp, t5
                  srai       s11, a7, 26
                  auipc      t0, 213829
                  lui        s2, 645185
                  srli       gp, sp, 18
                  mulhu      t2, a5, s6
                  sll        sp, s5, s10
                  andi       s11, s10, 754
                  sra        a3, t6, sp
                  srl        a6, t5, s10
                  div        a3, s4, sp
                  xori       s10, t0, -23
                  xor        tp, s4, a1
                  mul        t4, s3, ra
                  div        sp, t5, t3
                  divu       t2, a1, s10
                  mulhu      s3, t6, sp
                  add        a1, s0, s7
                  lui        a4, 578569
                  div        a4, ra, t1
                  remu       s0, gp, s10
                  sltu       a4, zero, ra
                  srli       sp, s6, 24
                  sll        s11, a5, s0
                  slti       t0, s4, 834
                  xori       gp, gp, 275
                  srli       a3, ra, 24
                  mulhsu     s2, s4, s3
                  sltiu      t4, gp, 542
                  sltu       t5, s4, s11
                  mulhu      s7, a7, s3
                  slli       sp, a7, 9
                  sub        t4, ra, a1
                  lui        s3, 449337
                  sltiu      s2, s3, -275
                  srl        a0, a1, zero
                  auipc      a7, 447278
                  mulh       s1, t6, a2
                  ori        s3, s6, 890
                  rem        s0, a0, t5
                  srli       s9, s10, 9
                  vfwsub.vv   v18,v15,v31,v0.t
                  rem        gp, s3, gp
                  slt        tp, t1, zero
                  auipc      a2, 259729
                  add        gp, s8, s9
                  mulhu      s7, a6, t3
                  sltu       t5, zero, a0
                  sltiu      a2, s4, -736
                  remu       a6, gp, s7
                  mul        t0, a7, s10
                  vfwsub.vv   v14,v11,v1
                  or         s4, s9, t4
                  mulhsu     s4, ra, t0
                  mulh       t5, s5, s1
                  div        s3, a2, s8
                  sll        t4, t2, s4
                  mulh       a4, gp, s7
                  divu       s9, s2, a5
                  addi       tp, s11, -1004
                  sltu       a6, ra, s6
                  sll        s1, a5, s8
                  addi       a2, s9, 743
                  mulhsu     a6, s6, t0
                  vfwsub.vf   v12,v22,fs11
                  or         t3, t2, a4
                  andi       s1, sp, 519
                  or         zero, a4, s6
                  rem        t0, a5, s10
                  and        s9, a2, a5
                  rem        gp, t1, a4
                  sra        s0, a7, t4
                  slti       t0, s9, 742
                  divu       s10, a0, s0
                  slt        s0, s7, t4
                  divu       ra, a6, t3
                  slti       t0, a7, -135
                  remu       zero, t6, s5
                  slli       s1, s9, 7
                  sltu       ra, s7, t5
                  add        t5, tp, a6
                  or         s9, s4, a1
                  remu       t1, gp, zero
                  sltu       s7, t3, a1
                  sltiu      gp, s2, 567
                  vfwadd.vf   v2,v19,fa3
                  vfwadd.wf   v2,v20,fa3
                  auipc      t2, 312095
                  xor        s0, gp, s3
                  or         t3, a3, s2
                  remu       t4, a7, a6
                  sub        s10, gp, gp
                  sll        t0, t6, s8
                  vfwadd.vv   v14,v1,v18
                  vfwadd.wv   v14,v2,v18
                  auipc      t4, 783142
                  auipc      t4, 697675
                  auipc      a0, 1037075
                  sll        ra, a3, s1
                  srli       a3, zero, 14
                  auipc      s2, 1031271
                  auipc      t2, 745713
                  sra        s1, s4, a2
                  slli       s1, s1, 0
                  mul        ra, s6, gp
                  slli       s0, s5, 5
                  ori        a6, s7, 529
                  mul        s2, s6, sp
                  sltu       a4, a7, s1
                  sltu       s7, t4, s1
                  div        s9, s7, a5
                  rem        s1, s6, t2
                  mulhsu     s7, a6, t3
                  mulhu      s1, tp, t3
                  andi       s4, t2, -527
                  auipc      s3, 260362
                  srai       s10, zero, 9
                  slt        a0, t5, s2
                  addi       gp, s11, 423
                  divu       t6, a3, s6
                  sra        t0, t3, t1
                  sll        a0, a5, t6
                  andi       s1, s4, -831
                  slli       a0, t1, 28
                  vfwsub.vf   v2,v24,fs9,v0.t
                  vfwsub.wf   v2,v24,fs9,v0.t
                  sltiu      a7, s11, -330
                  slt        t0, t3, a7
                  and        s7, s2, s7
                  srai       s7, a6, 11
                  srl        s3, s5, t1
                  remu       sp, a1, s5
                  srai       a5, s9, 23
                  sltu       s4, s1, a5
                  andi       t6, s10, -146
                  and        t2, t6, s3
                  div        t6, a4, s9
                  vfwadd.vv   v8,v25,v17,v0.t
                  srli       gp, a4, 24
                  sll        ra, s7, ra
                  divu       tp, a7, s8
                  add        s11, s0, t0
                  mulh       a5, t4, t0
                  divu       s3, a3, tp
                  srli       a7, t3, 12
                  ori        ra, a4, 498
                  slt        s0, gp, a2
                  rem        a1, s8, tp
                  slli       ra, tp, 12
                  remu       s9, gp, a7
                  sltu       t5, t6, a7
                  addi       t0, gp, -690
                  srai       s1, t6, 5
                  slli       zero, s7, 29
                  xori       s3, s9, 807
                  divu       s2, a6, t0
                  ori        a2, s3, -435
                  add        sp, s5, s7
                  slt        zero, s7, t4
                  vfwadd.vv   v14,v17,v19
                  lui        t3, 511591
                  sra        zero, zero, a5
                  srli       a0, s11, 2
                  div        t4, s2, a6
                  sltu       a2, s11, gp
                  slti       a6, zero, 146
                  remu       s7, s6, t2
                  vfwadd.vf   v6,v3,ft9
                  and        a1, s3, s1
                  sltiu      a7, ra, 751
                  sltu       a1, s0, zero
                  sltiu      t4, a1, 843
                  add        t4, t1, s8
                  addi       t6, t3, -1017
                  rem        a1, t0, s7
                  andi       a0, s4, -497
                  xor        t6, s7, s0
                  auipc      t1, 56451
                  sub        s11, t4, a0
                  sltiu      a2, a2, -938
                  slli       a6, gp, 25
                  srl        t6, s9, s1
                  vfwadd.vv   v6,v17,v26
                  addi       t1, s6, -40
                  xori       s9, a1, -88
                  addi       s7, s6, -622
                  addi       a1, ra, -249
                  rem        a1, t2, s9
                  remu       s1, a3, t5
                  xor        a0, s4, a1
                  rem        t1, t6, tp
                  xor        s3, a6, t6
                  sltu       s3, t3, t1
                  sll        t0, a2, a5
                  vfwadd.vf   v14,v26,ft6
                  vfwsub.vv   v26,v21,v24,v0.t
                  vfwsub.wv   v26,v20,v24,v0.t
                  slli       t3, sp, 30
                  sub        s10, a0, s0
                  sra        a4, a0, s8
                  remu       gp, s9, a5
                  rem        s1, s3, s9
                  andi       s1, s8, -21
                  remu       a1, gp, s3
                  mulh       a0, s11, s6
                  andi       zero, tp, -57
                  srli       t6, s0, 24
                  ori        tp, a6, -997
                  mul        s4, s9, a1
                  srl        ra, a0, t0
                  mul        t6, a0, a4
                  mul        gp, t6, tp
                  lui        a2, 51541
                  sltu       a1, a0, s6
                  slti       s1, s3, -793
                  sub        s2, a6, t4
                  slt        t1, s6, a5
                  ori        t6, s9, 352
                  sub        s3, t5, s2
                  auipc      t0, 143688
                  vfwsub.vv   v18,v22,v26
                  div        a4, a7, t4
                  slli       a6, t4, 7
                  slti       ra, a6, 889
                  addi       s0, a5, 331
                  sltiu      s9, a7, 310
                  slt        tp, sp, t0
                  auipc      t4, 912791
                  xor        a5, a4, sp
                  srai       zero, tp, 8
                  add        s7, a7, s7
                  xor        a6, zero, s4
                  la x21, test_done
                  jalr x0, x21, 0
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
                  1: addi x24, x24, -124
                  sw  x1, 4(x24)
                  sw  x2, 8(x24)
                  sw  x3, 12(x24)
                  sw  x4, 16(x24)
                  sw  x5, 20(x24)
                  sw  x6, 24(x24)
                  sw  x7, 28(x24)
                  sw  x8, 32(x24)
                  sw  x9, 36(x24)
                  sw  x10, 40(x24)
                  sw  x11, 44(x24)
                  sw  x12, 48(x24)
                  sw  x13, 52(x24)
                  sw  x14, 56(x24)
                  sw  x15, 60(x24)
                  sw  x16, 64(x24)
                  sw  x17, 68(x24)
                  sw  x18, 72(x24)
                  sw  x19, 76(x24)
                  sw  x20, 80(x24)
                  sw  x21, 84(x24)
                  sw  x22, 88(x24)
                  sw  x23, 92(x24)
                  sw  x24, 96(x24)
                  sw  x25, 100(x24)
                  sw  x26, 104(x24)
                  sw  x27, 108(x24)
                  sw  x28, 112(x24)
                  sw  x29, 116(x24)
                  sw  x30, 120(x24)
                  sw  x31, 124(x24)
                  csrr x19, 0x341 # MEPC
                  csrr x19, 0x342 # MCAUSE
                  li x27, 0x3 # BREAKPOINT
                  beq x19, x27, ebreak_handler
                  li x27, 0x8 # ECALL_UMODE
                  beq x19, x27, ecall_handler
                  li x27, 0x9 # ECALL_SMODE
                  beq x19, x27, ecall_handler
                  li x27, 0xb # ECALL_MMODE
                  beq x19, x27, ecall_handler
                  li x27, 0x1
                  beq x19, x27, instr_fault_handler
                  li x27, 0x5
                  beq x19, x27, load_fault_handler
                  li x27, 0x7
                  beq x19, x27, store_fault_handler
                  li x27, 0xc
                  beq x19, x27, pt_fault_handler
                  li x27, 0xd
                  beq x19, x27, pt_fault_handler
                  li x27, 0xf
                  beq x19, x27, pt_fault_handler
                  li x27, 0x2 # ILLEGAL_INSTRUCTION
                  beq x19, x27, illegal_instr_handler
                  csrr x27, 0x343 # MTVAL
                  1: la x21, test_done
                  jalr x1, x21, 0

ecall_handler:    
                  la x19, _start
                  sw x0, 0(x19)
                  sw x1, 4(x19)
                  sw x2, 8(x19)
                  sw x3, 12(x19)
                  sw x4, 16(x19)
                  sw x5, 20(x19)
                  sw x6, 24(x19)
                  sw x7, 28(x19)
                  sw x8, 32(x19)
                  sw x9, 36(x19)
                  sw x10, 40(x19)
                  sw x11, 44(x19)
                  sw x12, 48(x19)
                  sw x13, 52(x19)
                  sw x14, 56(x19)
                  sw x15, 60(x19)
                  sw x16, 64(x19)
                  sw x17, 68(x19)
                  sw x18, 72(x19)
                  sw x19, 76(x19)
                  sw x20, 80(x19)
                  sw x21, 84(x19)
                  sw x22, 88(x19)
                  sw x23, 92(x19)
                  sw x24, 96(x19)
                  sw x25, 100(x19)
                  sw x26, 104(x19)
                  sw x27, 108(x19)
                  sw x28, 112(x19)
                  sw x29, 116(x19)
                  sw x30, 120(x19)
                  sw x31, 124(x19)
                  la x21, write_tohost
                  jalr x0, x21, 0

instr_fault_handler:
                  li x19, 0
                  csrw 0x340, x19
                  li x2, 0
                  0: csrr x19, 0x340
                  mv x21, x19
                  li x21, 0
                  beq x19, x21, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x19, 0x340
                  slli x19, x19, 30
                  srli x19, x19, 30
                  sub x21, x23, x19
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x23, x5, x21
                  slli x19, x19, 3
                  add x21, x21, x19
                  srl x23, x23, x21
                  slli x21, x23, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x19, 1
                  beq x21, x19, 21f
                  li x19, 2
                  beq x21, x19, 25f
                  li x19, 3
                  beq x21, x19, 27f
                  la x19, test_done
                  jalr x0, x19, 0
                  18: csrr x19, 0x340
                  mv x2, x27
                  addi x19, x19, 1
                  csrw 0x340, x19
                  li x27, 1
                  ble x27, x19, 19f
                  j 0b
                  19: la x19, test_done
                  jalr x0, x19, 0
                  20: j 18b
                  21: csrr x19, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x19, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x2, x21, 18b
                  23: bleu x27, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 24f
                  la x19, test_done
                  jalr x0, x19, 0
                  24: j 29f
                  25: csrr x19, 0x343
                  srli x19, x19, 2
                  slli x21, x27, 2
                  srli x21, x21, 2
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 26f
                  la x19, test_done
                  jalr x0, x19, 0
                  26: j 29f
                  27: csrr x19, 0x343
                  srli x19, x19, 2
                  srli x19, x19, 0
                  slli x19, x19, 0
                  slli x21, x27, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 29f
                  la x19, test_done
                  jalr x0, x19, 0
                  28: j 29f
                  29: ori x23, x23, 4
                  csrr x19, 0x340
                  li x21, 30
                  sll x19, x19, x21
                  srl x19, x19, x21
                  slli x21, x19, 3
                  sll x23, x23, x21
                  or x5, x5, x23
                  csrr x19, 0x340
                  srli x19, x19, 2
                  beqz x19, 30f
                  li x21, 1
                  beq x19, x21, 31f
                  li x21, 2
                  beq x19, x21, 32f
                  li x21, 3
                  beq x19, x21, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
                  mret

load_fault_handler:
                  li x19, 0
                  csrw 0x340, x19
                  li x2, 0
                  0: csrr x19, 0x340
                  mv x21, x19
                  li x21, 0
                  beq x19, x21, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x19, 0x340
                  slli x19, x19, 30
                  srli x19, x19, 30
                  sub x21, x23, x19
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x23, x5, x21
                  slli x19, x19, 3
                  add x21, x21, x19
                  srl x23, x23, x21
                  slli x21, x23, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x19, 1
                  beq x21, x19, 21f
                  li x19, 2
                  beq x21, x19, 25f
                  li x19, 3
                  beq x21, x19, 27f
                  la x19, test_done
                  jalr x0, x19, 0
                  18: csrr x19, 0x340
                  mv x2, x27
                  addi x19, x19, 1
                  csrw 0x340, x19
                  li x27, 1
                  ble x27, x19, 19f
                  j 0b
                  19: la x19, test_done
                  jalr x0, x19, 0
                  20: j 18b
                  21: csrr x19, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x19, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x2, x21, 18b
                  23: bleu x27, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 24f
                  la x19, test_done
                  jalr x0, x19, 0
                  24: j 29f
                  25: csrr x19, 0x343
                  srli x19, x19, 2
                  slli x21, x27, 2
                  srli x21, x21, 2
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 26f
                  la x19, test_done
                  jalr x0, x19, 0
                  26: j 29f
                  27: csrr x19, 0x343
                  srli x19, x19, 2
                  srli x19, x19, 0
                  slli x19, x19, 0
                  slli x21, x27, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 29f
                  la x19, test_done
                  jalr x0, x19, 0
                  28: j 29f
                  29: ori x23, x23, 1
                  csrr x19, 0x340
                  li x21, 30
                  sll x19, x19, x21
                  srl x19, x19, x21
                  slli x21, x19, 3
                  sll x23, x23, x21
                  or x5, x5, x23
                  csrr x19, 0x340
                  srli x19, x19, 2
                  beqz x19, 30f
                  li x21, 1
                  beq x19, x21, 31f
                  li x21, 2
                  beq x19, x21, 32f
                  li x21, 3
                  beq x19, x21, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
                  mret

store_fault_handler:
                  li x19, 0
                  csrw 0x340, x19
                  li x2, 0
                  0: csrr x19, 0x340
                  mv x21, x19
                  li x21, 0
                  beq x19, x21, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x19, 0x340
                  slli x19, x19, 30
                  srli x19, x19, 30
                  sub x21, x23, x19
                  addi x21, x21, -1
                  slli x21, x21, 3
                  sll x23, x5, x21
                  slli x19, x19, 3
                  add x21, x21, x19
                  srl x23, x23, x21
                  slli x21, x23, 27
                  srli x21, x21, 30
                  beqz x21, 20f
                  li x19, 1
                  beq x21, x19, 21f
                  li x19, 2
                  beq x21, x19, 25f
                  li x19, 3
                  beq x21, x19, 27f
                  la x19, test_done
                  jalr x0, x19, 0
                  18: csrr x19, 0x340
                  mv x2, x27
                  addi x19, x19, 1
                  csrw 0x340, x19
                  li x27, 1
                  ble x27, x19, 19f
                  j 0b
                  19: la x19, test_done
                  jalr x0, x19, 0
                  20: j 18b
                  21: csrr x19, 0x340
                  csrr x21, 0x343
                  srli x21, x21, 2
                  bnez x19, 22f
                  bltz x21, 18b
                  j 23f
                  22: bgtu x2, x21, 18b
                  23: bleu x27, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 24f
                  la x19, test_done
                  jalr x0, x19, 0
                  24: j 29f
                  25: csrr x19, 0x343
                  srli x19, x19, 2
                  slli x21, x27, 2
                  srli x21, x21, 2
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 26f
                  la x19, test_done
                  jalr x0, x19, 0
                  26: j 29f
                  27: csrr x19, 0x343
                  srli x19, x19, 2
                  srli x19, x19, 0
                  slli x19, x19, 0
                  slli x21, x27, 2
                  srli x21, x21, 2
                  srli x21, x21, 0
                  slli x21, x21, 0
                  bne x19, x21, 18b
                  andi x21, x23, 128
                  beqz x21, 29f
                  la x19, test_done
                  jalr x0, x19, 0
                  28: j 29f
                  29: ori x23, x23, 3
                  csrr x19, 0x340
                  li x21, 30
                  sll x19, x19, x21
                  srl x19, x19, x21
                  slli x21, x19, 3
                  sll x23, x23, x21
                  or x5, x5, x23
                  csrr x19, 0x340
                  srli x19, x19, 2
                  beqz x19, 30f
                  li x21, 1
                  beq x19, x21, 31f
                  li x21, 2
                  beq x19, x21, 32f
                  li x21, 3
                  beq x19, x21, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
                  mret

ebreak_handler:   
                  csrr  x19, 0x341
                  addi  x19, x19, 4
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
                  mret

illegal_instr_handler:
                  csrr  x19, 0x341
                  addi  x19, x19, 4
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x19, 0x300 # MSTATUS;
                  csrr  x19, 0x304 # MIE;
                  csrr  x19, 0x344 # MIP;
                  csrrc x19, 0x344, x19 # MIP;
                  lw  x1, 4(x24)
                  lw  x2, 8(x24)
                  lw  x3, 12(x24)
                  lw  x4, 16(x24)
                  lw  x5, 20(x24)
                  lw  x6, 24(x24)
                  lw  x7, 28(x24)
                  lw  x8, 32(x24)
                  lw  x9, 36(x24)
                  lw  x10, 40(x24)
                  lw  x11, 44(x24)
                  lw  x12, 48(x24)
                  lw  x13, 52(x24)
                  lw  x14, 56(x24)
                  lw  x15, 60(x24)
                  lw  x16, 64(x24)
                  lw  x17, 68(x24)
                  lw  x18, 72(x24)
                  lw  x19, 76(x24)
                  lw  x20, 80(x24)
                  lw  x21, 84(x24)
                  lw  x22, 88(x24)
                  lw  x23, 92(x24)
                  lw  x24, 96(x24)
                  lw  x25, 100(x24)
                  lw  x26, 104(x24)
                  lw  x27, 108(x24)
                  lw  x28, 112(x24)
                  lw  x29, 116(x24)
                  lw  x30, 120(x24)
                  lw  x31, 124(x24)
                  addi x24, x24, 124
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
