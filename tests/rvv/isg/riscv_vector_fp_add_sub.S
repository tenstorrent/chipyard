.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x30, 0x40201123
                  csrw 0x301, x30
                  csrr x31, 0x301
kernel_sp:        
                  la x15, kernel_stack_end

trap_vec_init:    
                  la x30, mtvec_handler
                  ori x30, x30, 1

mepc_setup:       
                  la x30, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0x74d6d961
                  li x2, 0x656e7cda
                  li x3, 0xf6063ca2
                  li x4, 0xc961c8ff
                  li x5, 0x80000000
                  li x6, 0xf1f87a34
                  li x7, 0xf9d97cc5
                  li x8, 0xfa01e251
                  li x9, 0xf45d793e
                  li x10, 0xf319c91a
                  li x11, 0xe12e9d21
                  li x12, 0xf86f891b
                  li x13, 0xf4d7bccd
                  li x14, 0x80000000
                  li x16, 0x80000000
                  li x17, 0x3f83aea0
                  li x18, 0x80000000
                  li x19, 0xfc9f801c
                  li x20, 0x80000000
                  li x21, 0x80000000
                  li x22, 0xf9bcefe9
                  li x23, 0x80000000
                  li x24, 0xfd0a695d
                  li x25, 0x1026e010
                  li x26, 0xf82985bc
                  li x27, 0x80000000
                  li x28, 0xe0edb1b
                  li x29, 0x45d58d40
                  li x30, 0x7626655b
                  la x31, user_stack_end
                  csrwi vxsat, 1
                  csrwi vxrm, 0
li x16, 4
                  vsetvli x30, x16, e32, m1
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
                  li x30, 0x6cb8c822
                  vslide1up.vx v0, v1, x30
                  vmv.v.v v0, v0
                  li x30, 0xbe55ad86
                  vslide1up.vx v0, v1, x30
                  vmv.v.v v0, v0
                  li x30, 0xdac3715f
                  vslide1up.vx v0, v1, x30
                  vmv.v.v v0, v0
                  li x30, 0x9d3ca1c1
                  vslide1up.vx v0, v1, x30
                  li x30, 0xf6f77c33
                  vslide1up.vx v1, v0, x30
                  vmv.v.v v0, v1
                  li x30, 0x6ed89764
                  vslide1up.vx v1, v0, x30
                  vmv.v.v v0, v1
                  li x30, 0x7aa18356
                  vslide1up.vx v1, v0, x30
                  vmv.v.v v0, v1
                  li x30, 0x954700ad
                  vslide1up.vx v1, v0, x30
                  li x30, 0xe6ca8739
                  vslide1up.vx v2, v0, x30
                  vmv.v.v v0, v2
                  li x30, 0xdbbf6351
                  vslide1up.vx v2, v0, x30
                  vmv.v.v v0, v2
                  li x30, 0x7f668b6b
                  vslide1up.vx v2, v0, x30
                  vmv.v.v v0, v2
                  li x30, 0x9c4cd6cf
                  vslide1up.vx v2, v0, x30
                  li x30, 0xdda74f0a
                  vslide1up.vx v3, v0, x30
                  vmv.v.v v0, v3
                  li x30, 0x8edf7209
                  vslide1up.vx v3, v0, x30
                  vmv.v.v v0, v3
                  li x30, 0x555583ff
                  vslide1up.vx v3, v0, x30
                  vmv.v.v v0, v3
                  li x30, 0xf34e98f2
                  vslide1up.vx v3, v0, x30
                  li x30, 0x6c048623
                  vslide1up.vx v4, v0, x30
                  vmv.v.v v0, v4
                  li x30, 0x59cc5fc8
                  vslide1up.vx v4, v0, x30
                  vmv.v.v v0, v4
                  li x30, 0x433a28b2
                  vslide1up.vx v4, v0, x30
                  vmv.v.v v0, v4
                  li x30, 0xa24e7111
                  vslide1up.vx v4, v0, x30
                  li x30, 0xa3254955
                  vslide1up.vx v5, v0, x30
                  vmv.v.v v0, v5
                  li x30, 0x63713898
                  vslide1up.vx v5, v0, x30
                  vmv.v.v v0, v5
                  li x30, 0xb7f581d7
                  vslide1up.vx v5, v0, x30
                  vmv.v.v v0, v5
                  li x30, 0x755c36b6
                  vslide1up.vx v5, v0, x30
                  li x30, 0xed988698
                  vslide1up.vx v6, v0, x30
                  vmv.v.v v0, v6
                  li x30, 0xc5f2521b
                  vslide1up.vx v6, v0, x30
                  vmv.v.v v0, v6
                  li x30, 0x8acaa03f
                  vslide1up.vx v6, v0, x30
                  vmv.v.v v0, v6
                  li x30, 0xb6aaba84
                  vslide1up.vx v6, v0, x30
                  li x30, 0x5962b7ab
                  vslide1up.vx v7, v0, x30
                  vmv.v.v v0, v7
                  li x30, 0xb0ca942b
                  vslide1up.vx v7, v0, x30
                  vmv.v.v v0, v7
                  li x30, 0xb961cea6
                  vslide1up.vx v7, v0, x30
                  vmv.v.v v0, v7
                  li x30, 0xe7a3d980
                  vslide1up.vx v7, v0, x30
                  li x30, 0x285b4b4
                  vslide1up.vx v8, v0, x30
                  vmv.v.v v0, v8
                  li x30, 0x98a4271
                  vslide1up.vx v8, v0, x30
                  vmv.v.v v0, v8
                  li x30, 0x650099ef
                  vslide1up.vx v8, v0, x30
                  vmv.v.v v0, v8
                  li x30, 0xe8b686c5
                  vslide1up.vx v8, v0, x30
                  li x30, 0x59c67225
                  vslide1up.vx v9, v0, x30
                  vmv.v.v v0, v9
                  li x30, 0x8876542
                  vslide1up.vx v9, v0, x30
                  vmv.v.v v0, v9
                  li x30, 0x1d3c89f6
                  vslide1up.vx v9, v0, x30
                  vmv.v.v v0, v9
                  li x30, 0x31569f12
                  vslide1up.vx v9, v0, x30
                  li x30, 0xccc8c224
                  vslide1up.vx v10, v0, x30
                  vmv.v.v v0, v10
                  li x30, 0x89427b69
                  vslide1up.vx v10, v0, x30
                  vmv.v.v v0, v10
                  li x30, 0x55490dc2
                  vslide1up.vx v10, v0, x30
                  vmv.v.v v0, v10
                  li x30, 0xfda549ee
                  vslide1up.vx v10, v0, x30
                  li x30, 0x44423903
                  vslide1up.vx v11, v0, x30
                  vmv.v.v v0, v11
                  li x30, 0x8e82773c
                  vslide1up.vx v11, v0, x30
                  vmv.v.v v0, v11
                  li x30, 0xb14363b7
                  vslide1up.vx v11, v0, x30
                  vmv.v.v v0, v11
                  li x30, 0xdd9e3419
                  vslide1up.vx v11, v0, x30
                  li x30, 0xb5acda48
                  vslide1up.vx v12, v0, x30
                  vmv.v.v v0, v12
                  li x30, 0xd7612a70
                  vslide1up.vx v12, v0, x30
                  vmv.v.v v0, v12
                  li x30, 0xe3e7f539
                  vslide1up.vx v12, v0, x30
                  vmv.v.v v0, v12
                  li x30, 0x4d4ae7de
                  vslide1up.vx v12, v0, x30
                  li x30, 0xfc68f784
                  vslide1up.vx v13, v0, x30
                  vmv.v.v v0, v13
                  li x30, 0x6f42c80
                  vslide1up.vx v13, v0, x30
                  vmv.v.v v0, v13
                  li x30, 0x3f1311a5
                  vslide1up.vx v13, v0, x30
                  vmv.v.v v0, v13
                  li x30, 0x6032ca15
                  vslide1up.vx v13, v0, x30
                  li x30, 0x42d5b782
                  vslide1up.vx v14, v0, x30
                  vmv.v.v v0, v14
                  li x30, 0xa925e5db
                  vslide1up.vx v14, v0, x30
                  vmv.v.v v0, v14
                  li x30, 0xbed685fa
                  vslide1up.vx v14, v0, x30
                  vmv.v.v v0, v14
                  li x30, 0x2f11874
                  vslide1up.vx v14, v0, x30
                  li x30, 0x41e2d402
                  vslide1up.vx v15, v0, x30
                  vmv.v.v v0, v15
                  li x30, 0x979cc949
                  vslide1up.vx v15, v0, x30
                  vmv.v.v v0, v15
                  li x30, 0xde719bc4
                  vslide1up.vx v15, v0, x30
                  vmv.v.v v0, v15
                  li x30, 0x1d24c584
                  vslide1up.vx v15, v0, x30
                  li x30, 0x993f914d
                  vslide1up.vx v16, v0, x30
                  vmv.v.v v0, v16
                  li x30, 0x8cc6cfc8
                  vslide1up.vx v16, v0, x30
                  vmv.v.v v0, v16
                  li x30, 0xd51abed5
                  vslide1up.vx v16, v0, x30
                  vmv.v.v v0, v16
                  li x30, 0x80b66435
                  vslide1up.vx v16, v0, x30
                  li x30, 0x6db33718
                  vslide1up.vx v17, v0, x30
                  vmv.v.v v0, v17
                  li x30, 0xb2de48d0
                  vslide1up.vx v17, v0, x30
                  vmv.v.v v0, v17
                  li x30, 0xe9a8fdd2
                  vslide1up.vx v17, v0, x30
                  vmv.v.v v0, v17
                  li x30, 0xa4f7f433
                  vslide1up.vx v17, v0, x30
                  li x30, 0x894836e7
                  vslide1up.vx v18, v0, x30
                  vmv.v.v v0, v18
                  li x30, 0x54d2ad3d
                  vslide1up.vx v18, v0, x30
                  vmv.v.v v0, v18
                  li x30, 0x343fa96f
                  vslide1up.vx v18, v0, x30
                  vmv.v.v v0, v18
                  li x30, 0xcf384bcd
                  vslide1up.vx v18, v0, x30
                  li x30, 0xd5f7efb4
                  vslide1up.vx v19, v0, x30
                  vmv.v.v v0, v19
                  li x30, 0x6322d786
                  vslide1up.vx v19, v0, x30
                  vmv.v.v v0, v19
                  li x30, 0x58e98994
                  vslide1up.vx v19, v0, x30
                  vmv.v.v v0, v19
                  li x30, 0x4e9a4490
                  vslide1up.vx v19, v0, x30
                  li x30, 0xd6e7e0c1
                  vslide1up.vx v20, v0, x30
                  vmv.v.v v0, v20
                  li x30, 0xa9b203e6
                  vslide1up.vx v20, v0, x30
                  vmv.v.v v0, v20
                  li x30, 0xc19dee2b
                  vslide1up.vx v20, v0, x30
                  vmv.v.v v0, v20
                  li x30, 0x31736a00
                  vslide1up.vx v20, v0, x30
                  li x30, 0xdaf6ec7a
                  vslide1up.vx v21, v0, x30
                  vmv.v.v v0, v21
                  li x30, 0x93feb0f8
                  vslide1up.vx v21, v0, x30
                  vmv.v.v v0, v21
                  li x30, 0xfc614621
                  vslide1up.vx v21, v0, x30
                  vmv.v.v v0, v21
                  li x30, 0xd8b2d42c
                  vslide1up.vx v21, v0, x30
                  li x30, 0x21232700
                  vslide1up.vx v22, v0, x30
                  vmv.v.v v0, v22
                  li x30, 0x3b70962
                  vslide1up.vx v22, v0, x30
                  vmv.v.v v0, v22
                  li x30, 0xed4f6d05
                  vslide1up.vx v22, v0, x30
                  vmv.v.v v0, v22
                  li x30, 0x6f956d03
                  vslide1up.vx v22, v0, x30
                  li x30, 0xfa8fba7d
                  vslide1up.vx v23, v0, x30
                  vmv.v.v v0, v23
                  li x30, 0xa9008e82
                  vslide1up.vx v23, v0, x30
                  vmv.v.v v0, v23
                  li x30, 0x3918e48c
                  vslide1up.vx v23, v0, x30
                  vmv.v.v v0, v23
                  li x30, 0xf89c0cf0
                  vslide1up.vx v23, v0, x30
                  li x30, 0x4787a54d
                  vslide1up.vx v24, v0, x30
                  vmv.v.v v0, v24
                  li x30, 0xc9094ad8
                  vslide1up.vx v24, v0, x30
                  vmv.v.v v0, v24
                  li x30, 0x298ba40f
                  vslide1up.vx v24, v0, x30
                  vmv.v.v v0, v24
                  li x30, 0x337b546a
                  vslide1up.vx v24, v0, x30
                  li x30, 0xe76cf396
                  vslide1up.vx v25, v0, x30
                  vmv.v.v v0, v25
                  li x30, 0x8825798c
                  vslide1up.vx v25, v0, x30
                  vmv.v.v v0, v25
                  li x30, 0x6230a3d4
                  vslide1up.vx v25, v0, x30
                  vmv.v.v v0, v25
                  li x30, 0x4d974fad
                  vslide1up.vx v25, v0, x30
                  li x30, 0xc604fc79
                  vslide1up.vx v26, v0, x30
                  vmv.v.v v0, v26
                  li x30, 0x72d4968f
                  vslide1up.vx v26, v0, x30
                  vmv.v.v v0, v26
                  li x30, 0x32e89965
                  vslide1up.vx v26, v0, x30
                  vmv.v.v v0, v26
                  li x30, 0x6f6f08e3
                  vslide1up.vx v26, v0, x30
                  li x30, 0x526edd26
                  vslide1up.vx v27, v0, x30
                  vmv.v.v v0, v27
                  li x30, 0x83e83448
                  vslide1up.vx v27, v0, x30
                  vmv.v.v v0, v27
                  li x30, 0xd7e9d966
                  vslide1up.vx v27, v0, x30
                  vmv.v.v v0, v27
                  li x30, 0xb3c2169d
                  vslide1up.vx v27, v0, x30
                  li x30, 0x1646c4ca
                  vslide1up.vx v28, v0, x30
                  vmv.v.v v0, v28
                  li x30, 0x3d15bd1c
                  vslide1up.vx v28, v0, x30
                  vmv.v.v v0, v28
                  li x30, 0x4673ad1
                  vslide1up.vx v28, v0, x30
                  vmv.v.v v0, v28
                  li x30, 0x3281a12f
                  vslide1up.vx v28, v0, x30
                  li x30, 0xce945596
                  vslide1up.vx v29, v0, x30
                  vmv.v.v v0, v29
                  li x30, 0x1b2d6d6d
                  vslide1up.vx v29, v0, x30
                  vmv.v.v v0, v29
                  li x30, 0x38c2d217
                  vslide1up.vx v29, v0, x30
                  vmv.v.v v0, v29
                  li x30, 0x76c9f3ac
                  vslide1up.vx v29, v0, x30
                  li x30, 0xdd3f8cde
                  vslide1up.vx v30, v0, x30
                  vmv.v.v v0, v30
                  li x30, 0x227a727e
                  vslide1up.vx v30, v0, x30
                  vmv.v.v v0, v30
                  li x30, 0x34db8bbb
                  vslide1up.vx v30, v0, x30
                  vmv.v.v v0, v30
                  li x30, 0xf982aeab
                  vslide1up.vx v30, v0, x30
                  li x30, 0x136a9dca
                  vslide1up.vx v31, v0, x30
                  vmv.v.v v0, v31
                  li x30, 0x7111a9f5
                  vslide1up.vx v31, v0, x30
                  vmv.v.v v0, v31
                  li x30, 0x30479cc6
                  vslide1up.vx v31, v0, x30
                  vmv.v.v v0, v31
                  li x30, 0x7932b74b
                  vslide1up.vx v31, v0, x30
li x16, 4
                  vsetvli x30, x16, e32, m1
