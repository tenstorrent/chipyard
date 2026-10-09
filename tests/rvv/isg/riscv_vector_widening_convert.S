.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x17, 0x40201123
                  csrw 0x301, x17
                  csrr x31, 0x301
kernel_sp:        
                  la x19, kernel_stack_end

trap_vec_init:    
                  la x17, mtvec_handler
                  ori x17, x17, 1

mepc_setup:       
                  la x17, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0xa2eecf7c
                  li x1, 0x80000000
                  li x2, 0x80000000
                  li x3, 0xfec20a2f
                  li x4, 0xf793a582
                  li x5, 0xfb398524
                  li x6, 0x20a33825
                  li x7, 0x4e7c64c6
                  li x8, 0x80000000
                  li x9, 0x80000000
                  li x10, 0xf94ae346
                  li x11, 0xff1d630a
                  li x12, 0x80000000
                  li x13, 0x68b5e60e
                  li x14, 0xf2cacaf2
                  li x15, 0x80000000
                  li x16, 0xf844b797
                  li x17, 0xf932ea57
                  li x18, 0x80000000
                  li x20, 0xf9663979
                  li x21, 0xf92a7f43
                  li x22, 0x80000000
                  li x24, 0x67165422
                  li x25, 0x2a1865cb
                  li x26, 0x80000000
                  li x27, 0xf8e1ff9c
                  li x28, 0x80000000
                  li x29, 0xf16949b6
                  li x30, 0xfeca40b9
                  li x31, 0xf68e3d66
                  la x23, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x28, 4
                  vsetvli x17, x28, e32, m1
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
                  li x17, 0xb86091c
                  vslide1up.vx v0, v1, x17
                  vmv.v.v v0, v0
                  li x17, 0xe51d3479
                  vslide1up.vx v0, v1, x17
                  vmv.v.v v0, v0
                  li x17, 0x2331e526
                  vslide1up.vx v0, v1, x17
                  vmv.v.v v0, v0
                  li x17, 0x55c8a53b
                  vslide1up.vx v0, v1, x17
                  li x17, 0x6eda5e58
                  vslide1up.vx v1, v0, x17
                  vmv.v.v v0, v1
                  li x17, 0x294d8310
                  vslide1up.vx v1, v0, x17
                  vmv.v.v v0, v1
                  li x17, 0x112d019d
                  vslide1up.vx v1, v0, x17
                  vmv.v.v v0, v1
                  li x17, 0x217a4faf
                  vslide1up.vx v1, v0, x17
                  li x17, 0x6c8fcb17
                  vslide1up.vx v2, v0, x17
                  vmv.v.v v0, v2
                  li x17, 0x14c73aa5
                  vslide1up.vx v2, v0, x17
                  vmv.v.v v0, v2
                  li x17, 0xfe8c1465
                  vslide1up.vx v2, v0, x17
                  vmv.v.v v0, v2
                  li x17, 0x91495990
                  vslide1up.vx v2, v0, x17
                  li x17, 0x805b22e5
                  vslide1up.vx v3, v0, x17
                  vmv.v.v v0, v3
                  li x17, 0xa2dbc04b
                  vslide1up.vx v3, v0, x17
                  vmv.v.v v0, v3
                  li x17, 0x9b98ce8b
                  vslide1up.vx v3, v0, x17
                  vmv.v.v v0, v3
                  li x17, 0x6fe20aa0
                  vslide1up.vx v3, v0, x17
                  li x17, 0xabc89fa0
                  vslide1up.vx v4, v0, x17
                  vmv.v.v v0, v4
                  li x17, 0x171fe16e
                  vslide1up.vx v4, v0, x17
                  vmv.v.v v0, v4
                  li x17, 0x71051e2f
                  vslide1up.vx v4, v0, x17
                  vmv.v.v v0, v4
                  li x17, 0xa9043bd
                  vslide1up.vx v4, v0, x17
                  li x17, 0x7bcf6c8e
                  vslide1up.vx v5, v0, x17
                  vmv.v.v v0, v5
                  li x17, 0x129360
                  vslide1up.vx v5, v0, x17
                  vmv.v.v v0, v5
                  li x17, 0xcd595862
                  vslide1up.vx v5, v0, x17
                  vmv.v.v v0, v5
                  li x17, 0x948bcd87
                  vslide1up.vx v5, v0, x17
                  li x17, 0x4f697d07
                  vslide1up.vx v6, v0, x17
                  vmv.v.v v0, v6
                  li x17, 0xa31f5a6f
                  vslide1up.vx v6, v0, x17
                  vmv.v.v v0, v6
                  li x17, 0xbc9a18c1
                  vslide1up.vx v6, v0, x17
                  vmv.v.v v0, v6
                  li x17, 0x7b871308
                  vslide1up.vx v6, v0, x17
                  li x17, 0x3e401ab6
                  vslide1up.vx v7, v0, x17
                  vmv.v.v v0, v7
                  li x17, 0xd10fdff
                  vslide1up.vx v7, v0, x17
                  vmv.v.v v0, v7
                  li x17, 0xb5a2589a
                  vslide1up.vx v7, v0, x17
                  vmv.v.v v0, v7
                  li x17, 0xaacd804
                  vslide1up.vx v7, v0, x17
                  li x17, 0xc76e2ef9
                  vslide1up.vx v8, v0, x17
                  vmv.v.v v0, v8
                  li x17, 0x8c0e1e45
                  vslide1up.vx v8, v0, x17
                  vmv.v.v v0, v8
                  li x17, 0x5244d4c7
                  vslide1up.vx v8, v0, x17
                  vmv.v.v v0, v8
                  li x17, 0x79f2e626
                  vslide1up.vx v8, v0, x17
                  li x17, 0x7b84d658
                  vslide1up.vx v9, v0, x17
                  vmv.v.v v0, v9
                  li x17, 0xd2939623
                  vslide1up.vx v9, v0, x17
                  vmv.v.v v0, v9
                  li x17, 0x5b1a8558
                  vslide1up.vx v9, v0, x17
                  vmv.v.v v0, v9
                  li x17, 0xd330ae05
                  vslide1up.vx v9, v0, x17
                  li x17, 0xc9853103
                  vslide1up.vx v10, v0, x17
                  vmv.v.v v0, v10
                  li x17, 0x839d8340
                  vslide1up.vx v10, v0, x17
                  vmv.v.v v0, v10
                  li x17, 0xf3d5ac47
                  vslide1up.vx v10, v0, x17
                  vmv.v.v v0, v10
                  li x17, 0xe5198a79
                  vslide1up.vx v10, v0, x17
                  li x17, 0xdff986e2
                  vslide1up.vx v11, v0, x17
                  vmv.v.v v0, v11
                  li x17, 0x12e2aa8d
                  vslide1up.vx v11, v0, x17
                  vmv.v.v v0, v11
                  li x17, 0x21e0ac39
                  vslide1up.vx v11, v0, x17
                  vmv.v.v v0, v11
                  li x17, 0xbe93d141
                  vslide1up.vx v11, v0, x17
                  li x17, 0x9930f706
                  vslide1up.vx v12, v0, x17
                  vmv.v.v v0, v12
                  li x17, 0xd72337d8
                  vslide1up.vx v12, v0, x17
                  vmv.v.v v0, v12
                  li x17, 0xbfe1afb3
                  vslide1up.vx v12, v0, x17
                  vmv.v.v v0, v12
                  li x17, 0x6e714ecf
                  vslide1up.vx v12, v0, x17
                  li x17, 0x64a109ba
                  vslide1up.vx v13, v0, x17
                  vmv.v.v v0, v13
                  li x17, 0xd75b794f
                  vslide1up.vx v13, v0, x17
                  vmv.v.v v0, v13
                  li x17, 0x24e239e8
                  vslide1up.vx v13, v0, x17
                  vmv.v.v v0, v13
                  li x17, 0xece0fce0
                  vslide1up.vx v13, v0, x17
                  li x17, 0xd00e83e3
                  vslide1up.vx v14, v0, x17
                  vmv.v.v v0, v14
                  li x17, 0x35bb5039
                  vslide1up.vx v14, v0, x17
                  vmv.v.v v0, v14
                  li x17, 0x2ab0ef8b
                  vslide1up.vx v14, v0, x17
                  vmv.v.v v0, v14
                  li x17, 0x8cc0d8e1
                  vslide1up.vx v14, v0, x17
                  li x17, 0x1c1e11c5
                  vslide1up.vx v15, v0, x17
                  vmv.v.v v0, v15
                  li x17, 0xa5e8ed1e
                  vslide1up.vx v15, v0, x17
                  vmv.v.v v0, v15
                  li x17, 0x684cf7f2
                  vslide1up.vx v15, v0, x17
                  vmv.v.v v0, v15
                  li x17, 0x3312483e
                  vslide1up.vx v15, v0, x17
                  li x17, 0x3b52049f
                  vslide1up.vx v16, v0, x17
                  vmv.v.v v0, v16
                  li x17, 0xcbb5f571
                  vslide1up.vx v16, v0, x17
                  vmv.v.v v0, v16
                  li x17, 0xaf43c540
                  vslide1up.vx v16, v0, x17
                  vmv.v.v v0, v16
                  li x17, 0x41dfc151
                  vslide1up.vx v16, v0, x17
                  li x17, 0x79da857e
                  vslide1up.vx v17, v0, x17
                  vmv.v.v v0, v17
                  li x17, 0x4978c88b
                  vslide1up.vx v17, v0, x17
                  vmv.v.v v0, v17
                  li x17, 0x24106954
                  vslide1up.vx v17, v0, x17
                  vmv.v.v v0, v17
                  li x17, 0x5715c0e4
                  vslide1up.vx v17, v0, x17
                  li x17, 0xa45a0cb
                  vslide1up.vx v18, v0, x17
                  vmv.v.v v0, v18
                  li x17, 0x27b5aea9
                  vslide1up.vx v18, v0, x17
                  vmv.v.v v0, v18
                  li x17, 0x97a1cd51
                  vslide1up.vx v18, v0, x17
                  vmv.v.v v0, v18
                  li x17, 0x8694643b
                  vslide1up.vx v18, v0, x17
                  li x17, 0xe0932c28
                  vslide1up.vx v19, v0, x17
                  vmv.v.v v0, v19
                  li x17, 0xac9c735
                  vslide1up.vx v19, v0, x17
                  vmv.v.v v0, v19
                  li x17, 0x2358d477
                  vslide1up.vx v19, v0, x17
                  vmv.v.v v0, v19
                  li x17, 0x3a67201a
                  vslide1up.vx v19, v0, x17
                  li x17, 0xd8a989ac
                  vslide1up.vx v20, v0, x17
                  vmv.v.v v0, v20
                  li x17, 0x64db24f5
                  vslide1up.vx v20, v0, x17
                  vmv.v.v v0, v20
                  li x17, 0x74d655e
                  vslide1up.vx v20, v0, x17
                  vmv.v.v v0, v20
                  li x17, 0xb1e9a2d6
                  vslide1up.vx v20, v0, x17
                  li x17, 0x9ed81d76
                  vslide1up.vx v21, v0, x17
                  vmv.v.v v0, v21
                  li x17, 0x17305b1e
                  vslide1up.vx v21, v0, x17
                  vmv.v.v v0, v21
                  li x17, 0xc540ae13
                  vslide1up.vx v21, v0, x17
                  vmv.v.v v0, v21
                  li x17, 0x86eece1
                  vslide1up.vx v21, v0, x17
                  li x17, 0x639ff566
                  vslide1up.vx v22, v0, x17
                  vmv.v.v v0, v22
                  li x17, 0x7a399b30
                  vslide1up.vx v22, v0, x17
                  vmv.v.v v0, v22
                  li x17, 0xfc16fcf3
                  vslide1up.vx v22, v0, x17
                  vmv.v.v v0, v22
                  li x17, 0xcbe55c78
                  vslide1up.vx v22, v0, x17
                  li x17, 0x75002e11
                  vslide1up.vx v23, v0, x17
                  vmv.v.v v0, v23
                  li x17, 0x79b59b5d
                  vslide1up.vx v23, v0, x17
                  vmv.v.v v0, v23
                  li x17, 0xb7e41d39
                  vslide1up.vx v23, v0, x17
                  vmv.v.v v0, v23
                  li x17, 0x331ff7a6
                  vslide1up.vx v23, v0, x17
                  li x17, 0x265971e9
                  vslide1up.vx v24, v0, x17
                  vmv.v.v v0, v24
                  li x17, 0x51c4e9b4
                  vslide1up.vx v24, v0, x17
                  vmv.v.v v0, v24
                  li x17, 0x90221da6
                  vslide1up.vx v24, v0, x17
                  vmv.v.v v0, v24
                  li x17, 0x262a8f48
                  vslide1up.vx v24, v0, x17
                  li x17, 0x2c8b18d7
                  vslide1up.vx v25, v0, x17
                  vmv.v.v v0, v25
                  li x17, 0x25d08a1a
                  vslide1up.vx v25, v0, x17
                  vmv.v.v v0, v25
                  li x17, 0x72d771c3
                  vslide1up.vx v25, v0, x17
                  vmv.v.v v0, v25
                  li x17, 0x7149c9a2
                  vslide1up.vx v25, v0, x17
                  li x17, 0x40106ed3
                  vslide1up.vx v26, v0, x17
                  vmv.v.v v0, v26
                  li x17, 0xf0e7348c
                  vslide1up.vx v26, v0, x17
                  vmv.v.v v0, v26
                  li x17, 0xcc91dcab
                  vslide1up.vx v26, v0, x17
                  vmv.v.v v0, v26
                  li x17, 0x163ffedd
                  vslide1up.vx v26, v0, x17
                  li x17, 0x6c11d312
                  vslide1up.vx v27, v0, x17
                  vmv.v.v v0, v27
                  li x17, 0x72f8b82a
                  vslide1up.vx v27, v0, x17
                  vmv.v.v v0, v27
                  li x17, 0xc61600e
                  vslide1up.vx v27, v0, x17
                  vmv.v.v v0, v27
                  li x17, 0x78083d8c
                  vslide1up.vx v27, v0, x17
                  li x17, 0x49c7bd66
                  vslide1up.vx v28, v0, x17
                  vmv.v.v v0, v28
                  li x17, 0xbf0e7f38
                  vslide1up.vx v28, v0, x17
                  vmv.v.v v0, v28
                  li x17, 0x2a9ba4f9
                  vslide1up.vx v28, v0, x17
                  vmv.v.v v0, v28
                  li x17, 0x78bd1afb
                  vslide1up.vx v28, v0, x17
                  li x17, 0x17f12706
                  vslide1up.vx v29, v0, x17
                  vmv.v.v v0, v29
                  li x17, 0x8a4df68c
                  vslide1up.vx v29, v0, x17
                  vmv.v.v v0, v29
                  li x17, 0xecf38b63
                  vslide1up.vx v29, v0, x17
                  vmv.v.v v0, v29
                  li x17, 0xdca4e35d
                  vslide1up.vx v29, v0, x17
                  li x17, 0x9b5e61de
                  vslide1up.vx v30, v0, x17
                  vmv.v.v v0, v30
                  li x17, 0x95a0d3a6
                  vslide1up.vx v30, v0, x17
                  vmv.v.v v0, v30
                  li x17, 0xab4800fd
                  vslide1up.vx v30, v0, x17
                  vmv.v.v v0, v30
                  li x17, 0xab071c6f
                  vslide1up.vx v30, v0, x17
                  li x17, 0xea6f1216
                  vslide1up.vx v31, v0, x17
                  vmv.v.v v0, v31
                  li x17, 0x1c11661b
                  vslide1up.vx v31, v0, x17
                  vmv.v.v v0, v31
                  li x17, 0x475cdcd6
                  vslide1up.vx v31, v0, x17
                  vmv.v.v v0, v31
                  li x17, 0x6909b0b8
                  vslide1up.vx v31, v0, x17
