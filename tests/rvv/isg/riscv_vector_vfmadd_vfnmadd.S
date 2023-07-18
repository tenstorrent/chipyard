.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x11, 0x40201123
                  csrw 0x301, x11
                  csrr x31, 0x301
kernel_sp:        
                  la x6, kernel_stack_end

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
                  li x0, 0x36975961
                  li x1, 0xd9cb9a09
                  li x2, 0x2eac298d
                  li x3, 0xfa18af15
                  li x4, 0x48c044a2
                  li x7, 0xf03d8438
                  li x8, 0xf6538658
                  li x9, 0x80000000
                  li x10, 0x80000000
                  li x11, 0xf5b14a7a
                  li x12, 0xf9c143c1
                  li x13, 0x80000000
                  li x14, 0xee353b6f
                  li x15, 0xab879622
                  li x16, 0x80000000
                  li x17, 0xd08f98d
                  li x18, 0xf165d0a9
                  li x19, 0x71936297
                  li x20, 0xf32794d1
                  li x21, 0xfbbb15d6
                  li x22, 0x982b878d
                  li x23, 0x80000000
                  li x24, 0xfa793349
                  li x25, 0x80000000
                  li x26, 0xfb6fa4e0
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0xf40d0397
                  li x31, 0x80000000
                  la x5, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x10, 4
                  vsetvli x11, x10, e32, m1
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
                  li x11, 0xcce616bb
                  vslide1up.vx v0, v1, x11
                  vmv.v.v v0, v0
                  li x11, 0xae722bc4
                  vslide1up.vx v0, v1, x11
                  vmv.v.v v0, v0
                  li x11, 0x777975a2
                  vslide1up.vx v0, v1, x11
                  vmv.v.v v0, v0
                  li x11, 0x7a59fdee
                  vslide1up.vx v0, v1, x11
                  li x11, 0xe044b5f2
                  vslide1up.vx v1, v0, x11
                  vmv.v.v v0, v1
                  li x11, 0x4760fab1
                  vslide1up.vx v1, v0, x11
                  vmv.v.v v0, v1
                  li x11, 0x6b7d10e6
                  vslide1up.vx v1, v0, x11
                  vmv.v.v v0, v1
                  li x11, 0xce5d38d9
                  vslide1up.vx v1, v0, x11
                  li x11, 0xba20c865
                  vslide1up.vx v2, v0, x11
                  vmv.v.v v0, v2
                  li x11, 0x7d3cb949
                  vslide1up.vx v2, v0, x11
                  vmv.v.v v0, v2
                  li x11, 0xc6cc199c
                  vslide1up.vx v2, v0, x11
                  vmv.v.v v0, v2
                  li x11, 0x11c5bbb6
                  vslide1up.vx v2, v0, x11
                  li x11, 0xff9976f
                  vslide1up.vx v3, v0, x11
                  vmv.v.v v0, v3
                  li x11, 0x285b5
                  vslide1up.vx v3, v0, x11
                  vmv.v.v v0, v3
                  li x11, 0xd49aba5b
                  vslide1up.vx v3, v0, x11
                  vmv.v.v v0, v3
                  li x11, 0x863ddf6a
                  vslide1up.vx v3, v0, x11
                  li x11, 0xe82d567b
                  vslide1up.vx v4, v0, x11
                  vmv.v.v v0, v4
                  li x11, 0xe48942ae
                  vslide1up.vx v4, v0, x11
                  vmv.v.v v0, v4
                  li x11, 0x26c46a6e
                  vslide1up.vx v4, v0, x11
                  vmv.v.v v0, v4
                  li x11, 0xdf975aa8
                  vslide1up.vx v4, v0, x11
                  li x11, 0xe570bd74
                  vslide1up.vx v5, v0, x11
                  vmv.v.v v0, v5
                  li x11, 0x431734c2
                  vslide1up.vx v5, v0, x11
                  vmv.v.v v0, v5
                  li x11, 0x8d461fbd
                  vslide1up.vx v5, v0, x11
                  vmv.v.v v0, v5
                  li x11, 0x1ec441d2
                  vslide1up.vx v5, v0, x11
                  li x11, 0x2f081398
                  vslide1up.vx v6, v0, x11
                  vmv.v.v v0, v6
                  li x11, 0xefe1ffe2
                  vslide1up.vx v6, v0, x11
                  vmv.v.v v0, v6
                  li x11, 0x11bda28b
                  vslide1up.vx v6, v0, x11
                  vmv.v.v v0, v6
                  li x11, 0xcb0f722a
                  vslide1up.vx v6, v0, x11
                  li x11, 0x9cb58ccf
                  vslide1up.vx v7, v0, x11
                  vmv.v.v v0, v7
                  li x11, 0x99282991
                  vslide1up.vx v7, v0, x11
                  vmv.v.v v0, v7
                  li x11, 0x3143539c
                  vslide1up.vx v7, v0, x11
                  vmv.v.v v0, v7
                  li x11, 0x8555b8
                  vslide1up.vx v7, v0, x11
                  li x11, 0x447b9151
                  vslide1up.vx v8, v0, x11
                  vmv.v.v v0, v8
                  li x11, 0x9d575216
                  vslide1up.vx v8, v0, x11
                  vmv.v.v v0, v8
                  li x11, 0x59750c85
                  vslide1up.vx v8, v0, x11
                  vmv.v.v v0, v8
                  li x11, 0x820bd9d8
                  vslide1up.vx v8, v0, x11
                  li x11, 0x6c907488
                  vslide1up.vx v9, v0, x11
                  vmv.v.v v0, v9
                  li x11, 0xfc354594
                  vslide1up.vx v9, v0, x11
                  vmv.v.v v0, v9
                  li x11, 0xc433a7a4
                  vslide1up.vx v9, v0, x11
                  vmv.v.v v0, v9
                  li x11, 0x91578faa
                  vslide1up.vx v9, v0, x11
                  li x11, 0x4a3edbc7
                  vslide1up.vx v10, v0, x11
                  vmv.v.v v0, v10
                  li x11, 0xa7abfe66
                  vslide1up.vx v10, v0, x11
                  vmv.v.v v0, v10
                  li x11, 0x28f4bf57
                  vslide1up.vx v10, v0, x11
                  vmv.v.v v0, v10
                  li x11, 0xee8ecc3
                  vslide1up.vx v10, v0, x11
                  li x11, 0x90872805
                  vslide1up.vx v11, v0, x11
                  vmv.v.v v0, v11
                  li x11, 0xfb575f76
                  vslide1up.vx v11, v0, x11
                  vmv.v.v v0, v11
                  li x11, 0x294716b1
                  vslide1up.vx v11, v0, x11
                  vmv.v.v v0, v11
                  li x11, 0x2f354904
                  vslide1up.vx v11, v0, x11
                  li x11, 0x40d26df9
                  vslide1up.vx v12, v0, x11
                  vmv.v.v v0, v12
                  li x11, 0x877295da
                  vslide1up.vx v12, v0, x11
                  vmv.v.v v0, v12
                  li x11, 0x1594d038
                  vslide1up.vx v12, v0, x11
                  vmv.v.v v0, v12
                  li x11, 0xfd56d08c
                  vslide1up.vx v12, v0, x11
                  li x11, 0xdc6ec9ab
                  vslide1up.vx v13, v0, x11
                  vmv.v.v v0, v13
                  li x11, 0x4ff89e1c
                  vslide1up.vx v13, v0, x11
                  vmv.v.v v0, v13
                  li x11, 0xd5a0816e
                  vslide1up.vx v13, v0, x11
                  vmv.v.v v0, v13
                  li x11, 0x89c587b3
                  vslide1up.vx v13, v0, x11
                  li x11, 0x1ae0a64f
                  vslide1up.vx v14, v0, x11
                  vmv.v.v v0, v14
                  li x11, 0xdc498b6a
                  vslide1up.vx v14, v0, x11
                  vmv.v.v v0, v14
                  li x11, 0x4bc149e8
                  vslide1up.vx v14, v0, x11
                  vmv.v.v v0, v14
                  li x11, 0xee47109d
                  vslide1up.vx v14, v0, x11
                  li x11, 0xf4442f33
                  vslide1up.vx v15, v0, x11
                  vmv.v.v v0, v15
                  li x11, 0x30e16e3c
                  vslide1up.vx v15, v0, x11
                  vmv.v.v v0, v15
                  li x11, 0xaae488ee
                  vslide1up.vx v15, v0, x11
                  vmv.v.v v0, v15
                  li x11, 0xa014a0e4
                  vslide1up.vx v15, v0, x11
                  li x11, 0xcf077852
                  vslide1up.vx v16, v0, x11
                  vmv.v.v v0, v16
                  li x11, 0xc1bb12f4
                  vslide1up.vx v16, v0, x11
                  vmv.v.v v0, v16
                  li x11, 0xa256f3cc
                  vslide1up.vx v16, v0, x11
                  vmv.v.v v0, v16
                  li x11, 0xa999116b
                  vslide1up.vx v16, v0, x11
                  li x11, 0xe9247dd6
                  vslide1up.vx v17, v0, x11
                  vmv.v.v v0, v17
                  li x11, 0xf641ef49
                  vslide1up.vx v17, v0, x11
                  vmv.v.v v0, v17
                  li x11, 0x42c84029
                  vslide1up.vx v17, v0, x11
                  vmv.v.v v0, v17
                  li x11, 0x8b82071a
                  vslide1up.vx v17, v0, x11
                  li x11, 0x4c8d3b2e
                  vslide1up.vx v18, v0, x11
                  vmv.v.v v0, v18
                  li x11, 0x95bdb8a5
                  vslide1up.vx v18, v0, x11
                  vmv.v.v v0, v18
                  li x11, 0x6d876401
                  vslide1up.vx v18, v0, x11
                  vmv.v.v v0, v18
                  li x11, 0xebdff7b0
                  vslide1up.vx v18, v0, x11
                  li x11, 0x69479757
                  vslide1up.vx v19, v0, x11
                  vmv.v.v v0, v19
                  li x11, 0xd1fadc08
                  vslide1up.vx v19, v0, x11
                  vmv.v.v v0, v19
                  li x11, 0x5048df2d
                  vslide1up.vx v19, v0, x11
                  vmv.v.v v0, v19
                  li x11, 0x88c50df
                  vslide1up.vx v19, v0, x11
                  li x11, 0x2a3342d2
                  vslide1up.vx v20, v0, x11
                  vmv.v.v v0, v20
                  li x11, 0x4e89e5eb
                  vslide1up.vx v20, v0, x11
                  vmv.v.v v0, v20
                  li x11, 0xad0a8ed0
                  vslide1up.vx v20, v0, x11
                  vmv.v.v v0, v20
                  li x11, 0x51c40ee3
                  vslide1up.vx v20, v0, x11
                  li x11, 0xa4ab21e7
                  vslide1up.vx v21, v0, x11
                  vmv.v.v v0, v21
                  li x11, 0x38b7c178
                  vslide1up.vx v21, v0, x11
                  vmv.v.v v0, v21
                  li x11, 0xc83b4f5b
                  vslide1up.vx v21, v0, x11
                  vmv.v.v v0, v21
                  li x11, 0xb824622e
                  vslide1up.vx v21, v0, x11
                  li x11, 0x48b898bb
                  vslide1up.vx v22, v0, x11
                  vmv.v.v v0, v22
                  li x11, 0xddb794c4
                  vslide1up.vx v22, v0, x11
                  vmv.v.v v0, v22
                  li x11, 0xd4c487d3
                  vslide1up.vx v22, v0, x11
                  vmv.v.v v0, v22
                  li x11, 0xc1e2a8f3
                  vslide1up.vx v22, v0, x11
                  li x11, 0xb5adc0a6
                  vslide1up.vx v23, v0, x11
                  vmv.v.v v0, v23
                  li x11, 0x4dc359b3
                  vslide1up.vx v23, v0, x11
                  vmv.v.v v0, v23
                  li x11, 0x29a797b0
                  vslide1up.vx v23, v0, x11
                  vmv.v.v v0, v23
                  li x11, 0x8f3147ce
                  vslide1up.vx v23, v0, x11
                  li x11, 0x40b1e48
                  vslide1up.vx v24, v0, x11
                  vmv.v.v v0, v24
                  li x11, 0xd7c13c35
                  vslide1up.vx v24, v0, x11
                  vmv.v.v v0, v24
                  li x11, 0xe3352804
                  vslide1up.vx v24, v0, x11
                  vmv.v.v v0, v24
                  li x11, 0xbfe73dec
                  vslide1up.vx v24, v0, x11
                  li x11, 0x54171edb
                  vslide1up.vx v25, v0, x11
                  vmv.v.v v0, v25
                  li x11, 0x8cbf909a
                  vslide1up.vx v25, v0, x11
                  vmv.v.v v0, v25
                  li x11, 0x3f3a4885
                  vslide1up.vx v25, v0, x11
                  vmv.v.v v0, v25
                  li x11, 0x2b47ed06
                  vslide1up.vx v25, v0, x11
                  li x11, 0x65ba25f9
                  vslide1up.vx v26, v0, x11
                  vmv.v.v v0, v26
                  li x11, 0xca40eda9
                  vslide1up.vx v26, v0, x11
                  vmv.v.v v0, v26
                  li x11, 0x49a86f51
                  vslide1up.vx v26, v0, x11
                  vmv.v.v v0, v26
                  li x11, 0x29c42045
                  vslide1up.vx v26, v0, x11
                  li x11, 0x1a942f17
                  vslide1up.vx v27, v0, x11
                  vmv.v.v v0, v27
                  li x11, 0xf0c85413
                  vslide1up.vx v27, v0, x11
                  vmv.v.v v0, v27
                  li x11, 0x402f6e69
                  vslide1up.vx v27, v0, x11
                  vmv.v.v v0, v27
                  li x11, 0x125982fe
                  vslide1up.vx v27, v0, x11
                  li x11, 0x947a8d2a
                  vslide1up.vx v28, v0, x11
                  vmv.v.v v0, v28
                  li x11, 0x4f4b5886
                  vslide1up.vx v28, v0, x11
                  vmv.v.v v0, v28
                  li x11, 0x6d3106f4
                  vslide1up.vx v28, v0, x11
                  vmv.v.v v0, v28
                  li x11, 0xb68ce63a
                  vslide1up.vx v28, v0, x11
                  li x11, 0xa4d18eaa
                  vslide1up.vx v29, v0, x11
                  vmv.v.v v0, v29
                  li x11, 0x48c01cb
                  vslide1up.vx v29, v0, x11
                  vmv.v.v v0, v29
                  li x11, 0x35f79295
                  vslide1up.vx v29, v0, x11
                  vmv.v.v v0, v29
                  li x11, 0x7eae2665
                  vslide1up.vx v29, v0, x11
                  li x11, 0x79237393
                  vslide1up.vx v30, v0, x11
                  vmv.v.v v0, v30
                  li x11, 0xa5f418de
                  vslide1up.vx v30, v0, x11
                  vmv.v.v v0, v30
                  li x11, 0xc5fd7535
                  vslide1up.vx v30, v0, x11
                  vmv.v.v v0, v30
                  li x11, 0x9278a0f
                  vslide1up.vx v30, v0, x11
                  li x11, 0xf3e77178
                  vslide1up.vx v31, v0, x11
                  vmv.v.v v0, v31
                  li x11, 0x676e463e
                  vslide1up.vx v31, v0, x11
                  vmv.v.v v0, v31
                  li x11, 0xf5cfcd90
                  vslide1up.vx v31, v0, x11
                  vmv.v.v v0, v31
                  li x11, 0xe56f1879
                  vslide1up.vx v31, v0, x11