main:             vrsub.vi   v1,v16,0,v0.t
                  mulhsu     s0, t2, a0
                  vslide1up.vx v26,v18,s5,v0.t
                  xor        t1, s2, t5
                  mulh       s2, sp, s4
                  srai       a4, s11, 31
                  vadd.vv    v11,v17,v10
                  and        s8, s5, a5
                  vsadd.vx   v17,v4,s11
                  lui        s2, 111102
                  vfadd.vv   v22,v10,v10
                  vsll.vv    v23,v27,v22,v0.t
                  and        s0, s2, s9
                  mul        s5, s5, a7
                  sub        a6, t4, a6
                  mulh       t3, tp, a4
                  vslideup.vx v24,v14,s7
                  slli       a4, a2, 25
                  lui        s0, 102573
                  rem        zero, a5, a7
                  sltu       s4, a5, t2
                  vslide1up.vx v5,v2,gp,v0.t
                  sltu       zero, a1, t4
                  mulhsu     s10, s10, s10
                  srl        s7, t6, s2
                  vmulh.vv   v9,v24,v31
                  add        a7, sp, a1
                  sra        s2, s7, s7
                  sltu       ra, s0, a5
                  vrsub.vx   v21,v26,a0
                  vsll.vi    v25,v11,0,v0.t
                  vmulhu.vv  v19,v5,v18,v0.t
                  vmul.vv    v27,v30,v23,v0.t
                  sltu       s4, t6, sp
                  mulhsu     s7, zero, sp
                  vadd.vx    v8,v7,ra,v0.t
                  mulh       t1, a3, s1
                  mulh       a6, s7, s7
                  vsll.vx    v23,v11,a3
                  xori       s8, s4, 472
                  lui        s9, 155403
                  vsaddu.vi  v18,v27,0,v0.t
                  remu       t4, sp, t1
                  xor        s6, gp, gp
                  sltiu      s4, t2, 645
                  vmulh.vv   v22,v7,v29
                  div        a3, s1, gp
                  vmul.vx    v12,v26,t6
                  xori       gp, s10, 905
                  div        s8, s3, s2
                  vmul.vx    v18,v8,a4
                  auipc      a7, 552795
                  vadd.vx    v4,v31,t0
                  vmulhu.vv  v7,v30,v23,v0.t
                  vslide1up.vx v31,v14,s8
                  and        s5, s7, t5
                  divu       t4, ra, ra
                  vsaddu.vi  v16,v18,0
                  slli       a6, s1, 6
                  vsub.vx    v3,v14,t4
                  slti       a6, sp, -674
                  vsaddu.vi  v21,v16,0,v0.t
                  rem        tp, a0, a5
                  srl        t2, a4, ra
                  sltu       s8, t4, t1
                  or         s1, t0, a7
                  sub        tp, t2, t6
                  and        sp, t0, s3
                  vsub.vx    v18,v14,s1
                  vfadd.vv   v13,v17,v22
                  mul        t0, sp, s0
                  xor        t1, t4, t3
                  and        a6, s5, s4
                  mul        s7, a5, s11
                  srli       zero, t2, 1
                  mulh       s9, t0, s5
                  xori       s10, a5, -764
                  vslide1up.vx v25,v5,a5
                  div        t0, s5, t3
                  vmadd.vv   v17,v28,v6
                  add        s3, a2, s11
                  vsll.vi    v20,v11,0
                  srli       a4, a1, 31
                  mulh       s8, s11, ra
                  sll        t2, s10, s9
                  vslidedown.vx v22,v9,a0,v0.t
                  sra        t3, a3, s9
                  vsaddu.vv  v25,v8,v24,v0.t
                  andi       t4, sp, 936
                  vsaddu.vx  v10,v31,a3,v0.t
                  addi       a0, a5, -101
                  rem        a3, s10, gp
                  vsub.vx    v4,v15,t1,v0.t
                  srli       sp, tp, 22
                  remu       a6, a2, a3
                  xor        zero, s5, s5
                  sltu       a2, t5, s2
                  vmul.vv    v0,v26,v14
                  lui        s5, 338483
                  srai       s9, a6, 10
                  vmulh.vv   v11,v21,v1,v0.t
                  srl        s6, a3, sp
                  div        t5, a5, gp
                  srai       a7, gp, 0
                  and        t3, tp, t6
                  vslide1up.vx v6,v3,a3,v0.t
                  auipc      sp, 790382
                  remu       t0, a7, a4
                  or         s8, s7, s3
                  vmadd.vv   v21,v3,v10,v0.t
                  remu       t2, s9, ra
                  ori        a4, a0, 817
                  or         t4, s6, s0
                  vfadd.vv   v23,v4,v8
                  ori        zero, s3, 144
                  vslide1up.vx v29,v18,t1,v0.t
                  vmul.vv    v11,v30,v18
                  vslideup.vx v21,v26,a5,v0.t
                  vslide1up.vx v24,v17,a1,v0.t
                  vmulhu.vx  v29,v2,s6
                  sra        t1, zero, s1
                  or         s5, a0, t0
                  vmadd.vv   v14,v26,v27,v0.t
                  sltiu      t0, s7, -191
                  rem        s4, t6, t6
                  sll        s8, a1, ra
                  mulhu      t0, a1, s6
                  srl        s8, s5, a7
                  slli       t1, s5, 29
                  srai       t4, a1, 22
                  ori        s2, s8, -475
                  vsub.vv    v3,v10,v8
                  vslidedown.vi v22,v4,0,v0.t
                  rem        s5, t3, a2
                  sltiu      s2, t1, 637
                  mulh       s7, s4, s8
                  vslidedown.vi v18,v28,0
                  srl        a6, s11, a1
                  sltiu      a6, ra, -708
                  mulhu      s0, sp, s2
                  vfadd.vf   v11,v25,ft11,v0.t
                  sra        s7, a7, a3
                  slti       s3, s4, -644
                  slt        t4, a3, s1
                  sltiu      a7, t2, 928
                  vmadd.vv   v22,v25,v24,v0.t
                  ori        s2, s1, 23
                  vsaddu.vi  v1,v11,0,v0.t
                  remu       s0, a2, a2
                  sltu       t0, t0, s5
                  xori       zero, t4, 515
                  vsll.vi    v0,v5,0
                  vfadd.vv   v20,v12,v13,v0.t
                  auipc      tp, 961258
                  slti       sp, s5, 57
                  sltu       a7, a4, a3
                  sub        s7, sp, s7
                  andi       gp, a6, -931
                  lui        s7, 5320
                  srl        gp, s3, a4
                  srai       s3, ra, 6
                  addi       sp, t6, 832
                  vsll.vx    v15,v6,sp,v0.t
                  vmulhu.vv  v12,v30,v24,v0.t
                  ori        t0, gp, -886
                  remu       s2, gp, t5
                  andi       s4, sp, -394
                  sll        s3, t4, t4
                  sra        zero, s2, a2
                  sll        s4, tp, a4
                  vsub.vx    v1,v4,ra,v0.t
                  vslide1up.vx v5,v18,t5
                  andi       a3, a4, -479
                  vmulhu.vx  v21,v21,s10,v0.t
                  vrsub.vx   v26,v0,a5
                  vsadd.vi   v30,v9,0
                  or         s4, a0, a2
                  sltiu      a7, s9, 851
                  vmul.vv    v8,v15,v30,v0.t
                  vslidedown.vx v25,v4,a5
                  vsub.vv    v2,v18,v1,v0.t
                  andi       t3, t5, 467
                  srl        a1, s5, s3
                  xor        a6, ra, s10
                  srli       s7, s11, 31
                  srli       zero, s10, 0
                  vfadd.vv   v26,v9,v14
                  remu       a4, a7, gp
                  vadd.vx    v15,v17,s0
                  lui        a1, 958480
                  ori        a4, a1, -662
                  add        t0, gp, s2
                  ori        ra, s9, -244
                  sltu       t0, s2, a2
                  addi       a6, ra, 579
                  vadc.vxm   v8,v24,s10,v0
                  addi       a6, a2, -73
                  srai       s9, gp, 30
                  vmulhu.vx  v27,v30,a7,v0.t
                  vslide1up.vx v29,v5,a5,v0.t
                  mulhsu     s1, a2, s6
                  vsll.vx    v10,v26,s3
                  vslideup.vx v15,v8,s11
                  xori       s0, a1, 954
                  mulh       ra, s6, a0
                  srl        a1, a2, gp
                  add        zero, t2, a4
                  slt        s5, ra, s5
                  srli       t0, s3, 20
                  mul        gp, a5, a5
                  divu       s4, s6, a0
                  add        tp, a1, s8
                  vadc.vvm   v8,v22,v12,v0
                  vfadd.vf   v17,v29,ft3
                  sltu       s8, gp, t0
                  mulhu      a6, s2, s7
                  mulhu      t3, zero, s9
                  slli       a0, t6, 8
                  mulh       t3, s9, tp
                  srai       t1, a7, 27
                  srl        s2, t0, a6
                  ori        s4, a5, 176
                  add        t0, a7, s3
                  mulhu      s5, a0, t3
                  slli       s10, s3, 14
                  div        s9, s11, tp
                  vmadd.vx   v12,t5,v12,v0.t
                  lui        a4, 644890
                  sra        gp, s10, gp
                  slt        s7, s8, s11
                  addi       a4, zero, -218
                  sll        a1, a6, sp
                  vadc.vvm   v28,v28,v6,v0
                  slti       t1, sp, 93
                  vslideup.vx v21,v31,s8
                  vrsub.vx   v18,v18,t6,v0.t
                  mul        gp, t2, s2
                  sltu       ra, t0, s3
                  vmulhu.vv  v1,v16,v3,v0.t
                  vsadd.vv   v19,v16,v28
                  slli       gp, a4, 6
                  sltiu      t4, t3, 390
                  vslidedown.vi v28,v22,0
                  mulhu      t5, a5, s0
                  srl        zero, t4, t5
                  mulhu      s1, t0, ra
                  vrsub.vi   v21,v10,0
                  vfadd.vv   v17,v27,v3,v0.t
                  vmadd.vx   v4,t6,v25,v0.t
                  sub        a1, a7, s11
                  vadd.vv    v22,v20,v3
                  lui        a6, 8337
                  auipc      a1, 38457
                  divu       t0, t0, s9
                  addi       a7, s2, -219
                  or         s4, a0, t0
                  vsadd.vv   v12,v23,v7
                  sll        s6, gp, s2
                  vslideup.vi v15,v7,0,v0.t
                  vsub.vv    v13,v4,v19,v0.t
                  vadc.vvm   v11,v17,v31,v0
                  sub        zero, ra, sp
                  vfadd.vf   v11,v12,ft10
                  auipc      a1, 310746
                  andi       a1, s2, -637
                  sltiu      a3, t4, 533
                  remu       s9, a7, s6
                  add        s10, sp, a4
                  and        zero, t2, zero
                  sltiu      zero, t4, 466
                  srai       a6, t2, 30
                  vadd.vv    v13,v14,v28,v0.t
                  slti       ra, s2, -929
                  sra        a1, s5, t2
                  vmadd.vx   v8,t3,v0,v0.t
                  vmulhu.vx  v7,v4,s5
                  mulhu      zero, a4, sp
                  vslideup.vi v13,v30,0,v0.t
                  andi       s10, a0, 928
                  sltu       t1, t1, s10
                  mul        s9, t6, t3
                  vmul.vx    v7,v3,zero
                  and        s0, s2, t3
                  vslide1up.vx v1,v20,a6
                  or         t2, t3, s6
                  vfsub.vv   v26,v12,v20
                  vsll.vv    v23,v20,v7
                  vslideup.vi v3,v15,0
                  mul        ra, s8, s5
                  xori       zero, a6, -940
                  vsadd.vi   v3,v25,0
                  vmulh.vv   v11,v9,v15,v0.t
                  ori        s2, a6, -382
                  vsll.vi    v9,v9,0,v0.t
                  srai       a6, a4, 26
                  andi       s10, s0, -238
                  xor        a4, s11, a6
                  vsub.vx    v27,v5,zero
                  xori       s0, s9, -306
                  vadd.vi    v10,v27,0,v0.t
                  mulhsu     t2, t2, s6
                  andi       s10, a1, 542
                  vmulhu.vx  v13,v4,a7,v0.t
                  sltu       t3, s8, a5
                  slt        a3, sp, a4
                  mulhu      s2, sp, t0
                  vfadd.vv   v21,v31,v15,v0.t
                  vslideup.vx v27,v23,s8
                  and        s2, a6, t0
                  vmulhu.vv  v21,v16,v9,v0.t
                  vslide1up.vx v9,v13,gp
                  vrsub.vi   v24,v21,0
                  slli       gp, t6, 30
                  sltiu      a2, a5, -131
                  slt        t3, s11, s9
                  vfsub.vf   v14,v19,fs11,v0.t
                  vmulhu.vv  v24,v1,v7
                  sub        s4, sp, t2
                  vfadd.vf   v2,v15,fs10,v0.t
                  vslidedown.vi v22,v12,0
                  mulhu      a4, s10, sp
                  vsaddu.vi  v0,v29,0
                  vsadd.vi   v24,v17,0
                  sltu       a1, a5, a1
                  mul        t3, a5, a0
                  vfadd.vv   v3,v15,v30,v0.t
                  rem        s6, s4, sp
                  vslideup.vx v3,v11,t4
                  vsll.vx    v27,v17,t6,v0.t
                  slli       s7, t0, 28
                  addi       a6, tp, 437
                  srl        t0, s3, s7
                  vadd.vv    v31,v21,v16
                  vmul.vv    v27,v24,v9
                  div        a0, t0, a6
                  mul        gp, t4, t6
                  remu       t4, s6, s5
                  vmulhu.vv  v28,v27,v19
                  vadd.vx    v29,v20,a1
                  lui        t0, 687765
                  vadc.vxm   v2,v6,s0,v0
                  vsub.vv    v23,v29,v28
                  vsadd.vx   v7,v2,s0
                  mulh       sp, t3, a7
                  add        s7, gp, sp
                  sll        s9, tp, a1
                  vfsub.vf   v26,v30,ft7
                  vmul.vx    v14,v11,s6
                  vslidedown.vx v1,v8,t5
                  vmulhu.vv  v11,v3,v28,v0.t
                  mulh       gp, sp, t0
                  mulh       sp, a0, s1
                  addi       a4, a2, -184
                  mul        a7, s1, t4
                  vfsub.vf   v28,v5,fs0,v0.t
                  xor        s4, a4, t2
                  or         a2, t2, s0
                  andi       t5, a2, 842
                  vmadd.vv   v27,v21,v10,v0.t
                  rem        s10, t5, s3
                  andi       s9, t0, 411
                  and        s0, s7, a7
                  mulh       t1, s5, s8
                  auipc      tp, 676874
                  rem        s0, a1, s4
                  vmadd.vv   v12,v23,v4,v0.t
                  vsll.vi    v22,v9,0
                  remu       sp, gp, s7
                  mul        s4, t6, a1
                  remu       ra, s4, a0
                  slt        a3, s5, a0
                  vmulhu.vv  v30,v10,v10
                  add        ra, s9, t5
                  slli       sp, s6, 2
                  srai       a7, a2, 24
                  slli       t1, a2, 17
                  vadc.vxm   v4,v5,t0,v0
                  vsll.vi    v11,v16,0,v0.t
                  srl        t3, a7, a1
                  sra        t4, s7, a3
                  vmadd.vv   v2,v1,v9,v0.t
                  mulhsu     s0, s9, a4
                  srl        a6, s5, a5
                  vsaddu.vv  v4,v27,v26,v0.t
                  xori       a2, a4, 101
                  srli       gp, s10, 19
                  vslideup.vi v6,v5,0
                  srai       a2, t3, 0
                  auipc      sp, 450328
                  rem        s2, t3, a1
                  slli       t2, a1, 18
                  xor        t1, a0, a5
                  srli       s4, ra, 17
                  sra        s10, s0, s3
                  vslide1up.vx v30,v12,a4,v0.t
                  slt        a1, s0, a5
                  vslide1up.vx v21,v14,sp
                  vsadd.vi   v19,v31,0
                  slli       s2, sp, 22
                  vadd.vi    v13,v0,0
                  vmulh.vx   v17,v9,a2,v0.t
                  sub        s9, t1, s7
                  slli       t4, ra, 27
                  slt        s2, s10, a3
                  andi       s7, s9, -305
                  vslideup.vx v15,v0,s4,v0.t
                  ori        s5, a1, -184
                  vmul.vx    v17,v29,t3,v0.t
                  vfsub.vf   v28,v15,fs5,v0.t
                  xor        t2, t6, t6
                  mulh       s1, zero, t5
                  vmadd.vv   v26,v31,v17
                  divu       t0, a3, a3
                  or         t2, t6, t0
                  mulh       s1, s1, a1
                  vsll.vi    v21,v26,0,v0.t
                  srai       t5, t0, 6
                  sll        s4, s9, s10
                  div        s7, ra, tp
                  vfsub.vf   v5,v10,fs7,v0.t
                  div        gp, s6, s3
                  vfsub.vv   v9,v5,v16
                  vsll.vx    v23,v11,ra
                  addi       a0, s1, 151
                  sub        s6, a5, t4
                  mulh       s8, s4, t1
                  vfadd.vf   v3,v27,ft3,v0.t
                  vrsub.vi   v21,v10,0
                  vsll.vi    v11,v0,0
                  vadd.vv    v3,v19,v7
                  vmulh.vx   v10,v12,t0,v0.t
                  vslide1up.vx v6,v29,sp
                  vsub.vv    v21,v17,v29
                  vadd.vx    v2,v28,s5,v0.t
                  vadc.vxm   v30,v18,a2,v0
                  sll        s10, a6, s3
                  slti       s0, s9, -3
                  sra        s1, s0, t0
                  vsadd.vi   v29,v5,0
                  vadd.vv    v17,v9,v27,v0.t
                  ori        a4, t5, -802
                  vadd.vx    v22,v0,s3
                  vslidedown.vi v15,v26,0
                  vsaddu.vx  v11,v9,s11
                  vfsub.vf   v31,v1,fs9,v0.t
                  srli       gp, s9, 4
                  sub        s5, s2, a2
                  srli       sp, s7, 10
                  sltu       a4, a5, t0
                  add        tp, sp, s9
                  mulhsu     s0, s3, a2
                  vmulhu.vx  v31,v15,s7
                  vslideup.vx v19,v2,a0
                  remu       t4, s8, t0
                  sltu       s3, t1, s5
                  or         s0, s2, a6
                  add        s2, s11, t1
                  sra        t5, t0, sp
                  vfadd.vf   v9,v24,ft11
                  sltu       zero, gp, t4
                  remu       a7, gp, t5
                  vslideup.vx v18,v26,s7
                  mulhu      s10, tp, t2
                  vsaddu.vx  v22,v15,a4,v0.t
                  vsaddu.vx  v2,v30,s5
                  andi       s3, ra, -352
                  vmulh.vv   v20,v13,v16,v0.t
                  vsub.vx    v27,v21,t4
                  slti       s5, zero, -597
                  mulhu      gp, s11, a2
                  rem        s1, s4, ra
                  or         a4, a7, a2
                  mulh       t5, s3, s0
                  vfadd.vv   v3,v29,v26,v0.t
                  and        a0, t3, tp
                  vrsub.vx   v26,v20,a7,v0.t
                  vslide1up.vx v14,v20,a0,v0.t
                  xori       t5, s11, 776
                  vmulh.vx   v2,v18,a6,v0.t
                  vslidedown.vi v13,v7,0,v0.t
                  mulh       s0, a2, s5
                  div        s9, zero, t2
                  vrsub.vi   v24,v22,0,v0.t
                  srl        s7, t5, a6
                  rem        t3, s7, s2
                  lui        a0, 169986
                  andi       a1, s0, -706
                  vadd.vv    v8,v20,v22
                  srl        zero, s1, s8
                  mulhsu     s8, t0, sp
                  vmul.vv    v29,v5,v10
                  slt        a0, s4, a3
                  mul        a4, s11, s1
                  vsll.vi    v18,v11,0
                  mulh       s4, s11, ra
                  vslideup.vx v5,v9,s11
                  vmul.vv    v8,v12,v4,v0.t
                  add        s10, zero, t2
                  vsadd.vx   v14,v0,t1
                  srai       sp, s6, 4
                  srai       s5, s4, 9
                  sltu       t2, t2, zero
                  vmulhu.vv  v31,v14,v9,v0.t
                  srl        s2, a6, ra
                  vmulh.vv   v14,v23,v27
                  lui        a0, 977933
                  add        a7, s4, ra
                  vsadd.vi   v22,v29,0
                  srl        s8, gp, s0
                  mulhu      t1, t6, a3
                  srl        gp, a2, a5
                  vslideup.vi v8,v29,0,v0.t
                  sltiu      gp, a1, 1018
                  add        s2, a3, s1
                  sltu       t3, s6, s1
                  vsaddu.vx  v30,v16,t5
                  xor        s7, gp, t1
                  srli       a4, t0, 9
                  slli       a3, gp, 4
                  srai       s8, a5, 21
                  add        t1, s9, s4
                  vrsub.vx   v19,v5,t5
                  srli       ra, t5, 7
                  vslidedown.vi v4,v28,0,v0.t
                  sub        a3, sp, tp
                  slt        t0, a0, a0
                  rem        a3, a3, t5
                  vsll.vx    v30,v5,s4,v0.t
                  vsadd.vi   v6,v23,0,v0.t
                  mul        t1, ra, sp
                  vfadd.vf   v22,v24,fs10,v0.t
                  sltiu      s3, zero, -708
                  remu       a6, a0, t3
                  xor        s4, sp, a6
                  xor        t2, s2, a1
                  slli       ra, zero, 0
                  vsadd.vi   v16,v7,0
                  vslideup.vx v26,v25,a5,v0.t
                  vslide1up.vx v15,v8,a4
                  vmulhu.vv  v5,v1,v18
                  remu       gp, a3, tp
                  auipc      t2, 993313
                  srai       gp, t5, 14
                  sltiu      s0, s3, 942
                  mul        s2, s0, t4
                  vsaddu.vi  v1,v0,0,v0.t
                  andi       tp, t0, -200
                  vmul.vx    v0,v23,t0
                  sltiu      t1, a4, 61
                  srai       s0, s2, 24
                  vadc.vim   v30,v22,0,v0
                  vadd.vv    v19,v16,v31,v0.t
                  mulhsu     s10, s10, s5
                  remu       s1, s11, zero
                  add        t1, ra, s9
                  mulh       t1, s5, a6
                  mulh       t0, t5, a2
                  xor        s0, s8, a5
                  vfadd.vf   v18,v2,fa6,v0.t
                  vadd.vx    v30,v7,tp
                  vrsub.vi   v4,v22,0,v0.t
                  rem        s6, a5, s3
                  vfsub.vf   v21,v12,fs8
                  vsaddu.vx  v3,v21,s5,v0.t
                  slli       s7, a2, 10
                  mulh       t5, s3, ra
                  vmulhu.vx  v14,v30,ra,v0.t
                  sub        a7, s9, t4
                  vmulhu.vx  v9,v11,s9
                  vsll.vv    v24,v19,v22
                  vmul.vv    v27,v0,v7,v0.t
                  slli       s2, a4, 4
                  vfsub.vv   v13,v19,v3,v0.t
                  div        s4, s0, t4
                  mulhu      s8, s8, s8
                  vfsub.vf   v19,v11,fs7,v0.t
                  vslide1up.vx v31,v17,gp
                  sra        s4, t3, s6
                  divu       a2, a4, s11
                  vsub.vv    v25,v14,v0
                  sltiu      zero, a2, 45
                  divu       t3, a2, t2
                  vsadd.vx   v2,v20,t2,v0.t
                  mulhsu     t3, a2, a1
                  sub        tp, s10, t5
                  vadd.vi    v23,v0,0,v0.t
                  ori        s7, s8, 684
                  div        t2, t3, tp
                  mulhsu     s9, s3, a7
                  vmadd.vv   v4,v11,v20,v0.t
                  xori       s2, s10, 150
                  mul        gp, s2, s6
                  slt        s5, sp, t5
                  xor        gp, s1, a5
                  xori       a6, a6, 825
                  mulh       zero, a1, s7
                  srl        a4, s0, s2
                  lui        s10, 779357
                  vfsub.vv   v22,v16,v30,v0.t
                  ori        t2, s7, 237
                  mulh       s5, t5, s5
                  vadc.vvm   v31,v8,v2,v0
                  or         a0, sp, s9
                  vmulhu.vv  v3,v5,v30,v0.t
                  or         a4, ra, sp
                  vadd.vx    v17,v2,ra,v0.t
                  lui        a2, 686859
                  vadc.vvm   v9,v12,v24,v0
                  srai       s7, gp, 17
                  divu       a1, sp, s7
                  sll        t3, ra, sp
                  vrsub.vi   v29,v15,0,v0.t
                  or         sp, t2, s2
                  andi       ra, s9, 509
                  vsll.vx    v1,v4,s3,v0.t
                  xor        s0, a1, a4
                  lui        s0, 261614
                  sub        a7, sp, s3
                  remu       s10, s10, t5
                  remu       s4, s10, t5
                  mulhu      a7, s11, t3
                  xor        a3, a1, t0
                  slti       a0, a4, 243
                  vfadd.vv   v17,v10,v4
                  and        t0, s4, a6
                  sra        s9, t3, t5
                  vmulh.vv   v21,v21,v17,v0.t
                  mulhu      t2, s4, s2
                  sra        s7, s9, gp
                  remu       a0, s8, s4
                  div        gp, s6, t2
                  rem        s3, tp, s3
                  mul        t5, s9, a4
                  vsub.vx    v28,v21,s9,v0.t
                  srai       tp, t2, 4
                  vfsub.vf   v30,v31,ft10,v0.t
                  vfsub.vf   v6,v30,ft5,v0.t
                  vslideup.vi v15,v23,0
                  div        s7, s4, sp
                  mul        sp, s8, zero
                  vmulh.vx   v18,v12,s4
                  vmulh.vx   v6,v2,s6
                  remu       a4, a1, t6
                  sll        s1, a6, a5
                  lui        t2, 585659
                  sltiu      t5, s11, 443
                  slt        s5, a2, a1
                  slt        sp, a2, s11
                  xor        a4, s7, sp
                  vslide1up.vx v9,v26,zero,v0.t
                  mulh       s1, gp, s11
                  vadd.vi    v14,v28,0,v0.t
                  vmulhu.vv  v2,v10,v1
                  vsub.vx    v8,v8,t5
                  or         a7, sp, s6
                  sub        a1, t3, s0
                  slli       t0, s10, 16
                  srli       s2, zero, 8
                  vmadd.vv   v11,v17,v7,v0.t
                  xor        s4, a0, t0
                  add        s7, gp, a0
                  addi       s5, a0, -547
                  vmulh.vv   v27,v5,v24,v0.t
                  addi       s8, a3, -233
                  ori        zero, s7, -807
                  or         ra, s4, s0
                  vslide1up.vx v13,v4,s8
                  mulhu      s2, tp, s11
                  vslide1up.vx v7,v31,sp,v0.t
                  vmul.vx    v1,v7,s9
                  vmulh.vx   v2,v24,s1
                  vrsub.vx   v29,v24,a1
                  or         s5, tp, s5
                  sll        t2, a7, s2
                  addi       a2, s7, 905
                  slt        s1, gp, a4
                  xor        a4, a3, s1
                  mulh       s7, s10, t4
                  vmulhu.vx  v12,v29,ra
                  ori        gp, a3, -187
                  vsadd.vi   v3,v28,0
                  divu       a0, a3, a3
                  vsadd.vx   v22,v10,sp,v0.t
                  slt        a2, s6, s6
                  mulhsu     s10, a6, gp
                  vslide1up.vx v22,v10,sp,v0.t
                  sltu       s0, s8, a5
                  vfadd.vf   v7,v18,fs8
                  srli       t0, s5, 15
                  addi       s9, s10, 810
                  div        a7, s2, s3
                  sra        gp, zero, s5
                  vsll.vv    v12,v11,v31,v0.t
                  div        s1, tp, s9
                  srai       t3, a4, 24
                  slti       gp, s9, 336
                  srli       a0, s4, 1
                  srl        zero, sp, t0
                  vmadd.vx   v17,t2,v25,v0.t
                  mul        s1, a2, a6
                  mul        s0, zero, s7
                  xor        t2, a1, a0
                  slt        zero, a1, t1
                  xor        a6, s3, s10
                  lui        a1, 203848
                  sltu       a0, t0, a1
                  sll        t1, s2, a0
                  vfadd.vv   v25,v6,v10
                  sub        s7, sp, s11
                  mulh       s4, t1, s2
                  div        a4, zero, a3
                  addi       gp, a1, -52
                  vslidedown.vx v8,v1,s4
                  div        a4, t5, s3
                  vmadd.vv   v5,v24,v30,v0.t
                  xori       t1, a0, -549
                  ori        t4, s8, -150
                  andi       s5, a6, 404
                  mulhu      s1, s0, sp
                  vadd.vi    v13,v5,0,v0.t
                  mul        t4, s1, s5
                  slli       zero, s3, 20
                  vslidedown.vx v25,v11,tp,v0.t
                  slti       tp, a7, 669
                  vslideup.vx v26,v31,a1,v0.t
                  ori        a6, a7, -980
                  xor        s5, a1, s9
                  vslide1up.vx v16,v9,s3,v0.t
                  slti       gp, a0, -46
                  sub        t1, t4, gp
                  lui        t5, 992265
                  addi       s10, s9, -668
                  vmadd.vx   v4,t2,v1
                  vsll.vx    v23,v23,a3,v0.t
                  remu       s4, t0, a3
                  sltu       s4, a4, a0
                  mulhsu     t0, tp, a5
                  sra        a2, t4, s8
                  vmadd.vx   v18,s3,v24,v0.t
                  and        s9, s11, gp
                  vsll.vv    v11,v7,v2,v0.t
                  vsadd.vi   v0,v16,0
                  andi       t5, s2, 545
                  remu       a1, t5, gp
                  slt        s9, s0, gp
                  remu       s4, a2, s2
                  vmul.vv    v25,v13,v28
                  srai       a6, a2, 3
                  sltu       t5, t4, t0
                  srl        a4, a5, s8
                  vslidedown.vx v31,v20,tp
                  mulhsu     s7, s1, s3
                  slt        s7, zero, a3
                  mulh       ra, a4, t2
                  vfadd.vf   v11,v20,fa7,v0.t
                  sll        a2, s6, s2
                  vslidedown.vx v5,v17,s11
                  slt        tp, gp, s10
                  srli       a1, t5, 23
                  mulhsu     a6, t3, a1
                  vmulhu.vv  v11,v3,v8
                  mulhsu     s9, s10, zero
                  vrsub.vi   v2,v12,0,v0.t
                  divu       s6, a5, a7
                  lui        s9, 755572
                  vsadd.vv   v2,v4,v11
                  vrsub.vx   v9,v14,gp
                  vmul.vx    v12,v14,t2
                  srli       ra, s11, 17
                  slt        a4, s0, s7
                  slti       s3, a5, 635
                  vfsub.vf   v8,v15,fa6
                  sra        a4, s11, s3
                  slt        a4, a6, s8
                  vslide1up.vx v4,v8,t1,v0.t
                  sub        s8, ra, s0
                  sltiu      a0, tp, -135
                  lui        s7, 215850
                  vadc.vim   v7,v24,0,v0
                  vmulh.vv   v10,v5,v9,v0.t
                  srl        s5, t5, t3
                  vsll.vx    v20,v9,tp
                  vmulh.vx   v14,v7,s0
                  ori        t5, s5, 404
                  vfadd.vf   v4,v1,fs3
                  sltiu      zero, t1, 105
                  srl        a4, t1, a7
                  divu       s5, t0, gp
                  vslideup.vx v22,v14,s6,v0.t
                  vadd.vi    v6,v23,0,v0.t
                  mul        t3, sp, a3
                  mul        s1, s0, s3
                  vslideup.vx v7,v14,s0,v0.t
                  ori        s7, t6, -309
                  mulhsu     sp, s3, ra
                  add        s1, s9, t1
                  andi       s1, a4, 415
                  vmul.vx    v5,v8,s0,v0.t
                  srl        s8, t0, t5
                  vrsub.vx   v4,v8,a0,v0.t
                  vslideup.vx v8,v25,a2,v0.t
                  auipc      s6, 437940
                  slt        s9, t6, tp
                  vslide1up.vx v24,v28,zero
                  slti       s10, s7, 328
                  andi       s10, s4, 290
                  slti       s9, tp, 995
                  vmulh.vv   v1,v6,v9,v0.t
                  auipc      s5, 918557
                  mulhsu     s5, s11, t3
                  or         s3, s4, t2
                  sub        a0, s8, s5
                  vsaddu.vi  v31,v30,0,v0.t
                  xori       t5, zero, -217
                  srli       ra, a1, 27
                  add        s4, t5, a1
                  sltu       s10, t5, t0
                  sra        a7, t1, s3
                  mulh       a4, a1, t2
                  divu       sp, tp, a0
                  sra        s1, s9, s2
                  srl        s2, s7, t3
                  or         a0, s8, t1
                  auipc      a4, 39760
                  vfadd.vf   v13,v7,fs9
                  remu       a6, ra, s9
                  remu       a4, a1, zero
                  and        a2, t2, sp
                  remu       gp, a1, ra
                  vsll.vv    v26,v9,v5,v0.t
                  and        s0, zero, a3
                  slt        t3, s1, s2
                  div        a0, ra, s9
                  xori       a3, s8, 327
                  slli       sp, s5, 22
                  sll        s9, s5, tp
                  vrsub.vi   v6,v20,0,v0.t
                  addi       s1, a1, -527
                  vsub.vx    v7,v0,a3,v0.t
                  slti       ra, t6, 5
                  sltiu      s4, a3, 957
                  vsll.vx    v25,v3,s1,v0.t
                  and        s7, sp, s10
                  lui        s6, 126569
                  slli       t0, t1, 24
                  divu       a3, t6, zero
                  andi       s1, sp, -240
                  srli       tp, a1, 5
                  vsub.vx    v9,v27,t4
                  vslidedown.vi v12,v27,0,v0.t
                  vsll.vv    v25,v4,v31
                  andi       a1, gp, 814
                  vsub.vv    v18,v14,v25
                  vmadd.vx   v9,zero,v17,v0.t
                  remu       s0, gp, s5
                  vmulh.vx   v19,v2,tp,v0.t
                  vslidedown.vi v19,v23,0
                  vmulhu.vv  v3,v12,v18
                  sltu       zero, ra, ra
                  mulhu      t1, t6, s4
                  vsadd.vi   v4,v6,0,v0.t
                  mulhsu     a0, gp, sp
                  addi       zero, s10, -928
                  sra        s7, s9, a2
                  vfadd.vf   v9,v10,ft0
                  mulhu      t3, a4, zero
                  vmul.vx    v2,v13,t1
                  auipc      a3, 701876
                  vsll.vx    v28,v30,t4
                  vmulhu.vx  v12,v13,a4
                  auipc      a4, 273520
                  vsaddu.vv  v10,v16,v1
                  vsub.vv    v15,v4,v3,v0.t
                  sll        s7, ra, a5
                  slli       tp, t6, 8
                  srai       s8, s7, 28
                  rem        a3, s2, tp
                  mulhsu     s0, t3, a1
                  sltiu      s1, a3, 58
                  vadd.vi    v26,v5,0
                  slt        s3, tp, t6
                  addi       s0, a6, -152
                  slli       s7, t4, 19
                  or         t5, s10, s5
                  vmulhu.vv  v13,v13,v3
                  slt        t5, t4, a6
                  slli       t0, s2, 22
                  xori       t0, a4, -321
                  vmadd.vv   v2,v25,v14
                  divu       s0, s4, s3
                  vmulh.vx   v22,v0,a6
                  srai       t1, a3, 30
                  mulhu      a7, s8, s8
                  sltu       s9, s6, sp
                  vslideup.vi v2,v13,0
                  remu       zero, a1, ra
                  remu       a6, s9, t5
                  slt        s9, ra, s5
                  slti       t2, s9, 793
                  or         s3, t0, tp
                  srl        a6, a3, a1
                  divu       s5, s4, s4
                  ori        ra, t6, 411
                  div        tp, tp, a4
                  vfadd.vv   v22,v3,v15,v0.t
                  srai       a7, s4, 4
                  vrsub.vx   v25,v23,s2,v0.t
                  vsadd.vx   v28,v19,s1,v0.t
                  vslide1up.vx v17,v5,gp,v0.t
                  vsub.vx    v30,v11,tp
                  vmulh.vx   v11,v16,s11,v0.t
                  vmul.vv    v11,v19,v0
                  vsub.vv    v0,v24,v1
                  vfsub.vf   v5,v9,ft1
                  srai       a2, a3, 2
                  vmadd.vv   v13,v31,v10,v0.t
                  and        ra, s4, a7
                  vsub.vv    v16,v5,v3
                  lui        a1, 270102
                  vadc.vim   v15,v17,0,v0
                  andi       a0, a3, 943
                  vsadd.vv   v19,v27,v23
                  mulhsu     s7, s1, s7
                  div        t0, tp, a0
                  andi       gp, tp, 300
                  or         a3, sp, s2
                  xori       a6, a4, -413
                  xori       a6, s9, -418
                  divu       t0, s11, sp
                  vslide1up.vx v17,v31,a7
                  srli       s5, s7, 13
                  vadd.vx    v18,v13,t3,v0.t
                  srl        s0, t5, t5
                  xori       tp, gp, 181
                  sltiu      tp, s5, -825
                  sll        tp, t1, s7
                  sub        s1, tp, s11
                  mulh       s6, s1, s8
                  sltu       t1, s9, a1
                  div        s1, s4, s1
                  slli       s0, tp, 12
                  vsll.vi    v31,v3,0,v0.t
                  ori        a1, s0, -263
                  slti       s1, s10, -254
                  vslidedown.vx v10,v5,t3,v0.t
                  mulh       s3, s9, s9
                  vsadd.vi   v30,v13,0,v0.t
                  vadc.vvm   v23,v13,v31,v0
                  vsadd.vv   v17,v28,v26
                  slti       s10, t3, 378
                  sra        gp, t2, s5
                  vfsub.vf   v29,v26,fs2,v0.t
                  or         s7, t3, s7
                  sll        s5, s10, a7
                  srai       s3, s7, 25
                  auipc      s6, 416297
                  addi       t3, zero, 18
                  vsaddu.vx  v11,v0,s9
                  sltiu      s5, gp, -919
                  srai       s10, tp, 3
                  vsaddu.vx  v27,v25,s0
                  lui        t3, 365763
                  vsadd.vv   v4,v11,v14,v0.t
                  mulh       s9, t6, a2
                  vmulhu.vv  v18,v27,v15
                  xori       t2, s10, -848
                  sub        s2, s6, ra
                  slt        s8, s11, tp
                  ori        sp, zero, 23
                  vsub.vv    v29,v12,v6,v0.t
                  auipc      t1, 862145
                  slt        s8, s2, s1
                  mul        t2, s2, zero
                  vslideup.vi v8,v29,0
                  srl        s5, a7, ra
                  rem        s6, s4, sp
                  vslide1up.vx v19,v30,t3,v0.t
                  or         s1, t2, s4
                  lui        s3, 510245
                  sltu       zero, t2, s3
                  add        t0, a2, a0
                  andi       t1, t0, -406
                  vmul.vx    v21,v8,a5,v0.t
                  slli       zero, s4, 0
                  vslide1up.vx v24,v21,t5
                  vmul.vv    v18,v9,v9,v0.t
                  div        a2, a1, a3
                  srl        a1, s1, s0
                  xori       t3, s8, 957
                  srl        t2, a4, a5
                  vrsub.vx   v18,v21,s11,v0.t
                  vslidedown.vx v17,v6,a5
                  lui        a2, 363749
                  vfadd.vv   v24,v5,v9,v0.t
                  slt        t1, s6, s8
                  remu       s3, s5, sp
                  vfadd.vf   v12,v14,fs11
                  vslide1up.vx v20,v18,t2,v0.t
                  rem        sp, s4, s7
                  srl        s6, s7, a7
                  rem        t4, t1, s0
                  remu       s4, tp, t1
                  sltu       s6, s1, s0
                  divu       s2, a0, s6
                  vsub.vx    v10,v11,t2
                  vslideup.vx v1,v18,s3
                  vsadd.vi   v10,v3,0
                  sub        s7, zero, a2
                  vadc.vxm   v19,v27,s5,v0
                  vslide1up.vx v18,v27,sp
                  ori        t3, t6, -811
                  andi       a1, t6, 391
                  srai       zero, a6, 26
                  vmul.vv    v17,v1,v20
                  mul        a3, a3, a2
                  vslidedown.vx v2,v21,a7
                  lui        a3, 362467
                  srai       s6, ra, 13
                  xor        gp, s8, a5
                  sub        s0, t5, t4
                  lui        s10, 621721
                  vslidedown.vx v6,v31,s5,v0.t
                  rem        a6, s10, t3
                  div        a7, s11, t1
                  vsadd.vv   v30,v2,v19,v0.t
                  and        s9, t4, tp
                  srli       s8, t1, 16
                  sub        s7, ra, a6
                  vsub.vx    v15,v8,sp
                  sub        s9, s11, s9
                  vmulh.vx   v18,v28,a0
                  vfadd.vf   v4,v25,fs1
                  vmulhu.vx  v31,v17,ra
                  sll        a1, s10, a2
                  srai       t3, t5, 15
                  vmulhu.vx  v22,v1,s4
                  vfadd.vv   v25,v0,v5
                  mulh       s0, t3, a6
                  mulhsu     s9, a2, a3
                  mulh       gp, a3, s4
                  andi       a6, s9, -779
                  slt        a6, a4, t0
                  vslidedown.vi v27,v29,0
                  vadc.vxm   v19,v17,s8,v0
                  sra        s9, s10, t2
                  vfsub.vv   v5,v19,v3,v0.t
                  vfsub.vv   v4,v13,v7,v0.t
                  vsub.vv    v20,v17,v29
                  mulhu      s3, t1, a0
                  lui        s1, 1044230
                  slli       zero, s0, 9
                  or         a1, ra, s6
                  rem        gp, tp, t2
                  sub        tp, t1, s10
                  vslide1up.vx v0,v26,t5
                  divu       a6, s10, s1
                  divu       s4, t2, s9
                  vslide1up.vx v20,v19,s1
                  vsaddu.vi  v12,v24,0
                  slti       s2, t5, -269
                  vmulh.vx   v20,v28,t1,v0.t
                  vmadd.vv   v26,v28,v12
                  vfsub.vv   v15,v23,v26,v0.t
                  add        s9, tp, a7
                  or         a0, ra, s3
                  slt        gp, s1, a2
                  vsadd.vi   v9,v20,0,v0.t
                  mulhsu     t3, a0, a6
                  andi       s6, gp, -299
                  srl        a0, a7, ra
                  sll        s4, zero, a4
                  vsaddu.vv  v5,v1,v4
                  vmulh.vx   v22,v24,s1
                  vfsub.vf   v6,v22,ft5,v0.t
                  addi       s10, s5, 735
                  and        gp, gp, a6
                  vsadd.vi   v9,v22,0
                  vadc.vim   v26,v6,0,v0
                  vmadd.vv   v28,v2,v8,v0.t
                  srai       s0, s2, 13
                  slti       a6, s11, 56
                  vslidedown.vx v23,v10,a3,v0.t
                  mulh       a3, a3, tp
                  div        gp, a5, a0
                  sub        t4, s7, s11
                  vadd.vi    v0,v22,0
                  vmulhu.vv  v25,v18,v12
                  remu       s1, t3, a7
                  vmulh.vv   v7,v15,v6,v0.t
                  vsll.vv    v8,v24,v12,v0.t
                  vmulh.vx   v13,v4,a7,v0.t
                  vsadd.vi   v5,v31,0,v0.t
                  vmulhu.vx  v4,v25,s9
                  mulhu      s0, s2, s10
                  ori        s1, t3, -1013
                  lui        a6, 961558
                  vadd.vi    v0,v18,0
                  vadd.vx    v9,v12,tp
                  auipc      a7, 262921
                  add        a7, s7, s7
                  vrsub.vx   v10,v26,a4,v0.t
                  vmadd.vv   v10,v8,v11,v0.t
                  vrsub.vx   v29,v9,s9,v0.t
                  vslide1up.vx v21,v31,t1,v0.t
                  srai       a0, a6, 12
                  xor        a7, s11, t0
                  vfsub.vf   v21,v5,ft7,v0.t
                  mul        t5, s3, a1
                  vadc.vxm   v15,v25,a0,v0
                  mulh       sp, a4, t2
                  sra        s8, s10, t4
                  vsaddu.vx  v3,v8,a3
                  vsub.vv    v16,v12,v24
                  rem        s3, s3, t3
                  vmulh.vv   v15,v31,v6,v0.t
                  vfadd.vv   v9,v4,v8,v0.t
                  slt        gp, a4, ra
                  vsaddu.vi  v14,v0,0
                  slli       t3, a0, 29
                  slli       s8, a3, 17
                  andi       gp, s8, 686
                  slli       s5, s5, 17
                  vmadd.vv   v23,v3,v1,v0.t
                  vrsub.vx   v15,v13,a1,v0.t
                  sltiu      s0, a7, -345
                  and        s4, s9, t2
                  vrsub.vx   v22,v11,s1,v0.t
                  vsll.vx    v10,v0,a0
                  srl        t4, gp, zero
                  mulhu      s7, s6, s8
                  vsub.vx    v8,v20,s3
                  vfsub.vv   v27,v20,v14
                  vsadd.vx   v2,v1,t6,v0.t
                  mulhu      sp, a0, s8
                  mul        s8, s10, s5
                  vslide1up.vx v25,v5,a2
                  vadc.vim   v13,v7,0,v0
                  mulhu      gp, t5, s2
                  sll        s1, s0, s5
                  ori        a2, t4, 441
                  slt        t3, zero, s1
                  sra        s9, ra, s6
                  sra        t5, s1, a5
                  ori        tp, t4, -864
                  vsub.vv    v30,v3,v23
                  add        s1, t2, t2
                  srai       t2, a5, 30
                  slt        s9, s7, gp
                  add        a6, s0, a5
                  vslidedown.vx v14,v23,s2
                  vmulh.vv   v17,v12,v2,v0.t
                  or         t4, s11, a3
                  vsub.vx    v28,v3,t4,v0.t
                  mul        t3, zero, t3
                  vslidedown.vx v28,v23,t3
                  ori        s4, t5, 928
                  xor        zero, s2, a3
                  xor        a1, s3, gp
                  vslideup.vx v24,v7,t2
                  vsub.vx    v31,v10,s0
                  vadc.vim   v1,v21,0,v0
                  sub        a3, t5, a2
                  remu       zero, t2, t1
                  vadc.vvm   v5,v21,v28,v0
                  mulh       a0, s7, s9
                  slti       a4, s11, 372
                  auipc      s7, 792537
                  divu       t0, t1, tp
                  vfsub.vv   v0,v21,v16
                  slti       tp, t2, 854
                  ori        ra, a0, 437
                  mul        t2, s6, t4
                  lui        s6, 514747
                  mulh       s2, t5, t1
                  sltiu      ra, a3, -192
                  add        tp, t3, s9
                  srai       zero, t6, 26
                  sra        a7, s9, a6
                  sltu       a3, s8, t2
                  slli       a3, s5, 20
                  rem        a0, a2, a4
                  vslideup.vx v20,v15,s2,v0.t
                  vfadd.vf   v24,v25,ft6
                  add        gp, t2, gp
                  vmulhu.vv  v8,v29,v15,v0.t
                  or         zero, s8, s2
                  vadc.vvm   v8,v5,v24,v0
                  vslideup.vx v12,v31,sp,v0.t
                  vslide1up.vx v11,v27,ra,v0.t
                  sll        gp, tp, t6
                  vmulh.vx   v20,v29,tp,v0.t
                  slti       zero, s2, -495
                  div        t3, s9, a7
                  slt        s6, a6, s2
                  divu       t5, s2, t5
                  sltu       s9, s11, t4
                  and        s1, a5, s0
                  or         a0, a6, s9
                  rem        zero, a3, s11
                  srai       a4, a4, 10
                  vslideup.vx v15,v22,a5,v0.t
                  vmulhu.vx  v4,v31,t3
                  vmadd.vx   v13,a2,v16,v0.t
                  slli       a3, a4, 16
                  vfsub.vv   v23,v23,v22
                  slti       s4, t2, -53
                  vadd.vv    v30,v14,v17
                  vslidedown.vi v22,v15,0
                  vrsub.vx   v21,v16,s5
                  vsub.vx    v12,v10,s10,v0.t
                  vsub.vx    v11,v14,t0
                  vrsub.vi   v28,v28,0,v0.t
                  sll        s5, t1, a0
                  remu       a7, t0, t0
                  vslideup.vi v16,v10,0
                  slli       t5, t0, 25
                  srl        a0, s8, tp
                  vsadd.vv   v22,v14,v14,v0.t
                  div        s6, t1, gp
                  vmadd.vx   v14,sp,v6
                  xor        s1, a2, s2
                  mul        a1, ra, ra
                  srli       s8, tp, 10
                  and        ra, t3, t5
                  vfsub.vv   v12,v4,v8
                  div        s0, t1, sp
                  remu       sp, a3, s4
                  vmadd.vx   v29,a7,v4,v0.t
                  vsadd.vv   v7,v7,v24
                  sra        gp, a5, a0
                  mulhsu     s8, a1, s5
                  vmul.vv    v10,v1,v17,v0.t
                  or         s5, ra, a7
                  vmulhu.vv  v29,v30,v18
                  xor        s4, a2, s1
                  add        a3, a1, tp
                  slt        t0, t6, s5
                  add        a1, s1, a2
                  mulhsu     s5, s4, t5
                  or         t5, s9, a5
                  srl        tp, s5, s4
                  sll        a6, s8, s6
                  sll        a7, s9, s2
                  srl        a3, t3, s10
                  srl        sp, a4, a6
                  vfadd.vf   v11,v18,fa2
                  vsub.vv    v0,v24,v3
                  vsadd.vx   v21,v30,a3
                  sltu       s8, a3, s5
                  vadc.vxm   v4,v12,a0,v0
                  vmulh.vx   v22,v7,s5
                  vmulhu.vv  v4,v16,v15
                  vmul.vx    v23,v4,t1
                  mulhsu     t3, t2, a6
                  addi       tp, s11, -39
                  sra        a0, s2, s10
                  rem        s8, s3, s8
                  srl        s0, s9, a3
                  or         a7, s3, s2
                  vslideup.vi v11,v13,0,v0.t
                  vslideup.vx v26,v31,tp
                  xor        sp, s0, a6
                  xor        a2, t3, s9
                  sra        t1, a3, a1
                  vadd.vi    v17,v4,0
                  vslidedown.vi v17,v10,0,v0.t
                  sltiu      a7, zero, -715
                  add        s1, s2, a1
                  lui        a3, 256541
                  sltu       s0, t3, a2
                  mulhu      t5, s2, s6
                  vmulh.vx   v18,v23,s7
                  vsub.vx    v29,v15,s0,v0.t
                  slti       s5, t0, -516
                  srai       s3, ra, 30
                  sltu       s6, a3, tp
                  addi       t5, a3, 254
                  vadc.vim   v10,v7,0,v0
                  add        a0, s4, a3
                  vmadd.vv   v23,v28,v8
                  vfsub.vv   v25,v1,v29
                  div        zero, sp, s2
                  remu       s1, t5, sp
                  slli       s4, s9, 18
                  and        a4, s5, s11
                  srai       a6, s4, 6
                  sub        a0, s4, s9
                  or         s7, s6, s11
                  slti       s0, s2, -236
                  vmulhu.vv  v9,v13,v11
                  vadc.vvm   v15,v8,v28,v0
                  addi       s7, gp, -566
                  divu       s10, t4, a6
                  div        t4, s11, ra
                  add        s5, s1, t0
                  sub        s0, s2, s7
                  remu       a4, a1, s0
                  vmulhu.vx  v6,v5,s4
                  slti       s2, a1, -116
                  add        tp, s6, s7
                  vsadd.vi   v21,v15,0,v0.t
                  lui        s2, 144820
                  slti       s0, t5, -716
                  srli       t0, a7, 11
                  mulhu      t5, s5, s2
                  slli       s9, t0, 16
                  vsaddu.vv  v20,v31,v25,v0.t
                  vrsub.vx   v30,v24,a0,v0.t
                  vmul.vx    v28,v30,a1,v0.t
                  vmadd.vx   v11,s4,v20
                  slti       tp, t3, 146
                  xor        t0, s7, s11
                  vadd.vx    v7,v31,s4
                  sll        t1, t5, s0
                  srli       a6, t5, 31
                  vslidedown.vx v0,v22,t0
                  vmul.vv    v25,v14,v19
                  vfsub.vf   v25,v4,fs8,v0.t
                  vmadd.vv   v5,v23,v18
                  mulhu      t3, t1, sp
                  xori       s8, s1, 591
                  vslide1up.vx v15,v24,tp,v0.t
                  xor        tp, s8, t3
                  sll        a2, s3, ra
                  mul        s2, a4, a5
                  add        t3, sp, a7
                  lui        s2, 202903
                  vslideup.vi v30,v25,0,v0.t
                  vadd.vi    v6,v16,0
                  vmul.vv    v30,v3,v14,v0.t
                  srl        s9, a7, sp
                  vsadd.vv   v17,v8,v29
                  xor        s1, t3, s11
                  or         t4, a0, s3
                  or         t5, t0, a2
                  auipc      sp, 574763
                  vslideup.vx v2,v26,t3,v0.t
                  slli       ra, a6, 5
                  sll        s4, s2, sp
                  sll        t4, zero, a2
                  vmadd.vx   v8,zero,v15
                  mulhu      gp, a1, t4
                  sltu       a3, s9, a4
                  vslide1up.vx v14,v3,t0
                  mulhsu     a6, a5, a2
                  remu       a2, t3, gp
                  sltiu      zero, s3, -119
                  sltiu      s2, a6, 906
                  div        s6, s9, a2
                  andi       s9, a0, 140
                  vmul.vv    v13,v4,v23
                  mulhu      a3, s10, ra
                  auipc      s6, 30350
                  vsaddu.vx  v16,v4,t3
                  div        sp, t0, s3
                  mulh       s10, t0, a6
                  srli       s8, a4, 16
                  sll        t1, a5, s7
                  srli       a1, s6, 6
                  andi       s9, s3, 451
                  sltu       s4, s6, s1
                  mulhsu     a6, s5, s4
                  sub        a1, t5, a2
                  vfsub.vv   v28,v29,v8,v0.t
                  vslideup.vx v10,v1,zero
                  remu       s10, a0, a4
                  sltu       t3, t5, zero
                  mulh       s4, a3, t5
                  vsaddu.vv  v1,v18,v13
                  sltu       a7, s8, s10
                  vslidedown.vi v8,v0,0,v0.t
                  vslide1up.vx v21,v6,s7,v0.t
                  lui        t0, 636229
                  addi       t3, s8, 69
                  remu       a2, t3, t6
                  vrsub.vi   v20,v8,0
                  vmul.vx    v25,v11,a6,v0.t
                  sra        t1, tp, a4
                  vslidedown.vx v18,v16,gp,v0.t
                  vslide1up.vx v1,v16,s11,v0.t
                  sltiu      t3, s11, -134
                  add        a6, a7, gp
                  xor        gp, s3, a1
                  vsll.vx    v28,v22,s8
                  vmul.vx    v4,v24,s4
                  xori       a6, zero, -560
                  vmadd.vv   v22,v10,v8,v0.t
                  sltu       a3, s6, t4
                  or         s1, t6, a4
                  div        s0, s11, tp
                  srai       s3, ra, 22
                  vsadd.vi   v27,v24,0
                  slli       s10, t0, 30
                  add        s4, sp, s10
                  slt        zero, s5, t0
                  ori        a0, s4, 277
                  sltu       s0, a5, t2
                  srli       t2, a7, 23
                  sltiu      ra, t5, -912
                  vrsub.vx   v0,v2,s5
                  addi       s10, a7, 422
                  vadc.vim   v1,v19,0,v0
                  xor        a4, a7, s10
                  xor        s6, s7, a0
                  vsadd.vx   v23,v7,s5
                  vslide1up.vx v23,v14,s3
                  sltu       a4, zero, s1
                  vfadd.vf   v31,v18,ft6,v0.t
                  ori        a2, t3, 750
                  divu       s3, s8, ra
                  sra        zero, s8, s6
                  mulh       s5, s9, sp
                  rem        a2, a4, s8
                  vfsub.vv   v17,v0,v31
                  vslideup.vi v21,v10,0
                  vfsub.vv   v28,v19,v11
                  sra        t4, s7, a7
                  vmulhu.vv  v10,v18,v18
                  vmul.vv    v0,v23,v5
                  vfsub.vf   v18,v1,fa2,v0.t
                  mulhu      a1, s11, a5
                  or         a0, a7, sp
                  vsadd.vi   v28,v21,0
                  div        zero, s9, zero
                  rem        s6, s7, a7
                  vfadd.vv   v23,v19,v25
                  sra        s3, t6, s1
                  auipc      a0, 118457
                  or         t2, tp, s3
                  slti       s10, a4, -385
                  vsub.vv    v12,v9,v1
                  vsll.vi    v16,v22,0
                  slli       s1, a5, 3
                  and        s4, t2, s11
                  vsub.vv    v2,v30,v11,v0.t
                  sra        s3, s2, s2
                  vfsub.vv   v9,v13,v13,v0.t
                  vadd.vi    v12,v4,0
                  vmadd.vx   v17,tp,v30,v0.t
                  auipc      gp, 887597
                  lui        t2, 788148
                  addi       ra, t1, 686
                  or         a7, a1, t1
                  vadc.vim   v11,v1,0,v0
                  and        t0, a3, s5
                  divu       s1, t0, s5
                  xor        zero, a3, t1
                  andi       a4, s7, -418
                  srli       a4, tp, 7
                  sub        a6, s3, s7
                  andi       t2, s3, -514
                  slt        s2, tp, tp
                  div        s7, a1, s3
                  sub        t4, a7, a4
                  vsub.vv    v1,v23,v3,v0.t
                  mul        s4, t6, s1
                  sra        a2, a1, s0
                  vfadd.vf   v11,v6,ft8
                  add        a1, zero, a3
                  vfsub.vf   v23,v24,ft11,v0.t
                  vmadd.vv   v13,v29,v18,v0.t
                  mulhsu     s5, a5, t5
                  lui        a6, 565074
                  slti       a6, a6, 183
                  or         s9, t2, s2
                  slt        t4, a6, a5
                  sll        a1, s9, a6
                  divu       t4, t3, a6
                  vsaddu.vv  v19,v13,v3,v0.t
                  srli       s8, zero, 1
                  and        s2, s7, s2
                  slli       s10, t6, 5
                  slt        s0, s6, s4
                  sra        t0, a1, s4
                  sll        zero, a0, zero
                  addi       gp, s2, 784
                  vsaddu.vv  v0,v27,v2
                  vslideup.vx v8,v20,a5,v0.t
                  lui        s9, 917819
                  mulhsu     a2, s6, sp
                  xori       a0, s1, -645
                  add        a7, t2, a5
                  xori       a1, gp, 365
                  vmadd.vx   v14,s9,v21
                  srai       s1, t1, 28
                  vsaddu.vx  v18,v25,s4
                  vadd.vv    v14,v24,v18
                  mulh       s7, s11, a2
                  ori        gp, t1, 937
                  ori        t3, t6, -348
                  vadd.vx    v29,v19,a7
                  slli       tp, s5, 7
                  sra        s2, s3, s2
                  rem        t5, a6, s11
                  divu       a4, t1, s5
                  vrsub.vi   v4,v19,0
                  slti       s1, t6, 788
                  sub        a6, t6, t2
                  vslideup.vi v19,v13,0,v0.t
                  xor        a0, s6, s5
                  srli       s3, s10, 16
                  slti       t5, a3, 948
                  vfsub.vv   v24,v21,v10
                  vfadd.vf   v10,v8,fs7
                  mulhu      s4, a6, s8
                  sltiu      s7, s9, -115
                  vsadd.vv   v14,v19,v14
                  mulhsu     s4, s9, s2
                  srl        a0, t4, sp
                  srli       s4, gp, 13
                  vadc.vxm   v24,v5,tp,v0
                  andi       a7, a2, 935
                  mul        s8, t1, a2
                  vsll.vv    v27,v15,v14
                  auipc      a6, 717047
                  rem        s4, a4, a0
                  vslidedown.vx v29,v8,a4,v0.t
                  sll        t3, t2, t2
                  mulhsu     a1, a1, t2
                  rem        s1, s1, a3
                  srli       s6, s2, 20
                  and        s3, a3, s10
                  vrsub.vx   v4,v20,a0,v0.t
                  add        a7, s8, t1
                  vmulh.vv   v13,v0,v31,v0.t
                  vrsub.vi   v31,v25,0
                  or         s10, a4, s2
                  and        t5, a1, s11
                  vsaddu.vi  v19,v10,0,v0.t
                  vfadd.vf   v23,v13,fs0,v0.t
                  sra        a2, a1, a0
                  lui        a6, 702464
                  slli       t1, a2, 9
                  slli       t5, t0, 16
                  and        t5, s3, t0
                  vsll.vx    v9,v14,s7,v0.t
                  vslidedown.vx v10,v28,t5,v0.t
                  lui        t5, 564666
                  vsll.vv    v11,v7,v31,v0.t
                  slti       t3, zero, 245
                  slli       sp, t2, 27
                  div        t1, a7, s7
                  andi       tp, zero, -1011
                  or         s8, s1, a4
                  vfsub.vf   v30,v10,ft6
                  xor        s0, t0, s8
                  lui        a1, 374508
                  divu       a4, s6, s5
                  xor        sp, s4, a4
                  sll        s0, a0, s5
                  remu       a7, zero, a1
                  mulh       a7, t5, gp
                  mulhu      s2, s5, a1
                  mulhsu     ra, s7, t0
                  vslide1up.vx v10,v29,s7,v0.t
                  mulhsu     t3, a3, s11
                  xor        s5, gp, t0
                  remu       t4, gp, s2
                  vslide1up.vx v3,v4,s11
                  sub        t2, t4, s10
                  sll        s7, s3, s3
                  sll        s4, s0, ra
                  mulh       a0, t3, s5
                  auipc      ra, 423646
                  xor        a7, t2, gp
                  sub        s4, s7, a2
                  vsadd.vx   v20,v18,a7,v0.t
                  vslideup.vi v19,v22,0,v0.t
                  vmul.vv    v3,v18,v4,v0.t
                  vsadd.vv   v10,v11,v8,v0.t
                  slti       gp, t5, 827
                  vmulhu.vv  v20,v2,v3
                  sltu       s4, s8, s10
                  vrsub.vx   v5,v0,a4
                  vsadd.vi   v13,v26,0
                  add        a1, a2, a1
                  vrsub.vi   v24,v3,0
                  vmulh.vv   v14,v20,v23
                  sltiu      t1, t4, 310
                  vslidedown.vx v30,v19,s9,v0.t
                  ori        t5, t2, -231
                  sltu       s3, tp, t6
                  remu       t2, s8, a3
                  addi       s3, tp, -169
                  rem        t4, s4, t2
                  vsub.vx    v16,v20,s11,v0.t
                  vfsub.vv   v22,v2,v14
                  vmulh.vx   v12,v29,s10,v0.t
                  vmulhu.vx  v14,v27,a4,v0.t
                  vmulh.vx   v2,v26,a7,v0.t
                  remu       s7, t0, t6
                  div        sp, t5, a2
                  xori       s5, ra, -644
                  vmul.vv    v1,v16,v20
                  sltiu      s9, a3, 205
                  mulh       gp, t2, t0
                  srl        a7, s8, a5
                  ori        zero, s7, 401
                  add        a7, a1, ra
                  rem        ra, a2, s2
                  srai       s4, t3, 28
                  div        s3, t1, t6
                  sltu       sp, tp, a0
                  slli       t0, zero, 23
                  sub        a7, s0, s6
                  xori       a6, a2, -831
                  sltiu      t4, t2, -73
                  vfadd.vf   v13,v11,fs8,v0.t
                  vsub.vv    v29,v31,v22,v0.t
                  vfadd.vv   v23,v24,v6
                  add        t5, s9, a4
                  slti       s4, a7, -9
                  vmul.vx    v16,v20,t5
                  vslide1up.vx v25,v22,t6
                  sub        t0, a3, a2
                  slt        gp, s8, t1
                  rem        t1, a2, a0
                  sub        sp, a0, t1
                  divu       t4, s11, a6
                  sltu       t2, a3, s8
                  mul        gp, a3, a7
                  vslide1up.vx v6,v17,a7,v0.t
                  addi       s9, s5, -922
                  sltiu      a3, s6, 491
                  mulhu      sp, a1, gp
                  vsadd.vi   v28,v23,0,v0.t
                  sltu       s4, s7, s11
                  vsll.vi    v13,v11,0
                  mulhu      s0, s11, s2
                  sll        zero, zero, tp
                  vmulhu.vx  v2,v3,a0,v0.t
                  slti       a6, t6, 183
                  vslideup.vx v15,v26,s1
                  xor        a6, s10, s10
                  vslidedown.vi v12,v18,0,v0.t
                  vsll.vx    v30,v13,zero,v0.t
                  srl        t4, ra, t3
                  vmul.vv    v17,v12,v17
                  vrsub.vx   v12,v14,zero
                  remu       sp, zero, s8
                  xor        sp, gp, t1
                  xori       a4, a4, 956
                  vfadd.vv   v29,v5,v2
                  slt        gp, a1, s2
                  vsub.vx    v1,v30,a4
                  mulhsu     t2, s2, a7
                  srli       gp, a7, 1
                  srai       s2, t1, 28
                  ori        t3, tp, 884
                  rem        zero, a0, t1
                  sll        s1, s3, s11
                  vmadd.vx   v4,s2,v13,v0.t
                  sltiu      s7, s8, 75
                  vsll.vx    v30,v5,s6
                  mulhu      a2, a5, t2
                  lui        s6, 774304
                  slli       t3, t6, 13
                  mulhsu     a4, a4, t2
                  vslideup.vx v23,v31,ra
                  vmulh.vx   v16,v29,a2,v0.t
                  sltu       s6, a5, t6
                  vfadd.vf   v12,v22,fa0,v0.t
                  xori       a1, a4, -10
                  mul        s2, s6, a3
                  or         t2, sp, s3
                  vrsub.vx   v21,v14,zero,v0.t
                  srli       t4, t3, 0
                  vslide1up.vx v9,v15,a1,v0.t
                  vsub.vv    v1,v14,v1
                  vsaddu.vv  v30,v3,v7
                  ori        s4, a2, 932
                  rem        tp, t3, a5
                  vmul.vx    v24,v3,s10
                  mulhsu     s1, t1, gp
                  vadc.vxm   v6,v24,s9,v0
                  andi       t0, gp, -707
                  vsub.vv    v21,v26,v10
                  sll        s5, s2, a2
                  divu       a3, sp, s8
                  mulhsu     s8, a7, a2
                  vslideup.vx v19,v14,a4
                  vadd.vv    v3,v10,v10,v0.t
                  and        tp, a2, s8
                  remu       s6, t3, s10
                  slt        s5, t0, s0
                  vfsub.vf   v31,v16,fs8,v0.t
                  slt        a2, s9, a7
                  vadd.vi    v19,v20,0
                  and        s0, a4, t0
                  vsadd.vv   v27,v25,v13
                  vslide1up.vx v27,v16,s9
                  slli       s1, zero, 25
                  vmulh.vv   v17,v7,v20,v0.t
                  srai       s1, t0, 25
                  sll        tp, s3, s4
                  vsll.vi    v18,v23,0
                  divu       t3, s4, s3
                  vslideup.vi v31,v4,0,v0.t
                  andi       s6, s4, -254
                  vmulhu.vv  v8,v9,v24,v0.t
                  sltu       s4, s8, t2
                  vmadd.vv   v9,v31,v22,v0.t
                  vfsub.vv   v26,v19,v26
                  add        gp, t3, t6
                  slli       tp, a3, 0
                  srli       s4, s8, 17
                  vsaddu.vv  v19,v3,v16
                  divu       s9, a5, a6
                  addi       s8, a7, 664
                  xor        t1, s4, s6
                  sltu       t1, s3, a6
                  mulhu      s2, t4, s3
                  mulhsu     s6, s8, s1
                  xori       t0, s2, 724
                  vslide1up.vx v3,v17,s0,v0.t
                  mulh       s10, a3, sp
                  div        sp, t0, gp
                  slli       gp, t4, 20
                  divu       t3, t5, sp
                  mulhsu     t5, zero, t2
                  srai       t5, s2, 16
                  srli       s4, t5, 22
                  remu       s0, s6, a5
                  vsub.vx    v6,v2,a7,v0.t
                  sltiu      s5, a2, -450
                  slt        sp, s2, t2
                  addi       s9, s8, -424
                  mul        a2, s6, a4
                  vsaddu.vi  v29,v6,0,v0.t
                  ori        t5, a4, 879
                  vfadd.vf   v21,v26,fs9
                  andi       a1, a3, 37
                  or         s10, s0, s3
                  mul        s7, t0, a2
                  vfadd.vv   v20,v19,v1
                  xor        s5, tp, ra
                  vsub.vv    v1,v29,v21,v0.t
                  sltiu      s4, a5, -135
                  slti       a3, s1, -576
                  add        gp, s1, s7
                  vsadd.vi   v28,v31,0
                  mul        s10, s0, t0
                  sll        s0, s0, t2
                  vadc.vim   v1,v14,0,v0
                  vmulhu.vv  v11,v26,v4
                  sub        a4, s3, t6
                  vslide1up.vx v23,v8,s2
                  add        s5, a4, a2
                  lui        s0, 431566
                  and        s1, t3, t2
                  sub        a4, t6, s8
                  andi       s8, a2, -157
                  ori        a0, s6, -200
                  vsadd.vx   v12,v24,t3,v0.t
                  vmulhu.vv  v23,v25,v13
                  slt        a4, t0, a5
                  slti       ra, s6, -86
                  sub        a1, a1, t0
                  mulhu      a1, tp, t6
                  div        t2, s9, t6
                  add        t1, t6, a3
                  vfsub.vv   v9,v16,v12
                  slt        a3, t2, a1
                  vadd.vi    v27,v29,0
                  vrsub.vi   v19,v1,0
                  srai       s10, t3, 7
                  divu       a0, t4, ra
                  vsll.vv    v2,v15,v9,v0.t
                  sra        a7, a4, t5
                  or         s3, a6, gp
                  vslidedown.vx v20,v10,t6
                  rem        s8, gp, t3
                  auipc      s6, 867692
                  srl        ra, s4, s2
                  slti       a3, s3, 108
                  vsadd.vx   v14,v15,s4,v0.t
                  slt        s8, s3, ra
                  vrsub.vx   v3,v26,s0,v0.t
                  sltiu      s4, s4, -584
                  mul        t1, tp, a5
                  sltu       s2, a4, s5
                  addi       a4, ra, -975
                  ori        s4, s0, 413
                  vslideup.vi v11,v12,0,v0.t
                  divu       ra, a5, s1
                  vmadd.vx   v4,a5,v2
                  andi       a1, a0, 207
                  srli       a1, a2, 23
                  slti       gp, t1, -512
                  vadc.vxm   v18,v28,a4,v0
                  vadd.vi    v13,v8,0,v0.t
                  mulhu      a2, s6, a6
                  srai       s6, s5, 14
                  xori       gp, s7, -555
                  srai       t2, t2, 15
                  vslide1up.vx v26,v2,s6
                  vslideup.vi v11,v25,0,v0.t
                  sra        a6, s8, a1
                  add        s5, a7, gp
                  mulhsu     ra, t4, s2
                  srl        t3, s2, s3
                  sra        gp, a0, s6
                  vsaddu.vx  v21,v4,s7
                  sra        s4, a5, a1
                  sltu       s6, s6, a2
                  auipc      s5, 614313
                  divu       t1, t6, s4
                  vfsub.vv   v15,v24,v14
                  srli       a2, a1, 3
                  and        sp, a3, a5
                  vrsub.vx   v18,v6,a5
                  and        a4, a7, t5
                  vmadd.vx   v9,s4,v6
                  lui        s9, 99710
                  mulh       s8, s10, t6
                  srai       s1, s1, 6
                  andi       t3, gp, -992
                  ori        s5, sp, -603
                  auipc      a1, 267977
                  sub        t2, s11, s5
                  vslide1up.vx v11,v24,gp
                  sltiu      s6, a3, -770
                  vfsub.vv   v31,v15,v2,v0.t
                  mulhsu     s8, t3, s8
                  rem        a3, t3, t3
                  lui        s8, 571865
                  xori       t5, a4, -50
                  sll        zero, s11, t6
                  mulhsu     s2, s4, t2
                  sra        s4, s11, t4
                  slli       s4, a2, 4
                  divu       sp, a4, t1
                  vsaddu.vi  v21,v8,0
                  srai       s3, s8, 15
                  mulh       tp, t2, t1
                  sra        a7, a1, s7
                  xor        tp, t2, s8
                  srai       s1, ra, 19
                  div        s7, a5, s9
                  addi       tp, t3, -90
                  sltu       a7, a4, a5
                  mul        s0, s5, t1
                  srl        s9, s4, s5
                  xor        s7, t5, a4
                  vsll.vx    v11,v28,s9
                  vfsub.vf   v19,v4,fa5,v0.t
                  vfadd.vv   v0,v17,v14
                  divu       t4, t6, t3
                  xor        s2, t2, ra
                  mulh       zero, a7, a4
                  vmulhu.vx  v7,v26,a0
                  vslideup.vx v31,v28,tp,v0.t
                  and        s3, sp, a5
                  slli       s9, a2, 27
                  vslide1up.vx v13,v24,s11
                  vslideup.vx v19,v2,s11,v0.t
                  vmulh.vv   v14,v19,v9,v0.t
                  sltu       t3, s8, a6
                  lui        zero, 636304
                  slti       s8, s5, 627
                  sltu       zero, t1, t6
                  addi       s2, a0, 2
                  sub        a2, t2, s7
                  sub        a3, a7, s3
                  add        ra, gp, s7
                  vfsub.vf   v4,v12,fs4,v0.t
                  srai       a7, s0, 29
                  slti       s0, s6, 854
                  srai       a3, t1, 7
                  andi       a0, a4, -853
                  ori        t3, s4, 617
                  vmadd.vv   v6,v22,v16,v0.t
                  srai       a7, a7, 30
                  slli       t0, s0, 14
                  vsadd.vi   v10,v22,0,v0.t
                  remu       zero, a6, s10
                  andi       gp, a5, -714
                  mulhu      a3, a1, s2
                  remu       a4, s2, s2
                  mulh       a7, s8, a6
                  or         s1, a2, s6
                  vsadd.vv   v26,v17,v24
                  xori       s5, tp, -543
                  vmadd.vv   v30,v5,v31,v0.t
                  vadc.vxm   v23,v12,s3,v0
                  mulhsu     t3, s8, gp
                  sll        t4, t2, t1
                  sltiu      t2, a6, 481
                  addi       sp, gp, 509
                  mulhsu     s8, a5, sp
                  ori        a1, s0, -12
                  sltiu      s6, sp, -458
                  lui        s8, 438519
                  vfadd.vv   v4,v5,v12,v0.t
                  vadc.vvm   v23,v20,v12,v0
                  sltu       ra, a4, t1
                  slti       s3, s11, 836
                  addi       s2, a2, -962
                  vrsub.vi   v24,v15,0,v0.t
                  sra        gp, t4, t4
                  or         s2, s2, s9
                  vfadd.vf   v13,v17,ft8,v0.t
                  andi       ra, a0, -227
                  divu       s2, a5, s2
                  div        t4, s11, t5
                  srl        a1, sp, a2
                  auipc      t0, 761519
                  mulh       t4, t2, a5
                  mulhsu     s3, s6, a6
                  vadc.vvm   v18,v20,v20,v0
                  auipc      s10, 510955
                  lui        a1, 361661
                  add        t1, t1, a1
                  lui        s5, 304195
                  sltu       s6, a6, t0
                  xori       t1, gp, -951
                  auipc      s4, 268843
                  vfsub.vv   v13,v29,v20
                  sra        t3, t0, a7
                  vsaddu.vv  v10,v13,v7
                  vsub.vx    v21,v13,s7,v0.t
                  slli       zero, sp, 13
                  vadc.vxm   v4,v3,s3,v0
                  add        a4, s3, t0
                  vsaddu.vv  v8,v28,v15
                  xori       t3, s10, -787
                  xori       s8, t0, -196
                  add        s4, gp, s1
                  vrsub.vx   v11,v27,a5
                  auipc      a6, 41400
                  vslideup.vx v0,v11,a5
                  vsll.vv    v24,v13,v24,v0.t
                  vslideup.vi v16,v14,0
                  sub        a2, t0, s0
                  div        t3, a2, s1
                  vadc.vxm   v30,v18,s4,v0
                  lui        a6, 230567
                  vslide1up.vx v12,v13,a5
                  mulhsu     t5, a7, a2
                  lui        ra, 458663
                  sra        s9, zero, s5
                  and        gp, t4, s8
                  vadd.vi    v31,v26,0,v0.t
                  vmadd.vx   v30,s3,v21
                  vmulh.vx   v4,v1,a1,v0.t
                  remu       s7, s2, s1
                  vmulh.vx   v31,v14,s11
                  ori        a3, s6, 241
                  sub        a4, s7, s5
                  vfadd.vf   v9,v10,fs9
                  ori        ra, a4, 197
                  or         s8, sp, s7
                  mulhsu     t0, s1, t3
                  vmulh.vx   v10,v1,zero,v0.t
                  vsub.vv    v22,v24,v9
                  vsll.vi    v3,v11,0,v0.t
                  xor        a2, gp, ra
                  sra        s10, s6, zero
                  or         a3, sp, a4
                  srl        gp, t1, a1
                  vmulh.vx   v6,v2,a4,v0.t
                  slti       a4, s1, 783
                  sll        tp, t4, s0
                  vsadd.vx   v29,v9,a6,v0.t
                  remu       a2, s8, a2
                  vslidedown.vi v0,v11,0
                  sll        s9, t2, a3
                  vmadd.vv   v17,v19,v4,v0.t
                  vmulhu.vx  v29,v30,s9,v0.t
                  srl        ra, s5, s5
                  divu       s5, s1, t6
                  sltu       a7, s2, s11
                  vsub.vx    v13,v5,t0,v0.t
                  sub        t2, s4, s0
                  addi       sp, t4, -852
                  vsub.vv    v20,v22,v25,v0.t
                  add        s2, a3, t4
                  mul        a2, s1, s4
                  divu       a7, a6, t2
                  xori       t0, s4, 455
                  vrsub.vx   v27,v30,t2,v0.t
                  and        t3, s10, s8
                  mulhu      a4, s0, a6
                  slli       s4, tp, 9
                  divu       ra, t2, s4
                  sltiu      t3, t3, -516
                  or         a2, t3, s1
                  srl        a6, t6, a4
                  vslidedown.vi v19,v14,0
                  vmadd.vx   v6,s11,v28
                  xor        a2, a3, t6
                  vsadd.vx   v14,v21,s11
                  vslide1up.vx v0,v13,t2
                  sltiu      t2, t5, 773
                  div        s5, s11, s9
                  xor        s8, s2, t3
                  vrsub.vx   v26,v22,t6
                  sltiu      a6, a6, 533
                  vmul.vv    v11,v28,v16,v0.t
                  sltu       a2, ra, t0
                  vslideup.vx v2,v15,t5,v0.t
                  div        t0, a7, gp
                  vmadd.vx   v6,s11,v4,v0.t
                  vadc.vvm   v17,v26,v13,v0
                  sub        a6, s3, s3
                  vslide1up.vx v3,v6,t4
                  vmulhu.vx  v15,v4,s0
                  mulhsu     a1, a7, s10
                  vadc.vvm   v7,v24,v24,v0
                  srl        s6, a7, s11
                  lui        a7, 944751
                  vmul.vx    v8,v9,ra
                  slli       tp, s0, 30
                  srli       t2, s0, 5
                  mulhsu     a7, ra, t3
                  vsub.vv    v22,v27,v20
                  vmul.vv    v4,v9,v0,v0.t
                  remu       s9, a4, s1
                  and        a0, a6, s6
                  srai       zero, s4, 27
                  sub        t3, zero, s3
                  srl        t4, a1, t2
                  addi       a3, a3, 341
                  vmulh.vx   v13,v2,t1
                  vsub.vx    v14,v5,t6,v0.t
                  vsadd.vi   v10,v20,0
                  vmulh.vv   v23,v25,v13
                  andi       s6, ra, -369
                  div        s1, zero, s0
                  vfadd.vf   v4,v6,ft8,v0.t
                  vsadd.vi   v4,v2,0,v0.t
                  mul        a0, s6, ra
                  mulhsu     t5, s4, gp
                  srli       a6, t0, 24
                  or         t3, s9, a3
                  vmulhu.vx  v11,v9,a2
                  mulhsu     s9, sp, a6
                  mul        s5, a6, t4
                  vsadd.vv   v2,v29,v6,v0.t
                  sub        s7, gp, s10
                  vmadd.vv   v24,v1,v10
                  slti       s10, a6, 275
                  lui        s10, 180862
                  vadd.vx    v20,v7,s7,v0.t
                  vfsub.vf   v8,v10,fs6
                  vmulh.vv   v2,v1,v29
                  vadd.vx    v3,v24,a3,v0.t
                  vmadd.vx   v13,zero,v11,v0.t
                  add        t0, a4, s1
                  vrsub.vx   v11,v26,t6
                  xori       s10, t5, -373
                  xor        a7, t5, s8
                  sltiu      zero, s5, 70
                  mulhu      s3, a5, t2
                  vslide1up.vx v17,v2,s3
                  vslide1up.vx v31,v24,sp
                  sltu       a0, s5, ra
                  vmulh.vv   v5,v12,v4
                  sra        t3, s2, gp
                  slti       s6, t1, 113
                  andi       sp, zero, 126
                  slt        s6, a6, sp
                  addi       t1, a5, 585
                  sltu       a3, t6, zero
                  srai       s1, tp, 24
                  divu       ra, s11, t5
                  sra        t5, s7, s6
                  remu       s3, t5, a7
                  auipc      t5, 608678
                  sll        sp, s9, a3
                  sltiu      s8, t4, -191
                  vmul.vx    v11,v5,t1,v0.t
                  vsadd.vx   v23,v6,a3,v0.t
                  add        s0, a2, s11
                  mulh       tp, t1, a0
                  vfadd.vf   v2,v13,fs2,v0.t
                  xor        s8, ra, zero
                  or         a0, a3, a5
                  rem        s0, t4, s3
                  mulh       a6, s4, t2
                  ori        t1, s2, -694
                  or         a0, s8, s8
                  add        zero, s4, a6
                  vsub.vx    v24,v27,ra
                  or         a4, s0, a1
                  remu       s7, s8, t4
                  auipc      s10, 608915
                  vmulhu.vv  v3,v14,v21,v0.t
                  rem        t2, s9, t1
                  mulhu      s7, s7, t3
                  vsll.vx    v12,v0,a0,v0.t
                  mul        s6, s8, sp
                  vmulh.vv   v7,v13,v9
                  addi       a4, s1, -648
                  srli       a7, s11, 29
                  xor        s1, tp, t3
                  mulhsu     t3, a7, s2
                  vadd.vx    v5,v22,tp
                  slti       s4, s4, -656
                  vadd.vx    v23,v12,s8
                  mulhsu     t2, s1, s1
                  srl        s1, a7, s0
                  slli       s7, s10, 0
                  vslide1up.vx v3,v15,a3,v0.t
                  div        s0, a6, tp
                  slti       a7, s10, -757
                  xor        a7, s1, t0
                  srai       t4, a1, 22
                  sltu       a7, s4, s4
                  slt        s10, s3, tp
                  mulhsu     s4, s4, s6
                  vslide1up.vx v6,v1,t4,v0.t
                  srl        a0, sp, s4
                  or         t1, a2, t5
                  mul        s7, t5, a0
                  xori       s1, s6, -255
                  vfadd.vf   v19,v19,fs10,v0.t
                  vsaddu.vv  v26,v31,v6
                  andi       a4, t2, 804
                  vmulhu.vx  v5,v10,ra
                  and        a7, t0, a0
                  vsub.vv    v16,v20,v16,v0.t
                  mulh       s6, s5, t4
                  or         a7, t0, s7
                  vmulhu.vv  v5,v12,v12,v0.t
                  vmadd.vv   v15,v10,v27,v0.t
                  auipc      s2, 940351
                  vadc.vxm   v3,v28,s7,v0
                  mulhu      t1, a0, t6
                  sll        s9, t2, s7
                  vsaddu.vi  v1,v12,0
                  slt        t2, sp, s4
                  or         gp, a4, a6
                  remu       s6, t1, s10
                  xori       s2, s10, -265
                  addi       a7, s2, -251
                  vfadd.vf   v9,v4,ft8
                  srli       a1, s6, 13
                  mul        s9, s1, t2
                  auipc      s6, 805368
                  or         s9, t6, t2
                  slli       a7, s1, 26
                  sub        sp, zero, s7
                  srai       t1, a3, 28
                  divu       s0, t4, sp
                  sub        s10, s2, zero
                  vslide1up.vx v28,v23,s4,v0.t
                  div        a7, a0, zero
                  xori       s0, s8, -126
                  vsadd.vx   v8,v13,s5,v0.t
                  sltu       ra, a6, s6
                  sra        a3, s5, s4
                  mul        t3, s1, s8
                  vadd.vi    v2,v8,0,v0.t
                  vslideup.vx v0,v28,a3
                  vsub.vv    v3,v31,v3
                  vadc.vvm   v18,v19,v28,v0
                  vmadd.vv   v3,v22,v29,v0.t
                  lui        s6, 1033853
                  vsadd.vx   v0,v14,a2
                  sltiu      ra, s11, -770
                  srl        t1, a7, t1
                  ori        s7, s5, 220
                  div        t3, t1, a3
                  vadd.vx    v12,v2,s8
                  auipc      t5, 608044
                  rem        t0, sp, sp
                  slti       sp, a0, -5
                  add        s5, s2, sp
                  vmadd.vv   v0,v24,v9
                  vmul.vv    v26,v5,v9
                  sll        s6, gp, s7
                  xori       s9, zero, -437
                  addi       t0, s10, -198
                  divu       s2, s7, a2
                  vmul.vv    v23,v27,v7,v0.t
                  vslidedown.vi v7,v3,0,v0.t
                  ori        a3, t0, 795
                  or         t0, a0, sp
                  and        sp, t4, gp
                  sltiu      s5, s9, -1023
                  vrsub.vx   v18,v17,s11,v0.t
                  xori       a1, t0, -105
                  slti       s2, s3, 889
                  vsll.vv    v23,v0,v17
                  xori       t1, s9, -703
                  sltiu      s1, a1, -23
                  sltiu      t4, a0, 160
                  mul        s6, s6, ra
                  sltiu      s5, t5, -396
                  sltu       a7, sp, s9
                  mulhu      zero, s10, a4
                  slti       sp, a4, -910
                  divu       s6, tp, t2
                  vmulh.vv   v1,v13,v18,v0.t
                  divu       a1, s8, t5
                  and        a6, s11, gp
                  add        zero, a3, a3
                  remu       a4, t3, s11
                  vfsub.vf   v24,v18,ft4,v0.t
                  vslide1up.vx v26,v6,a1,v0.t
                  div        a0, zero, s6
                  andi       tp, zero, -810
                  vsadd.vv   v12,v10,v7,v0.t
                  vslide1up.vx v19,v3,s9,v0.t
                  sra        s3, s6, a1
                  remu       s6, sp, t5
                  vfadd.vv   v16,v28,v30,v0.t
                  ori        s5, a4, 827
                  addi       s4, a5, -612
                  srai       sp, gp, 30
                  sltiu      a7, s4, 548
                  vmul.vv    v18,v0,v30,v0.t
                  mul        a3, a1, t6
                  sll        s5, s4, ra
                  sub        s4, a6, t0
                  addi       tp, s9, -752
                  lui        tp, 802663
                  remu       s8, t4, t0
                  vsll.vv    v24,v28,v2,v0.t
                  vslideup.vx v20,v3,s6
                  sll        t0, a1, zero
                  mulhu      a6, a1, t0
                  sll        ra, ra, s1
                  xor        a3, t6, a2
                  vadc.vvm   v17,v23,v5,v0
                  and        s0, t1, s7
                  sltiu      a6, tp, 16
                  vmadd.vx   v10,t6,v26
                  mulh       a4, ra, t3
                  ori        s8, s3, 441
                  vfadd.vf   v30,v10,ft4,v0.t
                  srai       s7, s11, 6
                  sltiu      s9, t0, -490
                  slt        a2, t2, ra
                  and        s6, s10, s2
                  vrsub.vi   v23,v2,0
                  add        s4, t1, s7
                  slli       t2, s7, 8
                  vsadd.vv   v13,v20,v21
                  vsadd.vx   v0,v11,tp
                  vmul.vx    v19,v27,tp
                  vslide1up.vx v26,v18,s6
                  vslideup.vi v19,v9,0
                  sub        a4, s8, s8
                  vsadd.vi   v19,v31,0
                  vfadd.vf   v15,v20,fs8
                  remu       s5, s10, a5
                  vmulhu.vv  v29,v9,v15
                  auipc      t3, 648225
                  andi       s8, gp, 180
                  div        tp, t1, s7
                  xor        a0, t2, t6
                  vrsub.vx   v16,v20,s9,v0.t
                  vsub.vv    v12,v25,v13,v0.t
                  mul        a7, s8, s5
                  lui        t3, 980993
                  andi       s3, s2, -619
                  ori        a1, t5, -620
                  mulhu      a0, s8, s2
                  vmulh.vv   v29,v4,v4,v0.t
                  sltu       tp, a4, t1
                  mulh       s5, s7, a4
                  sll        s1, s6, s3
                  vrsub.vx   v13,v6,a5
                  srai       t2, s5, 10
                  ori        sp, s9, -443
                  vmul.vx    v28,v21,s3
                  mulh       s10, a5, ra
                  vsaddu.vv  v25,v22,v12
                  xori       t0, s5, 449
                  mulh       s3, a7, tp
                  auipc      s5, 769304
                  divu       t3, t2, s9
                  vmul.vv    v15,v16,v5
                  mul        ra, a0, t5
                  remu       gp, sp, t4
                  remu       a6, a2, a4
                  sll        a6, s2, sp
                  mulh       tp, t5, s3
                  sll        s6, s4, t6
                  sra        zero, a4, t6
                  or         s10, s5, zero
                  sltu       s3, a0, s5
                  slti       ra, s9, 721
                  andi       t4, t4, -407
                  remu       ra, t1, a2
                  srli       s1, s11, 2
                  sub        s5, zero, s1
                  slt        s2, zero, t6
                  vslidedown.vi v30,v12,0,v0.t
                  vrsub.vx   v2,v17,a1,v0.t
                  remu       t0, t2, s11
                  and        s10, t3, a5
                  mulhu      t3, t5, t2
                  lui        s10, 857705
                  sltu       s9, s4, a0
                  sltiu      a4, zero, -513
                  vrsub.vx   v5,v27,s7,v0.t
                  vsub.vv    v27,v18,v19
                  sltiu      zero, sp, 295
                  div        s4, a2, s10
                  sltiu      s9, s8, 554
                  auipc      s9, 48513
                  vmulhu.vv  v14,v17,v12,v0.t
                  or         s1, a0, s4
                  vslidedown.vx v18,v21,sp
                  lui        tp, 256894
                  slti       tp, a6, 331
                  sra        a0, a1, t6
                  vslide1up.vx v18,v11,t1
                  vmul.vx    v25,v29,s3
                  mulhsu     s2, a0, s0
                  vsaddu.vx  v26,v14,s11,v0.t
                  sltiu      t0, tp, -695
                  vfsub.vv   v15,v26,v24
                  remu       s2, a2, s0
                  vsll.vv    v22,v20,v10,v0.t
                  auipc      t5, 1034597
                  lui        ra, 176657
                  sltu       a1, t1, s5
                  mulhsu     sp, s5, s2
                  lui        a4, 331787
                  slt        t4, t2, sp
                  remu       a0, s1, s11
                  and        sp, s4, t3
                  addi       sp, t0, 536
                  sra        s10, a2, t5
                  vsll.vi    v24,v5,0,v0.t
                  mul        s5, s7, a3
                  xori       t2, a2, -473
                  sll        s5, t4, zero
                  vslide1up.vx v15,v22,zero,v0.t
                  vslideup.vx v22,v11,a5,v0.t
                  rem        a1, s11, s10
                  vslide1up.vx v9,v29,t0,v0.t
                  vmulhu.vx  v14,v24,a6,v0.t
                  sll        a1, s5, s2
                  andi       s4, t6, 923
                  divu       s5, s10, t2
                  vmul.vv    v5,v0,v24,v0.t
                  vsaddu.vi  v11,v10,0
                  vsaddu.vv  v30,v18,v29,v0.t
                  vmul.vx    v6,v19,t0,v0.t
                  sll        s1, tp, t0
                  add        zero, s8, a1
                  div        gp, t2, s6
                  remu       sp, a3, a3
                  andi       zero, a2, -398
                  srai       s6, t0, 21
                  xori       t4, s0, 246
                  vfsub.vv   v27,v8,v15
                  vfsub.vf   v28,v5,ft9,v0.t
                  vsll.vi    v19,v7,0,v0.t
                  lui        a6, 700910
                  sltu       t1, s7, s11
                  vfsub.vv   v20,v23,v4,v0.t
                  mulhsu     s5, a2, t2
                  slli       t0, a6, 16
                  slli       t4, a0, 10
                  vsadd.vv   v5,v11,v24
                  slt        ra, t0, s2
                  vslidedown.vi v15,v11,0,v0.t
                  vmulh.vx   v11,v6,ra,v0.t
                  vmadd.vv   v2,v2,v13
                  vsaddu.vv  v28,v30,v21
                  xori       gp, t4, 52
                  sub        t3, t5, a0
                  vfsub.vv   v17,v31,v23
                  slt        t2, s9, sp
                  sub        t5, a1, ra
                  mul        a2, a4, s7
                  srli       s9, a3, 12
                  lui        t0, 714281
                  mulhsu     s2, s0, t0
                  vmul.vv    v5,v21,v18,v0.t
                  ori        a3, a0, 657
                  addi       s5, t0, -674
                  add        a2, ra, t5
                  slli       gp, a6, 1
                  div        t0, s11, tp
                  vmul.vx    v22,v9,s9,v0.t
                  ori        s6, t1, 87
                  rem        tp, t5, s4
                  rem        s10, s10, s0
                  xor        t2, t6, zero
                  vmulh.vx   v20,v21,t5,v0.t
                  or         s7, t4, a1
                  vadc.vxm   v2,v26,s2,v0
                  vmul.vx    v19,v22,t5,v0.t
                  remu       t0, a4, a6
                  vadc.vxm   v20,v19,t0,v0
                  sltiu      a6, ra, -321
                  vrsub.vx   v12,v18,tp
                  vsub.vv    v13,v25,v16
                  vmul.vv    v16,v16,v21,v0.t
                  sltu       s9, t0, a2
                  vadd.vi    v31,v26,0
                  srl        t1, s5, gp
                  lui        s9, 557328
                  or         s6, t6, s10
                  mulh       a4, tp, s1
                  rem        s3, a7, a5
                  vsub.vx    v10,v24,a0,v0.t
                  slti       s4, t0, 538
                  rem        s7, t6, s1
                  div        tp, t5, gp
                  mulhsu     s6, s11, a2
                  vmulhu.vx  v19,v22,a0,v0.t
                  xor        s10, s2, s2
                  sll        a0, a7, s10
                  vmul.vx    v17,v29,t3
                  vmul.vx    v6,v24,a4
                  vsaddu.vx  v17,v4,t2
                  slti       s6, sp, 88
                  vadc.vxm   v22,v12,s1,v0
                  xori       t3, t3, 145
                  vslide1up.vx v18,v25,a7,v0.t
                  vfsub.vf   v19,v3,fa1
                  vslideup.vx v13,v11,t3,v0.t
                  vsub.vv    v5,v12,v22,v0.t
                  mulhu      a1, a5, s3
                  vsll.vv    v23,v16,v29,v0.t
                  or         t5, t0, ra
                  or         t1, a6, t6
                  slli       s3, t2, 1
                  add        s2, s0, s7
                  xor        gp, s7, s7
                  vsll.vi    v11,v18,0
                  vsadd.vi   v12,v31,0,v0.t
                  add        s5, sp, a2
                  vslidedown.vx v24,v25,ra
                  vfadd.vf   v9,v25,fa1
                  vmulhu.vx  v22,v14,a7
                  vsub.vv    v23,v5,v18
                  srl        tp, a6, sp
                  vadd.vv    v13,v14,v17
                  mulhsu     s1, a6, t5
                  srli       a7, t2, 22
                  sra        t1, tp, a6
                  mulhsu     t4, a4, t0
                  mulhsu     zero, s0, ra
                  div        s2, zero, t6
                  mul        t5, s2, s4
                  xor        ra, s0, t1
                  sub        s8, s3, s4
                  sub        s0, s7, zero
                  xor        a4, zero, a7
                  vmul.vx    v18,v4,s2
                  sll        zero, t5, a7
                  vadd.vx    v0,v27,t2
                  vslideup.vi v14,v12,0,v0.t
                  slli       s4, t4, 2
                  xori       sp, t3, -359
                  remu       t0, tp, t0
                  vslidedown.vi v9,v0,0
                  rem        a3, s11, s8
                  vsaddu.vv  v12,v8,v10,v0.t
                  slti       s4, ra, 971
                  vmulhu.vx  v20,v7,s6,v0.t
                  srai       ra, t5, 15
                  vsadd.vi   v11,v15,0
                  ori        s5, t1, -468
                  vrsub.vi   v15,v16,0,v0.t
                  srl        ra, a6, s2
                  mulhu      t5, t2, ra
                  vsll.vv    v12,v7,v26
                  sltu       s7, s5, a7
                  sltiu      ra, s8, 616
                  vmulhu.vx  v22,v29,s8,v0.t
                  slti       t5, t4, 549
                  add        s2, tp, a0
                  vmul.vv    v27,v31,v1
                  vadc.vxm   v29,v1,a6,v0
                  mulhu      t5, a2, zero
                  vsadd.vi   v20,v25,0
                  slt        t1, ra, a4
                  vmulh.vx   v12,v13,s5,v0.t
                  srl        zero, a2, a6
                  and        sp, tp, a6
                  vmul.vx    v27,v4,t4,v0.t
                  slti       s8, s8, -25
                  vrsub.vx   v19,v7,s11
                  mulhu      t1, a2, a0
                  ori        s4, t3, -666
                  vmul.vx    v25,v28,t4,v0.t
                  or         a2, s8, gp
                  mulhsu     s1, sp, gp
                  addi       t1, s8, 632
                  vrsub.vi   v8,v4,0
                  mul        s0, a1, t1
                  sra        a6, a6, tp
                  vsll.vi    v24,v15,0
                  vmadd.vx   v2,a6,v14
                  add        t1, s2, t1
                  slli       a6, s4, 22
                  mul        s8, t1, t2
                  slt        t1, gp, t0
                  auipc      a6, 837945
                  mulh       a1, a6, zero
                  srli       s6, a7, 27
                  sltu       t3, a2, a2
                  slti       s4, s10, 133
                  rem        s3, a6, t0
                  mulhu      a7, a7, s11
                  vslidedown.vx v27,v24,sp
                  slti       s7, a7, -736
                  divu       s9, s2, s8
                  vslideup.vx v11,v6,s8
                  slti       s3, s1, 446
                  vadd.vv    v11,v12,v12
                  slti       a0, t4, 451
                  vsub.vv    v31,v22,v28
                  vsub.vx    v23,v3,a5,v0.t
                  mulh       t4, s7, a0
                  vmadd.vx   v16,a6,v15
                  add        t1, a6, t2
                  srai       t5, s10, 20
                  mulh       a2, t6, s5
                  xor        t1, s1, t0
                  mulhu      s3, gp, a5
                  remu       s7, a1, s10
                  vsub.vv    v0,v10,v0
                  sra        tp, t2, s9
                  vadc.vvm   v11,v15,v7,v0
                  vsub.vv    v5,v6,v22,v0.t
                  mul        a1, t6, s6
                  vslide1up.vx v29,v22,s3,v0.t
                  vadc.vim   v8,v23,0,v0
                  and        s5, s11, s2
                  div        ra, s1, s9
                  srli       a2, a0, 20
                  vslidedown.vi v9,v18,0,v0.t
                  vadd.vv    v17,v21,v7
                  addi       s9, s2, 573
                  vrsub.vi   v2,v29,0,v0.t
                  vslideup.vi v21,v31,0
                  vsll.vx    v16,v20,s6
                  vslide1up.vx v19,v21,s10
                  slli       t2, a6, 20
                  vsll.vi    v21,v16,0
                  auipc      zero, 260874
                  auipc      t2, 164533
                  add        ra, sp, s6
                  vrsub.vi   v1,v9,0,v0.t
                  vslide1up.vx v26,v31,a6
                  vmadd.vv   v15,v2,v14,v0.t
                  lui        ra, 136312
                  slti       sp, gp, -465
                  vfsub.vf   v15,v19,fa6
                  vfsub.vv   v27,v18,v17,v0.t
                  sra        s3, a1, t1
                  sltiu      zero, t1, 977
                  xori       s8, s3, -554
                  divu       a1, s2, sp
                  sll        s7, a7, s4
                  vslide1up.vx v15,v13,a6,v0.t
                  xor        a2, s7, a4
                  and        t2, a3, s3
                  lui        s8, 474724
                  add        a7, sp, s6
                  vsadd.vx   v20,v8,a2,v0.t
                  mulhu      s10, ra, s7
                  addi       s9, a6, -147
                  vfsub.vf   v24,v17,ft1
                  andi       s2, s10, -24
                  vsub.vv    v9,v21,v5,v0.t
                  vmulh.vx   v15,v12,s0
                  sltu       s9, s10, s11
                  sub        s4, t0, a1
                  rem        s10, a1, a2
                  vslide1up.vx v4,v12,ra,v0.t
                  sll        a6, a1, s3
                  sltiu      a4, sp, -642
                  sltiu      tp, s5, 734
                  vadd.vi    v3,v6,0
                  sll        gp, s2, s9
                  vadc.vxm   v27,v9,s9,v0
                  or         a3, t1, gp
                  sltu       s10, s0, t1
                  vrsub.vi   v23,v23,0,v0.t
                  slt        a3, s4, tp
                  vslidedown.vi v20,v1,0,v0.t
                  vfsub.vf   v13,v20,fs0
                  vsadd.vx   v28,v10,s8
                  xor        s8, s1, s1
                  vslidedown.vx v13,v5,tp
                  vrsub.vx   v14,v30,s9
                  slli       s4, sp, 22
                  vsub.vx    v18,v17,s6
                  addi       s10, s6, -68
                  sra        a1, t0, ra
                  lui        a7, 682838
                  mulhsu     tp, a2, s1
                  vmadd.vv   v12,v2,v6,v0.t
                  vsaddu.vx  v2,v20,gp
                  lui        sp, 730499
                  lui        a1, 98509
                  ori        s9, ra, -191
                  ori        a3, s4, 474
                  and        a2, a6, s3
                  or         s8, s2, s6
                  slli       s8, s9, 3
                  slt        s5, s5, a5
                  slt        t5, a1, s4
                  rem        gp, s8, s10
                  xori       s8, t3, 504
                  sra        sp, a2, t0
                  addi       s9, s6, -426
                  and        s4, s5, s11
                  sra        s3, a7, s3
                  vsub.vv    v3,v4,v16,v0.t
                  vmadd.vv   v15,v14,v3,v0.t
                  sltiu      s3, s3, 255
                  mulhu      s4, a3, s8
                  vmulh.vv   v15,v21,v27
                  sltiu      ra, a0, 852
                  remu       s10, sp, a3
                  vrsub.vx   v27,v24,s4,v0.t
                  vmulhu.vv  v10,v11,v22,v0.t
                  srai       s9, t0, 10
                  vmulh.vx   v28,v18,a0,v0.t
                  add        a2, s10, s2
                  ori        a0, s9, 80
                  vslideup.vi v18,v23,0,v0.t
                  div        s10, a3, a4
                  vmulhu.vv  v31,v27,v2
                  vfadd.vf   v16,v13,fs9
                  vsub.vv    v23,v15,v20,v0.t
                  vsaddu.vi  v14,v26,0,v0.t
                  vslideup.vi v0,v2,0
                  rem        a4, t5, a3
                  vadc.vxm   v28,v3,gp,v0
                  vsadd.vi   v23,v9,0,v0.t
                  and        t5, s3, s1
                  vfadd.vv   v12,v27,v14,v0.t
                  vsll.vv    v11,v26,v0
                  vslidedown.vi v29,v8,0
                  ori        t0, a5, -532
                  vslidedown.vi v4,v5,0
                  sub        s1, a1, a7
                  lui        a2, 311628
                  mulhu      t5, t2, s5
                  mulh       s8, sp, s8
                  sll        s2, sp, a4
                  vrsub.vx   v20,v10,t6,v0.t
                  auipc      s6, 106635
                  ori        s10, s3, 905
                  add        s9, t4, t4
                  xori       a3, s11, 822
                  auipc      t3, 735862
                  mulh       tp, s2, s5
                  slt        a3, a3, t0
                  addi       a3, s9, -353
                  sltu       a0, t6, tp
                  sll        s4, a1, gp
                  add        s7, t3, a4
                  sll        t5, t5, t6
                  rem        a7, sp, t5
                  rem        ra, a7, s8
                  or         gp, s9, sp
                  xor        a7, sp, s7
                  div        s5, zero, gp
                  vmadd.vv   v31,v16,v27,v0.t
                  sltu       a6, t3, ra
                  vsaddu.vv  v1,v7,v23,v0.t
                  srl        gp, a5, s10
                  xor        s10, s9, sp
                  vslideup.vi v21,v30,0
                  slti       s8, s6, -378
                  vslideup.vi v25,v17,0
                  sltiu      a3, s10, -222
                  mulhu      t4, s4, sp
                  vfsub.vv   v14,v7,v7,v0.t
                  ori        tp, t1, -991
                  xor        a6, s11, s6
                  andi       a2, s5, 691
                  slli       a1, a7, 18
                  vsaddu.vx  v15,v2,s9
                  sra        t3, zero, zero
                  srl        t1, ra, s6
                  mulhu      t4, a6, t3
                  vmulhu.vx  v3,v22,t6,v0.t
                  vmulhu.vv  v4,v2,v4
                  sra        sp, t0, sp
                  mulh       sp, s11, sp
                  vfsub.vf   v17,v3,fs10,v0.t
                  slt        s7, s4, t6
                  vmulhu.vx  v1,v0,t6
                  slli       a6, t3, 11
                  divu       ra, sp, t1
                  vsub.vv    v26,v5,v4,v0.t
                  vrsub.vx   v13,v31,s6
                  vslidedown.vx v29,v12,t1
                  mul        t5, a2, a7
                  ori        a4, a3, -57
                  slti       s7, s6, -851
                  vfadd.vf   v11,v12,ft3,v0.t
                  vslideup.vx v3,v23,a4
                  slli       t1, s11, 10
                  andi       s9, sp, -101
                  sltiu      t1, a5, 228
                  div        t4, s9, t0
                  vfadd.vf   v24,v23,fs5
                  sra        s0, s10, gp
                  slt        t5, s5, gp
                  rem        s3, zero, ra
                  mulhsu     s4, s0, s7
                  vsaddu.vx  v31,v4,t5,v0.t
                  vadc.vxm   v8,v12,tp,v0
                  add        t3, gp, a6
                  srai       s1, t2, 14
                  or         t1, a4, a1
                  divu       s1, ra, a7
                  vadc.vim   v16,v13,0,v0
                  auipc      a1, 522971
                  rem        t2, s2, s5
                  auipc      s1, 112301
                  vfadd.vf   v11,v24,fs4
                  vmulh.vx   v11,v5,t6,v0.t
                  vfsub.vf   v24,v15,fs1
                  vsub.vv    v10,v14,v11
                  mulhu      a3, a5, a1
                  mulh       s1, t2, a1
                  slt        a3, sp, s2
                  vmulh.vv   v1,v18,v16
                  vslidedown.vx v20,v21,s4
                  vslide1up.vx v15,v14,s4,v0.t
                  vsll.vx    v6,v24,zero,v0.t
                  sll        t0, s9, s4
                  vmadd.vx   v23,t2,v6,v0.t
                  addi       s1, gp, -520
                  vfadd.vv   v25,v4,v21
                  vsaddu.vi  v2,v9,0,v0.t
                  divu       a1, gp, s11
                  vslide1up.vx v12,v25,s1
                  slli       t2, s0, 14
                  xori       s7, a5, 320
                  slti       a4, a5, 786
                  vmulhu.vx  v25,v24,s9,v0.t
                  rem        t5, a3, t2
                  vfadd.vv   v18,v14,v19
                  sltiu      ra, sp, 867
                  srl        t5, gp, s7
                  lui        sp, 433295
                  divu       t5, zero, t0
                  xori       t5, t5, 478
                  vsub.vx    v27,v0,s5
                  add        s4, a0, s10
                  slti       s0, ra, -279
                  sub        t4, s2, s0
                  sltiu      a7, t3, -862
                  srai       s4, s11, 26
                  mulhsu     a2, s3, a5
                  vfsub.vv   v4,v1,v17
                  div        s9, s3, s7
                  sra        a6, s3, t5
                  vadc.vvm   v26,v2,v3,v0
                  sub        t5, s11, t1
                  divu       sp, t0, s5
                  vsadd.vi   v28,v23,0,v0.t
                  lui        sp, 718882
                  mulhsu     s6, s11, s7
                  vslideup.vi v19,v15,0,v0.t
                  slti       s6, a7, -134
                  vslideup.vx v18,v11,a7,v0.t
                  mulhsu     t5, a0, s5
                  and        s0, s5, s5
                  srli       s9, s10, 18
                  add        ra, zero, s7
                  sra        s8, a2, s6
                  sll        a2, a7, a7
                  remu       s10, a2, s6
                  srai       s7, s2, 1
                  and        s0, s3, s8
                  add        ra, s10, ra
                  vrsub.vx   v5,v28,s7
                  mulhu      s4, zero, a5
                  divu       sp, s7, sp
                  vsll.vx    v29,v22,a1,v0.t
                  auipc      s7, 190248
                  vmulhu.vv  v26,v3,v2,v0.t
                  vmadd.vx   v28,s5,v26,v0.t
                  slt        s5, s6, sp
                  srl        s0, sp, zero
                  vfsub.vv   v4,v15,v5
                  mulhsu     gp, tp, s2
                  vmul.vx    v13,v31,t3
                  sra        t4, s10, s2
                  sra        sp, t6, t3
                  vadd.vx    v13,v9,zero,v0.t
                  vmul.vx    v7,v24,tp,v0.t
                  mulhu      t5, s11, ra
                  vslideup.vx v27,v29,tp
                  vadd.vv    v12,v8,v9
                  slt        a7, sp, s6
                  sltu       gp, s5, t1
                  vmadd.vx   v8,s1,v10,v0.t
                  srl        s9, s9, t0
                  vmul.vx    v5,v7,s3,v0.t
                  sra        t0, t3, a7
                  vrsub.vx   v12,v12,a6
                  sll        t0, a4, s7
                  vadc.vim   v19,v16,0,v0
                  sra        a7, s1, a1
                  vslideup.vi v21,v25,0
                  div        a6, ra, s3
                  sltiu      s8, t5, 315
                  vmadd.vv   v5,v29,v20,v0.t
                  vmul.vv    v16,v19,v22,v0.t
                  vslidedown.vi v7,v21,0
                  and        t2, s6, s1
                  divu       s0, s4, s1
                  vmul.vv    v14,v14,v12,v0.t
                  vfsub.vf   v8,v27,fa0,v0.t
                  sltiu      t3, a3, 883
                  sub        t4, s4, s4
                  vadd.vi    v26,v20,0
                  slti       a4, a6, 255
                  vrsub.vx   v29,v28,t4,v0.t
                  srl        gp, t2, a7
                  ori        t2, s2, 406
                  mul        a3, a2, a3
                  or         t1, s10, a1
                  slti       s2, s10, 810
                  vsaddu.vx  v16,v3,a3
                  divu       a7, s10, t0
                  slli       a6, s8, 4
                  and        a2, a3, s7
                  sra        s4, t6, t1
                  vsll.vi    v8,v2,0
                  srai       a1, ra, 28
                  xor        s7, s2, a1
                  and        t4, t6, s3
                  vfsub.vf   v23,v3,fs9
                  mul        t0, s2, ra
                  vmul.vv    v27,v2,v6
                  remu       s9, sp, t4
                  mulhu      t4, s2, t2
                  mul        s7, t1, s9
                  add        t5, a1, a5
                  lui        t3, 454610
                  vsub.vx    v17,v28,a2
                  sra        s0, ra, s8
                  srl        s3, t6, gp
                  vadd.vv    v25,v10,v20
                  sltiu      t0, a0, -104
                  auipc      s5, 879135
                  vsub.vx    v11,v28,s2
                  slli       s5, s10, 24
                  div        gp, t3, s1
                  vsub.vv    v19,v21,v17
                  addi       t1, sp, 230
                  vfadd.vf   v23,v11,fs10,v0.t
                  vmadd.vv   v8,v10,v14
                  auipc      s2, 500030
                  sra        s8, a2, t0
                  srl        s1, a7, s9
                  div        s1, s4, a3
                  srli       t1, t6, 9
                  mulhsu     a2, s4, ra
                  sra        t5, gp, t2
                  div        s8, s7, s2
                  sltu       a0, a6, s4
                  vsadd.vv   v11,v6,v13,v0.t
                  auipc      sp, 992074
                  vslidedown.vi v21,v27,0,v0.t
                  sll        a0, s3, s1
                  div        a2, tp, tp
                  xor        t0, t6, s2
                  mulhu      a6, t2, a7
                  srli       s0, t6, 7
                  divu       s4, s11, s0
                  sra        s10, t2, t4
                  vmulh.vv   v19,v30,v11,v0.t
                  sra        s3, sp, t1
                  vadc.vxm   v25,v18,s11,v0
                  vadc.vim   v23,v27,0,v0
                  add        s2, s4, zero
                  sltu       a1, s5, a7
                  vsadd.vx   v24,v27,a3
                  vsadd.vi   v29,v2,0,v0.t
                  or         gp, s1, s2
                  mul        a6, s8, s4
                  vslidedown.vx v14,v21,s7,v0.t
                  vmulhu.vv  v29,v19,v14,v0.t
                  div        ra, a0, t5
                  divu       a6, t2, s7
                  vslideup.vx v16,v14,t6
                  vadd.vi    v22,v16,0
                  xor        a1, s2, zero
                  andi       zero, gp, -1010
                  srai       s6, s2, 29
                  vsub.vv    v17,v19,v19,v0.t
                  auipc      a7, 814003
                  vsll.vi    v9,v19,0
                  vslideup.vx v1,v30,t4
                  and        s5, s2, t5
                  vadd.vv    v9,v11,v20,v0.t
                  vsaddu.vx  v0,v20,gp
                  vmadd.vx   v8,gp,v15,v0.t
                  ori        t3, s3, 667
                  sra        s5, s3, s6
                  auipc      t3, 624805
                  vrsub.vi   v30,v28,0,v0.t
                  vmul.vv    v20,v22,v28
                  div        a7, tp, a3
                  sltiu      s4, a2, -721
                  xori       tp, t0, -688
                  xori       t2, a3, 713
                  auipc      a0, 523711
                  slt        s6, t6, t2
                  vmulhu.vx  v31,v29,s1
                  vslideup.vi v2,v6,0,v0.t
                  xori       ra, s3, 562
                  vsaddu.vx  v12,v31,a1
                  sltu       s10, t6, t0
                  vsaddu.vx  v18,v0,s1,v0.t
                  vfadd.vf   v17,v26,fa1,v0.t
                  vsaddu.vx  v5,v21,a2,v0.t
                  ori        t2, t6, -716
                  remu       s3, a6, a4
                  srli       a1, s5, 3
                  vsadd.vi   v10,v9,0
                  mulhsu     a0, t5, zero
                  ori        gp, zero, 885
                  rem        sp, s7, sp
                  sltiu      zero, s2, 659
                  and        a7, s3, a7
                  sltiu      t1, s3, 579
                  auipc      a4, 852826
                  mul        s9, s4, t2
                  sltiu      ra, t5, -320
                  vadd.vx    v13,v29,s7,v0.t
                  rem        a6, a1, s10
                  rem        s8, tp, t0
                  vmadd.vx   v28,a7,v30,v0.t
                  add        t2, t3, s8
                  srai       a0, t3, 10
                  sub        s4, t2, a1
                  srai       s8, a2, 20
                  srai       s1, s2, 1
                  mulhsu     t4, a7, s0
                  vmulh.vv   v3,v23,v30
                  vfsub.vv   v20,v16,v12
                  vmulhu.vv  v4,v5,v13,v0.t
                  ori        tp, t1, -346
                  vsll.vx    v12,v23,s9,v0.t
                  vmadd.vx   v18,t6,v20,v0.t
                  vadd.vv    v4,v11,v8
                  srli       a3, s0, 8
                  vsadd.vx   v2,v28,s11,v0.t
                  remu       a2, a2, t1
                  vsub.vv    v28,v23,v12,v0.t
                  vmul.vv    v8,v9,v14
                  ori        a3, s0, 635
                  vslidedown.vi v11,v10,0,v0.t
                  sub        s2, a0, a3
                  sltiu      s3, s8, -802
                  vmul.vv    v6,v25,v5,v0.t
                  srli       s10, s6, 12
                  divu       s9, a5, a3
                  slti       t1, a1, 712
                  mul        s1, sp, a6
                  mulhsu     s6, s9, a2
                  mulh       t4, a0, gp
                  andi       a3, a5, -780
                  add        a6, s9, tp
                  divu       ra, t4, t5
                  or         a2, s4, a4
                  addi       s2, t0, 45
                  remu       a0, a3, t0
                  vfadd.vv   v31,v25,v17,v0.t
                  sra        a4, s1, s0
                  srl        a0, s11, s0
                  mul        a3, s8, zero
                  sll        s1, a4, t2
                  vfsub.vv   v8,v29,v12,v0.t
                  auipc      t5, 21917
                  divu       s9, t6, t6
                  or         a7, t3, a0
                  rem        gp, t3, t1
                  div        s7, s5, a1
                  ori        a7, tp, 177
                  vmulhu.vv  v31,v2,v21,v0.t
                  vmadd.vx   v21,a3,v18,v0.t
                  srli       t3, s3, 26
                  ori        a0, s6, 731
                  slli       s8, ra, 16
                  sub        a7, s2, s1
                  auipc      tp, 389770
                  mulh       s9, a6, a2
                  add        t2, t3, a1
                  lui        sp, 834291
                  vmul.vx    v10,v2,gp
                  andi       a2, s2, 703
                  auipc      t3, 784676
                  vslide1up.vx v28,v25,sp
                  and        s2, s1, t1
                  vmadd.vv   v30,v29,v26,v0.t
                  mul        a3, gp, t6
                  vfsub.vf   v11,v28,ft11,v0.t
                  remu       s10, s6, s10
                  mulhsu     s3, s11, sp
                  srli       zero, t2, 23
                  vadd.vx    v25,v0,a7
                  vsadd.vv   v1,v19,v16,v0.t
                  vrsub.vi   v12,v14,0,v0.t
                  and        s4, s6, s8
                  vsadd.vv   v8,v25,v23,v0.t
                  vfadd.vf   v17,v25,fs4,v0.t
                  vadd.vv    v8,v19,v29
                  remu       a6, t6, s10
                  vadd.vi    v29,v3,0,v0.t
                  srai       s9, s8, 25
                  slli       a0, s1, 10
                  slt        s8, t5, s11
                  vmul.vv    v2,v0,v29,v0.t
                  auipc      zero, 609462
                  vmulhu.vx  v27,v24,a6,v0.t
                  vslideup.vx v3,v16,a0
                  mulhu      t4, t6, s7
                  and        s6, t3, gp
                  xori       s9, t1, 189
                  vsaddu.vi  v12,v31,0
                  srli       a4, a6, 29
                  srli       a1, s5, 12
                  xori       s10, s11, -607
                  remu       a3, t6, sp
                  lui        s3, 66139
                  and        a6, s1, ra
                  slti       t1, s1, -1016
                  sltu       a3, t6, a0
                  mulhu      s3, tp, a1
                  srai       s3, t4, 18
                  divu       s8, a4, s1
                  vmulhu.vx  v3,v13,t2,v0.t
                  xor        a4, s5, s1
                  vrsub.vx   v22,v1,a5
                  srai       a1, a5, 14
                  lui        tp, 529457
                  sra        zero, s9, s4
                  vmadd.vx   v25,s9,v20
                  vslideup.vx v0,v14,s2
                  mulh       s2, a0, s2
                  divu       a1, tp, s1
                  auipc      t4, 323825
                  xor        s1, t0, a5
                  slli       a0, s11, 14
                  srai       s7, s10, 18
                  vmadd.vv   v12,v14,v13,v0.t
                  vslidedown.vi v24,v26,0,v0.t
                  or         gp, sp, tp
                  mulh       a2, a0, a3
                  sll        s0, a3, tp
                  mulhsu     a3, a7, s7
                  mul        tp, gp, t5
                  addi       s4, a4, 103
                  addi       s5, s7, -140
                  auipc      a1, 347622
                  sll        s0, zero, tp
                  mulhsu     sp, a4, s2
                  vsaddu.vi  v19,v3,0
                  vslideup.vi v16,v29,0
                  mulhsu     gp, t1, s2
                  vsaddu.vx  v31,v5,s10,v0.t
                  vmul.vx    v29,v26,s5,v0.t
                  sltiu      a1, a1, 83
                  lui        gp, 962323
                  addi       zero, ra, -879
                  mulh       gp, a2, zero
                  vfadd.vf   v4,v12,fa3,v0.t
                  vadc.vxm   v28,v6,s9,v0
                  vsub.vv    v25,v2,v14
                  add        s10, s1, s11
                  sub        s10, a7, s8
                  vmul.vv    v24,v4,v11,v0.t
                  mulh       gp, a4, t5
                  vmul.vv    v8,v9,v13
                  sll        t2, s5, a3
                  slli       a4, s0, 1
                  remu       s1, zero, gp
                  vsadd.vx   v19,v22,a6
                  lui        a0, 149329
                  vslide1up.vx v4,v16,t4,v0.t
                  sub        a7, a6, s4
                  and        s3, s10, ra
                  slt        a3, a7, a5
                  vmulh.vv   v10,v27,v28,v0.t
                  sra        s2, gp, sp
                  mulh       s4, a2, s6
                  xori       t4, t6, -698
                  srli       a2, t5, 17
                  sra        t3, a2, t2
                  and        s1, s1, a3
                  vadc.vxm   v8,v21,s4,v0
                  sltiu      s8, t1, -854
                  lui        s1, 416244
                  addi       s4, a2, 956
                  vadc.vvm   v19,v10,v0,v0
                  vadc.vxm   v21,v24,t4,v0
                  and        tp, s11, a0
                  vmulh.vv   v13,v16,v7,v0.t
                  and        sp, a1, s7
                  vsub.vv    v18,v24,v12
                  vmadd.vx   v13,a4,v5,v0.t
                  srli       a0, t5, 14
                  vadd.vx    v18,v12,t3
                  srl        a0, t1, s11
                  or         gp, s4, s9
                  lui        s1, 10727
                  and        t4, a0, a6
                  vslidedown.vi v11,v6,0
                  slt        a4, s6, zero
                  xor        s9, s9, t5
                  srli       a2, s0, 17
                  add        a1, s6, ra
                  xori       s7, t2, 706
                  sra        s10, s6, t1
                  vfsub.vv   v24,v23,v15
                  sltiu      s6, t4, 224
                  srai       t3, a5, 9
                  vsaddu.vx  v16,v29,a4,v0.t
                  xori       gp, ra, -216
                  mulhsu     ra, s9, tp
                  vrsub.vx   v0,v31,s1
                  sltiu      a2, t6, -304
                  andi       a3, t2, 512
                  vrsub.vi   v16,v3,0,v0.t
                  slli       a3, zero, 12
                  vslide1up.vx v2,v5,sp,v0.t
                  mul        s3, zero, a6
                  vslide1up.vx v10,v1,a4
                  vslideup.vi v10,v20,0
                  vfsub.vf   v8,v6,ft6
                  vmul.vx    v16,v30,s0
                  div        s3, t1, t1
                  vsub.vx    v25,v5,t0,v0.t
                  xor        s0, t0, s4
                  vslideup.vi v11,v1,0
                  vsub.vx    v6,v14,s4,v0.t
                  vfsub.vf   v0,v19,fs9
                  auipc      s4, 133755
                  sll        a6, a6, t5
                  srli       a0, s3, 0
                  vsaddu.vv  v5,v6,v24,v0.t
                  auipc      t1, 949509
                  vmulh.vx   v20,v25,t2
                  mulhu      s2, s6, a5
                  vsll.vx    v17,v22,s0,v0.t
                  divu       a7, a5, gp
                  sltu       a6, ra, s2
                  addi       a2, s10, 360
                  sra        a6, sp, a0
                  divu       s10, a7, t0
                  srl        a0, ra, s7
                  sub        gp, s2, a0
                  sltiu      gp, t1, -449
                  andi       s10, s8, 661
                  or         s1, s0, sp
                  mulhu      a6, t0, s1
                  vsll.vi    v23,v10,0
                  vadd.vv    v20,v18,v23,v0.t
                  slt        t2, t4, t4
                  vsub.vv    v14,v23,v20
                  or         s1, a1, a3
                  and        t4, t6, gp
                  slti       a0, t5, -101
                  and        a6, t3, a0
                  auipc      s0, 456124
                  slli       s2, s6, 14
                  vsadd.vx   v4,v27,t0
                  ori        s4, a0, 979
                  vmadd.vx   v17,s9,v6
                  mulh       a4, a1, s10
                  srl        s8, a6, a7
                  div        a0, t2, s6
                  vmadd.vv   v14,v11,v1
                  remu       s4, tp, s4
                  divu       s2, s8, a4
                  lui        t3, 787671
                  vadc.vxm   v23,v18,a1,v0
                  slli       s0, t3, 24
                  vadc.vim   v2,v16,0,v0
                  sub        a7, s10, sp
                  vfsub.vv   v14,v19,v28,v0.t
                  sll        s10, s3, s8
                  lui        s10, 149710
                  vrsub.vi   v10,v23,0
                  srl        s10, t4, sp
                  srli       a7, s10, 26
                  sltiu      a0, s2, 901
                  sltu       a4, t0, s5
                  vslidedown.vi v29,v20,0,v0.t
                  srl        a0, zero, s3
                  slt        t1, tp, t2
                  vslidedown.vi v30,v19,0
                  vsadd.vx   v24,v5,a5
                  vsaddu.vi  v3,v5,0,v0.t
                  srl        t3, s6, s11
                  remu       s1, s3, t5
                  vmul.vx    v26,v10,a3
                  vmul.vx    v24,v4,s5
                  vslideup.vx v19,v25,s6,v0.t
                  divu       t5, tp, t5
                  andi       s0, t1, -700
                  vmadd.vx   v22,s8,v17
                  ori        s9, a1, 1000
                  sra        s10, s4, t2
                  sltu       t5, t3, a1
                  lui        t1, 448345
                  add        a1, a4, a3
                  vmul.vv    v17,v26,v7
                  and        s10, s9, t1
                  vadd.vx    v26,v9,s2,v0.t
                  sll        s4, s1, a2
                  slli       t5, t2, 22
                  vmul.vx    v22,v31,s4,v0.t
                  mulhsu     s1, s8, t5
                  add        s8, s1, t2
                  ori        s1, t0, -285
                  divu       a1, t4, t2
                  srai       zero, a3, 14
                  vsaddu.vi  v23,v21,0
                  divu       a7, t1, t4
                  lui        t4, 907839
                  and        t0, s11, a2
                  sra        t4, a6, s7
                  vslideup.vi v30,v21,0,v0.t
                  divu       s0, s6, t0
                  srli       a7, a0, 2
                  srai       s5, a7, 6
                  remu       a2, a0, ra
                  slti       s4, s7, -556
                  addi       a4, a6, -190
                  vrsub.vx   v7,v24,s11,v0.t
                  mulhsu     gp, t1, s5
                  vfadd.vf   v7,v15,ft2
                  mulh       a1, s6, t6
                  sltu       s1, s6, s10
                  slti       a2, t0, 167
                  vmulhu.vx  v31,v19,a1,v0.t
                  mulhu      sp, t4, s2
                  vrsub.vx   v20,v12,t0
                  and        t1, s1, s6
                  vsub.vv    v24,v18,v12,v0.t
                  mulhsu     a6, s2, a1
                  divu       s5, s10, a4
                  slt        a3, a3, ra
                  slt        a6, ra, s2
                  vslidedown.vx v11,v19,t1
                  vsll.vx    v23,v1,s2
                  mul        zero, a4, s1
                  srai       s7, s11, 1
                  addi       a7, a1, -909
                  mulhsu     t1, a3, a4
                  ori        s5, s2, 34
                  sub        s5, s3, a6
                  slli       a4, gp, 4
                  vsadd.vx   v14,v12,t5,v0.t
                  vmul.vv    v3,v3,v24,v0.t
                  vfadd.vv   v23,v13,v8,v0.t
                  mulhsu     s4, t6, s6
                  or         zero, s11, s4
                  slti       zero, a0, -593
                  srli       zero, tp, 7
                  vadc.vxm   v30,v26,gp,v0
                  divu       s10, t3, s0
                  remu       s4, t6, t4
                  rem        s8, t5, a3
                  sra        zero, s7, s3
                  vsadd.vx   v13,v13,a0
                  sra        s10, s10, s4
                  vsaddu.vx  v0,v14,zero
                  ori        sp, ra, -916
                  vfadd.vv   v31,v7,v14,v0.t
                  sll        t0, s5, t3
                  mul        s10, s1, s9
                  or         t1, s1, s2
                  auipc      a2, 9775
                  vslide1up.vx v30,v9,s11,v0.t
                  vmadd.vv   v23,v26,v2,v0.t
                  sltiu      t2, t5, 530
                  vadc.vxm   v24,v28,a2,v0
                  srl        s10, s4, s5
                  divu       a2, t6, t1
                  sll        s1, a4, a0
                  xori       t3, t6, -659
                  sltu       s0, s11, t0
                  srl        s2, gp, t0
                  sltu       a7, a5, s10
                  slli       gp, s10, 21
                  vsub.vx    v15,v8,s0,v0.t
                  vsadd.vv   v10,v14,v30,v0.t
                  vsub.vx    v23,v13,s3,v0.t
                  sll        t0, s9, t0
                  rem        t5, s9, a5
                  and        t2, sp, s2
                  lui        a7, 209064
                  lui        t2, 254555
                  xori       s9, t2, 615
                  lui        a7, 312968
                  vadc.vvm   v28,v11,v26,v0
                  sra        s1, t1, tp
                  lui        s5, 974656
                  sub        s6, sp, a5
                  mulh       tp, s6, t1
                  srli       sp, sp, 29
                  or         s1, a1, t3
                  vmadd.vx   v22,a0,v5,v0.t
                  vrsub.vi   v15,v7,0
                  vfadd.vf   v30,v16,fa5,v0.t
                  remu       s2, s6, s11
                  or         t3, s9, sp
                  or         sp, s5, a7
                  vadc.vim   v29,v12,0,v0
                  vmul.vx    v17,v14,s1,v0.t
                  sra        s4, tp, a0
                  div        s6, t5, tp
                  remu       a3, sp, s4
                  vslide1up.vx v16,v13,s8
                  lui        s8, 275435
                  remu       sp, a4, s3
                  remu       t3, s6, s4
                  lui        t1, 94524
                  vmulh.vv   v15,v23,v22,v0.t
                  vfsub.vf   v19,v10,ft1
                  mul        sp, gp, a2
                  vslidedown.vx v10,v25,a7,v0.t
                  remu       t3, sp, s10
                  mulhu      gp, gp, a4
                  srai       s9, s3, 17
                  vadd.vx    v17,v2,ra
                  slti       a1, s0, 826
                  vadc.vim   v29,v7,0,v0
                  vslideup.vx v15,v20,t5
                  srai       sp, a5, 4
                  rem        tp, t2, s6
                  mulhu      t4, t5, s4
                  mul        t3, s4, t4
                  slt        s1, s1, t1
                  vfsub.vf   v31,v6,ft5
                  or         s9, t1, a5
                  slli       a6, a3, 23
                  vsub.vx    v19,v10,ra,v0.t
                  srai       s2, s0, 20
                  sll        a0, a2, ra
                  sub        a1, t2, t6
                  rem        a3, t5, s4
                  srl        a0, t2, s11
                  divu       sp, a0, t4
                  sltu       t2, a5, s11
                  xori       s4, t3, 203
                  vadc.vxm   v14,v18,t5,v0
                  vsub.vx    v9,v14,ra
                  vmulhu.vx  v18,v8,s4,v0.t
                  sltiu      a1, t2, -611
                  sra        s9, s2, gp
                  divu       t2, a3, t4
                  vslideup.vi v7,v20,0
                  add        a4, a0, s7
                  sll        a7, a4, s4
                  lui        s0, 130716
                  vadd.vi    v26,v18,0,v0.t
                  add        zero, a6, t3
                  vsaddu.vx  v4,v11,s6
                  vmulhu.vx  v5,v12,s2,v0.t
                  divu       a6, a7, ra
                  srl        s1, a0, tp
                  sltiu      a6, t5, 557
                  vmulhu.vv  v27,v9,v4
                  lui        s10, 995628
                  vsll.vv    v2,v19,v29,v0.t
                  addi       tp, sp, -905
                  vfsub.vv   v1,v21,v7,v0.t
                  xori       a1, s1, 898
                  lui        s9, 60687
                  vmul.vv    v2,v16,v1,v0.t
                  or         t1, t4, tp
                  mulhsu     s6, a2, zero
                  div        s8, s8, t3
                  auipc      zero, 345289
                  vsub.vx    v24,v30,t4,v0.t
                  vslide1up.vx v26,v12,a3
                  remu       zero, t5, a2
                  sra        t0, s7, a7
                  srli       s0, t5, 30
                  lui        s8, 655050
                  mulhu      t4, s1, a7
                  sll        tp, t1, s9
                  srli       s8, s2, 18
                  vslidedown.vi v30,v12,0
                  remu       sp, t1, s10
                  andi       t2, a7, 78
                  xor        gp, t6, a2
                  mul        t0, s3, zero
                  mulhu      t3, a2, t2
                  vfadd.vv   v31,v0,v16,v0.t
                  lui        t0, 572181
                  or         t2, s1, s7
                  vsaddu.vv  v16,v5,v30
                  vmadd.vv   v3,v23,v7,v0.t
                  vadd.vx    v28,v31,a5
                  mulhu      zero, a0, s5
                  vsub.vx    v10,v5,s1
                  or         t4, a2, s4
                  vsaddu.vi  v1,v15,0
                  vfadd.vv   v31,v19,v30,v0.t
                  sll        s1, s11, t0
                  divu       s10, s6, s6
                  sub        a4, s6, t4
                  add        t5, a0, s3
                  vsub.vv    v12,v19,v1
                  divu       a3, ra, s2
                  auipc      t0, 716922
                  mul        s8, t0, s3
                  vrsub.vx   v20,v5,s7,v0.t
                  auipc      a4, 1001777
                  lui        ra, 147422
                  vsub.vv    v28,v30,v6
                  vslidedown.vi v5,v19,0,v0.t
                  divu       s10, s2, s4
                  vadc.vim   v21,v23,0,v0
                  remu       s8, t4, a4
                  srai       a4, s7, 1
                  and        s5, t1, t6
                  slli       t3, a5, 26
                  sll        s1, t2, t5
                  add        s6, s10, a3
                  vsub.vx    v8,v3,a5,v0.t
                  mulhu      a7, t4, t1
                  srl        s10, s9, s2
                  sub        t2, s3, t4
                  srli       ra, s6, 16
                  vsaddu.vx  v5,v10,s11
                  vsaddu.vv  v4,v0,v9
                  xori       a2, s6, -417
                  divu       s8, a0, a2
                  sub        a7, t6, t4
                  srai       zero, s5, 15
                  srl        a3, t4, t6
                  slt        s0, s5, t2
                  slt        tp, s7, s11
                  srai       s1, t2, 10
                  slt        t2, s8, t1
                  vmul.vv    v9,v3,v31,v0.t
                  vmul.vx    v1,v27,t5
                  vslidedown.vx v30,v12,s1
                  remu       s8, ra, ra
                  and        s8, s9, s0
                  srl        tp, gp, sp
                  vadd.vv    v21,v15,v12
                  vadc.vvm   v22,v6,v1,v0
                  srli       s10, a3, 16
                  vrsub.vx   v24,v18,s4
                  auipc      sp, 506139
                  vmulhu.vx  v2,v0,a7
                  vsadd.vx   v4,v22,t2,v0.t
                  remu       a1, t2, tp
                  and        t2, t1, a4
                  slti       tp, s3, 18
                  xori       a6, s11, -698
                  mulhu      a4, t3, a4
                  slt        a0, s6, tp
                  slt        s7, s6, a3
                  sltu       a0, tp, a4
                  vmulh.vv   v18,v22,v24,v0.t
                  lui        t2, 571725
                  vfadd.vf   v29,v29,fs5,v0.t
                  vmadd.vx   v21,s11,v12,v0.t
                  vfadd.vv   v20,v9,v1,v0.t
                  and        a0, s11, t4
                  slt        a1, s4, t3
                  mulhu      a7, s6, t1
                  rem        t4, t6, t2
                  vfadd.vf   v15,v27,fa1,v0.t
                  sll        t5, a0, s5
                  vadc.vim   v20,v22,0,v0
                  mulhsu     s10, a1, t2
                  add        t5, t0, t0
                  rem        gp, ra, a3
                  slti       s2, a6, -807
                  vrsub.vx   v0,v5,zero
                  andi       s8, s7, -394
                  vsaddu.vi  v13,v28,0,v0.t
                  remu       s2, t6, s3
                  vadd.vx    v24,v23,a3
                  div        s6, a3, t3
                  rem        sp, s2, s11
                  vmulh.vx   v11,v16,s2
                  mulh       s10, tp, t3
                  vslideup.vi v17,v7,0,v0.t
                  vadc.vxm   v21,v30,s11,v0
                  rem        s4, s7, zero
                  mulhu      a4, a0, t4
                  slti       s9, a5, -678
                  srli       s10, a5, 7
                  ori        a0, t1, -909
                  sltu       t0, s11, sp
                  vmul.vv    v24,v24,v29
                  srli       a4, s1, 19
                  sub        s8, t3, s5
                  vslidedown.vx v21,v9,s4
                  add        ra, s7, t6
                  sll        a0, a7, a4
                  vmulh.vx   v20,v5,t3,v0.t
                  sra        zero, t1, a0
                  vmul.vx    v21,v5,s1
                  vfsub.vf   v13,v0,fs9
                  sltiu      a0, t1, 835
                  vsaddu.vv  v3,v0,v3
                  sub        t2, s3, t6
                  vfsub.vf   v15,v2,ft4,v0.t
                  vsll.vx    v9,v0,t0
                  vmulh.vx   v24,v1,ra,v0.t
                  remu       t3, s11, gp
                  or         s8, a1, a3
                  vfsub.vv   v3,v0,v17
                  vadc.vvm   v6,v24,v15,v0
                  sltiu      ra, sp, -155
                  add        t0, s10, s0
                  vslide1up.vx v14,v21,s2,v0.t
                  lui        s4, 1000840
                  vslide1up.vx v11,v15,sp,v0.t
                  srai       t1, ra, 12
                  div        t1, s9, s2
                  rem        gp, a6, s11
                  vslidedown.vi v24,v6,0,v0.t
                  xor        s7, s8, a1
                  vfadd.vf   v20,v4,ft6
                  sltu       s4, ra, s1
                  srli       t4, s8, 8
                  xor        s3, a5, tp
                  vfsub.vv   v22,v14,v26,v0.t
                  mulhsu     sp, t4, t3
                  divu       s9, t4, t2
                  sub        a0, s1, gp
                  div        ra, a6, a7
                  vslidedown.vi v6,v3,0
                  remu       tp, t1, s2
                  xori       t4, s9, -609
                  xor        a1, a0, a5
                  vsadd.vv   v12,v25,v17,v0.t
                  remu       s4, t1, a3
                  vadc.vxm   v21,v19,s8,v0
                  lui        s6, 1033198
                  vadd.vx    v19,v10,t0
                  slt        a7, sp, a7
                  lui        a0, 397549
                  slli       s9, t0, 7
                  vadd.vv    v28,v8,v26
                  sltu       a3, s0, a6
                  slli       zero, a5, 1
                  vadc.vvm   v18,v14,v9,v0
                  vsll.vx    v31,v5,a0
                  vmadd.vx   v13,s0,v1
                  sltiu      a1, a7, -924
                  sub        a3, s0, ra
                  vsadd.vx   v27,v29,a2
                  vslideup.vi v17,v10,0
                  vslidedown.vi v7,v3,0
                  srai       a3, s9, 12
                  remu       tp, t4, tp
                  vslide1up.vx v23,v31,a4,v0.t
                  vsaddu.vi  v19,v31,0
                  addi       a3, t6, 515
                  sub        a0, t4, a2
                  vslidedown.vx v15,v7,a3,v0.t
                  vmul.vv    v27,v11,v14,v0.t
                  vmul.vv    v30,v21,v26
                  rem        tp, a0, s8
                  vslide1up.vx v30,v20,s8,v0.t
                  sra        s8, t2, t3
                  ori        s0, s4, 488
                  vsadd.vi   v15,v21,0
                  vslide1up.vx v1,v26,gp,v0.t
                  vsub.vx    v11,v3,t1,v0.t
                  mulhu      a1, a0, s8
                  mul        s1, a2, ra
                  vmadd.vv   v2,v16,v4
                  vsll.vi    v24,v18,0,v0.t
                  sltiu      s1, t2, -403
                  addi       t5, s10, 598
                  vsadd.vx   v5,v18,s3,v0.t
                  vslide1up.vx v31,v17,a3
                  divu       s9, t5, ra
                  vmulhu.vx  v31,v27,gp
                  vsub.vv    v16,v19,v13,v0.t
                  or         gp, s5, sp
                  mul        s3, a6, a5
                  xori       a2, a3, -49
                  auipc      t1, 993716
                  remu       zero, a5, a3
                  div        a4, s4, a1
                  mulhu      t3, s11, a2
                  sra        a0, tp, s5
                  mul        s1, s1, a0
                  vsadd.vx   v9,v23,zero
                  sltiu      a0, t5, 439
                  or         t4, t2, s10
                  srli       tp, a6, 14
                  slt        s3, zero, t0
                  andi       a0, s11, 931
                  vadd.vi    v2,v18,0
                  vslidedown.vi v4,v7,0
                  vadc.vvm   v29,v6,v31,v0
                  slti       s10, t6, -3
                  vrsub.vx   v14,v13,s1
                  srli       a0, a0, 23
                  vfsub.vf   v9,v27,fs1,v0.t
                  vsub.vx    v11,v4,a6,v0.t
                  slli       a7, sp, 7
                  vrsub.vx   v26,v0,t6,v0.t
                  sltu       a1, s3, a5
                  sltiu      a3, t6, 887
                  srl        a6, a7, zero
                  auipc      gp, 531025
                  srl        s5, s3, ra
                  vrsub.vx   v4,v9,zero
                  vslideup.vx v12,v1,s2,v0.t
                  mulh       s8, a2, s0
                  vslideup.vx v3,v5,t5
                  vadc.vxm   v5,v15,t1,v0
                  sra        a0, a2, a6
                  ori        t5, a3, 714
                  mulhu      a2, a0, s3
                  vmulh.vv   v5,v18,v23
                  divu       a4, t2, s10
                  lui        t5, 563727
                  mul        t2, s4, s4
                  srai       s0, s5, 14
                  srli       s5, s9, 30
                  sltu       s2, tp, t4
                  vslidedown.vi v13,v23,0,v0.t
                  add        t5, t4, t2
                  addi       s7, s5, 801
                  rem        t5, sp, t3
                  sltu       t5, s8, t6
                  vfsub.vf   v25,v0,ft3,v0.t
                  mulhu      t4, gp, t1
                  vslideup.vx v3,v30,s2
                  vsadd.vx   v20,v16,a5
                  vadd.vv    v10,v6,v10
                  vsll.vx    v2,v5,a2,v0.t
                  srl        tp, s9, t3
                  srli       t1, zero, 20
                  vrsub.vi   v28,v7,0
                  mulhu      gp, s11, t4
                  vslidedown.vx v15,v14,ra
                  vrsub.vi   v12,v20,0
                  slli       gp, ra, 29
                  mul        sp, t1, s6
                  or         s8, a1, zero
                  vsaddu.vi  v1,v29,0,v0.t
                  vslidedown.vx v11,v17,zero
                  slti       sp, a1, -758
                  vslide1up.vx v15,v26,a0,v0.t
                  vsadd.vx   v11,v0,t3,v0.t
                  ori        s8, gp, -929
                  vadd.vi    v12,v4,0,v0.t
                  rem        a1, t1, tp
                  vfsub.vf   v8,v5,ft4
                  slt        sp, s3, t3
                  vslideup.vx v6,v15,a7,v0.t
                  vslideup.vx v19,v16,t0,v0.t
                  addi       s6, s6, -467
                  xor        t1, t1, tp
                  sll        sp, tp, t6
                  sltu       s5, s8, s8
                  vfadd.vf   v10,v11,fs5,v0.t
                  vsub.vx    v4,v20,s1,v0.t
                  remu       a3, a1, t2
                  slti       a2, s11, 1009
                  ori        s9, gp, -448
                  vrsub.vi   v11,v22,0,v0.t
                  sra        t3, s2, tp
                  vslidedown.vi v22,v29,0
                  divu       a6, s10, t6
                  rem        s5, t5, t5
                  sltu       s4, s4, a7
                  vslidedown.vi v12,v25,0
                  or         zero, a2, a1
                  srl        a2, a4, s5
                  add        t1, t3, t3
                  add        zero, a5, t3
                  slti       s6, s6, -116
                  sltiu      a1, a5, -343
                  srli       tp, ra, 4
                  slti       s1, t1, -582
                  vrsub.vi   v12,v1,0,v0.t
                  vslide1up.vx v5,v19,s1
                  vsadd.vx   v6,v26,a0
                  sub        tp, a2, t4
                  or         a1, a2, t2
                  srl        s4, s3, t3
                  div        s5, a2, s6
                  or         s7, s3, s7
                  vslideup.vi v29,v5,0
                  vadd.vx    v14,v17,s2
                  mulhsu     a0, t0, t6
                  xor        a3, t2, s3
                  mulhu      a1, s2, s3
                  vslideup.vi v7,v18,0
                  vsll.vx    v10,v1,s10
                  vadc.vvm   v16,v28,v17,v0
                  slli       s10, s11, 25
                  or         t0, ra, a3
                  remu       s2, s5, s5
                  vsub.vv    v2,v31,v20
                  srl        a4, t1, tp
                  and        a2, s4, s5
                  vsadd.vi   v25,v22,0,v0.t
                  mulhsu     s6, a1, t1
                  srli       s3, gp, 31
                  sra        s5, t1, s10
                  vsadd.vx   v16,v1,a1
                  vadc.vim   v24,v7,0,v0
                  mul        t0, a7, s10
                  ori        t5, t4, -834
                  add        s4, t6, a4
                  div        t2, s3, t4
                  srli       s2, tp, 8
                  sra        s1, a1, ra
                  mulh       s2, ra, s10
                  xori       s4, s1, -198
                  add        s7, a0, s8
                  sra        s1, t3, t3
                  and        s1, t5, s4
                  vfsub.vf   v15,v26,ft5
                  srli       t4, a3, 0
                  vfsub.vf   v30,v19,fs1
                  vmul.vv    v9,v1,v1,v0.t
                  srai       tp, s6, 11
                  srai       gp, s8, 8
                  mulh       a6, ra, tp
                  vsaddu.vv  v10,v3,v23
                  mul        s10, t2, s2
                  slt        s2, a0, sp
                  vadc.vim   v4,v10,0,v0
                  or         t3, s7, a5
                  vmadd.vv   v5,v5,v8,v0.t
                  mulhu      t2, t6, t5
                  vmul.vx    v8,v1,t1,v0.t
                  ori        gp, s10, 998
                  mulhsu     s6, a2, s11
                  mulhsu     t2, s7, t0
                  vslidedown.vi v11,v19,0
                  sll        t2, s8, s3
                  andi       s0, s5, -940
                  slt        s3, a3, s6
                  sltiu      a7, t5, -68
                  divu       a1, t3, a0
                  vfsub.vf   v18,v25,ft11
                  vmulhu.vv  v23,v13,v1,v0.t
                  sltu       t1, s0, s9
                  vsadd.vv   v17,v5,v5
                  sll        s9, zero, sp
                  sltiu      s9, a3, -58
                  sub        s2, s8, s5
                  vmadd.vx   v7,t2,v14
                  remu       s10, t5, sp
                  vmulhu.vv  v5,v9,v23,v0.t
                  lui        s9, 1019107
                  vsll.vi    v0,v17,0
                  and        t5, a7, zero
                  vmul.vx    v21,v8,t6,v0.t
                  vmadd.vv   v17,v11,v25,v0.t
                  and        t2, ra, ra
                  vsub.vx    v24,v5,t3
                  mulh       s10, s1, a2
                  srai       sp, s11, 25
                  srl        s4, s4, t3
                  sltu       a3, t5, a3
                  mulhu      tp, s11, a1
                  add        t2, s2, s6
                  sra        s1, s11, s10
                  vsadd.vv   v14,v3,v4,v0.t
                  and        t4, a1, t6
                  sub        s8, s4, a1
                  lui        a2, 843492
                  vsll.vv    v21,v16,v7,v0.t
                  slti       t5, sp, -854
                  vslideup.vi v22,v29,0
                  addi       gp, a7, 586
                  vmadd.vv   v8,v4,v11
                  or         s6, s11, t1
                  ori        s2, s4, 373
                  div        s9, a2, s11
                  srli       t5, a1, 17
                  vadd.vx    v27,v24,s5,v0.t
                  vmadd.vx   v16,gp,v1
                  vsaddu.vi  v30,v21,0,v0.t
                  mulh       s8, s9, a7
                  srai       t2, s3, 29
                  vslidedown.vi v1,v25,0
                  andi       s0, s4, 414
                  sub        s6, s6, t6
                  sll        t1, t2, tp
                  vfsub.vf   v5,v30,ft11,v0.t
                  xor        a4, t5, t5
                  vsll.vx    v16,v24,gp
                  auipc      t5, 560289
                  slt        tp, s6, t2
                  sra        s5, tp, t0
                  slti       t1, a0, -94
                  div        t3, a2, s1
                  vslideup.vi v21,v2,0
                  vfadd.vf   v16,v5,fs1
                  and        a6, a6, s5
                  mulhu      s8, a5, t1
                  div        t2, s1, s7
                  or         s6, s11, tp
                  ori        tp, s1, 35
                  vfadd.vv   v29,v24,v3
                  lui        s1, 152026
                  xor        a3, s0, s0
                  vsll.vx    v7,v29,a3,v0.t
                  vfsub.vf   v11,v5,fa5
                  vsub.vv    v18,v16,v31,v0.t
                  srai       t3, zero, 28
                  mulh       s9, s9, s1
                  add        s5, a4, s8
                  vmulhu.vv  v26,v24,v1
                  vmulhu.vx  v17,v0,gp
                  add        t4, s11, a5
                  vadd.vv    v31,v29,v26,v0.t
                  mul        s10, s0, s8
                  vmulh.vx   v11,v8,s2,v0.t
                  or         a3, s0, a4
                  remu       a4, a1, tp
                  xori       s7, s0, -650
                  srli       a6, a4, 29
                  vslidedown.vx v25,v5,zero,v0.t
                  vsadd.vx   v19,v4,t3,v0.t
                  vslideup.vi v26,v6,0,v0.t
                  mulh       gp, a2, a1
                  vslidedown.vx v4,v14,s6
                  lui        t4, 592308
                  vsll.vv    v31,v16,v23
                  sll        t3, a4, a0
                  vadd.vi    v14,v10,0
                  auipc      s5, 211027
                  vadc.vvm   v8,v13,v2,v0
                  srai       s7, a5, 6
                  mulh       s4, t0, a1
                  rem        a7, t1, s4
                  vmul.vv    v10,v11,v29,v0.t
                  vsub.vv    v3,v21,v3
                  vsadd.vi   v27,v29,0
                  vsaddu.vi  v4,v15,0
                  vslideup.vi v15,v1,0
                  sll        t2, ra, s9
                  slli       s0, a7, 7
                  xor        s3, s10, s8
                  slt        sp, t6, s8
                  sltiu      t0, a6, -429
                  or         t4, a6, s3
                  vmulhu.vv  v29,v26,v3,v0.t
                  srl        t2, t4, a7
                  andi       s9, tp, 640
                  mul        t1, a2, t5
                  andi       s9, a7, -843
                  mulhu      t2, s6, t0
                  sltiu      a4, a1, -601
                  addi       t3, a5, -949
                  mulhsu     t1, t4, s9
                  vfadd.vf   v16,v21,fs0
                  xor        s3, a4, s4
                  sub        s3, tp, t1
                  div        ra, zero, sp
                  srli       t2, s4, 17
                  divu       sp, a2, a5
                  remu       s3, a1, t3
                  divu       t4, a6, t3
                  auipc      s0, 386507
                  vsub.vx    v2,v0,zero,v0.t
                  srai       s10, s6, 23
                  sltu       t4, a0, ra
                  vrsub.vi   v26,v20,0
                  ori        a7, a7, 528
                  vadc.vxm   v8,v27,s4,v0
                  xor        s7, t5, a3
                  sll        t2, ra, a1
                  slti       a3, tp, 85
                  vslidedown.vx v19,v2,t5
                  slt        gp, t0, a7
                  vslide1up.vx v18,v20,t1,v0.t
                  ori        s6, t3, 777
                  vmulhu.vv  v6,v9,v29,v0.t
                  sra        s4, gp, gp
                  div        tp, s10, a3
                  sltiu      gp, a6, 231
                  vslideup.vi v16,v24,0,v0.t
                  and        s10, s5, gp
                  ori        s8, s5, -487
                  andi       s6, a6, -709
                  slli       s8, s8, 7
                  vadd.vi    v10,v18,0
                  vadd.vx    v30,v3,t3
                  vslideup.vx v7,v31,s8
                  srl        t5, s8, a6
                  vslidedown.vx v1,v17,tp,v0.t
                  srli       t1, s4, 27
                  xor        s5, s7, zero
                  rem        a7, a5, s9
                  srai       s4, a5, 17
                  auipc      sp, 270070
                  sub        s7, s5, zero
                  vmul.vv    v26,v6,v1
                  lui        a4, 97954
                  sltu       a1, zero, s7
                  vsub.vv    v14,v29,v16
                  vsaddu.vv  v11,v13,v26,v0.t
                  sra        ra, a3, a2
                  vsub.vv    v8,v16,v29,v0.t
                  slli       a4, s1, 27
                  sltu       s2, s5, t5
                  slli       a1, sp, 20
                  vmulh.vx   v29,v15,s11
                  mulhu      s5, a2, s2
                  vmulh.vv   v29,v28,v27
                  andi       s3, a3, -24
                  addi       gp, ra, -784
                  srai       t0, t3, 3
                  or         s6, a1, t0
                  andi       s1, t1, -161
                  mulhu      s7, s11, gp
                  vadd.vx    v24,v26,t0,v0.t
                  vmul.vv    v2,v11,v30,v0.t
                  mul        t1, s11, tp
                  divu       s6, a0, s11
                  addi       s8, tp, 647
                  remu       s3, s4, tp
                  sltiu      s10, s3, -944
                  lui        t3, 619506
                  sltu       gp, s11, t1
                  vadd.vi    v26,v15,0,v0.t
                  vmadd.vv   v13,v21,v12
                  slli       t3, s8, 4
                  mulh       a2, t3, zero
                  vadd.vv    v18,v9,v16,v0.t
                  sll        sp, t4, zero
                  vadc.vvm   v27,v2,v3,v0
                  vadd.vi    v31,v22,0,v0.t
                  vsll.vx    v8,v16,t2
                  mulhsu     s6, s3, t0
                  vsadd.vx   v29,v8,t1
                  divu       a2, sp, a4
                  vmulhu.vv  v11,v12,v19,v0.t
                  vmadd.vx   v19,s0,v28
                  xori       a7, t1, -736
                  and        t4, tp, s8
                  and        tp, t0, s7
                  vsll.vv    v29,v14,v7,v0.t
                  mulh       s5, ra, s10
                  xori       t1, s9, -915
                  vsaddu.vx  v1,v3,zero,v0.t
                  vsll.vx    v9,v5,sp
                  vmulhu.vx  v20,v6,s8
                  rem        a4, a7, sp
                  lui        a1, 35397
                  sub        a2, t5, a5
                  andi       s4, t0, 953
                  vsadd.vi   v22,v6,0,v0.t
                  vmul.vx    v15,v3,s7,v0.t
                  vadd.vx    v8,v27,t4,v0.t
                  srli       ra, s7, 4
                  sltiu      a7, a3, 327
                  sltu       s0, s0, s9
                  vadd.vi    v21,v24,0
                  vmadd.vv   v22,v17,v16,v0.t
                  srli       a7, s2, 26
                  sll        t1, s0, a6
                  vrsub.vi   v10,v4,0
                  vrsub.vi   v5,v16,0
                  vsaddu.vv  v0,v24,v13
                  vsub.vv    v1,v16,v9,v0.t
                  vrsub.vi   v9,v16,0,v0.t
                  vrsub.vx   v10,v6,s5
                  auipc      s9, 889844
                  vslideup.vx v12,v26,t2
                  addi       s10, s1, -790
                  vsub.vv    v0,v5,v23
                  slli       t5, t5, 23
                  xori       a4, s0, -327
                  srl        a0, s7, t1
                  srl        a3, t0, gp
                  vmadd.vx   v19,s3,v15
                  vsll.vv    v3,v4,v11
                  mulhsu     tp, t4, a1
                  ori        a7, sp, -915
                  and        s1, s7, s11
                  mulh       s10, a4, t1
                  sltiu      s8, t1, -1024
                  vmul.vv    v24,v31,v22
                  andi       s2, t6, 921
                  mulh       a7, a1, t5
                  slt        s4, t3, s5
                  vsub.vv    v0,v21,v27
                  vmulhu.vv  v0,v19,v2
                  ori        a4, s10, 338
                  or         t5, a2, t2
                  slli       t1, s7, 22
                  vrsub.vx   v12,v7,s0,v0.t
                  vsub.vx    v12,v29,t5,v0.t
                  rem        sp, a7, t0
                  sra        a1, t6, tp
                  xor        zero, s7, s9
                  vmulhu.vx  v18,v6,a6
                  vfadd.vv   v30,v1,v15
                  vrsub.vx   v21,v15,a0,v0.t
                  xor        s1, s8, s3
                  vfadd.vf   v11,v30,fa1
                  srai       t0, s5, 8
                  srli       a1, a7, 25
                  vsub.vx    v26,v23,t5,v0.t
                  sra        t0, gp, s8
                  add        zero, t6, t6
                  slti       s6, t6, 487
                  vadd.vx    v3,v29,t4,v0.t
                  vsub.vx    v27,v0,t6,v0.t
                  mulhsu     a1, gp, a3
                  mul        zero, s0, a7
                  srai       ra, a5, 21
                  vsll.vi    v4,v15,0,v0.t
                  sub        s8, s1, s8
                  vfadd.vv   v26,v11,v31
                  vslideup.vx v15,v10,t0,v0.t
                  mulh       s2, a4, s9
                  sub        t5, gp, s3
                  ori        ra, zero, -155
                  vfadd.vv   v26,v19,v24
                  sll        s8, a5, ra
                  srai       gp, a1, 7
                  vmul.vx    v30,v30,t2
                  slli       a0, s5, 28
                  mulh       sp, ra, s6
                  divu       s10, s10, s7
                  slti       s7, s1, -393
                  vsadd.vx   v21,v20,a4,v0.t
                  vsub.vx    v26,v27,s2,v0.t
                  srai       gp, t6, 20
                  lui        t1, 216644
                  rem        s8, s10, t4
                  div        s8, s11, s11
                  mulhsu     a1, s7, s4
                  divu       t5, s5, s8
                  vfsub.vf   v19,v16,ft4,v0.t
                  vfsub.vf   v22,v29,ft1,v0.t
                  vmadd.vv   v31,v13,v14,v0.t
                  mulhsu     a7, t3, a1
                  vmadd.vx   v5,zero,v14
                  andi       zero, s9, 910
                  ori        tp, t3, -142
                  vrsub.vi   v12,v5,0,v0.t
                  vsub.vv    v16,v14,v29,v0.t
                  mulhu      s4, t3, a2
                  lui        gp, 491115
                  sltiu      a1, s5, -412
                  sub        s3, t5, t0
                  vsll.vi    v25,v7,0
                  sub        t3, s5, t6
                  auipc      s2, 776050
                  ori        sp, s5, 704
                  srai       gp, a7, 18
                  add        t5, t2, t1
                  vmulh.vv   v4,v20,v3,v0.t
                  vadd.vv    v19,v19,v23,v0.t
                  lui        s6, 642110
                  ori        tp, s7, -339
                  vmulhu.vx  v30,v13,t0,v0.t
                  vslideup.vi v9,v0,0,v0.t
                  vsub.vx    v15,v12,s5
                  vmulhu.vx  v24,v28,s8,v0.t
                  vadc.vvm   v21,v31,v23,v0
                  vmulhu.vx  v29,v30,t2,v0.t
                  and        s2, a6, t2
                  slti       t5, s1, -1017
                  vmulhu.vv  v30,v20,v15
                  mul        s7, zero, t1
                  divu       a2, s6, a6
                  lui        gp, 1002605
                  auipc      t1, 198832
                  rem        s9, t0, s9
                  vmadd.vx   v26,a7,v21
                  sltiu      s4, sp, -121
                  auipc      t0, 35902
                  add        ra, t3, s11
                  sll        s0, gp, s10
                  vsub.vx    v16,v14,a6
                  vsadd.vi   v14,v28,0
                  vmadd.vx   v7,t3,v11
                  sra        a3, zero, a4
                  vadc.vxm   v27,v30,t1,v0
                  vmulhu.vv  v10,v16,v13,v0.t
                  vsub.vv    v0,v23,v22
                  srai       a1, t1, 20
                  remu       a4, a6, a7
                  srl        a2, ra, s1
                  mul        s2, s7, s8
                  add        t0, s10, t0
                  xor        s6, t5, a7
                  auipc      t4, 70507
                  lui        s1, 100323
                  andi       s7, s5, 666
                  mulhu      a0, a1, s0
                  rem        s6, a7, gp
                  vsll.vi    v5,v20,0,v0.t
                  vsaddu.vv  v11,v26,v15,v0.t
                  xori       sp, a6, 695
                  rem        a2, gp, s9
                  xori       t4, t5, -853
                  sub        sp, gp, t3
                  vslide1up.vx v19,v7,s3,v0.t
                  andi       s5, t5, -959
                  sltiu      s3, a1, -933
                  srl        a6, s2, t2
                  div        s5, a0, s1
                  andi       s6, t4, -737
                  remu       t5, a6, a5
                  or         s8, a1, a0
                  vadd.vv    v16,v30,v26,v0.t
                  slt        s9, a6, t5
                  lui        s8, 600666
                  addi       a4, s10, -383
                  addi       a3, s1, 996
                  and        s4, t1, s6
                  vmulhu.vv  v12,v13,v23,v0.t
                  vadd.vv    v4,v29,v0,v0.t
                  vsub.vv    v9,v2,v11,v0.t
                  sub        tp, a2, a3
                  rem        s8, s4, tp
                  vslide1up.vx v9,v29,s9
                  vmul.vv    v0,v26,v9
                  slt        s7, s8, s2
                  divu       sp, t2, s7
                  vfadd.vv   v31,v27,v31
                  mulhu      s10, t1, s3
                  add        s1, s1, s11
                  xor        t5, a7, a2
                  vslideup.vx v25,v14,sp
                  remu       a2, t6, s2
                  xori       a3, s11, -652
                  vmul.vv    v14,v0,v25
                  vslide1up.vx v15,v25,t2
                  addi       s1, t5, 244
                  xori       s4, a6, 581
                  divu       t1, s3, s1
                  vsll.vx    v12,v10,ra,v0.t
                  vadc.vim   v5,v17,0,v0
                  mulhsu     s4, s10, s2
                  vslideup.vi v26,v27,0
                  slli       ra, s9, 17
                  rem        a7, t1, s4
                  addi       s7, s0, 662
                  sub        s5, gp, s4
                  sll        s7, t2, t1
                  mulh       s7, tp, a4
                  vsll.vv    v20,v24,v11
                  vfsub.vf   v24,v15,fs5,v0.t
                  ori        zero, t6, 697
                  add        s9, zero, s0
                  vsub.vv    v7,v5,v25
                  vrsub.vi   v4,v31,0
                  sll        t1, ra, ra
                  or         a0, s7, a7
                  addi       sp, s8, 410
                  vmadd.vv   v28,v12,v15,v0.t
                  andi       a6, s4, -608
                  andi       a2, a1, 799
                  vmadd.vv   v7,v1,v0
                  xori       tp, sp, 677
                  vmul.vx    v20,v22,s2
                  vmul.vv    v13,v23,v28,v0.t
                  vslide1up.vx v18,v4,a5,v0.t
                  vsaddu.vx  v12,v25,t2
                  vslideup.vx v11,v0,t1
                  vmul.vx    v20,v25,a1
                  vmulhu.vx  v26,v12,s5,v0.t
                  mul        t4, s10, a0
                  srli       a3, t6, 2
                  divu       tp, a4, a6
                  sub        gp, a6, t6
                  srl        s9, a5, gp
                  sub        a6, s0, t6
                  vmul.vv    v7,v8,v19,v0.t
                  div        sp, t6, t2
                  slti       t0, sp, -317
                  vfsub.vf   v2,v25,fs7
                  xor        s3, s2, s1
                  sub        s6, t1, s6
                  vadd.vi    v21,v9,0
                  rem        a0, a7, t2
                  sll        t2, t4, a7
                  srli       s1, a4, 4
                  vmulhu.vv  v20,v15,v1
                  vfadd.vv   v27,v22,v3
                  srl        a7, tp, gp
                  xori       a1, zero, 634
                  vadc.vxm   v2,v30,t3,v0
                  mulhu      a7, t3, a5
                  div        a4, a5, a1
                  vsadd.vx   v30,v16,s0,v0.t
                  xori       s6, s1, -386
                  vadd.vi    v21,v21,0
                  vslidedown.vx v21,v5,s10,v0.t
                  slt        t2, a4, t1
                  vmulhu.vv  v28,v21,v26
                  xor        a0, s4, t0
                  vslidedown.vx v24,v25,a0,v0.t
                  sll        a7, a0, a2
                  sll        zero, s2, s7
                  mulhsu     s3, s6, tp
                  addi       a2, t6, -504
                  vadc.vim   v22,v1,0,v0
                  vadc.vim   v29,v24,0,v0
                  vmulhu.vv  v30,v8,v14
                  mul        s1, t2, s5
                  or         t4, s5, gp
                  srl        s0, s11, s6
                  vsadd.vx   v22,v7,gp,v0.t
                  vmulhu.vv  v3,v15,v5,v0.t
                  addi       ra, ra, -613
                  mulhsu     a3, zero, t5
                  addi       s10, t5, 47
                  slt        s8, t5, s2
                  mulhsu     a7, sp, s11
                  remu       s7, t3, s0
                  ori        zero, a4, 35
                  remu       a3, s0, s10
                  and        gp, t1, a2
                  vmul.vv    v29,v0,v9
                  mulh       a3, t6, a0
                  vsaddu.vx  v21,v2,s6
                  xor        s1, zero, s2
                  vfsub.vf   v19,v27,fs4,v0.t
                  remu       s0, a5, ra
                  mulhu      s5, s7, a0
                  mulh       s5, gp, zero
                  remu       s9, a7, s0
                  slli       s0, t6, 8
                  srai       s9, a0, 10
                  sltu       zero, a1, sp
                  vfsub.vv   v1,v18,v8
                  slt        s3, ra, t5
                  vslidedown.vi v15,v0,0,v0.t
                  div        t1, sp, s6
                  sub        a3, s11, t1
                  addi       s6, a0, -496
                  vsaddu.vx  v24,v6,s3,v0.t
                  srli       ra, a5, 12
                  vrsub.vx   v2,v28,s3,v0.t
                  srli       a0, t2, 8
                  vfadd.vv   v2,v0,v29,v0.t
                  sll        t4, zero, a6
                  vsll.vx    v8,v20,s11
                  xori       a1, a0, -690
                  vmadd.vv   v17,v30,v12
                  vsaddu.vx  v10,v31,sp
                  div        ra, a1, s7
                  vslidedown.vi v11,v20,0
                  vsub.vv    v26,v11,v11,v0.t
                  rem        a2, a0, a2
                  remu       zero, zero, t0
                  vsub.vv    v11,v7,v20
                  vslideup.vx v1,v26,a5,v0.t
                  rem        ra, a4, s6
                  vsaddu.vx  v4,v28,a6
                  vrsub.vx   v0,v11,s3
                  vmadd.vx   v29,a1,v30
                  vslideup.vi v17,v25,0
                  vslidedown.vi v13,v12,0,v0.t
                  vslideup.vx v22,v31,s7,v0.t
                  vsadd.vv   v20,v3,v23,v0.t
                  slli       s10, s2, 2
                  srai       s3, s10, 21
                  rem        a0, a1, a7
                  div        a0, ra, a5
                  srl        t3, s10, a4
                  lui        s3, 799465
                  vsaddu.vx  v13,v9,a6,v0.t
                  srli       a2, a3, 18
                  auipc      s0, 995714
                  vadc.vvm   v5,v0,v30,v0
                  add        a6, a0, s0
                  vadc.vim   v9,v27,0,v0
                  lui        s1, 21486
                  slti       a1, s1, 618
                  or         s4, a5, s6
                  mulhu      s4, a7, t0
                  vsub.vx    v8,v7,a0
                  lui        tp, 885933
                  rem        t4, t4, s3
                  vmul.vx    v18,v6,gp,v0.t
                  srl        s6, s5, s5
                  mulhsu     s5, s7, a6
                  vslidedown.vi v0,v15,0
                  vfadd.vf   v12,v29,fa1,v0.t
                  sub        t1, s4, s11
                  vsll.vv    v16,v26,v20
                  srli       sp, a7, 3
                  slt        t5, s1, s3
                  lui        a6, 388372
                  vslideup.vx v28,v27,s9
                  and        sp, a3, a4
                  vsub.vv    v7,v22,v2,v0.t
                  vmulh.vv   v5,v12,v3
                  vsub.vx    v29,v15,a7
                  or         sp, s10, a6
                  sltu       t3, tp, s0
                  lui        a2, 736040
                  vsadd.vi   v0,v29,0
                  or         s5, s2, a2
                  vfsub.vf   v0,v21,ft0
                  vmulhu.vv  v16,v26,v0
                  vfsub.vf   v5,v24,ft1
                  vmul.vx    v20,v13,a4
                  slti       s9, a0, 624
                  vmadd.vv   v28,v29,v25,v0.t
                  and        s8, tp, a1
                  vmul.vx    v26,v5,s4,v0.t
                  sra        s10, s10, t5
                  mulhsu     a2, gp, t0
                  sltiu      s0, t0, 560
                  sltiu      s6, a6, 637
                  vsaddu.vx  v2,v24,s9,v0.t
                  lui        s8, 463069
                  slt        t1, s5, a7
                  sltiu      gp, t4, 873
                  div        t1, s7, gp
                  xor        a2, s0, a4
                  mul        t5, s8, t5
                  vslidedown.vx v6,v15,a6
                  slt        a0, zero, s10
                  mulh       zero, t1, s6
                  vsadd.vx   v19,v22,zero,v0.t
                  slli       s0, sp, 31
                  xor        a3, s9, s9
                  mulh       a6, s9, s9
                  lui        a6, 897807
                  andi       zero, s10, 90
                  or         s10, zero, s8
                  slli       s6, s8, 25
                  slt        s9, s5, a2
                  srli       t1, tp, 26
                  vadd.vx    v16,v3,a6,v0.t
                  vsaddu.vv  v13,v1,v18,v0.t
                  rem        t4, zero, a6
                  vslide1up.vx v17,v3,t3
                  andi       s1, s4, 49
                  vfadd.vf   v19,v16,ft10
                  lui        a2, 158060
                  vfsub.vf   v14,v21,fs0,v0.t
                  slt        t4, t1, s5
                  srli       t4, t6, 14
                  mulhu      ra, t0, tp
                  vsll.vv    v25,v0,v12
                  mulhsu     s10, s8, s1
                  vsub.vv    v7,v24,v18,v0.t
                  andi       s7, t3, -287
                  sra        s10, s10, t3
                  xor        a3, zero, s6
                  srai       t5, t5, 17
                  vslide1up.vx v8,v7,s8,v0.t
                  vmulh.vx   v31,v20,a0,v0.t
                  sub        s1, t6, s9
                  srai       t4, a7, 24
                  and        a0, s10, a6
                  lui        s9, 14918
                  vsll.vv    v13,v16,v13,v0.t
                  add        s0, s9, t1
                  mulhu      s4, s8, a0
                  or         s6, a4, s8
                  vfsub.vf   v5,v22,fs0
                  slt        t4, gp, t5
                  ori        t3, t0, 452
                  or         a4, a1, a7
                  vadc.vim   v28,v2,0,v0
                  mulhsu     s3, s3, a7
                  andi       s2, t5, 1009
                  slti       zero, a2, -968
                  vadc.vxm   v23,v1,t2,v0
                  srai       a7, a2, 9
                  sltu       tp, sp, gp
                  sra        zero, t5, s3
                  vsub.vv    v25,v13,v27
                  mulh       s3, sp, s10
                  vmadd.vx   v13,a7,v3
                  vrsub.vx   v1,v23,a3
                  add        ra, gp, t1
                  ori        s7, tp, 888
                  xori       s3, s0, 229
                  vslidedown.vx v12,v9,a6,v0.t
                  or         a7, s2, sp
                  sra        s9, s8, s7
                  divu       t5, t1, s11
                  lui        t0, 689314
                  sltiu      tp, s5, 525
                  vslidedown.vi v12,v15,0
                  vsub.vv    v1,v4,v4,v0.t
                  vfsub.vv   v24,v27,v27,v0.t
                  vslidedown.vx v15,v28,a5,v0.t
                  sltu       s2, t6, sp
                  and        s7, a5, a7
                  vfsub.vv   v3,v22,v14,v0.t
                  ori        s10, s9, -952
                  srl        a4, t1, t6
                  mulh       gp, a5, s8
                  vmulh.vv   v4,v27,v21,v0.t
                  vsub.vv    v10,v26,v6
                  srl        a2, t1, s3
                  srli       t2, s1, 2
                  sra        t0, s7, t5
                  vsub.vx    v16,v28,s6
                  auipc      a0, 795145
                  add        s10, ra, s7
                  vmadd.vx   v0,gp,v18
                  vfadd.vv   v6,v21,v4,v0.t
                  vslideup.vi v23,v10,0
                  auipc      s6, 328954
                  sltiu      a6, s4, 72
                  vmadd.vv   v27,v31,v28
                  mulhsu     t4, s8, s7
                  mulh       s2, s8, gp
                  vsll.vx    v6,v3,t6
                  mulh       s2, a4, s3
                  sub        a1, a7, t4
                  srli       s6, zero, 26
                  vfadd.vv   v7,v16,v16,v0.t
                  slti       a3, a3, -331
                  vsaddu.vv  v25,v0,v9,v0.t
                  mulh       s7, t5, s3
                  vmul.vx    v24,v11,a3,v0.t
                  mulh       s8, tp, a2
                  vadc.vxm   v20,v31,t5,v0
                  vsadd.vi   v28,v6,0,v0.t
                  remu       a4, s8, s2
                  mulhu      s1, t6, s8
                  slt        a6, s9, s9
                  sll        a1, a6, t1
                  sub        t3, s2, s4
                  vsub.vv    v20,v22,v26
                  vmadd.vv   v22,v4,v27,v0.t
                  sltu       s6, t5, s8
                  vsub.vx    v20,v23,tp,v0.t
                  auipc      s10, 719657
                  vslidedown.vi v31,v22,0
                  vsadd.vx   v12,v31,t5
                  vadc.vim   v4,v3,0,v0
                  vmadd.vx   v14,ra,v15
                  vadd.vx    v6,v1,a7,v0.t
                  slti       t3, a6, 451
                  sra        s4, gp, s5
                  andi       s1, a2, -247
                  slli       a7, s5, 6
                  vrsub.vi   v13,v27,0
                  mulh       tp, s0, a7
                  sub        a7, a3, a0
                  vmulhu.vx  v10,v21,t3,v0.t
                  divu       a7, a4, t1
                  add        s0, sp, a7
                  vsadd.vi   v28,v22,0,v0.t
                  xori       s2, a5, 88
                  andi       t4, gp, 310
                  slti       t3, tp, 341
                  mul        s1, s6, t6
                  vrsub.vx   v25,v2,s7
                  vadd.vx    v24,v13,a4
                  vsadd.vx   v0,v29,s11
                  vrsub.vx   v25,v19,tp,v0.t
                  slt        a7, a7, s5
                  mul        s10, zero, a7
                  vslideup.vx v30,v12,t1,v0.t
                  sll        t4, sp, a2
                  srl        a1, t2, a2
                  sra        t4, s2, s11
                  vsaddu.vx  v10,v11,a2
                  vslidedown.vx v21,v5,s4
                  mulhu      a3, t5, s2
                  vadd.vv    v22,v21,v27,v0.t
                  vmulhu.vx  v1,v18,s5
                  vslide1up.vx v14,v12,t3,v0.t
                  mulhu      tp, s10, t3
                  xori       tp, s7, -400
                  vfadd.vv   v13,v25,v24,v0.t
                  ori        s4, t3, -506
                  rem        s4, s2, a7
                  vmulh.vx   v23,v27,t0
                  vsaddu.vv  v21,v29,v24,v0.t
                  addi       a7, s10, 492
                  vsaddu.vv  v2,v17,v24
                  and        a0, t1, t2
                  mulh       a4, a5, s4
                  sub        s10, a4, a7
                  vadd.vx    v15,v0,sp,v0.t
                  vsadd.vx   v27,v7,s3,v0.t
                  vsll.vi    v27,v28,0
                  vadc.vxm   v15,v28,s7,v0
                  div        s5, tp, sp
                  srli       a3, s3, 3
                  vsadd.vi   v6,v14,0
                  mulh       s9, s11, sp
                  vfsub.vf   v20,v4,ft10,v0.t
                  xori       t2, t2, 663
                  divu       a2, a0, s8
                  rem        sp, s10, a5
                  slt        s0, zero, a2
                  vsadd.vv   v28,v27,v5
                  xor        a6, a1, t6
                  xori       a7, s1, 360
                  slti       ra, s5, 545
                  srli       a3, s6, 19
                  div        s2, s11, a5
                  slt        s9, a1, gp
                  mulhsu     s9, ra, s8
                  vslide1up.vx v3,v2,a5,v0.t
                  vsub.vv    v16,v14,v18
                  vadc.vxm   v3,v20,s6,v0
                  sltiu      s1, sp, -945
                  vmulhu.vv  v2,v31,v29
                  sltiu      a4, s1, -591
                  auipc      s10, 905596
                  srli       t3, s11, 26
                  sub        s6, a0, a5
                  vmadd.vv   v12,v17,v18
                  mulhsu     a7, t0, a6
                  lui        s7, 896227
                  srli       tp, t2, 30
                  mulhsu     s2, t4, s4
                  sub        s4, a4, ra
                  andi       a1, a3, 116
                  remu       s3, a7, a1
                  vrsub.vx   v7,v4,t4
                  and        s7, a1, s9
                  vadd.vx    v17,v10,s7
                  vsadd.vi   v15,v7,0,v0.t
                  vfsub.vf   v7,v31,ft3
                  mul        a3, a3, s5
                  or         s6, tp, s10
                  vmulh.vv   v27,v26,v21,v0.t
                  vsadd.vi   v31,v1,0,v0.t
                  sub        t2, a7, ra
                  mulhu      s2, s7, ra
                  vslidedown.vx v0,v18,zero
                  vmulh.vv   v19,v14,v16
                  vmulh.vx   v10,v8,a7
                  sltu       a0, s8, a1
                  vsub.vx    v20,v1,a7,v0.t
                  rem        s4, s2, s6
                  mulh       s0, s1, s2
                  vslide1up.vx v3,v21,t3
                  vsaddu.vi  v1,v28,0
                  div        a7, a2, s8
                  andi       a0, a1, 481
                  slt        s7, s7, s9
                  vsaddu.vx  v9,v16,a7,v0.t
                  mul        a6, t3, a4
                  add        s3, s1, t0
                  vsadd.vx   v8,v8,s0
                  xori       t2, t5, -202
                  auipc      s5, 37437
                  and        s9, t0, s0
                  srli       a7, a2, 30
                  addi       sp, s9, 504
                  mulh       a7, s7, a3
                  slli       t4, s10, 26
                  add        t2, gp, s1
                  vfadd.vf   v17,v15,fs4,v0.t
                  slt        a1, a6, s10
                  vrsub.vx   v22,v3,a0,v0.t
                  vfadd.vv   v14,v4,v0,v0.t
                  mulhsu     t5, t0, tp
                  vmul.vx    v21,v24,t3,v0.t
                  auipc      t3, 811835
                  srai       t4, t4, 5
                  vadc.vim   v3,v26,0,v0
                  lui        a0, 295248
                  div        s7, t3, tp
                  vmulhu.vv  v10,v12,v8
                  sltiu      a3, s5, -189
                  srl        t3, t5, a5
                  mulhu      s10, tp, t2
                  lui        a1, 193865
                  andi       s8, s7, 841
                  xor        t2, t6, s8
                  vmulhu.vv  v1,v21,v30
                  srli       s4, a7, 1
                  remu       s2, s4, t6
                  or         sp, t0, a7
                  vslidedown.vx v17,v1,t5
                  or         t4, s8, s8
                  xor        s6, s1, t6
                  rem        s2, s6, a0
                  vsadd.vx   v21,v31,gp,v0.t
                  slt        t2, a6, a2
                  ori        t5, t6, 218
                  vsaddu.vi  v24,v23,0,v0.t
                  div        a0, a1, a1
                  vslideup.vi v14,v4,0,v0.t
                  mulhu      a6, a3, zero
                  vsadd.vv   v16,v15,v18
                  sub        s8, s0, a7
                  srli       t2, gp, 8
                  rem        t0, a6, a1
                  vslidedown.vi v22,v14,0,v0.t
                  srai       s0, s10, 6
                  xori       s6, a5, -984
                  divu       s1, s11, zero
                  mul        a2, zero, s10
                  mulhu      a1, s3, sp
                  xori       s5, ra, -631
                  vadd.vi    v0,v14,0
                  vsadd.vi   v13,v20,0,v0.t
                  vslidedown.vx v12,v26,a0
                  vslide1up.vx v7,v2,t0,v0.t
                  andi       s8, s8, -815
                  mulhu      sp, t5, a6
                  auipc      t5, 485273
                  and        t1, s0, ra
                  srl        t0, gp, t1
                  vsll.vi    v10,v22,0
                  vmulh.vx   v27,v27,s11,v0.t
                  vfsub.vf   v2,v8,fs4
                  add        t1, s10, s4
                  vfadd.vv   v14,v2,v7
                  vsaddu.vi  v22,v15,0,v0.t
                  vsub.vx    v30,v11,s1
                  vmulhu.vx  v21,v10,a6
                  sltu       s10, t6, s11
                  mulhu      a7, sp, a5
                  sltiu      sp, s9, -901
                  vsadd.vx   v6,v20,t2
                  srai       s0, t4, 29
                  mulhu      s2, s0, t3
                  andi       tp, t2, -181
                  rem        a3, a5, s0
                  sub        a1, t2, t0
                  or         s3, s7, t3
                  vfadd.vv   v0,v13,v18
                  sra        a1, s11, s5
                  mulhsu     s9, s2, s6
                  vsaddu.vv  v14,v31,v3
                  divu       t3, s0, gp
                  vadd.vi    v23,v22,0,v0.t
                  sll        s5, t5, s10
                  vmulhu.vx  v1,v3,s3,v0.t
                  slti       a6, s4, -818
                  and        sp, s8, a0
                  srl        t5, s9, a1
                  sltiu      a7, a4, -929
                  vmul.vx    v31,v3,s8
                  slli       s10, a5, 24
                  ori        t3, s3, 721
                  addi       s7, t4, 199
                  vslide1up.vx v13,v18,s11,v0.t
                  mulhu      sp, s3, a0
                  vfadd.vf   v30,v12,ft10
                  slt        s9, tp, t5
                  sll        a7, tp, s3
                  sltiu      a6, s10, -743
                  vsub.vv    v4,v26,v31,v0.t
                  vmadd.vv   v20,v28,v10
                  vadd.vi    v10,v13,0
                  ori        a7, ra, -605
                  vmulhu.vv  v5,v22,v7
                  vsll.vx    v12,v20,gp
                  or         s4, a1, a1
                  add        ra, a6, a4
                  mulh       gp, s2, t3
                  mulhsu     s0, t6, s9
                  div        sp, t3, t4
                  sltu       t3, a0, s1
                  vmul.vx    v7,v24,s7
                  vsll.vx    v1,v20,s0,v0.t
                  slti       a4, s10, -66
                  remu       t0, t1, a4
                  sltiu      s2, tp, -463
                  or         a3, t0, a2
                  vsub.vx    v5,v16,a6
                  vsaddu.vv  v18,v29,v28
                  ori        s10, t6, 673
                  sltu       t2, s11, a6
                  sll        tp, a7, s6
                  or         t2, a4, s6
                  vsll.vv    v29,v9,v22
                  divu       s4, s5, s0
                  addi       a2, s1, 896
                  vmul.vx    v14,v9,s2,v0.t
                  sll        s2, s3, s3
                  vfadd.vf   v12,v4,ft3,v0.t
                  vslideup.vi v12,v13,0,v0.t
                  srli       s7, tp, 12
                  lui        t2, 919502
                  rem        a1, s7, s6
                  vslide1up.vx v18,v22,a1
                  vadd.vi    v24,v26,0,v0.t
                  or         a7, t1, s0
                  slli       s4, s1, 22
                  remu       t1, t1, s2
                  vmulh.vx   v2,v17,t4
                  mulhu      zero, t2, t6
                  vrsub.vx   v24,v16,ra,v0.t
                  xori       t5, sp, 866
                  slti       tp, t0, -88
                  slti       a2, s1, 332
                  remu       s9, t0, a5
                  vmadd.vv   v29,v30,v31,v0.t
                  vslide1up.vx v10,v6,s8
                  mulhu      ra, a1, s1
                  sra        s9, s3, s1
                  sub        s10, t0, a3
                  vslidedown.vx v0,v18,ra
                  srli       s3, s0, 15
                  vslide1up.vx v29,v27,t5,v0.t
                  mulhu      sp, zero, s3
                  mulhu      a0, sp, a7
                  vslideup.vi v8,v22,0,v0.t
                  addi       s3, t1, 12
                  srl        s3, s0, t6
                  vmul.vv    v6,v25,v2
                  srai       t4, s3, 17
                  lui        a3, 927040
                  sub        s1, s5, tp
                  or         s9, s5, s5
                  vsub.vx    v19,v25,gp
                  vslideup.vi v19,v15,0,v0.t
                  vsll.vx    v23,v19,a4
                  sra        s0, a4, a4
                  srl        s7, s0, s9
                  remu       s4, s6, s1
                  xori       a6, s6, -588
                  vmulhu.vv  v26,v9,v13
                  slli       s3, t5, 23
                  vmulh.vv   v7,v7,v17,v0.t
                  vslide1up.vx v17,v5,a3,v0.t
                  divu       s8, s10, gp
                  vsub.vv    v28,v24,v4,v0.t
                  srl        ra, s10, s5
                  vslide1up.vx v23,v20,s6,v0.t
                  slli       s2, a0, 22
                  vslideup.vi v22,v21,0,v0.t
                  auipc      t3, 457875
                  mulh       a2, sp, a7
                  andi       a2, s3, -278
                  mulhsu     s5, a4, a2
                  vsub.vx    v27,v21,s6
                  vmulh.vv   v18,v22,v9,v0.t
                  vsadd.vi   v25,v5,0,v0.t
                  or         s1, a3, tp
                  srai       s6, gp, 5
                  vmulh.vv   v19,v25,v3
                  remu       a7, ra, ra
                  remu       t1, t6, s2
                  sub        ra, a2, t0
                  or         gp, zero, s1
                  vfadd.vv   v8,v13,v13,v0.t
                  or         a2, t3, s9
                  vfsub.vf   v4,v23,fs3,v0.t
                  srli       sp, a7, 26
                  srl        zero, s7, s4
                  div        ra, t4, s7
                  remu       s9, s11, t6
                  lui        s10, 607630
                  vfadd.vf   v24,v7,fs9,v0.t
                  slli       t0, t6, 0
                  or         sp, a4, t6
                  add        a2, t4, a0
                  lui        s5, 729759
                  ori        a6, s0, -111
                  lui        t2, 62921
                  vmulh.vx   v5,v7,a0
                  and        sp, a2, t1
                  vmulh.vv   v30,v13,v14
                  vslide1up.vx v19,v26,t5,v0.t
                  srai       t3, a1, 20
                  vslide1up.vx v28,v5,t5,v0.t
                  srai       s1, s4, 0
                  vadc.vim   v2,v3,0,v0
                  sltu       ra, s5, a1
                  vmul.vx    v31,v6,a1
                  vmulh.vx   v23,v11,t5,v0.t
                  vmadd.vx   v7,s3,v8,v0.t
                  remu       a6, s9, s10
                  vfsub.vv   v10,v2,v27
                  sll        t0, gp, tp
                  vadd.vi    v6,v12,0,v0.t
                  sra        a3, sp, sp
                  mulh       t2, gp, a0
                  sltu       t3, s8, a7
                  vslide1up.vx v12,v13,t0,v0.t
                  vsaddu.vx  v22,v9,s11,v0.t
                  vslide1up.vx v7,v28,s4
                  slli       tp, a2, 6
                  vadd.vi    v24,v7,0,v0.t
                  div        a2, a6, t1
                  mulhsu     a7, s6, s9
                  sltiu      s5, t3, 810
                  ori        a2, s3, 885
                  vadd.vx    v4,v31,s0,v0.t
                  vsadd.vv   v24,v20,v15,v0.t
                  slti       s6, a6, -508
                  sll        tp, t2, s2
                  vmulh.vv   v11,v19,v21
                  sll        s0, s3, t1
                  mulhsu     s9, zero, t2
                  sub        s10, a0, a7
                  lui        t3, 50339
                  sra        t3, tp, s5
                  vfsub.vf   v29,v29,ft2,v0.t
                  mulhsu     t3, s7, a7
                  vfsub.vv   v31,v5,v8,v0.t
                  vmulh.vv   v8,v9,v14
                  vslidedown.vx v23,v20,a5,v0.t
                  vmulhu.vx  v0,v28,s9
                  slt        sp, a3, a6
                  sll        s8, a0, a7
                  sltu       s8, t2, s2
                  vfadd.vf   v26,v27,ft4,v0.t
                  sltiu      t0, t4, 121
                  sra        sp, s5, t0
                  add        sp, a7, t6
                  ori        a4, t2, 935
                  vmulh.vv   v27,v21,v19,v0.t
                  vsaddu.vv  v24,v24,v0
                  slli       a6, s11, 7
                  lui        a0, 842945
                  andi       t5, s3, -568
                  vslide1up.vx v12,v23,t0
                  div        tp, s11, t6
                  vfadd.vf   v16,v20,fa0,v0.t
                  slli       sp, gp, 21
                  add        s8, a1, s8
                  mul        t1, a3, t5
                  mulh       t3, a6, ra
                  srai       a2, s5, 8
                  xor        s1, a4, t6
                  vadd.vv    v19,v25,v6,v0.t
                  xor        s3, s5, t3
                  sub        a4, s11, a5
                  xori       s1, s11, 672
                  sub        a3, sp, s1
                  vfsub.vv   v22,v18,v17
                  addi       s0, a0, 358
                  sra        a6, t5, s8
                  vslide1up.vx v13,v29,s7,v0.t
                  vsadd.vi   v1,v0,0
                  add        a3, s0, t3
                  addi       tp, a2, 830
                  mulh       t1, sp, a7
                  sltiu      tp, a3, -217
                  vmadd.vx   v19,gp,v10,v0.t
                  vmul.vx    v4,v7,t0
                  ori        s5, a3, -938
                  vmulh.vv   v9,v5,v11,v0.t
                  andi       t5, tp, 914
                  srli       s2, a1, 15
                  lui        s9, 278973
                  vslide1up.vx v27,v19,t2,v0.t
                  vrsub.vi   v27,v27,0,v0.t
                  add        s8, ra, s6
                  vmulh.vx   v21,v11,s5
                  vsll.vx    v23,v26,a3
                  remu       s4, a7, sp
                  srl        a1, t5, a0
                  div        sp, a7, a6
                  rem        t5, s10, a1
                  vslidedown.vx v6,v5,t1
                  rem        s10, a4, t3
                  sltiu      a2, zero, -199
                  vslide1up.vx v31,v4,a5,v0.t
                  sltu       t0, t1, s9
                  vslide1up.vx v4,v3,a1
                  sltu       s7, s8, a3
                  vsll.vv    v29,v25,v12,v0.t
                  or         a7, sp, s8
                  vsaddu.vx  v15,v26,ra,v0.t
                  sub        s6, a5, ra
                  vmul.vv    v23,v27,v6
                  vslidedown.vx v31,v1,t2
                  mulhu      a6, s0, s11
                  vslide1up.vx v27,v5,s0,v0.t
                  vmulh.vv   v18,v13,v7
                  andi       s1, t4, -344
                  srli       s2, a4, 26
                  vadc.vim   v28,v29,0,v0
                  slti       s5, a0, -452
                  vslideup.vi v16,v20,0
                  andi       zero, s11, -86
                  sltiu      s1, t1, -466
                  vslideup.vi v18,v23,0,v0.t
                  sll        s7, s8, sp
                  vfsub.vv   v23,v25,v29,v0.t
                  vmadd.vv   v31,v2,v9
                  xori       t4, a1, -155
                  andi       t4, s4, 54
                  slti       a7, sp, 372
                  vadc.vxm   v12,v21,sp,v0
                  slli       a1, s2, 31
                  ori        t3, t4, 687
                  add        zero, s2, a2
                  sltiu      gp, a6, -825
                  sltu       a4, s2, gp
                  slti       t0, s0, 241
                  mul        s6, s4, s4
                  andi       tp, ra, 330
                  vfadd.vf   v7,v21,ft7
                  vmul.vv    v26,v18,v7
                  srl        tp, zero, a5
                  vsll.vv    v26,v11,v9,v0.t
                  slt        t0, s0, s5
                  vmadd.vx   v14,zero,v24,v0.t
                  slti       s10, t4, -379
                  vfadd.vv   v13,v26,v29,v0.t
                  vslide1up.vx v13,v6,t1,v0.t
                  remu       t2, s9, tp
                  mul        s0, t6, s2
                  sltu       a0, t4, s2
                  ori        s1, s5, -573
                  vfsub.vv   v5,v27,v7,v0.t
                  vfsub.vf   v26,v0,fs2
                  vslideup.vx v18,v27,sp
                  divu       s1, t6, a5
                  mulhsu     s2, s11, s1
                  vsaddu.vi  v11,v27,0,v0.t
                  slti       t1, s0, -980
                  vsub.vx    v3,v15,s2,v0.t
                  vadc.vim   v10,v12,0,v0
                  vmulh.vx   v20,v7,t1,v0.t
                  lui        s0, 50818
                  vrsub.vi   v25,v30,0,v0.t
                  divu       a2, t2, t5
                  vadc.vvm   v17,v11,v6,v0
                  vslide1up.vx v4,v3,t1
                  srai       t2, tp, 28
                  add        t5, s10, s8
                  sll        s0, t2, sp
                  slli       a2, a4, 31
                  mul        s3, ra, s4
                  vadd.vx    v31,v31,t3,v0.t
                  xor        a3, zero, a4
                  vslide1up.vx v18,v28,a0
                  vrsub.vx   v2,v28,s11,v0.t
                  xor        s9, a1, a7
                  vadc.vvm   v18,v0,v8,v0
                  sll        s10, t5, t6
                  slli       t4, s4, 19
                  sll        s2, s10, t6
                  sltiu      s10, sp, 221
                  auipc      s0, 399845
                  addi       s9, s4, -924
                  slli       a4, s0, 13
                  srai       a7, s5, 16
                  vsub.vv    v18,v28,v4,v0.t
                  xori       sp, s5, 135
                  vslide1up.vx v11,v25,s11,v0.t
                  vadd.vv    v3,v10,v15
                  sub        gp, t5, a5
                  srai       a2, s7, 28
                  sltiu      s5, s2, 410
                  mulhu      s6, s9, s9
                  srl        s4, a0, s8
                  srl        a1, a6, zero
                  vmul.vv    v31,v28,v10
                  remu       s2, t6, a6
                  auipc      a4, 836266
                  sub        s9, t2, a0
                  add        s2, zero, a4
                  vadd.vi    v23,v22,0,v0.t
                  xori       sp, s1, 746
                  vadc.vvm   v11,v27,v15,v0
                  vadc.vvm   v3,v6,v2,v0
                  addi       s2, a3, -920
                  or         s5, a3, t3
                  mulhsu     a2, s3, s0
                  lui        t4, 506222
                  mulhsu     s3, t0, s3
                  mul        a4, s0, s8
                  divu       s1, s4, t5
                  vslide1up.vx v23,v21,s7
                  vsaddu.vi  v6,v1,0,v0.t
                  vmul.vx    v23,v26,s6,v0.t
                  vmul.vx    v4,v21,t1
                  vsadd.vv   v9,v4,v18,v0.t
                  remu       sp, a2, a6
                  slli       s2, s8, 24
                  andi       s7, s9, 747
                  sra        s2, a0, t3
                  vslidedown.vi v0,v1,0
                  vsaddu.vx  v0,v3,s4
                  vsll.vv    v25,v4,v30
                  xori       s10, t0, -974
                  vslide1up.vx v16,v20,s5
                  vrsub.vi   v30,v14,0,v0.t
                  vrsub.vx   v2,v0,t1,v0.t
                  vmulhu.vx  v6,v19,t1,v0.t
                  lui        t4, 415583
                  sub        s9, a2, a3
                  vsub.vv    v9,v11,v15
                  vsub.vx    v4,v31,s0,v0.t
                  sub        s1, t2, tp
                  la x27, test_done
                  jalr x0, x27, 0
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
                  1: addi x31, x31, -124
                  sw  x1, 4(x31)
                  sw  x2, 8(x31)
                  sw  x3, 12(x31)
                  sw  x4, 16(x31)
                  sw  x5, 20(x31)
                  sw  x6, 24(x31)
                  sw  x7, 28(x31)
                  sw  x8, 32(x31)
                  sw  x9, 36(x31)
                  sw  x10, 40(x31)
                  sw  x11, 44(x31)
                  sw  x12, 48(x31)
                  sw  x13, 52(x31)
                  sw  x14, 56(x31)
                  sw  x15, 60(x31)
                  sw  x16, 64(x31)
                  sw  x17, 68(x31)
                  sw  x18, 72(x31)
                  sw  x19, 76(x31)
                  sw  x20, 80(x31)
                  sw  x21, 84(x31)
                  sw  x22, 88(x31)
                  sw  x23, 92(x31)
                  sw  x24, 96(x31)
                  sw  x25, 100(x31)
                  sw  x26, 104(x31)
                  sw  x27, 108(x31)
                  sw  x28, 112(x31)
                  sw  x29, 116(x31)
                  sw  x30, 120(x31)
                  sw  x31, 124(x31)
                  csrr x30, 0x341 # MEPC
                  csrr x30, 0x342 # MCAUSE
                  li x16, 0x3 # BREAKPOINT
                  beq x30, x16, ebreak_handler
                  li x16, 0x8 # ECALL_UMODE
                  beq x30, x16, ecall_handler
                  li x16, 0x9 # ECALL_SMODE
                  beq x30, x16, ecall_handler
                  li x16, 0xb # ECALL_MMODE
                  beq x30, x16, ecall_handler
                  li x16, 0x1
                  beq x30, x16, instr_fault_handler
                  li x16, 0x5
                  beq x30, x16, load_fault_handler
                  li x16, 0x7
                  beq x30, x16, store_fault_handler
                  li x16, 0xc
                  beq x30, x16, pt_fault_handler
                  li x16, 0xd
                  beq x30, x16, pt_fault_handler
                  li x16, 0xf
                  beq x30, x16, pt_fault_handler
                  li x16, 0x2 # ILLEGAL_INSTRUCTION
                  beq x30, x16, illegal_instr_handler
                  csrr x16, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