li x28, 8
                  vsetvli x17, x28, e16, m1
main:             mulhu      gp, a0, s2
                  mulhu      s9, s6, zero
                  lui        s0, 589585
                  slt        a1, s5, s0
                  xor        zero, sp, tp
                  sub        t2, s9, a5
                  mulh       a0, s4, a6
                  xori       t2, s3, -917
                  sltiu      sp, a0, 172
                  srl        tp, s6, s4
                  slti       t1, a7, -573
                  srai       a7, a1, 26
                  rem        s11, a2, ra
                  addi       a5, a0, 469
                  srli       a3, s3, 2
                  sub        a7, a5, gp
                  addi       a4, t3, -394
                  sub        a5, ra, t2
                  vfwcvt.xu.f.v v18,v22,v0.t
                  remu       s8, s0, s7
                  slt        t6, sp, sp
                  ori        a4, gp, -619
                  auipc      tp, 107820
                  mulhsu     a1, s8, a0
                  sll        s9, s0, a2
                  and        s11, a4, t5
                  mulhsu     a5, s11, s10
                  srli       tp, s6, 3
                  or         sp, t1, a5
                  ori        a0, a7, -342
                  sll        s8, s7, s3
                  lui        t4, 515026
                  slli       s4, s0, 9
                  remu       s5, t4, s2
                  srli       s10, a6, 13
                  and        t6, ra, a6
                  rem        zero, s7, a0
                  addi       t6, s5, 593
                  srai       t5, s9, 9
                  mulh       s6, a4, a6
                  or         t4, a1, s11
                  auipc      s5, 278140
                  srli       s0, a1, 20
                  and        zero, s6, ra
                  srl        s0, sp, s7
                  slti       a5, zero, 425
                  sltu       s10, a0, s8
                  remu       tp, tp, s11
                  addi       ra, t2, 739
                  mulhu      t1, s3, a2
                  slt        t0, s4, s1
                  vfwcvt.x.f.v v30,v22,v0.t
                  srai       tp, a2, 17
                  xor        a6, a6, t6
                  vfwcvt.xu.f.v v18,v28
                  vfwcvt.x.f.v v20,v16,v0.t
                  srl        sp, s7, s11
                  auipc      s0, 294892
                  sra        t2, zero, t4
                  vfwcvt.x.f.v v12,v16,v0.t
                  addi       a1, gp, 470
                  sltiu      t5, t0, 77
                  or         s6, s4, a3
                  slli       t0, gp, 11
                  sub        t1, a1, s0
                  or         s4, tp, ra
                  srli       t5, t3, 18
                  xori       s0, s11, -726
                  srli       a0, s5, 19
                  or         a2, s9, s2
                  ori        a2, ra, -381
                  mulhsu     s9, a6, a2
                  sub        s4, s0, s1
                  vfwcvt.f.x.v v10,v14,v0.t
                  add        a3, s1, a0
                  add        tp, t0, s7
                  mulhu      s4, s7, tp
                  vfwcvt.x.f.v v8,v4
                  div        s8, a6, sp
                  sub        t3, s3, s9
                  lui        t3, 71161
                  div        a1, s8, s1
                  mulh       s4, t6, t0
                  sltiu      a1, t5, -796
                  srli       t6, s3, 8
                  ori        a4, a0, -252
                  mul        s9, s3, t4
                  rem        s10, s2, a1
                  sub        s10, tp, a0
                  srli       a0, a3, 10
                  sltiu      a1, s9, 890
                  mulhsu     s10, s4, s1
                  mulh       t1, s2, t2
                  mulh       s11, t3, a3
                  mulhu      a6, s3, s3
                  auipc      t1, 616716
                  and        s9, s6, a6
                  or         a3, a5, s0
                  auipc      t2, 741539
                  mulhu      s10, s7, s5
                  slt        a7, s5, s7
                  xor        ra, a6, ra
                  sltiu      t1, s3, -790
                  mulhsu     a6, zero, s0
                  add        s8, a6, s8
                  srai       a7, s8, 11
                  mul        tp, a5, a4
                  divu       a6, t2, s7
                  vfwcvt.f.x.v v30,v4,v0.t
                  mulhu      s5, s9, t4
                  auipc      s9, 475820
                  remu       gp, s10, s2
                  rem        s9, s0, ra
                  div        a6, a4, s4
                  divu       a6, t2, a7
                  sll        tp, s7, t2
                  slli       t0, s7, 27
                  srli       a2, zero, 2
                  srli       s1, a4, 2
                  sra        s4, t5, s8
                  auipc      s5, 968979
                  sll        s10, s7, s11
                  srai       s0, a4, 21
                  remu       a7, tp, s11
                  slti       s11, s3, -478
                  mul        a0, sp, s11
                  mulh       t1, a2, s6
                  mulhsu     ra, a2, s9
                  mul        sp, a5, a4
                  auipc      t0, 981484
                  sll        a1, s10, a1
                  mul        a3, s0, t4
                  slli       s4, a1, 3
                  divu       t4, tp, s6
                  remu       s5, a2, a4
                  vfwcvt.f.xu.v v24,v14
                  vfwcvt.xu.f.v v0,v30
                  ori        a4, zero, -556
                  sra        t0, gp, s9
                  srl        a7, t4, a5
                  and        t3, gp, s11
                  lui        ra, 827803
                  and        a0, t5, s8
                  mulh       a2, ra, a5
                  mul        t6, a7, s1
                  remu       a7, t3, t4
                  andi       t3, a3, -129
                  divu       a3, a7, s6
                  div        gp, s7, t2
                  slt        tp, a1, s6
                  srli       tp, a4, 28
                  rem        s11, t5, t6
                  addi       a6, a3, -981
                  div        t0, a1, a7
                  ori        a5, a2, 1004
                  slt        t6, t6, ra
                  ori        a1, a4, 366
                  vfwcvt.xu.f.v v10,v20
                  srl        t5, ra, s9
                  ori        a4, s10, 121
                  slt        a5, t0, gp
                  addi       s8, t2, 510
                  vfwcvt.xu.f.v v8,v10,v0.t
                  ori        ra, s5, 916
                  sltu       a0, a6, a7
                  xor        s5, t3, a3
                  sub        a0, s1, sp
                  slli       s9, a3, 29
                  rem        tp, a7, s7
                  remu       t5, s5, a2
                  rem        s5, t6, a3
                  andi       t1, t4, -1015
                  mulh       zero, sp, s1
                  srli       t2, a1, 18
                  mul        s5, t4, t5
                  vfwcvt.f.x.v v26,v8
                  srli       t3, s11, 6
                  mul        a7, s2, s3
                  auipc      sp, 765771
                  slt        t6, s1, a2
                  div        s1, a4, s3
                  xor        s9, t2, a3
                  mulhu      s5, s1, a6
                  andi       gp, s4, 935
                  xor        tp, t2, t5
                  srai       s8, t6, 15
                  vfwcvt.xu.f.v v10,v14
                  mul        a4, a2, t3
                  divu       s8, a7, gp
                  andi       s0, a6, -1024
                  srai       t5, a4, 29
                  vfwcvt.f.x.v v26,v10,v0.t
                  sltu       a2, s2, a7
                  sltu       a1, s10, t4
                  mul        s1, zero, s4
                  srl        a4, a5, t3
                  slti       s0, t0, 845
                  vfwcvt.xu.f.v v22,v28,v0.t
                  sra        gp, s8, a4
                  sltu       s9, t0, s5
                  la x18, test_done
                  jalr x0, x18, 0
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
                  1: addi x23, x23, -124
                  sw  x1, 4(x23)
                  sw  x2, 8(x23)
                  sw  x3, 12(x23)
                  sw  x4, 16(x23)
                  sw  x5, 20(x23)
                  sw  x6, 24(x23)
                  sw  x7, 28(x23)
                  sw  x8, 32(x23)
                  sw  x9, 36(x23)
                  sw  x10, 40(x23)
                  sw  x11, 44(x23)
                  sw  x12, 48(x23)
                  sw  x13, 52(x23)
                  sw  x14, 56(x23)
                  sw  x15, 60(x23)
                  sw  x16, 64(x23)
                  sw  x17, 68(x23)
                  sw  x18, 72(x23)
                  sw  x19, 76(x23)
                  sw  x20, 80(x23)
                  sw  x21, 84(x23)
                  sw  x22, 88(x23)
                  sw  x23, 92(x23)
                  sw  x24, 96(x23)
                  sw  x25, 100(x23)
                  sw  x26, 104(x23)
                  sw  x27, 108(x23)
                  sw  x28, 112(x23)
                  sw  x29, 116(x23)
                  sw  x30, 120(x23)
                  sw  x31, 124(x23)
                  csrr x17, 0x341 # MEPC
                  csrr x17, 0x342 # MCAUSE
                  li x28, 0x3 # BREAKPOINT
                  beq x17, x28, ebreak_handler
                  li x28, 0x8 # ECALL_UMODE
                  beq x17, x28, ecall_handler
                  li x28, 0x9 # ECALL_SMODE
                  beq x17, x28, ecall_handler
                  li x28, 0xb # ECALL_MMODE
                  beq x17, x28, ecall_handler
                  li x28, 0x1
                  beq x17, x28, instr_fault_handler
                  li x28, 0x5
                  beq x17, x28, load_fault_handler
                  li x28, 0x7
                  beq x17, x28, store_fault_handler
                  li x28, 0xc
                  beq x17, x28, pt_fault_handler
                  li x28, 0xd
                  beq x17, x28, pt_fault_handler
                  li x28, 0xf
                  beq x17, x28, pt_fault_handler
                  li x28, 0x2 # ILLEGAL_INSTRUCTION
                  beq x17, x28, illegal_instr_handler
                  csrr x28, 0x343 # MTVAL
                  1: la x18, test_done
                  jalr x1, x18, 0