li x10, 4
                  vsetvli x11, x10, e32, m1
main:             and        sp, t4, s11
                  mulhu      gp, a1, s10
                  vmadd.vx   v4,t2,v27,v0.t
                  vsaddu.vv  v31,v1,v27,v0.t
                  sltu       t6, zero, zero
                  vfmadd.vv   v31,v2,v2,v0.t
                  vfmadd.vf   v11,ft7,v29
                  lui        s2, 712107
                  vfmadd.vv   v13,v12,v24,v0.t
                  rem        a0, s2, s11
                  add        s11, t4, s9
                  srai       s7, a7, 31
                  vsub.vx    v25,v0,s4,v0.t
                  xor        a7, t6, s9
                  slti       t3, sp, -861
                  vsub.vv    v17,v23,v16
                  lui        s11, 40553
                  mul        s8, a0, s0
                  divu       s3, s2, a3
                  add        s8, s7, t0
                  andi       s8, sp, -779
                  slli       tp, a1, 3
                  srai       a1, s11, 5
                  sra        a4, s7, s11
                  vsadd.vv   v23,v10,v17,v0.t
                  and        zero, t5, t6
                  vfnmadd.vv   v29,v30,v23,v0.t
                  srl        s1, s9, s3
                  mulhsu     s7, s10, t4
                  andi       a3, s3, -619
                  srl        t5, s8, t6
                  srai       a5, t1, 30
                  auipc      a1, 757494
                  vsll.vi    v2,v21,0
                  vsaddu.vv  v5,v3,v0
                  mul        ra, s3, a3
                  vsbc.vxm   v25,v20,s2,v0
                  sltiu      gp, s11, -1022
                  mulhu      t3, s8, s11
                  vadd.vx    v18,v31,a1
                  srli       s3, s9, 0
                  sltiu      s2, s1, 1018
                  srai       a2, gp, 21
                  add        s0, t4, t5
                  addi       s1, a3, -979
                  vrsub.vi   v15,v2,0
                  mul        ra, a3, s10
                  sll        a6, a2, a6
                  mulh       a0, a3, a7
                  lui        t5, 949934
                  vmsbc.vxm  v9,v16,a0,v0
                  vfnmadd.vv   v6,v24,v5,v0.t
                  addi       t6, s3, -888
                  rem        s0, t4, t5
                  mulhsu     zero, a2, a6
                  or         t5, t1, a7
                  lui        s7, 70706
                  slti       a4, s2, -55
                  vsaddu.vv  v8,v1,v20,v0.t
                  slli       t4, t5, 22
                  slli       a1, s7, 26
                  vmulh.vv   v16,v29,v15
                  slti       a7, tp, -390
                  mulhu      t6, a6, t4