ecall_handler:    
                  la x30, _start
                  sw x0, 0(x30)
                  sw x1, 4(x30)
                  sw x2, 8(x30)
                  sw x3, 12(x30)
                  sw x4, 16(x30)
                  sw x5, 20(x30)
                  sw x6, 24(x30)
                  sw x7, 28(x30)
                  sw x8, 32(x30)
                  sw x9, 36(x30)
                  sw x10, 40(x30)
                  sw x11, 44(x30)
                  sw x12, 48(x30)
                  sw x13, 52(x30)
                  sw x14, 56(x30)
                  sw x15, 60(x30)
                  sw x16, 64(x30)
                  sw x17, 68(x30)
                  sw x18, 72(x30)
                  sw x19, 76(x30)
                  sw x20, 80(x30)
                  sw x21, 84(x30)
                  sw x22, 88(x30)
                  sw x23, 92(x30)
                  sw x24, 96(x30)
                  sw x25, 100(x30)
                  sw x26, 104(x30)
                  sw x27, 108(x30)
                  sw x28, 112(x30)
                  sw x29, 116(x30)
                  sw x30, 120(x30)
                  sw x31, 124(x30)
                  la x27, write_tohost
                  jalr x0, x27, 0

instr_fault_handler:
                  li x30, 0
                  csrw 0x340, x30
                  li x11, 0
                  0: csrr x30, 0x340
                  mv x27, x30
                  li x27, 0
                  beq x30, x27, 1f
                  1: csrr x16, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  17: li x13, 4
                  csrr x30, 0x340
                  slli x30, x30, 30
                  srli x30, x30, 30
                  sub x27, x13, x30
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x9, x27
                  slli x30, x30, 3
                  add x27, x27, x30
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x30, 1
                  beq x27, x30, 21f
                  li x30, 2
                  beq x27, x30, 25f
                  li x30, 3
                  beq x27, x30, 27f
                  la x30, test_done
                  jalr x0, x30, 0
                  18: csrr x30, 0x340
                  mv x11, x16
                  addi x30, x30, 1
                  csrw 0x340, x30
                  li x16, 1
                  ble x16, x30, 19f
                  j 0b
                  19: la x30, test_done
                  jalr x0, x30, 0
                  20: j 18b
                  21: csrr x30, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x30, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x11, x27, 18b
                  23: bleu x16, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 24f
                  la x30, test_done
                  jalr x0, x30, 0
                  24: j 29f
                  25: csrr x30, 0x343
                  srli x30, x30, 2
                  slli x27, x16, 2
                  srli x27, x27, 2
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 26f
                  la x30, test_done
                  jalr x0, x30, 0
                  26: j 29f
                  27: csrr x30, 0x343
                  srli x30, x30, 2
                  srli x30, x30, 0
                  slli x30, x30, 0
                  slli x27, x16, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 29f
                  la x30, test_done
                  jalr x0, x30, 0
                  28: j 29f
                  29: ori x13, x13, 4
                  csrr x30, 0x340
                  li x27, 30
                  sll x30, x30, x27
                  srl x30, x30, x27
                  slli x27, x30, 3
                  sll x13, x13, x27
                  or x9, x9, x13
                  csrr x30, 0x340
                  srli x30, x30, 2
                  beqz x30, 30f
                  li x27, 1
                  beq x30, x27, 31f
                  li x27, 2
                  beq x30, x27, 32f
                  li x27, 3
                  beq x30, x27, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
                  mret