ecall_handler:    
                  la x17, _start
                  sw x0, 0(x17)
                  sw x1, 4(x17)
                  sw x2, 8(x17)
                  sw x3, 12(x17)
                  sw x4, 16(x17)
                  sw x5, 20(x17)
                  sw x6, 24(x17)
                  sw x7, 28(x17)
                  sw x8, 32(x17)
                  sw x9, 36(x17)
                  sw x10, 40(x17)
                  sw x11, 44(x17)
                  sw x12, 48(x17)
                  sw x13, 52(x17)
                  sw x14, 56(x17)
                  sw x15, 60(x17)
                  sw x16, 64(x17)
                  sw x17, 68(x17)
                  sw x18, 72(x17)
                  sw x19, 76(x17)
                  sw x20, 80(x17)
                  sw x21, 84(x17)
                  sw x22, 88(x17)
                  sw x23, 92(x17)
                  sw x24, 96(x17)
                  sw x25, 100(x17)
                  sw x26, 104(x17)
                  sw x27, 108(x17)
                  sw x28, 112(x17)
                  sw x29, 116(x17)
                  sw x30, 120(x17)
                  sw x31, 124(x17)
                  la x18, write_tohost
                  jalr x0, x18, 0

instr_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x30, 0
                  0: csrr x17, 0x340
                  mv x18, x17
                  li x18, 0
                  beq x17, x18, 1f
                  1: csrr x28, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x18, x21, x17
                  addi x18, x18, -1
                  slli x18, x18, 3
                  sll x21, x12, x18
                  slli x17, x17, 3
                  add x18, x18, x17
                  srl x21, x21, x18
                  slli x18, x21, 27
                  srli x18, x18, 30
                  beqz x18, 20f
                  li x17, 1
                  beq x18, x17, 21f
                  li x17, 2
                  beq x18, x17, 25f
                  li x17, 3
                  beq x18, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x30, x28
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x28, 1
                  ble x28, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x18, 0x343
                  srli x18, x18, 2
                  bnez x17, 22f
                  bltz x18, 18b
                  j 23f
                  22: bgtu x30, x18, 18b
                  23: bleu x28, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x18, x28, 2
                  srli x18, x18, 2
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x18, x28, 2
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x21, x21, 4
                  csrr x17, 0x340
                  li x18, 30
                  sll x17, x17, x18
                  srl x17, x17, x18
                  slli x18, x17, 3
                  sll x21, x21, x18
                  or x12, x12, x21
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x18, 1
                  beq x17, x18, 31f
                  li x18, 2
                  beq x17, x18, 32f
                  li x18, 3
                  beq x17, x18, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
                  mret

