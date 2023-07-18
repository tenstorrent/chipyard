.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x27, 0x40201123
                  csrw 0x301, x27
                  csrr x31, 0x301
kernel_sp:        
                  la x20, kernel_stack_end

trap_vec_init:    
                  la x27, mtvec_handler
                  ori x27, x27, 1

mepc_setup:       
                  la x27, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0xf81e162d
                  li x3, 0x19a81ff
                  li x4, 0x3ab986f6
                  li x5, 0xacf0a408
                  li x6, 0xf6af5155
                  li x7, 0x70751987
                  li x8, 0xffbae27a
                  li x9, 0xfead5940
                  li x10, 0xaee181c5
                  li x11, 0xac7f5832
                  li x12, 0xf49e32ef
                  li x13, 0xf0237cfa
                  li x14, 0xf20990c6
                  li x15, 0x795a561c
                  li x17, 0x80000000
                  li x18, 0x36fdc06c
                  li x19, 0x120ed09c
                  li x21, 0xfb0d4bc4
                  li x22, 0xffe70896
                  li x23, 0xa402db6c
                  li x24, 0x80000000
                  li x25, 0xafbb8c81
                  li x26, 0xa7ff5125
                  li x27, 0xfd7066e7
                  li x28, 0xfd5e45d8
                  li x29, 0x80000000
                  li x30, 0x1aceda52
                  li x31, 0x80000000
                  la x16, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x21, 8
                  vsetvli x27, x21, e16, m1
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
                  li x27, 0xbd8cc0e8
                  vslide1up.vx v0, v1, x27
                  vmv.v.v v0, v0
                  li x27, 0x650cef55
                  vslide1up.vx v0, v1, x27
                  vmv.v.v v0, v0
                  li x27, 0x96e2c65a
                  vslide1up.vx v0, v1, x27
                  vmv.v.v v0, v0
                  li x27, 0x9edd9a7
                  vslide1up.vx v0, v1, x27
                  li x27, 0xeacd1235
                  vslide1up.vx v1, v0, x27
                  vmv.v.v v0, v1
                  li x27, 0x7a77a1ab
                  vslide1up.vx v1, v0, x27
                  vmv.v.v v0, v1
                  li x27, 0x9b90afc3
                  vslide1up.vx v1, v0, x27
                  vmv.v.v v0, v1
                  li x27, 0xde83a8ee
                  vslide1up.vx v1, v0, x27
                  li x27, 0xc7c23394
                  vslide1up.vx v2, v0, x27
                  vmv.v.v v0, v2
                  li x27, 0x7cd915bf
                  vslide1up.vx v2, v0, x27
                  vmv.v.v v0, v2
                  li x27, 0xa88499b3
                  vslide1up.vx v2, v0, x27
                  vmv.v.v v0, v2
                  li x27, 0x44d2588e
                  vslide1up.vx v2, v0, x27
                  li x27, 0xb31c23c0
                  vslide1up.vx v3, v0, x27
                  vmv.v.v v0, v3
                  li x27, 0xfafa14fe
                  vslide1up.vx v3, v0, x27
                  vmv.v.v v0, v3
                  li x27, 0xa8d56ed7
                  vslide1up.vx v3, v0, x27
                  vmv.v.v v0, v3
                  li x27, 0xb9509d86
                  vslide1up.vx v3, v0, x27
                  li x27, 0x7b9e1580
                  vslide1up.vx v4, v0, x27
                  vmv.v.v v0, v4
                  li x27, 0x6ae74bc4
                  vslide1up.vx v4, v0, x27
                  vmv.v.v v0, v4
                  li x27, 0x98d24554
                  vslide1up.vx v4, v0, x27
                  vmv.v.v v0, v4
                  li x27, 0xa5c8f3bc
                  vslide1up.vx v4, v0, x27
                  li x27, 0x442fe696
                  vslide1up.vx v5, v0, x27
                  vmv.v.v v0, v5
                  li x27, 0x6aa310ba
                  vslide1up.vx v5, v0, x27
                  vmv.v.v v0, v5
                  li x27, 0x516ddc12
                  vslide1up.vx v5, v0, x27
                  vmv.v.v v0, v5
                  li x27, 0xa8af3df6
                  vslide1up.vx v5, v0, x27
                  li x27, 0x17039be9
                  vslide1up.vx v6, v0, x27
                  vmv.v.v v0, v6
                  li x27, 0xa4953aaf
                  vslide1up.vx v6, v0, x27
                  vmv.v.v v0, v6
                  li x27, 0x749aeb34
                  vslide1up.vx v6, v0, x27
                  vmv.v.v v0, v6
                  li x27, 0x2c595b53
                  vslide1up.vx v6, v0, x27
                  li x27, 0xcc5b84b3
                  vslide1up.vx v7, v0, x27
                  vmv.v.v v0, v7
                  li x27, 0x8a19ba11
                  vslide1up.vx v7, v0, x27
                  vmv.v.v v0, v7
                  li x27, 0xf2d0de3d
                  vslide1up.vx v7, v0, x27
                  vmv.v.v v0, v7
                  li x27, 0xc7da676c
                  vslide1up.vx v7, v0, x27
                  li x27, 0xa1fb9b79
                  vslide1up.vx v8, v0, x27
                  vmv.v.v v0, v8
                  li x27, 0xc3b29501
                  vslide1up.vx v8, v0, x27
                  vmv.v.v v0, v8
                  li x27, 0xa1a23d4c
                  vslide1up.vx v8, v0, x27
                  vmv.v.v v0, v8
                  li x27, 0xb9fb24b4
                  vslide1up.vx v8, v0, x27
                  li x27, 0x7d02b5c3
                  vslide1up.vx v9, v0, x27
                  vmv.v.v v0, v9
                  li x27, 0x87c3c5f6
                  vslide1up.vx v9, v0, x27
                  vmv.v.v v0, v9
                  li x27, 0xf7135da8
                  vslide1up.vx v9, v0, x27
                  vmv.v.v v0, v9
                  li x27, 0x811bf4cd
                  vslide1up.vx v9, v0, x27
                  li x27, 0x399b528b
                  vslide1up.vx v10, v0, x27
                  vmv.v.v v0, v10
                  li x27, 0xdd23c836
                  vslide1up.vx v10, v0, x27
                  vmv.v.v v0, v10
                  li x27, 0x8c317c37
                  vslide1up.vx v10, v0, x27
                  vmv.v.v v0, v10
                  li x27, 0xa734bf56
                  vslide1up.vx v10, v0, x27
                  li x27, 0x4e458b49
                  vslide1up.vx v11, v0, x27
                  vmv.v.v v0, v11
                  li x27, 0x5a316d2f
                  vslide1up.vx v11, v0, x27
                  vmv.v.v v0, v11
                  li x27, 0x14ff367f
                  vslide1up.vx v11, v0, x27
                  vmv.v.v v0, v11
                  li x27, 0xa474d4cc
                  vslide1up.vx v11, v0, x27
                  li x27, 0x45a56190
                  vslide1up.vx v12, v0, x27
                  vmv.v.v v0, v12
                  li x27, 0x35355a06
                  vslide1up.vx v12, v0, x27
                  vmv.v.v v0, v12
                  li x27, 0xa755552a
                  vslide1up.vx v12, v0, x27
                  vmv.v.v v0, v12
                  li x27, 0x7a791844
                  vslide1up.vx v12, v0, x27
                  li x27, 0xf3f1259
                  vslide1up.vx v13, v0, x27
                  vmv.v.v v0, v13
                  li x27, 0xf4f15233
                  vslide1up.vx v13, v0, x27
                  vmv.v.v v0, v13
                  li x27, 0x489c74c6
                  vslide1up.vx v13, v0, x27
                  vmv.v.v v0, v13
                  li x27, 0x47d8f55e
                  vslide1up.vx v13, v0, x27
                  li x27, 0x5dacf7c8
                  vslide1up.vx v14, v0, x27
                  vmv.v.v v0, v14
                  li x27, 0xf90dfb2b
                  vslide1up.vx v14, v0, x27
                  vmv.v.v v0, v14
                  li x27, 0x34bfba10
                  vslide1up.vx v14, v0, x27
                  vmv.v.v v0, v14
                  li x27, 0xf2cc9e8b
                  vslide1up.vx v14, v0, x27
                  li x27, 0x6c3f694f
                  vslide1up.vx v15, v0, x27
                  vmv.v.v v0, v15
                  li x27, 0xbfbcd14d
                  vslide1up.vx v15, v0, x27
                  vmv.v.v v0, v15
                  li x27, 0x8120ac44
                  vslide1up.vx v15, v0, x27
                  vmv.v.v v0, v15
                  li x27, 0x760608f5
                  vslide1up.vx v15, v0, x27
                  li x27, 0x6ca35b0b
                  vslide1up.vx v16, v0, x27
                  vmv.v.v v0, v16
                  li x27, 0x1ce8b48e
                  vslide1up.vx v16, v0, x27
                  vmv.v.v v0, v16
                  li x27, 0xc3e998c
                  vslide1up.vx v16, v0, x27
                  vmv.v.v v0, v16
                  li x27, 0x48efbc4d
                  vslide1up.vx v16, v0, x27
                  li x27, 0xbcdfa287
                  vslide1up.vx v17, v0, x27
                  vmv.v.v v0, v17
                  li x27, 0x2ee54917
                  vslide1up.vx v17, v0, x27
                  vmv.v.v v0, v17
                  li x27, 0xdad33df2
                  vslide1up.vx v17, v0, x27
                  vmv.v.v v0, v17
                  li x27, 0x7da1bd34
                  vslide1up.vx v17, v0, x27
                  li x27, 0x7be56318
                  vslide1up.vx v18, v0, x27
                  vmv.v.v v0, v18
                  li x27, 0x7664a0c6
                  vslide1up.vx v18, v0, x27
                  vmv.v.v v0, v18
                  li x27, 0x6b98d85
                  vslide1up.vx v18, v0, x27
                  vmv.v.v v0, v18
                  li x27, 0xf00631d9
                  vslide1up.vx v18, v0, x27
                  li x27, 0x598cbdd5
                  vslide1up.vx v19, v0, x27
                  vmv.v.v v0, v19
                  li x27, 0x834eb637
                  vslide1up.vx v19, v0, x27
                  vmv.v.v v0, v19
                  li x27, 0x504046c1
                  vslide1up.vx v19, v0, x27
                  vmv.v.v v0, v19
                  li x27, 0xd50bb26c
                  vslide1up.vx v19, v0, x27
                  li x27, 0x115330c5
                  vslide1up.vx v20, v0, x27
                  vmv.v.v v0, v20
                  li x27, 0xe9f8da66
                  vslide1up.vx v20, v0, x27
                  vmv.v.v v0, v20
                  li x27, 0x3f5cfabb
                  vslide1up.vx v20, v0, x27
                  vmv.v.v v0, v20
                  li x27, 0xddfcacf5
                  vslide1up.vx v20, v0, x27
                  li x27, 0xe7040115
                  vslide1up.vx v21, v0, x27
                  vmv.v.v v0, v21
                  li x27, 0x1f2d0635
                  vslide1up.vx v21, v0, x27
                  vmv.v.v v0, v21
                  li x27, 0x79b5af14
                  vslide1up.vx v21, v0, x27
                  vmv.v.v v0, v21
                  li x27, 0x36af8081
                  vslide1up.vx v21, v0, x27
                  li x27, 0x9eeb70bf
                  vslide1up.vx v22, v0, x27
                  vmv.v.v v0, v22
                  li x27, 0xf7ca28d7
                  vslide1up.vx v22, v0, x27
                  vmv.v.v v0, v22
                  li x27, 0x737b1755
                  vslide1up.vx v22, v0, x27
                  vmv.v.v v0, v22
                  li x27, 0xfd15b7b5
                  vslide1up.vx v22, v0, x27
                  li x27, 0x31ece714
                  vslide1up.vx v23, v0, x27
                  vmv.v.v v0, v23
                  li x27, 0xaa33d45a
                  vslide1up.vx v23, v0, x27
                  vmv.v.v v0, v23
                  li x27, 0x6df82b7b
                  vslide1up.vx v23, v0, x27
                  vmv.v.v v0, v23
                  li x27, 0xb5393444
                  vslide1up.vx v23, v0, x27
                  li x27, 0xe7b714da
                  vslide1up.vx v24, v0, x27
                  vmv.v.v v0, v24
                  li x27, 0x87f5fabd
                  vslide1up.vx v24, v0, x27
                  vmv.v.v v0, v24
                  li x27, 0x56060d1
                  vslide1up.vx v24, v0, x27
                  vmv.v.v v0, v24
                  li x27, 0xd2e10a79
                  vslide1up.vx v24, v0, x27
                  li x27, 0x90b1ec3b
                  vslide1up.vx v25, v0, x27
                  vmv.v.v v0, v25
                  li x27, 0xa4b386ea
                  vslide1up.vx v25, v0, x27
                  vmv.v.v v0, v25
                  li x27, 0x8401ccea
                  vslide1up.vx v25, v0, x27
                  vmv.v.v v0, v25
                  li x27, 0x31e017bf
                  vslide1up.vx v25, v0, x27
                  li x27, 0xd0661750
                  vslide1up.vx v26, v0, x27
                  vmv.v.v v0, v26
                  li x27, 0x36a8683b
                  vslide1up.vx v26, v0, x27
                  vmv.v.v v0, v26
                  li x27, 0xebbb5805
                  vslide1up.vx v26, v0, x27
                  vmv.v.v v0, v26
                  li x27, 0xe1fccb72
                  vslide1up.vx v26, v0, x27
                  li x27, 0x6d49801b
                  vslide1up.vx v27, v0, x27
                  vmv.v.v v0, v27
                  li x27, 0x9eb1f45b
                  vslide1up.vx v27, v0, x27
                  vmv.v.v v0, v27
                  li x27, 0x979bd590
                  vslide1up.vx v27, v0, x27
                  vmv.v.v v0, v27
                  li x27, 0xd3e0b8b5
                  vslide1up.vx v27, v0, x27
                  li x27, 0xa26fa923
                  vslide1up.vx v28, v0, x27
                  vmv.v.v v0, v28
                  li x27, 0xc778bae
                  vslide1up.vx v28, v0, x27
                  vmv.v.v v0, v28
                  li x27, 0x7744dbfd
                  vslide1up.vx v28, v0, x27
                  vmv.v.v v0, v28
                  li x27, 0xccb14f2b
                  vslide1up.vx v28, v0, x27
                  li x27, 0x260a5d8b
                  vslide1up.vx v29, v0, x27
                  vmv.v.v v0, v29
                  li x27, 0xea101563
                  vslide1up.vx v29, v0, x27
                  vmv.v.v v0, v29
                  li x27, 0x5bf0c213
                  vslide1up.vx v29, v0, x27
                  vmv.v.v v0, v29
                  li x27, 0x3b7c2da2
                  vslide1up.vx v29, v0, x27
                  li x27, 0x6485e64e
                  vslide1up.vx v30, v0, x27
                  vmv.v.v v0, v30
                  li x27, 0x12f16f78
                  vslide1up.vx v30, v0, x27
                  vmv.v.v v0, v30
                  li x27, 0x2123f27c
                  vslide1up.vx v30, v0, x27
                  vmv.v.v v0, v30
                  li x27, 0xcbe18bd5
                  vslide1up.vx v30, v0, x27
                  li x27, 0xef4114ac
                  vslide1up.vx v31, v0, x27
                  vmv.v.v v0, v31
                  li x27, 0xc6237de
                  vslide1up.vx v31, v0, x27
                  vmv.v.v v0, v31
                  li x27, 0x26bcd653
                  vslide1up.vx v31, v0, x27
                  vmv.v.v v0, v31
                  li x27, 0xf39b9a22
                  vslide1up.vx v31, v0, x27