load_fault_handler:
                  li x30, 0
                  csrw 0x340, x30
                  li x11, 0
                  0: csrr x30, 0x340
                  mv x27, x30
                  li x27, 0
                  beq x30, x27, 1f
                  1: csrr x16, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  17: li x13, 4
                  csrr x30, 0x340
                  slli x30, x30, 30
                  srli x30, x30, 30
                  sub x27, x13, x30
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x9, x27
                  slli x30, x30, 3
                  add x27, x27, x30
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x30, 1
                  beq x27, x30, 21f
                  li x30, 2
                  beq x27, x30, 25f
                  li x30, 3
                  beq x27, x30, 27f
                  la x30, test_done
                  jalr x0, x30, 0
                  18: csrr x30, 0x340
                  mv x11, x16
                  addi x30, x30, 1
                  csrw 0x340, x30
                  li x16, 1
                  ble x16, x30, 19f
                  j 0b
                  19: la x30, test_done
                  jalr x0, x30, 0
                  20: j 18b
                  21: csrr x30, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x30, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x11, x27, 18b
                  23: bleu x16, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 24f
                  la x30, test_done
                  jalr x0, x30, 0
                  24: j 29f
                  25: csrr x30, 0x343
                  srli x30, x30, 2
                  slli x27, x16, 2
                  srli x27, x27, 2
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 26f
                  la x30, test_done
                  jalr x0, x30, 0
                  26: j 29f
                  27: csrr x30, 0x343
                  srli x30, x30, 2
                  srli x30, x30, 0
                  slli x30, x30, 0
                  slli x27, x16, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 29f
                  la x30, test_done
                  jalr x0, x30, 0
                  28: j 29f
                  29: ori x13, x13, 1
                  csrr x30, 0x340
                  li x27, 30
                  sll x30, x30, x27
                  srl x30, x30, x27
                  slli x27, x30, 3
                  sll x13, x13, x27
                  or x9, x9, x13
                  csrr x30, 0x340
                  srli x30, x30, 2
                  beqz x30, 30f
                  li x27, 1
                  beq x30, x27, 31f
                  li x27, 2
                  beq x30, x27, 32f
                  li x27, 3
                  beq x30, x27, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
                  mret