#                  vmsbc.vv   v0,v28,v16
                  sub        t6, s8, s2
                  xori       t4, sp, 320
                  vmsbc.vv   v14,v24,v18
                  andi       s5, s10, 85
                  xor        s5, tp, s2
                  sltiu      a6, a2, 354
                  auipc      s2, 972294
                  addi       tp, sp, -500
                  vfmadd.vv   v15,v7,v21,v0.t
                  andi       zero, a3, 103
                  slt        s11, s2, s4
                  srl        s6, zero, a1
                  vadd.vv    v4,v25,v24,v0.t
                  mulhsu     a0, a1, s10
                  lui        s0, 94602
                  auipc      tp, 813706
                  sub        a7, t1, t4
                  mulhsu     t4, a4, s8
                  slti       a3, s7, 630
                  srl        s5, a3, a3
                  auipc      a3, 552467
                  slli       a0, a3, 30
                  ori        sp, s11, -630
                  vmsbc.vx   v24,v14,a4
                  vmsbc.vv   v17,v9,v11
                  ori        s3, s9, 982
                  slt        s1, s8, s5
                  vmadd.vv   v29,v29,v4
                  sll        a4, s1, s1
                  addi       s4, s11, -462
                  addi       s4, t1, 1019
                  vsll.vx    v10,v17,t6
                  xori       sp, gp, 951
                  lui        s3, 1019661
                  srli       sp, s8, 5
                  addi       s8, a5, 346
                  andi       s2, zero, 596
                  ori        s1, s2, 37
                  sltu       s4, t1, a2
                  vmadd.vx   v30,s11,v23
                  vsbc.vxm   v4,v9,s1,v0
                  addi       a7, s9, -725
                  srl        a6, a1, t6
                  slt        s2, s3, s5
                  sll        gp, gp, t0
                  srai       s1, s1, 14
                  slli       zero, gp, 5
                  vsbc.vvm   v15,v26,v7,v0
                  remu       t4, ra, tp
                  mulh       tp, s8, t2
                  rem        s1, s9, a3
                  vmulh.vx   v23,v5,tp
                  sub        a6, t3, s7
                  or         a1, s3, t4
                  vmulh.vx   v3,v21,t4
                  remu       t5, a6, a5
                  slt        s6, t4, t3
                  slt        t5, a0, t2
                  vadd.vv    v7,v23,v11
                  slti       ra, gp, 273
                  or         a2, s6, s1
                  srli       t3, s1, 11
                  vrsub.vi   v17,v11,0
                  srai       a1, t0, 13
                  addi       a1, t2, 989
                  xor        t3, t0, s3
                  vrsub.vi   v10,v14,0,v0.t
                  xori       a2, s9, -456
                  slt        t5, a7, s7
                  and        sp, t6, a7
                  mulhu      gp, a0, a3
                  auipc      a5, 1000694
                  vadd.vi    v16,v13,0
                  slt        a3, ra, s11
                  andi       s7, zero, 652
                  vrsub.vx   v16,v20,s4,v0.t
                  vrsub.vx   v1,v23,zero
                  div        t6, a0, s0
                  slt        a7, a6, s3
                  vsadd.vx   v23,v3,a1
                  sltu       tp, t1, s3
                  and        a6, a7, a4
                  addi       a2, t0, 100
                  mulh       a6, s8, a3
                  sll        a4, a1, s3
                  andi       s6, zero, -167
                  and        a3, sp, s2
                  slt        a4, a7, s7
                  vmsbc.vvm  v21,v28,v19,v0
                  mulhu      a5, t5, tp
                  andi       gp, sp, 106
                  mulhu      ra, s6, gp
                  sltu       a0, a4, a6
                  and        s2, s4, s2
                  slli       a6, t3, 27
                  vsaddu.vx  v18,v24,s3
                  vmsbc.vv   v9,v31,v7
                  sltu       t4, s9, gp
                  mulhu      t5, t4, t0
                  lui        a3, 776980
                  rem        s0, a0, s7
                  add        t6, a7, s2
                  sltu       a5, s8, s5
                  vmulh.vv   v30,v23,v12,v0.t
                  srai       s4, a2, 14
                  vsub.vx    v15,v13,tp
                  vmsbc.vxm  v17,v18,s1,v0
                  slli       s4, s2, 30
                  sub        s0, t3, s7
                  vadd.vx    v22,v27,tp
                  vfnmadd.vf   v5,ft8,v24
                  srli       s4, a5, 14
                  lui        a1, 806686
                  vadd.vv    v9,v28,v8
                  xori       a4, s10, 507
                  rem        t6, s2, s11
                  srl        a2, a2, a7
                  vadd.vx    v0,v24,t1
                  vsaddu.vx  v31,v11,s4,v0.t
                  vmadd.vx   v10,a1,v29
                  vsll.vx    v7,v29,s0
                  srl        s6, sp, a0
                  addi       gp, s9, 471
                  andi       sp, a4, 906
                  sub        a4, s7, a4
                  sll        a4, t6, a7
                  srli       a5, s1, 24
                  srai       s11, s7, 3
                  slt        s1, zero, a6
                  vmulh.vx   v13,v0,gp,v0.t
                  sra        ra, s10, a5
                  vrsub.vi   v21,v24,0,v0.t
                  mul        t4, s8, s0
                  xori       s5, a7, 194
                  or         s2, t0, sp
                  vfnmadd.vv   v30,v11,v18,v0.t
                  vsub.vx    v20,v10,t6
                  add        s9, a3, a1
                  and        s2, s4, t2
                  slli       a3, sp, 23
                  or         s8, s5, t4
                  vsub.vx    v2,v11,a4
                  vsub.vv    v25,v21,v0
                  vsadd.vx   v1,v28,t3
                  srai       a2, t3, 18
                  mulh       s6, t2, s1
                  vrsub.vx   v14,v15,t0
                  srli       s1, t4, 18
                  sll        a7, gp, t0
                  addi       a2, a1, 702
                  div        s9, a1, a0
                  vsadd.vv   v21,v25,v0,v0.t
                  sra        s11, tp, tp
                  vsub.vv    v19,v12,v27
                  remu       s11, a5, t4
                  vsbc.vvm   v17,v6,v9,v0
                  mulhsu     a6, s4, a2
                  div        s5, t5, t4
                  vsadd.vx   v14,v4,tp,v0.t
                  rem        s8, s4, s8
                  andi       zero, zero, -213
                  sll        zero, s11, t0
                  mul        sp, a2, s7
                  or         zero, s5, s11
                  srli       s10, sp, 12
                  sll        s7, a0, s8
                  remu       a1, s11, gp
                  srai       sp, s6, 13
                  andi       t3, s5, -18
                  vmadd.vv   v3,v27,v22
                  vsadd.vv   v26,v1,v30
                  srli       s4, s0, 11
                  and        gp, a7, a6
                  auipc      s4, 948439
                  vmadd.vx   v26,a2,v5,v0.t
                  vmulh.vv   v29,v12,v8,v0.t
                  and        s7, a1, a3
                  sub        gp, sp, s5
                  vsub.vv    v31,v28,v7,v0.t
                  vadd.vx    v27,v14,s6,v0.t
                  vmadd.vx   v25,s2,v18,v0.t
                  mulhsu     a0, s0, gp
                  vmsbc.vvm  v20,v8,v23,v0
                  add        a0, gp, s6
                  sub        s8, t0, s9
                  vfnmadd.vf   v21,fs6,v28
                  vsbc.vxm   v21,v23,s8,v0
                  sltu       s9, a0, t5
                  vmadd.vv   v30,v24,v26
                  vsaddu.vv  v16,v26,v29
                  srai       t6, t3, 5
                  addi       s7, t5, -772
                  vmadd.vx   v18,s4,v28,v0.t
                  divu       s11, a4, a2
                  vadd.vx    v0,v25,s0
                  divu       s2, s10, sp
                  sra        a4, tp, zero
                  slt        s7, s10, t5
                  vsub.vv    v6,v31,v20
                  srai       s7, t6, 18
                  mul        tp, s3, a2
                  div        tp, t1, s1
                  slli       sp, s11, 23
                  rem        s2, s5, s5
                  mulhsu     s2, ra, s4
                  vsadd.vx   v27,v9,s3
                  sra        a1, a4, s3
                  slli       gp, a4, 15
                  vsub.vv    v11,v4,v22,v0.t
                  sltiu      s3, a4, -22
                  slt        s11, tp, s2
                  vsll.vx    v10,v31,a7,v0.t
                  mulhu      s6, s11, s10
                  slti       s5, a5, 838
                  slt        t4, a5, tp
                  divu       a7, s6, a3
                  vfmadd.vv   v11,v2,v31,v0.t
                  vfmadd.vf   v19,ft3,v10
                  xori       s1, t2, -458
                  sltiu      a0, t0, -11
                  lui        a7, 347425
                  xori       s11, a2, -670
                  ori        a7, a7, 553
                  xori       t3, t3, -700
                  div        a0, s2, s7
                  sra        t6, sp, a0
                  vsll.vv    v31,v9,v26
                  slli       s3, t5, 1
                  vmadd.vv   v3,v7,v29,v0.t
                  srli       t4, a2, 4
                  slti       a5, sp, 681
                  vsub.vx    v9,v19,t0
                  or         gp, s5, s5
                  add        s3, t3, s2
                  xori       s3, s9, -655
                  xori       ra, tp, -769
                  sra        tp, a2, a6
                  vmsbc.vxm  v14,v26,s9,v0
                  sub        s3, s6, zero
                  vsll.vi    v5,v0,0
                  vmulh.vx   v26,v30,gp
                  xor        a4, t5, t4
                  vsaddu.vx  v5,v17,a4
                  xori       tp, sp, -742
                  sltu       s2, s9, t2
                  sltiu      t4, s10, -513
                  ori        s1, ra, -634
                  ori        t6, s0, -668
                  vfnmadd.vf   v29,fa1,v18
                  and        s2, s6, s9
                  sltu       a6, s4, s4
                  vsbc.vvm   v16,v17,v17,v0
                  mulhu      tp, t4, a3
                  srli       s9, t5, 16
                  mulh       s0, a2, a6
                  vsll.vv    v27,v1,v7,v0.t
                  ori        t4, gp, -275
                  vrsub.vi   v8,v21,0
                  mulh       s0, a0, a0
                  vfnmadd.vv   v22,v26,v22,v0.t
                  vsll.vv    v1,v6,v7
                  ori        s10, s11, -522
                  sub        t3, s4, s0
                  vfnmadd.vv   v24,v18,v3,v0.t
                  srai       a0, t4, 7
                  vmadd.vv   v1,v22,v3,v0.t
                  vsadd.vx   v31,v28,t3,v0.t
                  remu       a5, a1, s6
                  add        t5, a4, t3
                  xori       a5, s10, -568
                  rem        ra, a0, a3
                  sra        a6, tp, gp
                  xor        ra, t3, t5
                  slt        t3, t3, s9
                  mul        a2, a4, a6
                  slti       s6, a6, 539
                  mul        a5, tp, s3
                  auipc      s10, 440244
                  vmulh.vv   v15,v8,v1,v0.t
                  vfmadd.vf   v29,fa4,v0,v0.t
                  vsadd.vv   v18,v22,v21
                  vrsub.vi   v9,v11,0
                  mulhu      a1, s7, a0
                  sub        t3, s7, a2
                  ori        s5, a3, 996
                  mulhu      s2, t2, sp
                  xori       a5, sp, 223
                  divu       a2, s9, a6
                  or         s7, gp, t2
                  sub        t5, s2, t3
                  slli       zero, s3, 16
                  mulhu      a3, tp, a7
                  or         a2, s3, s5
                  slli       a5, s0, 18
                  mulh       t5, s1, t1
                  divu       s8, a0, t3
                  slli       s11, a3, 10
                  div        s7, a4, a3
                  mul        t4, a2, s8
                  srli       t5, s10, 22
                  slli       a6, t5, 29
                  srai       s2, ra, 31
                  vsbc.vvm   v24,v17,v30,v0
                  vmulh.vx   v23,v15,s10
                  mulh       t3, a1, t3
                  lui        s0, 472970
                  mul        s4, s5, s11
                  lui        a3, 624562
                  vsub.vv    v22,v6,v3
                  vadd.vv    v29,v28,v29
                  vsub.vx    v1,v3,a1,v0.t
                  vsll.vv    v5,v3,v24,v0.t
                  vmadd.vx   v27,a5,v2,v0.t
                  sltiu      zero, a6, 317
                  sra        a4, sp, a1
                  addi       s6, s8, 175
                  and        s4, t2, t6
                  and        s5, zero, s6
                  rem        a5, s3, a4
                  srai       s2, s7, 30
                  mulh       a1, t6, t2
                  srai       ra, a3, 8
                  slti       a3, t5, -438
                  mulhu      a1, s9, s7
                  vsaddu.vi  v28,v30,0,v0.t
                  sltu       gp, s4, t2
                  vrsub.vi   v29,v24,0
                  divu       s8, t3, s4
                  and        t5, a0, s5
                  sll        gp, s10, a5
                  vfnmadd.vv   v30,v12,v8,v0.t
                  srl        s9, s1, s0
                  vrsub.vx   v3,v3,s1,v0.t
                  divu       s2, a0, t3
                  ori        s0, t3, 802
                  and        s1, a1, s4
                  xori       a4, t5, 713
                  vrsub.vi   v13,v27,0
                  mul        s8, a3, a4
                  div        a0, a1, t5
                  vadd.vi    v26,v28,0
                  srai       s5, t5, 27
                  srli       t4, a2, 19
                  srai       s4, s10, 8
                  lui        s11, 133949
                  sra        s4, a3, a1
                  slli       a2, s0, 0
                  andi       s8, t6, 319
                  vsub.vx    v1,v23,s10,v0.t
                  auipc      tp, 620754
                  remu       t3, ra, ra
                  vsll.vi    v14,v25,0
                  mul        s11, t0, t3
                  vsbc.vxm   v23,v27,a2,v0
                  mul        t6, s5, s0
                  slli       s3, t0, 25
                  remu       t4, t0, t6
                  vfnmadd.vv   v27,v18,v10,v0.t
                  xor        a2, a6, a0
                  remu       s10, a0, a5
                  auipc      s3, 674905
                  sub        a2, t6, s10
                  vmulh.vx   v7,v9,a3,v0.t
                  and        a6, s5, a2
                  vrsub.vx   v28,v31,s1
                  slt        s1, a0, s3
                  sub        a2, s9, gp
                  vmadd.vv   v24,v29,v11,v0.t
                  rem        a5, t0, a5
                  xori       a7, t5, 639
                  sra        s6, a6, tp
                  and        s1, s6, s8
                  xori       t5, s0, 412
                  or         t3, s8, t1
                  vfnmadd.vv   v19,v7,v29,v0.t
                  vmsbc.vv   v19,v26,v5
                  div        s9, s11, s11
                  divu       s6, s9, s10
                  vsbc.vxm   v31,v15,s5,v0
                  slli       t4, a5, 10
                  vsbc.vxm   v30,v1,gp,v0
                  ori        a3, s10, 146
                  vmadd.vx   v18,t4,v15,v0.t
                  mul        a4, gp, t1
                  slli       s5, t2, 5
                  ori        t5, s8, 122
                  divu       a7, t4, a4
                  srli       gp, a1, 31
                  sltu       s7, s3, a7
                  lui        s2, 865859
                  slli       a5, t3, 5
                  srl        ra, s10, t4
                  mulhu      t3, a3, t2
                  andi       zero, a2, -524
                  vfnmadd.vf   v22,fa6,v15
                  mulh       s6, t2, t4
                  addi       s5, a5, 66
                  add        zero, gp, s9
                  vsub.vv    v12,v15,v22
                  sra        t6, t6, t1
                  mulhu      s2, a5, s9
                  slti       tp, a5, -232
                  divu       s7, s4, t1
                  slt        s7, t6, s7
                  xori       a6, s2, 414
                  div        a2, a5, a0
                  vadd.vi    v0,v6,0
                  sra        tp, t5, a6
                  rem        a2, s6, t5
                  add        s2, s9, a7
                  add        a2, s4, ra
                  slli       s9, s6, 16
                  slti       gp, s1, -911
                  vmulh.vv   v5,v29,v6
                  vsub.vx    v28,v18,t3,v0.t
                  vrsub.vx   v28,v20,t4
                  add        s5, a0, s1
                  sltiu      a1, zero, 493
                  la x7, test_done
                  jalr x0, x7, 0
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
                  1: addi x5, x5, -124
                  sw  x1, 4(x5)
                  sw  x2, 8(x5)
                  sw  x3, 12(x5)
                  sw  x4, 16(x5)
                  sw  x5, 20(x5)
                  sw  x6, 24(x5)
                  sw  x7, 28(x5)
                  sw  x8, 32(x5)
                  sw  x9, 36(x5)
                  sw  x10, 40(x5)
                  sw  x11, 44(x5)
                  sw  x12, 48(x5)
                  sw  x13, 52(x5)
                  sw  x14, 56(x5)
                  sw  x15, 60(x5)
                  sw  x16, 64(x5)
                  sw  x17, 68(x5)
                  sw  x18, 72(x5)
                  sw  x19, 76(x5)
                  sw  x20, 80(x5)
                  sw  x21, 84(x5)
                  sw  x22, 88(x5)
                  sw  x23, 92(x5)
                  sw  x24, 96(x5)
                  sw  x25, 100(x5)
                  sw  x26, 104(x5)
                  sw  x27, 108(x5)
                  sw  x28, 112(x5)
                  sw  x29, 116(x5)
                  sw  x30, 120(x5)
                  sw  x31, 124(x5)
                  csrr x11, 0x341 # MEPC
                  csrr x11, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x11, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x11, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x11, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x11, x10, ecall_handler
                  li x10, 0x1
                  beq x11, x10, instr_fault_handler
                  li x10, 0x5
                  beq x11, x10, load_fault_handler
                  li x10, 0x7
                  beq x11, x10, store_fault_handler
                  li x10, 0xc
                  beq x11, x10, pt_fault_handler
                  li x10, 0xd
                  beq x11, x10, pt_fault_handler
                  li x10, 0xf
                  beq x11, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x11, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x7, test_done
                  jalr x1, x7, 0

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
                  la x7, write_tohost
                  jalr x0, x7, 0