load_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x30, 0
                  0: csrr x17, 0x340
                  mv x18, x17
                  li x18, 0
                  beq x17, x18, 1f
                  1: csrr x28, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x18, x21, x17
                  addi x18, x18, -1
                  slli x18, x18, 3
                  sll x21, x12, x18
                  slli x17, x17, 3
                  add x18, x18, x17
                  srl x21, x21, x18
                  slli x18, x21, 27
                  srli x18, x18, 30
                  beqz x18, 20f
                  li x17, 1
                  beq x18, x17, 21f
                  li x17, 2
                  beq x18, x17, 25f
                  li x17, 3
                  beq x18, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x30, x28
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x28, 1
                  ble x28, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x18, 0x343
                  srli x18, x18, 2
                  bnez x17, 22f
                  bltz x18, 18b
                  j 23f
                  22: bgtu x30, x18, 18b
                  23: bleu x28, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x18, x28, 2
                  srli x18, x18, 2
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x18, x28, 2
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x21, x21, 1
                  csrr x17, 0x340
                  li x18, 30
                  sll x17, x17, x18
                  srl x17, x17, x18
                  slli x18, x17, 3
                  sll x21, x21, x18
                  or x12, x12, x21
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x18, 1
                  beq x17, x18, 31f
                  li x18, 2
                  beq x17, x18, 32f
                  li x18, 3
                  beq x17, x18, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
                  mret