li x21, 8
                  vsetvli x27, x21, e16, m1
main:             sll        t0, s6, a2
                  or         s10, t0, a1
                  addi       t2, t3, -732
                  rem        a3, a7, a7
                  srl        s9, s6, s4
                  addi       s9, t3, -626
                  ori        s3, a0, 329
                  xor        sp, s4, s4
                  mulhsu     s3, sp, t6
                  srai       a3, s6, 5
                  ori        s1, s5, 309
                  auipc      a5, 1005789
                  remu       s8, a3, s0
                  srai       s10, t4, 26
                  sll        a3, ra, s5
                  and        a3, s2, s11
                  div        a3, a5, s10
                  xor        a1, s11, a5
                  divu       s0, s4, a5
                  vfcvt.f.xu.v v17,v3,v0.t
                  addi       a1, s8, 516
                  ori        s5, s5, -71
                  sub        s1, s0, tp
                  auipc      s2, 619230
                  mul        s1, t2, a7
                  sltiu      s11, t4, -520
                  mulhsu     a0, t4, sp
                  and        s2, a6, sp
                  sltu       t3, t3, a7
                  sltu       t0, tp, s7
                  addi       a1, s2, -723
                  vfsub.vf   v12,v15,ft10
                  auipc      s8, 11097
                  srli       t0, t3, 18
                  xor        t1, s8, s10
                  vfsub.vv   v22,v28,v20
                  sra        a4, t0, t5
                  vfadd.vf   v19,v8,fa6,v0.t
                  vfcvt.f.xu.v v25,v22
                  srai       t4, s11, 14
                  andi       t2, s4, -87
                  slti       s3, a0, -325
                  slli       t0, s1, 22
                  vfcvt.f.xu.v v18,v2
                  srli       a1, s5, 0
                  sra        s9, t3, a2
                  addi       a3, a1, 47
                  sll        s3, zero, gp
                  divu       sp, t3, t1
                  divu       s1, s9, a2
                  mulhu      a7, a2, t2
                  sltu       s9, sp, sp
                  slli       t2, a3, 23
                  sub        gp, t3, a0
                  xor        zero, a4, t4
                  sltiu      s1, s2, 276
                  mul        s0, s4, gp
                  sra        s1, t0, a1
                  vfcvt.f.x.v v5,v30,v0.t
                  xor        t2, s5, a2
                  auipc      gp, 417866
                  addi       s5, s1, -125
                  slli       s6, s9, 31
                  auipc      t0, 379787
                  rem        a2, t4, s6
                  divu       t0, s0, sp
                  mulh       zero, ra, a0
                  slli       a1, s11, 6
                  vfsub.vf   v5,v8,fs8,v0.t
                  mul        a4, t2, a6
                  mulhu      t2, tp, ra
                  divu       t4, s8, s8
                  slti       t6, a0, -878
                  rem        a1, t2, t5
                  mul        t6, t1, t1
                  slti       tp, a5, -995
                  remu       s8, a3, t2
                  sra        a5, a6, s10
                  mulhu      a3, a0, t1
                  mulhu      s9, s8, a5
                  vfcvt.f.xu.v v6,v8,v0.t
                  vfsub.vv   v18,v30,v11,v0.t
                  slli       a7, t6, 1
                  ori        t5, t5, -205
                  xor        s11, t2, t6
                  div        a4, t0, a1
                  slt        t3, tp, tp
                  sltu       a1, a2, s5
                  remu       t2, a4, a5
                  xori       t2, s0, 596
                  srli       t6, t0, 19
                  slti       s11, tp, 668
                  mulhu      a0, sp, a6
                  rem        ra, t1, ra
                  vfadd.vf   v14,v31,fa7
                  sltiu      s3, tp, -432
                  xori       s8, s4, -71
                  add        t2, s1, t5
                  andi       s8, s3, 506
                  addi       tp, s4, 298
                  la x23, test_done
                  jalr x0, x23, 0
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
                  1: addi x16, x16, -124
                  sw  x1, 4(x16)
                  sw  x2, 8(x16)
                  sw  x3, 12(x16)
                  sw  x4, 16(x16)
                  sw  x5, 20(x16)
                  sw  x6, 24(x16)
                  sw  x7, 28(x16)
                  sw  x8, 32(x16)
                  sw  x9, 36(x16)
                  sw  x10, 40(x16)
                  sw  x11, 44(x16)
                  sw  x12, 48(x16)
                  sw  x13, 52(x16)
                  sw  x14, 56(x16)
                  sw  x15, 60(x16)
                  sw  x16, 64(x16)
                  sw  x17, 68(x16)
                  sw  x18, 72(x16)
                  sw  x19, 76(x16)
                  sw  x20, 80(x16)
                  sw  x21, 84(x16)
                  sw  x22, 88(x16)
                  sw  x23, 92(x16)
                  sw  x24, 96(x16)
                  sw  x25, 100(x16)
                  sw  x26, 104(x16)
                  sw  x27, 108(x16)
                  sw  x28, 112(x16)
                  sw  x29, 116(x16)
                  sw  x30, 120(x16)
                  sw  x31, 124(x16)
                  csrr x27, 0x341 # MEPC
                  csrr x27, 0x342 # MCAUSE
                  li x21, 0x3 # BREAKPOINT
                  beq x27, x21, ebreak_handler
                  li x21, 0x8 # ECALL_UMODE
                  beq x27, x21, ecall_handler
                  li x21, 0x9 # ECALL_SMODE
                  beq x27, x21, ecall_handler
                  li x21, 0xb # ECALL_MMODE
                  beq x27, x21, ecall_handler
                  li x21, 0x1
                  beq x27, x21, instr_fault_handler
                  li x21, 0x5
                  beq x27, x21, load_fault_handler
                  li x21, 0x7
                  beq x27, x21, store_fault_handler
                  li x21, 0xc
                  beq x27, x21, pt_fault_handler
                  li x21, 0xd
                  beq x27, x21, pt_fault_handler
                  li x21, 0xf
                  beq x27, x21, pt_fault_handler
                  li x21, 0x2 # ILLEGAL_INSTRUCTION
                  beq x27, x21, illegal_instr_handler
                  csrr x21, 0x343 # MTVAL
                  1: la x23, test_done
                  jalr x1, x23, 0