instr_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x15, 0
                  0: csrr x11, 0x340
                  mv x7, x11
                  li x7, 0
                  beq x11, x7, 1f
                  1: csrr x10, 0x3b0
                  csrr x14, 0x3a0
                  j 17f
                  17: li x19, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x7, x19, x11
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x19, x14, x7
                  slli x11, x11, 3
                  add x7, x7, x11
                  srl x19, x19, x7
                  slli x7, x19, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x11, 1
                  beq x7, x11, 21f
                  li x11, 2
                  beq x7, x11, 25f
                  li x11, 3
                  beq x7, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x15, x10
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x10, 1
                  ble x10, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x11, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x15, x7, 18b
                  23: bleu x10, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x7, x10, 2
                  srli x7, x7, 2
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x7, x10, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x19, x19, 4
                  csrr x11, 0x340
                  li x7, 30
                  sll x11, x11, x7
                  srl x11, x11, x7
                  slli x7, x11, 3
                  sll x19, x19, x7
                  or x14, x14, x19
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x7, 1
                  beq x11, x7, 31f
                  li x7, 2
                  beq x11, x7, 32f
                  li x7, 3
                  beq x11, x7, 33f
                  30: csrw 0x3a0, x14
                  j 34f
                  31: csrw 0x3a1, x14
                  j 34f
                  32: csrw 0x3a2, x14
                  j 34f
                  33: csrw 0x3a3, x14
                  34: nop
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
                  mret