store_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x30, 0
                  0: csrr x17, 0x340
                  mv x18, x17
                  li x18, 0
                  beq x17, x18, 1f
                  1: csrr x28, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x18, x21, x17
                  addi x18, x18, -1
                  slli x18, x18, 3
                  sll x21, x12, x18
                  slli x17, x17, 3
                  add x18, x18, x17
                  srl x21, x21, x18
                  slli x18, x21, 27
                  srli x18, x18, 30
                  beqz x18, 20f
                  li x17, 1
                  beq x18, x17, 21f
                  li x17, 2
                  beq x18, x17, 25f
                  li x17, 3
                  beq x18, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x30, x28
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x28, 1
                  ble x28, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x18, 0x343
                  srli x18, x18, 2
                  bnez x17, 22f
                  bltz x18, 18b
                  j 23f
                  22: bgtu x30, x18, 18b
                  23: bleu x28, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x18, x28, 2
                  srli x18, x18, 2
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x18, x28, 2
                  srli x18, x18, 2
                  srli x18, x18, 0
                  slli x18, x18, 0
                  bne x17, x18, 18b
                  andi x18, x21, 128
                  beqz x18, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x21, x21, 3
                  csrr x17, 0x340
                  li x18, 30
                  sll x17, x17, x18
                  srl x17, x17, x18
                  slli x18, x17, 3
                  sll x21, x21, x18
                  or x12, x12, x21
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x18, 1
                  beq x17, x18, 31f
                  li x18, 2
                  beq x17, x18, 32f
                  li x18, 3
                  beq x17, x18, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
                  mret