ecall_handler:    
                  la x27, _start
                  sw x0, 0(x27)
                  sw x1, 4(x27)
                  sw x2, 8(x27)
                  sw x3, 12(x27)
                  sw x4, 16(x27)
                  sw x5, 20(x27)
                  sw x6, 24(x27)
                  sw x7, 28(x27)
                  sw x8, 32(x27)
                  sw x9, 36(x27)
                  sw x10, 40(x27)
                  sw x11, 44(x27)
                  sw x12, 48(x27)
                  sw x13, 52(x27)
                  sw x14, 56(x27)
                  sw x15, 60(x27)
                  sw x16, 64(x27)
                  sw x17, 68(x27)
                  sw x18, 72(x27)
                  sw x19, 76(x27)
                  sw x20, 80(x27)
                  sw x21, 84(x27)
                  sw x22, 88(x27)
                  sw x23, 92(x27)
                  sw x24, 96(x27)
                  sw x25, 100(x27)
                  sw x26, 104(x27)
                  sw x27, 108(x27)
                  sw x28, 112(x27)
                  sw x29, 116(x27)
                  sw x30, 120(x27)
                  sw x31, 124(x27)
                  la x23, write_tohost
                  jalr x0, x23, 0

instr_fault_handler:
                  li x27, 0
                  csrw 0x340, x27
                  li x11, 0
                  0: csrr x27, 0x340
                  mv x23, x27
                  li x23, 0
                  beq x27, x23, 1f
                  1: csrr x21, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x12, 4
                  csrr x27, 0x340
                  slli x27, x27, 30
                  srli x27, x27, 30
                  sub x23, x12, x27
                  addi x23, x23, -1
                  slli x23, x23, 3
                  sll x12, x17, x23
                  slli x27, x27, 3
                  add x23, x23, x27
                  srl x12, x12, x23
                  slli x23, x12, 27
                  srli x23, x23, 30
                  beqz x23, 20f
                  li x27, 1
                  beq x23, x27, 21f
                  li x27, 2
                  beq x23, x27, 25f
                  li x27, 3
                  beq x23, x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: csrr x27, 0x340
                  mv x11, x21
                  addi x27, x27, 1
                  csrw 0x340, x27
                  li x21, 1
                  ble x21, x27, 19f
                  j 0b
                  19: la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: csrr x27, 0x340
                  csrr x23, 0x343
                  srli x23, x23, 2
                  bnez x27, 22f
                  bltz x23, 18b
                  j 23f
                  22: bgtu x11, x23, 18b
                  23: bleu x21, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 24f
                  la x27, test_done
                  jalr x0, x27, 0
                  24: j 29f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x23, x21, 2
                  srli x23, x23, 2
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 26f
                  la x27, test_done
                  jalr x0, x27, 0
                  26: j 29f
                  27: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x23, x21, 2
                  srli x23, x23, 2
                  srli x23, x23, 0
                  slli x23, x23, 0
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 29f
                  la x27, test_done
                  jalr x0, x27, 0
                  28: j 29f
                  29: ori x12, x12, 4
                  csrr x27, 0x340
                  li x23, 30
                  sll x27, x27, x23
                  srl x27, x27, x23
                  slli x23, x27, 3
                  sll x12, x12, x23
                  or x17, x17, x12
                  csrr x27, 0x340
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x23, 1
                  beq x27, x23, 31f
                  li x23, 2
                  beq x27, x23, 32f
                  li x23, 3
                  beq x27, x23, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
                  mret