store_fault_handler:
                  li x30, 0
                  csrw 0x340, x30
                  li x11, 0
                  0: csrr x30, 0x340
                  mv x27, x30
                  li x27, 0
                  beq x30, x27, 1f
                  1: csrr x16, 0x3b0
                  csrr x9, 0x3a0
                  j 17f
                  17: li x13, 4
                  csrr x30, 0x340
                  slli x30, x30, 30
                  srli x30, x30, 30
                  sub x27, x13, x30
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x13, x9, x27
                  slli x30, x30, 3
                  add x27, x27, x30
                  srl x13, x13, x27
                  slli x27, x13, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x30, 1
                  beq x27, x30, 21f
                  li x30, 2
                  beq x27, x30, 25f
                  li x30, 3
                  beq x27, x30, 27f
                  la x30, test_done
                  jalr x0, x30, 0
                  18: csrr x30, 0x340
                  mv x11, x16
                  addi x30, x30, 1
                  csrw 0x340, x30
                  li x16, 1
                  ble x16, x30, 19f
                  j 0b
                  19: la x30, test_done
                  jalr x0, x30, 0
                  20: j 18b
                  21: csrr x30, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x30, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x11, x27, 18b
                  23: bleu x16, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 24f
                  la x30, test_done
                  jalr x0, x30, 0
                  24: j 29f
                  25: csrr x30, 0x343
                  srli x30, x30, 2
                  slli x27, x16, 2
                  srli x27, x27, 2
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 26f
                  la x30, test_done
                  jalr x0, x30, 0
                  26: j 29f
                  27: csrr x30, 0x343
                  srli x30, x30, 2
                  srli x30, x30, 0
                  slli x30, x30, 0
                  slli x27, x16, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x30, x27, 18b
                  andi x27, x13, 128
                  beqz x27, 29f
                  la x30, test_done
                  jalr x0, x30, 0
                  28: j 29f
                  29: ori x13, x13, 3
                  csrr x30, 0x340
                  li x27, 30
                  sll x30, x30, x27
                  srl x30, x30, x27
                  slli x27, x30, 3
                  sll x13, x13, x27
                  or x9, x9, x13
                  csrr x30, 0x340
                  srli x30, x30, 2
                  beqz x30, 30f
                  li x27, 1
                  beq x30, x27, 31f
                  li x27, 2
                  beq x30, x27, 32f
                  li x27, 3
                  beq x30, x27, 33f
                  30: csrw 0x3a0, x9
                  j 34f
                  31: csrw 0x3a1, x9
                  j 34f
                  32: csrw 0x3a2, x9
                  j 34f
                  33: csrw 0x3a3, x9
                  34: nop
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
                  mret