load_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x15, 0
                  0: csrr x11, 0x340
                  mv x7, x11
                  li x7, 0
                  beq x11, x7, 1f
                  1: csrr x10, 0x3b0
                  csrr x14, 0x3a0
                  j 17f
                  17: li x19, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x7, x19, x11
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x19, x14, x7
                  slli x11, x11, 3
                  add x7, x7, x11
                  srl x19, x19, x7
                  slli x7, x19, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x11, 1
                  beq x7, x11, 21f
                  li x11, 2
                  beq x7, x11, 25f
                  li x11, 3
                  beq x7, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x15, x10
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x10, 1
                  ble x10, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x11, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x15, x7, 18b
                  23: bleu x10, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x7, x10, 2
                  srli x7, x7, 2
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x7, x10, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x19, x19, 1
                  csrr x11, 0x340
                  li x7, 30
                  sll x11, x11, x7
                  srl x11, x11, x7
                  slli x7, x11, 3
                  sll x19, x19, x7
                  or x14, x14, x19
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x7, 1
                  beq x11, x7, 31f
                  li x7, 2
                  beq x11, x7, 32f
                  li x7, 3
                  beq x11, x7, 33f
                  30: csrw 0x3a0, x14
                  j 34f
                  31: csrw 0x3a1, x14
                  j 34f
                  32: csrw 0x3a2, x14
                  j 34f
                  33: csrw 0x3a3, x14
                  34: nop
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
                  mret