load_fault_handler:
                  li x27, 0
                  csrw 0x340, x27
                  li x11, 0
                  0: csrr x27, 0x340
                  mv x23, x27
                  li x23, 0
                  beq x27, x23, 1f
                  1: csrr x21, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x12, 4
                  csrr x27, 0x340
                  slli x27, x27, 30
                  srli x27, x27, 30
                  sub x23, x12, x27
                  addi x23, x23, -1
                  slli x23, x23, 3
                  sll x12, x17, x23
                  slli x27, x27, 3
                  add x23, x23, x27
                  srl x12, x12, x23
                  slli x23, x12, 27
                  srli x23, x23, 30
                  beqz x23, 20f
                  li x27, 1
                  beq x23, x27, 21f
                  li x27, 2
                  beq x23, x27, 25f
                  li x27, 3
                  beq x23, x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: csrr x27, 0x340
                  mv x11, x21
                  addi x27, x27, 1
                  csrw 0x340, x27
                  li x21, 1
                  ble x21, x27, 19f
                  j 0b
                  19: la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: csrr x27, 0x340
                  csrr x23, 0x343
                  srli x23, x23, 2
                  bnez x27, 22f
                  bltz x23, 18b
                  j 23f
                  22: bgtu x11, x23, 18b
                  23: bleu x21, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 24f
                  la x27, test_done
                  jalr x0, x27, 0
                  24: j 29f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x23, x21, 2
                  srli x23, x23, 2
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 26f
                  la x27, test_done
                  jalr x0, x27, 0
                  26: j 29f
                  27: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x23, x21, 2
                  srli x23, x23, 2
                  srli x23, x23, 0
                  slli x23, x23, 0
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 29f
                  la x27, test_done
                  jalr x0, x27, 0
                  28: j 29f
                  29: ori x12, x12, 1
                  csrr x27, 0x340
                  li x23, 30
                  sll x27, x27, x23
                  srl x27, x27, x23
                  slli x23, x27, 3
                  sll x12, x12, x23
                  or x17, x17, x12
                  csrr x27, 0x340
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x23, 1
                  beq x27, x23, 31f
                  li x23, 2
                  beq x27, x23, 32f
                  li x23, 3
                  beq x27, x23, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
                  mret