ebreak_handler:   
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
                  mret

illegal_instr_handler:
                  csrr  x30, 0x341
                  addi  x30, x30, 4
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x30, 0x300 # MSTATUS;
                  csrr  x30, 0x304 # MIE;
                  csrr  x30, 0x344 # MIP;
                  csrrc x30, 0x344, x30 # MIP;
                  lw  x1, 4(x31)
                  lw  x2, 8(x31)
                  lw  x3, 12(x31)
                  lw  x4, 16(x31)
                  lw  x5, 20(x31)
                  lw  x6, 24(x31)
                  lw  x7, 28(x31)
                  lw  x8, 32(x31)
                  lw  x9, 36(x31)
                  lw  x10, 40(x31)
                  lw  x11, 44(x31)
                  lw  x12, 48(x31)
                  lw  x13, 52(x31)
                  lw  x14, 56(x31)
                  lw  x15, 60(x31)
                  lw  x16, 64(x31)
                  lw  x17, 68(x31)
                  lw  x18, 72(x31)
                  lw  x19, 76(x31)
                  lw  x20, 80(x31)
                  lw  x21, 84(x31)
                  lw  x22, 88(x31)
                  lw  x23, 92(x31)
                  lw  x24, 96(x31)
                  lw  x25, 100(x31)
                  lw  x26, 104(x31)
                  lw  x27, 108(x31)
                  lw  x28, 112(x31)
                  lw  x29, 116(x31)
                  lw  x30, 120(x31)
                  lw  x31, 124(x31)
                  addi x31, x31, 124
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