ebreak_handler:   
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
                  mret

illegal_instr_handler:
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x17, 0x300 # MSTATUS;
                  csrr  x17, 0x304 # MIE;
                  csrr  x17, 0x344 # MIP;
                  csrrc x17, 0x344, x17 # MIP;
                  lw  x1, 4(x23)
                  lw  x2, 8(x23)
                  lw  x3, 12(x23)
                  lw  x4, 16(x23)
                  lw  x5, 20(x23)
                  lw  x6, 24(x23)
                  lw  x7, 28(x23)
                  lw  x8, 32(x23)
                  lw  x9, 36(x23)
                  lw  x10, 40(x23)
                  lw  x11, 44(x23)
                  lw  x12, 48(x23)
                  lw  x13, 52(x23)
                  lw  x14, 56(x23)
                  lw  x15, 60(x23)
                  lw  x16, 64(x23)
                  lw  x17, 68(x23)
                  lw  x18, 72(x23)
                  lw  x19, 76(x23)
                  lw  x20, 80(x23)
                  lw  x21, 84(x23)
                  lw  x22, 88(x23)
                  lw  x23, 92(x23)
                  lw  x24, 96(x23)
                  lw  x25, 100(x23)
                  lw  x26, 104(x23)
                  lw  x27, 108(x23)
                  lw  x28, 112(x23)
                  lw  x29, 116(x23)
                  lw  x30, 120(x23)
                  lw  x31, 124(x23)
                  addi x23, x23, 124
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