store_fault_handler:
                  li x27, 0
                  csrw 0x340, x27
                  li x11, 0
                  0: csrr x27, 0x340
                  mv x23, x27
                  li x23, 0
                  beq x27, x23, 1f
                  1: csrr x21, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x12, 4
                  csrr x27, 0x340
                  slli x27, x27, 30
                  srli x27, x27, 30
                  sub x23, x12, x27
                  addi x23, x23, -1
                  slli x23, x23, 3
                  sll x12, x17, x23
                  slli x27, x27, 3
                  add x23, x23, x27
                  srl x12, x12, x23
                  slli x23, x12, 27
                  srli x23, x23, 30
                  beqz x23, 20f
                  li x27, 1
                  beq x23, x27, 21f
                  li x27, 2
                  beq x23, x27, 25f
                  li x27, 3
                  beq x23, x27, 27f
                  la x27, test_done
                  jalr x0, x27, 0
                  18: csrr x27, 0x340
                  mv x11, x21
                  addi x27, x27, 1
                  csrw 0x340, x27
                  li x21, 1
                  ble x21, x27, 19f
                  j 0b
                  19: la x27, test_done
                  jalr x0, x27, 0
                  20: j 18b
                  21: csrr x27, 0x340
                  csrr x23, 0x343
                  srli x23, x23, 2
                  bnez x27, 22f
                  bltz x23, 18b
                  j 23f
                  22: bgtu x11, x23, 18b
                  23: bleu x21, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 24f
                  la x27, test_done
                  jalr x0, x27, 0
                  24: j 29f
                  25: csrr x27, 0x343
                  srli x27, x27, 2
                  slli x23, x21, 2
                  srli x23, x23, 2
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 26f
                  la x27, test_done
                  jalr x0, x27, 0
                  26: j 29f
                  27: csrr x27, 0x343
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  slli x23, x21, 2
                  srli x23, x23, 2
                  srli x23, x23, 0
                  slli x23, x23, 0
                  bne x27, x23, 18b
                  andi x23, x12, 128
                  beqz x23, 29f
                  la x27, test_done
                  jalr x0, x27, 0
                  28: j 29f
                  29: ori x12, x12, 3
                  csrr x27, 0x340
                  li x23, 30
                  sll x27, x27, x23
                  srl x27, x27, x23
                  slli x23, x27, 3
                  sll x12, x12, x23
                  or x17, x17, x12
                  csrr x27, 0x340
                  srli x27, x27, 2
                  beqz x27, 30f
                  li x23, 1
                  beq x27, x23, 31f
                  li x23, 2
                  beq x27, x23, 32f
                  li x23, 3
                  beq x27, x23, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
                  mret

