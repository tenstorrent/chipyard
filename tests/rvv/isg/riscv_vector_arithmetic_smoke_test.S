.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x11, 0x40201123
                  csrw 0x301, x11
                  csrr x31, 0x301
kernel_sp:        
                  la x26, kernel_stack_end

trap_vec_init:    
                  la x11, mtvec_handler
                  ori x11, x11, 1

mepc_setup:       
                  la x11, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0xfe6c49f0
                  li x1, 0xfc1d0e20
                  li x2, 0xfd5160c1
                  li x3, 0x5a340a55
                  li x4, 0x80000000
                  li x5, 0xfc053aba
                  li x6, 0xfa11a15d
                  li x7, 0xfcfaf71e
                  li x8, 0x2e04e1a9
                  li x9, 0xc5fe9fd8
                  li x10, 0xf708482e
                  li x11, 0xfe556940
                  li x12, 0x97f9aa30
                  li x13, 0xfde37ab5
                  li x14, 0xfee4bfa1
                  li x15, 0xa3c20f2e
                  li x16, 0x6dc7ed28
                  li x17, 0xdbb259f4
                  li x18, 0xf8129a6b
                  li x20, 0xc810931c
                  li x21, 0x8e9392c9
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0xa241e425
                  li x25, 0xf72d022e
                  li x27, 0x61e86ac4
                  li x28, 0x80000000
                  li x29, 0xffe56468
                  li x30, 0xf4ca535c
                  li x31, 0x5330a87a
                  la x19, user_stack_end
                  csrwi vxsat, 1
                  csrwi vxrm, 1
li x18, 4
                  vsetvli x11, x18, e32, m1
vec_reg_init:
                  vmv.v.x v0, x0
                  vmv.v.x v1, x1
                  vmv.v.x v2, x2
                  vmv.v.x v3, x3
                  vmv.v.x v4, x4
                  vmv.v.x v5, x5
                  vmv.v.x v6, x6
                  vmv.v.x v7, x7
                  vmv.v.x v8, x8
                  vmv.v.x v9, x9
                  vmv.v.x v10, x10
                  vmv.v.x v11, x11
                  vmv.v.x v12, x12
                  vmv.v.x v13, x13
                  vmv.v.x v14, x14
                  vmv.v.x v15, x15
                  vmv.v.x v16, x16
                  vmv.v.x v17, x17
                  vmv.v.x v18, x18
                  vmv.v.x v19, x19
                  vmv.v.x v20, x20
                  vmv.v.x v21, x21
                  vmv.v.x v22, x22
                  vmv.v.x v23, x23
                  vmv.v.x v24, x24
                  vmv.v.x v25, x25
                  vmv.v.x v26, x26
                  vmv.v.x v27, x27
                  vmv.v.x v28, x28
                  vmv.v.x v29, x29
                  vmv.v.x v30, x30
                  vmv.v.x v31, x31
li x18, 4
                  vsetvli x11, x18, e32, m1
main:             vmaxu.vx   v13,v8,t5,v0.t
                  mulhsu     t1, a0, a5
                  vslidedown.vi v2,v26,0,v0.t
                  srai       s0, s10, 15
                  vmadd.vv   v30,v17,v3
                  vmv.s.x v14,a4
                  viota.m v22,v20,v0.t
                  vand.vi    v12,v27,0
                  vmsle.vi   v7,v3,0,v0.t
                  vand.vi    v1,v6,0
                  mul        a2, gp, t1
                  slt        t3, a5, t0
                  vsrl.vv    v26,v26,v5
                  rem        s0, s5, a2
                  srli       a0, s4, 26
                  addi       s8, s3, 494
                  vmnand.mm  v7,v23,v4
                  ori        zero, tp, -482
                  vmslt.vx   v20,v21,zero
                  vmulhu.vx  v31,v5,t4
                  vmsle.vx   v2,v9,s8,v0.t
                  mulhu      a5, a7, s6
                  srli       a3, ra, 24
                  sltu       s7, t1, t5
                  vmulh.vv   v26,v5,v12,v0.t
                  vsll.vv    v19,v3,v18,v0.t
                  vmsif.m v25,v6
                  vmslt.vv   v30,v24,v14
                  andi       t1, gp, 985
                  vmin.vx    v2,v13,gp
                  vmseq.vi   v15,v28,0
                  vmxnor.mm  v6,v19,v28
                  rem        s1, gp, zero
                  vmsleu.vx  v16,v23,t3
                  vmxor.mm   v2,v5,v6
                  remu       a7, t0, a2
                  vmul.vx    v30,v7,s2
                  vmsne.vx   v31,v17,t6
                  vmsgt.vx   v11,v12,t5,v0.t
                  and        s8, a7, s3
                  lui        t0, 174630
                  vmsltu.vx  v7,v25,s1,v0.t
                  vslide1up.vx v14,v6,s3,v0.t
                  vsll.vv    v22,v9,v19
                  addi       a4, s4, -553
                  vmsne.vi   v8,v5,0
                  vmornot.mm v24,v2,v21
                  vslidedown.vx v30,v5,s8
                  vslidedown.vx v11,v23,tp,v0.t
                  vmandnot.mm v22,v23,v9
                  srl        a1, gp, gp
                  vand.vx    v2,v1,t3
                  vsub.vx    v2,v4,t0
                  sub        t1, ra, s7
                  vmsif.m v8,v18,v0.t
                  vmv.s.x v16,gp
                  andi       s11, t1, 69
                  vmseq.vi   v6,v8,0
                  vmv.v.v v26,v12
                  vadc.vim   v15,v2,0,v0
                  vfirst.m zero,v15
                  vmadd.vv   v23,v15,v22
                  remu       s7, s7, t1
                  vmadd.vv   v14,v17,v16
                  vadd.vx    v20,v14,a3,v0.t
                  vadd.vi    v1,v18,0,v0.t
                  vmnand.mm  v18,v6,v15
                  vmseq.vi   v12,v22,0,v0.t
                  vmv.s.x v11,a2
                  vmv.v.i v16,0
                  vslideup.vx v4,v16,zero,v0.t
                  vmsif.m v30,v24
                  srl        t1, s5, a2
                  slli       s2, a1, 19
                  vsub.vv    v4,v25,v28
                  vsbc.vvm   v30,v9,v21,v0
                  vmxnor.mm  v20,v6,v17
                  vslide1up.vx v7,v13,a3
                  sra        s1, s2, zero
                  sltu       a0, a0, t3
                  divu       sp, s1, a2
                  vand.vv    v18,v24,v2,v0.t
                  vsrl.vv    v22,v0,v30
                  vmv.x.s zero,v7
                  vmxnor.mm  v16,v19,v24
                  or         t3, t6, s2
                  vmv.x.s zero,v23
                  vsrl.vx    v4,v4,a2,v0.t
                  vmslt.vx   v19,v17,a0,v0.t
                  vmsltu.vv  v23,v31,v11,v0.t
                  auipc      s0, 948056
                  vmnand.mm  v18,v7,v15
                  mul        s0, t5, t0
                  vmsif.m v29,v30
                  vmulhsu.vx v11,v27,gp,v0.t
                  vadc.vvm   v23,v8,v4,v0
                  vmornot.mm v4,v15,v3
                  vmsof.m v7,v4,v0.t
                  vmor.mm    v11,v6,v10
                  mulhu      ra, a1, a2
                  mulhsu     a1, s7, t6
                  vmacc.vv   v31,v31,v23
                  vmslt.vx   v17,v24,s11
                  add        a4, s2, s2
                  vmsgtu.vx  v29,v26,t5
                  vmnand.mm  v23,v3,v16
                  mulhu      a7, s11, t3
                  srl        a6, t2, a3
                  vfirst.m zero,v20
                  vmnand.mm  v9,v14,v27
                  vmor.mm    v8,v20,v17
                  mulhu      s7, t4, s0
                  sra        s11, tp, a6
                  xor        s2, a7, a0
                  andi       a4, t3, -967
                  vmsif.m v7,v20
                  vsrl.vv    v4,v1,v16
                  mulhsu     a2, a7, s2
                  vsub.vx    v22,v25,zero,v0.t
                  vmsne.vv   v27,v22,v15
                  vand.vi    v4,v0,0,v0.t
                  srl        s5, a0, t3
                  divu       t3, a6, s7
                  slti       s4, s4, -607
                  vfirst.m zero,v8
                  vslidedown.vi v15,v19,0,v0.t
                  vsra.vi    v31,v30,0
                  addi       s6, a2, -684
                  vmulhsu.vx v13,v18,t5,v0.t
                  vmulh.vv   v27,v20,v27
                  vmaxu.vx   v24,v15,a2,v0.t
                  div        a3, a0, t5
                  auipc      a2, 433638
                  divu       t6, s6, s8
                  divu       a5, t0, a4
                  vfirst.m zero,v10,v0.t
                  vslide1down.vx v17,v3,s9
                  vmul.vv    v13,v4,v23,v0.t
                  vrsub.vi   v10,v0,0,v0.t
                  vmsle.vv   v19,v31,v18
                  vmslt.vx   v22,v26,s0,v0.t
                  vsbc.vxm   v16,v9,s11,v0
                  vmv.x.s zero,v26
                  vmsof.m v23,v3,v0.t
                  divu       s4, s7, zero
                  vmaxu.vv   v4,v30,v7
                  vmnor.mm   v9,v13,v21
                  vmsne.vx   v15,v7,s8,v0.t
                  vmsbf.m v21,v13,v0.t
                  xor        s0, t3, a4
                  vmand.mm   v24,v13,v7
                  vsub.vv    v14,v23,v21
                  vmnor.mm   v14,v19,v11
                  divu       s7, a5, s4
                  vmulhu.vx  v20,v11,t2,v0.t
                  vmsle.vi   v23,v5,0
                  vmxor.mm   v6,v23,v26
                  vmseq.vx   v0,v19,a3
                  vmax.vx    v31,v6,tp
                  slt        s8, a1, s3
                  vid.v v13
                  div        t5, s8, s9
                  vpopc.m zero,v21,v0.t
                  lui        a3, 52837
                  mul        a7, t3, tp
                  slti       t6, t0, 775
                  vmor.mm    v2,v27,v9
                  vmnand.mm  v26,v17,v2
                  vmsleu.vv  v12,v19,v30,v0.t
                  vmornot.mm v9,v27,v21
                  div        t5, t5, t2
                  sll        ra, a6, s10
                  viota.m v29,v31,v0.t
                  vmsgt.vi   v4,v15,0
                  vmandnot.mm v3,v24,v30
                  vmsof.m v31,v27
                  vslide1down.vx v20,v0,t0
                  vslide1up.vx v11,v5,t1,v0.t
                  auipc      gp, 349237
                  addi       t6, a5, -719
                  vmnand.mm  v25,v24,v17
                  vmsle.vx   v8,v30,t1
                  vmand.mm   v22,v7,v3
                  vmul.vx    v11,v4,gp
                  vslideup.vi v18,v29,0
                  or         a6, a1, a0
                  vmsltu.vx  v7,v4,a7,v0.t
                  andi       s8, s4, 130
                  vfirst.m zero,v16,v0.t
                  vmsif.m v15,v29
                  vrsub.vx   v3,v12,s9,v0.t
                  vmax.vx    v30,v3,s7,v0.t
                  mulh       tp, a6, t1
                  vpopc.m zero,v30,v0.t
                  vminu.vx   v16,v10,t2
                  vmulhsu.vx v21,v2,a4
                  vmor.mm    v15,v4,v14
                  vsra.vv    v19,v14,v16,v0.t
                  vmsif.m v20,v9
                  xori       s1, a0, 954
                  vmv.s.x v19,a7
                  srai       a6, a6, 5
                  and        s6, s0, s1
                  slli       a7, t0, 13
                  vpopc.m zero,v2,v0.t
                  andi       t6, ra, 818
                  remu       s2, s10, a3
                  vmsne.vi   v29,v20,0
                  srli       a2, a2, 4
                  vmulh.vx   v29,v0,a2
                  vmsltu.vv  v1,v0,v9
                  vsra.vx    v1,v22,t5
                  vmslt.vv   v6,v24,v8,v0.t
                  mulh       s8, a0, sp
                  slli       s1, t2, 23
                  vxor.vv    v5,v3,v28,v0.t
                  vadd.vx    v15,v8,s5,v0.t
                  vmsltu.vx  v1,v24,s6
                  vslide1down.vx v3,v13,t5
                  vadc.vxm   v3,v1,t2,v0
                  vmornot.mm v31,v13,v12
                  vmor.mm    v27,v0,v6
                  ori        ra, a4, -123
                  vadd.vi    v3,v13,0,v0.t
                  slli       ra, s5, 27
                  vmxor.mm   v0,v6,v14
                  vslide1down.vx v12,v0,s8,v0.t
                  vmulhu.vx  v15,v14,t6
                  vmulh.vx   v11,v16,s8
                  sub        t0, t1, a1
                  vor.vv     v26,v11,v13,v0.t
                  sll        a5, s11, t2
                  vminu.vx   v0,v24,zero
                  vsub.vx    v26,v25,s4
                  vrgather.vi v28,v19,0
                  viota.m v1,v17,v0.t
                  vmsltu.vv  v7,v8,v23,v0.t
                  vmul.vx    v29,v26,sp
                  vmsbf.m v1,v14,v0.t
                  vmulhu.vx  v18,v24,a1
                  vmax.vx    v5,v9,ra
                  srai       sp, a4, 19
                  vrgather.vx v30,v28,ra
                  vmsgt.vx   v28,v8,t5
                  srl        s1, s2, a3
                  addi       a7, s0, 422
                  sra        t6, a1, s2
                  sltiu      sp, a3, -740
                  vrgather.vx v27,v21,a3
                  vmsif.m v26,v2
                  vmornot.mm v8,v31,v17
                  vadd.vx    v30,v25,s9
                  vmsbf.m v20,v25,v0.t
                  vmsgtu.vx  v6,v5,s3,v0.t
                  vpopc.m zero,v22,v0.t
                  sra        s4, t5, t5
                  andi       sp, t0, -272
                  vslide1up.vx v21,v5,s9
                  vsbc.vvm   v21,v24,v9,v0
                  vadc.vvm   v18,v11,v25,v0
                  vmsif.m v8,v1,v0.t
                  vmsof.m v11,v13,v0.t
                  vfirst.m zero,v29
                  vmornot.mm v4,v4,v2
                  vrsub.vx   v1,v26,s5
                  or         a5, s9, a1
                  mulh       zero, s6, t1
                  sub        s7, a5, s9
                  vsrl.vx    v13,v7,s7
                  vmxor.mm   v29,v12,v16
                  or         a2, t0, tp
                  vrsub.vx   v22,v4,s2,v0.t
                  vsbc.vvm   v18,v6,v23,v0
                  viota.m v4,v9,v0.t
                  vmnor.mm   v15,v9,v1
                  vmor.mm    v31,v1,v30
                  sltu       s0, s5, zero
                  vmnand.mm  v22,v4,v26
                  andi       a1, a6, -999
                  vmxor.mm   v16,v19,v28
                  vsub.vx    v7,v12,a3,v0.t
                  vxor.vi    v20,v5,0
                  vor.vi     v18,v22,0
                  lui        a1, 646084
                  vmsif.m v17,v28
                  vmnor.mm   v22,v15,v11
                  div        a0, s4, s8
                  vmulh.vx   v9,v2,s10
                  sub        t5, t0, t1
                  srl        s0, sp, sp
                  vmaxu.vv   v0,v15,v26
                  or         ra, zero, a7
                  sltiu      a2, a6, 726
                  vmulh.vv   v9,v25,v22
                  and        s8, s0, s7
                  vmslt.vv   v8,v3,v16
                  vslide1down.vx v15,v14,t0,v0.t
                  andi       t0, s4, 14
                  mulhu      s5, s4, a7
                  vmsne.vx   v13,v3,a2
                  sra        s6, s10, s4
                  vmaxu.vv   v4,v6,v0
                  vrgather.vv v18,v7,v0
                  slti       s11, s5, -917
                  vmaxu.vv   v21,v4,v27,v0.t
                  lui        s6, 408332
                  vmornot.mm v0,v18,v9
                  vmandnot.mm v5,v20,v1
                  xori       s8, sp, -39
                  vmornot.mm v31,v10,v24
                  vmulhu.vv  v0,v0,v22
                  vadc.vvm   v14,v20,v19,v0
                  mulhu      ra, a1, sp
                  vmor.mm    v25,v31,v2
                  add        t4, a1, t5
                  vslideup.vx v23,v21,s7
                  sltiu      t4, s8, 547
                  vmor.mm    v30,v4,v6
                  srai       s6, zero, 20
                  vsub.vx    v27,v4,s8,v0.t
                  vmsleu.vx  v29,v20,zero,v0.t
                  srl        t2, s2, t2
                  xori       s6, a0, -416
                  vid.v v20,v0.t
                  slli       t3, s3, 4
                  vslideup.vx v3,v24,s10
                  sltu       ra, a6, s2
                  vsrl.vx    v26,v5,s10
                  vpopc.m zero,v18
                  vrsub.vi   v26,v17,0
                  vmxor.mm   v16,v19,v6
                  vslide1up.vx v12,v20,a2
                  vrgather.vx v17,v14,t2,v0.t
                  slti       s1, s11, -728
                  vmulh.vx   v23,v19,a4
                  vor.vx     v9,v19,s1
                  vsub.vx    v20,v12,a1,v0.t
                  vmnor.mm   v12,v4,v0
                  vminu.vv   v12,v26,v0,v0.t
                  vslide1down.vx v9,v7,a1,v0.t
                  addi       a7, a7, -500
                  vsub.vv    v10,v15,v18,v0.t
                  vmin.vx    v5,v16,s7,v0.t
                  vmslt.vx   v10,v9,t1
                  vmsif.m v17,v4,v0.t
                  or         a6, s5, t1
                  vmslt.vv   v5,v17,v21
                  and        t5, s11, s8
                  vxor.vv    v26,v26,v13,v0.t
                  srai       s1, ra, 2
                  vmaxu.vx   v7,v27,a4,v0.t
                  slt        t0, a7, ra
                  vmsle.vv   v7,v16,v5,v0.t
                  lui        a4, 453323
                  vmacc.vx   v19,s0,v11,v0.t
                  vslide1down.vx v4,v6,s11
                  vmsleu.vx  v29,v12,s10
                  vslide1down.vx v27,v8,gp,v0.t
                  vsrl.vi    v23,v23,0,v0.t
                  vmacc.vx   v15,s1,v27,v0.t
                  vmand.mm   v28,v0,v14
                  xor        t5, a5, s7
                  vmv.s.x v18,t6
                  vmxor.mm   v22,v14,v10
                  vmxnor.mm  v10,v26,v9
                  vmsgtu.vx  v21,v17,a2,v0.t
                  mulh       sp, s3, t5
                  slti       t0, a1, -483
                  vmadd.vv   v0,v2,v25
                  sub        s11, s8, s11
                  vpopc.m zero,v19,v0.t
                  vand.vi    v28,v27,0,v0.t
                  vmsif.m v14,v8
                  vmacc.vx   v15,a3,v25,v0.t
                  mulh       sp, a3, s2
                  vmslt.vx   v0,v9,a0
                  vmacc.vv   v17,v23,v10
                  addi       s1, gp, 642
                  sll        t5, s4, s6
                  mulhu      a3, t1, gp
                  vmand.mm   v2,v1,v9
                  or         s0, sp, a0
                  vslidedown.vx v29,v31,tp
                  sub        a7, t0, s1
                  vmsof.m v31,v3,v0.t
                  lui        sp, 289460
                  vmsne.vv   v0,v29,v20
                  vmulhsu.vv v0,v3,v18
                  vxor.vi    v3,v1,0
                  vadd.vi    v14,v10,0,v0.t
                  vmadd.vv   v12,v30,v22
                  vslide1up.vx v18,v6,s3
                  vsrl.vx    v6,v16,a1,v0.t
                  vsll.vx    v2,v3,s2,v0.t
                  vmseq.vi   v2,v1,0,v0.t
                  vmul.vv    v26,v8,v6,v0.t
                  vmsof.m v26,v27
                  viota.m v28,v16,v0.t
                  vslide1down.vx v20,v2,s4,v0.t
                  vmseq.vx   v11,v13,a4
                  vslide1down.vx v30,v24,a2,v0.t
                  vmul.vx    v24,v13,a1
                  add        t0, a1, a6
                  vmv.s.x v19,sp
                  vmslt.vx   v15,v14,s4
                  slti       s0, a4, 197
                  vslideup.vx v30,v2,s2
                  vor.vv     v15,v7,v5
                  vor.vv     v7,v8,v27
                  vmor.mm    v3,v7,v8
                  add        a0, s1, a3
                  vmulh.vx   v1,v16,a3,v0.t
                  vmsof.m v20,v10
                  vrsub.vx   v23,v18,s6,v0.t
                  slli       a1, s3, 12
                  vmv.v.i v30,0
                  vrsub.vi   v1,v7,0,v0.t
                  vsub.vv    v18,v1,v24
                  vpopc.m zero,v6,v0.t
                  vmsof.m v15,v2,v0.t
                  vmulhu.vx  v19,v1,t6,v0.t
                  sll        s0, s5, s6
                  vfirst.m zero,v17,v0.t
                  vxor.vx    v1,v7,ra,v0.t
                  or         sp, t5, s3
                  vslidedown.vx v29,v15,t3,v0.t
                  vmsne.vv   v21,v31,v27,v0.t
                  div        a4, ra, s11
                  vslideup.vi v1,v7,0,v0.t
                  div        s2, a2, t6
                  xor        s7, s0, s0
                  vslide1down.vx v22,v18,a6
                  srai       s5, t4, 13
                  vmul.vx    v28,v4,zero,v0.t
                  vor.vx     v29,v12,a4,v0.t
                  addi       s5, s7, 63
                  add        s0, gp, s1
                  srl        a1, t4, a0
                  srli       t2, s1, 9
                  vslide1down.vx v10,v12,s2,v0.t
                  vmxnor.mm  v13,v11,v1
                  vmornot.mm v8,v31,v7
                  sub        s0, a6, t1
                  viota.m v18,v24
                  vsll.vi    v19,v28,0,v0.t
                  vmandnot.mm v11,v22,v31
                  vsra.vx    v2,v13,t2
                  addi       a4, t4, -645
                  sltiu      a4, a6, 296
                  xor        t5, s8, s4
                  vmsleu.vi  v28,v24,0,v0.t
                  srl        s6, s4, a3
                  vmaxu.vx   v5,v11,s3,v0.t
                  vadc.vim   v1,v28,0,v0
                  slti       a3, a5, -755
                  vmul.vx    v27,v22,a5
                  slli       zero, zero, 27
                  vsrl.vi    v16,v23,0,v0.t
                  vmul.vv    v29,v9,v1
                  vmsif.m v17,v28
                  viota.m v14,v27
                  auipc      s11, 338182
                  remu       tp, a4, s7
                  vslide1down.vx v25,v16,s6
                  vmsbf.m v29,v17
                  and        s0, a3, a0
                  vand.vi    v14,v6,0
                  vmnand.mm  v9,v21,v7
                  vmv.v.x v22,a0
                  vminu.vv   v26,v0,v2,v0.t
                  add        zero, tp, a5
                  vmandnot.mm v8,v22,v3
                  sltiu      t0, a3, 920
                  sub        s7, a5, a2
                  vmadd.vx   v15,t5,v4
                  vfirst.m zero,v31,v0.t
                  vpopc.m zero,v0,v0.t
                  vmsif.m v29,v4,v0.t
                  mulhsu     zero, s8, sp
                  mulhsu     a2, s9, a4
                  mulh       t6, t0, gp
                  vmv.v.i v23,0
                  vmor.mm    v29,v26,v9
                  vmsltu.vx  v28,v5,s5
                  vmv.s.x v0,a7
                  lui        a4, 240547
                  sll        a4, t3, a1
                  add        t1, a6, t5
                  vmin.vx    v0,v10,ra
                  vmv.v.x v5,s2
                  add        t6, s8, gp
                  vminu.vx   v8,v27,tp
                  xori       a7, s1, -676
                  srli       a3, t1, 1
                  vid.v v19
                  lui        a2, 630492
                  vmulhsu.vv v1,v24,v28
                  vmin.vv    v20,v20,v25,v0.t
                  div        t1, t4, s7
                  vmsne.vx   v25,v29,s5
                  vsub.vx    v28,v23,gp,v0.t
                  mulhsu     t0, t4, s10
                  sll        s11, a2, gp
                  vmulhsu.vx v21,v10,t3
                  vadc.vvm   v10,v11,v30,v0
                  vmslt.vv   v15,v0,v26
                  vmnand.mm  v27,v29,v24
                  vmandnot.mm v26,v19,v23
                  auipc      s4, 888172
                  vrsub.vi   v12,v8,0
                  vor.vi     v26,v7,0,v0.t
                  sll        t5, s5, sp
                  srli       s11, s6, 3
                  sub        ra, s9, a3
                  vpopc.m zero,v11
                  srai       gp, t4, 6
                  mulhu      a2, s10, a5
                  vmor.mm    v19,v10,v18
                  vmv.s.x v13,a0
                  slti       t2, a4, -405
                  vmnor.mm   v6,v29,v16
                  div        a3, sp, t3
                  sub        s4, s2, s5
                  srl        a1, s7, a5
                  vrsub.vx   v27,v24,sp
                  vfirst.m zero,v25,v0.t
                  vmseq.vx   v25,v28,ra,v0.t
                  vand.vv    v8,v30,v24,v0.t
                  vmulhu.vx  v15,v1,a7,v0.t
                  vadc.vim   v19,v17,0,v0
                  vfirst.m zero,v18
                  vsub.vx    v12,v15,gp,v0.t
                  remu       s11, s9, t3
                  vmsne.vi   v3,v15,0
                  vsub.vx    v31,v28,t6
                  slli       gp, a3, 28
                  mulhsu     t2, s5, a0
                  vmand.mm   v4,v29,v4
                  vid.v v25
                  xor        a0, a3, s11
                  mul        t3, s8, t6
                  srl        t1, s6, tp
                  vmulhu.vx  v9,v29,t5
                  add        gp, t2, t3
                  vmin.vx    v16,v11,tp,v0.t
                  vmv.x.s zero,v22
                  mulhu      t6, s6, s5
                  sltiu      a1, a3, 517
                  vmxor.mm   v31,v26,v19
                  vrgather.vx v19,v26,a0,v0.t
                  auipc      s0, 637830
                  vfirst.m zero,v25,v0.t
                  remu       s1, t5, a7
                  vadc.vim   v11,v12,0,v0
                  vmsle.vi   v21,v30,0,v0.t
                  vmnor.mm   v14,v13,v14
                  vmv.s.x v22,a5
                  slt        a4, a6, s7
                  srli       t5, t3, 11
                  vmsgtu.vx  v0,v15,a4
                  vsub.vv    v3,v27,v28
                  vsrl.vx    v23,v14,s9,v0.t
                  vmslt.vx   v12,v17,s11,v0.t
                  vmacc.vx   v21,sp,v26,v0.t
                  sll        a6, a4, a7
                  mulhu      t3, tp, t6
                  vsra.vv    v7,v29,v4
                  andi       zero, gp, -349
                  vsra.vx    v1,v8,s8,v0.t
                  vpopc.m zero,v5
                  vmaxu.vv   v2,v31,v29,v0.t
                  vmxnor.mm  v19,v13,v13
                  vmulhsu.vv v9,v20,v30,v0.t
                  divu       tp, zero, t3
                  vmsif.m v0,v26
                  vmxor.mm   v13,v14,v27
                  vmsif.m v31,v0,v0.t
                  vfirst.m zero,v6
                  ori        a5, t0, -293
                  viota.m v1,v29,v0.t
                  viota.m v2,v30,v0.t
                  mulhu      sp, a4, s6
                  lui        t4, 342365
                  slti       zero, s10, 664
                  vslidedown.vx v25,v16,a7
                  vor.vv     v18,v1,v17
                  andi       tp, s8, 774
                  vslidedown.vi v18,v16,0
                  vmnor.mm   v18,v13,v10
                  viota.m v25,v8,v0.t
                  mul        a3, s10, t2
                  vsrl.vx    v0,v13,a1
                  slt        s4, s7, s5
                  vmax.vv    v20,v0,v28,v0.t
                  addi       s6, s5, 86
                  andi       t5, a1, -930
                  vand.vx    v0,v9,s9
                  vmandnot.mm v3,v16,v6
                  sub        a4, s3, a5
                  vmsne.vx   v25,v1,s6,v0.t
                  vmsleu.vi  v19,v23,0
                  remu       sp, a1, ra
                  srl        gp, sp, s9
                  vsub.vx    v2,v12,s0
                  sltu       t5, s9, ra
                  mul        ra, s5, a3
                  vmseq.vi   v4,v22,0,v0.t
                  vmsgtu.vi  v20,v24,0,v0.t
                  addi       ra, t0, -526
                  vminu.vx   v25,v8,t4,v0.t
                  sltiu      t0, a5, -163
                  ori        t3, t2, -856
                  srai       a1, gp, 8
                  vand.vx    v10,v13,s6,v0.t
                  vrsub.vi   v13,v27,0,v0.t
                  vsub.vv    v7,v11,v3
                  vmsleu.vi  v20,v2,0,v0.t
                  xor        a4, t1, t3
                  vmaxu.vv   v22,v4,v31
                  vxor.vv    v21,v13,v11,v0.t
                  or         t6, tp, a7
                  vsbc.vvm   v3,v7,v10,v0
                  vxor.vx    v21,v27,s3,v0.t
                  vmsltu.vx  v17,v14,tp,v0.t
                  andi       a0, t4, 840
                  sub        s2, a3, tp
                  srl        s7, t4, a6
                  vmv.x.s zero,v0
                  vmandnot.mm v2,v6,v25
                  slti       t5, a0, -966
                  vmand.mm   v6,v6,v0
                  xor        a0, s6, s0
                  add        t1, s7, t2
                  vsbc.vxm   v13,v29,s4,v0
                  lui        s8, 197022
                  andi       s0, a4, -511
                  vslide1up.vx v30,v1,a2,v0.t
                  vmul.vx    v10,v9,s9,v0.t
                  slt        ra, s4, s2
                  auipc      s5, 581614
                  vadc.vxm   v29,v27,a2,v0
                  vmandnot.mm v22,v8,v5
                  mulh       a4, s11, s5
                  srl        a2, sp, t5
                  vmin.vv    v31,v7,v28,v0.t
                  vmadd.vv   v17,v17,v18
                  vslide1down.vx v16,v21,zero
                  vmandnot.mm v27,v22,v9
                  vmnor.mm   v26,v28,v12
                  srl        gp, a2, s6
                  or         s4, t3, a1
                  viota.m v26,v11
                  rem        zero, s5, s6
                  vminu.vv   v28,v1,v8,v0.t
                  rem        t3, s6, s11
                  vmv.s.x v7,a4
                  vsll.vv    v22,v21,v17,v0.t
                  vmnand.mm  v30,v17,v27
                  vmsif.m v21,v31
                  vmulhu.vx  v3,v20,tp,v0.t
                  vslide1up.vx v30,v5,s3,v0.t
                  vmax.vx    v29,v9,s9
                  mulh       tp, s5, t1
                  slt        t4, s1, a1
                  vminu.vx   v15,v16,t0,v0.t
                  vslide1up.vx v25,v18,a7
                  div        s2, s1, s8
                  vrgather.vi v3,v0,0
                  vmseq.vi   v17,v13,0
                  vmv.v.v v24,v27
                  vmv.s.x v17,s0
                  div        s1, ra, s9
                  vmulhsu.vx v14,v26,s4,v0.t
                  sub        a5, s2, s5
                  vmsof.m v7,v3
                  vmulhu.vx  v10,v24,t2,v0.t
                  vsll.vx    v16,v20,s7
                  sll        gp, a7, zero
                  vsub.vv    v25,v25,v5
                  vmulhu.vx  v18,v16,t0,v0.t
                  vsrl.vv    v1,v25,v8,v0.t
                  srl        t0, a4, s4
                  vmv.x.s zero,v28
                  addi       a1, tp, 354
                  vmulhu.vx  v28,v28,s9,v0.t
                  vmv.x.s zero,v16
                  rem        sp, gp, s5
                  slti       s7, s10, 429
                  vmulhsu.vv v16,v14,v8
                  xor        s4, a5, s7
                  viota.m v31,v19
                  auipc      t1, 114138
                  andi       s1, a4, 404
                  vminu.vx   v26,v5,a5
                  vmsof.m v19,v26,v0.t
                  vmsleu.vx  v9,v14,t6,v0.t
                  vmulhu.vx  v13,v4,t0
                  vmsgtu.vi  v24,v1,0,v0.t
                  vadd.vi    v6,v22,0,v0.t
                  vsbc.vvm   v20,v21,v19,v0
                  mulhu      s6, a0, a0
                  vmsltu.vx  v2,v1,s9,v0.t
                  vmaxu.vx   v6,v12,s0
                  vadd.vv    v6,v21,v28
                  and        t1, zero, t5
                  vmul.vx    v13,v5,t1
                  div        tp, a4, t1
                  mulh       s2, a5, s3
                  sub        t1, t5, s5
                  vsub.vv    v25,v6,v15,v0.t
                  or         a0, t2, t4
                  vslide1down.vx v16,v25,t3
                  vmaxu.vx   v26,v11,t3
                  vmand.mm   v16,v1,v28
                  vmax.vv    v5,v9,v25
                  and        s6, s10, t6
                  divu       t5, s0, a0
                  slt        t0, a4, t4
                  vmornot.mm v8,v9,v27
                  ori        s7, s2, -834
                  andi       zero, a0, 971
                  vadd.vx    v6,v28,s7,v0.t
                  mulhsu     s6, a0, s8
                  mulhsu     s7, s6, a3
                  vslideup.vx v7,v4,t2,v0.t
                  vpopc.m zero,v21,v0.t
                  divu       s2, s8, s10
                  vmxnor.mm  v30,v9,v31
                  vmsof.m v26,v6,v0.t
                  vsbc.vvm   v6,v15,v7,v0
                  vminu.vv   v25,v30,v10,v0.t
                  viota.m v16,v25,v0.t
                  and        ra, s4, a4
                  vslide1down.vx v25,v0,ra,v0.t
                  vmxnor.mm  v20,v15,v6
                  vmnor.mm   v7,v29,v11
                  srai       t3, s3, 7
                  remu       a5, s3, t5
                  div        s0, t1, s5
                  ori        zero, t1, 784
                  vslide1up.vx v20,v16,t2,v0.t
                  srli       s1, a2, 28
                  vsbc.vxm   v24,v6,tp,v0
                  vmulhsu.vv v21,v27,v18
                  vslideup.vi v11,v26,0
                  vslidedown.vx v12,v13,t0,v0.t
                  remu       a6, a5, a1
                  vmax.vx    v9,v9,a2,v0.t
                  vmsof.m v27,v15
                  mul        t4, s9, s3
                  xori       a3, t4, 617
                  mulhu      s11, a6, s4
                  vslide1up.vx v18,v11,sp,v0.t
                  vmnand.mm  v6,v4,v21
                  vslide1down.vx v30,v24,gp,v0.t
                  vmnor.mm   v17,v27,v1
                  auipc      a6, 900881
                  slt        t6, sp, s0
                  vmv.x.s zero,v11
                  vor.vx     v10,v6,s0
                  vslide1up.vx v0,v27,t3
                  vsll.vx    v30,v14,a4
                  div        a5, a2, s4
                  vsub.vv    v11,v30,v16,v0.t
                  vmxnor.mm  v3,v15,v11
                  vmin.vx    v27,v6,tp
                  slti       t3, sp, 538
                  vsbc.vxm   v1,v25,t0,v0
                  vmsne.vv   v28,v3,v2
                  vrsub.vi   v21,v24,0,v0.t
                  vand.vx    v5,v17,t5
                  vand.vi    v30,v19,0
                  vmadd.vx   v4,t0,v21,v0.t
                  vmsltu.vv  v28,v21,v19,v0.t
                  div        s7, t4, s1
                  vid.v v10
                  vmsltu.vv  v13,v16,v17,v0.t
                  sra        t5, s0, a0
                  vmsle.vi   v15,v31,0,v0.t
                  vxor.vv    v27,v5,v17,v0.t
                  vslide1down.vx v10,v1,t6,v0.t
                  vadc.vim   v26,v8,0,v0
                  xori       zero, ra, 21
                  vmseq.vx   v30,v8,t2
                  vsbc.vvm   v30,v15,v4,v0
                  mulhsu     t2, t2, t1
                  vsra.vx    v15,v31,s9,v0.t
                  vmulh.vv   v22,v17,v28
                  vrsub.vx   v23,v12,tp,v0.t
                  sub        s4, s0, s4
                  vsbc.vxm   v9,v0,a7,v0
                  vmsgtu.vi  v19,v5,0,v0.t
                  srai       t2, gp, 4
                  andi       tp, t1, -35
                  vmv.v.i v13,0
                  vid.v v1,v0.t
                  vminu.vv   v21,v28,v12,v0.t
                  div        t0, s10, gp
                  and        a0, s3, a7
                  vrsub.vi   v3,v31,0,v0.t
                  vor.vv     v21,v5,v28,v0.t
                  mul        s8, s7, s2
                  and        s0, s5, a4
                  vmandnot.mm v2,v17,v2
                  vadc.vxm   v17,v28,t5,v0
                  slt        a6, a2, t2
                  vmv.x.s zero,v16
                  vmul.vv    v25,v22,v28
                  vsbc.vvm   v6,v25,v15,v0
                  vmax.vx    v23,v29,s0,v0.t
                  vxor.vv    v0,v16,v5
                  xor        s8, a2, t4
                  lui        zero, 30229
                  vadc.vvm   v29,v29,v24,v0
                  vmnand.mm  v28,v16,v22
                  vmand.mm   v2,v5,v30
                  vmadd.vx   v4,zero,v31
                  vmsof.m v1,v11
                  remu       t3, sp, t1
                  rem        t6, s5, t2
                  xori       sp, t1, 895
                  andi       s0, s2, 190
                  vfirst.m zero,v29,v0.t
                  vsll.vi    v27,v10,0
                  andi       a3, t5, -484
                  vmul.vv    v0,v28,v28
                  remu       s5, s8, a7
                  and        s7, a3, s9
                  vmadd.vv   v24,v10,v4,v0.t
                  vmsleu.vx  v24,v9,a0,v0.t
                  vmsif.m v17,v13
                  vand.vx    v17,v10,a0
                  xor        a2, a7, s8
                  srli       a0, a7, 5
                  slt        tp, s3, zero
                  vsbc.vxm   v4,v8,s6,v0
                  vslidedown.vx v9,v13,gp
                  mul        s1, a3, s2
                  rem        ra, a5, s11
                  remu       ra, a7, s4
                  vmsltu.vv  v15,v21,v11
                  xori       s8, a4, 373
                  vand.vv    v29,v12,v27
                  mul        a7, a2, s0
                  vmsle.vv   v27,v16,v10,v0.t
                  vmslt.vv   v22,v20,v10
                  vmnand.mm  v7,v23,v1
                  vmsbf.m v10,v18
                  vmacc.vv   v18,v21,v12
                  vmsgt.vi   v15,v20,0
                  div        s2, t2, sp
                  vmxnor.mm  v30,v18,v30
                  remu       a4, a3, tp
                  auipc      s2, 190867
                  vor.vx     v26,v28,s6,v0.t
                  vsrl.vx    v10,v28,s7,v0.t
                  vmslt.vv   v27,v12,v15
                  slli       t6, sp, 8
                  rem        s7, a7, s9
                  divu       zero, gp, s7
                  vmsleu.vv  v14,v17,v5,v0.t
                  vmadd.vx   v10,s6,v3,v0.t
                  vpopc.m zero,v21
                  vslide1up.vx v31,v25,s7
                  rem        a6, a7, s7
                  vslidedown.vi v17,v22,0
                  vmulhu.vx  v26,v2,s2,v0.t
                  vadd.vv    v10,v5,v19
                  add        a1, gp, sp
                  vmin.vv    v12,v3,v8
                  vslide1down.vx v19,v8,t1,v0.t
                  slti       s7, t5, -648
                  vmornot.mm v2,v3,v1
                  vmnor.mm   v9,v14,v30
                  vadc.vxm   v11,v29,t0,v0
                  slt        s6, ra, t0
                  vmnand.mm  v27,v31,v28
                  vmsbf.m v23,v17
                  slli       a3, a4, 28
                  mul        s7, s10, a0
                  vmsleu.vx  v25,v26,a2
                  vmsleu.vi  v0,v4,0
                  lui        t2, 413985
                  vfirst.m zero,v13
                  vminu.vx   v29,v10,a7
                  mulh       a6, t4, zero
                  viota.m v1,v15,v0.t
                  mulhu      a0, a2, t0
                  vslidedown.vx v27,v15,a1
                  vpopc.m zero,v13
                  divu       a2, s6, s9
                  sltu       s0, a7, zero
                  add        t2, t0, a2
                  vmv.s.x v17,s7
                  mulhu      a2, a7, t0
                  vmsne.vx   v23,v30,t1
                  sub        s7, gp, s4
                  srl        t1, t6, a5
                  vmul.vv    v28,v24,v28,v0.t
                  sra        s11, t6, t3
                  xori       sp, s8, 386
                  vmaxu.vv   v27,v21,v13
                  srai       zero, s0, 16
                  or         a7, s7, t5
                  vid.v v4
                  vslideup.vi v24,v7,0
                  mulhu      s11, sp, t4
                  slli       s7, tp, 0
                  vmsleu.vi  v26,v25,0,v0.t
                  vsub.vv    v24,v5,v5,v0.t
                  xori       a3, ra, -112
                  vfirst.m zero,v19
                  vmandnot.mm v26,v31,v26
                  vsbc.vxm   v2,v26,ra,v0
                  sltiu      a4, a0, 879
                  vfirst.m zero,v6
                  slt        t0, t6, s10
                  vmsgt.vx   v2,v29,t2,v0.t
                  vmsleu.vv  v23,v27,v12,v0.t
                  vmadd.vx   v0,s4,v3
                  vpopc.m zero,v15
                  vmulh.vx   v8,v21,ra,v0.t
                  sltiu      t3, a3, 125
                  sltu       ra, s0, t0
                  vmslt.vx   v11,v13,s8,v0.t
                  srai       s4, a7, 26
                  vslidedown.vx v19,v28,t0
                  slt        tp, t1, a1
                  vmsgt.vx   v13,v3,t4,v0.t
                  vadd.vv    v25,v2,v7,v0.t
                  srli       a5, zero, 23
                  slt        a6, a0, t0
                  vmsle.vx   v0,v2,ra
                  vsll.vv    v22,v2,v18,v0.t
                  slt        a7, s5, t6
                  vmxor.mm   v11,v22,v19
                  vadd.vx    v31,v12,s11
                  vfirst.m zero,v13
                  vmulhu.vv  v8,v4,v19,v0.t
                  xor        t5, a2, s4
                  ori        a2, t2, -497
                  vslideup.vi v20,v9,0,v0.t
                  vminu.vv   v18,v19,v6
                  mul        a1, gp, s9
                  vmsgt.vx   v12,v16,s8,v0.t
                  vxor.vv    v27,v8,v19
                  vmsleu.vx  v10,v18,gp
                  vmornot.mm v9,v23,v16
                  vmsltu.vx  v17,v27,t0,v0.t
                  divu       a0, a4, s7
                  vmsbf.m v13,v18
                  vmandnot.mm v21,v11,v1
                  vsrl.vi    v21,v7,0
                  or         t4, a2, sp
                  vmsif.m v30,v21,v0.t
                  vmslt.vx   v10,v15,ra,v0.t
                  vand.vx    v24,v29,s5,v0.t
                  or         a3, t2, s3
                  vrsub.vx   v2,v20,a2,v0.t
                  mulhu      a3, gp, s3
                  ori        ra, s11, 77
                  vmxnor.mm  v21,v15,v15
                  vmacc.vv   v19,v29,v23,v0.t
                  vsub.vx    v8,v30,sp
                  vor.vi     v11,v6,0,v0.t
                  vmv.x.s zero,v13
                  sltu       a7, s0, s2
                  vmsle.vv   v11,v9,v26,v0.t
                  vmxor.mm   v24,v7,v28
                  vmv.v.v v26,v3
                  vadd.vx    v6,v13,a4
                  vor.vx     v19,v10,s11
                  srai       sp, t1, 20
                  vmsbf.m v6,v18
                  rem        t5, t0, s2
                  ori        ra, a7, -593
                  vmin.vv    v13,v5,v0
                  vslide1up.vx v27,v6,s2,v0.t
                  andi       zero, gp, 259
                  and        a3, a0, t4
                  vslide1up.vx v14,v12,s11,v0.t
                  xor        t2, a3, t6
                  vmandnot.mm v3,v28,v1
                  vmandnot.mm v26,v15,v10
                  vxor.vx    v21,v12,t6
                  lui        ra, 416212
                  andi       a5, s11, -528
                  vmv.v.i v28,0
                  vmnand.mm  v7,v12,v7
                  addi       t3, a2, 428
                  vand.vx    v8,v23,t1,v0.t
                  vmulh.vv   v2,v29,v19,v0.t
                  vmin.vx    v11,v24,s6,v0.t
                  srli       t1, gp, 30
                  sltiu      s5, s4, 914
                  addi       a1, tp, -524
                  sltiu      a2, s10, 109
                  vsbc.vvm   v15,v29,v11,v0
                  vsrl.vv    v5,v21,v26
                  div        a2, s9, sp
                  vmnor.mm   v5,v6,v27
                  srli       s1, a2, 26
                  auipc      a6, 75694
                  srai       t3, s10, 17
                  vsra.vx    v17,v3,s2,v0.t
                  vmandnot.mm v20,v24,v20
                  vfirst.m zero,v4,v0.t
                  vmadd.vx   v23,tp,v7
                  vmulhsu.vx v8,v13,s6,v0.t
                  vmxnor.mm  v9,v28,v13
                  vmornot.mm v0,v6,v31
                  xori       s11, s4, 205
                  vmsgtu.vi  v24,v28,0,v0.t
                  vrsub.vx   v23,v31,s2,v0.t
                  vmnor.mm   v31,v11,v13
                  vmsgt.vi   v25,v2,0,v0.t
                  slti       a0, tp, -132
                  slti       t2, tp, -914
                  vmsif.m v18,v15,v0.t
                  vslide1up.vx v18,v3,t3,v0.t
                  vadd.vx    v25,v9,t5
                  sltiu      tp, t6, -72
                  vmv.v.v v21,v13
                  vmnor.mm   v31,v1,v18
                  auipc      s2, 971423
                  vmnor.mm   v11,v26,v18
                  div        s11, t4, ra
                  vmand.mm   v22,v5,v0
                  divu       a6, s5, zero
                  vmax.vv    v31,v25,v30,v0.t
                  sub        a1, a1, a6
                  mul        t2, a5, s7
                  viota.m v31,v27,v0.t
                  vmv.s.x v22,tp
                  vmsif.m v11,v17,v0.t
                  vmsne.vi   v13,v15,0,v0.t
                  srai       a6, t5, 9
                  vmxnor.mm  v20,v3,v10
                  or         gp, s9, a1
                  or         s2, a5, a0
                  vmaxu.vv   v11,v0,v20,v0.t
                  vmsltu.vv  v14,v22,v26
                  vslide1down.vx v5,v30,s5,v0.t
                  vadd.vv    v24,v8,v11,v0.t
                  divu       s7, s10, t1
                  vsrl.vx    v16,v19,s10,v0.t
                  vslidedown.vx v16,v24,t1
                  vsub.vx    v0,v1,t6
                  vmornot.mm v0,v7,v5
                  div        tp, t3, tp
                  vmin.vv    v27,v25,v8
                  vmacc.vv   v9,v4,v23,v0.t
                  vslide1down.vx v17,v12,gp,v0.t
                  slli       a0, s0, 2
                  mulhsu     s7, a2, s7
                  vadc.vim   v21,v15,0,v0
                  lui        s0, 411407
                  vmornot.mm v6,v28,v19
                  vrsub.vx   v24,v22,t1,v0.t
                  vrsub.vx   v4,v14,a0,v0.t
                  srli       a5, a4, 9
                  vslidedown.vx v28,v7,a0
                  vslide1up.vx v20,v3,s5,v0.t
                  and        zero, ra, s11
                  vrgather.vi v1,v4,0
                  vsll.vi    v0,v8,0
                  vmulh.vx   v18,v29,s8,v0.t
                  xor        a0, t6, sp
                  vmandnot.mm v16,v8,v11
                  slti       ra, t3, -1007
                  vmsif.m v27,v20
                  vmandnot.mm v18,v27,v22
                  srai       zero, s7, 13
                  rem        t1, t4, ra
                  vmsof.m v2,v29
                  vmnor.mm   v4,v0,v3
                  vmornot.mm v3,v8,v16
                  vmandnot.mm v23,v29,v7
                  vmseq.vv   v8,v19,v0,v0.t
                  andi       a3, t5, -787
                  vmnand.mm  v28,v22,v21
                  vmsgt.vi   v29,v31,0,v0.t
                  vmnand.mm  v26,v1,v28
                  slli       a0, t4, 11
                  auipc      a3, 330388
                  sll        t0, t1, t2
                  vmsne.vv   v12,v8,v26,v0.t
                  vfirst.m zero,v3
                  vmsgtu.vi  v19,v16,0
                  or         a1, t3, t1
                  vmaxu.vv   v2,v13,v17,v0.t
                  vmin.vv    v23,v1,v15
                  divu       t0, a4, s5
                  vmv.s.x v15,s2
                  vmsgtu.vi  v18,v19,0,v0.t
                  sra        t3, s4, t3
                  vslidedown.vx v19,v21,t3
                  sltu       zero, s1, s7
                  xori       t1, s3, 987
                  sltu       t3, t5, s2
                  xori       gp, s4, -253
                  vmulhu.vx  v26,v20,s0,v0.t
                  vmandnot.mm v20,v24,v7
                  vslide1up.vx v23,v19,t1
                  srai       s5, s7, 16
                  vsbc.vvm   v19,v15,v3,v0
                  vmxnor.mm  v15,v12,v22
                  slt        a1, t4, a5
                  vpopc.m zero,v26
                  xori       t0, s11, 919
                  vsra.vi    v6,v14,0
                  vmandnot.mm v16,v8,v3
                  vmsif.m v23,v17,v0.t
                  vmv.v.i v28,0
                  srli       sp, tp, 11
                  andi       s2, zero, 472
                  slli       a4, s6, 29
                  and        s8, s7, s8
                  ori        t0, ra, 250
                  vmsle.vx   v9,v6,s10
                  vand.vi    v15,v0,0
                  vmsof.m v12,v0,v0.t
                  vmxnor.mm  v0,v9,v29
                  slti       a1, s9, 840
                  srai       a4, a1, 26
                  vmandnot.mm v27,v19,v7
                  vmnor.mm   v5,v5,v11
                  vmadd.vv   v0,v10,v26
                  vor.vx     v9,v19,s7
                  vand.vi    v0,v26,0
                  vmsle.vv   v11,v4,v22
                  vmv.x.s zero,v13
                  vmax.vx    v31,v0,a5,v0.t
                  vmxor.mm   v15,v25,v15
                  vmsleu.vi  v29,v3,0
                  slt        ra, t1, a0
                  vsub.vx    v20,v6,a7,v0.t
                  vadc.vvm   v23,v29,v1,v0
                  divu       s7, t3, gp
                  vfirst.m zero,v20
                  vmandnot.mm v9,v12,v31
                  mul        a7, gp, s1
                  vfirst.m zero,v12,v0.t
                  vmsgt.vi   v5,v8,0
                  vmaxu.vx   v17,v15,t5,v0.t
                  vmsne.vi   v23,v10,0,v0.t
                  viota.m v7,v12
                  andi       a2, s5, 169
                  vmul.vv    v9,v17,v25,v0.t
                  vmsof.m v2,v20,v0.t
                  and        a2, zero, a4
                  srl        a0, s10, zero
                  vmsleu.vi  v19,v11,0
                  vsra.vx    v14,v1,s10,v0.t
                  add        s8, s7, a1
                  vrgather.vv v10,v25,v19
                  vmacc.vv   v30,v11,v26
                  vmandnot.mm v5,v19,v31
                  vrsub.vi   v4,v11,0,v0.t
                  addi       tp, s2, -984
                  div        t0, s7, a5
                  rem        s2, t2, zero
                  vminu.vx   v15,v3,t4,v0.t
                  remu       s7, a2, t0
                  rem        s1, ra, a7
                  vslide1down.vx v24,v17,a7,v0.t
                  vand.vi    v20,v8,0
                  vmulhu.vv  v5,v27,v8,v0.t
                  remu       a7, t1, s7
                  slli       t0, a0, 18
                  xori       sp, a6, -685
                  vmand.mm   v10,v29,v31
                  div        a3, a7, a4
                  vmacc.vx   v10,a1,v12
                  vfirst.m zero,v1
                  vmv.x.s zero,v9
                  vmseq.vv   v12,v5,v19
                  sltu       ra, s3, sp
                  vmv.s.x v1,t3
                  vrgather.vv v24,v28,v1
                  mulh       t3, s0, s11
                  add        t5, t5, ra
                  divu       t0, s6, t1
                  xor        sp, a1, s7
                  mulhu      gp, zero, s9
                  vsbc.vxm   v18,v4,s8,v0
                  vsra.vx    v15,v2,a6
                  mulhsu     s8, a7, t0
                  vmulhu.vv  v30,v2,v11
                  vsrl.vv    v3,v28,v24
                  vxor.vv    v23,v31,v29
                  vminu.vv   v19,v10,v6
                  sub        a0, a4, s2
                  vand.vi    v30,v20,0,v0.t
                  vmsleu.vi  v15,v24,0
                  sra        a1, sp, s6
                  sltu       t2, a1, s1
                  mulh       a5, ra, t6
                  vmulhu.vx  v21,v19,s8
                  vmsgt.vx   v6,v0,t5
                  slti       s1, t4, -409
                  vmadd.vx   v24,s10,v4
                  vpopc.m zero,v11
                  vmseq.vv   v15,v12,v21,v0.t
                  vmadd.vv   v1,v28,v16
                  vmin.vx    v6,v5,s6
                  auipc      t1, 27401
                  vmulhsu.vx v13,v29,a4,v0.t
                  vmsle.vi   v20,v19,0
                  srai       t6, a6, 20
                  slt        a4, s4, s11
                  vmsleu.vi  v9,v11,0,v0.t
                  vsrl.vi    v16,v6,0,v0.t
                  vrgather.vv v24,v12,v3,v0.t
                  vmacc.vx   v0,s5,v2
                  vslide1up.vx v9,v5,s9
                  vxor.vi    v16,v20,0,v0.t
                  divu       t0, a5, s1
                  vmul.vx    v14,v21,s9
                  remu       s0, t6, a2
                  divu       sp, t4, s8
                  vmul.vx    v14,v7,t4,v0.t
                  lui        s11, 709732
                  vmsltu.vv  v9,v2,v16,v0.t
                  vmsle.vx   v11,v15,tp,v0.t
                  vmulhsu.vv v18,v17,v31,v0.t
                  addi       s5, t0, 284
                  vslide1up.vx v18,v29,s11,v0.t
                  divu       t2, a2, a1
                  vmaxu.vx   v31,v27,s8
                  vmor.mm    v13,v4,v15
                  div        a2, t1, a5
                  mulhu      s1, s11, tp
                  slt        sp, s1, gp
                  mulhsu     tp, s8, s3
                  slt        zero, t0, s5
                  add        t1, s5, a2
                  srl        t6, s4, gp
                  vmnor.mm   v16,v10,v17
                  vmin.vv    v20,v0,v20
                  vmulh.vx   v27,v27,s1,v0.t
                  srli       t5, t5, 30
                  vslide1down.vx v24,v23,s9
                  div        s0, s9, a2
                  vslideup.vx v5,v0,a1,v0.t
                  vand.vv    v22,v19,v11,v0.t
                  vsub.vx    v23,v18,gp,v0.t
                  slli       t4, a1, 1
                  vmsleu.vv  v28,v8,v3
                  auipc      t1, 322754
                  vmxnor.mm  v2,v13,v7
                  vminu.vx   v17,v6,s6,v0.t
                  vmadd.vv   v0,v3,v27
                  vmadd.vv   v9,v17,v12
                  vmulhsu.vx v0,v6,a7
                  vmulhsu.vx v2,v2,s2,v0.t
                  mul        sp, s9, s4
                  vmv.x.s zero,v3
                  vsbc.vvm   v21,v3,v18,v0
                  vand.vv    v8,v23,v16,v0.t
                  vmv.x.s zero,v7
                  vmandnot.mm v21,v31,v13
                  xor        a1, s4, gp
                  andi       a5, s2, 954
                  mul        zero, s9, ra
                  auipc      t2, 651411
                  vmul.vx    v31,v28,a1,v0.t
                  srli       s0, a6, 9
                  vmin.vx    v5,v24,t5,v0.t
                  vslide1up.vx v7,v28,t4
                  sub        s7, s7, zero
                  vslide1up.vx v20,v23,s5,v0.t
                  vmsof.m v9,v28
                  vmsof.m v23,v29
                  vmnand.mm  v31,v24,v29
                  viota.m v3,v19
                  or         tp, tp, ra
                  vsra.vx    v23,v29,s6
                  vrgather.vx v8,v22,zero,v0.t
                  divu       tp, s9, a0
                  sltu       a0, a1, s3
                  vsub.vv    v16,v16,v18,v0.t
                  sra        t0, a2, a1
                  vmsltu.vv  v10,v17,v17
                  srl        s0, t0, s0
                  vmandnot.mm v3,v9,v28
                  vmax.vv    v10,v16,v8,v0.t
                  vminu.vx   v14,v0,s8
                  vmin.vv    v12,v28,v18,v0.t
                  vmulhu.vx  v18,v4,s8
                  vmand.mm   v13,v30,v6
                  vfirst.m zero,v15
                  xor        s2, t3, s4
                  vxor.vv    v25,v21,v28
                  vmadd.vx   v17,s10,v29,v0.t
                  vmul.vv    v13,v1,v14,v0.t
                  mulhu      t1, s4, a0
                  vxor.vi    v6,v19,0,v0.t
                  sra        s0, a3, t3
                  vmulhsu.vx v19,v11,t2
                  vsll.vv    v27,v28,v10
                  lui        a0, 587991
                  mul        s7, s8, gp
                  vmulh.vx   v5,v4,s10
                  or         t0, a3, t0
                  vmsltu.vv  v13,v30,v8,v0.t
                  sltiu      a3, a3, -223
                  rem        t1, t6, s2
                  vslide1up.vx v27,v9,s1,v0.t
                  vmulhsu.vx v31,v12,t5
                  vmadd.vx   v10,t2,v30,v0.t
                  vmsltu.vv  v23,v28,v28,v0.t
                  mulh       a3, t5, t6
                  vadc.vvm   v8,v14,v3,v0
                  vmxnor.mm  v16,v20,v23
                  vmsif.m v31,v3
                  vmandnot.mm v22,v15,v30
                  vrsub.vi   v19,v29,0
                  vmv.s.x v25,a6
                  vmacc.vx   v10,t5,v8
                  vmaxu.vv   v24,v21,v25,v0.t
                  vmsgt.vi   v17,v15,0
                  vor.vi     v6,v9,0,v0.t
                  vsub.vv    v25,v11,v26,v0.t
                  sub        t1, s8, s1
                  mulhu      t1, t2, tp
                  vsrl.vv    v10,v1,v3
                  ori        a5, t2, 388
                  vmulh.vv   v13,v30,v13,v0.t
                  vmulh.vv   v18,v13,v26,v0.t
                  sltu       s5, a2, t0
                  slt        s11, a0, s6
                  slti       s11, t1, 1010
                  vslideup.vi v12,v16,0,v0.t
                  lui        t0, 298707
                  slt        ra, a4, t3
                  sltu       t5, a3, t2
                  vadc.vxm   v4,v12,zero,v0
                  vsbc.vvm   v9,v13,v24,v0
                  vslide1up.vx v26,v21,t5,v0.t
                  vsrl.vi    v18,v20,0,v0.t
                  vminu.vx   v16,v22,t1,v0.t
                  vmul.vv    v13,v10,v18,v0.t
                  divu       t3, a0, t6
                  vmsgt.vx   v31,v26,gp
                  srli       a2, t4, 28
                  vmsbf.m v20,v15,v0.t
                  vor.vx     v5,v21,t5
                  srai       s7, a1, 9
                  vmand.mm   v7,v14,v9
                  vmul.vv    v22,v18,v20,v0.t
                  vadd.vv    v28,v29,v19,v0.t
                  vmsleu.vv  v7,v15,v1,v0.t
                  remu       t4, s2, s11
                  vmv.x.s zero,v24
                  vmseq.vv   v14,v6,v4
                  vmsleu.vi  v17,v10,0,v0.t
                  vmul.vv    v0,v25,v17
                  xor        gp, a5, a3
                  vmv.s.x v14,t1
                  vid.v v13
                  xori       a0, t5, 74
                  vmornot.mm v24,v23,v13
                  vmsgt.vx   v23,v3,s7
                  vadc.vxm   v11,v11,tp,v0
                  lui        t2, 958637
                  vslidedown.vi v17,v15,0
                  vmv.x.s zero,v0
                  sra        a2, a0, zero
                  vmaxu.vx   v12,v13,a0
                  vor.vv     v31,v1,v12
                  vmsle.vx   v7,v8,s3
                  vmsgt.vx   v19,v14,t2,v0.t
                  vand.vi    v5,v13,0,v0.t
                  vand.vi    v26,v7,0,v0.t
                  slti       s4, s9, 991
                  rem        a2, s8, a6
                  divu       s7, a5, t6
                  vmor.mm    v16,v25,v24
                  vmulhu.vv  v12,v15,v30,v0.t
                  vmin.vv    v20,v14,v25,v0.t
                  vmnand.mm  v21,v12,v19
                  vmax.vx    v30,v13,s7
                  xori       s4, t6, 838
                  vmulhsu.vx v5,v27,a7
                  slli       s5, sp, 11
                  vmsgt.vx   v11,v16,s1,v0.t
                  vmsgt.vx   v5,v21,s2
                  vmacc.vx   v16,t1,v5
                  srli       ra, a7, 21
                  vsbc.vxm   v31,v18,s10,v0
                  sltiu      a2, a5, 79
                  or         s1, s6, a3
                  vmsne.vv   v16,v9,v22
                  vmand.mm   v3,v26,v12
                  mulhsu     s11, s5, gp
                  mulh       sp, s7, a4
                  sltu       s0, s8, s7
                  sltu       s7, s0, s1
                  vsll.vi    v6,v18,0
                  vmsgtu.vx  v3,v1,a2
                  andi       a4, s0, -622
                  srli       gp, s1, 31
                  srli       s4, a2, 11
                  vpopc.m zero,v17
                  mul        a6, s11, a7
                  vsll.vv    v26,v12,v20
                  vsub.vv    v9,v0,v13,v0.t
                  srl        s8, a4, a5
                  vmxor.mm   v17,v1,v18
                  vmsbf.m v17,v3
                  vmnand.mm  v4,v1,v0
                  slti       a5, s9, 591
                  vrgather.vv v13,v9,v11,v0.t
                  vxor.vx    v18,v5,s1,v0.t
                  vsra.vv    v25,v6,v10
                  auipc      s8, 52674
                  sltu       a1, t0, s5
                  xori       s2, a2, 566
                  vmsif.m v9,v7,v0.t
                  vid.v v17
                  andi       a7, t4, 19
                  vmnor.mm   v18,v5,v26
                  vor.vv     v5,v18,v17
                  vslide1up.vx v20,v23,s6
                  mulhsu     t1, t3, a2
                  lui        s11, 111994
                  vmnor.mm   v0,v17,v2
                  sltu       t2, tp, zero
                  divu       tp, t6, a0
                  vmin.vv    v8,v23,v23
                  vxor.vi    v13,v8,0,v0.t
                  slli       t4, t5, 11
                  sltu       s8, s3, t4
                  vmv.v.v v22,v28
                  vmsle.vi   v18,v13,0,v0.t
                  vsll.vv    v4,v2,v7
                  xori       gp, s0, -16
                  vslide1up.vx v0,v13,a3
                  vadc.vvm   v22,v24,v27,v0
                  vmsof.m v14,v13,v0.t
                  vsbc.vvm   v3,v30,v17,v0
                  vpopc.m zero,v5
                  vmsgt.vx   v10,v4,s4
                  vsub.vx    v6,v23,a4,v0.t
                  xori       s11, a5, -354
                  vmsgtu.vx  v2,v13,s11,v0.t
                  vfirst.m zero,v5
                  add        t6, s11, s3
                  vmaxu.vx   v1,v12,a3,v0.t
                  divu       t6, s4, s9
                  andi       s7, a0, 945
                  vmnor.mm   v8,v7,v7
                  vmsltu.vx  v17,v28,s10,v0.t
                  ori        sp, t6, -755
                  sll        tp, a4, t1
                  vmxnor.mm  v17,v28,v1
                  vminu.vx   v8,v24,a3,v0.t
                  vmulhsu.vv v7,v15,v3
                  divu       s2, a4, s3
                  add        a0, s4, s8
                  vmadd.vv   v11,v29,v11,v0.t
                  vmsgt.vi   v6,v28,0
                  srli       t0, t0, 25
                  vfirst.m zero,v25
                  vand.vx    v1,v3,s10
                  remu       a1, s0, a0
                  vmsgt.vi   v30,v3,0
                  vsub.vx    v4,v24,a1
                  vid.v v18,v0.t
                  vid.v v10,v0.t
                  vsbc.vvm   v10,v12,v31,v0
                  vmsgtu.vx  v1,v29,s2,v0.t
                  vmsne.vi   v25,v23,0
                  vmadd.vx   v6,s3,v26
                  mulh       s8, a7, t5
                  ori        s2, a0, 986
                  mulh       t5, ra, t3
                  vmulh.vv   v11,v10,v11,v0.t
                  vrgather.vi v0,v20,0
                  vslide1down.vx v23,v10,a3,v0.t
                  sltiu      s1, t4, -77
                  vmsif.m v2,v17
                  vpopc.m zero,v13
                  vsub.vv    v17,v30,v14,v0.t
                  viota.m v4,v12
                  vmsgtu.vi  v31,v22,0
                  vfirst.m zero,v26,v0.t
                  srl        t3, t5, a7
                  vsbc.vvm   v24,v18,v14,v0
                  vslide1down.vx v29,v24,s5
                  vmslt.vx   v31,v22,t5
                  vmaxu.vv   v24,v27,v30
                  srl        a7, t1, a5
                  vmsle.vv   v27,v5,v11,v0.t
                  vmacc.vx   v20,s6,v13
                  vmnor.mm   v31,v16,v18
                  vslidedown.vi v15,v20,0,v0.t
                  andi       ra, a7, -248
                  vsbc.vxm   v19,v12,zero,v0
                  vmxor.mm   v6,v13,v1
                  vslide1up.vx v2,v25,s5
                  vmandnot.mm v26,v11,v23
                  vmacc.vx   v8,t1,v1,v0.t
                  vmand.mm   v10,v1,v9
                  vmxor.mm   v18,v21,v20
                  xori       ra, ra, -868
                  vrgather.vx v2,v30,s8,v0.t
                  vsll.vi    v0,v6,0
                  vmv.s.x v3,s2
                  viota.m v15,v7
                  vand.vx    v15,v13,s6
                  vsub.vx    v4,v10,s0
                  vmor.mm    v12,v13,v29
                  slli       zero, s0, 22
                  vmsltu.vv  v2,v0,v16
                  vmseq.vx   v12,v10,t2,v0.t
                  vxor.vi    v22,v28,0
                  vadd.vv    v8,v29,v8
                  mulhsu     t4, a0, gp
                  vmsgt.vi   v30,v7,0,v0.t
                  vsra.vv    v23,v13,v31,v0.t
                  vmin.vx    v31,v1,a0
                  vid.v v10,v0.t
                  vmv.x.s zero,v17
                  mulh       s4, t1, t0
                  vfirst.m zero,v16,v0.t
                  vmax.vv    v8,v22,v3,v0.t
                  mulh       a5, s6, a1
                  vmv.s.x v8,t2
                  slli       t4, s7, 15
                  vmsne.vx   v20,v19,a0,v0.t
                  vmv.v.i v30,0
                  srl        t1, s1, t5
                  vmnand.mm  v0,v23,v18
                  vadd.vi    v17,v11,0
                  vmulhu.vv  v22,v17,v9
                  vmul.vx    v22,v31,a4
                  sra        a1, a6, s1
                  sll        s7, s8, gp
                  vsll.vv    v26,v23,v13,v0.t
                  vmv.x.s zero,v27
                  vslide1down.vx v20,v23,s0
                  vmslt.vv   v15,v21,v11
                  viota.m v15,v7
                  addi       a5, a6, 445
                  viota.m v8,v7,v0.t
                  vmornot.mm v1,v14,v5
                  vmnor.mm   v12,v3,v7
                  vmxnor.mm  v10,v22,v0
                  vmadd.vx   v15,a3,v4
                  vmsne.vi   v31,v6,0,v0.t
                  vmin.vx    v21,v29,a1
                  divu       ra, s2, a5
                  srl        ra, gp, a7
                  vmsleu.vi  v31,v28,0
                  vmv.v.i v21,0
                  auipc      s6, 115247
                  vslide1down.vx v27,v8,a0
                  vpopc.m zero,v3,v0.t
                  viota.m v3,v8
                  div        a0, s8, t3
                  vmor.mm    v16,v18,v27
                  vslideup.vi v0,v1,0
                  vmxor.mm   v14,v29,v28
                  vfirst.m zero,v27
                  vsbc.vvm   v27,v0,v0,v0
                  vsrl.vv    v26,v22,v15,v0.t
                  divu       t0, s7, a2
                  xor        s5, s6, s7
                  and        s5, t1, a6
                  vsll.vx    v1,v3,s3,v0.t
                  vmornot.mm v11,v25,v19
                  vmv.x.s zero,v1
                  mulhu      a3, a0, s8
                  vmxor.mm   v1,v12,v6
                  vmor.mm    v18,v14,v15
                  sll        s0, gp, t2
                  ori        a7, t2, 842
                  rem        s2, s1, a1
                  viota.m v18,v3,v0.t
                  mulhsu     gp, s11, a2
                  sll        t6, s7, a5
                  slli       t3, s4, 26
                  div        gp, a0, s0
                  vmsle.vv   v6,v13,v31
                  vmsne.vv   v14,v17,v28
                  vmsle.vi   v2,v25,0,v0.t
                  sub        a5, a5, s9
                  srai       t5, s9, 20
                  andi       a2, s7, -739
                  vmin.vx    v10,v5,s3,v0.t
                  vslideup.vi v10,v8,0
                  vor.vx     v20,v21,s10
                  vmv.s.x v19,a4
                  vadd.vv    v25,v5,v14
                  viota.m v15,v10,v0.t
                  vxor.vx    v18,v31,s8
                  or         a6, gp, a7
                  mulhsu     t5, zero, s2
                  xor        t3, s4, t2
                  vmsltu.vx  v28,v9,a1
                  sra        a5, s11, a0
                  vpopc.m zero,v24
                  vsub.vx    v4,v17,s3
                  mulhsu     ra, s3, t4
                  vmsof.m v22,v9,v0.t
                  vmslt.vv   v2,v22,v26
                  vsra.vi    v3,v24,0
                  vmsne.vv   v24,v13,v8
                  slt        a2, a0, s2
                  vand.vv    v27,v20,v5
                  vslide1down.vx v31,v14,a7,v0.t
                  vmul.vx    v6,v10,gp,v0.t
                  vmv.v.v v4,v29
                  vmulhu.vv  v10,v13,v30
                  sra        a6, t1, t3
                  vmxor.mm   v1,v6,v12
                  slti       a1, t4, 355
                  vmnor.mm   v16,v12,v24
                  add        a7, t3, t6
                  srai       a4, t1, 30
                  mul        a1, sp, s6
                  vpopc.m zero,v18,v0.t
                  sra        ra, s7, a4
                  vmand.mm   v29,v11,v9
                  rem        a0, s9, s9
                  vmacc.vv   v16,v7,v7
                  vslidedown.vi v21,v15,0
                  and        tp, a2, a2
                  rem        s8, s10, zero
                  slti       a2, t5, 691
                  vminu.vv   v25,v28,v23
                  vmulhu.vv  v29,v31,v26,v0.t
                  slt        tp, t4, s0
                  vslide1up.vx v22,v8,a6,v0.t
                  vxor.vx    v15,v11,t6,v0.t
                  vsub.vv    v2,v9,v11
                  vand.vv    v25,v16,v3,v0.t
                  srli       a5, t0, 24
                  ori        s2, ra, 524
                  slt        a0, t0, s4
                  mulh       t2, a2, tp
                  mulhu      s2, t0, s2
                  vslidedown.vi v0,v29,0
                  mulhu      s7, a6, ra
                  vsbc.vxm   v15,v2,t2,v0
                  vmv.x.s zero,v22
                  sll        a4, s11, a4
                  vxor.vx    v20,v6,s5
                  vmulhsu.vx v9,v25,s10,v0.t
                  sltiu      s4, s5, -550
                  vmsne.vv   v25,v21,v5,v0.t
                  vmacc.vx   v24,a3,v1,v0.t
                  div        a2, s0, s10
                  mul        s8, a5, sp
                  vmsgtu.vi  v4,v25,0
                  divu       t5, t1, ra
                  vmsbf.m v9,v8,v0.t
                  vmsof.m v24,v2,v0.t
                  vmand.mm   v7,v5,v28
                  vslidedown.vi v3,v7,0
                  vpopc.m zero,v8
                  andi       s0, s9, 617
                  vmsltu.vv  v9,v29,v23,v0.t
                  sltiu      a6, a2, 152
                  vmsleu.vi  v21,v16,0
                  vmulhsu.vx v18,v19,t5,v0.t
                  vsra.vi    v24,v31,0,v0.t
                  vmv.s.x v1,a5
                  rem        s1, a0, a6
                  vmsgt.vx   v26,v24,sp,v0.t
                  vmsltu.vv  v23,v4,v20,v0.t
                  vmsgt.vx   v22,v14,s8
                  div        t1, t6, a1
                  mulh       sp, t0, s2
                  sra        a5, t3, t3
                  viota.m v26,v8
                  vmsgt.vi   v24,v2,0,v0.t
                  vmul.vx    v7,v7,t4
                  vmand.mm   v19,v16,v5
                  vmslt.vv   v2,v27,v14,v0.t
                  vmnor.mm   v15,v6,v28
                  mulh       t6, s4, a5
                  add        tp, s3, s8
                  vmand.mm   v15,v6,v19
                  vmornot.mm v23,v27,v19
                  vmsltu.vx  v25,v7,t2,v0.t
                  rem        t2, s11, sp
                  vmv.s.x v23,s3
                  lui        t5, 16243
                  addi       a3, t6, -900
                  vfirst.m zero,v27,v0.t
                  sltiu      s0, tp, 320
                  mulhu      a6, t5, t1
                  addi       tp, s7, 628
                  vrsub.vx   v11,v13,gp,v0.t
                  mul        s1, s0, tp
                  vslidedown.vi v12,v30,0
                  vid.v v27,v0.t
                  slti       s4, s0, 243
                  vmv.v.i v23,0
                  slt        zero, gp, a7
                  div        a5, a4, t2
                  mulh       a3, a7, s1
                  vslide1down.vx v4,v21,tp,v0.t
                  vslide1up.vx v31,v15,t2,v0.t
                  mul        a1, a6, t3
                  vrgather.vx v2,v0,s3,v0.t
                  vminu.vv   v18,v13,v25,v0.t
                  vrsub.vx   v0,v2,t0
                  vslidedown.vx v2,v11,a0,v0.t
                  sltu       sp, a6, a7
                  sll        t4, t1, s10
                  remu       zero, a4, s4
                  and        t4, s4, s3
                  remu       t0, a5, a2
                  div        s11, tp, a0
                  vmax.vv    v28,v17,v21,v0.t
                  vmor.mm    v21,v9,v6
                  vmnand.mm  v31,v0,v0
                  vmulhsu.vx v26,v22,gp
                  vmand.mm   v28,v17,v6
                  vmv.x.s zero,v8
                  addi       s11, s4, 615
                  vid.v v28,v0.t
                  vmadd.vx   v18,t1,v5
                  vmsgt.vi   v5,v24,0,v0.t
                  vadd.vi    v5,v20,0,v0.t
                  vmslt.vv   v10,v25,v27,v0.t
                  sltiu      ra, s5, 898
                  add        t0, t1, t3
                  vmsof.m v7,v4,v0.t
                  vid.v v10,v0.t
                  vsub.vv    v10,v12,v19
                  vsra.vv    v3,v31,v20,v0.t
                  slt        a3, t2, tp
                  vadd.vi    v6,v15,0
                  vmandnot.mm v18,v4,v5
                  vsrl.vv    v15,v3,v13
                  vmul.vx    v5,v10,a3,v0.t
                  vmsof.m v19,v27
                  vmv.v.x v12,s2
                  vmsbf.m v9,v31,v0.t
                  vmsbf.m v3,v24,v0.t
                  vmxor.mm   v17,v10,v22
                  vmulhsu.vx v19,v24,t2,v0.t
                  vmv.s.x v30,a7
                  sltu       a4, sp, tp
                  slt        s7, s2, s3
                  slti       a7, gp, -725
                  vmulh.vv   v18,v19,v19
                  vmsleu.vv  v0,v25,v23
                  vrgather.vx v16,v8,s0
                  sltiu      s2, gp, 104
                  slt        gp, t1, s1
                  lui        t1, 255023
                  vmin.vv    v22,v20,v30
                  slli       a5, a0, 4
                  add        ra, gp, ra
                  slt        ra, t0, s4
                  vpopc.m zero,v17,v0.t
                  vmornot.mm v28,v19,v0
                  addi       t3, t5, 938
                  srli       a1, s3, 11
                  vmsle.vv   v7,v15,v4
                  xor        s0, t6, s8
                  ori        a0, s6, -201
                  sub        a1, ra, gp
                  div        s1, zero, gp
                  vmsleu.vv  v1,v12,v6
                  vsbc.vvm   v15,v20,v21,v0
                  vmsgt.vi   v22,v8,0,v0.t
                  vmsof.m v2,v12,v0.t
                  vmulhsu.vx v20,v22,s5
                  add        s5, gp, zero
                  vmseq.vx   v23,v10,a6,v0.t
                  sltiu      ra, s4, 352
                  vmnor.mm   v0,v10,v0
                  vmxor.mm   v5,v6,v24
                  slli       t1, s6, 17
                  slti       s1, tp, 376
                  and        s11, a5, t0
                  vmnand.mm  v15,v23,v11
                  sub        s8, a0, a1
                  vsbc.vvm   v8,v0,v1,v0
                  vmsgt.vx   v9,v4,s8,v0.t
                  vmulh.vv   v23,v28,v26,v0.t
                  vmseq.vi   v26,v7,0
                  sltu       s1, s7, a3
                  vmseq.vv   v15,v20,v0,v0.t
                  vmaxu.vv   v5,v8,v15,v0.t
                  mulhsu     a2, s7, t5
                  vxor.vi    v3,v2,0,v0.t
                  viota.m v5,v30,v0.t
                  vsrl.vi    v19,v19,0,v0.t
                  vmsle.vx   v15,v1,s0,v0.t
                  vmsif.m v21,v11
                  vadc.vim   v20,v31,0,v0
                  xor        t0, t5, s5
                  vmxnor.mm  v23,v15,v31
                  vmsleu.vx  v27,v15,a1,v0.t
                  sll        s0, t4, s9
                  sub        t2, a1, s2
                  sltu       s5, t0, a3
                  or         a2, s0, s10
                  vsrl.vv    v7,v2,v29,v0.t
                  vslide1up.vx v3,v18,s2,v0.t
                  viota.m v20,v1,v0.t
                  vmslt.vv   v30,v18,v10
                  vmin.vv    v9,v3,v21,v0.t
                  viota.m v24,v23,v0.t
                  slli       a1, t1, 14
                  remu       t1, zero, s4
                  vmand.mm   v18,v0,v3
                  auipc      a3, 709287
                  mulh       a7, a4, t3
                  vmandnot.mm v8,v6,v20
                  div        ra, t5, a1
                  vmaxu.vx   v23,v1,t4,v0.t
                  vmxor.mm   v17,v26,v14
                  remu       t2, a4, a5
                  add        t6, s7, a0
                  ori        tp, tp, 497
                  xori       sp, s2, 290
                  vmsgt.vx   v7,v23,t2
                  lui        a4, 499874
                  auipc      s6, 1005996
                  vmsgt.vx   v11,v24,s1,v0.t
                  vmin.vx    v14,v13,a0,v0.t
                  vsub.vx    v11,v5,gp,v0.t
                  vsra.vi    v16,v26,0
                  mulh       s2, s10, s2
                  sltu       a7, a3, a4
                  vmxnor.mm  v10,v13,v1
                  vsbc.vxm   v6,v25,a5,v0
                  ori        s0, a4, 372
                  vrgather.vx v24,v15,s1
                  vmseq.vi   v18,v5,0,v0.t
                  vsbc.vvm   v9,v0,v17,v0
                  vmsne.vv   v7,v6,v9
                  vmv.s.x v11,s11
                  vmv.x.s zero,v6
                  vslide1up.vx v18,v23,s7,v0.t
                  addi       s5, s7, -957
                  slti       s7, t3, -737
                  vmsgtu.vi  v18,v12,0,v0.t
                  vmand.mm   v18,v26,v17
                  vmsbf.m v0,v6
                  vmand.mm   v5,v7,v23
                  vpopc.m zero,v4,v0.t
                  vsll.vx    v18,v14,s7,v0.t
                  vsrl.vv    v7,v1,v4,v0.t
                  viota.m v12,v4
                  viota.m v12,v18
                  vslidedown.vi v18,v4,0
                  vslidedown.vx v30,v4,s2,v0.t
                  vmsgt.vi   v5,v25,0,v0.t
                  slli       s8, sp, 28
                  vmsle.vx   v29,v15,t0
                  vadc.vxm   v25,v5,a7,v0
                  sll        a1, sp, s2
                  vmulh.vx   v27,v2,a7,v0.t
                  vsbc.vvm   v15,v30,v13,v0
                  vxor.vv    v18,v27,v22
                  vslide1up.vx v7,v11,zero
                  div        t3, a2, t0
                  lui        a1, 559128
                  vadc.vim   v30,v6,0,v0
                  sltu       t3, a7, sp
                  auipc      s1, 992864
                  mulhsu     a1, a3, s11
                  vminu.vx   v26,v24,s2,v0.t
                  and        s7, s10, ra
                  vmnand.mm  v1,v14,v0
                  addi       gp, s10, -899
                  srl        t6, t3, s10
                  sll        s0, s8, t5
                  vmsle.vi   v3,v7,0,v0.t
                  vrgather.vv v12,v23,v7
                  vsra.vv    v4,v23,v10,v0.t
                  vmadd.vv   v10,v2,v5,v0.t
                  vsll.vv    v2,v16,v30,v0.t
                  mulh       gp, a4, sp
                  divu       gp, s1, s1
                  andi       t5, t4, -173
                  rem        t1, a4, a6
                  divu       a3, t2, s5
                  vmsne.vx   v21,v25,t1,v0.t
                  srl        t5, s8, s8
                  slt        s11, s0, t5
                  vmandnot.mm v6,v15,v13
                  vrgather.vx v21,v2,s11,v0.t
                  sltu       t4, s5, s7
                  vmand.mm   v27,v17,v25
                  vmsif.m v3,v13
                  vmacc.vv   v25,v26,v9,v0.t
                  vadd.vi    v0,v5,0
                  vmor.mm    v4,v17,v28
                  vid.v v13
                  vmsif.m v17,v26,v0.t
                  xori       a1, s8, 428
                  vmulh.vx   v10,v10,tp
                  xori       t5, gp, -168
                  vsra.vv    v20,v6,v24
                  vmulh.vx   v21,v24,s4,v0.t
                  vsub.vx    v24,v3,t6,v0.t
                  lui        ra, 103961
                  vslideup.vi v11,v10,0,v0.t
                  vmslt.vv   v19,v22,v9,v0.t
                  vslideup.vi v13,v19,0
                  sltiu      sp, a0, -648
                  vslideup.vx v28,v17,a7,v0.t
                  vmsbf.m v0,v16
                  rem        t0, a6, s4
                  vmslt.vx   v3,v30,t3,v0.t
                  vmsbf.m v27,v26,v0.t
                  mulh       a3, ra, a6
                  xor        a7, tp, s3
                  vsra.vx    v30,v22,t1,v0.t
                  vid.v v25
                  vmv.x.s zero,v31
                  add        s1, s8, ra
                  vmsltu.vx  v30,v18,gp
                  vmulhsu.vx v19,v25,zero
                  vmsbf.m v28,v19
                  mul        sp, s1, s4
                  lui        t6, 219460
                  vmsne.vx   v17,v25,s9
                  sltiu      ra, s0, 940
                  vmandnot.mm v23,v9,v11
                  srl        t3, t3, s6
                  or         tp, t5, s5
                  ori        s2, s2, -74
                  vmseq.vx   v0,v13,a1
                  vmaxu.vv   v4,v12,v16
                  vmxnor.mm  v11,v2,v16
                  vmsle.vi   v10,v26,0,v0.t
                  sra        s4, t6, t5
                  vmornot.mm v29,v5,v7
                  vmnor.mm   v15,v7,v28
                  vmsof.m v4,v18,v0.t
                  slt        t0, s2, a6
                  vsrl.vi    v1,v21,0,v0.t
                  vmulhu.vx  v3,v15,s6,v0.t
                  div        t0, gp, s7
                  and        s0, s6, a3
                  sltu       s1, t2, t5
                  rem        a3, t6, a5
                  vminu.vv   v29,v30,v28,v0.t
                  vrgather.vx v3,v0,t2,v0.t
                  vmandnot.mm v24,v7,v8
                  andi       a4, a3, 246
                  sll        t3, a2, tp
                  vmsof.m v0,v1
                  vadc.vxm   v25,v1,s0,v0
                  vmv.x.s zero,v13
                  mulh       s1, s9, t6
                  vadc.vxm   v10,v11,a3,v0
                  vmandnot.mm v21,v8,v24
                  vmsbf.m v12,v4
                  vmsle.vi   v0,v10,0
                  vslideup.vi v16,v27,0,v0.t
                  vmxor.mm   v17,v29,v13
                  vsra.vv    v11,v26,v16,v0.t
                  vmv.v.i v10,0
                  vadd.vv    v6,v17,v27,v0.t
                  vxor.vi    v14,v5,0
                  vmv.x.s zero,v9
                  andi       t5, a6, -119
                  vmslt.vv   v28,v12,v25,v0.t
                  slt        t0, a3, a6
                  vmulhu.vx  v30,v13,s2
                  xor        s5, sp, t2
                  lui        s11, 408506
                  vmulh.vv   v20,v2,v16
                  vmacc.vx   v8,t3,v22
                  vmaxu.vx   v7,v18,t1,v0.t
                  vsub.vx    v2,v9,t6
                  ori        zero, s0, 779
                  vmsne.vi   v22,v29,0,v0.t
                  slli       a1, s11, 27
                  vmnand.mm  v21,v7,v31
                  vmulhsu.vv v3,v31,v6,v0.t
                  vmxor.mm   v0,v29,v6
                  vmseq.vx   v11,v16,sp,v0.t
                  vslide1up.vx v12,v28,t0
                  vminu.vv   v17,v22,v23
                  addi       zero, a4, 412
                  mul        t4, s1, a7
                  vmv.v.x v6,s10
                  slti       a7, a3, -868
                  vmsleu.vi  v14,v22,0,v0.t
                  vand.vx    v21,v4,s7,v0.t
                  divu       t4, t6, s6
                  vmaxu.vv   v2,v25,v16
                  vsrl.vi    v30,v16,0,v0.t
                  vmv.s.x v26,zero
                  vfirst.m zero,v13,v0.t
                  vslide1up.vx v11,v12,a2,v0.t
                  vmandnot.mm v25,v3,v11
                  vmaxu.vv   v25,v12,v8
                  vmsltu.vx  v8,v15,a2
                  vmseq.vv   v11,v21,v0
                  srai       t6, s11, 16
                  and        s1, a4, s4
                  srli       s1, s1, 15
                  xori       t2, s7, 578
                  vmul.vv    v6,v25,v21
                  vmsne.vi   v5,v12,0,v0.t
                  sub        a2, s10, s1
                  vmax.vx    v12,v7,a5,v0.t
                  vmnor.mm   v19,v14,v21
                  srli       gp, t2, 7
                  vmandnot.mm v20,v22,v5
                  vmslt.vx   v5,v20,s0,v0.t
                  vmul.vv    v19,v24,v5
                  vmslt.vv   v17,v29,v6,v0.t
                  vpopc.m zero,v10
                  or         t4, s2, s2
                  mul        s7, t2, s10
                  vpopc.m zero,v13,v0.t
                  vsub.vv    v12,v4,v29,v0.t
                  vmandnot.mm v12,v12,v18
                  rem        a3, s4, t6
                  vslidedown.vi v24,v9,0,v0.t
                  vmsof.m v13,v30
                  vfirst.m zero,v20
                  vrgather.vv v28,v5,v18,v0.t
                  sll        a7, gp, a4
                  vmnand.mm  v21,v20,v26
                  vmand.mm   v1,v23,v9
                  vmulh.vx   v17,v2,ra
                  mul        a3, s5, s6
                  vmin.vx    v7,v4,s1,v0.t
                  vmsgtu.vx  v6,v17,t4
                  vsrl.vv    v12,v11,v6,v0.t
                  vmslt.vv   v23,v8,v21,v0.t
                  slti       a3, s10, -907
                  viota.m v2,v11
                  add        a6, s11, t3
                  slli       gp, a6, 7
                  vmnand.mm  v26,v21,v14
                  andi       s4, a7, -120
                  srai       a5, a1, 13
                  vsbc.vxm   v7,v15,t6,v0
                  vmand.mm   v16,v22,v18
                  vadc.vvm   v7,v12,v20,v0
                  vadc.vvm   v26,v18,v15,v0
                  vslide1down.vx v8,v2,s2
                  viota.m v1,v2
                  vadc.vvm   v28,v2,v20,v0
                  xor        s1, a6, t1
                  andi       t3, a2, -353
                  vsbc.vxm   v2,v19,t6,v0
                  xor        a0, a7, t2
                  vrgather.vv v27,v25,v0,v0.t
                  vmv.s.x v17,sp
                  vmsne.vi   v31,v13,0
                  vmandnot.mm v21,v19,v9
                  vsll.vx    v25,v2,t4,v0.t
                  slli       tp, s0, 6
                  vmnand.mm  v29,v0,v5
                  vid.v v5
                  vmand.mm   v21,v22,v6
                  divu       s0, sp, s1
                  sub        s7, s9, s5
                  vmornot.mm v9,v0,v13
                  andi       t3, sp, 590
                  vmul.vx    v10,v21,a0,v0.t
                  vsbc.vxm   v5,v16,a3,v0
                  vmsof.m v8,v7,v0.t
                  vmsgtu.vx  v8,v13,s6
                  vor.vv     v18,v5,v10,v0.t
                  vmsof.m v21,v15,v0.t
                  vmor.mm    v17,v31,v28
                  sltiu      s11, a4, 381
                  vmnand.mm  v8,v17,v13
                  vsll.vv    v9,v19,v7
                  srai       a0, a7, 26
                  vmsleu.vv  v22,v6,v3,v0.t
                  mul        t0, s0, t6
                  vmv.x.s zero,v24
                  sll        s11, t1, zero
                  vmulhsu.vx v11,v21,s7,v0.t
                  vmin.vx    v23,v9,s4
                  vmsne.vv   v28,v14,v8,v0.t
                  vmsif.m v25,v16
                  vmulhsu.vv v6,v30,v27,v0.t
                  vmornot.mm v16,v28,v27
                  vmnor.mm   v20,v7,v9
                  remu       s6, s2, t1
                  vmseq.vx   v16,v25,a6
                  vmor.mm    v10,v25,v7
                  vmsle.vx   v27,v11,s8
                  viota.m v29,v10,v0.t
                  vmul.vv    v27,v13,v0
                  slti       a1, s10, -509
                  vsra.vi    v7,v19,0,v0.t
                  vslide1down.vx v24,v0,t4
                  xori       a5, s11, -264
                  div        t0, a2, t0
                  sub        zero, a6, a0
                  vmax.vv    v6,v27,v14,v0.t
                  vrgather.vi v1,v28,0
                  srl        gp, t2, t5
                  vmacc.vx   v27,s11,v18,v0.t
                  vpopc.m zero,v1
                  vmulhsu.vv v23,v18,v16
                  vand.vx    v19,v13,t3,v0.t
                  vmul.vx    v9,v27,s9,v0.t
                  ori        a5, s2, -16
                  vmsof.m v13,v0,v0.t
                  vmandnot.mm v28,v13,v21
                  vmacc.vv   v13,v27,v16,v0.t
                  vmsbf.m v21,v9
                  ori        s2, s9, -308
                  xor        t0, a3, t4
                  vrgather.vi v2,v1,0,v0.t
                  vmand.mm   v1,v8,v1
                  vmv.s.x v11,s2
                  mulhsu     a1, a0, tp
                  vmsgt.vx   v25,v12,s10,v0.t
                  sltiu      t4, t3, -790
                  vmin.vv    v11,v1,v31,v0.t
                  vmor.mm    v3,v6,v16
                  slt        s2, gp, s6
                  sub        s8, s10, t3
                  vsra.vx    v16,v7,t3
                  vmax.vx    v23,v1,t0
                  vmand.mm   v30,v10,v23
                  divu       a2, a6, tp
                  vmulhsu.vx v21,v23,t5
                  vmul.vv    v25,v25,v5
                  vmxnor.mm  v31,v9,v20
                  vmv.s.x v10,t0
                  vmaxu.vx   v11,v11,t1,v0.t
                  vmsltu.vv  v30,v26,v1,v0.t
                  vmsne.vv   v27,v12,v16,v0.t
                  vslidedown.vi v15,v4,0,v0.t
                  lui        s6, 3294
                  sub        a2, t1, s11
                  ori        s4, gp, 182
                  vmsgtu.vx  v21,v9,a7,v0.t
                  vsll.vi    v16,v12,0
                  sltu       s4, s1, t4
                  vmslt.vv   v10,v30,v8,v0.t
                  vmsgt.vx   v25,v18,s10
                  vmv.x.s zero,v10
                  vsra.vx    v13,v25,a0
                  vxor.vx    v27,v31,sp,v0.t
                  vmsbf.m v12,v28
                  andi       t5, a2, -736
                  viota.m v31,v26
                  sub        t2, s5, t2
                  vmsbf.m v13,v29,v0.t
                  vmsne.vx   v23,v5,s2,v0.t
                  rem        a5, s9, ra
                  sra        a4, a2, a3
                  slti       gp, s1, -254
                  vmv.x.s zero,v4
                  vsub.vx    v11,v0,a1
                  vmsof.m v19,v14,v0.t
                  vmv.x.s zero,v24
                  vmslt.vx   v16,v23,s1
                  sltiu      a2, s11, -669
                  vmsof.m v3,v0,v0.t
                  vsll.vx    v26,v20,s0
                  vand.vx    v13,v22,a2
                  vmax.vv    v2,v0,v13,v0.t
                  vmaxu.vv   v10,v19,v30
                  sll        a4, t3, s3
                  vmxor.mm   v2,v7,v30
                  srai       t6, s7, 4
                  mul        a3, t6, s4
                  vmsltu.vv  v20,v19,v14
                  ori        a4, t0, 993
                  vmandnot.mm v14,v7,v28
                  vmsof.m v20,v11
                  vmsleu.vi  v2,v15,0
                  vmulhu.vx  v0,v31,t6
                  vsbc.vvm   v19,v20,v7,v0
                  andi       t6, s3, 434
                  vmsif.m v31,v6,v0.t
                  andi       a7, s11, 579
                  vmand.mm   v15,v12,v3
                  slli       t4, t3, 9
                  vmsleu.vi  v0,v31,0
                  vmul.vv    v24,v24,v21,v0.t
                  addi       s8, a6, -997
                  vand.vv    v5,v16,v5,v0.t
                  vslide1up.vx v4,v19,t1
                  ori        t5, a4, 610
                  div        a3, t2, t5
                  vadc.vvm   v10,v0,v19,v0
                  andi       a3, a6, 762
                  vsrl.vi    v25,v24,0
                  xor        t0, t0, s4
                  slti       s0, a0, 950
                  vmax.vv    v7,v0,v14
                  vmandnot.mm v16,v1,v26
                  remu       s6, s5, a7
                  sra        t2, t0, t4
                  vslideup.vi v27,v25,0
                  vmulh.vx   v22,v27,gp
                  vmornot.mm v1,v23,v11
                  vmax.vx    v5,v0,s1
                  vsbc.vxm   v7,v15,ra,v0
                  vmslt.vv   v7,v24,v9
                  srl        a2, zero, t3
                  mulhu      a5, a4, gp
                  vmv.x.s zero,v4
                  vmslt.vv   v14,v4,v8
                  slti       gp, s0, -303
                  vsll.vi    v0,v11,0
                  vmseq.vx   v13,v28,t2,v0.t
                  vid.v v21
                  srli       s6, s5, 6
                  and        t2, s6, ra
                  vpopc.m zero,v3,v0.t
                  ori        t0, s1, -281
                  div        s2, s2, a5
                  vmadd.vx   v8,s7,v21
                  vmnand.mm  v7,v22,v26
                  or         s5, a5, s6
                  vmaxu.vv   v10,v17,v31
                  vrsub.vi   v20,v27,0,v0.t
                  vmacc.vv   v12,v13,v14,v0.t
                  vmul.vv    v7,v1,v13,v0.t
                  srai       s2, s10, 13
                  vslide1down.vx v3,v2,t1,v0.t
                  vid.v v24,v0.t
                  slt        a1, s10, s0
                  vand.vv    v3,v5,v14
                  vmulh.vx   v22,v26,zero
                  lui        s1, 52491
                  vadc.vvm   v28,v20,v30,v0
                  xori       s1, ra, 903
                  vsll.vv    v20,v12,v4,v0.t
                  vsrl.vv    v1,v4,v29,v0.t
                  mulh       t1, s9, s4
                  vand.vx    v22,v6,s0
                  sll        s0, s5, a1
                  vmin.vv    v21,v15,v31,v0.t
                  vmsgt.vi   v11,v0,0
                  vmul.vv    v16,v7,v23
                  srl        s8, s1, s2
                  vmsltu.vx  v19,v1,zero
                  mulh       a4, s5, zero
                  vmor.mm    v12,v14,v26
                  vmor.mm    v19,v7,v23
                  vmxor.mm   v23,v19,v19
                  sub        a2, s1, t1
                  sltu       a2, a3, t1
                  vmulh.vx   v12,v24,s4
                  mulhu      t5, s5, s3
                  remu       a7, s9, a2
                  vslideup.vi v9,v24,0
                  vmxor.mm   v28,v9,v26
                  and        a4, s5, s8
                  vmsltu.vv  v27,v30,v22
                  vmsif.m v23,v24
                  ori        gp, t6, -827
                  vmandnot.mm v23,v18,v11
                  divu       s1, tp, s0
                  vmsof.m v19,v30
                  vsbc.vvm   v3,v9,v6,v0
                  vxor.vx    v25,v30,t2
                  mulh       a1, s4, t5
                  vslide1up.vx v8,v10,s4
                  vmin.vv    v19,v15,v22,v0.t
                  vmnor.mm   v21,v26,v16
                  vslideup.vx v17,v5,s4
                  lui        a4, 426600
                  vmadd.vx   v31,s3,v18,v0.t
                  vxor.vi    v26,v26,0
                  vmsgt.vi   v11,v24,0
                  sltu       s8, s0, s8
                  vmnand.mm  v14,v2,v6
                  vmsbf.m v23,v26,v0.t
                  vmsof.m v11,v3
                  vmxnor.mm  v26,v12,v15
                  vmor.mm    v11,v25,v4
                  vmulhu.vv  v2,v30,v3
                  addi       s4, t2, 434
                  vmax.vv    v29,v7,v20
                  vpopc.m zero,v2,v0.t
                  slti       tp, s7, -687
                  slt        a3, t5, t2
                  slti       t0, s7, 637
                  or         a0, a1, s5
                  vsbc.vxm   v3,v13,s11,v0
                  viota.m v29,v11
                  vmsne.vx   v27,v23,gp
                  vmornot.mm v24,v16,v3
                  div        t6, a6, a2
                  vmsltu.vx  v23,v19,t1
                  xori       t2, s4, 478
                  vmslt.vv   v20,v22,v30,v0.t
                  and        ra, s3, a0
                  srai       t6, sp, 11
                  vslide1up.vx v5,v22,t1
                  vsrl.vi    v0,v30,0
                  vmandnot.mm v14,v29,v17
                  sll        t3, tp, t2
                  sltiu      gp, a0, -458
                  vsbc.vxm   v16,v12,t3,v0
                  viota.m v8,v21
                  vmsle.vx   v16,v23,a3,v0.t
                  vmandnot.mm v0,v16,v8
                  xor        t5, s3, t4
                  vmulh.vx   v10,v17,tp
                  vsbc.vxm   v4,v28,gp,v0
                  vrgather.vx v1,v0,t5,v0.t
                  vor.vv     v11,v2,v19
                  vmul.vx    v20,v10,a5,v0.t
                  lui        a3, 6578
                  vand.vv    v9,v20,v5,v0.t
                  add        s8, tp, a6
                  vmsof.m v18,v8
                  addi       s5, a5, -288
                  vmulhsu.vv v2,v18,v4
                  sltu       t2, a5, a6
                  sra        a7, a7, t5
                  slt        tp, t0, a4
                  vid.v v15
                  slli       a3, s11, 4
                  vmornot.mm v15,v17,v21
                  vmv.v.i v24,0
                  vsra.vv    v5,v13,v21,v0.t
                  sub        t3, ra, a3
                  vid.v v13,v0.t
                  vrgather.vv v30,v28,v24,v0.t
                  vmulhsu.vx v8,v12,s4
                  and        a1, sp, a2
                  vmsif.m v6,v26
                  xori       s8, s8, -32
                  vmulhsu.vx v7,v19,t4,v0.t
                  vmax.vx    v27,v27,sp
                  vslide1up.vx v4,v17,s4
                  vsbc.vvm   v1,v9,v0,v0
                  vmsif.m v5,v0,v0.t
                  xor        s4, s2, t2
                  vmnor.mm   v2,v1,v5
                  vsll.vv    v25,v13,v28
                  and        a5, s6, t5
                  vmsne.vv   v21,v3,v16,v0.t
                  vadd.vv    v11,v31,v31,v0.t
                  vmv.x.s zero,v28
                  vslideup.vx v12,v1,s6,v0.t
                  or         s11, s0, s6
                  vadd.vi    v20,v20,0,v0.t
                  sltu       t1, a5, gp
                  vmsgtu.vx  v23,v22,s1,v0.t
                  xor        s1, t5, t4
                  vmnor.mm   v11,v10,v30
                  xori       s11, a4, 103
                  viota.m v21,v19
                  vsra.vi    v9,v13,0
                  vor.vx     v17,v28,t6
                  vmand.mm   v30,v25,v18
                  viota.m v16,v5,v0.t
                  vminu.vx   v22,v0,sp
                  vmin.vv    v25,v3,v13,v0.t
                  vsub.vv    v23,v16,v29
                  vmsof.m v20,v3,v0.t
                  vmsltu.vx  v31,v1,tp
                  xori       sp, ra, -231
                  vsbc.vvm   v26,v12,v19,v0
                  andi       a5, a4, 904
                  sll        s0, s3, s3
                  vmandnot.mm v29,v12,v7
                  vmulh.vx   v7,v1,s1
                  vmsif.m v4,v26
                  vmacc.vx   v31,zero,v20,v0.t
                  mulhsu     s7, a6, s0
                  vmulhu.vx  v0,v20,t2
                  vfirst.m zero,v25
                  vmadd.vx   v27,gp,v24,v0.t
                  sll        s1, a3, s7
                  vmaxu.vx   v21,v5,a1
                  sra        a5, a6, t5
                  vxor.vi    v13,v6,0,v0.t
                  mul        s5, s3, a7
                  vmornot.mm v20,v20,v30
                  addi       t1, s3, 254
                  vmand.mm   v21,v29,v2
                  sub        t1, s6, s7
                  vmsgt.vx   v9,v0,tp,v0.t
                  vmnand.mm  v28,v18,v19
                  vand.vx    v1,v14,t4
                  vadc.vim   v28,v7,0,v0
                  xor        s11, a3, s8
                  mulhu      a7, a7, t6
                  vmv.x.s zero,v5
                  vmulh.vx   v0,v13,ra
                  vadd.vi    v13,v23,0
                  vsll.vv    v16,v7,v12,v0.t
                  vmsgtu.vx  v24,v11,t1
                  vmax.vx    v5,v9,t6
                  vmacc.vx   v16,t2,v17,v0.t
                  mulh       s7, sp, gp
                  remu       a2, a7, s6
                  vmsne.vv   v0,v28,v8
                  vmin.vv    v10,v22,v18
                  vadc.vim   v4,v13,0,v0
                  remu       a0, a5, s9
                  or         a0, s9, t3
                  lui        a6, 465412
                  add        a5, a7, a7
                  xor        s7, s11, t3
                  vmsle.vx   v0,v26,a4
                  vor.vx     v29,v23,zero
                  vmv.v.i v26,0
                  vrgather.vi v12,v30,0
                  add        a6, zero, a1
                  vmxor.mm   v18,v31,v14
                  rem        s11, ra, t2
                  vmxor.mm   v12,v15,v0
                  vmin.vx    v23,v23,s7
                  sltiu      s11, s1, -816
                  vmandnot.mm v11,v19,v9
                  mulhsu     s4, t2, t2
                  vid.v v8,v0.t
                  viota.m v16,v8
                  xor        a7, s5, a1
                  vmsne.vi   v12,v23,0,v0.t
                  vmsbf.m v27,v2
                  or         a3, s4, a2
                  andi       t3, s8, 401
                  mul        s2, t2, s9
                  vmsif.m v19,v7
                  vor.vi     v1,v14,0
                  auipc      t1, 43340
                  vor.vv     v19,v18,v31
                  remu       tp, gp, tp
                  vrsub.vi   v25,v25,0
                  mulh       t5, s11, s6
                  xori       s1, s2, -752
                  sub        a3, t4, s3
                  vmornot.mm v5,v25,v21
                  mul        t0, a5, t0
                  vmv.x.s zero,v20
                  vmsgtu.vx  v0,v24,a5
                  vmaxu.vx   v0,v20,a0
                  vrgather.vi v9,v22,0,v0.t
                  vmsne.vi   v3,v18,0
                  mulhu      s5, s10, t5
                  vmsltu.vx  v12,v20,gp
                  vmxnor.mm  v9,v14,v2
                  xor        t1, zero, s7
                  slli       zero, s11, 14
                  remu       a2, a1, t2
                  srai       t6, zero, 19
                  viota.m v21,v11,v0.t
                  vmulh.vx   v26,v27,a3
                  vmsltu.vv  v30,v22,v14
                  vmul.vx    v3,v12,s6
                  vmnand.mm  v14,v1,v10
                  vmornot.mm v24,v29,v22
                  vmv.s.x v13,sp
                  vor.vx     v24,v4,a6,v0.t
                  vmand.mm   v18,v30,v10
                  add        ra, t4, a4
                  vslideup.vi v7,v8,0,v0.t
                  vsll.vx    v12,v17,t4
                  lui        sp, 373290
                  andi       t0, t5, 488
                  vmslt.vv   v18,v2,v4,v0.t
                  vsub.vx    v26,v4,s0
                  add        a3, t6, s11
                  vslidedown.vi v14,v21,0,v0.t
                  vmulhsu.vx v17,v16,a7,v0.t
                  vfirst.m zero,v27
                  vmulhsu.vx v2,v28,zero
                  vmacc.vx   v12,a7,v27
                  vslideup.vi v23,v9,0
                  vmnor.mm   v28,v29,v31
                  mulhsu     s7, s3, a3
                  rem        zero, a5, a0
                  vmin.vx    v29,v24,s9,v0.t
                  vadc.vxm   v18,v13,gp,v0
                  vmul.vx    v19,v31,a4
                  sll        a3, t4, zero
                  vmin.vv    v29,v6,v15,v0.t
                  vmsne.vv   v12,v26,v7,v0.t
                  xor        a1, a7, zero
                  vpopc.m zero,v10
                  vslide1down.vx v21,v16,a1,v0.t
                  vsll.vx    v12,v1,t6
                  vmslt.vx   v24,v14,a2,v0.t
                  vmv.v.v v26,v23
                  vmsif.m v11,v23
                  vor.vx     v8,v13,zero
                  vslidedown.vx v6,v5,t2
                  ori        t6, t5, -392
                  vmv.s.x v23,a2
                  vmsleu.vx  v17,v24,s10
                  divu       gp, a4, s7
                  vadc.vvm   v25,v10,v26,v0
                  mulhsu     t3, gp, gp
                  vmsle.vi   v19,v12,0,v0.t
                  vslideup.vi v13,v6,0
                  vmacc.vx   v24,t0,v7
                  vslide1up.vx v5,v20,s10
                  srl        a1, t4, s9
                  addi       a4, s3, 615
                  vmnand.mm  v26,v25,v11
                  vpopc.m zero,v17
                  vfirst.m zero,v29
                  vxor.vx    v2,v5,t6
                  vmsbf.m v7,v10,v0.t
                  vor.vv     v6,v10,v26,v0.t
                  vmsbf.m v25,v29
                  vsll.vv    v9,v6,v7
                  vsll.vi    v19,v29,0,v0.t
                  ori        t3, a1, 1008
                  auipc      s11, 563939
                  vmax.vv    v21,v28,v16,v0.t
                  vsub.vv    v24,v25,v12,v0.t
                  addi       zero, t5, 734
                  vmv.x.s zero,v14
                  mulhsu     s8, sp, s5
                  vmsof.m v13,v30
                  vmnor.mm   v4,v9,v11
                  vmnand.mm  v27,v16,v9
                  vid.v v3,v0.t
                  vsbc.vxm   v13,v22,s4,v0
                  vmor.mm    v21,v25,v15
                  vmv.s.x v24,s11
                  vmsgt.vi   v31,v23,0
                  vmsgt.vi   v7,v28,0
                  vsrl.vi    v1,v14,0
                  lui        t6, 434313
                  vpopc.m zero,v22
                  vmax.vv    v24,v24,v27
                  vminu.vv   v25,v28,v13,v0.t
                  vslidedown.vx v31,v24,s5
                  srai       gp, s0, 21
                  mulhu      t1, a3, s4
                  vmsgt.vx   v0,v20,s7
                  vsrl.vv    v27,v5,v16
                  vand.vx    v25,v18,s0
                  slli       a0, s2, 17
                  vmulh.vv   v26,v22,v6,v0.t
                  divu       a2, s2, s5
                  vmulhu.vx  v4,v7,zero
                  vslide1down.vx v28,v3,t5
                  vmxnor.mm  v10,v9,v10
                  vfirst.m zero,v18,v0.t
                  andi       s8, tp, -136
                  xori       t3, a1, 278
                  vxor.vi    v16,v16,0
                  vmulhsu.vx v2,v5,t3
                  vmornot.mm v24,v26,v1
                  divu       t3, sp, s4
                  remu       a3, gp, a6
                  vadd.vx    v8,v13,s3
                  vslide1down.vx v18,v24,s4,v0.t
                  vmulhsu.vx v18,v30,s1
                  sra        s0, gp, t3
                  xori       t0, s7, 894
                  slti       s7, a1, -830
                  vmnand.mm  v22,v13,v3
                  slt        a3, s11, sp
                  vslidedown.vx v6,v19,a5
                  sub        s2, a1, t0
                  slti       s8, s11, -338
                  vsrl.vv    v26,v28,v15,v0.t
                  vmul.vv    v12,v1,v17
                  slti       a5, a3, 997
                  vmulhsu.vx v11,v18,a4
                  vmslt.vx   v27,v11,tp,v0.t
                  div        a1, a4, t0
                  mulhu      zero, zero, t1
                  sltu       a7, a0, a3
                  vslideup.vx v25,v5,s1
                  vmulh.vx   v9,v30,s6,v0.t
                  vmv.v.v v8,v14
                  sltiu      ra, s4, 670
                  divu       s2, t0, a5
                  srl        a7, s11, a3
                  vmornot.mm v2,v23,v25
                  vmsof.m v15,v22
                  vmax.vx    v18,v26,s6,v0.t
                  and        a4, s8, s3
                  vmv.v.i v19,0
                  mul        t3, t1, s7
                  vmul.vx    v19,v9,s5
                  vor.vi     v22,v1,0
                  vmin.vv    v31,v19,v8,v0.t
                  ori        s0, a2, 18
                  vadc.vvm   v25,v7,v0,v0
                  or         ra, t4, t4
                  and        a0, t1, s6
                  divu       sp, tp, s0
                  vrsub.vx   v29,v6,s6,v0.t
                  remu       t2, t6, s1
                  vmsof.m v24,v10
                  vmnand.mm  v26,v1,v30
                  addi       a2, s11, 713
                  vmxnor.mm  v24,v16,v20
                  div        gp, s1, a7
                  xor        t5, s7, a0
                  vsrl.vx    v23,v8,t6
                  vmand.mm   v2,v16,v7
                  vmadd.vv   v2,v29,v20
                  vminu.vv   v3,v31,v29,v0.t
                  vmadd.vx   v17,t0,v29,v0.t
                  and        a2, a0, t6
                  vmul.vx    v5,v7,sp
                  vmandnot.mm v26,v6,v19
                  vmxnor.mm  v30,v2,v29
                  addi       t2, t4, -431
                  vsra.vv    v16,v25,v25
                  vrgather.vx v13,v29,s11
                  xori       t2, s5, 941
                  vsub.vx    v29,v12,s8
                  vadc.vim   v20,v25,0,v0
                  remu       t6, ra, a7
                  andi       a7, a1, 972
                  rem        s6, s10, s8
                  vmv.x.s zero,v14
                  vadc.vim   v7,v20,0,v0
                  vmsne.vv   v14,v28,v7,v0.t
                  rem        a6, a7, a4
                  vmaxu.vx   v12,v7,t6,v0.t
                  vmsif.m v14,v10,v0.t
                  vfirst.m zero,v14,v0.t
                  vmv.x.s zero,v25
                  vmandnot.mm v12,v6,v25
                  vmulhsu.vx v27,v10,t3,v0.t
                  vor.vv     v22,v3,v6
                  vor.vi     v9,v10,0,v0.t
                  vmxor.mm   v22,v25,v2
                  vmxnor.mm  v31,v28,v16
                  vfirst.m zero,v4
                  vmsif.m v0,v12
                  slli       s2, s4, 1
                  sub        a4, t3, s2
                  vmulh.vx   v15,v11,t1
                  sra        a1, s2, ra
                  sub        s0, s3, t1
                  vmornot.mm v9,v6,v28
                  vfirst.m zero,v1
                  vmsltu.vv  v4,v16,v28
                  vslidedown.vx v29,v31,s6,v0.t
                  vmulhsu.vv v15,v13,v27
                  sltu       a2, s7, s5
                  sltu       t1, s8, sp
                  vmul.vx    v9,v12,s7
                  vxor.vi    v13,v9,0
                  vmul.vx    v3,v22,t6,v0.t
                  or         a2, zero, tp
                  vmulh.vv   v2,v11,v16,v0.t
                  vmandnot.mm v31,v30,v20
                  vmslt.vv   v22,v29,v15
                  vadd.vx    v26,v20,a3
                  vmax.vv    v16,v6,v9
                  srli       t0, t6, 9
                  mul        s5, a3, t6
                  sub        t4, t5, t5
                  mulhu      s0, s4, s10
                  vmsgtu.vx  v16,v9,s2,v0.t
                  vmax.vx    v18,v12,s8
                  slli       sp, zero, 5
                  vor.vv     v30,v1,v2,v0.t
                  vsll.vv    v21,v9,v22,v0.t
                  srai       s4, sp, 0
                  vmornot.mm v30,v19,v8
                  vmseq.vi   v22,v23,0,v0.t
                  vslideup.vx v14,v21,a1
                  vmsleu.vi  v28,v7,0
                  vsub.vv    v2,v29,v7,v0.t
                  srl        a1, t5, s10
                  vmv.v.x v9,a0
                  vsub.vx    v28,v0,s11,v0.t
                  vor.vx     v12,v21,s1,v0.t
                  vmaxu.vx   v15,v9,a4
                  andi       sp, a4, 88
                  vmnand.mm  v23,v23,v17
                  vmacc.vx   v23,ra,v16,v0.t
                  vmandnot.mm v18,v6,v11
                  vmulhu.vx  v16,v31,t5
                  vmv.v.v v8,v14
                  srai       t6, s10, 3
                  vmxor.mm   v29,v0,v30
                  vmulhu.vv  v31,v13,v9,v0.t
                  vminu.vv   v4,v8,v0,v0.t
                  vmsltu.vx  v12,v8,a7,v0.t
                  vmulhsu.vx v25,v0,s4
                  vmsne.vi   v28,v11,0
                  vfirst.m zero,v17
                  vid.v v6
                  vmsleu.vv  v3,v25,v28
                  vfirst.m zero,v30
                  viota.m v17,v19
                  vrsub.vx   v21,v17,a4
                  xori       s0, s4, 423
                  vmv.x.s zero,v3
                  vslideup.vi v1,v25,0
                  vmxnor.mm  v26,v1,v19
                  divu       t1, t5, t6
                  vsra.vx    v31,v11,sp,v0.t
                  vmnand.mm  v7,v24,v1
                  vxor.vx    v17,v11,a4,v0.t
                  div        a3, t6, sp
                  vadc.vim   v29,v21,0,v0
                  mulh       t1, t3, s4
                  vmaxu.vx   v24,v26,s8
                  vor.vx     v18,v17,t4
                  vmor.mm    v30,v14,v17
                  vmsgtu.vx  v20,v7,a6,v0.t
                  vmnand.mm  v12,v21,v13
                  ori        s1, s5, -605
                  vmxnor.mm  v18,v13,v27
                  divu       s5, s1, t2
                  andi       t0, s0, -357
                  vmsof.m v15,v17,v0.t
                  vand.vv    v26,v17,v22
                  vmnand.mm  v24,v11,v28
                  vmsif.m v9,v23
                  vsub.vx    v7,v1,s3,v0.t
                  vsub.vx    v19,v28,t5
                  vadc.vvm   v19,v25,v7,v0
                  vmsne.vi   v1,v23,0
                  sltu       zero, a3, ra
                  slli       t3, t3, 13
                  viota.m v28,v23,v0.t
                  vmsgtu.vi  v3,v0,0,v0.t
                  vadd.vx    v10,v3,ra
                  vmin.vx    v5,v25,tp
                  vmsltu.vv  v2,v22,v28
                  vsrl.vx    v22,v5,a2,v0.t
                  remu       a5, s10, s11
                  vmul.vx    v17,v18,a0,v0.t
                  sra        a2, gp, s11
                  sll        t2, t6, s7
                  vmnor.mm   v2,v25,v23
                  ori        tp, a7, -313
                  sltiu      a4, t2, 773
                  div        s5, t4, a7
                  vmandnot.mm v8,v29,v22
                  ori        s6, a3, 549
                  vmulh.vx   v26,v12,s1,v0.t
                  srai       a1, s7, 17
                  vmul.vx    v26,v21,zero
                  vmand.mm   v20,v29,v16
                  vmulhsu.vx v23,v12,a1
                  vslide1down.vx v28,v19,sp
                  vmv.v.x v14,s1
                  vadd.vx    v9,v29,a7,v0.t
                  vmornot.mm v14,v22,v9
                  vmadd.vv   v15,v17,v31
                  vmulh.vx   v27,v29,t4,v0.t
                  vadc.vxm   v19,v3,s1,v0
                  vmsif.m v30,v18,v0.t
                  vmnor.mm   v12,v8,v2
                  vrsub.vx   v8,v2,a2,v0.t
                  srli       a7, s0, 29
                  sltu       s1, a3, a3
                  andi       t6, s0, 312
                  slti       s7, t2, 91
                  vmseq.vx   v3,v5,s3
                  rem        s1, a4, a5
                  vadd.vx    v23,v7,s9,v0.t
                  vmsle.vi   v27,v6,0
                  vmsgt.vi   v16,v25,0,v0.t
                  mulh       s7, t0, tp
                  div        a3, t5, s10
                  vmacc.vx   v28,s2,v10
                  vpopc.m zero,v30
                  vmadd.vx   v28,t0,v11,v0.t
                  ori        t4, a1, -112
                  sll        sp, t3, s8
                  vmsof.m v18,v30,v0.t
                  andi       a7, s7, -313
                  vsbc.vvm   v11,v14,v30,v0
                  mulhsu     t6, s5, t5
                  vslidedown.vx v6,v4,s2
                  mulhu      s0, s5, s1
                  vmaxu.vv   v22,v23,v26
                  vor.vv     v1,v4,v14
                  vmxor.mm   v27,v30,v15
                  vmv.x.s zero,v26
                  mulhu      a4, s11, t1
                  vmaxu.vv   v17,v28,v22
                  vmandnot.mm v0,v14,v13
                  sll        s8, s6, s11
                  vmsgt.vi   v4,v17,0,v0.t
                  sub        zero, t2, t5
                  vslideup.vi v2,v5,0,v0.t
                  slti       t2, s11, 337
                  slt        t3, t6, s4
                  vmulhu.vv  v3,v5,v14
                  mulhu      s4, s7, a0
                  vsbc.vxm   v11,v16,s8,v0
                  lui        a0, 247272
                  rem        t6, a4, t6
                  vmin.vx    v1,v12,a3,v0.t
                  and        a2, s3, a2
                  vand.vv    v23,v19,v9,v0.t
                  srai       s2, s1, 16
                  vmnand.mm  v24,v23,v5
                  vsbc.vxm   v29,v15,a6,v0
                  vmadd.vv   v10,v21,v25
                  vmornot.mm v2,v17,v4
                  sra        a2, a6, s0
                  vmadd.vv   v19,v21,v21,v0.t
                  vmsif.m v17,v29
                  div        s11, t3, s2
                  div        sp, t5, a0
                  vsra.vi    v28,v8,0,v0.t
                  sll        s8, a3, a5
                  vsrl.vi    v0,v7,0
                  vmsne.vi   v10,v6,0
                  vor.vi     v23,v16,0,v0.t
                  auipc      a0, 245091
                  sra        gp, t4, s3
                  and        a0, ra, s6
                  div        t0, sp, a5
                  mulhu      s6, s0, gp
                  vmor.mm    v9,v11,v12
                  and        a4, s3, a5
                  vmv.s.x v17,s6
                  vslideup.vx v19,v2,a5
                  or         a5, s9, t3
                  vmsltu.vv  v25,v14,v10,v0.t
                  vand.vx    v1,v1,a4,v0.t
                  ori        s2, gp, -246
                  vmul.vx    v21,v7,s6,v0.t
                  vxor.vx    v24,v15,t1
                  and        a4, t5, ra
                  vmadd.vx   v14,t1,v24
                  vmnor.mm   v15,v22,v19
                  vmsne.vx   v25,v11,s10,v0.t
                  divu       tp, s9, t2
                  vmandnot.mm v19,v16,v2
                  vpopc.m zero,v17
                  vmv.x.s zero,v30
                  slli       t0, s7, 27
                  xor        t0, a0, t3
                  vsub.vx    v9,v6,a5
                  vmxnor.mm  v13,v21,v6
                  vmandnot.mm v6,v8,v18
                  vadc.vvm   v26,v16,v9,v0
                  addi       t1, a0, 35
                  vand.vv    v26,v8,v30,v0.t
                  vid.v v20,v0.t
                  vmacc.vv   v22,v23,v10
                  ori        s0, a7, 1012
                  sub        a2, a2, t4
                  vmv.s.x v31,s8
                  andi       a0, sp, -331
                  vor.vx     v20,v8,s8
                  divu       a6, a1, t4
                  vmseq.vi   v19,v17,0
                  vmandnot.mm v26,v22,v6
                  vmnor.mm   v30,v29,v5
                  vslide1down.vx v2,v13,s7
                  addi       t6, a4, -945
                  vmseq.vx   v5,v19,a6,v0.t
                  sra        t4, s9, t4
                  vmnor.mm   v14,v23,v9
                  vmv.s.x v28,t5
                  vmaxu.vx   v25,v23,t2
                  sll        s11, s8, t0
                  vmsof.m v29,v18
                  mulh       s0, t3, a1
                  vadc.vvm   v23,v0,v3,v0
                  vmulhu.vx  v1,v4,a2,v0.t
                  vmslt.vv   v13,v0,v4
                  vmslt.vx   v0,v7,a1
                  addi       t4, a6, 207
                  vmsbf.m v2,v22,v0.t
                  vmv.x.s zero,v26
                  vmax.vx    v21,v28,a3,v0.t
                  srl        t1, a2, t6
                  vsbc.vxm   v30,v23,tp,v0
                  addi       s2, tp, -513
                  slt        t3, a4, s1
                  vmnand.mm  v30,v19,v11
                  and        a7, s4, a0
                  sra        s5, s5, s8
                  vsll.vx    v28,v17,ra,v0.t
                  mulhsu     a6, s5, sp
                  mul        sp, s7, s10
                  vmadd.vv   v31,v13,v30
                  vmsgtu.vx  v17,v0,tp,v0.t
                  vmaxu.vv   v8,v10,v10,v0.t
                  vsrl.vv    v22,v2,v15
                  sll        s1, a6, a4
                  vmnand.mm  v25,v28,v5
                  divu       a6, a1, s2
                  or         t1, zero, a4
                  slt        s2, t5, t4
                  sltiu      ra, s5, -143
                  vmulhu.vv  v16,v18,v25,v0.t
                  vmacc.vv   v19,v11,v27
                  mulhsu     t2, t1, s2
                  vmv.v.i v8,0
                  and        a4, s11, s1
                  vminu.vv   v9,v9,v21,v0.t
                  sltiu      t0, ra, -336
                  vmnor.mm   v21,v22,v7
                  vid.v v13
                  vsll.vi    v13,v25,0,v0.t
                  sltiu      s1, ra, 500
                  vmsgt.vi   v24,v20,0,v0.t
                  vmulh.vx   v16,v20,tp
                  slli       t2, a5, 13
                  add        sp, s8, s4
                  vmxnor.mm  v13,v13,v3
                  vslidedown.vx v5,v16,s7,v0.t
                  vpopc.m zero,v12
                  or         s11, s0, zero
                  mul        t3, tp, a4
                  mulh       s4, sp, s7
                  vmslt.vx   v3,v0,s3
                  srai       s6, s9, 16
                  vmand.mm   v21,v20,v19
                  vmsne.vi   v15,v20,0
                  vfirst.m zero,v13,v0.t
                  vmsgt.vx   v21,v6,t0,v0.t
                  vmulhu.vv  v31,v18,v19
                  mulhu      s1, a5, a7
                  vmsleu.vx  v18,v7,gp
                  sltiu      a7, s3, 475
                  vmulh.vx   v21,v13,gp,v0.t
                  slli       s0, gp, 18
                  andi       s5, a1, 993
                  sltu       ra, ra, a1
                  auipc      tp, 693055
                  vmandnot.mm v2,v8,v31
                  vmsgt.vi   v20,v18,0,v0.t
                  vrgather.vx v14,v10,sp,v0.t
                  vmsbf.m v30,v26
                  vslideup.vi v25,v17,0
                  xor        zero, a6, a6
                  vmsbf.m v3,v12
                  srl        t6, ra, s1
                  vmsof.m v3,v30,v0.t
                  vmv.s.x v3,sp
                  vpopc.m zero,v2
                  vmxor.mm   v21,v4,v20
                  xori       t4, s7, -505
                  divu       t3, sp, s1
                  vmsleu.vx  v29,v1,s3
                  vminu.vx   v9,v1,t2,v0.t
                  vslideup.vx v7,v4,s3,v0.t
                  add        t1, s11, s6
                  vmornot.mm v16,v29,v24
                  viota.m v22,v1
                  sltiu      ra, t0, 347
                  vsll.vx    v16,v0,s2
                  vmadd.vv   v14,v25,v12
                  slt        t2, a3, t1
                  vmsgt.vi   v7,v6,0
                  vmsbf.m v7,v9
                  slti       a1, t4, -229
                  vsub.vv    v28,v0,v8
                  sub        gp, s11, zero
                  vmxnor.mm  v26,v5,v10
                  sltu       s1, s9, gp
                  vmulhsu.vv v18,v0,v12,v0.t
                  addi       s7, a1, -994
                  vpopc.m zero,v26,v0.t
                  vsbc.vvm   v10,v5,v13,v0
                  mul        s4, s6, t3
                  and        a5, gp, a1
                  vslide1up.vx v29,v15,s0,v0.t
                  vmadd.vv   v13,v27,v9,v0.t
                  vand.vv    v2,v13,v25
                  andi       a4, t1, 937
                  vmulhu.vx  v3,v11,s0
                  vmsbf.m v6,v26
                  sra        s4, a3, t6
                  vand.vv    v20,v19,v22,v0.t
                  or         gp, zero, s1
                  vsrl.vv    v23,v2,v9
                  vmv.s.x v20,a3
                  sltiu      s2, tp, 566
                  vid.v v28,v0.t
                  vmv.x.s zero,v31
                  vmsgtu.vi  v1,v6,0,v0.t
                  vslidedown.vi v0,v5,0
                  vand.vx    v2,v3,s2
                  auipc      t0, 690271
                  divu       t2, s8, s7
                  vminu.vv   v15,v22,v28,v0.t
                  vmsle.vx   v7,v22,s7,v0.t
                  vmsltu.vx  v26,v10,s11
                  vand.vx    v17,v15,a3
                  vmsne.vv   v23,v11,v7
                  mul        s11, a3, t0
                  vsrl.vx    v22,v21,ra
                  vmsgt.vi   v8,v3,0
                  vmaxu.vx   v4,v12,tp,v0.t
                  sll        a4, sp, s10
                  sltiu      s5, t5, 39
                  vmsgtu.vi  v0,v3,0
                  vsub.vx    v31,v11,a5
                  rem        t0, t1, t4
                  mulhu      s4, s0, s4
                  vadc.vxm   v3,v2,gp,v0
                  vsrl.vv    v2,v5,v2,v0.t
                  vmul.vx    v0,v2,a4
                  vslideup.vx v24,v3,s2,v0.t
                  vsra.vx    v5,v9,t4
                  ori        t0, s8, -836
                  andi       t6, t6, -127
                  lui        t4, 321522
                  vmax.vx    v26,v1,t3,v0.t
                  sltiu      sp, a6, -348
                  vadd.vx    v25,v3,t3
                  remu       t4, t2, t1
                  vrsub.vx   v28,v15,s7
                  xori       s8, t1, -317
                  vmsgt.vx   v28,v5,a0,v0.t
                  vmslt.vv   v11,v2,v23
                  vmv.s.x v18,s5
                  vsra.vx    v27,v3,t1,v0.t
                  viota.m v20,v12,v0.t
                  or         s4, t3, s4
                  vmseq.vx   v28,v3,a0
                  vmandnot.mm v28,v13,v3
                  vmornot.mm v5,v15,v21
                  divu       ra, s5, s4
                  vmornot.mm v28,v26,v28
                  rem        t1, t0, t3
                  mulhu      gp, s11, s3
                  vmaxu.vv   v3,v4,v1,v0.t
                  divu       a0, a6, a7
                  rem        a1, t6, a4
                  vmv.s.x v17,s11
                  vmxnor.mm  v11,v31,v4
                  srl        tp, s5, s11
                  slt        s7, s8, t0
                  srli       a4, a1, 12
                  vslidedown.vi v13,v22,0,v0.t
                  vmnand.mm  v25,v16,v6
                  vmsgtu.vx  v25,v28,s0,v0.t
                  mulhsu     s7, s5, t3
                  vmslt.vv   v25,v30,v27
                  vmulh.vx   v0,v23,s1
                  vadd.vx    v4,v13,a7
                  vadd.vi    v23,v20,0
                  vsub.vv    v23,v31,v23,v0.t
                  vmseq.vv   v25,v28,v22
                  vmornot.mm v30,v24,v13
                  vsll.vv    v29,v26,v6,v0.t
                  vmin.vv    v10,v31,v7
                  vpopc.m zero,v19
                  vmaxu.vv   v29,v20,v28,v0.t
                  vmnor.mm   v7,v24,v13
                  viota.m v20,v19
                  vmulhu.vv  v13,v8,v13
                  vmadd.vx   v11,gp,v14
                  slti       t0, s1, 51
                  vmxnor.mm  v22,v3,v27
                  vslide1down.vx v29,v5,a4
                  vmsof.m v22,v8
                  srli       t0, s0, 7
                  vmsif.m v16,v0
                  vminu.vx   v3,v2,t6
                  vmornot.mm v12,v14,v21
                  vmxor.mm   v9,v12,v9
                  vsll.vv    v26,v4,v13
                  slti       zero, s1, -777
                  xori       s11, s6, 262
                  sll        a4, t5, gp
                  vmornot.mm v20,v23,v9
                  vmulhu.vv  v19,v10,v19,v0.t
                  mulh       sp, a7, t5
                  vadd.vx    v21,v10,s8
                  vmandnot.mm v16,v27,v5
                  viota.m v9,v19,v0.t
                  vslidedown.vi v4,v8,0
                  vid.v v14,v0.t
                  vmslt.vx   v0,v10,t2
                  auipc      t2, 712948
                  vslide1down.vx v18,v2,a4
                  auipc      t1, 839264
                  viota.m v24,v16
                  vand.vv    v26,v21,v7
                  vslide1up.vx v27,v7,s9,v0.t
                  mulhu      a2, s8, a0
                  vmsbf.m v4,v7
                  slt        t5, tp, t6
                  vmv.v.i v10,0
                  vor.vx     v25,v18,zero
                  vand.vx    v1,v26,s8,v0.t
                  vpopc.m zero,v10
                  vmsltu.vv  v31,v1,v15,v0.t
                  vmornot.mm v1,v25,v26
                  vand.vi    v2,v16,0,v0.t
                  sll        s6, t2, gp
                  vadd.vx    v3,v31,s10,v0.t
                  vminu.vx   v5,v0,sp,v0.t
                  vmadd.vv   v25,v31,v6
                  vslide1up.vx v17,v1,sp
                  vmsif.m v20,v0
                  mulhsu     t3, a7, a5
                  vmv.s.x v23,a4
                  vrsub.vi   v26,v19,0
                  mulh       s2, t2, s1
                  vmnor.mm   v23,v17,v18
                  vslideup.vi v12,v15,0
                  andi       t3, a4, -883
                  vid.v v10,v0.t
                  vmulhu.vx  v0,v11,s5
                  vmv.s.x v29,t2
                  vmv.x.s zero,v5
                  mulhsu     s0, t6, s4
                  div        a7, gp, t3
                  slti       s6, s11, 247
                  vmxnor.mm  v21,v8,v21
                  srl        t2, a0, a7
                  sltu       s7, t2, a1
                  vmacc.vx   v30,s2,v3
                  vsra.vi    v6,v27,0
                  vmsle.vv   v3,v31,v1,v0.t
                  vor.vi     v2,v27,0,v0.t
                  vsll.vx    v9,v19,t5,v0.t
                  rem        t1, s11, ra
                  vmacc.vv   v16,v26,v27,v0.t
                  vmand.mm   v29,v19,v4
                  vmaxu.vv   v24,v25,v19,v0.t
                  vmor.mm    v6,v23,v12
                  srl        t4, a5, a0
                  vmulhsu.vx v24,v28,a3
                  slli       t6, a5, 5
                  rem        t6, s2, a4
                  slti       gp, s7, -176
                  vmv.s.x v18,s11
                  mulh       s11, t1, a0
                  vmaxu.vv   v4,v16,v3,v0.t
                  vmsgtu.vx  v0,v17,s3
                  viota.m v17,v2,v0.t
                  vmv.s.x v15,a6
                  vid.v v19,v0.t
                  vmxnor.mm  v8,v7,v21
                  srli       a3, s4, 16
                  auipc      gp, 776185
                  xor        zero, tp, t3
                  vmandnot.mm v18,v11,v8
                  vmnor.mm   v10,v6,v3
                  vmv.x.s zero,v24
                  vmsbf.m v14,v30
                  vmor.mm    v29,v30,v12
                  vsrl.vv    v21,v28,v3
                  vmxnor.mm  v11,v4,v6
                  vmulhu.vx  v20,v5,s6
                  vslidedown.vi v15,v0,0,v0.t
                  vmseq.vi   v28,v24,0
                  srl        gp, s4, s6
                  xor        gp, t4, s1
                  vmnor.mm   v16,v14,v8
                  sra        a1, sp, t5
                  or         t6, a0, s3
                  vmsleu.vx  v4,v29,tp
                  vmsne.vv   v11,v30,v26
                  vrsub.vi   v30,v31,0
                  div        t5, sp, t0
                  vmsltu.vx  v0,v3,s7
                  vmulhu.vv  v17,v0,v26,v0.t
                  vmxor.mm   v13,v9,v11
                  vmsif.m v30,v6,v0.t
                  or         s4, ra, s10
                  srl        sp, s5, s7
                  add        s0, t6, s6
                  mul        t2, t1, s2
                  vrgather.vv v2,v13,v19
                  vmulhsu.vx v16,v14,t4
                  vmaxu.vx   v28,v24,s9,v0.t
                  vmandnot.mm v14,v5,v4
                  vmv.v.x v31,a6
                  vmsltu.vx  v26,v19,t0
                  mulh       ra, a5, s9
                  vmsgtu.vx  v5,v9,s4
                  remu       a1, s3, t5
                  vsll.vi    v14,v24,0,v0.t
                  vpopc.m zero,v21
                  vmsgt.vi   v22,v29,0
                  vand.vv    v29,v10,v1,v0.t
                  vmornot.mm v9,v4,v28
                  vmul.vx    v28,v23,a7,v0.t
                  sub        s8, ra, t0
                  vmv.v.v v2,v17
                  mulhu      s7, t6, t4
                  vmsle.vx   v27,v0,s11
                  vslidedown.vx v18,v25,a0
                  vsra.vv    v2,v18,v30
                  ori        gp, t1, 734
                  vmornot.mm v28,v28,v7
                  vmxor.mm   v25,v22,v27
                  slt        t4, s11, t4
                  vmv.s.x v18,a5
                  remu       t2, s7, a0
                  vmsgt.vi   v23,v1,0
                  ori        s2, t5, -906
                  vmin.vv    v22,v20,v21
                  vmsgt.vx   v7,v12,a4
                  vadd.vv    v27,v3,v0,v0.t
                  ori        zero, s11, -930
                  vmin.vx    v7,v10,t5
                  andi       s1, s3, -184
                  sub        s0, a7, s1
                  vmulhu.vv  v21,v31,v28,v0.t
                  vxor.vv    v16,v17,v31
                  vmv.x.s zero,v19
                  vslide1down.vx v19,v0,t2
                  vsbc.vxm   v27,v5,t4,v0
                  rem        gp, a7, a5
                  divu       t4, a1, a2
                  vslideup.vi v25,v11,0
                  div        a6, a4, s8
                  vmv.x.s zero,v6
                  addi       s1, s0, 296
                  vsub.vx    v0,v16,a0
                  vmnand.mm  v18,v23,v25
                  vmsbf.m v14,v7
                  sll        sp, t1, a1
                  vor.vx     v15,v14,s9,v0.t
                  sra        a3, t4, zero
                  vmv.v.x v13,ra
                  vmsgtu.vx  v11,v20,s10
                  vslideup.vi v23,v9,0,v0.t
                  slti       t3, t2, -861
                  or         a0, a3, s5
                  mulhsu     t5, s10, t0
                  vmulhu.vv  v12,v22,v2,v0.t
                  sll        t2, s0, t5
                  vminu.vx   v9,v9,a4
                  vmadd.vv   v2,v21,v27
                  vmor.mm    v25,v8,v16
                  vpopc.m zero,v7,v0.t
                  vslide1down.vx v10,v3,t5,v0.t
                  vsrl.vi    v21,v17,0
                  rem        ra, a4, t2
                  vmsltu.vv  v21,v6,v0,v0.t
                  vfirst.m zero,v9,v0.t
                  vid.v v30,v0.t
                  vmadd.vv   v29,v21,v6
                  vmsgt.vi   v4,v29,0,v0.t
                  divu       s7, zero, zero
                  vmand.mm   v21,v3,v5
                  vmsgtu.vi  v12,v25,0
                  vmin.vv    v3,v14,v8,v0.t
                  vmv.x.s zero,v8
                  sltu       a0, s7, a1
                  vmv.s.x v1,zero
                  auipc      s11, 251995
                  vmnor.mm   v21,v5,v13
                  xor        a7, gp, t5
                  mulhu      a1, t1, s8
                  vmsbf.m v30,v0
                  vsra.vx    v17,v19,zero
                  vmsle.vv   v13,v28,v5,v0.t
                  or         s0, gp, ra
                  vxor.vv    v16,v13,v26,v0.t
                  xori       s4, a1, -379
                  and        a5, a3, s4
                  mulhsu     a1, a1, s6
                  auipc      a3, 198069
                  vslide1up.vx v22,v14,a5,v0.t
                  vmv.s.x v22,a6
                  slt        s4, a6, zero
                  vmsne.vx   v8,v9,s4
                  vsub.vx    v3,v28,a5
                  vmsof.m v25,v30,v0.t
                  srli       s7, t1, 26
                  vsrl.vx    v28,v15,t3,v0.t
                  vmseq.vi   v3,v26,0
                  divu       t6, a1, s8
                  vmv.s.x v3,sp
                  vslide1up.vx v14,v19,t1,v0.t
                  vmsif.m v7,v0,v0.t
                  vsbc.vxm   v19,v8,gp,v0
                  mul        tp, s10, s9
                  vxor.vi    v31,v3,0,v0.t
                  and        a0, a6, t2
                  lui        a5, 431034
                  and        t3, s7, t6
                  mulh       s4, s3, ra
                  sra        gp, a5, a4
                  sll        ra, s7, a7
                  mulh       tp, s9, zero
                  vpopc.m zero,v1
                  mulh       ra, tp, a5
                  vmsgtu.vi  v6,v16,0,v0.t
                  vfirst.m zero,v15
                  xor        a3, a5, t2
                  mulh       t1, s10, a0
                  mulhu      t0, t4, a6
                  vpopc.m zero,v17,v0.t
                  vmulhsu.vv v21,v3,v27
                  vsrl.vx    v9,v24,gp,v0.t
                  vor.vi     v20,v28,0,v0.t
                  xori       s11, a3, 80
                  vmsltu.vv  v8,v17,v7
                  srai       t3, a2, 5
                  vsrl.vv    v27,v7,v28,v0.t
                  vfirst.m zero,v13
                  vslide1down.vx v24,v13,s11,v0.t
                  vor.vi     v28,v23,0
                  slli       t5, t0, 9
                  vsll.vx    v11,v27,a1,v0.t
                  vmaxu.vx   v14,v20,t5
                  srai       s4, s10, 4
                  vmsgt.vi   v4,v0,0,v0.t
                  vmv.s.x v6,a3
                  divu       tp, s5, a0
                  vmax.vx    v2,v27,a6,v0.t
                  vsra.vx    v21,v11,t2
                  vmsne.vv   v6,v13,v18
                  ori        s1, a4, 353
                  vmxor.mm   v16,v21,v28
                  vmadd.vv   v22,v1,v29,v0.t
                  vmor.mm    v25,v29,v8
                  vmornot.mm v21,v16,v30
                  vmsbf.m v30,v1,v0.t
                  vslide1down.vx v6,v9,s10,v0.t
                  srai       s1, s11, 12
                  vsrl.vi    v24,v5,0,v0.t
                  sra        s4, a4, t1
                  vmandnot.mm v26,v10,v18
                  vor.vv     v9,v9,v16
                  vmv.s.x v27,s5
                  sra        s2, tp, s2
                  sra        s5, s11, s8
                  divu       s1, a4, a0
                  sub        s11, a0, s4
                  viota.m v23,v27,v0.t
                  vmsbf.m v13,v27,v0.t
                  mulh       s8, zero, t1
                  srli       t4, t6, 13
                  vmulh.vx   v10,v14,s4,v0.t
                  vmv.s.x v9,tp
                  vmslt.vx   v2,v5,ra,v0.t
                  srli       s2, s0, 30
                  vadc.vvm   v13,v31,v30,v0
                  vmsgt.vx   v10,v8,s6,v0.t
                  xori       s5, s1, 309
                  vmxor.mm   v25,v2,v11
                  vsrl.vi    v7,v27,0
                  ori        t1, s8, 564
                  remu       gp, a6, s4
                  add        a6, s1, zero
                  vfirst.m zero,v7,v0.t
                  xor        a1, tp, s1
                  andi       s7, sp, -978
                  xori       a6, a4, -794
                  andi       t2, a6, 538
                  vslide1up.vx v15,v19,s1,v0.t
                  vmnand.mm  v28,v25,v7
                  sub        s2, t6, t0
                  vmand.mm   v16,v15,v29
                  vmv.x.s zero,v10
                  vrsub.vx   v3,v11,s6,v0.t
                  vmaxu.vv   v16,v0,v23
                  vsbc.vxm   v11,v11,t4,v0
                  slt        a6, zero, a6
                  viota.m v31,v12
                  mulh       zero, a1, s4
                  vadd.vv    v2,v18,v11
                  vmsle.vv   v29,v16,v20
                  vrsub.vx   v18,v21,a6
                  vmsif.m v2,v28,v0.t
                  vmsleu.vi  v8,v7,0
                  vsll.vi    v17,v10,0,v0.t
                  slti       s5, s4, 646
                  slli       gp, s7, 6
                  vmor.mm    v6,v21,v4
                  vmor.mm    v20,v9,v0
                  lui        tp, 323698
                  mulh       t2, a6, t1
                  auipc      t2, 469704
                  lui        t4, 530238
                  vrsub.vi   v18,v10,0
                  vmv.s.x v2,t6
                  vadc.vxm   v6,v24,s11,v0
                  and        a3, t2, s9
                  vmin.vx    v6,v29,s3
                  vmulh.vx   v13,v22,t4
                  vmandnot.mm v17,v11,v27
                  vslide1up.vx v27,v8,s11,v0.t
                  vmxor.mm   v22,v22,v11
                  vmulhu.vv  v3,v9,v11
                  vmax.vx    v4,v14,s2
                  vmul.vx    v29,v16,a3,v0.t
                  vsub.vv    v14,v25,v4
                  lui        zero, 593933
                  vmxnor.mm  v8,v1,v2
                  vmsleu.vx  v13,v9,s7,v0.t
                  vmsgtu.vx  v26,v14,s1
                  vmornot.mm v8,v16,v31
                  vmsltu.vv  v3,v20,v2
                  vmul.vv    v21,v28,v6,v0.t
                  xori       s6, s1, 688
                  mulhsu     s5, a1, s10
                  vmsle.vv   v1,v5,v12,v0.t
                  vmsltu.vv  v19,v5,v3
                  or         zero, s2, a1
                  srl        a4, ra, a7
                  sltiu      s1, s4, 567
                  vmnand.mm  v24,v14,v7
                  mulhu      ra, t5, a4
                  or         sp, t4, zero
                  vmsltu.vx  v23,v30,s11,v0.t
                  sltiu      s2, a3, 442
                  vmv.v.v v13,v24
                  divu       a0, ra, a5
                  vmsgt.vx   v24,v2,t6,v0.t
                  vslide1up.vx v11,v17,t2,v0.t
                  div        s4, a5, ra
                  sltu       ra, sp, s3
                  vmax.vx    v31,v27,a6,v0.t
                  mulhu      t4, a0, s2
                  vid.v v29,v0.t
                  vid.v v20
                  vmsif.m v18,v11,v0.t
                  vmaxu.vv   v31,v22,v8
                  add        a6, s7, t3
                  divu       s8, t1, a5
                  vmulhu.vv  v4,v31,v15
                  vmv.v.x v2,s9
                  vmslt.vv   v12,v18,v28,v0.t
                  vmsne.vi   v12,v16,0
                  vrsub.vx   v26,v11,s4
                  slli       t0, a4, 6
                  vslidedown.vx v26,v8,t1
                  slt        s2, s1, tp
                  rem        t3, a7, s2
                  vmsltu.vv  v26,v22,v23,v0.t
                  vmxnor.mm  v22,v17,v17
                  vmseq.vv   v3,v10,v13
                  remu       t1, s7, t1
                  vslide1down.vx v11,v12,a6
                  and        s11, a0, s8
                  xori       t1, s0, 404
                  viota.m v0,v17
                  vsub.vv    v26,v24,v24
                  add        a6, t1, a0
                  srli       a3, s1, 16
                  vmin.vx    v30,v31,t3
                  vadc.vvm   v30,v29,v12,v0
                  remu       s11, a5, t0
                  vslide1down.vx v12,v31,a7,v0.t
                  vmsof.m v28,v17
                  vmax.vv    v24,v10,v0,v0.t
                  vmul.vx    v22,v28,a6
                  addi       sp, zero, -314
                  lui        ra, 698624
                  rem        a0, a4, a6
                  vxor.vi    v2,v4,0,v0.t
                  vmseq.vx   v17,v3,a7,v0.t
                  vmv.v.i v29,0
                  slli       t2, tp, 31
                  vmsgtu.vx  v27,v25,a7
                  sltu       tp, t0, s11
                  vmsbf.m v8,v21
                  divu       s0, s1, s10
                  vmsltu.vv  v31,v25,v2,v0.t
                  vmulh.vv   v20,v11,v17,v0.t
                  vxor.vx    v29,v6,s8,v0.t
                  vid.v v17
                  vminu.vx   v19,v26,s11
                  vsra.vv    v8,v14,v30
                  rem        ra, t5, ra
                  vadc.vvm   v28,v29,v21,v0
                  vrgather.vx v26,v3,ra
                  vmulhsu.vv v5,v24,v20
                  vmsltu.vv  v12,v7,v21
                  auipc      s2, 926586
                  vslide1up.vx v21,v25,s10
                  vmacc.vx   v9,s9,v27
                  vmulhu.vv  v0,v7,v5
                  vrgather.vi v9,v2,0,v0.t
                  vslideup.vi v10,v6,0
                  slli       t3, s3, 26
                  vmax.vx    v29,v13,t0,v0.t
                  vmxor.mm   v28,v2,v0
                  ori        ra, ra, 23
                  vslidedown.vi v31,v15,0
                  vfirst.m zero,v24
                  vrgather.vx v2,v28,s7
                  xori       s1, a1, 241
                  auipc      a7, 600863
                  vmv.v.i v6,0
                  sra        t2, a2, s10
                  vsub.vx    v25,v11,tp,v0.t
                  vmulhu.vv  v16,v20,v21,v0.t
                  vmsgtu.vx  v19,v2,s10,v0.t
                  and        t5, s10, s0
                  vmadd.vx   v25,a3,v6
                  vmulh.vx   v16,v30,s9,v0.t
                  lui        s5, 165594
                  vsbc.vxm   v29,v25,s6,v0
                  vslidedown.vx v9,v12,s11
                  vmulhsu.vv v27,v5,v13,v0.t
                  vmacc.vv   v26,v24,v3
                  vand.vi    v21,v10,0,v0.t
                  sll        a0, t1, a7
                  vmax.vv    v9,v29,v6,v0.t
                  vmsleu.vi  v28,v10,0
                  vsbc.vxm   v28,v22,a6,v0
                  vmsltu.vx  v25,v29,t3
                  or         a3, s8, s6
                  vmax.vx    v15,v14,t4
                  sll        t5, a4, s8
                  mulh       s1, s11, t2
                  sub        s7, s0, s6
                  viota.m v27,v31
                  vmv.v.i v11,0
                  vmornot.mm v18,v29,v22
                  vrsub.vi   v5,v20,0,v0.t
                  or         zero, s0, s7
                  vmv.s.x v13,a2
                  auipc      a2, 657348
                  vmand.mm   v4,v15,v27
                  remu       t6, a3, s4
                  vsra.vv    v27,v21,v16
                  vmaxu.vx   v10,v12,a6
                  vmv.x.s zero,v26
                  vmsne.vx   v4,v10,s11,v0.t
                  vmv.x.s zero,v4
                  and        a1, tp, s9
                  add        t4, a6, s5
                  vmxor.mm   v31,v31,v0
                  mulhsu     t4, s7, t1
                  vsra.vi    v16,v29,0,v0.t
                  vmulhsu.vx v7,v18,tp,v0.t
                  mulh       s1, s9, a1
                  mul        a1, t6, s2
                  vmornot.mm v25,v14,v26
                  vminu.vv   v10,v11,v29,v0.t
                  sra        a2, s8, t1
                  remu       gp, s2, s0
                  vmulhsu.vv v30,v0,v13
                  vmsif.m v30,v16,v0.t
                  vmsne.vv   v14,v1,v16
                  vfirst.m zero,v12
                  vsub.vv    v15,v23,v12
                  vmv.s.x v25,t6
                  vmsne.vi   v12,v8,0,v0.t
                  vsbc.vvm   v2,v9,v18,v0
                  slt        s7, s2, s11
                  viota.m v14,v6
                  vmacc.vx   v7,s3,v6
                  andi       ra, s7, -1008
                  auipc      s7, 800408
                  slti       t1, s6, -135
                  ori        s5, s2, 813
                  vmadd.vx   v16,t3,v26,v0.t
                  vor.vv     v10,v29,v21
                  auipc      t1, 271245
                  vmsif.m v10,v14,v0.t
                  vmax.vv    v22,v23,v1
                  vsrl.vv    v31,v22,v13
                  divu       s6, s2, s5
                  vmsne.vi   v27,v15,0
                  slli       a0, a5, 10
                  vmseq.vi   v11,v12,0
                  vmsif.m v5,v13
                  vmand.mm   v19,v17,v16
                  andi       zero, s9, 954
                  vor.vx     v12,v8,a7,v0.t
                  vminu.vv   v10,v21,v8,v0.t
                  vmsof.m v5,v13
                  sltiu      a5, s11, -531
                  vor.vx     v12,v24,s11,v0.t
                  vsbc.vvm   v20,v21,v12,v0
                  vmsne.vv   v31,v8,v14
                  vmulhu.vx  v23,v3,s0,v0.t
                  vmulhu.vx  v16,v31,t3
                  vmv.s.x v8,a4
                  rem        t4, t5, t6
                  vmxor.mm   v19,v10,v23
                  vsrl.vx    v17,v24,s1
                  vmsof.m v3,v19,v0.t
                  mulhsu     zero, gp, s5
                  mulh       s11, s4, a0
                  vmseq.vx   v18,v26,s3
                  vslide1up.vx v29,v18,t5,v0.t
                  divu       t2, a5, a5
                  slti       zero, s10, -350
                  vmv.x.s zero,v16
                  vmslt.vx   v11,v25,a1
                  vsbc.vvm   v25,v21,v21,v0
                  vmulh.vv   v3,v9,v26,v0.t
                  vsra.vx    v26,v15,s2
                  sub        t4, s7, sp
                  vmornot.mm v22,v1,v17
                  or         a4, a1, a5
                  sll        zero, zero, sp
                  lui        t4, 486156
                  vmsltu.vx  v14,v5,a0
                  remu       t5, t4, s4
                  vmand.mm   v6,v23,v14
                  vpopc.m zero,v9,v0.t
                  vmulhsu.vv v0,v2,v31
                  vmsgt.vi   v0,v2,0
                  vmxor.mm   v0,v1,v5
                  xori       s0, s5, -865
                  vmnor.mm   v10,v26,v16
                  vmornot.mm v7,v20,v31
                  addi       a5, s5, 699
                  vsll.vx    v8,v19,a2,v0.t
                  addi       s4, s10, 57
                  vmsof.m v28,v17
                  vmadd.vv   v30,v24,v30
                  vmxor.mm   v3,v30,v10
                  vor.vv     v12,v3,v14,v0.t
                  vmsif.m v26,v28,v0.t
                  vmsof.m v5,v14
                  vslide1down.vx v13,v18,t6,v0.t
                  lui        zero, 228254
                  and        a6, a3, a6
                  mul        zero, t1, a6
                  vadd.vv    v27,v20,v17
                  vmxnor.mm  v8,v0,v25
                  div        t3, a4, t4
                  and        t0, s4, s8
                  vmseq.vi   v22,v10,0
                  vmsne.vi   v15,v6,0
                  add        s5, s10, s10
                  vand.vv    v26,v18,v16,v0.t
                  sltiu      sp, t2, -48
                  vmsof.m v1,v22
                  vadc.vxm   v11,v5,a4,v0
                  sub        a7, s1, s0
                  vmulhu.vv  v13,v23,v25,v0.t
                  sra        s5, ra, s8
                  vmulhsu.vx v17,v5,t1
                  vmandnot.mm v29,v0,v23
                  vmacc.vx   v12,t1,v0
                  mul        tp, s3, s7
                  or         a0, ra, s9
                  sra        a7, s0, a5
                  vslideup.vx v4,v5,s9
                  vor.vx     v11,v13,s10
                  vxor.vx    v30,v31,t2
                  vmacc.vx   v1,s5,v30,v0.t
                  vmor.mm    v20,v21,v8
                  srli       s0, s5, 17
                  mul        tp, s9, s6
                  vmandnot.mm v9,v6,v16
                  vadc.vim   v25,v16,0,v0
                  addi       s1, s6, -280
                  vmnand.mm  v8,v6,v9
                  vslideup.vi v20,v0,0,v0.t
                  div        s11, s0, t6
                  vsub.vx    v27,v24,gp,v0.t
                  vand.vx    v18,v24,t4,v0.t
                  vsbc.vvm   v20,v13,v28,v0
                  srli       t4, s0, 10
                  vmadd.vv   v10,v5,v13
                  viota.m v27,v1,v0.t
                  mul        a4, s11, ra
                  vmulhsu.vx v29,v11,a0
                  add        a5, a3, a3
                  div        a5, sp, sp
                  vmxnor.mm  v17,v26,v25
                  vmv.s.x v8,t5
                  vmv.s.x v10,s1
                  vxor.vi    v15,v27,0,v0.t
                  andi       t5, t6, -997
                  vadd.vx    v8,v9,s10
                  slli       s7, sp, 3
                  mulhu      a5, a5, a1
                  add        a4, ra, s1
                  sll        ra, a3, a6
                  lui        a1, 810124
                  vxor.vv    v0,v2,v16
                  vxor.vv    v26,v28,v8,v0.t
                  vmv.v.v v18,v5
                  vid.v v6,v0.t
                  xori       t4, t3, 165
                  sra        s4, a6, a1
                  vmulhsu.vv v2,v6,v15,v0.t
                  vrgather.vx v12,v6,a7,v0.t
                  vsll.vx    v18,v2,a5
                  vslidedown.vi v7,v28,0,v0.t
                  vfirst.m zero,v31
                  vxor.vv    v11,v16,v1,v0.t
                  mulhu      s4, s5, s9
                  add        tp, a4, gp
                  vmsif.m v22,v27
                  vmadd.vx   v2,s3,v9,v0.t
                  vminu.vv   v0,v6,v6
                  srai       t6, t4, 28
                  vfirst.m zero,v3
                  andi       s1, s6, 86
                  vsra.vi    v20,v28,0
                  vsra.vx    v31,v24,a5
                  slti       sp, s1, -31
                  vadc.vim   v4,v13,0,v0
                  vpopc.m zero,v4,v0.t
                  vslideup.vx v5,v23,t2
                  vid.v v11
                  vmnor.mm   v21,v16,v4
                  mulh       a7, t6, sp
                  vmaxu.vx   v27,v11,t3,v0.t
                  remu       s6, a2, s2
                  vand.vx    v6,v29,t0,v0.t
                  srai       s8, s6, 20
                  mul        s7, a3, a4
                  vmv.s.x v7,s8
                  rem        s0, s1, sp
                  vmul.vv    v4,v23,v5
                  and        t6, ra, zero
                  mul        s2, a0, t2
                  vsrl.vi    v7,v24,0
                  vadd.vi    v7,v24,0
                  sltu       gp, t2, s7
                  vmacc.vv   v15,v7,v30,v0.t
                  vslide1down.vx v27,v23,a3,v0.t
                  vmseq.vv   v30,v19,v6,v0.t
                  add        ra, t4, s7
                  viota.m v21,v3,v0.t
                  vmv.s.x v23,a2
                  vslideup.vi v31,v30,0
                  vsrl.vx    v11,v16,a6,v0.t
                  slt        s7, a6, a0
                  vmv.x.s zero,v29
                  vmsgtu.vx  v19,v4,s2,v0.t
                  vmand.mm   v9,v21,v4
                  vrgather.vv v31,v6,v23
                  vmnand.mm  v11,v15,v18
                  xor        a1, s4, t6
                  vmsif.m v11,v1
                  srai       t5, s0, 27
                  mulh       t1, gp, t0
                  vmin.vv    v17,v21,v4
                  vslideup.vi v1,v7,0
                  vmand.mm   v27,v17,v9
                  vmsle.vx   v22,v12,a1
                  div        s7, a3, a0
                  sltiu      t2, a1, -612
                  vrgather.vv v12,v15,v23
                  xori       a0, s7, -375
                  auipc      t6, 354366
                  addi       gp, zero, 394
                  vmacc.vv   v18,v1,v26
                  srli       s1, zero, 21
                  auipc      t0, 1001377
                  vslide1up.vx v23,v11,s5,v0.t
                  vmslt.vv   v23,v4,v2,v0.t
                  sub        s6, t3, a5
                  vmsltu.vx  v26,v21,t1
                  vsub.vv    v29,v20,v28
                  vmxnor.mm  v15,v16,v28
                  vsra.vi    v9,v17,0
                  vmsltu.vx  v13,v23,a5,v0.t
                  vmsif.m v29,v26,v0.t
                  or         a5, t6, s7
                  sll        s7, s4, a6
                  addi       s1, t5, 951
                  vmnand.mm  v9,v9,v5
                  vslideup.vx v10,v15,s1
                  vmand.mm   v4,v26,v30
                  vmxor.mm   v24,v13,v18
                  vmornot.mm v12,v3,v31
                  xori       tp, s3, -698
                  addi       s8, t4, -451
                  vsra.vi    v7,v11,0,v0.t
                  vrgather.vv v7,v28,v4,v0.t
                  vsra.vx    v19,v17,t5,v0.t
                  auipc      t6, 880221
                  vrgather.vv v13,v12,v23,v0.t
                  and        s2, a7, t3
                  vmor.mm    v9,v1,v21
                  rem        s11, a1, t6
                  vand.vv    v31,v0,v15
                  vmsne.vv   v9,v20,v30
                  mulhu      a1, s0, s7
                  srl        ra, t3, s9
                  vmulh.vv   v4,v31,v20,v0.t
                  xor        a1, s0, t1
                  vmulhsu.vv v12,v8,v2
                  lui        a3, 745477
                  vmseq.vx   v17,v5,t2,v0.t
                  vmulhsu.vv v26,v2,v18,v0.t
                  vmv.x.s zero,v30
                  vid.v v3,v0.t
                  vmsif.m v31,v10,v0.t
                  vmulhu.vv  v6,v1,v31,v0.t
                  vmsltu.vx  v12,v31,s8,v0.t
                  lui        s8, 511202
                  slli       s11, t5, 10
                  vmsof.m v3,v22,v0.t
                  remu       t6, tp, a2
                  vmor.mm    v29,v12,v27
                  mulh       a6, gp, t3
                  vmxor.mm   v10,v28,v11
                  vmslt.vv   v7,v24,v23,v0.t
                  vslide1up.vx v4,v0,a4
                  viota.m v30,v6
                  vmsleu.vx  v31,v12,s1
                  lui        s7, 389172
                  vmulhsu.vx v27,v22,a0
                  vid.v v21
                  vmor.mm    v21,v29,v26
                  vsra.vv    v2,v11,v18
                  vmnand.mm  v3,v18,v30
                  vmadd.vx   v18,s0,v4
                  vmv.s.x v27,s0
                  vmxnor.mm  v30,v10,v13
                  andi       s8, a3, -133
                  and        t5, zero, s1
                  div        a4, t2, s5
                  vmin.vx    v25,v17,zero
                  slti       s1, a3, 401
                  xor        zero, s0, zero
                  slti       zero, t6, 850
                  vmsof.m v0,v7
                  andi       s8, s4, -593
                  vmsgt.vi   v14,v22,0,v0.t
                  vmulh.vx   v1,v29,ra,v0.t
                  vid.v v31
                  vmaxu.vv   v6,v28,v12,v0.t
                  vmxor.mm   v18,v5,v3
                  rem        s11, s11, a1
                  vminu.vx   v3,v29,ra,v0.t
                  vid.v v5,v0.t
                  vmulh.vx   v2,v4,ra,v0.t
                  slti       s1, s2, 770
                  or         t5, s4, a1
                  sll        t6, s7, a1
                  vmax.vv    v29,v21,v4
                  vmsne.vi   v28,v8,0,v0.t
                  vmax.vv    v29,v16,v27
                  sub        s1, a4, s2
                  vmsle.vi   v18,v10,0
                  rem        a4, a1, sp
                  vor.vi     v31,v11,0
                  vsub.vv    v5,v20,v13,v0.t
                  vmsle.vv   v2,v21,v11
                  viota.m v12,v2
                  vfirst.m zero,v6
                  vmulhsu.vv v2,v12,v25,v0.t
                  vmnand.mm  v8,v7,v11
                  addi       a3, t0, -965
                  vmulhsu.vx v8,v17,a3,v0.t
                  xori       s5, t6, -314
                  vmv.v.i v30,0
                  vsll.vv    v11,v21,v11,v0.t
                  vand.vx    v4,v24,s1,v0.t
                  vslidedown.vx v28,v2,a3,v0.t
                  or         tp, s7, s5
                  vmsgtu.vi  v20,v14,0
                  vmandnot.mm v11,v20,v21
                  slt        s11, sp, s10
                  mulh       s5, s1, s11
                  divu       t0, t5, s11
                  xori       t4, s9, 312
                  vmxnor.mm  v16,v3,v28
                  vsbc.vvm   v10,v31,v3,v0
                  srl        s8, s8, a7
                  vmseq.vi   v22,v10,0
                  mulh       a6, a2, a4
                  divu       t1, s7, s4
                  addi       a3, a3, 880
                  vmulhsu.vv v25,v25,v25
                  vmaxu.vv   v2,v19,v3,v0.t
                  vmadd.vx   v11,t4,v29
                  rem        t1, tp, t0
                  vid.v v21
                  xor        s6, gp, a4
                  vmsle.vx   v15,v13,s3
                  vslide1down.vx v9,v19,tp
                  vmslt.vx   v8,v11,t2
                  sltiu      s4, s9, -752
                  vsrl.vi    v15,v19,0
                  vmandnot.mm v5,v16,v14
                  mulhu      s2, sp, s7
                  vmsltu.vv  v14,v29,v29
                  vmulh.vx   v19,v4,tp,v0.t
                  sra        a3, a7, a4
                  sltu       zero, t3, s8
                  mulhu      a6, tp, gp
                  vfirst.m zero,v29
                  mul        s6, t5, ra
                  mulhu      a6, gp, t2
                  vmandnot.mm v12,v24,v6
                  vxor.vi    v24,v25,0,v0.t
                  vslide1up.vx v26,v20,s7,v0.t
                  div        a4, t5, tp
                  vfirst.m zero,v28
                  srl        s6, s5, t4
                  vmulhsu.vx v29,v22,t6
                  mul        s5, t0, s1
                  and        t3, s8, t3
                  lui        tp, 835707
                  vsub.vx    v15,v29,s0
                  vmor.mm    v20,v11,v21
                  mul        s8, s2, s0
                  mulh       s2, a5, gp
                  andi       ra, s0, 118
                  vmul.vv    v1,v3,v27
                  vmandnot.mm v4,v20,v16
                  add        zero, t1, tp
                  vpopc.m zero,v1,v0.t
                  and        a4, a3, t6
                  auipc      t2, 241983
                  vpopc.m zero,v6
                  vsrl.vi    v30,v24,0
                  auipc      ra, 637659
                  vmsleu.vx  v6,v7,sp
                  vmsof.m v16,v0
                  vand.vi    v14,v14,0,v0.t
                  vfirst.m zero,v10,v0.t
                  addi       a7, s3, -409
                  vmin.vx    v20,v15,tp
                  vmsgt.vx   v2,v15,s11,v0.t
                  vslide1down.vx v16,v6,s0,v0.t
                  vadc.vvm   v14,v9,v31,v0
                  vminu.vv   v30,v13,v16
                  vand.vv    v25,v1,v7,v0.t
                  vslide1up.vx v18,v7,t3,v0.t
                  vmacc.vv   v17,v2,v1,v0.t
                  vmul.vx    v22,v31,t3,v0.t
                  vid.v v7
                  slli       a7, sp, 5
                  mulh       s8, t2, t0
                  divu       tp, a5, s8
                  vxor.vv    v4,v9,v16,v0.t
                  vmnand.mm  v31,v12,v3
                  mul        s6, s1, a1
                  div        a1, ra, a7
                  vmseq.vv   v22,v30,v16,v0.t
                  vmv.v.v v5,v22
                  mulhu      s2, a6, gp
                  vmsne.vi   v24,v0,0
                  vmsif.m v6,v28
                  vslide1down.vx v31,v18,sp,v0.t
                  vmxnor.mm  v0,v27,v8
                  vmsleu.vi  v9,v22,0,v0.t
                  vmv.x.s zero,v12
                  vfirst.m zero,v16,v0.t
                  vmslt.vx   v13,v14,t0,v0.t
                  vmsif.m v25,v13
                  vmsif.m v19,v13
                  vsbc.vxm   v15,v27,s0,v0
                  xori       s6, sp, -709
                  slli       a3, zero, 23
                  vslide1down.vx v16,v10,s10,v0.t
                  vmv.x.s zero,v18
                  vsrl.vi    v29,v26,0
                  rem        a3, a2, t5
                  vpopc.m zero,v13
                  ori        a4, sp, -390
                  vadc.vxm   v27,v28,s1,v0
                  andi       t1, s7, -923
                  vmsif.m v3,v20
                  remu       a0, a1, a3
                  vmv.x.s zero,v10
                  sra        s5, s2, t6
                  sltiu      a1, t5, -96
                  vmsof.m v14,v21
                  remu       s6, t4, s2
                  slti       a0, s9, -9
                  vmnand.mm  v17,v25,v4
                  ori        t3, t2, -778
                  vslide1down.vx v9,v31,s10
                  vmulhu.vv  v18,v28,v25,v0.t
                  vsll.vi    v0,v19,0
                  vmsbf.m v16,v21
                  sll        gp, s10, a5
                  vrsub.vi   v23,v19,0,v0.t
                  vmsle.vv   v20,v13,v15
                  vmsne.vx   v8,v21,s8
                  vmnor.mm   v11,v27,v22
                  vsub.vx    v27,v6,s7
                  auipc      t3, 367698
                  vmxor.mm   v15,v8,v1
                  vmsle.vv   v5,v26,v8
                  vid.v v29
                  vmax.vx    v30,v24,sp,v0.t
                  vmsof.m v9,v26
                  vsra.vi    v9,v4,0
                  vmseq.vv   v24,v29,v15,v0.t
                  vminu.vv   v29,v29,v13
                  addi       t0, zero, 994
                  vpopc.m zero,v23
                  vmaxu.vx   v24,v22,s7,v0.t
                  vmand.mm   v11,v13,v0
                  vsbc.vvm   v11,v17,v11,v0
                  vmulh.vv   v17,v15,v24
                  srai       ra, t5, 3
                  mul        s8, s2, s1
                  mulh       s8, t4, s1
                  or         zero, t3, a2
                  vmaxu.vx   v7,v10,s9
                  vmnand.mm  v31,v25,v29
                  vmsne.vx   v15,v13,s3,v0.t
                  vsbc.vxm   v4,v15,t3,v0
                  lui        a0, 398627
                  viota.m v25,v12
                  vrgather.vv v14,v22,v4,v0.t
                  srli       t3, s1, 27
                  srli       s4, ra, 21
                  xori       t1, a3, 46
                  vslideup.vi v26,v4,0,v0.t
                  vmaxu.vv   v15,v21,v23
                  xor        tp, t2, zero
                  mulh       a1, a0, a6
                  viota.m v6,v26,v0.t
                  vadc.vvm   v19,v14,v26,v0
                  vpopc.m zero,v16
                  vmnand.mm  v28,v24,v14
                  vmadd.vv   v13,v9,v13
                  vmsif.m v20,v27
                  vmax.vx    v4,v1,tp,v0.t
                  add        s1, a0, a7
                  vmor.mm    v8,v22,v4
                  vmxnor.mm  v28,v6,v1
                  vmul.vv    v3,v27,v6,v0.t
                  vmsif.m v22,v2,v0.t
                  vpopc.m zero,v13,v0.t
                  vfirst.m zero,v16,v0.t
                  vmornot.mm v7,v22,v9
                  vfirst.m zero,v19
                  mulhu      t0, t0, a5
                  divu       s7, s5, s8
                  sltu       s11, a4, a1
                  vmsne.vi   v15,v27,0,v0.t
                  lui        s7, 874514
                  vmsbf.m v13,v10,v0.t
                  add        a0, t4, gp
                  auipc      s4, 363977
                  vmsne.vx   v8,v22,s7
                  vmxor.mm   v31,v29,v18
                  vrsub.vx   v0,v20,t4
                  srli       s6, t1, 24
                  divu       zero, t1, t4
                  sra        zero, a0, t6
                  vmsbf.m v10,v7,v0.t
                  vmsltu.vv  v28,v22,v7
                  lui        a0, 239005
                  mulhu      a4, s3, a1
                  vmand.mm   v3,v23,v5
                  div        s6, zero, a2
                  vid.v v18
                  addi       gp, a3, -1003
                  rem        tp, ra, s6
                  vmand.mm   v19,v16,v31
                  vmor.mm    v10,v6,v18
                  auipc      t5, 996022
                  vmxor.mm   v2,v11,v8
                  vmv.v.v v2,v19
                  ori        s0, s11, -682
                  vmxor.mm   v31,v6,v22
                  vmaxu.vv   v2,v1,v22
                  srl        a3, s1, s3
                  vmsgtu.vx  v15,v14,t6
                  vpopc.m zero,v15
                  vmadd.vv   v20,v18,v18,v0.t
                  vmax.vx    v3,v14,tp
                  addi       a2, a5, 134
                  vmsltu.vv  v12,v21,v4
                  vsll.vi    v12,v1,0
                  vmsbf.m v31,v20,v0.t
                  vmadd.vv   v7,v18,v27,v0.t
                  vmv.s.x v20,s9
                  auipc      sp, 171454
                  slt        a1, s6, s2
                  vrsub.vi   v26,v24,0
                  vadc.vxm   v1,v26,a0,v0
                  vmseq.vx   v1,v4,s8,v0.t
                  vmin.vv    v2,v3,v9
                  vmv.v.x v15,a2
                  vadd.vv    v5,v2,v10,v0.t
                  vmin.vx    v1,v8,s0
                  vrgather.vi v9,v22,0
                  vmsltu.vv  v6,v5,v4
                  srl        tp, tp, s5
                  vmslt.vv   v17,v29,v0
                  srli       tp, zero, 9
                  and        tp, a7, t2
                  div        s6, a0, sp
                  vsra.vx    v19,v22,a4,v0.t
                  vmv.v.x v28,tp
                  srai       a7, zero, 13
                  vmsle.vi   v24,v8,0
                  vmslt.vx   v20,v21,s7,v0.t
                  vsrl.vv    v13,v0,v22
                  vmacc.vv   v1,v26,v29,v0.t
                  vxor.vx    v27,v25,a5,v0.t
                  auipc      gp, 141412
                  vadd.vv    v3,v22,v13
                  vmaxu.vv   v26,v3,v3
                  vmsif.m v15,v8,v0.t
                  vminu.vx   v14,v11,a5
                  remu       gp, t2, tp
                  mulhsu     s4, s6, tp
                  vmxnor.mm  v24,v7,v7
                  vfirst.m zero,v18
                  vmslt.vv   v4,v14,v2
                  mulhu      s6, s2, t5
                  divu       s4, a1, s5
                  vmsle.vv   v10,v24,v23,v0.t
                  vmslt.vv   v17,v27,v12
                  vmor.mm    v10,v11,v16
                  mulhsu     a3, a1, a4
                  lui        a3, 800922
                  vmornot.mm v10,v19,v3
                  vmornot.mm v4,v25,v16
                  vmseq.vi   v11,v5,0
                  vmaxu.vv   v15,v24,v2
                  vxor.vv    v30,v27,v22,v0.t
                  vrgather.vi v21,v28,0,v0.t
                  divu       t5, a2, s10
                  vminu.vx   v19,v6,s6,v0.t
                  vmnand.mm  v13,v3,v0
                  vmand.mm   v8,v30,v3
                  or         a5, sp, s9
                  vmadd.vx   v21,ra,v5
                  vmin.vx    v5,v6,a2
                  vmxor.mm   v21,v7,v3
                  vmslt.vv   v4,v26,v6,v0.t
                  vmul.vx    v27,v0,a2
                  sltiu      tp, t1, -634
                  mulhsu     t5, t3, s10
                  mulh       s6, s5, zero
                  vmsltu.vx  v13,v0,s10,v0.t
                  xor        t5, s6, sp
                  vsub.vv    v20,v25,v3
                  vmaxu.vx   v3,v7,s10,v0.t
                  vrsub.vi   v8,v24,0
                  vmsgt.vx   v27,v18,t4
                  vmsbf.m v27,v17
                  divu       a6, zero, s10
                  vmsle.vx   v20,v26,t0,v0.t
                  vmin.vx    v28,v11,t2,v0.t
                  vminu.vx   v0,v20,t6
                  srli       sp, zero, 0
                  vmor.mm    v4,v11,v25
                  rem        s2, a2, t1
                  slt        a3, a3, a7
                  vsra.vv    v29,v2,v21,v0.t
                  vrgather.vi v16,v31,0,v0.t
                  vmsle.vi   v8,v29,0
                  vmandnot.mm v9,v14,v1
                  vmand.mm   v3,v5,v13
                  vslideup.vx v19,v12,a5
                  vid.v v26,v0.t
                  vsll.vv    v19,v23,v2,v0.t
                  slt        a2, a5, s4
                  slt        a3, a5, a6
                  vsra.vv    v30,v29,v23,v0.t
                  vmulhu.vv  v16,v12,v9,v0.t
                  vsll.vx    v27,v31,s9,v0.t
                  mulhsu     s0, s10, s9
                  vmsltu.vx  v16,v22,a4
                  vmulhsu.vx v12,v25,s9,v0.t
                  vslide1up.vx v18,v20,t0
                  andi       s8, ra, -325
                  vid.v v7
                  vmand.mm   v7,v31,v3
                  vmadd.vx   v15,s5,v17,v0.t
                  vmulhu.vx  v29,v31,a2
                  vrgather.vv v18,v19,v26,v0.t
                  vmsltu.vx  v28,v10,tp,v0.t
                  slli       s1, a2, 18
                  vsrl.vx    v5,v20,sp,v0.t
                  ori        s7, s9, -343
                  vmslt.vv   v12,v5,v28
                  vmaxu.vv   v27,v9,v25
                  andi       t3, a6, 503
                  vminu.vx   v30,v12,a2
                  add        a6, a0, s9
                  vid.v v27
                  vsbc.vxm   v14,v24,t6,v0
                  sll        s8, a3, t3
                  ori        s4, a1, -983
                  vslidedown.vi v16,v29,0,v0.t
                  vmulh.vx   v5,v16,t1,v0.t
                  mul        tp, s10, s2
                  vmseq.vi   v24,v8,0
                  vmsleu.vx  v26,v5,t6
                  vmsleu.vv  v18,v30,v8,v0.t
                  srai       t6, s2, 10
                  vmul.vx    v25,v31,s10,v0.t
                  vslideup.vi v6,v30,0,v0.t
                  vmseq.vv   v18,v7,v29,v0.t
                  vmxnor.mm  v17,v1,v20
                  vrgather.vi v19,v7,0
                  mul        t3, s8, a2
                  sra        gp, s2, a1
                  rem        s7, zero, a7
                  add        ra, t2, a1
                  vmsgtu.vi  v31,v16,0
                  vmslt.vx   v22,v31,t3
                  sra        t4, t6, t0
                  or         zero, s4, s4
                  vmnand.mm  v22,v28,v18
                  vsll.vx    v21,v29,s9,v0.t
                  remu       t4, a7, a1
                  srl        a2, t6, a5
                  remu       t5, gp, ra
                  div        a0, t3, t6
                  addi       t4, s8, -601
                  viota.m v5,v25,v0.t
                  vmulhu.vx  v19,v2,t3
                  vmv.x.s zero,v10
                  vsrl.vv    v21,v18,v19
                  vmornot.mm v23,v5,v31
                  vmornot.mm v17,v21,v8
                  vmsgtu.vi  v3,v29,0
                  xori       a1, s4, 314
                  vmsle.vi   v26,v24,0
                  xor        a7, tp, sp
                  sra        s5, s0, a6
                  vmsgt.vx   v30,v5,gp,v0.t
                  vslidedown.vi v14,v22,0,v0.t
                  srli       s8, s0, 17
                  vmv.s.x v1,s0
                  vmadd.vv   v14,v12,v15,v0.t
                  vmsof.m v26,v21,v0.t
                  sll        s1, a1, a7
                  vmsgtu.vi  v16,v4,0
                  vslidedown.vx v26,v25,a6
                  srai       s5, a0, 21
                  viota.m v12,v11
                  vsub.vx    v4,v3,t3
                  vxor.vi    v2,v17,0,v0.t
                  rem        a0, t5, tp
                  vfirst.m zero,v22,v0.t
                  mul        zero, t0, a1
                  vsll.vv    v22,v23,v18
                  vslideup.vx v7,v21,s4
                  vsrl.vx    v29,v22,s4
                  vmsif.m v23,v6,v0.t
                  vsrl.vx    v28,v5,s5
                  vsra.vx    v29,v13,s3,v0.t
                  vmin.vx    v10,v4,s10,v0.t
                  vmax.vv    v24,v2,v11
                  andi       zero, t5, 897
                  rem        a4, gp, tp
                  slt        a7, s4, s1
                  vmv.x.s zero,v11
                  vmulh.vx   v26,v1,a6,v0.t
                  vmand.mm   v24,v30,v22
                  slli       ra, t0, 19
                  divu       zero, s3, a5
                  rem        s2, gp, s7
                  ori        t6, s3, -588
                  ori        t5, a0, 386
                  viota.m v12,v6
                  vsub.vv    v20,v20,v16
                  vslide1up.vx v7,v27,gp
                  vmseq.vi   v20,v19,0
                  sub        a6, t6, s7
                  vpopc.m zero,v11
                  xori       a2, sp, 102
                  vmax.vx    v29,v1,sp,v0.t
                  xor        s1, tp, a6
                  vmornot.mm v16,v11,v8
                  vadc.vxm   v16,v24,t2,v0
                  sll        a3, t1, s4
                  vslide1up.vx v6,v22,s8,v0.t
                  sll        s6, s7, s5
                  slli       s5, a1, 10
                  divu       zero, s4, s2
                  vmsle.vx   v16,v9,a2
                  vminu.vx   v3,v6,t1,v0.t
                  viota.m v27,v0,v0.t
                  vsbc.vvm   v27,v8,v18,v0
                  xori       s11, s2, -158
                  vslideup.vx v11,v9,t0
                  vid.v v15
                  slti       s2, a4, -248
                  srl        a7, s2, t2
                  addi       s2, t6, -43
                  vpopc.m zero,v10
                  vsrl.vi    v28,v24,0,v0.t
                  xori       tp, t0, 434
                  srli       t4, s8, 12
                  vrsub.vx   v29,v16,s10
                  vslidedown.vx v20,v13,s1,v0.t
                  vsra.vx    v17,v17,sp
                  vrgather.vv v1,v26,v12,v0.t
                  vsrl.vv    v23,v5,v28,v0.t
                  vand.vx    v23,v5,s0
                  vmsif.m v9,v11
                  vmulhu.vx  v14,v23,tp,v0.t
                  vmadd.vv   v2,v15,v25,v0.t
                  slti       t2, s8, 998
                  vadd.vv    v4,v13,v11,v0.t
                  vmadd.vv   v5,v19,v25
                  vor.vi     v8,v18,0
                  vmadd.vx   v6,s6,v19,v0.t
                  sll        t4, ra, t2
                  viota.m v6,v21
                  vsll.vx    v2,v7,s6
                  vmv.x.s zero,v11
                  vmandnot.mm v13,v12,v31
                  xor        a7, a3, a0
                  remu       s7, t4, s7
                  vrgather.vi v16,v26,0
                  vsll.vi    v2,v30,0,v0.t
                  div        t2, s8, ra
                  srl        s1, s4, zero
                  vmulhsu.vx v29,v1,s10
                  vmacc.vv   v13,v28,v12
                  vsbc.vvm   v6,v28,v27,v0
                  vmax.vv    v22,v0,v31,v0.t
                  vmsof.m v7,v27
                  andi       a6, tp, -488
                  vslide1up.vx v4,v18,a5
                  sltiu      a6, a6, 507
                  mul        t4, s6, s9
                  vmslt.vv   v11,v13,v20,v0.t
                  or         s1, gp, ra
                  vadd.vi    v10,v27,0
                  vmsbf.m v6,v12
                  andi       a7, zero, 560
                  sltu       gp, a2, a1
                  sltu       a3, a4, tp
                  vsub.vx    v10,v31,s6,v0.t
                  vslide1down.vx v12,v16,ra,v0.t
                  vmsltu.vv  v12,v24,v9,v0.t
                  vmandnot.mm v0,v9,v23
                  vmv.v.v v12,v20
                  vminu.vv   v4,v22,v22
                  vminu.vv   v28,v23,v3,v0.t
                  vsll.vv    v2,v24,v0,v0.t
                  vmsne.vv   v29,v3,v15,v0.t
                  vmacc.vv   v26,v31,v8,v0.t
                  slt        gp, a1, t2
                  vxor.vv    v25,v21,v7
                  slt        a6, t1, t3
                  sll        t6, t2, s9
                  vmxor.mm   v14,v6,v28
                  vadd.vv    v15,v3,v4
                  vminu.vv   v1,v9,v8
                  vslide1up.vx v0,v28,s0
                  vsbc.vvm   v14,v13,v28,v0
                  mulhsu     sp, gp, s3
                  vmsle.vv   v14,v24,v29,v0.t
                  vmsne.vx   v13,v24,s5,v0.t
                  vmulh.vv   v25,v22,v15,v0.t
                  add        t0, s4, s2
                  vmsif.m v17,v9
                  vid.v v23,v0.t
                  xor        t5, t6, tp
                  vmsleu.vi  v11,v10,0,v0.t
                  vmor.mm    v0,v19,v14
                  vor.vv     v2,v4,v0
                  vsrl.vi    v11,v15,0,v0.t
                  vand.vv    v9,v14,v0
                  vor.vv     v13,v22,v14
                  divu       a1, sp, s1
                  remu       s4, t1, a6
                  vmsltu.vx  v3,v4,t4,v0.t
                  vmxnor.mm  v15,v16,v19
                  mulh       sp, a6, zero
                  vmv.x.s zero,v27
                  vmv.s.x v13,a0
                  lui        t0, 174320
                  mul        gp, s1, s8
                  vmsgtu.vx  v17,v21,a7
                  add        sp, t2, zero
                  vmxor.mm   v18,v23,v20
                  vsra.vx    v31,v20,ra
                  viota.m v4,v6
                  vmsleu.vx  v20,v12,t1,v0.t
                  vsrl.vx    v16,v22,a7,v0.t
                  xori       s7, sp, -713
                  vadd.vi    v4,v12,0,v0.t
                  srl        tp, sp, tp
                  vrsub.vx   v17,v30,s2,v0.t
                  vmulhu.vx  v10,v27,t0
                  vmsne.vv   v23,v14,v22
                  vmsleu.vi  v7,v15,0,v0.t
                  vmsof.m v29,v9
                  vmsgt.vi   v3,v5,0,v0.t
                  vsra.vx    v0,v16,t5
                  divu       a1, t6, s3
                  vmxor.mm   v7,v18,v22
                  or         sp, a7, a5
                  vmadd.vv   v16,v14,v14
                  ori        s0, a5, -904
                  vmand.mm   v18,v23,v11
                  vmv.x.s zero,v0
                  vmulhu.vv  v25,v17,v30
                  vmseq.vi   v27,v25,0
                  slli       a1, a0, 5
                  srl        zero, a6, s3
                  vand.vx    v30,v25,ra,v0.t
                  vand.vi    v0,v5,0
                  vmadd.vv   v3,v20,v23
                  sra        t1, ra, s3
                  vfirst.m zero,v14,v0.t
                  vsrl.vi    v10,v18,0
                  addi       zero, s1, -798
                  mulh       ra, a4, s8
                  sra        a5, s9, t6
                  mulhsu     a4, sp, s11
                  vmv.s.x v20,a3
                  lui        t1, 307030
                  vid.v v27,v0.t
                  vand.vx    v17,v12,s7
                  xor        tp, t3, t2
                  xor        ra, tp, s9
                  sltu       ra, s3, t1
                  vid.v v7
                  vsub.vv    v24,v0,v16,v0.t
                  sub        s6, t5, s10
                  mulhsu     s1, s2, t4
                  add        s8, zero, s8
                  vsub.vx    v23,v1,a1
                  sra        a4, t4, a6
                  srai       zero, a5, 26
                  vslideup.vi v17,v29,0
                  srl        a5, a5, s8
                  vmsgtu.vi  v23,v8,0,v0.t
                  vslide1down.vx v26,v17,s9,v0.t
                  add        s4, a1, a0
                  vmsgtu.vx  v27,v18,a3
                  vmv.v.i v7,0
                  vrsub.vi   v20,v0,0,v0.t
                  sltiu      tp, s9, 612
                  auipc      t3, 883998
                  vmul.vx    v15,v0,s1,v0.t
                  vmor.mm    v13,v15,v4
                  srai       t3, a5, 5
                  vsbc.vvm   v24,v9,v1,v0
                  srl        ra, s3, s6
                  add        s2, s11, a0
                  vminu.vv   v23,v21,v19,v0.t
                  mulhsu     a1, s5, tp
                  vid.v v29,v0.t
                  vmax.vv    v27,v6,v9,v0.t
                  mul        t0, a6, zero
                  mul        s7, s7, s6
                  vmax.vx    v10,v18,ra
                  srai       s0, s0, 11
                  vsrl.vv    v9,v8,v31
                  mulhsu     t2, s1, t3
                  vmadd.vv   v5,v9,v26
                  or         a0, t3, s5
                  vpopc.m zero,v13,v0.t
                  vrgather.vi v26,v16,0,v0.t
                  vmornot.mm v2,v23,v11
                  ori        sp, zero, -49
                  slti       s7, a7, -331
                  vsra.vi    v21,v13,0,v0.t
                  vmnand.mm  v5,v22,v6
                  sltiu      t5, t2, 148
                  div        s0, a5, t6
                  vmsgtu.vx  v17,v3,t3,v0.t
                  vmsof.m v9,v28
                  vmul.vv    v23,v31,v27,v0.t
                  sltu       s7, t4, s10
                  vslidedown.vx v13,v6,a4
                  sub        a1, tp, s10
                  vmv.s.x v31,tp
                  vminu.vx   v27,v27,t6,v0.t
                  vmxor.mm   v7,v19,v26
                  vid.v v25,v0.t
                  andi       s4, s6, 62
                  vmsgt.vi   v4,v8,0
                  vsrl.vv    v10,v8,v11,v0.t
                  mul        s1, s1, s3
                  vmnor.mm   v12,v25,v5
                  mulhu      t3, a5, s5
                  and        a0, s1, tp
                  vmsbf.m v17,v14
                  andi       a7, a3, -652
                  vmnand.mm  v1,v16,v14
                  remu       a5, t5, a1
                  and        tp, s2, t5
                  vmsltu.vv  v29,v10,v30,v0.t
                  vsll.vi    v13,v4,0,v0.t
                  srai       s6, s6, 8
                  vmax.vv    v7,v9,v24
                  vsll.vv    v2,v9,v16
                  vmaxu.vv   v10,v6,v21,v0.t
                  srai       t4, s0, 0
                  vmornot.mm v22,v31,v15
                  vsra.vv    v30,v2,v14,v0.t
                  vslide1down.vx v15,v2,s11
                  vid.v v8,v0.t
                  viota.m v17,v26
                  auipc      t5, 858874
                  vmnor.mm   v18,v11,v8
                  vadc.vxm   v15,v8,a0,v0
                  vmsbf.m v9,v1,v0.t
                  vslide1down.vx v22,v1,s0,v0.t
                  vmaxu.vv   v16,v18,v8
                  vadd.vx    v2,v9,t5
                  vmxor.mm   v5,v28,v18
                  vfirst.m zero,v1
                  slti       t1, a3, -963
                  sra        t5, zero, s9
                  vsbc.vvm   v20,v0,v20,v0
                  vmsgtu.vi  v28,v13,0,v0.t
                  remu       s7, t5, a4
                  sub        tp, a0, a2
                  vfirst.m zero,v18,v0.t
                  divu       a4, t6, s1
                  vsll.vi    v24,v20,0
                  lui        s5, 688840
                  slli       a5, s7, 0
                  srli       a6, a0, 20
                  vmornot.mm v2,v14,v4
                  vmsleu.vi  v3,v23,0
                  vmand.mm   v24,v26,v10
                  mulhsu     a3, sp, a5
                  vsll.vv    v4,v14,v17
                  vmslt.vv   v25,v6,v10
                  or         t6, s11, s11
                  vmulh.vx   v17,v30,t6
                  vmacc.vv   v25,v22,v28
                  srai       s7, a3, 25
                  vadd.vx    v30,v23,s9
                  mulh       t5, t5, tp
                  vmulh.vx   v14,v29,s8
                  divu       t4, s2, tp
                  vmnor.mm   v25,v17,v20
                  vmax.vx    v12,v22,a4
                  remu       sp, s0, a6
                  vsrl.vx    v6,v23,s3
                  vmulhu.vx  v28,v23,zero,v0.t
                  remu       s11, a7, t0
                  vrgather.vi v17,v19,0,v0.t
                  vslide1down.vx v17,v23,a5
                  vmsle.vi   v4,v19,0,v0.t
                  divu       s11, t2, t0
                  vmulhu.vv  v5,v27,v1
                  mulhsu     a3, a5, a7
                  vmulhsu.vx v16,v10,zero,v0.t
                  vpopc.m zero,v29
                  vadc.vim   v31,v9,0,v0
                  vslidedown.vx v24,v9,s3
                  xori       t6, t5, 341
                  lui        s8, 61230
                  vmsgt.vi   v23,v30,0
                  vmv.x.s zero,v24
                  vid.v v16
                  vmsif.m v30,v16,v0.t
                  vmnand.mm  v28,v12,v30
                  sll        a7, s10, a3
                  mulh       s7, s3, a4
                  vmnand.mm  v19,v23,v23
                  sltu       zero, s1, s9
                  or         a7, t4, ra
                  vmsgtu.vi  v2,v26,0
                  vadc.vxm   v17,v11,a0,v0
                  vmand.mm   v27,v13,v25
                  vmulhsu.vx v28,v19,gp
                  slli       s5, ra, 23
                  vmand.mm   v17,v24,v29
                  vmsbf.m v1,v12
                  vsbc.vxm   v20,v1,a3,v0
                  vmandnot.mm v7,v25,v23
                  and        t6, a3, s10
                  vslidedown.vx v26,v6,a6,v0.t
                  vmv.x.s zero,v0
                  vmslt.vv   v8,v30,v25
                  addi       sp, t5, -113
                  vmax.vv    v18,v12,v10
                  vmxnor.mm  v16,v12,v26
                  vmsltu.vx  v13,v14,s3
                  xor        t4, s9, s5
                  vadc.vvm   v5,v0,v7,v0
                  xor        s7, a6, s10
                  add        zero, a0, s5
                  viota.m v7,v12,v0.t
                  vmacc.vx   v19,a4,v16
                  vmsof.m v21,v12,v0.t
                  vadc.vim   v22,v27,0,v0
                  vslide1up.vx v14,v20,s2
                  vmaxu.vv   v11,v11,v20,v0.t
                  slti       s4, s1, -599
                  srli       a5, ra, 17
                  divu       a5, s9, s5
                  ori        t6, s10, 305
                  or         s1, gp, t0
                  vadd.vx    v30,v3,tp,v0.t
                  vmacc.vv   v7,v4,v16
                  vmslt.vv   v17,v27,v25
                  vmor.mm    v13,v19,v2
                  vmacc.vv   v9,v4,v26,v0.t
                  ori        t4, sp, -520
                  vsbc.vvm   v23,v28,v5,v0
                  vmsle.vv   v30,v29,v27
                  vsrl.vv    v6,v9,v20,v0.t
                  remu       zero, a2, zero
                  vrsub.vx   v8,v30,a0,v0.t
                  mulhsu     s7, sp, a6
                  vxor.vx    v18,v26,t5,v0.t
                  viota.m v24,v22
                  vxor.vx    v21,v11,sp,v0.t
                  vmnand.mm  v8,v16,v2
                  srai       t1, t4, 23
                  vmv.x.s zero,v5
                  vmxnor.mm  v10,v4,v31
                  xori       s8, t4, -1006
                  xori       a7, s11, 356
                  rem        t0, s5, sp
                  vmsleu.vv  v5,v17,v31,v0.t
                  viota.m v3,v2
                  slti       a6, a4, 714
                  vmadd.vx   v0,a3,v5
                  vmsgtu.vi  v16,v2,0
                  andi       s1, s2, 970
                  vmandnot.mm v9,v19,v21
                  vid.v v10,v0.t
                  addi       a5, a0, 890
                  vmsle.vx   v22,v9,a2,v0.t
                  mul        tp, s7, t5
                  srl        t5, zero, s0
                  vmax.vx    v19,v14,zero,v0.t
                  slt        s1, sp, ra
                  vmxnor.mm  v1,v2,v26
                  vadd.vv    v26,v7,v26,v0.t
                  vmseq.vx   v14,v25,sp,v0.t
                  vmsne.vi   v8,v6,0
                  vfirst.m zero,v29,v0.t
                  vmxor.mm   v20,v3,v20
                  vxor.vi    v18,v16,0,v0.t
                  vmv.s.x v17,gp
                  vmsof.m v1,v11,v0.t
                  sub        gp, s9, a6
                  add        s5, a5, a7
                  vmsbf.m v22,v8
                  div        a0, a3, tp
                  vmsgt.vi   v30,v4,0,v0.t
                  vmnor.mm   v5,v5,v9
                  vor.vx     v1,v27,t6
                  vmadd.vx   v5,t6,v11,v0.t
                  vor.vi     v0,v27,0
                  vmax.vv    v14,v17,v1,v0.t
                  vsrl.vx    v18,v12,s5
                  ori        s4, a7, -379
                  ori        t5, s2, 544
                  vmsif.m v24,v8
                  vmin.vx    v27,v31,t5,v0.t
                  rem        t6, sp, sp
                  vslideup.vx v31,v22,t3
                  vmin.vv    v5,v15,v28,v0.t
                  vmsgtu.vx  v18,v0,s11,v0.t
                  vmadd.vx   v3,sp,v1
                  divu       s5, gp, a6
                  vmv.x.s zero,v12
                  vadd.vx    v3,v23,zero
                  vfirst.m zero,v30
                  vmin.vv    v30,v25,v26
                  vid.v v3,v0.t
                  sll        ra, zero, s2
                  vsrl.vv    v15,v8,v9
                  slt        a5, t1, a7
                  and        s7, t6, a0
                  vminu.vx   v7,v26,s3
                  remu       t1, a5, s1
                  remu       a6, s1, a3
                  lui        s5, 970160
                  vmadd.vv   v16,v11,v10
                  vmacc.vv   v18,v19,v26
                  vmsbf.m v31,v18,v0.t
                  vmsgt.vx   v19,v31,a3
                  div        t6, s7, t3
                  divu       sp, t1, a6
                  vmulhsu.vx v7,v29,t6,v0.t
                  mulh       ra, s8, t2
                  vslideup.vi v25,v19,0,v0.t
                  vmnor.mm   v28,v7,v7
                  sltu       s4, t5, ra
                  vmsof.m v26,v8,v0.t
                  sub        s1, t4, gp
                  vmadd.vx   v2,t2,v21
                  vmsne.vx   v8,v28,s11
                  vmax.vv    v25,v14,v8
                  vsub.vx    v12,v17,zero,v0.t
                  sll        s5, t5, s3
                  div        tp, a7, a0
                  vslide1up.vx v10,v23,s5
                  vslideup.vx v15,v8,ra,v0.t
                  vxor.vi    v21,v22,0
                  vmslt.vv   v27,v1,v26
                  vmulhsu.vv v23,v8,v19,v0.t
                  vslide1down.vx v10,v21,s0
                  slli       t2, a7, 16
                  vmacc.vv   v30,v7,v30,v0.t
                  vmsgtu.vi  v21,v29,0
                  sltiu      t5, s7, 407
                  vand.vi    v5,v16,0
                  addi       s8, t5, -770
                  viota.m v15,v8
                  vfirst.m zero,v25,v0.t
                  vmsleu.vv  v19,v25,v9
                  vid.v v3
                  vsll.vi    v29,v16,0,v0.t
                  vmulhsu.vx v4,v29,a3,v0.t
                  vmadd.vv   v1,v4,v4,v0.t
                  div        s6, t3, a7
                  mulhu      s11, t0, a2
                  remu       s6, s7, a0
                  divu       a1, s7, t4
                  slti       a5, a3, -960
                  srli       t4, sp, 31
                  vmnor.mm   v2,v9,v13
                  vmv.s.x v20,t3
                  vmxnor.mm  v24,v8,v31
                  vpopc.m zero,v5,v0.t
                  vmulh.vx   v10,v16,zero
                  vadc.vvm   v26,v13,v30,v0
                  vsbc.vvm   v20,v6,v20,v0
                  vmsne.vi   v8,v14,0
                  vpopc.m zero,v19
                  vmul.vx    v3,v11,a6,v0.t
                  vmnand.mm  v23,v14,v23
                  and        t5, a1, s6
                  vmseq.vi   v1,v29,0
                  vslide1down.vx v17,v13,t4,v0.t
                  srli       sp, a2, 9
                  vor.vv     v26,v14,v8,v0.t
                  vmseq.vv   v30,v20,v3
                  sub        s2, s0, t4
                  add        a2, s9, tp
                  xor        s5, s7, a4
                  vmaxu.vx   v6,v0,zero,v0.t
                  sltiu      s4, s5, -25
                  vor.vi     v25,v28,0,v0.t
                  vsbc.vxm   v19,v0,t4,v0
                  vmseq.vx   v8,v16,gp
                  vmornot.mm v22,v16,v0
                  vmnand.mm  v28,v9,v19
                  addi       zero, ra, 728
                  srai       t3, s1, 9
                  vmulhu.vv  v11,v21,v30
                  sltu       s6, a5, a5
                  vmacc.vx   v14,s10,v17,v0.t
                  sub        s0, s4, s1
                  vmand.mm   v15,v1,v23
                  vmxor.mm   v24,v13,v25
                  vmacc.vx   v24,s0,v0,v0.t
                  vmulhsu.vv v3,v22,v10,v0.t
                  auipc      s0, 661600
                  xori       s1, s3, 262
                  mulh       s1, a4, a4
                  vxor.vx    v20,v18,s6
                  vadc.vxm   v14,v16,s2,v0
                  vand.vv    v20,v0,v1
                  vmulhu.vx  v12,v19,s11
                  vand.vi    v26,v22,0,v0.t
                  addi       s4, s4, 480
                  vmsgt.vi   v14,v28,0
                  mulh       t1, a2, a3
                  sra        a6, a1, s11
                  vmaxu.vx   v9,v15,s0
                  mul        t6, s6, gp
                  vxor.vv    v16,v18,v16,v0.t
                  mulh       s6, a2, t5
                  add        t5, a5, s4
                  sltiu      t1, a7, 183
                  vmsgtu.vx  v15,v8,t3,v0.t
                  vmax.vx    v6,v5,a4
                  vpopc.m zero,v31,v0.t
                  mulhu      s11, a0, zero
                  vmsgtu.vi  v3,v17,0,v0.t
                  ori        t4, t3, -300
                  vmv.v.v v18,v16
                  sltiu      t3, sp, -373
                  vslidedown.vi v28,v7,0,v0.t
                  divu       t4, t5, a1
                  vmand.mm   v26,v31,v10
                  vmsne.vi   v1,v18,0
                  vslidedown.vx v6,v27,zero,v0.t
                  vfirst.m zero,v14,v0.t
                  vand.vx    v18,v23,a2
                  vslidedown.vi v7,v5,0
                  vmor.mm    v15,v12,v26
                  vmand.mm   v3,v22,v21
                  vmandnot.mm v24,v6,v4
                  xori       sp, t0, 232
                  sra        a7, t0, sp
                  vmsif.m v3,v6
                  vmslt.vv   v31,v20,v2
                  vmul.vx    v9,v30,s2,v0.t
                  vsub.vv    v20,v20,v1
                  slli       s5, s10, 9
                  vmsle.vi   v3,v26,0,v0.t
                  vmslt.vv   v13,v14,v15,v0.t
                  vmsof.m v9,v20
                  sltiu      s8, s0, 352
                  vminu.vv   v23,v13,v19
                  or         t2, t6, t0
                  vand.vv    v0,v21,v24
                  xor        t5, s8, s7
                  divu       t6, tp, tp
                  addi       a6, a6, -858
                  vrgather.vv v26,v15,v11
                  mulh       t6, s3, a6
                  srai       a7, a5, 31
                  vmand.mm   v6,v5,v20
                  vadd.vv    v31,v17,v17,v0.t
                  slli       a1, s4, 17
                  mulhu      a2, t0, a4
                  srai       t3, gp, 23
                  vmslt.vx   v19,v23,ra,v0.t
                  slti       s2, a1, 637
                  lui        a1, 93318
                  vand.vx    v1,v9,t1,v0.t
                  vmxor.mm   v16,v27,v14
                  vmulhu.vx  v2,v8,zero
                  vminu.vv   v7,v4,v30
                  vmsgtu.vx  v2,v21,a5
                  vmsof.m v31,v22
                  vmul.vv    v17,v14,v8
                  sub        a0, s2, s3
                  vmadd.vx   v16,a6,v9
                  vslide1up.vx v20,v12,zero
                  xor        s2, t4, t6
                  andi       gp, a3, -521
                  remu       t3, t1, t5
                  vrgather.vi v19,v8,0
                  slli       s4, s6, 11
                  vslide1up.vx v5,v25,zero
                  vmacc.vv   v6,v11,v18
                  vmul.vx    v4,v20,s11,v0.t
                  vmul.vx    v30,v8,s3
                  vmsbf.m v6,v8
                  vadd.vi    v11,v29,0
                  ori        t2, s8, -586
                  mul        t3, s6, t4
                  vrsub.vx   v1,v1,s2,v0.t
                  srl        s7, s6, a4
                  vsra.vx    v16,v11,t4
                  vsbc.vxm   v6,v25,a1,v0
                  vadc.vxm   v18,v27,t1,v0
                  vsub.vv    v0,v24,v19
                  sub        s6, s4, s6
                  vmslt.vx   v10,v9,t3,v0.t
                  mulhsu     t2, s3, s11
                  vmornot.mm v23,v20,v21
                  vmadd.vx   v20,a1,v13
                  vmsltu.vv  v24,v25,v13,v0.t
                  vslidedown.vx v7,v8,s2
                  vmand.mm   v31,v5,v17
                  vmor.mm    v6,v5,v23
                  xor        s7, t4, s9
                  andi       t0, a0, -564
                  vmin.vv    v11,v11,v15
                  vpopc.m zero,v18
                  vsub.vx    v19,v12,s7,v0.t
                  vmsbf.m v3,v16
                  and        s5, a6, a5
                  and        ra, a6, s11
                  vmv.s.x v25,t0
                  vslide1up.vx v24,v13,s7
                  vsrl.vv    v26,v31,v12
                  sll        s4, a3, s3
                  ori        a5, s7, -526
                  vsbc.vvm   v24,v0,v17,v0
                  mul        s5, a5, sp
                  mulhsu     s7, t4, a2
                  vmaxu.vv   v3,v19,v6
                  vslideup.vx v8,v1,s11,v0.t
                  ori        ra, s11, -460
                  vxor.vi    v3,v4,0,v0.t
                  vmand.mm   v8,v21,v21
                  andi       t4, s2, 844
                  vor.vv     v19,v12,v3,v0.t
                  sll        a1, s4, sp
                  vmor.mm    v9,v19,v20
                  vslide1down.vx v3,v24,s11
                  vmsif.m v19,v8,v0.t
                  vadd.vx    v5,v21,s1
                  vmulhu.vv  v24,v11,v13,v0.t
                  mul        a3, a6, s0
                  vmulh.vv   v0,v7,v8
                  vpopc.m zero,v1
                  vslideup.vi v23,v25,0
                  vand.vx    v10,v22,a0
                  vmadd.vv   v23,v8,v6
                  or         a7, a6, a0
                  vslideup.vx v12,v17,tp
                  slli       gp, t0, 29
                  srli       t4, s4, 5
                  or         a5, ra, t1
                  vslide1up.vx v27,v23,t6
                  vsra.vi    v25,v25,0,v0.t
                  srli       s6, t5, 22
                  vmv.v.x v30,t6
                  vmslt.vv   v22,v3,v6
                  vmaxu.vv   v24,v25,v30,v0.t
                  slti       zero, s5, 809
                  vmv.x.s zero,v8
                  vsbc.vvm   v18,v26,v30,v0
                  vsll.vv    v11,v11,v28
                  vmornot.mm v19,v17,v29
                  vmacc.vx   v29,s9,v28
                  vpopc.m zero,v2
                  sltu       s6, s0, t6
                  xor        t3, t2, s2
                  vmulhu.vv  v9,v24,v30,v0.t
                  slti       a0, a7, 907
                  vor.vv     v6,v16,v14,v0.t
                  vfirst.m zero,v18,v0.t
                  srl        a5, tp, t1
                  addi       t2, a3, 101
                  ori        t2, a7, 97
                  mulh       sp, t1, s4
                  vmaxu.vx   v9,v10,a6,v0.t
                  vmsbf.m v17,v4,v0.t
                  vadd.vv    v29,v31,v23
                  sltu       s4, t5, a4
                  div        a5, a4, s1
                  addi       zero, t2, -137
                  vmsgtu.vx  v14,v15,s5
                  srai       s11, s1, 1
                  vid.v v22
                  vminu.vx   v3,v19,gp,v0.t
                  sltiu      zero, t2, -807
                  add        t5, s11, t3
                  lui        s0, 943795
                  vsrl.vv    v9,v31,v29,v0.t
                  vmv.v.v v5,v29
                  xor        a1, zero, a5
                  vmsne.vv   v15,v1,v29,v0.t
                  vmsif.m v4,v13,v0.t
                  vmsleu.vi  v20,v13,0,v0.t
                  vslide1down.vx v3,v17,a1
                  vmslt.vv   v8,v24,v10
                  vmadd.vv   v10,v3,v10,v0.t
                  andi       a7, a6, -439
                  auipc      t4, 521069
                  vmandnot.mm v13,v29,v22
                  vrgather.vx v31,v17,t0,v0.t
                  vmsbf.m v2,v27,v0.t
                  vid.v v22,v0.t
                  vrsub.vx   v8,v19,t3
                  viota.m v24,v12
                  sltiu      t2, a4, -757
                  slli       t3, a5, 11
                  sltu       t3, sp, s6
                  vmin.vx    v1,v2,a3
                  mulh       t1, s5, s4
                  viota.m v19,v12
                  mul        t0, s8, a3
                  addi       s11, t5, 772
                  vmacc.vx   v19,a3,v26,v0.t
                  vfirst.m zero,v15,v0.t
                  xor        zero, a6, s0
                  vmsleu.vv  v19,v13,v24
                  vid.v v21,v0.t
                  vpopc.m zero,v16,v0.t
                  vmacc.vx   v22,sp,v4,v0.t
                  vsub.vx    v18,v4,s8
                  vsub.vx    v24,v20,a6
                  vmsltu.vv  v29,v18,v26,v0.t
                  vsub.vx    v10,v26,t5,v0.t
                  mul        s4, t4, a1
                  vslideup.vi v30,v28,0
                  vid.v v6
                  vmax.vx    v21,v24,a0,v0.t
                  vmxnor.mm  v15,v30,v24
                  lui        t3, 539965
                  vmsleu.vi  v10,v5,0
                  vmseq.vi   v11,v1,0,v0.t
                  vmsne.vi   v1,v5,0,v0.t
                  vslidedown.vi v13,v30,0,v0.t
                  srli       a1, sp, 19
                  srl        s4, t2, s4
                  vor.vx     v23,v30,gp
                  vmax.vv    v20,v12,v8
                  vmax.vv    v11,v30,v23
                  div        t4, t5, ra
                  and        s2, zero, s11
                  vmxor.mm   v29,v31,v26
                  remu       s0, s8, s4
                  vrgather.vx v13,v21,gp
                  vslide1down.vx v16,v22,s4
                  vslidedown.vi v23,v1,0,v0.t
                  vmulhsu.vv v31,v31,v3,v0.t
                  vmseq.vv   v21,v9,v11,v0.t
                  vmsle.vv   v7,v24,v2,v0.t
                  vslidedown.vx v18,v15,ra,v0.t
                  srli       t5, s3, 7
                  vor.vi     v13,v16,0,v0.t
                  vmsbf.m v16,v31,v0.t
                  vmxor.mm   v30,v10,v14
                  vsrl.vx    v23,v26,s3,v0.t
                  lui        sp, 874468
                  vmacc.vv   v12,v0,v25,v0.t
                  vmnor.mm   v26,v28,v2
                  vmulhsu.vv v7,v6,v23,v0.t
                  vid.v v31
                  vmand.mm   v9,v30,v27
                  add        s11, s6, s11
                  vmsleu.vv  v1,v25,v18
                  vmsle.vv   v3,v13,v15,v0.t
                  mulhu      t5, gp, s3
                  auipc      t6, 130609
                  vslidedown.vi v23,v13,0,v0.t
                  andi       a7, s0, 512
                  vmsgtu.vi  v14,v15,0,v0.t
                  vmsltu.vx  v21,v28,sp
                  vadc.vvm   v18,v8,v9,v0
                  vmv.v.i v12,0
                  vslidedown.vx v25,v7,s8,v0.t
                  vmv.s.x v12,s8
                  vmsgtu.vx  v31,v16,a6,v0.t
                  vsrl.vv    v0,v19,v4
                  vrgather.vx v2,v23,gp,v0.t
                  sra        s11, t6, t0
                  sub        a7, t0, s11
                  sll        a2, a4, a0
                  vmul.vv    v13,v21,v19
                  andi       a4, s7, -933
                  vmsgt.vx   v3,v10,t3
                  vmsgtu.vi  v8,v17,0,v0.t
                  vmseq.vv   v25,v7,v5
                  vmv.s.x v24,a1
                  vmv.v.i v5,0
                  vxor.vi    v23,v24,0,v0.t
                  vmornot.mm v8,v3,v18
                  or         s6, ra, a5
                  xor        s7, t4, s4
                  vmv.s.x v2,s9
                  vmxor.mm   v11,v21,v2
                  vmsif.m v20,v17,v0.t
                  vmslt.vx   v0,v2,zero
                  srai       a6, a4, 30
                  vsrl.vi    v1,v27,0,v0.t
                  vmsleu.vi  v0,v27,0
                  vmacc.vx   v6,a6,v24,v0.t
                  vmor.mm    v18,v1,v17
                  vmsle.vv   v17,v12,v15
                  vmandnot.mm v6,v13,v9
                  vrgather.vi v3,v25,0,v0.t
                  remu       t1, gp, a5
                  vmsleu.vx  v31,v28,s7
                  vor.vx     v26,v25,s11,v0.t
                  vmsbf.m v24,v26,v0.t
                  vsbc.vvm   v12,v8,v17,v0
                  vor.vv     v31,v12,v15
                  vmnor.mm   v22,v26,v8
                  vmadd.vv   v22,v18,v26,v0.t
                  xor        a5, a0, s7
                  vadc.vim   v12,v11,0,v0
                  sub        t4, t1, a6
                  vmsleu.vx  v3,v14,gp,v0.t
                  vmslt.vv   v22,v2,v3,v0.t
                  vmand.mm   v12,v21,v5
                  vslide1up.vx v7,v12,s7,v0.t
                  vand.vi    v10,v26,0
                  sll        gp, s3, a4
                  srl        a1, s6, s6
                  vsrl.vi    v27,v8,0
                  vrsub.vx   v1,v5,a3,v0.t
                  vid.v v2,v0.t
                  vid.v v16
                  sltu       t3, a2, tp
                  viota.m v18,v23
                  vminu.vv   v22,v28,v14,v0.t
                  vmin.vx    v19,v14,t1,v0.t
                  vmsof.m v21,v10,v0.t
                  vrsub.vx   v0,v0,s11
                  andi       s8, a1, 633
                  mulh       a4, a1, s6
                  vmsleu.vi  v2,v30,0,v0.t
                  div        t1, s6, t4
                  vmsleu.vv  v15,v9,v23,v0.t
                  vmnor.mm   v17,v30,v21
                  vsrl.vi    v3,v13,0,v0.t
                  vmsif.m v21,v5
                  xor        a5, s2, s8
                  vmsbf.m v5,v9
                  slli       t3, gp, 29
                  vmulhsu.vx v18,v25,zero
                  vmv.x.s zero,v2
                  xor        t4, s10, a6
                  vmacc.vv   v28,v12,v2
                  andi       s1, t1, 223
                  slt        t3, a6, s5
                  or         a6, zero, zero
                  vmsgt.vx   v9,v6,s3
                  vmadd.vx   v0,t1,v11
                  vsra.vx    v24,v13,s1,v0.t
                  vmand.mm   v12,v0,v16
                  vsra.vi    v27,v2,0,v0.t
                  vand.vi    v6,v8,0,v0.t
                  vminu.vv   v15,v10,v0,v0.t
                  vmsof.m v24,v29
                  vmseq.vx   v24,v10,s9,v0.t
                  vsra.vi    v24,v23,0,v0.t
                  vmsgt.vi   v24,v13,0
                  ori        t5, s8, 647
                  vslidedown.vi v20,v31,0,v0.t
                  slli       gp, t1, 16
                  rem        a1, t2, a0
                  vmand.mm   v23,v23,v29
                  vmand.mm   v30,v29,v16
                  vmxnor.mm  v26,v30,v1
                  vsrl.vx    v19,v5,gp
                  vmulhu.vx  v2,v10,t0
                  vmv.v.i v22,0
                  vmulhsu.vx v17,v13,ra,v0.t
                  srl        a0, s8, t5
                  vmsof.m v30,v0,v0.t
                  vmxnor.mm  v5,v1,v21
                  vmulhu.vv  v6,v1,v5
                  srai       zero, a4, 25
                  vmsgtu.vi  v13,v5,0
                  sra        s4, s8, zero
                  sub        s8, s9, a6
                  vmsif.m v21,v14,v0.t
                  and        zero, t3, t0
                  vmsgtu.vx  v7,v16,zero,v0.t
                  xori       s7, s10, -578
                  vmandnot.mm v19,v2,v19
                  vsrl.vv    v25,v11,v26
                  vmsgtu.vi  v4,v9,0
                  vslide1down.vx v16,v23,t2
                  rem        s7, tp, a2
                  vmaxu.vv   v22,v28,v18,v0.t
                  vmv.v.v v0,v31
                  vmsleu.vi  v31,v26,0
                  vsra.vx    v3,v24,a3
                  vmornot.mm v13,v6,v3
                  vfirst.m zero,v20,v0.t
                  srl        s0, a1, a7
                  vslide1up.vx v24,v23,a1,v0.t
                  vminu.vx   v7,v2,zero,v0.t
                  vmsleu.vv  v29,v5,v16
                  vslide1down.vx v26,v7,s7
                  sltiu      t5, s6, 645
                  vmadd.vx   v24,s11,v19
                  mulh       t4, a2, s5
                  vrgather.vi v26,v27,0
                  vand.vv    v19,v19,v4
                  srl        zero, ra, t6
                  vmsof.m v6,v17
                  rem        s5, s9, a5
                  vmsltu.vv  v10,v29,v15
                  vadc.vim   v6,v19,0,v0
                  vsra.vx    v4,v6,s8
                  divu       a3, t2, a0
                  sub        s6, s6, s3
                  vmv.v.x v14,s3
                  vpopc.m zero,v20,v0.t
                  vrsub.vx   v10,v17,zero
                  vsbc.vxm   v8,v14,t0,v0
                  vmulhu.vx  v7,v20,gp,v0.t
                  vmor.mm    v26,v27,v19
                  vmsof.m v1,v12,v0.t
                  vslide1up.vx v7,v30,s3,v0.t
                  vmul.vv    v3,v18,v13
                  vadc.vvm   v22,v27,v24,v0
                  div        t5, s5, s2
                  vmv.x.s zero,v19
                  vmxnor.mm  v16,v14,v11
                  vmv.s.x v24,a3
                  srai       s7, a7, 20
                  slli       ra, a7, 1
                  mulhsu     t6, a3, t1
                  divu       a3, t5, a2
                  vmaxu.vx   v19,v8,s8,v0.t
                  vsbc.vxm   v20,v21,zero,v0
                  vmadd.vv   v10,v5,v25,v0.t
                  ori        a4, a0, 76
                  vmulhsu.vx v25,v0,t0
                  xor        t4, t2, s1
                  vmv.x.s zero,v14
                  vmulhu.vv  v11,v5,v8,v0.t
                  vslideup.vi v10,v5,0,v0.t
                  vmv.v.x v25,a1
                  vmnor.mm   v18,v6,v21
                  vmsif.m v28,v14
                  vmxor.mm   v20,v14,v31
                  vmin.vx    v26,v19,a3,v0.t
                  remu       t6, s11, t5
                  remu       a5, s3, t2
                  vmsle.vi   v27,v30,0,v0.t
                  andi       a7, t3, -127
                  vmv.x.s zero,v0
                  vmsgtu.vi  v19,v4,0,v0.t
                  vsra.vi    v3,v23,0,v0.t
                  vmv.x.s zero,v4
                  vsra.vv    v2,v22,v21
                  vxor.vv    v11,v26,v21
                  vmv.s.x v12,tp
                  vmv.v.v v9,v1
                  slti       t4, s7, -401
                  vxor.vx    v1,v26,s6
                  vmax.vx    v3,v30,s1,v0.t
                  srl        s0, a0, s5
                  ori        s4, s1, -437
                  vminu.vv   v10,v30,v29
                  lui        a2, 828207
                  slti       a7, a4, 942
                  vmv.v.x v16,a2
                  vmsltu.vv  v12,v27,v23,v0.t
                  vsll.vi    v17,v31,0,v0.t
                  srai       sp, a6, 1
                  vsll.vv    v12,v18,v2
                  vmulhsu.vv v20,v11,v9,v0.t
                  vmseq.vv   v21,v27,v1
                  vmulhsu.vv v31,v29,v2
                  vminu.vx   v26,v11,s8,v0.t
                  vrsub.vi   v24,v21,0,v0.t
                  vmulhu.vv  v23,v14,v7
                  viota.m v0,v2
                  srl        s8, t4, t2
                  srl        gp, t4, gp
                  vminu.vx   v24,v19,tp,v0.t
                  vmsne.vx   v13,v17,s11,v0.t
                  vrsub.vi   v16,v9,0
                  vmseq.vx   v8,v27,a3,v0.t
                  vmacc.vx   v3,s1,v31,v0.t
                  sltiu      s2, s7, -188
                  mul        t5, gp, ra
                  vsrl.vx    v8,v8,ra
                  vsbc.vvm   v27,v5,v10,v0
                  vslide1up.vx v12,v0,zero
                  xori       s5, zero, -520
                  vmseq.vi   v21,v27,0
                  vsra.vi    v30,v2,0,v0.t
                  vmax.vx    v11,v6,t5
                  vmsltu.vx  v16,v8,s8
                  vadd.vx    v23,v24,t6,v0.t
                  slli       t3, t4, 20
                  slli       s5, t5, 12
                  rem        s5, t2, s11
                  vslide1down.vx v29,v8,t4
                  vmsltu.vv  v10,v27,v27,v0.t
                  vadd.vi    v16,v26,0,v0.t
                  vmnor.mm   v12,v13,v30
                  vmsleu.vi  v10,v8,0
                  vmandnot.mm v14,v12,v0
                  rem        tp, t2, a5
                  vadc.vim   v24,v1,0,v0
                  vmul.vv    v15,v30,v0,v0.t
                  mul        s0, t5, s0
                  divu       s4, t5, a2
                  vmulhu.vv  v5,v2,v5,v0.t
                  vslide1up.vx v16,v30,s9,v0.t
                  mul        s1, s10, zero
                  vor.vv     v21,v12,v1
                  vmslt.vx   v9,v17,a7
                  xor        t1, s8, t1
                  vmsle.vv   v5,v25,v12
                  vmul.vx    v23,v29,s6
                  vmsleu.vx  v23,v3,s1,v0.t
                  sltiu      s1, a3, 643
                  slli       s5, a7, 14
                  lui        s5, 391378
                  vadc.vim   v3,v20,0,v0
                  vsbc.vxm   v13,v8,s3,v0
                  andi       a7, t1, -871
                  vsrl.vx    v22,v23,s9,v0.t
                  vor.vi     v0,v23,0
                  vmv.v.x v12,s3
                  vmv.v.v v1,v2
                  vsrl.vv    v29,v1,v13
                  xor        a0, s11, gp
                  mul        a4, t2, sp
                  sra        ra, t2, tp
                  srl        s0, tp, a2
                  srai       gp, s9, 23
                  sub        s1, t0, t1
                  vsra.vx    v15,v13,s10,v0.t
                  sra        s0, a4, s11
                  and        s6, tp, t2
                  vmin.vv    v10,v23,v24
                  vmand.mm   v31,v31,v1
                  xori       a3, a3, -87
                  vor.vx     v26,v29,t4
                  vor.vv     v1,v16,v24,v0.t
                  sltu       s1, t3, s2
                  vslidedown.vi v2,v22,0
                  vmax.vv    v13,v28,v7,v0.t
                  lui        a7, 64461
                  vmsltu.vx  v10,v27,zero
                  srai       s11, t2, 21
                  vmornot.mm v13,v16,v4
                  add        tp, t4, tp
                  vrgather.vv v20,v22,v6,v0.t
                  sll        s6, a2, gp
                  vfirst.m zero,v26,v0.t
                  vmacc.vv   v2,v16,v9
                  mulhu      s2, gp, s10
                  vmulh.vx   v29,v30,ra,v0.t
                  vmseq.vx   v14,v23,s9
                  vmulh.vx   v0,v16,s4
                  andi       s5, t4, -581
                  div        tp, s10, t3
                  mulhu      t4, a1, a3
                  vmulhsu.vv v13,v0,v31
                  mulhsu     ra, s8, s6
                  vmsne.vi   v24,v12,0,v0.t
                  mulh       a6, a3, t4
                  vrgather.vx v0,v28,s3
                  div        s4, t6, a1
                  vsub.vv    v31,v19,v27,v0.t
                  srl        t5, a4, a5
                  div        t6, zero, s5
                  mulhu      s0, gp, t5
                  vmand.mm   v13,v20,v7
                  vmsif.m v12,v1,v0.t
                  vmsif.m v30,v1,v0.t
                  vmnor.mm   v10,v10,v15
                  sltu       a3, t1, t3
                  vmulh.vx   v19,v31,s9,v0.t
                  vminu.vv   v13,v18,v10,v0.t
                  vmacc.vv   v8,v19,v23
                  vmseq.vv   v2,v6,v0
                  vsbc.vxm   v16,v20,a3,v0
                  andi       gp, s4, -500
                  vadc.vvm   v30,v13,v24,v0
                  sltiu      ra, a1, -161
                  vmulhsu.vx v15,v2,t6
                  ori        s0, t5, -921
                  vminu.vx   v24,v18,t1,v0.t
                  and        s11, t5, a3
                  vmv.s.x v28,a1
                  addi       a0, a0, 265
                  mulh       a2, t1, s0
                  vmin.vx    v22,v15,s3,v0.t
                  vmsgtu.vi  v24,v13,0,v0.t
                  and        zero, sp, t4
                  add        a3, s5, a1
                  sltu       ra, a1, s9
                  vslide1up.vx v15,v21,a2
                  vmsleu.vv  v9,v16,v5,v0.t
                  viota.m v4,v30
                  sltu       t0, t6, a3
                  srai       s2, tp, 16
                  slli       a4, tp, 10
                  vmsgtu.vi  v10,v23,0
                  vmnand.mm  v22,v9,v27
                  vid.v v26
                  mulhu      s0, s9, t0
                  vadc.vvm   v17,v8,v28,v0
                  vmsgt.vx   v31,v4,a1
                  vslide1down.vx v20,v6,s6,v0.t
                  vmadd.vv   v5,v30,v23
                  remu       t0, s9, a0
                  vmulh.vv   v7,v11,v20,v0.t
                  vmseq.vv   v22,v17,v20,v0.t
                  mul        s6, s5, t6
                  add        s7, a0, a3
                  vpopc.m zero,v8
                  vmsof.m v8,v20,v0.t
                  divu       t0, sp, s0
                  or         a0, a1, s5
                  and        tp, sp, t2
                  vminu.vv   v28,v9,v7
                  or         ra, s9, a1
                  mulhsu     zero, gp, a3
                  vmseq.vv   v18,v22,v29,v0.t
                  vmslt.vv   v2,v20,v9,v0.t
                  vslide1up.vx v31,v4,t2
                  slti       sp, s8, 534
                  sub        t4, a6, s3
                  xori       a7, zero, 309
                  vrsub.vi   v6,v8,0,v0.t
                  vmsof.m v4,v30
                  vpopc.m zero,v15
                  vmv.x.s zero,v26
                  vmnand.mm  v26,v25,v27
                  mul        a0, s2, s11
                  srli       a6, a3, 6
                  vor.vx     v23,v8,s7,v0.t
                  rem        s11, s7, s3
                  vmulh.vx   v10,v10,a7,v0.t
                  vpopc.m zero,v12
                  vmslt.vx   v18,v25,t6,v0.t
                  vmv.x.s zero,v7
                  or         a4, t4, s1
                  remu       a3, s0, s4
                  xori       a2, t0, 437
                  slli       s5, s5, 23
                  srl        a5, a5, s4
                  slt        t5, a3, s6
                  addi       s1, s10, -918
                  xori       s6, zero, -660
                  or         s0, s8, tp
                  vmsne.vx   v8,v9,s6
                  vmsbf.m v0,v14
                  vadd.vv    v30,v18,v27,v0.t
                  vadd.vv    v29,v15,v13
                  vmxor.mm   v15,v0,v30
                  vmv.v.v v22,v12
                  vmnor.mm   v25,v24,v22
                  vsbc.vxm   v1,v25,s7,v0
                  slt        t2, tp, a7
                  andi       s7, t2, -839
                  vadc.vim   v11,v20,0,v0
                  mulhsu     s2, t1, a3
                  vmsne.vi   v15,v20,0,v0.t
                  vmv.s.x v11,s0
                  vmulhu.vv  v19,v31,v8
                  vmulh.vx   v26,v17,s9
                  slli       s1, s8, 25
                  vrsub.vx   v5,v21,sp
                  sub        s8, a6, a1
                  or         a6, a6, t6
                  mulhu      a1, s3, gp
                  sra        a4, t5, s7
                  sra        s1, s2, a3
                  vmsle.vi   v18,v28,0
                  viota.m v10,v29
                  vmandnot.mm v4,v8,v27
                  vadd.vv    v10,v6,v20,v0.t
                  vmv.v.v v13,v11
                  vslide1up.vx v3,v13,a3
                  or         ra, sp, s7
                  or         s1, s11, s1
                  xor        s7, s2, a0
                  vmor.mm    v27,v23,v15
                  vslide1up.vx v21,v25,a1,v0.t
                  vfirst.m zero,v28,v0.t
                  rem        s6, sp, a4
                  sltiu      ra, t4, 251
                  vmandnot.mm v19,v4,v10
                  xori       s7, a7, 84
                  vmulhsu.vx v30,v10,s4
                  vslideup.vi v24,v25,0,v0.t
                  vpopc.m zero,v30,v0.t
                  vor.vv     v23,v26,v15
                  vmsne.vi   v16,v22,0
                  vfirst.m zero,v21
                  vxor.vv    v8,v5,v31
                  slli       s4, s4, 29
                  vslidedown.vx v19,v18,t0,v0.t
                  slti       s11, s10, -967
                  srli       t4, a3, 28
                  vmulhsu.vx v28,v17,t6,v0.t
                  vmseq.vx   v26,v5,a1
                  vmsgtu.vx  v3,v7,s2
                  vadd.vx    v10,v30,s2,v0.t
                  sltiu      tp, t0, 80
                  vmin.vv    v2,v21,v7,v0.t
                  slt        a3, a7, zero
                  vand.vi    v17,v9,0
                  xori       t5, s2, 929
                  sltu       sp, ra, t2
                  vmxor.mm   v0,v9,v27
                  vmslt.vv   v22,v20,v19
                  vmseq.vv   v23,v19,v7,v0.t
                  vmxnor.mm  v15,v26,v31
                  vmsif.m v5,v22,v0.t
                  vmxor.mm   v29,v4,v0
                  vand.vi    v22,v9,0
                  srai       zero, s4, 25
                  vmornot.mm v14,v9,v18
                  vrsub.vx   v24,v2,a3
                  vslide1down.vx v8,v18,t3,v0.t
                  slti       ra, a0, 581
                  vsub.vx    v0,v23,s10
                  mulhsu     a1, s1, t5
                  sra        sp, a1, s6
                  sub        a7, t3, a4
                  vmand.mm   v9,v24,v24
                  auipc      tp, 240745
                  vmsle.vi   v26,v13,0,v0.t
                  vmnor.mm   v12,v4,v15
                  vmandnot.mm v20,v20,v28
                  rem        s0, t0, t0
                  vmsgtu.vx  v5,v30,s6
                  vmadd.vv   v22,v1,v6
                  rem        tp, t2, a1
                  vmnor.mm   v6,v23,v6
                  vmacc.vx   v10,s11,v2
                  vmxnor.mm  v13,v11,v0
                  srai       t0, t6, 28
                  vor.vi     v11,v4,0,v0.t
                  vmaxu.vv   v6,v26,v8
                  vmsof.m v18,v2
                  vmv.x.s zero,v25
                  vmslt.vv   v28,v26,v18,v0.t
                  vmand.mm   v1,v4,v12
                  slt        a7, tp, a3
                  sltiu      s5, a2, -452
                  vsrl.vx    v20,v5,a1
                  vmsle.vi   v30,v8,0
                  slt        a4, t4, t0
                  lui        a1, 1021205
                  vmslt.vv   v19,v28,v22,v0.t
                  vid.v v4,v0.t
                  vmulh.vv   v20,v30,v0
                  srai       a7, a3, 24
                  sll        s2, s8, tp
                  srl        ra, a0, t1
                  vmxor.mm   v24,v15,v0
                  vrgather.vx v17,v0,a6,v0.t
                  vsll.vx    v12,v7,a4
                  vxor.vx    v18,v31,a5
                  vmv.v.i v1,0
                  vrgather.vx v14,v25,t3,v0.t
                  remu       s11, a5, a2
                  vadc.vxm   v6,v16,s4,v0
                  vmaxu.vv   v8,v0,v7
                  vmax.vx    v21,v17,gp
                  and        ra, a2, a0
                  sra        t4, t2, t5
                  vmxor.mm   v31,v17,v5
                  vsub.vv    v15,v25,v30,v0.t
                  vmnor.mm   v18,v15,v29
                  vadd.vv    v4,v19,v12,v0.t
                  vrgather.vx v14,v11,a4
                  slt        a6, s9, s9
                  vmulhu.vv  v19,v18,v23,v0.t
                  add        sp, t0, a4
                  vmslt.vx   v20,v9,s5
                  vmand.mm   v18,v25,v16
                  sltu       sp, t0, s9
                  slti       s4, zero, 651
                  vsll.vv    v23,v19,v18,v0.t
                  vmsif.m v1,v22,v0.t
                  vmslt.vx   v28,v1,a0,v0.t
                  div        s11, sp, s6
                  vmsle.vv   v12,v14,v16,v0.t
                  sra        t2, a7, a5
                  xor        a1, s0, a0
                  addi       s7, s4, -590
                  sra        a6, gp, s8
                  xori       s4, t6, 86
                  sltu       a4, a7, s9
                  vmv.v.x v21,t2
                  rem        s11, a3, t5
                  sltu       sp, s11, a7
                  vfirst.m zero,v19,v0.t
                  vor.vx     v21,v26,t4,v0.t
                  vmslt.vx   v15,v16,t5
                  vmv.x.s zero,v23
                  vmulhu.vv  v28,v13,v16,v0.t
                  vmseq.vi   v29,v22,0
                  vmaxu.vx   v11,v11,gp
                  vmaxu.vx   v11,v24,s5,v0.t
                  vmsif.m v22,v16,v0.t
                  vsra.vv    v1,v9,v31,v0.t
                  vmsof.m v16,v19,v0.t
                  vmsle.vv   v31,v1,v14,v0.t
                  slli       t0, s1, 22
                  auipc      a6, 1043641
                  auipc      a6, 922715
                  mulh       tp, a6, s9
                  mulhu      zero, tp, a1
                  vmsif.m v20,v26,v0.t
                  srli       t2, tp, 0
                  add        s7, a0, tp
                  addi       zero, s9, 361
                  vsrl.vi    v14,v10,0,v0.t
                  vmv.x.s zero,v20
                  vmsne.vx   v20,v21,s7
                  vmsle.vx   v21,v14,a3,v0.t
                  sra        a4, a2, s6
                  vmxnor.mm  v0,v26,v19
                  vmulhu.vv  v24,v18,v4,v0.t
                  vfirst.m zero,v9
                  vmsif.m v22,v15
                  vxor.vi    v23,v9,0,v0.t
                  divu       t0, t2, s2
                  and        tp, s1, tp
                  vmaxu.vx   v5,v6,a2
                  vmsbf.m v16,v7,v0.t
                  vsrl.vi    v20,v5,0
                  vmsle.vx   v24,v18,s11,v0.t
                  mul        s8, gp, s9
                  vsrl.vx    v0,v5,tp
                  vmv.s.x v28,t1
                  vmulhu.vv  v14,v27,v12
                  vor.vx     v8,v28,a6,v0.t
                  srl        gp, s8, t6
                  vmseq.vx   v3,v9,a0,v0.t
                  vadc.vxm   v9,v17,t5,v0
                  vid.v v2,v0.t
                  and        sp, a7, s6
                  vmsleu.vv  v25,v22,v21,v0.t
                  and        tp, t5, t3
                  remu       a3, ra, s1
                  add        t2, a2, s4
                  vslide1down.vx v9,v28,a4
                  divu       ra, a5, t2
                  addi       a4, gp, 669
                  sll        s7, a5, s7
                  sltu       t1, s1, s1
                  div        ra, a0, s8
                  divu       a0, a6, s3
                  slti       a4, t3, -212
                  vslideup.vx v7,v28,s3
                  vmsleu.vv  v28,v4,v13,v0.t
                  vmulhsu.vx v12,v21,a6,v0.t
                  vsra.vv    v18,v13,v15
                  vmsleu.vi  v3,v2,0
                  vadc.vim   v4,v17,0,v0
                  vslide1up.vx v9,v4,a3,v0.t
                  vrgather.vi v0,v15,0
                  vor.vv     v19,v0,v25
                  vmxnor.mm  v16,v10,v27
                  vmsgt.vi   v22,v20,0
                  andi       gp, a7, -628
                  vmxnor.mm  v4,v9,v3
                  vrgather.vx v4,v8,s5
                  vslide1up.vx v9,v18,s11
                  xori       s6, t1, -262
                  rem        t4, a5, t6
                  add        s5, s2, s11
                  vmax.vx    v1,v22,t5,v0.t
                  vadd.vx    v8,v19,s3
                  vadc.vim   v18,v7,0,v0
                  vxor.vx    v24,v17,t0
                  vid.v v12
                  vmsbf.m v21,v1,v0.t
                  mul        a7, tp, a3
                  vmaxu.vx   v4,v16,s11,v0.t
                  vmnor.mm   v28,v31,v0
                  vmornot.mm v14,v3,v11
                  vadc.vvm   v4,v1,v3,v0
                  vmseq.vi   v22,v0,0,v0.t
                  vrsub.vi   v31,v24,0,v0.t
                  vmaxu.vx   v1,v4,t6,v0.t
                  add        a3, ra, t6
                  vmaxu.vx   v5,v1,a0
                  rem        sp, s11, tp
                  div        a2, t1, s6
                  vmor.mm    v31,v15,v19
                  slt        a5, s11, s1
                  sra        t6, s0, sp
                  divu       t5, t0, a4
                  vor.vv     v26,v12,v23
                  vmsne.vv   v24,v16,v19,v0.t
                  xor        t5, a3, a5
                  vmnand.mm  v31,v21,v28
                  vmsleu.vx  v17,v8,a7
                  mulhu      a3, a0, s5
                  vmsleu.vi  v6,v4,0
                  vsll.vx    v31,v20,s8,v0.t
                  srli       a7, tp, 13
                  vand.vv    v13,v10,v19,v0.t
                  vmulh.vv   v15,v20,v1
                  vslide1down.vx v8,v2,t5,v0.t
                  rem        a5, s6, a0
                  viota.m v6,v23,v0.t
                  viota.m v1,v23
                  vmul.vv    v14,v8,v29,v0.t
                  vmax.vx    v5,v14,s4,v0.t
                  vmulhu.vv  v26,v19,v21
                  vid.v v3,v0.t
                  vmulhu.vx  v16,v11,t5
                  vsbc.vxm   v10,v24,a2,v0
                  andi       s0, s11, -847
                  vmsif.m v21,v28,v0.t
                  sltiu      t3, t1, -503
                  add        t5, t6, s6
                  srli       s8, a5, 6
                  vmulhsu.vv v1,v12,v15,v0.t
                  vmacc.vx   v7,a1,v20,v0.t
                  vmslt.vx   v26,v3,a7,v0.t
                  vmsgtu.vi  v25,v7,0
                  sll        a5, t6, s11
                  vmand.mm   v16,v15,v2
                  vmxor.mm   v0,v11,v31
                  sltu       t5, a6, s7
                  vmandnot.mm v20,v25,v19
                  vsrl.vi    v21,v11,0,v0.t
                  div        t6, s7, s2
                  vxor.vx    v26,v11,t1
                  vmulhu.vv  v19,v15,v23
                  and        zero, s5, s7
                  slli       a4, s7, 5
                  vfirst.m zero,v4,v0.t
                  vmaxu.vx   v23,v26,s1,v0.t
                  mul        a0, s4, a5
                  vslide1down.vx v7,v21,a5,v0.t
                  vpopc.m zero,v12
                  vmornot.mm v14,v2,v7
                  vmsif.m v11,v13
                  ori        s8, t5, -33
                  vsra.vx    v7,v16,t0
                  vslide1up.vx v20,v10,a6
                  vslidedown.vx v10,v9,s1
                  vmv.s.x v26,t4
                  slti       a3, t4, -371
                  vmsle.vv   v28,v17,v7,v0.t
                  vslide1down.vx v11,v23,s7
                  vmsltu.vx  v22,v0,tp,v0.t
                  srli       tp, a5, 22
                  sltiu      s4, s6, 863
                  vmulhsu.vv v9,v7,v11
                  divu       t1, zero, s2
                  vmaxu.vv   v9,v23,v15,v0.t
                  vand.vv    v22,v10,v31
                  vmnand.mm  v13,v11,v4
                  vmulhu.vx  v12,v25,s5
                  slti       s6, t1, 194
                  and        a1, t4, s7
                  vrsub.vi   v21,v3,0
                  vmandnot.mm v12,v5,v10
                  vmnor.mm   v23,v4,v1
                  vmnor.mm   v13,v20,v2
                  sub        gp, s4, a2
                  vmsleu.vx  v16,v25,s1,v0.t
                  vmsof.m v6,v19,v0.t
                  vmin.vx    v8,v12,t1
                  vadc.vim   v23,v14,0,v0
                  div        s8, s3, t6
                  vxor.vx    v15,v27,a2,v0.t
                  vmnor.mm   v4,v24,v1
                  vsbc.vvm   v19,v17,v19,v0
                  sub        a3, a0, t2
                  vmulhsu.vx v15,v22,s9
                  vmsif.m v9,v8,v0.t
                  vmslt.vv   v14,v22,v18
                  vmnor.mm   v26,v4,v26
                  vslide1up.vx v3,v24,sp
                  vmacc.vx   v24,s11,v18,v0.t
                  vmsne.vi   v6,v26,0,v0.t
                  mulh       t0, a0, a3
                  vmsof.m v9,v21
                  vminu.vx   v24,v31,a5,v0.t
                  vrsub.vi   v18,v11,0,v0.t
                  slli       s2, s3, 27
                  vsub.vx    v15,v28,a4,v0.t
                  vor.vi     v23,v14,0,v0.t
                  vmnor.mm   v29,v17,v22
                  xor        s6, t5, s2
                  xori       s2, s7, -386
                  vmxor.mm   v4,v18,v15
                  auipc      tp, 374117
                  sltu       s0, tp, s0
                  srl        t1, s11, s3
                  vmulhu.vx  v15,v28,a0
                  divu       t4, s6, s9
                  sra        ra, s4, s10
                  vmulhsu.vv v22,v4,v17
                  vmsof.m v10,v6,v0.t
                  vmax.vv    v0,v4,v21
                  vmxnor.mm  v7,v6,v31
                  vslideup.vx v29,v9,a0
                  vmin.vv    v9,v13,v6,v0.t
                  srai       s2, t1, 31
                  mul        t1, s9, ra
                  vmsle.vx   v4,v8,t5
                  vmslt.vv   v8,v5,v11
                  sltu       t2, s10, sp
                  vmandnot.mm v6,v22,v10
                  sub        a2, s10, s6
                  vmornot.mm v10,v29,v18
                  vid.v v17,v0.t
                  vadd.vx    v25,v13,a4
                  vadc.vim   v7,v25,0,v0
                  vmulhu.vv  v17,v0,v7,v0.t
                  mulh       sp, a1, s7
                  vmsbf.m v21,v16,v0.t
                  vsll.vi    v9,v13,0,v0.t
                  srai       s4, t4, 4
                  vmsne.vx   v17,v31,s2
                  vmslt.vv   v11,v21,v8
                  vminu.vv   v23,v17,v26
                  vsra.vv    v16,v23,v4,v0.t
                  vmadd.vx   v28,t2,v16,v0.t
                  vmseq.vv   v31,v27,v27
                  slt        tp, a5, s3
                  vmxnor.mm  v27,v2,v20
                  vmv.v.i v15,0
                  vid.v v15
                  vmsbf.m v6,v31
                  sll        s7, t4, s9
                  srli       t3, s1, 7
                  sltiu      s0, tp, -18
                  vmulhu.vv  v25,v24,v0
                  vmulh.vv   v23,v1,v0
                  vmv.v.v v13,v11
                  auipc      t4, 709712
                  vadc.vxm   v27,v30,t1,v0
                  vmaxu.vv   v15,v1,v12
                  vslide1down.vx v21,v0,t5
                  div        s2, s9, s5
                  vmsbf.m v11,v13
                  vpopc.m zero,v10,v0.t
                  vrsub.vi   v20,v20,0
                  vfirst.m zero,v19
                  vfirst.m zero,v20,v0.t
                  vmslt.vx   v16,v25,s11
                  vmsne.vx   v23,v31,t6
                  vmv.x.s zero,v7
                  vmulhsu.vv v31,v22,v3,v0.t
                  ori        t5, a6, -393
                  vmv.v.x v23,a4
                  srli       a4, s0, 20
                  vsra.vv    v3,v20,v27,v0.t
                  vxor.vx    v31,v18,t3,v0.t
                  vrsub.vi   v26,v27,0,v0.t
                  vmsle.vx   v0,v1,t4
                  vslide1up.vx v29,v15,t1
                  vrsub.vx   v23,v1,ra,v0.t
                  vmseq.vi   v20,v1,0
                  add        sp, t1, s0
                  vmv.x.s zero,v11
                  mulhsu     a6, zero, a7
                  mulhu      s8, a5, t2
                  rem        t6, tp, zero
                  vfirst.m zero,v30,v0.t
                  vmsle.vv   v24,v10,v29,v0.t
                  vmnor.mm   v28,v22,v26
                  srl        a4, a4, gp
                  vmsgtu.vx  v18,v1,a7,v0.t
                  viota.m v13,v10
                  lui        s0, 60148
                  vadd.vv    v13,v14,v21
                  vadd.vv    v20,v27,v16
                  vmsif.m v19,v16
                  vmulh.vx   v7,v29,t1,v0.t
                  or         ra, t0, a0
                  remu       gp, t2, sp
                  vmor.mm    v12,v14,v31
                  slti       t1, a5, 564
                  vmaxu.vv   v23,v7,v14
                  slt        a5, t2, a2
                  vslide1down.vx v8,v26,a4,v0.t
                  vminu.vx   v18,v1,s3
                  xor        s7, a5, s8
                  vmnor.mm   v17,v30,v18
                  vsra.vi    v5,v13,0
                  vmsgt.vx   v15,v18,a5
                  xor        sp, t2, sp
                  vmor.mm    v11,v11,v19
                  vmslt.vv   v30,v7,v3,v0.t
                  vrsub.vx   v13,v11,t3
                  add        s7, s9, s4
                  vmsif.m v9,v26
                  sll        a1, s5, a5
                  vand.vi    v16,v14,0,v0.t
                  vslide1up.vx v31,v19,s6
                  rem        a6, a4, s2
                  vmul.vx    v21,v6,a6,v0.t
                  vmul.vv    v29,v6,v27,v0.t
                  xor        t5, s6, s5
                  sra        a2, s1, a2
                  vsll.vx    v31,v15,s0,v0.t
                  lui        s8, 572534
                  andi       t4, tp, 825
                  remu       t5, s2, a2
                  vsll.vx    v27,v13,s4
                  vmxor.mm   v22,v31,v15
                  vmadd.vx   v19,s10,v13,v0.t
                  vsbc.vxm   v1,v18,s0,v0
                  srl        a3, s6, tp
                  lui        s2, 541702
                  vslide1up.vx v12,v3,s11
                  vmsle.vv   v22,v4,v15,v0.t
                  slli       t5, s0, 7
                  srai       ra, zero, 4
                  vmv.v.i v27,0
                  div        zero, s11, s6
                  vsub.vx    v7,v22,s5,v0.t
                  vmsleu.vi  v11,v2,0
                  vfirst.m zero,v16
                  and        t4, t1, t4
                  srl        s8, s4, gp
                  vmsle.vv   v7,v20,v30
                  vmadd.vv   v5,v11,v27,v0.t
                  div        t0, a2, sp
                  vmor.mm    v2,v28,v18
                  auipc      a1, 348339
                  vmsle.vx   v25,v23,t2,v0.t
                  srl        ra, s2, s4
                  vsub.vv    v23,v5,v20
                  vpopc.m zero,v14,v0.t
                  vmseq.vv   v29,v7,v28,v0.t
                  vsll.vv    v29,v27,v6,v0.t
                  vmnand.mm  v25,v27,v28
                  vmsgt.vi   v22,v25,0,v0.t
                  sltu       t4, s7, s7
                  vmsgt.vx   v26,v22,zero
                  vmsbf.m v7,v2,v0.t
                  mulhu      s5, s10, ra
                  slti       s6, t6, -948
                  slti       t2, s1, 182
                  div        t3, s11, t2
                  vmsif.m v26,v20,v0.t
                  vadd.vi    v13,v0,0,v0.t
                  vadc.vim   v20,v11,0,v0
                  slt        s6, s7, zero
                  vsbc.vvm   v31,v1,v24,v0
                  vmandnot.mm v12,v22,v15
                  vmornot.mm v18,v22,v21
                  lui        a5, 355576
                  vslide1up.vx v24,v1,s10,v0.t
                  vmax.vx    v26,v21,ra
                  vmsbf.m v2,v27,v0.t
                  vslide1down.vx v24,v8,sp
                  vand.vv    v22,v3,v22,v0.t
                  addi       s0, s1, -677
                  remu       s7, t2, a1
                  vslide1down.vx v16,v24,t6
                  auipc      s4, 254463
                  sltiu      s8, s5, -1014
                  vmulh.vv   v26,v29,v29
                  vmsne.vx   v21,v20,s8
                  vand.vv    v7,v23,v13,v0.t
                  vmandnot.mm v5,v0,v5
                  vand.vv    v16,v26,v8,v0.t
                  vid.v v1
                  vadd.vv    v2,v20,v21,v0.t
                  vmxnor.mm  v28,v1,v30
                  vsub.vv    v13,v29,v22,v0.t
                  slli       a0, t3, 9
                  slli       s1, s11, 29
                  vmv.x.s zero,v0
                  vmax.vv    v21,v12,v22
                  mulhsu     s5, s2, t0
                  vmv.v.x v26,s1
                  vrgather.vx v31,v6,t2
                  vmsbf.m v16,v29,v0.t
                  vmand.mm   v14,v4,v9
                  mul        a7, a6, s0
                  vmv.s.x v16,gp
                  vslideup.vx v19,v21,t3,v0.t
                  divu       zero, t6, a4
                  vmsltu.vx  v26,v6,s9,v0.t
                  vsrl.vi    v26,v22,0,v0.t
                  vmaxu.vv   v7,v15,v27
                  or         a1, a0, a5
                  divu       tp, t6, s11
                  add        ra, s9, tp
                  vsra.vv    v26,v24,v18
                  sub        t1, s8, ra
                  vadc.vvm   v5,v0,v6,v0
                  and        t6, ra, t0
                  vmulhu.vv  v27,v26,v4
                  vmsof.m v22,v13
                  div        s7, t5, t5
                  div        s2, s5, zero
                  vmsof.m v20,v0,v0.t
                  or         zero, a1, a5
                  and        gp, a0, s4
                  vslide1down.vx v12,v23,t3,v0.t
                  srl        a6, s10, t5
                  slt        t6, a5, a2
                  vslide1down.vx v10,v23,sp,v0.t
                  vmul.vv    v21,v4,v26,v0.t
                  srli       t6, t0, 11
                  mulh       s1, t5, a6
                  vmax.vv    v20,v7,v17,v0.t
                  vmor.mm    v15,v4,v22
                  vmsif.m v4,v7
                  xori       t5, sp, -776
                  vmulhu.vv  v14,v10,v7
                  ori        s5, s1, -35
                  lui        a3, 895916
                  vmax.vv    v20,v9,v6,v0.t
                  vmxor.mm   v18,v17,v31
                  addi       gp, a5, -33
                  vsll.vx    v3,v25,s6,v0.t
                  srl        s2, t4, s2
                  divu       s5, s6, t1
                  vmseq.vi   v1,v7,0
                  add        s0, t6, t6
                  sll        t1, t4, sp
                  vmacc.vv   v10,v22,v8,v0.t
                  vxor.vx    v18,v20,a5
                  vmnand.mm  v9,v11,v15
                  divu       a2, s6, s1
                  vsbc.vvm   v26,v22,v5,v0
                  xori       gp, s11, -152
                  and        t3, s10, s5
                  vmslt.vx   v28,v25,gp,v0.t
                  srai       zero, sp, 30
                  vmin.vx    v30,v23,t5
                  vrsub.vi   v15,v6,0,v0.t
                  vmsgt.vx   v10,v16,s1,v0.t
                  vmulhsu.vv v25,v0,v19
                  vmul.vx    v22,v25,s2,v0.t
                  vfirst.m zero,v2
                  mulhu      s2, ra, a0
                  vmsbf.m v2,v16
                  mulh       s7, gp, s6
                  vmulh.vx   v27,v30,s7,v0.t
                  vadc.vim   v6,v20,0,v0
                  vrgather.vi v15,v9,0
                  vmsltu.vx  v21,v22,t5,v0.t
                  vmnor.mm   v7,v25,v17
                  vslide1down.vx v25,v23,t5
                  vmulh.vv   v2,v7,v17,v0.t
                  vmsof.m v2,v15,v0.t
                  ori        s0, s11, 70
                  mulhu      s0, a3, a3
                  vfirst.m zero,v5
                  vmin.vx    v21,v19,s10
                  rem        s7, s8, a2
                  vmand.mm   v21,v10,v17
                  vsrl.vv    v28,v27,v20,v0.t
                  xori       t1, t5, 1014
                  sub        t2, t2, tp
                  vmslt.vx   v1,v6,a5,v0.t
                  vmxnor.mm  v20,v20,v29
                  mul        t5, t1, s2
                  div        s5, s8, s9
                  vsub.vx    v3,v24,zero,v0.t
                  vmv.x.s zero,v3
                  vmulhsu.vx v30,v15,t3
                  vmulhu.vx  v9,v21,t0
                  vmulhu.vv  v1,v1,v29,v0.t
                  xori       s1, zero, 94
                  slti       s2, a6, -518
                  vadd.vx    v4,v9,ra,v0.t
                  sltu       t3, gp, s4
                  srai       s11, a3, 18
                  vslide1down.vx v19,v8,t0
                  or         s1, s3, t6
                  vadd.vi    v23,v24,0,v0.t
                  vslidedown.vi v30,v10,0,v0.t
                  lui        a6, 755277
                  vmsgtu.vi  v29,v21,0
                  vmulhsu.vv v9,v14,v29
                  vmin.vv    v6,v23,v29
                  vmsif.m v12,v6
                  vid.v v12,v0.t
                  mulh       s1, s5, gp
                  vmsgt.vx   v9,v2,s4,v0.t
                  sub        ra, a2, a3
                  vmnand.mm  v10,v0,v0
                  sll        t5, a1, t1
                  vmaxu.vv   v7,v5,v1
                  vpopc.m zero,v5
                  mulhsu     t1, s1, s1
                  mulh       a0, s2, t3
                  vmaxu.vv   v24,v15,v30,v0.t
                  auipc      a7, 950718
                  vmv.x.s zero,v16
                  vmv.x.s zero,v29
                  addi       tp, a5, 487
                  vmin.vv    v26,v1,v8,v0.t
                  srli       s1, a5, 28
                  vmsif.m v7,v20
                  vsll.vv    v25,v6,v10
                  vmsleu.vv  v16,v15,v14
                  vmseq.vx   v13,v8,ra
                  vmsleu.vi  v2,v31,0,v0.t
                  divu       ra, tp, a3
                  vslide1down.vx v6,v5,s8
                  vsll.vv    v24,v21,v31,v0.t
                  vmsgt.vi   v13,v0,0,v0.t
                  vmin.vx    v3,v8,s8
                  vmxor.mm   v22,v26,v15
                  vmv.v.x v1,a7
                  vmsgt.vx   v27,v28,s8,v0.t
                  srai       a2, a3, 15
                  vmsgt.vx   v10,v1,s5,v0.t
                  slti       s5, a3, 125
                  vslideup.vx v18,v13,a4
                  divu       a7, ra, t0
                  vand.vx    v13,v27,a5,v0.t
                  vminu.vv   v7,v23,v13
                  srai       s6, t5, 5
                  vmsgtu.vx  v23,v22,t6,v0.t
                  vmnand.mm  v26,v20,v6
                  vfirst.m zero,v24
                  vmsof.m v16,v19,v0.t
                  rem        t6, t0, s5
                  mulhsu     s1, s3, a7
                  vrgather.vv v14,v26,v21
                  remu       s7, s8, a3
                  xori       a4, s11, -567
                  vadd.vv    v28,v25,v22,v0.t
                  vmulh.vv   v1,v13,v9
                  vmsne.vx   v22,v21,s2
                  slli       t1, tp, 17
                  vsrl.vi    v12,v25,0,v0.t
                  srai       t4, a4, 6
                  vor.vi     v22,v26,0,v0.t
                  vmslt.vv   v7,v28,v4,v0.t
                  vadd.vx    v6,v20,a3
                  vfirst.m zero,v2
                  vmulhu.vv  v25,v13,v2
                  vsrl.vx    v23,v15,a4,v0.t
                  vor.vx     v0,v6,s8
                  vfirst.m zero,v2,v0.t
                  mulhsu     s1, gp, t6
                  vand.vi    v23,v17,0,v0.t
                  sra        s11, t2, t6
                  andi       a7, a5, -169
                  vmsof.m v21,v8
                  vmv.v.i v1,0
                  vmsgtu.vx  v13,v21,s3
                  vsrl.vi    v6,v3,0
                  vmin.vx    v22,v5,s2,v0.t
                  mul        s0, s8, t5
                  vpopc.m zero,v21
                  addi       a0, s5, 629
                  vmv.s.x v2,a0
                  vmnor.mm   v13,v4,v19
                  vor.vv     v16,v16,v3
                  vmul.vv    v1,v29,v27
                  xor        sp, a2, a3
                  remu       sp, tp, s9
                  vmxnor.mm  v17,v9,v17
                  vmslt.vx   v14,v5,s2
                  vsub.vx    v18,v12,t6
                  vmulhsu.vx v28,v10,t5,v0.t
                  remu       s8, s7, s7
                  vmslt.vx   v22,v2,s2
                  vadd.vv    v7,v20,v26
                  srli       tp, s6, 6
                  slli       ra, s3, 28
                  vmsbf.m v14,v26
                  vmornot.mm v29,v8,v23
                  div        s6, s11, s10
                  lui        t6, 1032143
                  vmin.vv    v10,v13,v25,v0.t
                  vminu.vx   v7,v24,s1
                  srai       a6, s6, 15
                  srli       a0, a3, 7
                  vmv.v.v v29,v14
                  addi       a0, s4, -503
                  vid.v v28
                  vmulhu.vx  v31,v12,a2
                  slti       s4, t1, -425
                  vmnor.mm   v29,v16,v24
                  mulhsu     a5, s4, t0
                  vsub.vx    v2,v29,a5
                  sltu       t2, s7, t1
                  vmadd.vv   v26,v26,v10,v0.t
                  ori        s11, t6, 823
                  lui        t0, 675631
                  vmsltu.vv  v20,v4,v12
                  vmxor.mm   v29,v11,v1
                  vmandnot.mm v21,v24,v11
                  vmnand.mm  v2,v23,v12
                  vslidedown.vx v20,v10,t5
                  vmsltu.vv  v6,v23,v31,v0.t
                  srli       t4, a3, 21
                  vmsgtu.vx  v21,v3,t4,v0.t
                  srl        gp, s0, t6
                  vand.vi    v30,v19,0
                  vslide1up.vx v12,v20,s11,v0.t
                  sltu       a1, t6, gp
                  or         s0, a3, s10
                  srli       a1, a3, 21
                  sltu       s5, s6, t2
                  vrgather.vx v7,v10,a6,v0.t
                  sra        a2, a2, a7
                  vfirst.m zero,v3,v0.t
                  vadd.vi    v22,v19,0
                  vadc.vvm   v12,v31,v2,v0
                  vmacc.vx   v29,t0,v30,v0.t
                  vrgather.vi v4,v28,0,v0.t
                  add        s5, t2, a3
                  vadd.vv    v26,v15,v6,v0.t
                  vmornot.mm v16,v26,v12
                  vid.v v8,v0.t
                  vmand.mm   v31,v31,v6
                  sll        s11, t4, s9
                  mulhsu     a7, a4, tp
                  sltiu      s4, s8, 778
                  vmsgtu.vi  v18,v23,0,v0.t
                  vrgather.vi v13,v29,0,v0.t
                  vmsle.vi   v26,v23,0
                  xori       s0, s9, 852
                  mulhsu     a1, a3, a6
                  sll        s6, a0, s3
                  lui        sp, 322698
                  vmax.vx    v9,v11,s9,v0.t
                  vmslt.vv   v26,v15,v16,v0.t
                  vmadd.vx   v6,s8,v23
                  vminu.vx   v8,v6,s7,v0.t
                  vrgather.vi v18,v26,0
                  vmsltu.vx  v1,v3,sp
                  vrsub.vi   v0,v3,0
                  vmadd.vx   v23,t5,v31,v0.t
                  sltiu      t6, t4, 240
                  sltiu      a0, t6, -717
                  vmv.x.s zero,v17
                  vslide1down.vx v30,v6,s10
                  slli       s7, s8, 23
                  vmslt.vx   v10,v11,s3,v0.t
                  srl        s8, s3, t3
                  or         t1, t2, sp
                  rem        gp, s2, a2
                  vfirst.m zero,v11,v0.t
                  xori       s6, a2, 378
                  slti       s4, gp, -34
                  vmsgt.vx   v0,v10,s10
                  or         a3, a1, s11
                  vmxnor.mm  v2,v31,v10
                  vor.vv     v24,v13,v16
                  vmsbf.m v0,v10
                  vmsgt.vx   v19,v6,t0,v0.t
                  and        s1, s9, a4
                  sub        a5, s6, zero
                  vxor.vv    v3,v4,v23,v0.t
                  srli       zero, gp, 10
                  vmxor.mm   v3,v4,v17
                  vmsbf.m v5,v4
                  vmxnor.mm  v20,v11,v6
                  vmsne.vv   v8,v16,v1
                  add        s7, t1, a3
                  vmin.vv    v7,v7,v5,v0.t
                  vslidedown.vx v23,v4,s1
                  vmslt.vv   v11,v16,v23
                  vadc.vvm   v20,v3,v29,v0
                  mulhu      s5, s6, s8
                  vsrl.vx    v22,v9,s3
                  vmacc.vv   v1,v0,v30
                  div        s0, tp, t6
                  sub        s5, ra, a2
                  vrsub.vx   v12,v9,a7,v0.t
                  vmor.mm    v26,v29,v29
                  vmornot.mm v7,v23,v15
                  vmand.mm   v20,v8,v26
                  vmulh.vv   v8,v3,v16,v0.t
                  vmsne.vx   v31,v2,ra
                  vmv.s.x v27,s6
                  div        s6, s3, t6
                  mulh       ra, s8, s8
                  srli       t1, s0, 3
                  vmandnot.mm v4,v23,v10
                  vmslt.vv   v0,v12,v25
                  mulhu      s6, sp, a6
                  rem        s6, a0, a4
                  vrsub.vx   v8,v31,t0
                  mulhu      s7, sp, a4
                  rem        ra, t4, s11
                  vsll.vv    v28,v15,v30,v0.t
                  vmul.vv    v19,v29,v9
                  xori       zero, a3, 343
                  vmor.mm    v29,v25,v25
                  mul        s8, tp, zero
                  sll        t1, a4, t6
                  vmacc.vv   v17,v3,v31,v0.t
                  vsub.vx    v27,v22,ra,v0.t
                  vminu.vv   v31,v31,v8
                  or         s2, a3, a7
                  sltiu      t2, s1, -342
                  mulh       s0, s10, a0
                  vmv.x.s zero,v31
                  or         s0, s8, s1
                  vmv.v.v v26,v1
                  vmandnot.mm v21,v17,v7
                  mulhu      t1, t0, s0
                  addi       a4, a6, 719
                  vslide1down.vx v11,v16,s9
                  vslidedown.vx v22,v18,t3
                  vmslt.vv   v10,v17,v8,v0.t
                  vslide1up.vx v25,v26,t4,v0.t
                  vmand.mm   v4,v6,v24
                  vmxnor.mm  v3,v30,v29
                  ori        s2, a7, 688
                  vslide1up.vx v7,v15,t5,v0.t
                  vsra.vi    v7,v3,0
                  vadd.vx    v29,v15,sp,v0.t
                  vsra.vv    v12,v7,v16
                  divu       t3, a0, s0
                  lui        s7, 1021442
                  vmornot.mm v14,v31,v24
                  vmandnot.mm v4,v27,v11
                  sltiu      t3, a7, -571
                  vmaxu.vv   v12,v14,v22,v0.t
                  vor.vx     v17,v23,zero
                  vor.vv     v3,v26,v11,v0.t
                  vsll.vv    v7,v18,v10
                  vmv.v.x v27,s3
                  vmnor.mm   v27,v20,v1
                  vsll.vx    v27,v4,s2
                  vmsgtu.vi  v25,v8,0
                  vsbc.vvm   v4,v3,v22,v0
                  vmsle.vi   v25,v23,0
                  vmv.v.v v7,v16
                  vmsif.m v15,v29
                  vmax.vx    v20,v4,s3
                  and        a0, a0, s9
                  slti       a3, t5, -943
                  vsbc.vxm   v1,v1,a1,v0
                  vminu.vv   v29,v18,v23
                  add        gp, s0, s11
                  or         a6, ra, a3
                  vslideup.vx v5,v28,s10
                  vsll.vx    v30,v6,ra
                  remu       s11, sp, s7
                  vsra.vi    v23,v16,0,v0.t
                  srl        a2, s6, s8
                  sll        s1, s10, a6
                  vslideup.vi v3,v2,0,v0.t
                  or         s6, a6, t2
                  rem        s4, s2, t3
                  mulhsu     t2, s11, s0
                  srai       t5, tp, 7
                  vsra.vv    v7,v29,v19,v0.t
                  vand.vv    v22,v29,v10,v0.t
                  vid.v v28,v0.t
                  vmseq.vv   v22,v30,v16,v0.t
                  sub        zero, s2, t6
                  vor.vv     v17,v15,v9,v0.t
                  rem        t2, a2, s3
                  srli       t1, t1, 15
                  vmsgtu.vi  v7,v5,0
                  srai       s0, a7, 7
                  mulhu      tp, t3, s5
                  vmsgt.vi   v26,v0,0,v0.t
                  sub        s7, a6, ra
                  viota.m v0,v14
                  div        s5, t1, s11
                  vor.vi     v5,v11,0,v0.t
                  vmor.mm    v12,v3,v3
                  vpopc.m zero,v24
                  vmsle.vx   v23,v13,s11
                  vsbc.vxm   v17,v28,a5,v0
                  vmslt.vv   v7,v4,v22,v0.t
                  vmandnot.mm v17,v5,v19
                  vmseq.vx   v18,v21,sp
                  andi       a5, s5, 348
                  xori       gp, s11, -635
                  vsbc.vvm   v24,v28,v9,v0
                  div        tp, s5, s1
                  slt        a0, t2, s3
                  add        t1, a3, s7
                  vmor.mm    v7,v7,v8
                  vslideup.vx v23,v21,s4,v0.t
                  vmandnot.mm v4,v30,v16
                  viota.m v13,v20
                  vmnor.mm   v24,v21,v7
                  srai       s2, t6, 29
                  vmsleu.vx  v31,v22,s5,v0.t
                  mul        tp, t4, t5
                  vmslt.vv   v26,v17,v23
                  sra        sp, s4, s2
                  sll        a0, a1, s10
                  vslidedown.vi v23,v3,0
                  viota.m v11,v21
                  vmnand.mm  v3,v0,v18
                  vmnand.mm  v20,v31,v28
                  vmsgtu.vi  v10,v22,0
                  vmaxu.vv   v23,v23,v10
                  vsra.vx    v0,v23,s10
                  vadc.vxm   v15,v25,t4,v0
                  vmsbf.m v10,v16
                  vadc.vvm   v15,v5,v0,v0
                  remu       s11, t0, s10
                  slti       t6, t0, 231
                  vmsle.vv   v26,v23,v14,v0.t
                  vmandnot.mm v17,v10,v17
                  vadc.vxm   v4,v6,t1,v0
                  vadc.vim   v11,v4,0,v0
                  srli       ra, t4, 7
                  vminu.vv   v16,v0,v10,v0.t
                  vmv.v.v v8,v3
                  vmsleu.vv  v1,v23,v9,v0.t
                  vminu.vv   v0,v16,v30
                  addi       s7, t3, 4
                  vid.v v13
                  vmornot.mm v8,v15,v27
                  slti       a0, s1, -74
                  vand.vi    v20,v9,0
                  vslideup.vx v15,v25,s10
                  vadc.vim   v28,v15,0,v0
                  vadd.vx    v11,v0,s4
                  sub        ra, s5, ra
                  vrgather.vi v27,v24,0,v0.t
                  vmsbf.m v26,v15,v0.t
                  vmulhu.vx  v5,v16,s10
                  remu       a7, ra, ra
                  vxor.vi    v30,v0,0
                  vmaxu.vv   v7,v25,v16
                  xor        a1, s5, a5
                  vminu.vx   v15,v2,s10
                  vid.v v27
                  vmsof.m v18,v6,v0.t
                  vmulhu.vv  v10,v3,v1,v0.t
                  vmsne.vi   v11,v20,0
                  vmor.mm    v24,v19,v3
                  vmornot.mm v27,v22,v26
                  addi       gp, s9, 84
                  vmsif.m v28,v12,v0.t
                  vmulhsu.vx v27,v9,s8
                  vmslt.vx   v19,v12,ra
                  vfirst.m zero,v3,v0.t
                  vmsgtu.vi  v27,v20,0
                  remu       a6, t1, ra
                  slli       s2, s10, 29
                  vmul.vx    v29,v12,zero,v0.t
                  vor.vx     v18,v24,s3,v0.t
                  vmsif.m v9,v13,v0.t
                  mulhu      s2, a7, s5
                  vrsub.vx   v30,v6,s10
                  vsrl.vi    v9,v20,0
                  lui        s5, 280473
                  vmand.mm   v22,v23,v12
                  vslide1up.vx v23,v20,a5,v0.t
                  vmsgt.vx   v3,v20,t1,v0.t
                  mulhsu     s0, s9, s10
                  vpopc.m zero,v19
                  vmulh.vv   v4,v28,v18
                  vand.vv    v10,v29,v11,v0.t
                  vmxor.mm   v20,v6,v31
                  rem        s5, zero, ra
                  mulhsu     s2, s3, a7
                  mul        a7, ra, s10
                  xor        a6, t2, s5
                  viota.m v13,v4
                  vid.v v25,v0.t
                  vmxor.mm   v19,v13,v29
                  sub        a5, t0, s4
                  divu       t5, a2, s7
                  vand.vx    v15,v2,tp
                  vmsle.vi   v27,v26,0
                  srai       ra, a1, 18
                  sub        a7, t0, a6
                  sltiu      t3, a3, -142
                  vmsif.m v20,v0,v0.t
                  vmulhu.vx  v0,v23,s3
                  vmxnor.mm  v6,v7,v22
                  vminu.vx   v19,v19,t3
                  vsub.vv    v20,v2,v27
                  vsra.vx    v18,v18,a0,v0.t
                  mul        a1, s11, t5
                  vor.vv     v2,v15,v5,v0.t
                  vmulh.vx   v12,v17,t4,v0.t
                  vadd.vv    v10,v9,v12
                  vrgather.vi v27,v22,0
                  vmv.x.s zero,v2
                  vmnor.mm   v9,v29,v15
                  srl        t5, t0, s9
                  viota.m v12,v3,v0.t
                  vminu.vx   v21,v13,a5
                  vor.vv     v7,v29,v19,v0.t
                  addi       s0, s5, 982
                  vslidedown.vi v23,v26,0,v0.t
                  vmulhu.vx  v23,v15,a5
                  vslidedown.vi v9,v8,0,v0.t
                  vmv.s.x v10,t4
                  xor        a6, ra, s0
                  vmulhu.vx  v1,v22,s6,v0.t
                  add        s6, gp, s7
                  vmadd.vv   v30,v2,v29
                  mul        t3, s3, ra
                  vrsub.vx   v15,v12,gp,v0.t
                  add        a4, sp, a4
                  vsub.vv    v21,v29,v21
                  vxor.vv    v0,v24,v29
                  vmornot.mm v17,v28,v26
                  add        s5, t4, s3
                  srl        a0, t0, s10
                  mulhu      t6, s0, a6
                  vslideup.vi v6,v4,0
                  vmand.mm   v31,v18,v20
                  vmv.x.s zero,v12
                  rem        t6, s11, t3
                  vslideup.vx v28,v8,t6,v0.t
                  xori       a0, zero, -487
                  slti       t5, s3, -831
                  vmnor.mm   v11,v29,v19
                  vmadd.vx   v9,t3,v23,v0.t
                  vid.v v9,v0.t
                  mulh       t2, t2, a6
                  vslide1up.vx v25,v26,a3,v0.t
                  vmnand.mm  v30,v5,v9
                  vminu.vv   v2,v3,v19
                  vsll.vi    v22,v28,0,v0.t
                  slt        a2, s7, t6
                  vmsltu.vv  v14,v28,v17,v0.t
                  vmsof.m v2,v17
                  vor.vi     v12,v28,0
                  vslidedown.vi v10,v19,0
                  vmslt.vv   v28,v3,v0,v0.t
                  vfirst.m zero,v4
                  vmxor.mm   v3,v6,v29
                  sub        a4, a1, t6
                  vminu.vv   v12,v16,v13,v0.t
                  vxor.vv    v11,v25,v1
                  vmulh.vx   v31,v22,t5,v0.t
                  vsll.vi    v4,v21,0
                  vxor.vv    v1,v28,v22,v0.t
                  vmandnot.mm v11,v26,v20
                  vmsgtu.vi  v0,v21,0
                  vmxnor.mm  v18,v24,v25
                  vmv.s.x v20,s11
                  vand.vv    v2,v18,v20
                  vmadd.vx   v24,s7,v31
                  vadd.vi    v13,v18,0
                  vsbc.vxm   v13,v28,s7,v0
                  vsll.vi    v16,v27,0,v0.t
                  vmsleu.vi  v31,v13,0,v0.t
                  vmsle.vx   v20,v5,t4
                  andi       a7, t5, -383
                  slt        s5, s8, sp
                  vsrl.vi    v9,v10,0
                  vmsif.m v9,v19,v0.t
                  vmseq.vx   v20,v30,ra,v0.t
                  mulh       sp, t1, gp
                  vmax.vv    v31,v30,v29,v0.t
                  vmv.s.x v15,s6
                  vrgather.vi v29,v10,0,v0.t
                  vsub.vv    v10,v31,v26,v0.t
                  vmulhsu.vv v11,v23,v27
                  vmsle.vi   v26,v12,0,v0.t
                  andi       sp, t6, 884
                  mulh       a1, t5, t0
                  or         t6, a4, t0
                  vmnor.mm   v22,v30,v14
                  vmsof.m v17,v22
                  slt        ra, a0, s4
                  slt        a5, a6, t0
                  vmadd.vv   v8,v0,v12,v0.t
                  vmul.vv    v31,v10,v13
                  vmsleu.vv  v25,v3,v23
                  vmand.mm   v16,v26,v20
                  vmsne.vi   v4,v28,0
                  or         t5, gp, s7
                  vfirst.m zero,v27
                  vmxnor.mm  v17,v24,v16
                  xori       s7, t5, -776
                  slt        s5, s2, a1
                  srl        t6, a0, a2
                  vmadd.vv   v3,v28,v28
                  vmv.s.x v4,s11
                  vmv.x.s zero,v31
                  vpopc.m zero,v23
                  sltiu      a6, s9, -766
                  srl        a4, zero, s11
                  vmxnor.mm  v26,v30,v12
                  sll        a6, t5, a0
                  and        a0, t4, a5
                  vsrl.vv    v20,v9,v3,v0.t
                  vslide1up.vx v6,v26,a5,v0.t
                  vmsleu.vi  v7,v2,0,v0.t
                  vmulhsu.vv v3,v4,v28,v0.t
                  vslide1up.vx v0,v14,t0
                  vpopc.m zero,v29
                  vmsif.m v6,v3,v0.t
                  vslidedown.vx v24,v9,t1
                  vmulh.vv   v4,v6,v27
                  vmv.s.x v18,tp
                  vmnor.mm   v28,v14,v14
                  vrsub.vx   v24,v4,s11
                  vslideup.vi v0,v20,0
                  sra        a5, t6, ra
                  vmsgt.vx   v26,v17,t3,v0.t
                  vxor.vx    v6,v30,t3,v0.t
                  mul        a3, s2, s5
                  xor        a1, a6, a4
                  sub        gp, a7, s8
                  vmv.v.x v5,s5
                  vmnor.mm   v7,v0,v3
                  vmseq.vv   v0,v10,v23
                  mulh       a3, a2, a7
                  vmsif.m v12,v22,v0.t
                  vmacc.vx   v18,gp,v22
                  vadc.vxm   v18,v22,s10,v0
                  vmsleu.vx  v15,v19,tp,v0.t
                  vsbc.vxm   v20,v29,sp,v0
                  ori        t5, a0, 882
                  vxor.vx    v24,v7,s8,v0.t
                  sltu       s1, s9, t4
                  vmnor.mm   v25,v9,v18
                  vmsbf.m v12,v0,v0.t
                  ori        t1, s7, -195
                  vmsne.vi   v10,v9,0,v0.t
                  slti       s11, s0, 795
                  vmulh.vv   v10,v0,v23,v0.t
                  vmadd.vx   v1,t5,v2
                  vor.vx     v11,v4,s10
                  addi       gp, s0, -566
                  xori       zero, s9, -113
                  vmv.s.x v8,t1
                  xori       t6, tp, 599
                  vmsof.m v23,v19
                  slli       a5, t0, 8
                  vmax.vx    v17,v11,a6
                  vsrl.vx    v25,v17,a7
                  vmsle.vv   v16,v5,v19
                  mulhu      s0, t2, zero
                  vmsbf.m v13,v27
                  div        zero, s3, a5
                  srai       s11, t2, 10
                  rem        a4, t6, a0
                  auipc      a0, 484089
                  sltiu      a0, t2, -662
                  andi       s6, s6, -326
                  vmxnor.mm  v24,v2,v3
                  vsra.vv    v25,v5,v20,v0.t
                  vslideup.vx v9,v20,s11,v0.t
                  vmornot.mm v24,v7,v15
                  vmulhsu.vv v20,v10,v27,v0.t
                  vmacc.vv   v4,v10,v14
                  xor        a7, a7, zero
                  sra        a1, t1, a3
                  mulhsu     s7, a3, sp
                  and        sp, ra, t4
                  add        a1, a0, t0
                  vmxor.mm   v20,v30,v12
                  slti       a4, t5, 436
                  srai       a0, t1, 25
                  vmadd.vx   v20,s1,v17
                  vmul.vv    v12,v16,v18,v0.t
                  srai       s5, a7, 2
                  vmsof.m v16,v27
                  vmseq.vx   v23,v12,s11,v0.t
                  or         a4, a1, gp
                  vid.v v8
                  mul        a7, sp, a5
                  vmseq.vv   v14,v25,v0,v0.t
                  vmsof.m v22,v6
                  vslide1down.vx v31,v29,s5
                  vminu.vv   v20,v6,v23,v0.t
                  ori        t4, tp, -564
                  vslidedown.vx v10,v22,tp
                  srai       gp, s2, 21
                  divu       a4, a4, gp
                  slt        s0, s6, a2
                  and        t4, t4, a6
                  vmsne.vv   v0,v4,v31
                  ori        s8, t1, 720
                  vmsbf.m v26,v21
                  slt        t5, a4, sp
                  vmv.s.x v19,s11
                  or         t6, t5, a1
                  or         t3, s1, s10
                  andi       ra, tp, 0
                  or         s11, t3, s11
                  vminu.vx   v4,v14,t6
                  srai       tp, s3, 24
                  lui        a3, 579235
                  vmxor.mm   v29,v0,v11
                  sltiu      t5, a2, -649
                  vxor.vv    v13,v6,v12,v0.t
                  vmnor.mm   v22,v6,v17
                  srai       s0, tp, 15
                  slli       t2, t1, 8
                  vor.vi     v1,v2,0
                  viota.m v22,v12,v0.t
                  vmax.vv    v25,v22,v18
                  mulh       a1, tp, t0
                  andi       t4, s1, 73
                  vmseq.vi   v18,v12,0,v0.t
                  slti       gp, t4, 140
                  vmsgtu.vi  v15,v30,0
                  andi       a0, a3, -217
                  vmsle.vv   v2,v7,v17
                  vmornot.mm v18,v26,v20
                  vmandnot.mm v9,v3,v27
                  vfirst.m zero,v17
                  xor        sp, t1, t3
                  vslide1up.vx v19,v27,t6
                  vsra.vx    v15,v10,t3
                  andi       t2, t4, -534
                  add        s2, a4, s9
                  mul        s4, a4, zero
                  vrsub.vi   v16,v31,0
                  vmsltu.vv  v31,v4,v2,v0.t
                  xor        sp, tp, s4
                  vmsgtu.vx  v30,v17,a3
                  vmseq.vx   v15,v2,t3,v0.t
                  mulhsu     s2, s3, s4
                  vmsleu.vi  v13,v24,0
                  vmsof.m v25,v19
                  sll        t3, t0, s9
                  slti       t3, s7, 541
                  vmslt.vx   v15,v21,s4,v0.t
                  add        a7, sp, s8
                  vor.vx     v24,v26,t0,v0.t
                  vmnand.mm  v14,v27,v14
                  slli       a6, sp, 1
                  vsll.vx    v7,v24,t2,v0.t
                  vmsne.vv   v25,v23,v9
                  vmsleu.vv  v26,v13,v29,v0.t
                  vfirst.m zero,v26
                  vadc.vvm   v18,v25,v27,v0
                  vrgather.vx v2,v14,t6,v0.t
                  vmsgtu.vi  v11,v30,0
                  vmsgtu.vx  v27,v1,s2,v0.t
                  addi       s1, a6, 783
                  vslide1down.vx v29,v27,t2
                  slti       sp, s3, 509
                  rem        a5, t0, s10
                  vmsgtu.vi  v26,v4,0
                  sltiu      s2, t0, 868
                  andi       t3, t0, -198
                  vmxnor.mm  v1,v11,v13
                  srai       ra, t2, 27
                  slt        s0, t2, a0
                  vmadd.vx   v26,ra,v4
                  and        s2, ra, a1
                  vand.vv    v25,v22,v12,v0.t
                  vmul.vv    v18,v28,v27,v0.t
                  vmulhu.vx  v3,v22,t2
                  andi       a6, a7, -141
                  vslideup.vi v8,v10,0,v0.t
                  vslide1up.vx v3,v19,a6
                  slt        a0, t5, t0
                  vsra.vi    v23,v21,0
                  vslide1down.vx v24,v25,s7,v0.t
                  vmnor.mm   v11,v27,v15
                  vmv.v.i v10,0
                  viota.m v4,v2
                  vor.vv     v12,v3,v20,v0.t
                  vmsbf.m v12,v4
                  mul        a1, t4, s7
                  vor.vv     v6,v22,v11
                  vslide1up.vx v30,v1,s5
                  vmor.mm    v3,v6,v10
                  vslide1up.vx v3,v31,t4,v0.t
                  mulh       t3, s10, gp
                  xori       s1, s5, -258
                  vmsle.vi   v10,v11,0,v0.t
                  vmsne.vv   v11,v28,v17
                  srli       t2, s1, 10
                  vmv.x.s zero,v27
                  add        s2, t4, s11
                  vminu.vv   v5,v19,v11
                  vmv.x.s zero,v17
                  vmxor.mm   v22,v29,v6
                  and        zero, zero, s11
                  vmxor.mm   v16,v21,v10
                  vmacc.vv   v3,v12,v10
                  vmv.s.x v9,ra
                  vmacc.vx   v0,a0,v14
                  vmxnor.mm  v16,v7,v15
                  vmseq.vi   v25,v30,0,v0.t
                  vmulhsu.vx v18,v3,sp
                  vmslt.vv   v10,v6,v6
                  vxor.vx    v19,v8,s2,v0.t
                  mulhu      a7, t5, a6
                  vmulhu.vv  v2,v27,v12
                  vmnand.mm  v26,v11,v14
                  vmornot.mm v31,v28,v12
                  andi       t4, tp, -112
                  vmulhsu.vv v1,v0,v3
                  vmxnor.mm  v8,v25,v11
                  vmulhsu.vx v10,v0,a1,v0.t
                  vmsgt.vi   v23,v26,0
                  vmxor.mm   v0,v6,v27
                  vmv.x.s zero,v17
                  div        t3, s0, ra
                  srai       t1, s11, 25
                  vmv.s.x v22,a6
                  vmsif.m v31,v7,v0.t
                  remu       t4, t1, a4
                  and        tp, s1, tp
                  vadc.vxm   v29,v8,s0,v0
                  divu       s5, s6, t6
                  vand.vx    v16,v17,s5
                  vor.vx     v31,v13,s11
                  xor        s2, a3, s8
                  vmulh.vv   v6,v19,v27,v0.t
                  vmornot.mm v24,v25,v15
                  vmulhu.vv  v6,v27,v18
                  vmv.v.x v2,t5
                  vmand.mm   v13,v22,v9
                  viota.m v25,v28
                  slt        a3, t5, zero
                  vmv.x.s zero,v13
                  sra        s0, t0, a5
                  mulh       t0, a2, s6
                  slt        a5, a3, t2
                  srli       a4, tp, 3
                  srai       t1, s8, 4
                  vslideup.vx v19,v6,a0,v0.t
                  vor.vi     v10,v27,0,v0.t
                  srai       t0, a2, 30
                  div        a7, a0, a0
                  vmnand.mm  v13,v22,v23
                  vmax.vv    v8,v14,v10,v0.t
                  vslide1down.vx v6,v13,a7,v0.t
                  vfirst.m zero,v22,v0.t
                  vsra.vv    v31,v0,v26
                  divu       t6, s4, gp
                  sltiu      tp, s4, -936
                  vrgather.vv v23,v20,v13
                  vsbc.vvm   v20,v4,v27,v0
                  srli       a1, a7, 16
                  srli       s7, a5, 30
                  vmulhu.vv  v28,v24,v12
                  viota.m v24,v5,v0.t
                  vand.vi    v21,v18,0
                  vmsle.vx   v19,v11,a7,v0.t
                  vmin.vv    v11,v15,v31
                  and        a3, t0, a1
                  vor.vi     v21,v31,0
                  vslidedown.vx v24,v8,t2
                  viota.m v7,v21,v0.t
                  vminu.vv   v30,v0,v2,v0.t
                  vmin.vv    v28,v16,v19,v0.t
                  vmornot.mm v24,v18,v26
                  vmor.mm    v18,v9,v15
                  xor        a0, a7, a0
                  vmin.vx    v9,v4,t6
                  vmseq.vv   v13,v20,v16
                  vmsne.vi   v4,v11,0
                  sll        s11, s2, a6
                  viota.m v20,v17,v0.t
                  vfirst.m zero,v8,v0.t
                  vmv.s.x v6,a1
                  vxor.vi    v4,v14,0,v0.t
                  vmslt.vv   v11,v9,v17,v0.t
                  vxor.vv    v22,v4,v17,v0.t
                  andi       a2, a7, -943
                  vmv.v.x v31,s7
                  vmnand.mm  v0,v15,v15
                  vmacc.vv   v6,v9,v7,v0.t
                  vsub.vx    v16,v26,s5,v0.t
                  vsrl.vx    v10,v12,t2
                  ori        a6, s10, -297
                  vmax.vx    v4,v0,s5
                  srai       s0, a5, 20
                  mulh       ra, t1, s1
                  vmnand.mm  v7,v5,v26
                  vmul.vx    v20,v2,t3,v0.t
                  vsbc.vvm   v20,v8,v8,v0
                  vand.vv    v3,v4,v16,v0.t
                  mulh       s0, s7, s4
                  div        t6, s7, zero
                  sub        t2, a1, gp
                  vpopc.m zero,v16
                  vmsof.m v30,v5
                  vmornot.mm v6,v5,v27
                  vfirst.m zero,v15
                  mulh       s7, ra, s7
                  vmacc.vx   v26,sp,v14,v0.t
                  mulhu      s11, tp, sp
                  vmsle.vv   v13,v19,v18
                  vslide1down.vx v23,v25,s2,v0.t
                  remu       t4, s8, a4
                  sub        s2, t0, s10
                  vmxor.mm   v16,v10,v29
                  vid.v v4,v0.t
                  vmul.vx    v12,v3,a5,v0.t
                  vslidedown.vi v19,v4,0
                  lui        t4, 761529
                  srai       sp, s11, 24
                  vmslt.vx   v15,v0,s9
                  remu       a2, ra, a6
                  remu       a5, zero, s2
                  vmin.vv    v10,v19,v23,v0.t
                  vslide1up.vx v3,v14,a5
                  div        s8, s11, a7
                  xor        s0, tp, a7
                  slt        s5, zero, t5
                  vmsof.m v23,v1,v0.t
                  vmsgt.vi   v31,v15,0,v0.t
                  add        a1, s11, s0
                  vmornot.mm v2,v11,v5
                  sra        zero, ra, s7
                  viota.m v1,v9,v0.t
                  mulhsu     a3, s6, zero
                  divu       s0, a7, s9
                  vsra.vx    v6,v31,t2
                  vmadd.vv   v26,v16,v4
                  vmsof.m v15,v31,v0.t
                  vmsgtu.vx  v17,v21,t4,v0.t
                  vmsleu.vv  v28,v20,v10
                  xori       s7, s5, -966
                  sll        zero, sp, t1
                  vmv.s.x v10,sp
                  lui        a1, 602350
                  vmsne.vi   v18,v27,0,v0.t
                  vadd.vx    v17,v10,t6,v0.t
                  vmslt.vx   v27,v17,s6
                  vminu.vv   v5,v26,v29
                  vsrl.vv    v28,v18,v28
                  divu       zero, tp, s7
                  vsra.vx    v30,v21,gp,v0.t
                  vmornot.mm v4,v5,v17
                  vmul.vv    v12,v5,v31
                  vmornot.mm v13,v13,v20
                  vadd.vx    v25,v22,zero
                  vmacc.vv   v21,v13,v19,v0.t
                  vmsne.vi   v8,v30,0,v0.t
                  sub        tp, a1, a6
                  vsra.vv    v8,v21,v21,v0.t
                  srl        a7, s6, ra
                  div        s7, a2, a2
                  vmul.vx    v31,v16,zero,v0.t
                  addi       s1, a4, -202
                  mulhu      s2, s9, t4
                  rem        tp, s10, a1
                  remu       s7, tp, t6
                  vmv.x.s zero,v6
                  vslidedown.vx v3,v22,t6
                  vmaxu.vx   v22,v19,s5
                  vmsif.m v3,v29,v0.t
                  vslideup.vx v11,v19,s1
                  vmax.vx    v24,v18,s6
                  vid.v v7
                  vmulh.vv   v28,v14,v5
                  andi       a5, tp, 232
                  vmxnor.mm  v27,v11,v0
                  div        t6, s7, a1
                  ori        gp, a3, -526
                  slt        t4, gp, s9
                  or         a5, t2, zero
                  sll        s11, s5, ra
                  lui        s0, 523310
                  vmax.vv    v10,v6,v6,v0.t
                  vmsof.m v8,v14
                  mulhu      ra, s10, s4
                  vadd.vx    v9,v24,s11
                  sub        t1, tp, gp
                  vmseq.vi   v5,v28,0
                  vmsif.m v2,v25
                  vmsltu.vx  v30,v13,zero,v0.t
                  vmsof.m v7,v19
                  vmulhu.vv  v12,v16,v4
                  vslideup.vi v30,v4,0
                  slli       s1, s1, 13
                  xor        t1, t2, s6
                  and        a6, sp, t6
                  vsll.vv    v24,v10,v25,v0.t
                  or         t2, a7, s7
                  sltiu      a2, s9, -361
                  srli       zero, s6, 18
                  vmsbf.m v26,v4
                  vmxor.mm   v26,v14,v13
                  vmsif.m v21,v8
                  xori       a7, s8, 851
                  vslide1up.vx v19,v21,s5,v0.t
                  vmulhsu.vx v12,v19,s7
                  divu       t2, s2, gp
                  vmsltu.vx  v9,v14,t2
                  vmsltu.vx  v23,v4,t5,v0.t
                  vmax.vx    v0,v19,a2
                  vrgather.vi v5,v29,0
                  add        t2, s3, t0
                  vmsgtu.vi  v5,v23,0,v0.t
                  vmv.x.s zero,v13
                  vsra.vv    v16,v30,v10,v0.t
                  add        a4, a2, s6
                  vsrl.vi    v21,v17,0,v0.t
                  vmor.mm    v25,v27,v4
                  vsub.vv    v31,v29,v5,v0.t
                  vmseq.vx   v21,v16,ra,v0.t
                  vrsub.vi   v21,v20,0
                  vrsub.vi   v9,v2,0,v0.t
                  div        t5, s6, s11
                  vsrl.vi    v19,v3,0
                  sra        t6, a6, a0
                  vmnand.mm  v17,v22,v18
                  vslidedown.vx v28,v21,a2,v0.t
                  lui        s2, 377085
                  div        s6, a6, s0
                  srl        a1, s9, a0
                  vmsltu.vx  v27,v16,a6,v0.t
                  vmulhu.vv  v23,v13,v3,v0.t
                  andi       sp, t3, 933
                  sub        a3, t3, s10
                  vmadd.vx   v5,s9,v5
                  slli       s2, t1, 20
                  sra        a2, s3, zero
                  vmseq.vv   v3,v13,v11
                  vxor.vv    v14,v7,v28,v0.t
                  vmseq.vv   v22,v8,v19,v0.t
                  andi       t0, s6, 28
                  slti       t6, s9, 764
                  vmandnot.mm v5,v14,v25
                  vmnand.mm  v28,v6,v20
                  vrgather.vv v12,v0,v28
                  vmul.vx    v11,v26,a6,v0.t
                  vfirst.m zero,v26,v0.t
                  viota.m v17,v21
                  vmin.vv    v15,v17,v0,v0.t
                  vpopc.m zero,v31,v0.t
                  or         t0, a2, s10
                  vsrl.vv    v26,v31,v28
                  vslide1down.vx v19,v12,a7,v0.t
                  vfirst.m zero,v9,v0.t
                  vmsne.vi   v23,v28,0,v0.t
                  vslidedown.vi v8,v10,0,v0.t
                  vmsgt.vi   v4,v18,0
                  vmxor.mm   v17,v1,v24
                  srai       tp, s1, 15
                  vadd.vx    v6,v26,a5,v0.t
                  xori       s8, t5, 535
                  auipc      s8, 857916
                  vmnand.mm  v16,v6,v20
                  vmsltu.vv  v28,v13,v27,v0.t
                  vadd.vi    v14,v23,0,v0.t
                  vminu.vx   v30,v21,t5
                  sll        t2, s3, t1
                  vminu.vv   v19,v29,v8
                  vmsle.vi   v20,v12,0,v0.t
                  mulhu      gp, t1, s1
                  vslide1up.vx v25,v4,t4,v0.t
                  vmulh.vx   v21,v17,a3,v0.t
                  vrsub.vx   v27,v6,t2
                  vmsgtu.vx  v22,v29,a5
                  vmand.mm   v3,v26,v13
                  vmsgt.vx   v7,v2,a7,v0.t
                  srli       a0, s2, 23
                  srli       t0, ra, 26
                  div        t3, t6, s0
                  vsll.vx    v0,v10,a2
                  mulh       ra, ra, tp
                  or         sp, t2, t1
                  vrsub.vi   v23,v27,0
                  vslide1up.vx v3,v9,a6,v0.t
                  ori        ra, t6, -468
                  srl        ra, t2, s4
                  vfirst.m zero,v4
                  vmsgt.vx   v10,v26,t4,v0.t
                  vmsof.m v17,v8
                  vsll.vx    v18,v13,t0
                  vxor.vv    v7,v28,v5
                  srli       s0, t5, 14
                  vslide1up.vx v23,v0,tp,v0.t
                  vmandnot.mm v23,v23,v21
                  add        t5, a2, s11
                  vmacc.vv   v15,v4,v22
                  xori       a7, gp, -1016
                  vmsif.m v9,v1,v0.t
                  vmsltu.vx  v23,v24,t4,v0.t
                  vmax.vx    v10,v20,tp
                  auipc      s4, 539389
                  vmul.vv    v0,v23,v14
                  vmandnot.mm v24,v26,v15
                  sltiu      t5, s0, -300
                  sltu       t2, s0, ra
                  vadd.vx    v13,v17,s6,v0.t
                  mulhsu     a7, s0, a3
                  vand.vv    v21,v29,v15
                  vslidedown.vx v19,v13,a3,v0.t
                  vsrl.vv    v17,v19,v27
                  vpopc.m zero,v19,v0.t
                  vmxor.mm   v14,v24,v13
                  slti       t4, t0, -192
                  sltu       t1, a1, s0
                  vmv.v.v v16,v0
                  vmsbf.m v6,v19,v0.t
                  or         t3, s6, t0
                  slli       zero, gp, 3
                  vmulhsu.vv v19,v17,v8,v0.t
                  srl        ra, a7, t3
                  vmxnor.mm  v29,v19,v7
                  vmseq.vx   v25,v14,a4,v0.t
                  and        sp, s7, zero
                  viota.m v22,v13,v0.t
                  srl        s8, a1, s8
                  vsll.vx    v12,v15,s4,v0.t
                  vrsub.vi   v29,v7,0
                  slli       t0, s2, 26
                  vmornot.mm v29,v20,v16
                  vmv.s.x v2,t4
                  vmulh.vx   v29,v25,s4,v0.t
                  viota.m v4,v29
                  vmv.x.s zero,v20
                  vmv.x.s zero,v31
                  lui        t6, 814070
                  xor        s2, a3, ra
                  sra        a4, s5, s9
                  vmsif.m v21,v18
                  sub        a0, s9, s11
                  vmadd.vv   v22,v18,v23
                  sub        s0, tp, t6
                  vmulhu.vv  v27,v30,v12
                  vmxnor.mm  v8,v2,v1
                  vmsbf.m v5,v3
                  sltiu      s7, zero, -775
                  sltu       t3, s6, s0
                  ori        t6, s11, -709
                  slt        a5, s8, s6
                  vmv.v.v v10,v10
                  vmxnor.mm  v9,v27,v14
                  vmsof.m v14,v15,v0.t
                  vmsif.m v20,v14,v0.t
                  auipc      s5, 917999
                  mulhsu     s6, s2, gp
                  vmulhu.vx  v15,v26,t5,v0.t
                  vmaxu.vx   v10,v8,zero
                  slt        t5, s0, tp
                  vid.v v21
                  vxor.vv    v6,v28,v12,v0.t
                  vmsgtu.vi  v17,v21,0,v0.t
                  vmaxu.vx   v7,v4,t3,v0.t
                  vmulhsu.vx v15,v23,ra,v0.t
                  slli       t4, a0, 6
                  vmor.mm    v13,v17,v8
                  vrgather.vv v30,v4,v2
                  or         s7, t1, a0
                  vmsgtu.vx  v18,v15,t0,v0.t
                  vmand.mm   v27,v22,v26
                  vsll.vi    v5,v0,0
                  mul        zero, s1, t3
                  auipc      ra, 437767
                  add        t3, s7, s2
                  vminu.vx   v4,v28,tp
                  vmv.s.x v13,t5
                  vmulhu.vx  v29,v27,s3
                  vslide1down.vx v9,v22,s1
                  lui        a5, 115732
                  xori       a7, tp, 528
                  vmv.s.x v23,sp
                  vsrl.vx    v18,v22,t0,v0.t
                  mulhu      t2, s11, t0
                  mulh       a7, t6, s5
                  vmsgtu.vx  v25,v2,a7,v0.t
                  vmsltu.vx  v1,v0,t5,v0.t
                  divu       s7, tp, s11
                  slt        t0, a6, s9
                  vadc.vxm   v31,v8,t0,v0
                  vmulhu.vv  v26,v17,v1,v0.t
                  vsub.vx    v21,v20,gp,v0.t
                  ori        s5, s5, -566
                  vmxor.mm   v21,v22,v0
                  vmulhsu.vv v31,v8,v0,v0.t
                  vmsltu.vx  v13,v12,a6,v0.t
                  remu       s4, a0, t1
                  vmsbf.m v18,v23,v0.t
                  mulhsu     t0, t0, t5
                  mulh       a7, ra, t4
                  vmin.vv    v14,v16,v11
                  vmv.s.x v23,a5
                  srai       a5, ra, 14
                  mulhsu     a2, s7, s11
                  vor.vv     v31,v10,v10
                  vmulh.vv   v15,v3,v0,v0.t
                  sltiu      a7, t3, 388
                  lui        a7, 286774
                  vsbc.vvm   v3,v20,v25,v0
                  auipc      s6, 797092
                  srli       a5, zero, 31
                  vmsbf.m v29,v23
                  sltu       tp, a5, s2
                  vmv.v.x v11,s3
                  vmsgtu.vi  v4,v3,0,v0.t
                  sub        t2, a3, t3
                  vmsgt.vx   v11,v18,a1
                  vmor.mm    v5,v0,v15
                  viota.m v6,v28,v0.t
                  vmul.vx    v4,v22,a4
                  vid.v v21,v0.t
                  srai       sp, gp, 29
                  vand.vi    v7,v0,0
                  vmsgtu.vx  v31,v11,a5,v0.t
                  vmxor.mm   v14,v31,v28
                  vmsgtu.vx  v1,v28,a0,v0.t
                  andi       gp, tp, 943
                  vsub.vv    v11,v23,v30,v0.t
                  and        tp, a3, t3
                  vslideup.vx v0,v28,s2
                  mul        t6, a1, t1
                  vmsne.vv   v7,v31,v0,v0.t
                  vid.v v26,v0.t
                  and        s1, t0, a6
                  add        a7, s11, ra
                  sll        s5, s10, tp
                  xori       s11, a5, 804
                  vmsne.vx   v8,v9,a4
                  viota.m v18,v4,v0.t
                  rem        s7, t6, ra
                  vadc.vvm   v12,v25,v26,v0
                  vsub.vv    v21,v12,v10,v0.t
                  vmadd.vv   v19,v25,v14
                  sll        a3, a4, s2
                  vmsltu.vx  v11,v1,s8
                  sltiu      a7, a4, -148
                  rem        s5, s11, a6
                  vmulhu.vx  v29,v28,tp,v0.t
                  vslide1up.vx v16,v10,t5,v0.t
                  vmsgt.vx   v31,v24,s0,v0.t
                  vmadd.vx   v28,a2,v31
                  sll        ra, s2, a4
                  vslide1up.vx v25,v13,a5
                  or         sp, t3, s7
                  vmornot.mm v24,v6,v7
                  srai       a3, s5, 9
                  mul        s6, s6, a2
                  vmul.vx    v15,v3,zero,v0.t
                  vfirst.m zero,v3
                  vmv.x.s zero,v22
                  srl        a5, t6, a4
                  viota.m v14,v22
                  vmulhsu.vv v16,v8,v11,v0.t
                  sltu       tp, t1, t4
                  vmadd.vv   v16,v24,v31
                  vmv.x.s zero,v24
                  or         s11, t4, t3
                  mulhu      s8, a0, t5
                  vmsof.m v13,v31,v0.t
                  vmseq.vv   v17,v5,v25
                  vmax.vv    v20,v23,v2,v0.t
                  mul        s2, a7, zero
                  vmulhu.vv  v15,v27,v21
                  vmv.x.s zero,v7
                  vmxnor.mm  v11,v12,v9
                  vslide1up.vx v6,v30,t2,v0.t
                  vmornot.mm v17,v10,v17
                  vrsub.vx   v13,v27,s9,v0.t
                  vrgather.vv v11,v1,v12
                  vmsltu.vv  v16,v11,v3
                  auipc      t1, 8074
                  vmin.vx    v3,v4,tp,v0.t
                  vmsgtu.vx  v13,v27,s11
                  srli       s7, s1, 29
                  mulhsu     a0, s9, t5
                  vmnor.mm   v10,v28,v18
                  srl        tp, s10, sp
                  vmulhsu.vv v4,v8,v0
                  rem        s7, s4, a5
                  vmsleu.vx  v27,v0,gp
                  vmulh.vv   v30,v23,v12,v0.t
                  vmulhsu.vx v26,v27,t3,v0.t
                  lui        t5, 258373
                  xori       s2, a7, -720
                  lui        t5, 41818
                  mulh       t1, s7, t5
                  vxor.vx    v12,v21,s3
                  vmornot.mm v24,v10,v7
                  srai       a6, s0, 29
                  viota.m v29,v11
                  vmsgtu.vi  v4,v21,0,v0.t
                  vmax.vx    v0,v13,a0
                  vmsle.vi   v10,v30,0
                  vid.v v8
                  vor.vv     v27,v30,v2,v0.t
                  vminu.vx   v9,v21,t5
                  vmsleu.vv  v16,v18,v3
                  vmsleu.vi  v27,v11,0
                  mul        ra, s8, s5
                  mulh       s6, a6, sp
                  sra        a5, zero, a4
                  vmulh.vx   v30,v24,s3
                  vslide1up.vx v7,v28,t3,v0.t
                  remu       t2, a4, s4
                  vminu.vx   v28,v16,a4,v0.t
                  addi       t6, a5, -672
                  vmv.x.s zero,v22
                  div        t5, t0, t0
                  vmsbf.m v18,v7
                  vmv.v.i v9,0
                  vfirst.m zero,v14
                  vmv.s.x v0,s4
                  vmsne.vv   v18,v17,v23,v0.t
                  vmand.mm   v4,v20,v20
                  vslide1down.vx v20,v12,ra
                  sltu       s7, a5, t3
                  andi       sp, s4, 349
                  mulhsu     s0, s4, s0
                  vrgather.vi v0,v23,0
                  vmulhsu.vv v12,v28,v1
                  andi       s5, s4, -25
                  xor        t0, s1, s1
                  vmaxu.vv   v23,v10,v17
                  vmacc.vv   v3,v15,v22,v0.t
                  vrgather.vi v9,v17,0
                  vmsgtu.vi  v14,v11,0
                  vand.vx    v25,v20,ra,v0.t
                  vrgather.vx v20,v27,a7,v0.t
                  vmul.vx    v4,v12,a4
                  mul        a4, s4, a6
                  and        tp, a2, zero
                  xori       s7, a6, 162
                  vmsif.m v17,v19,v0.t
                  sub        a3, t5, s1
                  vxor.vi    v31,v12,0,v0.t
                  vmnor.mm   v10,v23,v8
                  div        t5, s4, s8
                  vmand.mm   v11,v21,v25
                  vslide1up.vx v14,v28,t2
                  srli       s5, t3, 20
                  vslide1down.vx v14,v25,s4,v0.t
                  vmor.mm    v8,v14,v10
                  vmv.s.x v6,tp
                  add        t4, t1, s1
                  vid.v v19
                  vmsgtu.vx  v20,v7,s3
                  vmax.vv    v4,v28,v21,v0.t
                  or         s7, a6, s0
                  vmul.vv    v18,v11,v0,v0.t
                  vsbc.vvm   v20,v30,v8,v0
                  vid.v v7,v0.t
                  mul        s6, s6, a3
                  sll        a1, s8, a6
                  rem        t4, a7, s2
                  sra        s8, a7, s8
                  sra        a1, a0, t3
                  vmnand.mm  v0,v31,v0
                  vmadd.vx   v28,sp,v22
                  mulh       sp, s0, t1
                  xor        a3, a7, t3
                  vmulhsu.vx v0,v11,a6
                  vmulh.vx   v14,v27,t2,v0.t
                  vmsne.vi   v9,v26,0,v0.t
                  vmin.vv    v3,v0,v6
                  add        t0, t1, s11
                  vslideup.vx v15,v6,t6,v0.t
                  or         a2, s1, a5
                  srl        a1, s10, ra
                  vmor.mm    v3,v14,v2
                  vmsne.vi   v24,v8,0,v0.t
                  vid.v v11
                  vmslt.vv   v21,v1,v16,v0.t
                  vand.vx    v22,v31,a1,v0.t
                  add        ra, a4, s11
                  vmulhu.vv  v26,v11,v0
                  vor.vi     v11,v16,0,v0.t
                  vmsle.vi   v24,v20,0
                  vsbc.vvm   v31,v31,v5,v0
                  vrsub.vi   v14,v5,0,v0.t
                  vmnor.mm   v4,v10,v25
                  sltu       s8, gp, a2
                  mul        a0, t5, a2
                  vmv.x.s zero,v29
                  vmxor.mm   v15,v10,v11
                  rem        a0, ra, s0
                  vmslt.vx   v10,v30,a2
                  srl        s5, s1, s5
                  viota.m v10,v30
                  srai       s4, s1, 8
                  or         s6, s0, s9
                  vmv.s.x v30,a4
                  and        gp, t5, s0
                  vrsub.vi   v3,v11,0
                  srli       t1, t4, 30
                  mulh       t6, a6, sp
                  vmxnor.mm  v10,v25,v31
                  vmxnor.mm  v25,v23,v12
                  vmul.vx    v31,v3,t1
                  slti       t0, sp, -630
                  mulhsu     s2, s1, t1
                  vmsle.vi   v4,v13,0,v0.t
                  vmsif.m v17,v14,v0.t
                  xor        s1, sp, s3
                  vrgather.vi v10,v18,0,v0.t
                  and        a0, t3, tp
                  vmv.v.x v27,s5
                  vmseq.vi   v7,v10,0,v0.t
                  add        t3, a3, s7
                  vsrl.vv    v7,v30,v20,v0.t
                  vmsle.vx   v5,v25,s9,v0.t
                  vrgather.vi v14,v20,0
                  xori       a0, tp, -220
                  mulhsu     t3, s6, a3
                  viota.m v11,v26,v0.t
                  vslide1down.vx v6,v0,s0,v0.t
                  divu       a2, t6, a7
                  vminu.vx   v9,v25,s5,v0.t
                  srli       a2, s5, 19
                  mul        s0, s1, a4
                  vmsgt.vi   v10,v16,0
                  or         t0, t0, a5
                  vmadd.vx   v25,s8,v12
                  andi       t1, a2, 748
                  vor.vv     v0,v18,v25
                  vadd.vv    v24,v26,v27
                  vsub.vx    v14,v30,t6,v0.t
                  vmin.vx    v8,v12,t2
                  vmsltu.vx  v10,v2,s9
                  vmv.x.s zero,v29
                  vmor.mm    v0,v19,v11
                  vmor.mm    v16,v27,v19
                  vslide1up.vx v9,v28,a4,v0.t
                  vsra.vv    v20,v1,v7
                  srl        a7, zero, s0
                  srai       s8, s7, 30
                  vmnand.mm  v20,v11,v19
                  vsra.vi    v8,v16,0,v0.t
                  vmxor.mm   v20,v12,v24
                  vrgather.vv v28,v25,v20,v0.t
                  vrsub.vx   v29,v11,s2,v0.t
                  add        a2, a2, s2
                  vmsle.vi   v5,v3,0,v0.t
                  vmor.mm    v31,v10,v20
                  vmax.vx    v28,v10,a7
                  vmsgt.vi   v30,v16,0,v0.t
                  vmv.x.s zero,v27
                  vmsle.vv   v14,v15,v16,v0.t
                  and        t3, t1, t1
                  vmsne.vv   v5,v23,v10
                  mul        a7, ra, s2
                  xori       s0, s10, 193
                  vmin.vv    v19,v2,v27
                  srl        a4, s11, ra
                  vxor.vv    v11,v29,v31
                  vslideup.vx v2,v23,a0,v0.t
                  vmulh.vv   v4,v6,v29
                  ori        a4, s2, -308
                  vminu.vx   v21,v7,a2
                  vmulhsu.vx v1,v6,sp
                  vmv.s.x v16,s7
                  vmulh.vx   v16,v18,sp,v0.t
                  vmsleu.vx  v24,v18,gp
                  addi       t1, t5, 402
                  or         a5, t2, t5
                  vslide1down.vx v18,v4,a5,v0.t
                  vsbc.vxm   v4,v24,s1,v0
                  vmandnot.mm v11,v26,v0
                  auipc      t5, 820230
                  vmxor.mm   v8,v17,v14
                  rem        s7, t2, s7
                  div        t3, gp, t1
                  slti       s2, s8, -791
                  vmxor.mm   v5,v13,v24
                  lui        a3, 454356
                  vslide1up.vx v2,v8,a7,v0.t
                  vfirst.m zero,v11
                  srli       s6, s3, 13
                  sll        s8, a5, s8
                  add        t3, a4, a0
                  vmandnot.mm v31,v20,v10
                  vmnor.mm   v26,v17,v2
                  vmacc.vx   v27,a4,v25,v0.t
                  remu       s7, t6, t2
                  srli       a3, a6, 17
                  vslide1down.vx v4,v23,sp
                  vmandnot.mm v0,v30,v14
                  add        t1, s4, s3
                  add        a1, t1, ra
                  lui        s5, 130633
                  vmaxu.vx   v16,v5,s9
                  vmul.vx    v4,v8,s5
                  vmsbf.m v22,v20
                  vmseq.vx   v24,v1,a7
                  sltiu      a3, a6, -935
                  vrsub.vi   v4,v7,0
                  xori       s7, a0, -100
                  vslideup.vx v30,v28,s10,v0.t
                  vsll.vx    v12,v27,s2,v0.t
                  vmsltu.vv  v16,v19,v10,v0.t
                  mulhu      t1, s3, a3
                  mulh       zero, t4, s10
                  vmsgt.vx   v6,v18,a6,v0.t
                  sll        a2, s6, t4
                  vsra.vi    v28,v27,0,v0.t
                  vsrl.vi    v9,v23,0,v0.t
                  vmv.x.s zero,v25
                  vmseq.vi   v25,v8,0
                  vmin.vv    v11,v15,v30
                  vmaxu.vv   v6,v4,v31
                  sltiu      t4, a1, 238
                  sltiu      s2, s9, 362
                  vrsub.vi   v17,v1,0
                  remu       zero, a0, s4
                  srli       a7, s10, 15
                  vmsleu.vv  v9,v19,v16,v0.t
                  vfirst.m zero,v1,v0.t
                  sltu       ra, t3, s2
                  vmv.s.x v1,s0
                  vmsne.vi   v5,v12,0,v0.t
                  xori       s11, s2, -162
                  sltu       s7, a0, s1
                  vslidedown.vx v10,v12,gp,v0.t
                  vadd.vx    v30,v11,s6
                  lui        a4, 140467
                  vmv.v.i v4,0
                  vmand.mm   v21,v26,v30
                  vmv.v.x v15,t4
                  vadd.vv    v8,v23,v14
                  sra        a3, s7, s4
                  slti       a4, t6, -317
                  vmsif.m v29,v1,v0.t
                  vsll.vi    v28,v12,0,v0.t
                  div        t0, s3, gp
                  vmulhu.vx  v5,v26,t6
                  slti       a2, a2, -68
                  vmslt.vv   v31,v9,v27
                  slli       s8, s11, 26
                  divu       gp, a4, s11
                  vmax.vv    v12,v15,v19,v0.t
                  and        t3, s10, ra
                  ori        s11, t4, 339
                  vslidedown.vi v17,v16,0,v0.t
                  vmaxu.vx   v3,v1,a7,v0.t
                  vslidedown.vx v28,v11,s8,v0.t
                  add        a4, s2, s6
                  ori        s4, t4, -499
                  vmin.vx    v12,v11,s10
                  sll        s6, t2, t6
                  vmacc.vv   v18,v16,v19
                  srl        ra, s4, a7
                  vadc.vxm   v13,v6,sp,v0
                  vminu.vv   v14,v2,v13,v0.t
                  mulhu      t2, s6, t6
                  vmulhsu.vv v31,v22,v12,v0.t
                  vand.vx    v1,v7,s3
                  divu       a4, t6, a3
                  vfirst.m zero,v24
                  vfirst.m zero,v11,v0.t
                  remu       s5, sp, a5
                  vmaxu.vx   v31,v24,gp,v0.t
                  vmin.vv    v4,v16,v14
                  vmsif.m v21,v10,v0.t
                  vmornot.mm v8,v8,v19
                  vmseq.vx   v6,v15,tp,v0.t
                  vmandnot.mm v24,v30,v17
                  sltu       t2, a7, s11
                  vadd.vi    v15,v8,0,v0.t
                  ori        t5, s0, 297
                  vrgather.vx v17,v4,t3
                  vfirst.m zero,v6
                  vmsleu.vi  v25,v23,0,v0.t
                  sll        t2, s10, t5
                  slti       t2, t0, -211
                  vmslt.vx   v14,v4,s11
                  add        gp, s7, a7
                  srl        s5, ra, s1
                  vslide1up.vx v4,v26,s0,v0.t
                  vmsltu.vv  v14,v27,v5
                  vminu.vx   v22,v1,sp,v0.t
                  vmacc.vv   v10,v19,v15
                  vand.vi    v0,v3,0
                  vrgather.vx v15,v19,s2
                  vmul.vv    v7,v10,v27,v0.t
                  vmv.v.x v12,tp
                  vxor.vi    v5,v1,0,v0.t
                  vmor.mm    v21,v13,v13
                  vminu.vv   v3,v25,v11
                  vor.vx     v22,v15,s7,v0.t
                  vmsleu.vi  v14,v0,0
                  vslidedown.vi v8,v26,0
                  vsrl.vx    v6,v14,s4,v0.t
                  sll        a1, a7, s6
                  vmor.mm    v6,v29,v12
                  vfirst.m zero,v15
                  srli       s11, s3, 14
                  sra        s5, tp, s3
                  vadc.vim   v30,v9,0,v0
                  vadc.vim   v20,v7,0,v0
                  vfirst.m zero,v6
                  vmacc.vv   v26,v18,v20,v0.t
                  mul        t2, s1, s11
                  vmsif.m v21,v6,v0.t
                  rem        gp, a6, s0
                  viota.m v13,v21
                  vmandnot.mm v30,v17,v14
                  vfirst.m zero,v11
                  vpopc.m zero,v9,v0.t
                  vsbc.vvm   v28,v25,v13,v0
                  vmseq.vx   v27,v24,s10,v0.t
                  vmv.x.s zero,v29
                  vmandnot.mm v5,v3,v23
                  vmax.vx    v5,v3,t6
                  div        tp, s7, t0
                  xor        a3, s2, t4
                  sltiu      a7, t4, 92
                  vslide1down.vx v21,v29,a7
                  auipc      s11, 702841
                  vmandnot.mm v2,v27,v29
                  vmornot.mm v21,v3,v21
                  slti       tp, zero, 41
                  vmornot.mm v28,v24,v1
                  vmin.vx    v5,v7,t6
                  vrsub.vi   v15,v10,0,v0.t
                  srai       a0, a1, 18
                  srai       t0, s6, 27
                  vand.vv    v16,v22,v0,v0.t
                  slt        zero, zero, t6
                  vmsof.m v22,v26,v0.t
                  vmaxu.vx   v21,v30,a3
                  vrsub.vi   v12,v11,0,v0.t
                  andi       a1, s11, 473
                  srai       s7, s4, 10
                  srai       a7, a4, 26
                  vmand.mm   v21,v26,v6
                  vmsif.m v13,v12
                  vmsne.vv   v24,v9,v12
                  vmv.v.v v14,v1
                  sltu       t1, s10, t5
                  slt        s1, s7, t1
                  vmsbf.m v2,v18
                  viota.m v3,v27
                  vmsleu.vi  v18,v26,0,v0.t
                  vsrl.vx    v16,v27,t2,v0.t
                  or         t0, t2, s11
                  vmnor.mm   v18,v13,v23
                  or         a2, a3, tp
                  and        s5, t2, s1
                  vmsif.m v10,v1
                  viota.m v9,v2,v0.t
                  sub        s8, s3, t4
                  vmacc.vx   v31,a6,v12,v0.t
                  vfirst.m zero,v25
                  mulhu      a3, s7, t5
                  vmand.mm   v30,v23,v16
                  vmaxu.vx   v30,v30,t1,v0.t
                  vmax.vx    v3,v12,s8
                  slli       s7, tp, 3
                  vmnor.mm   v26,v27,v21
                  sll        s6, t3, t2
                  vmornot.mm v14,v14,v25
                  vadc.vim   v18,v3,0,v0
                  vmulhu.vv  v10,v20,v31,v0.t
                  vmulhsu.vx v18,v7,s10,v0.t
                  div        ra, t1, a0
                  vslidedown.vx v10,v26,s0,v0.t
                  lui        tp, 453107
                  and        t3, s10, t3
                  vmslt.vv   v22,v27,v7
                  auipc      a3, 1024759
                  vmornot.mm v5,v21,v25
                  vmslt.vv   v23,v12,v6
                  viota.m v23,v0,v0.t
                  sltiu      s5, s10, 603
                  vmulh.vv   v7,v8,v11,v0.t
                  vslide1up.vx v25,v27,s2
                  vand.vi    v8,v27,0
                  vmandnot.mm v26,v31,v28
                  mul        a3, sp, a4
                  or         s0, a4, s0
                  vmsif.m v23,v26
                  vmsof.m v19,v10,v0.t
                  vrsub.vi   v21,v15,0
                  vmv.x.s zero,v31
                  xori       t5, t2, -420
                  srli       a4, s0, 27
                  vmandnot.mm v1,v8,v31
                  mul        ra, ra, s10
                  vmacc.vv   v7,v25,v1,v0.t
                  vmandnot.mm v0,v4,v26
                  vrgather.vv v20,v2,v6
                  sra        s6, s1, s10
                  sra        a7, sp, s3
                  vmsgtu.vi  v0,v21,0
                  vrsub.vi   v29,v5,0,v0.t
                  vpopc.m zero,v18,v0.t
                  lui        t1, 193217
                  ori        t1, ra, -168
                  vand.vi    v19,v20,0,v0.t
                  vmsbf.m v10,v1
                  vsll.vi    v2,v24,0,v0.t
                  srli       s8, s2, 30
                  vmaxu.vx   v10,v26,s3,v0.t
                  vmv.s.x v28,t5
                  vrsub.vi   v20,v23,0
                  add        a2, s5, s4
                  mul        s4, s0, s3
                  vmslt.vx   v4,v8,gp
                  divu       a6, s11, s3
                  rem        t3, t6, s3
                  vmin.vv    v26,v29,v20
                  slti       s5, s11, -532
                  vmand.mm   v6,v15,v3
                  vmadd.vx   v17,s10,v11
                  vmsif.m v1,v30,v0.t
                  vrgather.vv v22,v30,v15,v0.t
                  vpopc.m zero,v0
                  srl        a0, t6, a7
                  mul        s5, t5, tp
                  sra        s1, s5, gp
                  vsra.vx    v13,v31,a0,v0.t
                  vmnor.mm   v30,v3,v20
                  rem        a4, a4, s7
                  vslide1down.vx v29,v13,s11
                  vmulhsu.vv v22,v1,v19
                  slt        s2, t0, s8
                  vxor.vx    v31,v23,t6,v0.t
                  sltiu      t5, s6, -460
                  vmaxu.vx   v16,v18,s10,v0.t
                  vmsgtu.vi  v6,v28,0
                  vmand.mm   v8,v22,v12
                  vmulhsu.vx v28,v14,s0,v0.t
                  sltu       s5, t2, a7
                  vmulh.vv   v28,v23,v9
                  vmornot.mm v29,v7,v23
                  vmxnor.mm  v10,v14,v8
                  vmaxu.vv   v28,v27,v6,v0.t
                  vpopc.m zero,v29,v0.t
                  vmulhsu.vv v1,v23,v11
                  lui        a7, 579121
                  vmseq.vx   v18,v24,s5
                  addi       tp, s8, 294
                  vsub.vx    v14,v27,s7,v0.t
                  vsll.vv    v9,v10,v1,v0.t
                  mulhsu     a7, a1, s7
                  addi       t0, a0, -314
                  vmsleu.vx  v21,v2,t1,v0.t
                  sub        t0, a6, a2
                  or         gp, s8, t1
                  vmadd.vx   v7,a7,v26
                  xori       t6, s2, 441
                  divu       t3, gp, t3
                  sltu       t6, s2, a2
                  vrgather.vv v30,v31,v6
                  vmandnot.mm v31,v24,v22
                  mulhu      a0, s10, s9
                  vmsof.m v31,v0
                  vmv.s.x v23,s3
                  vmornot.mm v8,v30,v18
                  vmsne.vv   v8,v31,v26
                  vfirst.m zero,v6
                  vmax.vv    v23,v26,v10
                  vxor.vx    v31,v17,a5,v0.t
                  mulh       a7, s7, t0
                  vmsgt.vi   v6,v20,0
                  rem        a7, s11, a1
                  vsbc.vxm   v21,v21,s6,v0
                  xor        s4, s3, gp
                  vmsgtu.vx  v10,v9,a3,v0.t
                  vmacc.vv   v25,v0,v22
                  vmin.vv    v7,v17,v28,v0.t
                  vxor.vx    v20,v16,a4,v0.t
                  vxor.vi    v7,v29,0
                  and        sp, s3, t4
                  vmacc.vv   v24,v18,v31,v0.t
                  vsll.vv    v18,v14,v1,v0.t
                  vmand.mm   v23,v24,v10
                  vmulh.vx   v30,v18,s8,v0.t
                  auipc      s7, 583286
                  vrgather.vv v4,v21,v15
                  vid.v v15,v0.t
                  vsrl.vv    v13,v6,v11
                  slt        s4, a7, t3
                  remu       gp, t6, s6
                  vmsleu.vx  v29,v16,s7,v0.t
                  vmsne.vv   v31,v9,v22
                  vmv.x.s zero,v13
                  auipc      t2, 399338
                  vmacc.vv   v5,v20,v30,v0.t
                  vslide1down.vx v14,v1,s6,v0.t
                  vmsof.m v4,v1,v0.t
                  vminu.vv   v7,v6,v24,v0.t
                  vsra.vi    v23,v21,0,v0.t
                  vmacc.vv   v18,v25,v22,v0.t
                  vxor.vi    v0,v3,0
                  vslidedown.vi v24,v13,0
                  srli       s8, ra, 5
                  srai       zero, s11, 3
                  sltu       t1, a1, s2
                  slti       s8, t5, 982
                  mulhu      t4, s2, t1
                  vrsub.vx   v1,v10,tp
                  vmand.mm   v1,v2,v30
                  vmnand.mm  v1,v2,v4
                  vsra.vi    v29,v16,0,v0.t
                  vmulhsu.vv v18,v26,v23,v0.t
                  sub        a1, s9, s0
                  rem        t4, t6, s1
                  vsll.vi    v10,v7,0,v0.t
                  vsrl.vi    v22,v17,0
                  vfirst.m zero,v11
                  vmnor.mm   v15,v5,v9
                  vmslt.vv   v18,v16,v6,v0.t
                  vminu.vv   v20,v1,v27,v0.t
                  srai       s8, a2, 29
                  slti       t1, a4, 496
                  vmnand.mm  v10,v22,v27
                  vmsof.m v21,v0,v0.t
                  vid.v v4,v0.t
                  vmv.v.i v12,0
                  vmsgt.vx   v23,v12,a1,v0.t
                  vmsne.vi   v2,v19,0,v0.t
                  vpopc.m zero,v16,v0.t
                  mulhsu     s2, t6, a6
                  or         a0, a7, s8
                  vslideup.vi v2,v11,0
                  vmxor.mm   v19,v13,v26
                  vid.v v26,v0.t
                  vmsgt.vi   v21,v27,0
                  vmulh.vv   v20,v26,v10,v0.t
                  vminu.vx   v18,v31,t2,v0.t
                  viota.m v9,v18,v0.t
                  slt        a3, s6, a4
                  vsra.vv    v29,v14,v30,v0.t
                  vmnor.mm   v23,v15,v13
                  srli       a5, t1, 25
                  sll        t5, sp, sp
                  vmulhsu.vx v29,v22,a7,v0.t
                  vmaxu.vx   v30,v15,t3
                  rem        t0, s11, s2
                  srai       t2, a4, 23
                  vmulhu.vv  v24,v10,v21
                  addi       a5, s2, 1000
                  sll        t0, t5, t6
                  srl        t5, s10, ra
                  vid.v v16,v0.t
                  ori        sp, gp, -173
                  vslide1down.vx v10,v21,a6,v0.t
                  sltiu      s4, t2, -24
                  vmsleu.vx  v19,v28,s3,v0.t
                  mulhsu     s0, s2, s6
                  vmulh.vx   v8,v7,s11,v0.t
                  remu       tp, a0, t3
                  vmsltu.vv  v4,v7,v26,v0.t
                  vor.vi     v5,v17,0
                  vmslt.vv   v13,v10,v29
                  vmulhu.vv  v21,v1,v13
                  vmand.mm   v6,v27,v3
                  or         t5, s7, s9
                  vslide1up.vx v10,v8,tp,v0.t
                  lui        s4, 833961
                  xor        ra, s10, a5
                  vpopc.m zero,v11
                  vsll.vi    v29,v2,0,v0.t
                  vmxnor.mm  v18,v20,v27
                  vxor.vx    v22,v14,a6
                  srl        a6, gp, t0
                  vmsbf.m v20,v23
                  rem        ra, a1, s11
                  vadc.vim   v27,v31,0,v0
                  ori        s8, a4, 1000
                  rem        a6, sp, t0
                  slti       a2, s3, 157
                  vmnand.mm  v20,v25,v25
                  sll        a6, t5, a3
                  vpopc.m zero,v18
                  vslidedown.vi v22,v4,0
                  vrgather.vv v28,v9,v19,v0.t
                  vslide1down.vx v20,v6,s6,v0.t
                  vsub.vx    v16,v2,a3,v0.t
                  xori       a1, a6, 661
                  vsrl.vx    v2,v24,s5
                  vadd.vi    v28,v1,0,v0.t
                  vmnand.mm  v17,v11,v24
                  vmsltu.vx  v12,v1,a6,v0.t
                  vmor.mm    v30,v10,v13
                  vsbc.vxm   v20,v20,a7,v0
                  vmsof.m v8,v12
                  vmsgtu.vi  v25,v30,0,v0.t
                  vadd.vx    v14,v16,t0,v0.t
                  vfirst.m zero,v12,v0.t
                  vmulhsu.vx v17,v21,s7
                  mulhsu     s7, t3, s4
                  vadc.vim   v12,v4,0,v0
                  vmand.mm   v17,v11,v29
                  vmadd.vx   v14,s6,v15
                  vmsif.m v12,v16
                  vxor.vx    v13,v14,t6
                  div        t4, t2, gp
                  vslide1down.vx v8,v30,s4
                  auipc      t4, 318894
                  vslideup.vx v15,v25,s8
                  vmxnor.mm  v7,v23,v6
                  auipc      t0, 369900
                  sltu       s6, tp, a6
                  vsrl.vv    v10,v4,v0,v0.t
                  vsra.vi    v5,v18,0,v0.t
                  vmsgt.vx   v3,v1,tp,v0.t
                  vmornot.mm v15,v11,v14
                  vmxor.mm   v31,v6,v16
                  vmsof.m v13,v28
                  vmsof.m v1,v7
                  vmsne.vi   v30,v14,0,v0.t
                  vsll.vx    v25,v0,tp
                  vmulh.vx   v11,v0,s5,v0.t
                  div        a2, a1, t1
                  sltiu      t0, zero, -568
                  mul        s11, a3, s4
                  or         s1, a4, a6
                  vmv.s.x v7,a1
                  srai       s11, s7, 28
                  vmxor.mm   v11,v25,v13
                  vrgather.vx v19,v13,t0
                  vand.vx    v12,v16,a7,v0.t
                  vid.v v8
                  ori        a6, a1, 656
                  vmseq.vv   v12,v9,v4
                  vmxor.mm   v10,v7,v30
                  vmaxu.vx   v20,v30,tp,v0.t
                  xor        a2, a2, t1
                  sra        a1, s8, s0
                  vmsgt.vi   v19,v29,0,v0.t
                  vsrl.vi    v31,v16,0,v0.t
                  vmnor.mm   v16,v27,v31
                  mulhu      t0, t2, t6
                  vslide1down.vx v9,v30,a3,v0.t
                  srli       t6, t6, 29
                  xor        s0, t2, t1
                  vmax.vx    v21,v20,a7,v0.t
                  vmsif.m v8,v16,v0.t
                  vmv.v.v v24,v5
                  vand.vx    v10,v5,s6
                  vmsne.vv   v1,v8,v26,v0.t
                  ori        t2, s3, 592
                  vslidedown.vx v30,v2,t3
                  vmsif.m v11,v18
                  div        t4, s5, t0
                  sra        t2, a0, ra
                  vmornot.mm v10,v8,v18
                  vslideup.vx v23,v17,s3,v0.t
                  slt        s4, tp, gp
                  srai       ra, s8, 13
                  vmsle.vi   v2,v12,0,v0.t
                  vminu.vx   v20,v6,gp,v0.t
                  vmulhsu.vv v31,v22,v9,v0.t
                  vadc.vim   v17,v22,0,v0
                  vsbc.vvm   v8,v7,v15,v0
                  slti       sp, ra, 469
                  xor        a0, t0, a1
                  divu       t1, a0, s3
                  vmv.v.x v23,s4
                  sll        a1, a5, t6
                  vsra.vv    v29,v20,v9
                  vmnor.mm   v20,v4,v2
                  and        gp, s10, t3
                  vpopc.m zero,v3
                  mulhu      t5, t1, s11
                  xori       s11, t6, 838
                  vmsne.vx   v0,v2,a6
                  lui        t6, 981115
                  vmax.vx    v23,v12,s7
                  vmul.vx    v2,v6,s10
                  mul        t6, ra, s3
                  vsub.vv    v9,v20,v27
                  vmadd.vx   v31,s9,v7
                  and        s5, tp, a4
                  vmsgtu.vx  v31,v8,a7
                  sra        a3, s8, s9
                  vmandnot.mm v10,v6,v10
                  vmsne.vi   v23,v17,0,v0.t
                  vor.vx     v30,v1,t2
                  vmin.vv    v17,v9,v18,v0.t
                  slt        a2, a5, s3
                  vmsif.m v9,v24
                  sltiu      a3, t2, 719
                  vmadd.vx   v14,s2,v5,v0.t
                  slli       s5, a1, 31
                  vmsle.vx   v17,v0,t3,v0.t
                  vid.v v4
                  vmsgtu.vi  v26,v25,0,v0.t
                  vslidedown.vi v22,v12,0,v0.t
                  vid.v v6
                  mulhu      a7, t2, tp
                  div        zero, a5, sp
                  sra        a5, s10, t2
                  vmxor.mm   v21,v24,v12
                  or         s1, a4, gp
                  vmsif.m v15,v24,v0.t
                  vmsif.m v26,v19,v0.t
                  sra        t3, s11, t6
                  vmand.mm   v19,v4,v9
                  sll        a4, t5, s9
                  vsrl.vx    v21,v1,s7,v0.t
                  vmand.mm   v25,v18,v11
                  mulhsu     t6, s8, s1
                  mulhsu     s5, t5, a3
                  lui        a0, 623781
                  vmin.vv    v4,v11,v24
                  srli       a6, t4, 31
                  addi       a3, s6, 58
                  rem        s5, t4, ra
                  vsll.vi    v22,v13,0
                  vfirst.m zero,v2,v0.t
                  xor        s8, s0, a1
                  viota.m v5,v6
                  vrsub.vi   v22,v0,0,v0.t
                  vmv.s.x v0,tp
                  mulhu      a5, t0, s10
                  viota.m v16,v27
                  vmacc.vv   v2,v7,v24
                  slti       a3, t2, -566
                  divu       a0, s2, zero
                  mulh       s5, s7, zero
                  vmornot.mm v6,v22,v9
                  viota.m v23,v4
                  sub        a7, s6, t2
                  vmax.vx    v13,v5,t0,v0.t
                  vmsbf.m v3,v9,v0.t
                  and        t0, s4, s4
                  vmsleu.vv  v0,v18,v16
                  vmv.x.s zero,v13
                  rem        a4, s4, sp
                  lui        a4, 607938
                  mulhsu     t4, t3, a6
                  lui        a1, 624239
                  vid.v v26,v0.t
                  vminu.vx   v3,v0,t2,v0.t
                  remu       s8, t0, t4
                  rem        a4, t6, a6
                  sltiu      a6, s5, -910
                  vmv.x.s zero,v20
                  srli       a6, tp, 8
                  and        a2, s4, s6
                  vmnor.mm   v31,v5,v30
                  div        t1, t5, s0
                  vmulh.vv   v16,v9,v13
                  vsll.vi    v19,v10,0
                  xori       a2, s1, 234
                  vrsub.vx   v15,v21,t5
                  vmxnor.mm  v17,v3,v9
                  divu       a0, s5, t0
                  remu       gp, ra, ra
                  ori        a1, s9, -850
                  vmsgtu.vx  v27,v24,t5,v0.t
                  vxor.vv    v15,v11,v15,v0.t
                  or         a7, s9, s0
                  lui        sp, 865467
                  vmxor.mm   v18,v21,v23
                  ori        tp, s5, -647
                  vslideup.vx v1,v25,zero,v0.t
                  and        s1, ra, ra
                  andi       a2, a0, 548
                  vmsof.m v23,v15,v0.t
                  vmsgt.vi   v28,v10,0
                  vmsif.m v30,v13
                  slli       s4, s1, 0
                  vfirst.m zero,v31,v0.t
                  vmul.vx    v28,v30,s7,v0.t
                  vfirst.m zero,v1,v0.t
                  vadc.vim   v28,v4,0,v0
                  vsra.vv    v2,v14,v15
                  sub        t2, a3, s7
                  vand.vv    v15,v12,v31
                  addi       a1, s5, 511
                  slt        s5, s4, ra
                  vmor.mm    v17,v26,v13
                  vmnand.mm  v20,v14,v9
                  vfirst.m zero,v4,v0.t
                  vmor.mm    v17,v5,v6
                  div        gp, s11, tp
                  vmaxu.vv   v31,v4,v27
                  sltiu      s8, gp, -690
                  sltu       a5, sp, t0
                  vmin.vv    v26,v25,v7
                  sltu       a7, t6, t3
                  vsub.vv    v2,v22,v30,v0.t
                  vsub.vv    v3,v31,v27
                  srai       s1, gp, 3
                  vmsle.vv   v26,v17,v16
                  add        a5, s1, s4
                  vmxnor.mm  v6,v3,v31
                  vmsltu.vv  v6,v15,v29
                  vslideup.vx v22,v21,t4,v0.t
                  vmsbf.m v25,v8,v0.t
                  vmsof.m v21,v9
                  mulhu      t1, gp, s1
                  sll        t3, t5, t4
                  xor        s8, a0, s10
                  vmadd.vv   v8,v11,v24,v0.t
                  vmnand.mm  v4,v23,v10
                  rem        s7, s0, t4
                  vsub.vv    v30,v6,v1,v0.t
                  vmsle.vx   v18,v19,sp
                  srli       a4, s5, 23
                  vmsne.vi   v21,v29,0
                  xori       t1, s10, 803
                  div        a1, s5, a4
                  mulh       s2, t3, s0
                  vmsne.vx   v8,v9,a7
                  vmul.vv    v9,v31,v7
                  vmxor.mm   v29,v12,v27
                  vsub.vv    v29,v1,v3
                  vmnand.mm  v2,v7,v8
                  vmulhsu.vv v2,v18,v2
                  and        a0, s10, sp
                  vadd.vv    v12,v20,v17
                  vmslt.vv   v28,v4,v22,v0.t
                  vmxor.mm   v5,v1,v21
                  vmsgt.vx   v25,v5,s10
                  sub        a0, zero, gp
                  vmseq.vv   v8,v5,v10
                  andi       t0, t6, -832
                  vmulhsu.vv v1,v2,v11
                  vid.v v31
                  vrgather.vi v9,v27,0,v0.t
                  slti       t6, t2, 959
                  vslideup.vi v7,v12,0
                  srai       zero, a6, 18
                  remu       a3, a2, s11
                  slli       tp, t2, 23
                  vmsof.m v8,v0
                  divu       sp, sp, zero
                  vmsgt.vi   v7,v13,0
                  vmacc.vx   v13,a1,v0
                  vmulhsu.vv v23,v26,v2
                  mulhsu     s11, t4, zero
                  or         t6, s7, s4
                  vmslt.vx   v4,v7,a7
                  vid.v v19,v0.t
                  vmacc.vv   v14,v10,v4
                  vmulh.vx   v8,v11,a3,v0.t
                  mulh       zero, t0, s5
                  vmnor.mm   v12,v18,v0
                  vrgather.vx v19,v12,t1
                  addi       tp, s11, 600
                  vmsleu.vx  v0,v21,t2
                  vmacc.vx   v17,s9,v1,v0.t
                  vmxnor.mm  v27,v14,v25
                  xor        a7, ra, t4
                  vmslt.vx   v20,v8,tp,v0.t
                  vrgather.vx v12,v0,t1,v0.t
                  xor        s11, gp, a3
                  vmsif.m v18,v17
                  vmseq.vx   v2,v14,t5
                  vmsne.vx   v6,v23,t3
                  sra        s0, t4, a2
                  vmsgtu.vx  v1,v15,a7,v0.t
                  vmsgtu.vx  v21,v14,s7,v0.t
                  auipc      s8, 701773
                  rem        a6, t3, a6
                  vmxor.mm   v4,v27,v23
                  vmandnot.mm v12,v7,v15
                  ori        s7, s7, 899
                  vsll.vx    v11,v13,a0
                  rem        a7, s5, a2
                  vmornot.mm v0,v25,v8
                  vmornot.mm v18,v2,v14
                  vmax.vv    v11,v17,v24
                  xor        sp, ra, s1
                  slli       s11, a4, 20
                  vmsne.vx   v31,v28,s3
                  xor        a3, s5, s4
                  rem        s11, t4, ra
                  vmxor.mm   v5,v1,v11
                  vmor.mm    v4,v26,v20
                  vrsub.vi   v9,v16,0
                  vmand.mm   v6,v2,v18
                  vmul.vv    v3,v31,v0
                  vmnor.mm   v1,v30,v12
                  vsub.vv    v16,v30,v18,v0.t
                  vmslt.vx   v2,v30,a7,v0.t
                  vmor.mm    v25,v19,v31
                  rem        s2, s11, s1
                  vmax.vx    v21,v20,t2
                  div        a7, t1, a2
                  vmandnot.mm v4,v17,v12
                  viota.m v20,v4
                  slli       t0, s11, 11
                  xor        t6, zero, s7
                  lui        s0, 665133
                  vmsleu.vi  v23,v0,0,v0.t
                  remu       t3, s2, ra
                  ori        s8, t5, 196
                  vfirst.m zero,v18
                  vslidedown.vi v30,v27,0
                  mulhsu     t5, s11, zero
                  srli       a0, t1, 22
                  and        zero, s6, tp
                  vmsleu.vi  v28,v9,0
                  vxor.vv    v7,v13,v30
                  vmaxu.vx   v14,v26,s8,v0.t
                  xori       a3, t4, -211
                  vmxor.mm   v0,v22,v13
                  andi       t0, s11, 33
                  sub        t6, a6, a0
                  vmsleu.vi  v18,v8,0,v0.t
                  slli       t1, s4, 20
                  vsra.vv    v26,v10,v10
                  vslide1down.vx v6,v26,s2
                  vsrl.vx    v31,v24,a6,v0.t
                  ori        a6, s0, -564
                  vmslt.vv   v18,v30,v3
                  viota.m v17,v2,v0.t
                  vmsbf.m v30,v31
                  vsra.vv    v5,v18,v6
                  vrgather.vi v4,v9,0,v0.t
                  xori       s6, t0, -971
                  vmxor.mm   v7,v7,v0
                  andi       s4, s2, -688
                  vslide1up.vx v16,v0,s9,v0.t
                  sltu       a1, a6, s8
                  vslide1down.vx v19,v7,a1,v0.t
                  vmsleu.vv  v9,v27,v26,v0.t
                  vmandnot.mm v15,v27,v27
                  vslide1down.vx v15,v26,t0,v0.t
                  vmsof.m v3,v23
                  srli       gp, a2, 31
                  vmxor.mm   v13,v26,v28
                  vmseq.vv   v16,v1,v24
                  vmand.mm   v14,v5,v3
                  sub        s0, zero, t1
                  vminu.vv   v24,v4,v13
                  vmandnot.mm v19,v14,v31
                  vslide1up.vx v4,v0,s1
                  vrsub.vi   v16,v12,0,v0.t
                  vmnor.mm   v19,v0,v0
                  vslidedown.vi v2,v24,0
                  vxor.vv    v5,v15,v8,v0.t
                  vor.vv     v14,v11,v21
                  sltiu      sp, s4, 187
                  vmseq.vv   v7,v23,v2
                  vid.v v26
                  vmax.vv    v5,v0,v12,v0.t
                  add        a4, a3, a2
                  vmandnot.mm v8,v10,v18
                  divu       s0, tp, a7
                  vmsltu.vx  v7,v5,t3,v0.t
                  vrgather.vv v19,v14,v8,v0.t
                  vmsgtu.vx  v11,v12,t3,v0.t
                  ori        s6, s8, -787
                  vsra.vv    v1,v1,v0,v0.t
                  rem        a0, a0, a3
                  vrsub.vx   v25,v31,zero
                  vmax.vx    v8,v23,s10
                  vslideup.vi v8,v19,0,v0.t
                  remu       s1, t6, a5
                  vpopc.m zero,v24,v0.t
                  div        a7, s3, s1
                  slti       s2, s6, -490
                  or         t5, s3, a5
                  slti       gp, t2, 711
                  vmaxu.vx   v18,v9,s9
                  vmadd.vx   v4,sp,v14,v0.t
                  vid.v v17,v0.t
                  vmsof.m v6,v22,v0.t
                  vslide1down.vx v22,v29,a2
                  vmseq.vx   v1,v13,sp,v0.t
                  vfirst.m zero,v24,v0.t
                  vmulhsu.vv v3,v10,v11,v0.t
                  sub        zero, t1, t1
                  sub        s5, tp, s1
                  vmnand.mm  v22,v10,v22
                  vrsub.vi   v17,v27,0,v0.t
                  slti       t0, s1, -729
                  slli       t6, s0, 30
                  vmsbf.m v14,v29,v0.t
                  vsbc.vxm   v28,v11,t6,v0
                  auipc      t6, 815112
                  vmslt.vv   v30,v0,v16,v0.t
                  vmseq.vv   v16,v5,v27
                  or         t5, t1, t1
                  vmin.vv    v23,v26,v18,v0.t
                  vsrl.vi    v2,v12,0,v0.t
                  vmnand.mm  v0,v6,v2
                  vmulhu.vv  v7,v26,v14,v0.t
                  divu       t2, gp, s2
                  sltiu      s5, t3, -21
                  vsra.vi    v8,v15,0,v0.t
                  srli       a6, t0, 10
                  vmandnot.mm v8,v0,v5
                  vsbc.vxm   v1,v26,s1,v0
                  vslidedown.vi v8,v4,0
                  or         zero, a3, zero
                  vpopc.m zero,v20,v0.t
                  vmsof.m v18,v2
                  vmacc.vv   v2,v7,v19,v0.t
                  vmacc.vv   v11,v7,v29,v0.t
                  slli       s1, a1, 30
                  vmv.s.x v12,a6
                  vid.v v23,v0.t
                  vsbc.vvm   v4,v2,v29,v0
                  vsub.vx    v19,v21,zero,v0.t
                  vslidedown.vx v8,v3,s11,v0.t
                  vmandnot.mm v1,v1,v24
                  mulhsu     tp, t0, ra
                  divu       a2, s10, s0
                  sltiu      s8, a2, 961
                  andi       a6, a6, 910
                  vmulhu.vx  v21,v2,t1
                  vmxnor.mm  v19,v29,v19
                  srli       s11, s6, 3
                  vrgather.vi v2,v5,0,v0.t
                  vslidedown.vi v7,v23,0
                  divu       s4, t6, a5
                  vmulh.vx   v11,v23,sp
                  vmv.x.s zero,v18
                  vid.v v8,v0.t
                  sltu       s2, s6, s7
                  vmaxu.vv   v11,v15,v8,v0.t
                  and        t6, a5, t5
                  vmxor.mm   v4,v8,v31
                  vmandnot.mm v11,v29,v12
                  srli       s0, s8, 28
                  vmulh.vx   v0,v29,a6
                  vmor.mm    v29,v29,v11
                  vmulhu.vx  v30,v13,s8
                  vxor.vv    v6,v9,v16
                  sub        s2, tp, s2
                  vmaxu.vv   v31,v15,v31
                  add        t1, a4, s5
                  vor.vv     v18,v0,v13,v0.t
                  auipc      sp, 838212
                  xori       a2, s4, 540
                  sra        t3, t5, a6
                  vminu.vv   v31,v3,v26
                  vmseq.vi   v21,v14,0,v0.t
                  vmslt.vx   v26,v6,s1,v0.t
                  viota.m v5,v25
                  viota.m v27,v15
                  vslideup.vx v22,v31,a2
                  vmnand.mm  v0,v29,v17
                  vsub.vx    v18,v31,tp,v0.t
                  viota.m v13,v25,v0.t
                  mulh       a7, s7, t5
                  vsra.vx    v18,v14,s3,v0.t
                  mulhu      s0, t3, tp
                  mulhu      gp, tp, s2
                  vmslt.vx   v21,v8,s1,v0.t
                  vslide1down.vx v20,v9,s3,v0.t
                  srl        a1, t6, t5
                  xori       a1, s6, -348
                  srl        a4, a0, t3
                  vmsgt.vi   v3,v22,0
                  vmnor.mm   v16,v7,v17
                  sll        tp, tp, s8
                  srai       t1, s8, 16
                  vadd.vi    v27,v5,0,v0.t
                  or         a4, a0, s8
                  sll        t0, t5, s3
                  vmsgtu.vx  v21,v23,s10
                  vmulh.vv   v18,v31,v14,v0.t
                  srai       t2, a0, 17
                  ori        t6, t4, -405
                  vslideup.vx v5,v17,s1,v0.t
                  vsub.vv    v7,v9,v17,v0.t
                  vmsle.vv   v21,v26,v3,v0.t
                  auipc      a5, 628732
                  vslidedown.vi v15,v25,0
                  vmin.vv    v12,v11,v7,v0.t
                  vmsof.m v28,v18
                  vxor.vx    v21,v18,t3,v0.t
                  vmv.s.x v14,ra
                  vid.v v29
                  vadc.vim   v27,v8,0,v0
                  rem        s11, s5, a1
                  vmor.mm    v20,v28,v26
                  mulh       zero, t6, a5
                  sltu       a4, s7, gp
                  vmulh.vx   v11,v27,zero,v0.t
                  srli       s4, s2, 7
                  lui        s0, 851332
                  vsll.vx    v25,v19,s8,v0.t
                  viota.m v10,v0
                  divu       a0, gp, a4
                  divu       a3, a1, a6
                  vmulhu.vv  v20,v21,v26
                  vrgather.vv v29,v18,v26,v0.t
                  or         s0, a0, t4
                  vmxor.mm   v19,v17,v28
                  ori        s5, ra, 513
                  vpopc.m zero,v16,v0.t
                  divu       a3, s4, t4
                  vslideup.vx v21,v31,a1,v0.t
                  vmin.vx    v2,v3,t5
                  sub        s0, s7, t5
                  vor.vi     v19,v5,0
                  vslide1up.vx v11,v17,a1
                  vmsgtu.vx  v20,v8,s0,v0.t
                  vmv.s.x v3,s6
                  vadd.vx    v20,v10,t2,v0.t
                  vmnor.mm   v23,v5,v10
                  sltiu      a4, s1, 517
                  vmand.mm   v14,v8,v24
                  vmacc.vv   v15,v11,v2,v0.t
                  mul        t1, s1, t2
                  mulhu      t1, t4, s2
                  vmax.vv    v2,v8,v11,v0.t
                  vmsleu.vx  v21,v10,s11,v0.t
                  vmornot.mm v26,v21,v8
                  vor.vx     v5,v11,a4,v0.t
                  xor        t4, a5, a3
                  viota.m v16,v27
                  vmand.mm   v7,v6,v1
                  vmulh.vv   v20,v30,v5,v0.t
                  vrsub.vx   v21,v27,s8,v0.t
                  vmsof.m v14,v11
                  mulhu      s1, gp, s8
                  slt        zero, t1, a2
                  xor        t0, t2, t2
                  xori       tp, sp, 431
                  slli       t6, tp, 21
                  vmax.vv    v12,v16,v19
                  vor.vx     v31,v21,sp,v0.t
                  remu       s8, ra, t1
                  xori       s2, t5, -983
                  vsll.vi    v4,v29,0
                  vmadd.vv   v25,v11,v10,v0.t
                  add        t3, s2, a5
                  or         a6, s8, t6
                  vadd.vi    v19,v5,0
                  srli       s5, s9, 29
                  vmsltu.vx  v21,v23,s7,v0.t
                  sltiu      t5, a6, 365
                  sra        t2, s6, s1
                  xori       s8, t5, 475
                  xori       s5, t2, 221
                  vmul.vx    v22,v3,s1,v0.t
                  auipc      s6, 417242
                  vslideup.vx v5,v20,s1,v0.t
                  auipc      zero, 160759
                  vslide1down.vx v14,v17,s7,v0.t
                  remu       t0, s11, a1
                  vmnand.mm  v17,v28,v27
                  vand.vv    v5,v4,v21,v0.t
                  srli       t5, t2, 3
                  remu       a3, a6, t5
                  vmsle.vi   v7,v4,0,v0.t
                  vsub.vv    v2,v7,v6,v0.t
                  vsll.vx    v3,v19,tp
                  vxor.vv    v24,v15,v27
                  vslide1down.vx v21,v9,ra
                  slli       t6, s2, 30
                  vrgather.vx v18,v9,t0
                  viota.m v18,v23
                  mulhsu     a2, gp, t3
                  mulhsu     s11, s9, s9
                  vor.vx     v24,v16,s9,v0.t
                  vmandnot.mm v19,v8,v19
                  sra        s11, s7, t5
                  lui        sp, 72123
                  vmseq.vx   v29,v27,a5
                  ori        tp, s0, 136
                  vpopc.m zero,v8
                  vrsub.vx   v8,v14,s5
                  vmornot.mm v27,v27,v16
                  vmulh.vx   v17,v9,s7
                  vmandnot.mm v2,v10,v14
                  vsrl.vi    v3,v29,0
                  vmulhsu.vv v19,v2,v18,v0.t
                  vmseq.vx   v28,v23,s7
                  sltiu      tp, s11, -61
                  srai       a3, a1, 23
                  srli       a0, s10, 3
                  vmornot.mm v24,v18,v3
                  vminu.vv   v20,v12,v23,v0.t
                  vmsof.m v6,v19
                  vmnor.mm   v31,v8,v18
                  vmsleu.vx  v17,v8,s7
                  vfirst.m zero,v8,v0.t
                  slt        t5, t6, t1
                  vrsub.vi   v19,v28,0,v0.t
                  vmsltu.vx  v22,v16,ra,v0.t
                  xor        t3, a7, s1
                  andi       a1, a5, -790
                  vmxnor.mm  v12,v29,v10
                  vmax.vv    v0,v27,v17
                  vsbc.vvm   v1,v20,v30,v0
                  vrsub.vi   v17,v18,0
                  vadd.vv    v8,v1,v19,v0.t
                  slt        t5, s11, a5
                  slli       zero, t6, 0
                  mulh       t6, a6, a7
                  slt        s8, s5, s11
                  vsll.vi    v17,v20,0
                  vslide1down.vx v2,v10,t1
                  vmxor.mm   v11,v15,v10
                  vand.vv    v21,v30,v2
                  or         t6, a5, gp
                  div        t4, s0, s10
                  rem        t5, tp, s5
                  mulhsu     s4, s5, s0
                  vslideup.vi v15,v29,0
                  mulh       a6, zero, a5
                  vmand.mm   v2,v17,v26
                  vmin.vv    v31,v10,v3,v0.t
                  sltiu      t0, a5, 998
                  vslide1down.vx v1,v6,a2,v0.t
                  slt        t6, t4, t1
                  srl        a3, t1, s6
                  vsbc.vxm   v16,v15,t6,v0
                  vsll.vi    v11,v0,0,v0.t
                  sltiu      s2, s0, -565
                  div        s4, gp, ra
                  vmnand.mm  v30,v31,v23
                  vmax.vv    v27,v21,v7
                  sub        s6, s1, s1
                  sra        s4, gp, a0
                  vmsbf.m v7,v21
                  sub        a5, s0, a3
                  vmsof.m v1,v0
                  slti       tp, a4, 672
                  vmulh.vx   v27,v27,s2
                  vmslt.vx   v1,v15,t4,v0.t
                  vmandnot.mm v26,v21,v17
                  vmv.v.v v22,v27
                  mul        a4, s8, a3
                  slt        s8, a6, s5
                  vsll.vx    v20,v31,gp
                  vmacc.vv   v30,v19,v28
                  vid.v v24,v0.t
                  vsra.vi    v30,v7,0
                  mulhu      a1, a4, t0
                  vmv.x.s zero,v0
                  vmornot.mm v14,v3,v23
                  lui        t5, 271310
                  vmulhu.vx  v27,v31,t2,v0.t
                  vmulh.vv   v30,v22,v18
                  lui        s0, 865103
                  sra        t3, s5, s11
                  vslideup.vx v6,v30,ra
                  vmxnor.mm  v17,v19,v14
                  vmul.vx    v29,v20,s2,v0.t
                  sll        zero, s4, s7
                  divu       sp, a0, t5
                  and        t5, gp, a2
                  mul        sp, s7, zero
                  vadd.vx    v19,v17,a4
                  sltiu      t0, t5, 432
                  vmxor.mm   v30,v7,v24
                  vmsle.vv   v23,v7,v20
                  remu       s5, s5, s4
                  sra        t2, s8, a0
                  xori       tp, t4, 834
                  sltiu      a1, s8, -665
                  vmul.vx    v9,v29,s8
                  vslide1down.vx v26,v11,t5
                  vmadd.vx   v18,s8,v23
                  remu       t2, s0, a3
                  vrsub.vi   v17,v26,0,v0.t
                  vmsgtu.vi  v16,v26,0
                  ori        t5, s10, 690
                  vmv.v.x v27,gp
                  viota.m v26,v25,v0.t
                  mulh       a2, s4, t4
                  vmul.vx    v18,v16,a5,v0.t
                  slli       a6, t2, 27
                  vmnor.mm   v7,v5,v4
                  sll        t0, t6, a1
                  slti       ra, t1, -342
                  vmslt.vv   v23,v7,v31
                  vmulh.vv   v25,v26,v13,v0.t
                  vfirst.m zero,v23
                  add        a0, sp, ra
                  vmslt.vv   v30,v2,v22,v0.t
                  vsub.vv    v2,v22,v3,v0.t
                  vxor.vx    v12,v1,t4,v0.t
                  vmsltu.vx  v9,v19,t6
                  vrgather.vi v25,v0,0
                  vmor.mm    v15,v21,v17
                  vor.vx     v27,v22,gp,v0.t
                  vid.v v15
                  slt        zero, s10, s1
                  vsrl.vi    v14,v4,0,v0.t
                  divu       t5, t4, t6
                  vfirst.m zero,v3,v0.t
                  div        s11, a0, tp
                  vslide1down.vx v9,v31,s0
                  vmaxu.vv   v17,v11,v16
                  vslidedown.vi v13,v6,0
                  vmulhsu.vv v20,v19,v25,v0.t
                  sll        a0, s2, a6
                  vslideup.vx v23,v25,zero
                  vslide1up.vx v22,v4,t5,v0.t
                  vminu.vx   v11,v22,s0
                  addi       a5, ra, 925
                  vmulhu.vx  v29,v6,tp
                  vslide1up.vx v21,v0,s4
                  vsbc.vvm   v27,v7,v4,v0
                  sltiu      a3, s2, 498
                  sll        t6, a6, t2
                  vmin.vx    v12,v17,a5
                  xori       s6, t5, 946
                  xor        t1, t5, t4
                  vmandnot.mm v17,v16,v8
                  sltiu      a7, s11, 286
                  vslide1down.vx v14,v24,a4
                  remu       s4, tp, tp
                  vmor.mm    v6,v7,v29
                  vsrl.vv    v15,v16,v7,v0.t
                  vmsne.vx   v30,v29,s4,v0.t
                  vmsleu.vx  v26,v22,zero
                  vmulhsu.vv v5,v22,v28,v0.t
                  vmaxu.vx   v29,v7,t3,v0.t
                  vmsltu.vv  v1,v28,v24,v0.t
                  srli       t0, sp, 25
                  vpopc.m zero,v5,v0.t
                  lui        tp, 749252
                  vslide1down.vx v2,v10,a2
                  vmandnot.mm v21,v15,v3
                  srai       t2, s10, 9
                  srai       s4, t3, 9
                  mulhu      gp, t1, sp
                  and        gp, gp, a0
                  vmsif.m v28,v11,v0.t
                  auipc      t0, 929889
                  vsrl.vi    v24,v20,0,v0.t
                  vsub.vx    v29,v25,s1
                  vmsne.vx   v30,v19,s3,v0.t
                  vsra.vv    v3,v12,v27
                  ori        s5, t6, 1015
                  vmin.vv    v1,v16,v5,v0.t
                  sltu       ra, s4, s3
                  vmsgt.vi   v14,v27,0,v0.t
                  srai       s2, t0, 1
                  vpopc.m zero,v31
                  ori        a6, t4, 661
                  vadd.vv    v27,v2,v1,v0.t
                  vmslt.vx   v12,v19,a0,v0.t
                  vand.vx    v31,v2,a4,v0.t
                  vmacc.vv   v26,v11,v21
                  vmul.vx    v9,v24,s11
                  slt        s1, a6, sp
                  vmacc.vx   v3,a1,v1,v0.t
                  vmsltu.vv  v23,v8,v10,v0.t
                  sll        sp, t4, s1
                  vmornot.mm v2,v7,v29
                  vmaxu.vv   v11,v31,v4,v0.t
                  viota.m v14,v6
                  vmnand.mm  v2,v18,v0
                  vmsleu.vx  v31,v14,t1,v0.t
                  mul        zero, a5, s6
                  vadd.vv    v13,v12,v18,v0.t
                  mulhsu     a6, sp, a1
                  vsra.vx    v19,v20,gp
                  vadd.vi    v3,v15,0,v0.t
                  vfirst.m zero,v8
                  srai       t6, ra, 7
                  vmand.mm   v19,v0,v14
                  vmxor.mm   v21,v7,v7
                  or         zero, s2, a5
                  vmand.mm   v16,v7,v19
                  mul        a3, s1, tp
                  vmxnor.mm  v12,v5,v0
                  slli       ra, s7, 0
                  vmacc.vx   v6,s7,v15
                  vadd.vx    v6,v23,s3
                  vsub.vx    v8,v3,zero,v0.t
                  vmxor.mm   v2,v17,v23
                  auipc      zero, 463114
                  vslide1up.vx v18,v16,s1
                  mulhu      a2, sp, s2
                  vadd.vv    v29,v20,v12
                  slti       a7, s0, -420
                  viota.m v29,v25,v0.t
                  vmv.x.s zero,v27
                  vminu.vv   v20,v31,v0
                  vslide1down.vx v18,v23,a7
                  sltu       a5, a5, t5
                  vmsgtu.vi  v3,v28,0,v0.t
                  vmsgt.vi   v26,v20,0,v0.t
                  vslideup.vx v5,v15,s10
                  vmv.v.i v19,0
                  vmsgtu.vx  v25,v30,s7,v0.t
                  mulhsu     sp, s8, a1
                  srl        t2, s4, gp
                  add        a4, zero, s8
                  xori       s0, s9, 58
                  slli       a7, t4, 6
                  vfirst.m zero,v14
                  vsrl.vx    v21,v30,s4
                  vsra.vv    v6,v20,v2
                  sub        a0, t0, zero
                  vsub.vx    v8,v4,a1,v0.t
                  and        s1, s2, t1
                  vmsle.vi   v19,v5,0,v0.t
                  vslide1down.vx v31,v28,t0
                  vmulhsu.vv v13,v3,v7
                  vmadd.vx   v13,a7,v7,v0.t
                  vmandnot.mm v14,v20,v9
                  vmulhu.vx  v5,v28,s11
                  srai       a6, t6, 18
                  vadd.vx    v19,v29,s5
                  vmor.mm    v31,v4,v26
                  vsrl.vi    v17,v17,0,v0.t
                  srli       t4, s10, 9
                  vmadd.vv   v18,v16,v22
                  vmornot.mm v13,v6,v17
                  vmxor.mm   v6,v30,v6
                  vadc.vxm   v13,v3,s9,v0
                  vmxnor.mm  v17,v29,v31
                  vmsbf.m v8,v14
                  vslide1down.vx v28,v18,a6,v0.t
                  vor.vi     v2,v18,0
                  srl        a7, a6, ra
                  vslidedown.vi v5,v17,0,v0.t
                  vmsne.vv   v14,v22,v19,v0.t
                  vmsle.vx   v26,v4,s11
                  srli       gp, s10, 30
                  vand.vi    v12,v10,0,v0.t
                  slli       s2, s4, 10
                  rem        t4, t5, s6
                  xori       tp, s1, 259
                  vmsbf.m v31,v27,v0.t
                  vmin.vx    v10,v29,s6
                  vslideup.vx v26,v28,t0
                  vmor.mm    v4,v8,v5
                  vmsltu.vx  v14,v9,s1
                  or         t4, s4, gp
                  vmax.vv    v23,v4,v25,v0.t
                  vmin.vv    v19,v7,v20,v0.t
                  vmsltu.vv  v4,v29,v22
                  vmslt.vx   v14,v19,t4
                  vor.vi     v31,v31,0
                  vmnor.mm   v29,v16,v5
                  vmsgt.vi   v14,v11,0
                  vmxnor.mm  v0,v27,v26
                  slti       a6, s2, -804
                  vmadd.vx   v26,t3,v20,v0.t
                  vmsne.vv   v13,v14,v1
                  div        s5, a7, s1
                  vadc.vvm   v21,v10,v16,v0
                  vmnand.mm  v7,v10,v22
                  vminu.vx   v13,v0,gp
                  viota.m v2,v19,v0.t
                  vpopc.m zero,v31,v0.t
                  vmsle.vv   v30,v16,v4,v0.t
                  vsbc.vxm   v13,v3,s0,v0
                  vslide1up.vx v22,v25,s8,v0.t
                  sub        s8, t4, s4
                  remu       a4, t0, s9
                  sll        a5, a2, gp
                  vmxor.mm   v29,v0,v0
                  mulh       a0, t6, a2
                  vsll.vx    v21,v15,gp
                  vor.vv     v31,v17,v21,v0.t
                  vsll.vi    v24,v2,0
                  addi       s1, s0, -99
                  vslideup.vi v0,v6,0
                  vmax.vx    v29,v1,gp,v0.t
                  vmv.x.s zero,v21
                  vmv.s.x v4,s1
                  vmsleu.vx  v13,v16,t3
                  vor.vx     v22,v11,s7
                  vpopc.m zero,v9,v0.t
                  vmax.vx    v4,v14,t0,v0.t
                  vmv.s.x v26,s5
                  mul        t1, t3, zero
                  vmslt.vv   v19,v20,v15
                  vminu.vv   v15,v5,v7
                  vmsgtu.vx  v29,v30,s5,v0.t
                  vmulhsu.vv v22,v28,v19,v0.t
                  vmxor.mm   v22,v27,v5
                  addi       s0, s5, -717
                  sll        zero, tp, t5
                  vmv.v.i v29,0
                  vfirst.m zero,v28
                  vmv.s.x v19,a4
                  vmornot.mm v13,v3,v24
                  xor        gp, t5, t4
                  vmxor.mm   v6,v7,v16
                  vmsof.m v11,v16
                  vmxnor.mm  v21,v3,v27
                  ori        t0, s0, 313
                  vslide1up.vx v19,v18,s2
                  sll        a1, t5, t0
                  vmnor.mm   v8,v15,v26
                  vmv.s.x v16,s6
                  addi       s8, gp, 731
                  vmul.vv    v14,v29,v30
                  auipc      t2, 9718
                  vmsgt.vx   v13,v27,s1
                  vmandnot.mm v8,v25,v19
                  slti       t1, s5, -791
                  ori        s2, a2, -279
                  vslide1down.vx v22,v11,s5,v0.t
                  viota.m v0,v28
                  slti       s0, t2, 483
                  vslide1up.vx v20,v11,s10
                  sltu       s0, s10, a5
                  and        s6, zero, tp
                  vmsgtu.vx  v1,v14,zero
                  vslideup.vi v16,v7,0,v0.t
                  vslideup.vx v15,v18,t1,v0.t
                  vmsbf.m v27,v18,v0.t
                  vmsltu.vx  v6,v16,t6,v0.t
                  vmseq.vi   v2,v24,0,v0.t
                  vmsbf.m v10,v24
                  or         a6, s1, t3
                  vmsleu.vi  v31,v13,0,v0.t
                  sltiu      s0, s4, -805
                  xor        s4, t5, a0
                  vmaxu.vx   v17,v28,t1
                  vslidedown.vx v8,v0,s8,v0.t
                  vmv.x.s zero,v21
                  vmslt.vv   v11,v17,v27,v0.t
                  vrsub.vi   v7,v1,0,v0.t
                  vmulhsu.vv v21,v8,v20
                  vor.vv     v25,v4,v8,v0.t
                  vmulhsu.vv v24,v31,v3
                  vmin.vx    v1,v8,gp
                  vminu.vv   v27,v23,v23,v0.t
                  sra        a7, t1, tp
                  mulhsu     a7, s1, s6
                  slli       t3, a1, 9
                  vsra.vi    v11,v3,0
                  add        a0, t4, s8
                  vmor.mm    v14,v3,v28
                  addi       a6, s1, -1024
                  mulh       s7, s8, t5
                  mulh       t1, a5, a0
                  vmulhsu.vv v23,v1,v30,v0.t
                  vmul.vv    v4,v30,v0
                  vmseq.vx   v14,v5,s4,v0.t
                  vmaxu.vx   v31,v1,gp
                  sltu       s8, s0, tp
                  srli       zero, s7, 15
                  vmulhu.vx  v31,v11,s3,v0.t
                  vmv.v.v v23,v25
                  auipc      tp, 505004
                  vmv.x.s zero,v0
                  srli       gp, zero, 3
                  vmandnot.mm v26,v3,v18
                  vmsleu.vi  v11,v27,0
                  vadc.vxm   v2,v29,s4,v0
                  vand.vx    v15,v6,s7,v0.t
                  vmsleu.vx  v17,v24,tp
                  mul        tp, t3, a7
                  vmnor.mm   v29,v8,v22
                  vmv.v.v v16,v23
                  andi       a0, t0, -822
                  vslide1up.vx v8,v23,zero
                  sub        s8, t2, s9
                  mulh       a5, t2, s7
                  vsbc.vvm   v22,v5,v12,v0
                  vsll.vv    v8,v3,v19,v0.t
                  add        t0, a5, sp
                  vmsbf.m v13,v28,v0.t
                  vmv.v.x v24,s2
                  vmv.s.x v25,a7
                  vadc.vvm   v7,v23,v2,v0
                  remu       a1, s7, s7
                  vmnor.mm   v15,v7,v15
                  vsra.vv    v2,v29,v6,v0.t
                  vid.v v18
                  slti       s6, s8, 93
                  vsra.vx    v4,v23,s7,v0.t
                  vsrl.vv    v7,v6,v7
                  vrsub.vi   v10,v31,0
                  vxor.vx    v23,v27,t3
                  vor.vi     v9,v2,0,v0.t
                  div        t3, t3, a2
                  mulhu      t1, s0, s5
                  vmsle.vv   v30,v31,v16
                  and        t6, s7, s0
                  slli       a1, t0, 19
                  divu       s1, s3, t4
                  mulhu      s6, s5, s1
                  div        s1, a5, t6
                  vmor.mm    v21,v29,v10
                  vmornot.mm v16,v26,v28
                  vslide1down.vx v18,v23,t2,v0.t
                  vmsbf.m v0,v4
                  xor        s6, gp, zero
                  vmornot.mm v27,v20,v0
                  sub        a1, t5, a0
                  vmsof.m v1,v15
                  vmsleu.vx  v1,v6,t0,v0.t
                  lui        a3, 707645
                  vmxor.mm   v10,v23,v12
                  add        s7, s8, t6
                  vmsof.m v14,v1
                  sub        a0, s4, s11
                  vmsgtu.vi  v11,v25,0,v0.t
                  srai       t0, s9, 25
                  vmul.vx    v23,v14,a6
                  vadc.vim   v27,v26,0,v0
                  vmnor.mm   v21,v16,v19
                  vmacc.vx   v30,a4,v9,v0.t
                  mulh       gp, a5, a1
                  mul        zero, s3, a0
                  vmsof.m v8,v4
                  vmsgtu.vx  v24,v1,t0,v0.t
                  mulhsu     t4, s9, sp
                  vmsle.vx   v19,v7,a7
                  vslideup.vx v5,v25,t0,v0.t
                  vmulhu.vx  v29,v10,a7
                  sll        s11, s7, a5
                  vfirst.m zero,v13
                  srl        s6, a3, gp
                  vmandnot.mm v16,v11,v11
                  vmadd.vv   v23,v28,v29
                  slti       t0, t1, -150
                  vmv.s.x v3,s7
                  vmnor.mm   v11,v11,v7
                  vmor.mm    v24,v5,v7
                  srai       a5, t2, 27
                  vslide1up.vx v11,v12,s6,v0.t
                  vid.v v21
                  mulh       s11, a2, t6
                  vmsltu.vv  v31,v24,v28,v0.t
                  andi       t6, t4, -729
                  lui        tp, 727775
                  vor.vx     v11,v20,s3
                  viota.m v6,v28
                  vmxor.mm   v12,v22,v31
                  vmxor.mm   v3,v19,v12
                  add        s5, tp, gp
                  vmnand.mm  v31,v16,v7
                  auipc      s1, 90136
                  remu       a7, a1, a0
                  or         a6, gp, t2
                  vsra.vi    v19,v4,0,v0.t
                  vmsbf.m v11,v18
                  vmandnot.mm v26,v5,v20
                  vmxnor.mm  v12,v2,v3
                  slli       s2, tp, 27
                  xor        a3, s10, tp
                  mulhu      s8, s2, gp
                  vslide1down.vx v25,v18,s7
                  vslide1up.vx v2,v11,t4,v0.t
                  vmulh.vx   v15,v15,a1
                  mulhu      s2, a2, s8
                  vmax.vv    v17,v12,v4,v0.t
                  vxor.vx    v14,v30,a6,v0.t
                  vsll.vi    v26,v20,0,v0.t
                  div        a7, t6, ra
                  vmand.mm   v17,v12,v8
                  vsrl.vi    v13,v17,0
                  and        a5, t5, s4
                  vmulhsu.vx v24,v14,tp
                  vmaxu.vv   v12,v28,v22,v0.t
                  vsra.vx    v11,v12,s2
                  vmnor.mm   v12,v5,v19
                  mulhsu     a4, s5, t2
                  vmulhu.vv  v0,v31,v22
                  vmsgt.vi   v28,v14,0,v0.t
                  addi       s7, gp, -613
                  xor        a1, s4, t6
                  vslide1up.vx v21,v29,gp
                  lui        t2, 584706
                  vmor.mm    v19,v3,v29
                  srl        s1, s7, t2
                  vmulhsu.vx v8,v5,s9
                  slt        s4, s2, a6
                  vmseq.vx   v30,v20,t0,v0.t
                  vmsif.m v16,v26
                  or         a4, t0, ra
                  vmseq.vv   v5,v31,v8,v0.t
                  sra        zero, zero, a2
                  vmsgtu.vx  v2,v14,a0,v0.t
                  vmax.vx    v5,v31,s3,v0.t
                  vmsbf.m v11,v24
                  vmsof.m v7,v27
                  mulhu      s4, t1, t6
                  vrgather.vi v15,v14,0
                  vmaxu.vx   v24,v1,s6,v0.t
                  slt        t0, t5, s1
                  slt        a2, t1, ra
                  vmulh.vx   v28,v23,s0
                  sll        t0, t6, a6
                  vmandnot.mm v29,v21,v21
                  vmv.x.s zero,v9
                  or         a4, a6, s11
                  vmseq.vv   v12,v10,v7,v0.t
                  vmsle.vi   v27,v8,0
                  andi       sp, t5, 544
                  and        t3, s8, t2
                  srai       t2, s8, 23
                  sra        a6, s7, s1
                  or         sp, a7, s9
                  vmax.vx    v27,v16,a6
                  vmulhsu.vv v25,v15,v9,v0.t
                  vmadd.vx   v23,a7,v5
                  vmacc.vx   v10,t1,v11,v0.t
                  vmacc.vv   v21,v15,v14
                  sll        t4, s1, s7
                  add        tp, s5, t3
                  sll        t1, s10, s1
                  vmacc.vv   v11,v21,v12,v0.t
                  or         t5, a0, sp
                  slt        s7, t0, s3
                  xori       a6, t3, 863
                  vmnand.mm  v1,v20,v29
                  sub        s2, s8, s4
                  vmulhsu.vv v4,v28,v0,v0.t
                  vmsbf.m v29,v26
                  viota.m v17,v20
                  srli       a4, a2, 8
                  vmsleu.vv  v16,v13,v29
                  vfirst.m zero,v24
                  slli       a2, t2, 28
                  vslide1down.vx v6,v26,zero,v0.t
                  vxor.vx    v0,v4,s9
                  slt        s0, s5, t6
                  srai       s2, s11, 8
                  vmaxu.vv   v24,v23,v31,v0.t
                  vsrl.vv    v0,v21,v15
                  vmv.s.x v8,s7
                  vmnand.mm  v30,v5,v31
                  vmor.mm    v27,v21,v17
                  vmseq.vi   v0,v6,0
                  sll        s2, zero, s7
                  vmornot.mm v17,v27,v19
                  srli       a6, gp, 14
                  add        s2, a2, s0
                  vmacc.vv   v5,v31,v5
                  vadd.vi    v23,v27,0
                  vxor.vv    v0,v5,v12
                  vmxor.mm   v10,v7,v16
                  andi       a0, t0, -608
                  vpopc.m zero,v1,v0.t
                  vsub.vx    v8,v18,s2
                  vfirst.m zero,v29,v0.t
                  xor        t2, s9, ra
                  sltu       s4, s10, s8
                  vid.v v17
                  vadd.vi    v15,v29,0
                  divu       a5, t3, s8
                  viota.m v19,v31,v0.t
                  vmslt.vx   v8,v14,s0,v0.t
                  add        t4, a3, s0
                  vmacc.vv   v13,v23,v11,v0.t
                  vrsub.vx   v18,v20,s4
                  mulh       a2, t2, a7
                  vslidedown.vx v2,v9,s6
                  vfirst.m zero,v0
                  divu       a1, sp, a4
                  mulh       s1, t5, s2
                  vadc.vxm   v30,v4,s7,v0
                  divu       s6, a5, t1
                  vmulh.vx   v0,v27,s0
                  vmxnor.mm  v9,v27,v23
                  vmor.mm    v19,v1,v2
                  sll        gp, t1, s4
                  vrgather.vv v14,v1,v27
                  vmor.mm    v29,v0,v26
                  remu       t0, gp, s5
                  srli       s7, zero, 23
                  vmandnot.mm v1,v28,v17
                  sra        a3, s9, gp
                  vsbc.vvm   v26,v10,v9,v0
                  xori       s5, t5, -854
                  vmornot.mm v27,v12,v28
                  vmsof.m v16,v25
                  vmin.vx    v1,v26,s3
                  sltiu      t5, s4, 110
                  sltiu      tp, gp, 990
                  vmnor.mm   v17,v13,v14
                  vsbc.vxm   v30,v29,t1,v0
                  sub        s6, s4, a6
                  vpopc.m zero,v24,v0.t
                  vmsne.vx   v8,v1,s5
                  mulhu      a7, t2, a0
                  lui        tp, 627214
                  vmsne.vv   v16,v19,v13,v0.t
                  vmnand.mm  v22,v11,v25
                  xor        t4, s7, s9
                  vmsgt.vi   v29,v26,0
                  vmornot.mm v1,v24,v12
                  ori        s4, s11, -529
                  vmand.mm   v10,v21,v1
                  vmsbf.m v27,v3,v0.t
                  auipc      t4, 832808
                  vslide1up.vx v25,v29,s8,v0.t
                  vmsleu.vv  v28,v25,v20,v0.t
                  vsub.vv    v12,v5,v7
                  vmandnot.mm v6,v28,v9
                  vmv.x.s zero,v6
                  vmsle.vv   v20,v16,v23
                  xori       zero, ra, -848
                  vslide1up.vx v1,v0,sp
                  viota.m v17,v22,v0.t
                  srl        t5, gp, t4
                  vrsub.vi   v22,v27,0,v0.t
                  vmsbf.m v12,v1,v0.t
                  vsbc.vvm   v5,v15,v1,v0
                  mulhu      s7, sp, t1
                  andi       a1, a5, 183
                  vadd.vi    v12,v11,0,v0.t
                  vmnor.mm   v31,v28,v24
                  vand.vx    v21,v9,t4,v0.t
                  vsra.vv    v10,v10,v14
                  vsub.vx    v27,v24,a4
                  andi       a6, t4, 469
                  vmaxu.vx   v23,v6,s6,v0.t
                  lui        a0, 149603
                  vmxnor.mm  v18,v13,v20
                  vmaxu.vx   v0,v30,gp
                  vmnor.mm   v21,v24,v28
                  vmnor.mm   v18,v0,v12
                  vmxnor.mm  v3,v17,v18
                  or         zero, a0, s9
                  vmadd.vx   v4,a2,v18
                  lui        t0, 292974
                  vminu.vv   v22,v25,v8,v0.t
                  vmsgt.vx   v5,v11,t6,v0.t
                  vmnor.mm   v25,v16,v19
                  vfirst.m zero,v2
                  auipc      a4, 971168
                  vpopc.m zero,v15,v0.t
                  auipc      a4, 127564
                  vid.v v8,v0.t
                  divu       s6, a4, t3
                  vpopc.m zero,v8
                  vmor.mm    v24,v11,v5
                  vsub.vv    v25,v25,v29,v0.t
                  vand.vx    v9,v13,ra
                  rem        s2, t0, tp
                  vmornot.mm v22,v21,v4
                  sltu       s5, t2, s8
                  vsbc.vvm   v17,v18,v0,v0
                  vmul.vx    v29,v7,a2,v0.t
                  srli       a7, a6, 15
                  vpopc.m zero,v16
                  vadc.vxm   v10,v5,t3,v0
                  vmnor.mm   v22,v16,v20
                  vmulhsu.vv v10,v20,v14,v0.t
                  slt        zero, s8, a4
                  srai       ra, s11, 19
                  vsrl.vi    v4,v14,0
                  srli       s6, s3, 16
                  vmulhsu.vv v13,v9,v24
                  div        s1, s6, t5
                  mulh       s4, ra, a4
                  sltiu      t4, t1, 909
                  xor        a6, t5, a0
                  vslidedown.vx v12,v1,s10,v0.t
                  vmnor.mm   v27,v13,v14
                  slli       s11, a3, 23
                  vor.vv     v9,v29,v7,v0.t
                  vmadd.vv   v19,v22,v26,v0.t
                  vmsif.m v30,v17,v0.t
                  sltiu      s7, a5, -23
                  vmsltu.vv  v13,v31,v26
                  vmsbf.m v13,v19
                  div        t2, a4, t5
                  vrgather.vv v5,v2,v17,v0.t
                  vmv.x.s zero,v23
                  vid.v v11
                  vmsif.m v7,v26,v0.t
                  vmulh.vx   v31,v18,t2
                  vmsif.m v11,v14
                  xori       gp, s4, 915
                  vmxnor.mm  v14,v23,v13
                  srai       s7, s9, 20
                  vmul.vv    v7,v27,v6,v0.t
                  vmxor.mm   v10,v16,v3
                  mulhu      sp, s8, a3
                  vsrl.vx    v28,v0,a3
                  vsra.vv    v8,v7,v22
                  vmslt.vv   v31,v7,v15
                  vmornot.mm v13,v2,v16
                  vmor.mm    v22,v11,v7
                  vmsleu.vi  v20,v11,0
                  andi       a3, a0, -752
                  addi       a4, s10, -525
                  vadd.vv    v10,v13,v27,v0.t
                  vor.vv     v20,v4,v16
                  vmsne.vi   v26,v29,0
                  vmand.mm   v12,v9,v8
                  viota.m v25,v17
                  vmsgtu.vx  v12,v26,s1,v0.t
                  vrsub.vx   v11,v19,a7,v0.t
                  vmornot.mm v13,v8,v5
                  srai       s4, t2, 27
                  lui        a0, 65548
                  addi       s5, t3, -777
                  vadc.vvm   v6,v4,v24,v0
                  add        s4, gp, s9
                  vmxor.mm   v6,v30,v11
                  vmandnot.mm v23,v28,v28
                  sltu       a4, tp, zero
                  slt        zero, tp, s2
                  vrsub.vx   v5,v28,s0,v0.t
                  vmseq.vi   v17,v30,0
                  vid.v v24,v0.t
                  vmulhsu.vv v19,v1,v21,v0.t
                  vmsle.vi   v26,v22,0,v0.t
                  vmulhu.vv  v2,v3,v12,v0.t
                  add        t0, a2, ra
                  vmsof.m v18,v30,v0.t
                  sltiu      t6, t5, -468
                  vsra.vi    v4,v7,0,v0.t
                  vmsgt.vi   v30,v31,0
                  vmseq.vx   v31,v21,ra,v0.t
                  vslide1down.vx v16,v19,gp
                  mul        a4, t0, s11
                  addi       s11, t5, 466
                  mul        a5, t4, a6
                  xori       a3, s8, 722
                  vmsgtu.vx  v17,v8,s7
                  vmax.vx    v19,v13,tp,v0.t
                  sltiu      t5, s2, -567
                  viota.m v14,v16
                  vmin.vx    v7,v7,a5
                  vmsltu.vv  v10,v29,v29
                  addi       a1, s10, -211
                  divu       s11, a2, a7
                  vmv.v.v v15,v20
                  sll        s2, a1, a2
                  vxor.vx    v6,v10,t1
                  vmacc.vx   v1,s3,v1
                  vmxnor.mm  v20,v3,v14
                  vmacc.vv   v7,v24,v8
                  mulhsu     a3, s9, t6
                  vmul.vx    v0,v20,s9
                  vmsne.vv   v31,v24,v21,v0.t
                  vmxor.mm   v24,v15,v3
                  vmacc.vx   v19,s7,v9,v0.t
                  auipc      t4, 991527
                  vslidedown.vi v17,v27,0
                  vmv.v.v v16,v7
                  slti       t4, gp, 843
                  mulhu      t1, t3, zero
                  vmulhu.vx  v12,v7,a4
                  vmslt.vx   v3,v26,sp,v0.t
                  vmax.vv    v1,v8,v23
                  vmv.v.i v28,0
                  vxor.vx    v18,v20,s4
                  vmsbf.m v0,v22
                  vmsgtu.vi  v21,v31,0,v0.t
                  vmxor.mm   v0,v20,v11
                  slti       s6, a3, 426
                  vmslt.vx   v15,v16,a6,v0.t
                  vsll.vv    v25,v16,v16,v0.t
                  or         a5, a3, s6
                  andi       ra, s0, 578
                  vmslt.vx   v7,v12,a5,v0.t
                  mulhsu     a4, s0, s1
                  vslide1up.vx v14,v9,t5,v0.t
                  or         s6, t0, s11
                  mul        t2, t4, zero
                  vmslt.vx   v20,v2,a2
                  vmulh.vx   v20,v19,a2,v0.t
                  vmandnot.mm v15,v12,v13
                  vmsleu.vv  v6,v4,v3,v0.t
                  vmnor.mm   v6,v0,v13
                  vmseq.vi   v0,v21,0
                  vslide1down.vx v25,v19,t6
                  lui        s2, 548462
                  vsll.vv    v13,v10,v25
                  vadd.vx    v30,v8,t2
                  vmaxu.vx   v11,v21,s1,v0.t
                  vmseq.vv   v17,v9,v15
                  sra        s4, tp, a3
                  vslide1up.vx v12,v0,zero,v0.t
                  vsub.vv    v10,v7,v6
                  divu       sp, t6, s3
                  sll        a4, a1, s3
                  divu       s1, gp, zero
                  vmulhu.vv  v10,v25,v29
                  viota.m v24,v28
                  vfirst.m zero,v13
                  vmsbf.m v0,v11
                  or         s8, s11, a4
                  xor        s11, t6, a0
                  vslideup.vx v3,v27,t0,v0.t
                  vsub.vx    v19,v28,t5
                  vrgather.vi v9,v24,0,v0.t
                  add        t6, a1, gp
                  vid.v v2,v0.t
                  sltu       a4, sp, t1
                  srli       s8, t6, 15
                  vmxor.mm   v6,v25,v10
                  vmor.mm    v20,v17,v18
                  sra        s0, sp, t4
                  vmor.mm    v2,v10,v0
                  or         zero, s7, s7
                  vslidedown.vx v22,v21,t1,v0.t
                  vmsne.vi   v5,v0,0
                  viota.m v4,v21
                  vmornot.mm v12,v0,v14
                  vsra.vi    v29,v10,0,v0.t
                  and        t3, t0, t4
                  slti       s1, s1, 580
                  vmsgtu.vx  v10,v23,a2
                  vmsif.m v7,v23,v0.t
                  vmor.mm    v24,v2,v12
                  vslideup.vx v26,v27,s11
                  vmsif.m v22,v28
                  sub        t6, zero, s5
                  ori        a4, t5, -32
                  vmsgtu.vi  v14,v6,0,v0.t
                  vsra.vx    v25,v21,ra,v0.t
                  ori        s0, t3, -557
                  xor        a6, a7, a3
                  vpopc.m zero,v9
                  vmsgtu.vi  v1,v12,0
                  vmv.s.x v7,t0
                  sll        a7, a2, s7
                  vmaxu.vv   v23,v28,v27
                  vmacc.vx   v0,ra,v0
                  vslidedown.vx v5,v8,s7
                  vmv.x.s zero,v15
                  vslideup.vx v0,v17,a6
                  vslideup.vi v19,v25,0
                  viota.m v25,v24
                  and        t5, s10, s10
                  vmornot.mm v6,v19,v0
                  vmsleu.vx  v24,v30,t2
                  and        a6, t0, a6
                  vrsub.vx   v3,v16,t1
                  or         s8, a6, t6
                  vrsub.vx   v15,v18,s6
                  vmsltu.vv  v25,v19,v9
                  vmandnot.mm v12,v16,v17
                  vmnor.mm   v30,v21,v8
                  vslide1up.vx v5,v18,s8,v0.t
                  mulhsu     s4, t4, s6
                  sra        s8, a6, a6
                  slti       s0, s2, -753
                  vmandnot.mm v14,v11,v21
                  vmv.v.x v16,s6
                  vmsof.m v1,v30,v0.t
                  mul        s2, a2, a5
                  vmulhu.vx  v17,v4,t3
                  div        a7, t4, t2
                  vmulh.vx   v7,v6,zero,v0.t
                  vmxnor.mm  v15,v11,v6
                  mulhsu     t0, s3, s0
                  srai       s0, gp, 9
                  addi       s1, t4, 36
                  vmv.s.x v6,tp
                  vmsleu.vv  v10,v4,v31
                  mulh       t3, t2, s11
                  vmax.vv    v6,v31,v2
                  addi       t0, t3, -333
                  mulh       s6, t0, a1
                  vmadd.vx   v8,s5,v16,v0.t
                  vxor.vx    v13,v26,s8,v0.t
                  mul        a6, s1, t4
                  vsbc.vxm   v23,v30,sp,v0
                  xor        s0, gp, s1
                  vmslt.vv   v2,v5,v24,v0.t
                  viota.m v8,v5
                  xor        a2, t2, t3
                  vmand.mm   v20,v1,v16
                  sltiu      sp, sp, -623
                  vmv.x.s zero,v12
                  xor        a0, t4, t5
                  vslide1up.vx v11,v23,s7,v0.t
                  viota.m v0,v25
                  sltu       s1, tp, s6
                  slt        a6, s7, s10
                  vid.v v27
                  vsll.vv    v30,v26,v5
                  vsub.vx    v23,v26,a4,v0.t
                  vmnor.mm   v15,v20,v14
                  vid.v v5,v0.t
                  and        a5, a6, tp
                  vmsle.vv   v23,v13,v21
                  vadd.vi    v6,v14,0,v0.t
                  remu       zero, t2, s4
                  slli       t2, a5, 2
                  vmulhu.vv  v2,v0,v31
                  vmnand.mm  v24,v13,v9
                  vslideup.vx v3,v6,s2
                  vmsif.m v15,v4,v0.t
                  vxor.vv    v20,v28,v19
                  vor.vi     v17,v2,0
                  vmsgt.vx   v10,v4,t1
                  vslideup.vi v23,v19,0,v0.t
                  vfirst.m zero,v16
                  add        a4, s3, t3
                  vminu.vv   v31,v17,v2,v0.t
                  slli       s1, a4, 17
                  vmor.mm    v0,v28,v9
                  vadc.vvm   v8,v25,v26,v0
                  vmulh.vv   v26,v4,v19,v0.t
                  divu       tp, s9, s0
                  mul        t3, a5, a3
                  vsbc.vvm   v13,v26,v29,v0
                  vmul.vv    v1,v7,v25,v0.t
                  xori       s8, s5, 973
                  andi       t2, t0, 772
                  mulhsu     s1, s5, s5
                  vmand.mm   v25,v24,v26
                  vsub.vx    v0,v15,a5
                  add        ra, a2, s7
                  vslide1down.vx v15,v19,t5,v0.t
                  addi       t1, s4, 893
                  vslide1up.vx v24,v1,a0
                  srai       a2, s0, 9
                  vmsif.m v28,v4,v0.t
                  viota.m v23,v28
                  vslideup.vx v2,v25,t4,v0.t
                  divu       s4, t0, t0
                  and        a5, s7, s2
                  or         a4, s8, s1
                  vmnand.mm  v21,v20,v24
                  lui        s6, 418245
                  vmv.x.s zero,v3
                  vid.v v27,v0.t
                  sub        s0, s11, s9
                  vmsltu.vx  v8,v27,t0
                  vpopc.m zero,v26,v0.t
                  vmaxu.vv   v23,v29,v16
                  vxor.vx    v7,v27,a4,v0.t
                  srai       a3, s6, 31
                  vrgather.vv v10,v19,v3,v0.t
                  vslide1down.vx v29,v20,s0
                  vslide1down.vx v22,v9,sp,v0.t
                  slt        a2, t3, s9
                  vmsne.vv   v22,v14,v25,v0.t
                  mulh       a7, tp, s10
                  add        a6, s10, s1
                  vxor.vx    v6,v18,ra
                  srai       zero, s0, 6
                  vmseq.vx   v26,v8,a4
                  or         t6, s7, s10
                  vmsne.vi   v24,v19,0,v0.t
                  vsbc.vvm   v4,v16,v13,v0
                  addi       a3, a3, 189
                  lui        t3, 963245
                  vslidedown.vi v2,v19,0,v0.t
                  slti       a1, zero, -434
                  andi       a0, a2, 716
                  mul        s2, a2, t4
                  vslide1up.vx v27,v15,s8,v0.t
                  vmxnor.mm  v15,v16,v5
                  xori       t4, s1, 63
                  vmsif.m v5,v9,v0.t
                  xor        a6, t1, s2
                  andi       s2, t5, 769
                  addi       s0, a6, 613
                  vminu.vx   v7,v12,t1
                  vslide1down.vx v11,v9,s6,v0.t
                  vmsof.m v31,v23
                  sll        a5, tp, gp
                  srli       t4, s8, 13
                  sltiu      t5, a0, -10
                  vmaxu.vv   v1,v8,v6,v0.t
                  vxor.vi    v29,v6,0,v0.t
                  vrgather.vv v11,v19,v18
                  vrsub.vi   v24,v6,0,v0.t
                  or         s5, t0, s10
                  vsll.vv    v4,v6,v2,v0.t
                  vmax.vx    v25,v6,a2,v0.t
                  addi       a5, s5, -524
                  vmsbf.m v4,v13
                  vxor.vv    v21,v26,v6
                  addi       a2, ra, -791
                  vmxor.mm   v5,v19,v6
                  vand.vi    v7,v13,0
                  vmsgt.vx   v7,v4,a2
                  vsll.vv    v1,v6,v2,v0.t
                  vmv.x.s zero,v7
                  viota.m v28,v0
                  sra        gp, s6, a7
                  vadc.vim   v1,v15,0,v0
                  slli       sp, t5, 5
                  vmsgt.vi   v12,v5,0
                  sltiu      a2, s11, -938
                  vmulhu.vx  v19,v5,s5,v0.t
                  vmsleu.vv  v28,v30,v7,v0.t
                  vmslt.vv   v13,v7,v6
                  vmnand.mm  v2,v27,v8
                  vmornot.mm v12,v16,v31
                  or         tp, s6, s7
                  vslide1up.vx v20,v22,t6
                  vsrl.vx    v26,v16,s7
                  vslide1up.vx v10,v5,gp
                  vminu.vv   v4,v18,v30,v0.t
                  vmsif.m v29,v30,v0.t
                  lui        a6, 270326
                  vslide1up.vx v31,v11,s6
                  add        tp, tp, t5
                  vsbc.vvm   v26,v13,v6,v0
                  vmsne.vv   v17,v0,v2
                  vmandnot.mm v6,v21,v22
                  sltiu      s11, t4, 492
                  ori        s7, s7, 568
                  vmseq.vv   v28,v29,v17,v0.t
                  sub        a6, tp, gp
                  vmv.s.x v16,t1
                  vslidedown.vi v0,v31,0
                  vor.vv     v3,v26,v16,v0.t
                  vmv.x.s zero,v18
                  vmsne.vx   v27,v16,a1
                  sll        t1, t4, a1
                  auipc      zero, 43178
                  mulhsu     s11, s1, ra
                  vslide1down.vx v2,v12,a1
                  vmnor.mm   v23,v10,v5
                  sltu       a4, t6, s1
                  vfirst.m zero,v14,v0.t
                  vmslt.vv   v9,v6,v22,v0.t
                  sltu       s1, s0, s9
                  vsub.vv    v18,v4,v26,v0.t
                  addi       t5, t3, -362
                  vsub.vx    v5,v3,s4
                  vmv.v.v v11,v10
                  auipc      s5, 451682
                  or         a4, s10, a5
                  vmnor.mm   v11,v22,v9
                  vrsub.vi   v6,v6,0,v0.t
                  auipc      a7, 123006
                  vmv.s.x v10,t0
                  vmand.mm   v20,v24,v2
                  vmnor.mm   v16,v26,v25
                  vmnor.mm   v25,v5,v18
                  vor.vi     v15,v13,0
                  vmsif.m v31,v26
                  vslidedown.vi v22,v29,0
                  vor.vi     v10,v1,0
                  vmand.mm   v26,v25,v25
                  vpopc.m zero,v22,v0.t
                  vpopc.m zero,v30,v0.t
                  vmsgt.vi   v21,v11,0
                  vmxor.mm   v19,v6,v10
                  vmslt.vv   v28,v3,v23,v0.t
                  mulhsu     a0, s11, t1
                  rem        a4, gp, a7
                  vor.vi     v21,v8,0,v0.t
                  mulhsu     tp, tp, s10
                  vmadd.vx   v9,a0,v28,v0.t
                  vslideup.vi v25,v20,0,v0.t
                  vid.v v3
                  vfirst.m zero,v29
                  vpopc.m zero,v14,v0.t
                  div        a4, s5, zero
                  vmsle.vi   v26,v28,0
                  vmsgt.vx   v4,v2,s2,v0.t
                  slti       s11, a5, 608
                  vmulhsu.vx v20,v10,t0
                  vpopc.m zero,v18
                  slli       t4, t6, 10
                  vmand.mm   v15,v9,v14
                  vmsltu.vv  v3,v18,v0,v0.t
                  vsrl.vv    v27,v16,v0,v0.t
                  add        a6, ra, a2
                  vslidedown.vi v20,v11,0,v0.t
                  vmsle.vv   v28,v10,v24
                  slli       a5, a6, 11
                  vmsltu.vv  v22,v24,v3,v0.t
                  vpopc.m zero,v18
                  vmulhu.vv  v0,v22,v7
                  vxor.vv    v23,v0,v2,v0.t
                  vmv.s.x v17,a6
                  vmaxu.vx   v1,v6,t4,v0.t
                  vmandnot.mm v27,v0,v2
                  mul        a7, a4, s9
                  vmacc.vv   v5,v3,v2,v0.t
                  vsll.vx    v7,v30,s1,v0.t
                  vsll.vx    v31,v18,s9,v0.t
                  vmacc.vx   v3,a0,v25,v0.t
                  rem        zero, a5, zero
                  vslide1down.vx v20,v21,s4,v0.t
                  slli       gp, s10, 24
                  vmsgt.vi   v22,v8,0
                  sltiu      a0, s5, 379
                  vmsbf.m v13,v22,v0.t
                  addi       t2, s2, 762
                  sltu       tp, a6, s7
                  srl        s6, t5, s3
                  vmsgtu.vi  v19,v29,0
                  and        t0, t0, t3
                  xor        a5, s5, s0
                  vadd.vi    v15,v22,0,v0.t
                  vmxor.mm   v0,v5,v29
                  srai       sp, ra, 30
                  vmsltu.vv  v28,v27,v30,v0.t
                  slti       t2, a0, -788
                  vsra.vx    v12,v14,tp,v0.t
                  vminu.vv   v15,v5,v7
                  mul        gp, s4, gp
                  sub        s11, a7, t6
                  srl        a7, a4, t2
                  add        s0, t0, s2
                  vmsgtu.vi  v0,v29,0
                  vmax.vv    v24,v12,v28
                  vmornot.mm v30,v17,v23
                  vid.v v16
                  addi       zero, s5, 289
                  mul        t3, s5, s9
                  srl        s7, gp, s9
                  vadd.vv    v5,v27,v9,v0.t
                  vmv.x.s zero,v23
                  vsbc.vvm   v9,v12,v18,v0
                  vmacc.vv   v18,v28,v5,v0.t
                  vor.vx     v13,v31,a6,v0.t
                  or         a2, t4, a7
                  vrgather.vx v9,v13,a6,v0.t
                  vfirst.m zero,v31
                  srli       zero, t6, 6
                  vmulhsu.vx v30,v24,a0,v0.t
                  vmand.mm   v4,v25,v5
                  vmsif.m v24,v18,v0.t
                  srli       gp, a0, 25
                  vmin.vv    v19,v28,v27
                  vsra.vx    v6,v26,s0
                  vsrl.vv    v4,v0,v12
                  srli       s6, s0, 8
                  vslide1up.vx v2,v6,t2,v0.t
                  divu       t0, a5, s1
                  lui        sp, 627406
                  vmsgt.vx   v25,v11,sp
                  vmsif.m v2,v15
                  vmax.vx    v25,v7,t0
                  vmsbf.m v22,v1,v0.t
                  vmsleu.vi  v9,v24,0
                  srli       t2, s2, 12
                  srli       s5, s8, 16
                  auipc      a3, 329239
                  and        tp, a5, a1
                  vslidedown.vi v22,v8,0,v0.t
                  vslideup.vx v25,v6,a0,v0.t
                  mul        s11, t1, t1
                  vpopc.m zero,v31,v0.t
                  vmand.mm   v19,v4,v5
                  srli       t3, t3, 1
                  srai       a5, s9, 17
                  vmadd.vv   v28,v26,v11,v0.t
                  vmsltu.vv  v13,v11,v26,v0.t
                  rem        t3, ra, a2
                  slt        s4, s11, t1
                  ori        s6, s9, -325
                  vmslt.vv   v27,v29,v22,v0.t
                  vmslt.vx   v5,v12,s9,v0.t
                  vmandnot.mm v15,v6,v24
                  vmax.vv    v10,v7,v31
                  vsrl.vi    v13,v13,0,v0.t
                  ori        a6, a6, -59
                  vsub.vx    v25,v16,s2,v0.t
                  vmor.mm    v21,v14,v25
                  vmand.mm   v18,v2,v14
                  vmulhu.vv  v11,v13,v1,v0.t
                  mul        a1, tp, t6
                  vmsbf.m v10,v7,v0.t
                  vmin.vv    v12,v26,v31
                  vmsof.m v8,v19
                  remu       s5, s8, s11
                  vmv.x.s zero,v10
                  vslide1up.vx v16,v21,sp
                  addi       t3, a7, -306
                  vmsif.m v16,v27,v0.t
                  mulhu      t3, s11, s1
                  mul        t1, s2, a4
                  vmxor.mm   v21,v31,v20
                  vslideup.vx v0,v13,a4
                  vmul.vx    v7,v20,a0,v0.t
                  vminu.vx   v5,v26,s11
                  vmor.mm    v7,v10,v27
                  vmsltu.vv  v27,v22,v5,v0.t
                  vslide1up.vx v1,v4,t2,v0.t
                  vmsne.vv   v13,v1,v18,v0.t
                  viota.m v29,v15
                  srai       gp, s3, 12
                  sltiu      s1, t3, 852
                  vmulhsu.vv v21,v17,v20
                  or         t0, t4, s3
                  vmor.mm    v25,v30,v3
                  vmxor.mm   v30,v15,v12
                  vmsof.m v26,v8,v0.t
                  slti       t3, zero, 635
                  xor        s5, t5, s0
                  mulh       a6, s8, t6
                  rem        t6, s0, a2
                  vmandnot.mm v26,v22,v14
                  mul        s0, tp, t5
                  rem        t5, t2, s0
                  vsub.vx    v20,v28,a1
                  vmsgt.vx   v20,v29,a4,v0.t
                  div        t6, t2, s9
                  sltiu      ra, t2, -487
                  vmxor.mm   v22,v0,v27
                  div        t2, ra, t0
                  vmadd.vv   v15,v1,v7,v0.t
                  vmseq.vv   v24,v20,v3
                  vmaxu.vv   v6,v22,v12
                  vmsof.m v6,v14
                  vmslt.vx   v6,v14,gp,v0.t
                  divu       t4, s5, t1
                  slt        s4, a6, a0
                  vmsgt.vx   v25,v1,ra
                  vmxnor.mm  v1,v6,v0
                  divu       t0, s9, ra
                  add        t3, t2, s2
                  vmor.mm    v4,v5,v11
                  or         t6, sp, t5
                  vsll.vv    v6,v10,v27
                  vmand.mm   v21,v29,v12
                  vmseq.vx   v24,v20,a5,v0.t
                  vrgather.vv v12,v27,v16
                  vsbc.vvm   v9,v23,v31,v0
                  vmaxu.vx   v8,v8,a6
                  vminu.vv   v26,v13,v14
                  vrgather.vi v1,v4,0
                  xor        s5, tp, s6
                  vmxnor.mm  v21,v8,v12
                  vpopc.m zero,v16,v0.t
                  srli       ra, s10, 3
                  vadd.vv    v13,v30,v15,v0.t
                  sltu       a4, zero, a5
                  vslide1up.vx v7,v12,t4,v0.t
                  vmand.mm   v2,v10,v1
                  slli       zero, a6, 31
                  add        s5, a1, sp
                  vmor.mm    v10,v11,v26
                  sltu       s1, s6, t5
                  vadd.vx    v18,v13,t3,v0.t
                  vmulhsu.vx v10,v24,s0,v0.t
                  mulh       t6, s1, s1
                  vmul.vv    v10,v25,v21,v0.t
                  vmnand.mm  v1,v30,v25
                  sll        a1, a3, s7
                  vmxor.mm   v20,v23,v19
                  vsra.vx    v11,v28,t1
                  vmulhu.vv  v0,v11,v20
                  vpopc.m zero,v13
                  vmul.vx    v7,v19,s9,v0.t
                  srl        s8, s10, tp
                  vmnor.mm   v3,v29,v18
                  rem        s1, sp, s4
                  vmsbf.m v1,v19
                  vfirst.m zero,v13
                  or         s11, s1, a1
                  vmornot.mm v17,v2,v27
                  sll        s7, t2, s6
                  vsll.vi    v6,v24,0
                  vmv.x.s zero,v16
                  vmulhu.vx  v28,v20,s3
                  vmnand.mm  v28,v13,v16
                  mul        s8, s0, a1
                  vmv.s.x v8,t1
                  or         gp, zero, a0
                  vmv.x.s zero,v24
                  vmnor.mm   v12,v8,v1
                  vadd.vx    v18,v9,s0,v0.t
                  andi       s8, t4, -674
                  vmsof.m v20,v0
                  vmsgt.vi   v3,v30,0,v0.t
                  vmax.vx    v3,v2,s4,v0.t
                  vrgather.vv v15,v13,v28,v0.t
                  vsra.vv    v27,v15,v25
                  andi       s6, s2, -944
                  viota.m v20,v10,v0.t
                  mulhu      sp, s6, s6
                  vmsle.vi   v17,v18,0,v0.t
                  slti       sp, s6, -584
                  vmxor.mm   v9,v31,v11
                  vsbc.vvm   v11,v7,v11,v0
                  rem        a4, s4, a5
                  vsra.vi    v10,v11,0
                  vslide1up.vx v2,v5,s7,v0.t
                  auipc      t2, 443921
                  vxor.vx    v14,v6,s10
                  addi       t5, tp, -174
                  xori       ra, a7, 177
                  vmv.v.i v2,0
                  vmornot.mm v30,v27,v1
                  vmulh.vv   v30,v24,v7,v0.t
                  sra        s8, s9, t0
                  vmnand.mm  v14,v23,v12
                  vmadd.vv   v10,v9,v24,v0.t
                  xori       t0, s9, 283
                  vsub.vx    v25,v18,t6,v0.t
                  ori        a5, a2, 419
                  vmsof.m v26,v29
                  vmsof.m v22,v9,v0.t
                  vmnand.mm  v30,v14,v15
                  vmadd.vv   v0,v3,v0
                  vmnand.mm  v22,v17,v9
                  vslidedown.vx v27,v5,zero,v0.t
                  mulhu      a1, s1, s3
                  mulh       s7, s6, a5
                  vslide1down.vx v24,v28,t5,v0.t
                  vmacc.vx   v14,t1,v21
                  vsra.vv    v7,v0,v5,v0.t
                  vmnor.mm   v8,v5,v3
                  sra        a0, a4, s11
                  vmax.vv    v31,v31,v2,v0.t
                  vsrl.vv    v27,v8,v28
                  vid.v v31,v0.t
                  vadc.vvm   v9,v10,v27,v0
                  vmsbf.m v8,v26
                  vpopc.m zero,v18
                  vmnand.mm  v7,v2,v29
                  vmadd.vx   v13,a2,v8
                  vid.v v30,v0.t
                  vslideup.vi v22,v11,0,v0.t
                  vmslt.vv   v23,v9,v7
                  vmsgt.vi   v4,v19,0,v0.t
                  vslide1down.vx v29,v11,t3,v0.t
                  vslidedown.vx v18,v20,a7,v0.t
                  vadc.vim   v12,v19,0,v0
                  vslide1down.vx v21,v2,a3
                  vand.vv    v8,v31,v0,v0.t
                  vslide1up.vx v0,v29,a2
                  vor.vx     v25,v21,t4,v0.t
                  addi       s2, gp, 661
                  srai       s0, a6, 2
                  vmsgt.vx   v26,v21,t5,v0.t
                  vmax.vv    v26,v13,v31
                  sltu       a2, s0, s5
                  or         s5, a3, a5
                  slti       a2, s5, 3
                  vmul.vv    v12,v4,v6
                  srli       t4, t4, 5
                  viota.m v24,v11
                  vmulhu.vv  v18,v25,v23,v0.t
                  vrgather.vx v28,v8,s1
                  vmxnor.mm  v13,v21,v24
                  vmandnot.mm v16,v28,v5
                  mulh       t5, s9, t1
                  vmxnor.mm  v4,v18,v27
                  vmsif.m v28,v12,v0.t
                  vmsle.vv   v5,v10,v2,v0.t
                  add        zero, t3, s2
                  vmsleu.vv  v17,v24,v8
                  vsbc.vxm   v1,v19,ra,v0
                  vmandnot.mm v22,v22,v9
                  vrsub.vi   v24,v9,0
                  vmin.vv    v11,v0,v30,v0.t
                  vmxnor.mm  v21,v28,v14
                  vfirst.m zero,v15
                  vpopc.m zero,v2
                  vmaxu.vv   v15,v9,v23,v0.t
                  vmax.vv    v2,v4,v9
                  vmax.vx    v22,v10,t1,v0.t
                  vid.v v17,v0.t
                  xor        t1, s11, a7
                  sltiu      s1, s0, 213
                  mulhu      s7, a6, s1
                  vmand.mm   v9,v5,v22
                  vmsleu.vi  v24,v19,0,v0.t
                  and        ra, a1, a6
                  lui        s2, 279202
                  remu       sp, s0, ra
                  vmulh.vx   v15,v21,t3
                  vminu.vv   v14,v22,v5,v0.t
                  vmin.vx    v22,v20,s2,v0.t
                  vsrl.vi    v9,v9,0,v0.t
                  vmor.mm    v16,v11,v23
                  vsrl.vv    v29,v29,v24,v0.t
                  viota.m v29,v3
                  vmandnot.mm v23,v30,v14
                  vslidedown.vx v11,v2,t3
                  remu       ra, a1, a2
                  or         a4, sp, ra
                  slli       a4, a2, 26
                  vid.v v4,v0.t
                  vrgather.vv v9,v12,v19,v0.t
                  mulh       tp, a1, ra
                  sltiu      s2, s4, -788
                  vmsle.vi   v30,v13,0
                  vmor.mm    v23,v7,v14
                  vmslt.vx   v29,v15,s5,v0.t
                  vmulhu.vv  v27,v2,v29
                  vmnand.mm  v7,v12,v22
                  vfirst.m zero,v0,v0.t
                  sra        a3, zero, s9
                  vmul.vv    v17,v26,v11,v0.t
                  lui        t0, 410020
                  rem        t1, t5, s4
                  vmin.vx    v12,v4,zero,v0.t
                  vmsle.vv   v28,v16,v19
                  sll        t6, s6, zero
                  vmslt.vv   v7,v3,v10
                  vslide1up.vx v16,v12,tp,v0.t
                  rem        sp, s5, tp
                  vsub.vx    v7,v14,a7
                  vmsne.vv   v25,v31,v23
                  vadd.vv    v6,v22,v5,v0.t
                  vmxor.mm   v6,v24,v20
                  divu       t0, a7, t5
                  srl        s11, t3, s6
                  mulhsu     s8, a4, tp
                  vmsbf.m v2,v24,v0.t
                  vor.vx     v28,v10,s10
                  ori        a5, zero, 360
                  srai       t6, a3, 20
                  vmin.vv    v15,v7,v7,v0.t
                  vslideup.vx v15,v22,s8,v0.t
                  slti       s8, t3, -920
                  vmadd.vx   v16,a3,v5
                  vmsltu.vv  v12,v0,v24,v0.t
                  slli       tp, a3, 0
                  vmxor.mm   v28,v5,v8
                  vslidedown.vi v10,v24,0
                  xori       tp, a2, -739
                  sra        s7, s3, s7
                  vmsne.vv   v21,v12,v6
                  vminu.vv   v0,v16,v12
                  and        tp, s8, s9
                  vmseq.vi   v12,v11,0
                  vmv.x.s zero,v5
                  vmul.vv    v23,v10,v21,v0.t
                  vadd.vx    v19,v4,t6
                  vmax.vv    v2,v12,v13,v0.t
                  vmsbf.m v11,v30
                  vmsle.vv   v13,v1,v3
                  vmandnot.mm v18,v15,v1
                  sra        t0, s5, s3
                  vid.v v4,v0.t
                  addi       t0, t3, 676
                  vmornot.mm v13,v28,v1
                  vmax.vv    v17,v23,v8,v0.t
                  vmin.vv    v25,v3,v18
                  or         s8, s4, s7
                  sub        s1, a2, s2
                  vslide1down.vx v13,v28,s11,v0.t
                  vmseq.vv   v0,v28,v19
                  sll        t0, s11, s8
                  rem        a2, a6, s1
                  lui        a4, 303152
                  vmornot.mm v11,v17,v0
                  andi       t2, s8, 968
                  mulhsu     t2, a4, a4
                  mulh       s1, t2, t5
                  vmand.mm   v13,v26,v28
                  vmsgt.vi   v12,v16,0,v0.t
                  vmv.x.s zero,v19
                  vmandnot.mm v27,v2,v12
                  vmnor.mm   v21,v8,v13
                  vmulhu.vv  v3,v5,v9
                  add        s0, tp, s9
                  vmul.vx    v22,v8,a3,v0.t
                  vmsbf.m v20,v7,v0.t
                  mul        sp, a6, a0
                  vrgather.vi v14,v24,0
                  vmseq.vx   v13,v11,s0,v0.t
                  vid.v v26,v0.t
                  vmsif.m v7,v4
                  vmsbf.m v23,v1,v0.t
                  andi       tp, s7, 240
                  vmadd.vv   v2,v11,v1,v0.t
                  vsub.vx    v12,v24,zero
                  auipc      s8, 56187
                  div        t2, s2, s8
                  srai       zero, s4, 0
                  andi       s0, t5, -302
                  rem        t5, t2, s1
                  vmv.s.x v9,s2
                  vsub.vx    v1,v5,gp
                  vmul.vv    v19,v19,v3
                  vslidedown.vi v0,v4,0
                  vmand.mm   v22,v7,v19
                  vmnand.mm  v3,v13,v17
                  vmsof.m v7,v8,v0.t
                  vmnor.mm   v6,v8,v18
                  vmsof.m v4,v6,v0.t
                  xori       zero, s0, 344
                  rem        ra, sp, gp
                  vslide1up.vx v0,v21,a7
                  vpopc.m zero,v13
                  mulh       zero, gp, t5
                  rem        t5, ra, a5
                  vfirst.m zero,v1
                  slt        ra, a5, s8
                  vxor.vi    v15,v3,0,v0.t
                  vmul.vv    v28,v0,v19,v0.t
                  xori       s7, a2, 245
                  vmulhu.vv  v8,v2,v22
                  or         t2, t1, t1
                  xori       s7, s3, 391
                  srli       a3, a3, 21
                  sll        a1, t0, tp
                  or         tp, s4, t4
                  vadc.vim   v28,v8,0,v0
                  sub        s5, s0, s5
                  vmxor.mm   v11,v28,v23
                  vfirst.m zero,v30,v0.t
                  vmsbf.m v20,v28
                  xori       a2, t1, -395
                  vslidedown.vi v28,v26,0,v0.t
                  vmsne.vx   v22,v21,gp
                  slt        t4, t1, tp
                  div        a2, t6, s5
                  srli       a7, s5, 19
                  vmsleu.vv  v29,v23,v5,v0.t
                  vsrl.vv    v17,v17,v6,v0.t
                  vadd.vv    v13,v26,v17,v0.t
                  vmulh.vx   v31,v25,ra
                  srl        s7, t4, a3
                  vmor.mm    v4,v31,v7
                  vadd.vv    v2,v23,v15
                  vmsof.m v1,v9
                  vmsif.m v18,v13,v0.t
                  remu       s1, gp, a5
                  vsrl.vx    v18,v30,s5,v0.t
                  vmand.mm   v17,v21,v22
                  vslide1up.vx v12,v17,t2,v0.t
                  vxor.vv    v15,v3,v28,v0.t
                  vslideup.vx v13,v4,a6
                  add        s4, a5, a2
                  vadd.vx    v5,v31,t6,v0.t
                  and        s8, t4, s9
                  or         t0, s10, a6
                  viota.m v26,v25,v0.t
                  srl        s1, s6, a2
                  vmacc.vv   v15,v20,v28,v0.t
                  vmnand.mm  v13,v11,v31
                  vmandnot.mm v8,v4,v27
                  vmxor.mm   v31,v6,v8
                  slli       gp, a3, 17
                  slt        a1, a4, s10
                  and        s6, t1, s11
                  xor        t2, s11, tp
                  sub        t1, t2, a5
                  vmandnot.mm v11,v31,v23
                  vmand.mm   v27,v3,v13
                  vmv.v.x v19,a0
                  vmulhsu.vx v13,v31,s0,v0.t
                  or         s8, s4, zero
                  mulh       t4, s2, s1
                  or         gp, a3, t4
                  vand.vi    v21,v14,0
                  vsbc.vxm   v14,v11,a0,v0
                  mulh       sp, t0, gp
                  vsub.vx    v27,v26,a4,v0.t
                  vmsgt.vx   v8,v9,s4,v0.t
                  vxor.vi    v21,v27,0
                  lui        zero, 270462
                  vmaxu.vv   v3,v28,v23,v0.t
                  vmsltu.vx  v23,v8,t6
                  vmsgtu.vx  v24,v28,t3
                  vmaxu.vv   v31,v15,v30
                  addi       s11, s4, 341
                  vmslt.vv   v31,v8,v28,v0.t
                  vmornot.mm v10,v30,v30
                  vmxnor.mm  v3,v27,v16
                  vpopc.m zero,v19
                  viota.m v15,v5,v0.t
                  vmin.vv    v20,v8,v6,v0.t
                  vmulhsu.vx v4,v24,s10
                  srai       t6, t2, 30
                  vand.vx    v26,v28,a2
                  vmadd.vx   v14,a7,v23
                  vmsbf.m v30,v5
                  vmsltu.vx  v7,v8,s4
                  vsrl.vv    v30,v31,v9
                  or         s7, s11, t1
                  vslide1up.vx v18,v15,a7,v0.t
                  mulhu      zero, a3, s7
                  mulhu      t6, a6, a2
                  sltiu      s5, s10, 130
                  div        a1, s1, s4
                  vmsle.vv   v19,v2,v18
                  vmsbf.m v30,v8,v0.t
                  vsub.vv    v4,v24,v14,v0.t
                  sub        t5, a5, s2
                  and        sp, a7, s4
                  viota.m v9,v19
                  sltu       s7, t1, a7
                  rem        t3, t5, a2
                  sltiu      s2, s11, -581
                  vid.v v31,v0.t
                  vmsne.vi   v31,v25,0
                  xor        a2, s4, t1
                  vmxor.mm   v10,v10,v26
                  srai       s2, s8, 2
                  vmand.mm   v13,v27,v25
                  vmacc.vx   v12,t0,v26,v0.t
                  vmnand.mm  v24,v19,v14
                  srli       a7, t6, 2
                  auipc      s2, 827675
                  vrgather.vv v18,v9,v23
                  vminu.vx   v23,v29,s9,v0.t
                  vmv.x.s zero,v1
                  vslidedown.vi v6,v17,0,v0.t
                  vsrl.vx    v27,v27,t5,v0.t
                  sub        s6, a7, sp
                  vmsof.m v25,v13
                  la x25, test_done
                  jalr x0, x25, 0
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
                  1: addi x19, x19, -124
                  sw  x1, 4(x19)
                  sw  x2, 8(x19)
                  sw  x3, 12(x19)
                  sw  x4, 16(x19)
                  sw  x5, 20(x19)
                  sw  x6, 24(x19)
                  sw  x7, 28(x19)
                  sw  x8, 32(x19)
                  sw  x9, 36(x19)
                  sw  x10, 40(x19)
                  sw  x11, 44(x19)
                  sw  x12, 48(x19)
                  sw  x13, 52(x19)
                  sw  x14, 56(x19)
                  sw  x15, 60(x19)
                  sw  x16, 64(x19)
                  sw  x17, 68(x19)
                  sw  x18, 72(x19)
                  sw  x19, 76(x19)
                  sw  x20, 80(x19)
                  sw  x21, 84(x19)
                  sw  x22, 88(x19)
                  sw  x23, 92(x19)
                  sw  x24, 96(x19)
                  sw  x25, 100(x19)
                  sw  x26, 104(x19)
                  sw  x27, 108(x19)
                  sw  x28, 112(x19)
                  sw  x29, 116(x19)
                  sw  x30, 120(x19)
                  sw  x31, 124(x19)
                  csrr x11, 0x341 # MEPC
                  csrr x11, 0x342 # MCAUSE
                  li x18, 0x3 # BREAKPOINT
                  beq x11, x18, ebreak_handler
                  li x18, 0x8 # ECALL_UMODE
                  beq x11, x18, ecall_handler
                  li x18, 0x9 # ECALL_SMODE
                  beq x11, x18, ecall_handler
                  li x18, 0xb # ECALL_MMODE
                  beq x11, x18, ecall_handler
                  li x18, 0x1
                  beq x11, x18, instr_fault_handler
                  li x18, 0x5
                  beq x11, x18, load_fault_handler
                  li x18, 0x7
                  beq x11, x18, store_fault_handler
                  li x18, 0xc
                  beq x11, x18, pt_fault_handler
                  li x18, 0xd
                  beq x11, x18, pt_fault_handler
                  li x18, 0xf
                  beq x11, x18, pt_fault_handler
                  li x18, 0x2 # ILLEGAL_INSTRUCTION
                  beq x11, x18, illegal_instr_handler
                  csrr x18, 0x343 # MTVAL
                  1: la x25, test_done
                  jalr x1, x25, 0

ecall_handler:    
                  la x11, _start
                  sw x0, 0(x11)
                  sw x1, 4(x11)
                  sw x2, 8(x11)
                  sw x3, 12(x11)
                  sw x4, 16(x11)
                  sw x5, 20(x11)
                  sw x6, 24(x11)
                  sw x7, 28(x11)
                  sw x8, 32(x11)
                  sw x9, 36(x11)
                  sw x10, 40(x11)
                  sw x11, 44(x11)
                  sw x12, 48(x11)
                  sw x13, 52(x11)
                  sw x14, 56(x11)
                  sw x15, 60(x11)
                  sw x16, 64(x11)
                  sw x17, 68(x11)
                  sw x18, 72(x11)
                  sw x19, 76(x11)
                  sw x20, 80(x11)
                  sw x21, 84(x11)
                  sw x22, 88(x11)
                  sw x23, 92(x11)
                  sw x24, 96(x11)
                  sw x25, 100(x11)
                  sw x26, 104(x11)
                  sw x27, 108(x11)
                  sw x28, 112(x11)
                  sw x29, 116(x11)
                  sw x30, 120(x11)
                  sw x31, 124(x11)
                  la x25, write_tohost
                  jalr x0, x25, 0

instr_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x1, 0
                  0: csrr x11, 0x340
                  mv x25, x11
                  li x25, 0
                  beq x11, x25, 1f
                  1: csrr x18, 0x3b0
                  csrr x29, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x25, x23, x11
                  addi x25, x25, -1
                  slli x25, x25, 3
                  sll x23, x29, x25
                  slli x11, x11, 3
                  add x25, x25, x11
                  srl x23, x23, x25
                  slli x25, x23, 27
                  srli x25, x25, 30
                  beqz x25, 20f
                  li x11, 1
                  beq x25, x11, 21f
                  li x11, 2
                  beq x25, x11, 25f
                  li x11, 3
                  beq x25, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x1, x18
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x18, 1
                  ble x18, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x25, 0x343
                  srli x25, x25, 2
                  bnez x11, 22f
                  bltz x25, 18b
                  j 23f
                  22: bgtu x1, x25, 18b
                  23: bleu x18, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x25, x18, 2
                  srli x25, x25, 2
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x25, x18, 2
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x23, x23, 4
                  csrr x11, 0x340
                  li x25, 30
                  sll x11, x11, x25
                  srl x11, x11, x25
                  slli x25, x11, 3
                  sll x23, x23, x25
                  or x29, x29, x23
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x25, 1
                  beq x11, x25, 31f
                  li x25, 2
                  beq x11, x25, 32f
                  li x25, 3
                  beq x11, x25, 33f
                  30: csrw 0x3a0, x29
                  j 34f
                  31: csrw 0x3a1, x29
                  j 34f
                  32: csrw 0x3a2, x29
                  j 34f
                  33: csrw 0x3a3, x29
                  34: nop
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
                  mret

load_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x1, 0
                  0: csrr x11, 0x340
                  mv x25, x11
                  li x25, 0
                  beq x11, x25, 1f
                  1: csrr x18, 0x3b0
                  csrr x29, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x25, x23, x11
                  addi x25, x25, -1
                  slli x25, x25, 3
                  sll x23, x29, x25
                  slli x11, x11, 3
                  add x25, x25, x11
                  srl x23, x23, x25
                  slli x25, x23, 27
                  srli x25, x25, 30
                  beqz x25, 20f
                  li x11, 1
                  beq x25, x11, 21f
                  li x11, 2
                  beq x25, x11, 25f
                  li x11, 3
                  beq x25, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x1, x18
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x18, 1
                  ble x18, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x25, 0x343
                  srli x25, x25, 2
                  bnez x11, 22f
                  bltz x25, 18b
                  j 23f
                  22: bgtu x1, x25, 18b
                  23: bleu x18, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x25, x18, 2
                  srli x25, x25, 2
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x25, x18, 2
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x23, x23, 1
                  csrr x11, 0x340
                  li x25, 30
                  sll x11, x11, x25
                  srl x11, x11, x25
                  slli x25, x11, 3
                  sll x23, x23, x25
                  or x29, x29, x23
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x25, 1
                  beq x11, x25, 31f
                  li x25, 2
                  beq x11, x25, 32f
                  li x25, 3
                  beq x11, x25, 33f
                  30: csrw 0x3a0, x29
                  j 34f
                  31: csrw 0x3a1, x29
                  j 34f
                  32: csrw 0x3a2, x29
                  j 34f
                  33: csrw 0x3a3, x29
                  34: nop
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
                  mret

store_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x1, 0
                  0: csrr x11, 0x340
                  mv x25, x11
                  li x25, 0
                  beq x11, x25, 1f
                  1: csrr x18, 0x3b0
                  csrr x29, 0x3a0
                  j 17f
                  17: li x23, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x25, x23, x11
                  addi x25, x25, -1
                  slli x25, x25, 3
                  sll x23, x29, x25
                  slli x11, x11, 3
                  add x25, x25, x11
                  srl x23, x23, x25
                  slli x25, x23, 27
                  srli x25, x25, 30
                  beqz x25, 20f
                  li x11, 1
                  beq x25, x11, 21f
                  li x11, 2
                  beq x25, x11, 25f
                  li x11, 3
                  beq x25, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x1, x18
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x18, 1
                  ble x18, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x25, 0x343
                  srli x25, x25, 2
                  bnez x11, 22f
                  bltz x25, 18b
                  j 23f
                  22: bgtu x1, x25, 18b
                  23: bleu x18, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x25, x18, 2
                  srli x25, x25, 2
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x25, x18, 2
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  bne x11, x25, 18b
                  andi x25, x23, 128
                  beqz x25, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x23, x23, 3
                  csrr x11, 0x340
                  li x25, 30
                  sll x11, x11, x25
                  srl x11, x11, x25
                  slli x25, x11, 3
                  sll x23, x23, x25
                  or x29, x29, x23
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x25, 1
                  beq x11, x25, 31f
                  li x25, 2
                  beq x11, x25, 32f
                  li x25, 3
                  beq x11, x25, 33f
                  30: csrw 0x3a0, x29
                  j 34f
                  31: csrw 0x3a1, x29
                  j 34f
                  32: csrw 0x3a2, x29
                  j 34f
                  33: csrw 0x3a3, x29
                  34: nop
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
                  mret

ebreak_handler:   
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
                  mret

illegal_instr_handler:
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x11, 0x300 # MSTATUS;
                  csrr  x11, 0x304 # MIE;
                  csrr  x11, 0x344 # MIP;
                  csrrc x11, 0x344, x11 # MIP;
                  lw  x1, 4(x19)
                  lw  x2, 8(x19)
                  lw  x3, 12(x19)
                  lw  x4, 16(x19)
                  lw  x5, 20(x19)
                  lw  x6, 24(x19)
                  lw  x7, 28(x19)
                  lw  x8, 32(x19)
                  lw  x9, 36(x19)
                  lw  x10, 40(x19)
                  lw  x11, 44(x19)
                  lw  x12, 48(x19)
                  lw  x13, 52(x19)
                  lw  x14, 56(x19)
                  lw  x15, 60(x19)
                  lw  x16, 64(x19)
                  lw  x17, 68(x19)
                  lw  x18, 72(x19)
                  lw  x19, 76(x19)
                  lw  x20, 80(x19)
                  lw  x21, 84(x19)
                  lw  x22, 88(x19)
                  lw  x23, 92(x19)
                  lw  x24, 96(x19)
                  lw  x25, 100(x19)
                  lw  x26, 104(x19)
                  lw  x27, 108(x19)
                  lw  x28, 112(x19)
                  lw  x29, 116(x19)
                  lw  x30, 120(x19)
                  lw  x31, 124(x19)
                  addi x19, x19, 124
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