store_fault_handler:
                  li x11, 0
                  csrw 0x340, x11
                  li x15, 0
                  0: csrr x11, 0x340
                  mv x7, x11
                  li x7, 0
                  beq x11, x7, 1f
                  1: csrr x10, 0x3b0
                  csrr x14, 0x3a0
                  j 17f
                  17: li x19, 4
                  csrr x11, 0x340
                  slli x11, x11, 30
                  srli x11, x11, 30
                  sub x7, x19, x11
                  addi x7, x7, -1
                  slli x7, x7, 3
                  sll x19, x14, x7
                  slli x11, x11, 3
                  add x7, x7, x11
                  srl x19, x19, x7
                  slli x7, x19, 27
                  srli x7, x7, 30
                  beqz x7, 20f
                  li x11, 1
                  beq x7, x11, 21f
                  li x11, 2
                  beq x7, x11, 25f
                  li x11, 3
                  beq x7, x11, 27f
                  la x11, test_done
                  jalr x0, x11, 0
                  18: csrr x11, 0x340
                  mv x15, x10
                  addi x11, x11, 1
                  csrw 0x340, x11
                  li x10, 1
                  ble x10, x11, 19f
                  j 0b
                  19: la x11, test_done
                  jalr x0, x11, 0
                  20: j 18b
                  21: csrr x11, 0x340
                  csrr x7, 0x343
                  srli x7, x7, 2
                  bnez x11, 22f
                  bltz x7, 18b
                  j 23f
                  22: bgtu x15, x7, 18b
                  23: bleu x10, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 24f
                  la x11, test_done
                  jalr x0, x11, 0
                  24: j 29f
                  25: csrr x11, 0x343
                  srli x11, x11, 2
                  slli x7, x10, 2
                  srli x7, x7, 2
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 26f
                  la x11, test_done
                  jalr x0, x11, 0
                  26: j 29f
                  27: csrr x11, 0x343
                  srli x11, x11, 2
                  srli x11, x11, 0
                  slli x11, x11, 0
                  slli x7, x10, 2
                  srli x7, x7, 2
                  srli x7, x7, 0
                  slli x7, x7, 0
                  bne x11, x7, 18b
                  andi x7, x19, 128
                  beqz x7, 29f
                  la x11, test_done
                  jalr x0, x11, 0
                  28: j 29f
                  29: ori x19, x19, 3
                  csrr x11, 0x340
                  li x7, 30
                  sll x11, x11, x7
                  srl x11, x11, x7
                  slli x7, x11, 3
                  sll x19, x19, x7
                  or x14, x14, x19
                  csrr x11, 0x340
                  srli x11, x11, 2
                  beqz x11, 30f
                  li x7, 1
                  beq x11, x7, 31f
                  li x7, 2
                  beq x11, x7, 32f
                  li x7, 3
                  beq x11, x7, 33f
                  30: csrw 0x3a0, x14
                  j 34f
                  31: csrw 0x3a1, x14
                  j 34f
                  32: csrw 0x3a2, x14
                  j 34f
                  33: csrw 0x3a3, x14
                  34: nop
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
                  mret