ebreak_handler:   
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
                  mret

illegal_instr_handler:
                  csrr  x27, 0x341
                  addi  x27, x27, 4
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x27, 0x300 # MSTATUS;
                  csrr  x27, 0x304 # MIE;
                  csrr  x27, 0x344 # MIP;
                  csrrc x27, 0x344, x27 # MIP;
                  lw  x1, 4(x16)
                  lw  x2, 8(x16)
                  lw  x3, 12(x16)
                  lw  x4, 16(x16)
                  lw  x5, 20(x16)
                  lw  x6, 24(x16)
                  lw  x7, 28(x16)
                  lw  x8, 32(x16)
                  lw  x9, 36(x16)
                  lw  x10, 40(x16)
                  lw  x11, 44(x16)
                  lw  x12, 48(x16)
                  lw  x13, 52(x16)
                  lw  x14, 56(x16)
                  lw  x15, 60(x16)
                  lw  x16, 64(x16)
                  lw  x17, 68(x16)
                  lw  x18, 72(x16)
                  lw  x19, 76(x16)
                  lw  x20, 80(x16)
                  lw  x21, 84(x16)
                  lw  x22, 88(x16)
                  lw  x23, 92(x16)
                  lw  x24, 96(x16)
                  lw  x25, 100(x16)
                  lw  x26, 104(x16)
                  lw  x27, 108(x16)
                  lw  x28, 112(x16)
                  lw  x29, 116(x16)
                  lw  x30, 120(x16)
                  lw  x31, 124(x16)
                  addi x16, x16, 124
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