ebreak_handler:   
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
                  mret

illegal_instr_handler:
                  csrr  x11, 0x341
                  addi  x11, x11, 4
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x11, 0x300 # MSTATUS;
                  csrr  x11, 0x304 # MIE;
                  csrr  x11, 0x344 # MIP;
                  csrrc x11, 0x344, x11 # MIP;
                  lw  x1, 4(x5)
                  lw  x2, 8(x5)
                  lw  x3, 12(x5)
                  lw  x4, 16(x5)
                  lw  x5, 20(x5)
                  lw  x6, 24(x5)
                  lw  x7, 28(x5)
                  lw  x8, 32(x5)
                  lw  x9, 36(x5)
                  lw  x10, 40(x5)
                  lw  x11, 44(x5)
                  lw  x12, 48(x5)
                  lw  x13, 52(x5)
                  lw  x14, 56(x5)
                  lw  x15, 60(x5)
                  lw  x16, 64(x5)
                  lw  x17, 68(x5)
                  lw  x18, 72(x5)
                  lw  x19, 76(x5)
                  lw  x20, 80(x5)
                  lw  x21, 84(x5)
                  lw  x22, 88(x5)
                  lw  x23, 92(x5)
                  lw  x24, 96(x5)
                  lw  x25, 100(x5)
                  lw  x26, 104(x5)
                  lw  x27, 108(x5)
                  lw  x28, 112(x5)
                  lw  x29, 116(x5)
                  lw  x30, 120(x5)
                  lw  x31, 124(x5)
                  addi x5, x5, 124
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
