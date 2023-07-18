.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x25, 0x40201123
                  csrw 0x301, x25
                  csrr x31, 0x301
kernel_sp:        
                  la x22, kernel_stack_end

trap_vec_init:    
                  la x25, mtvec_handler
                  ori x25, x25, 1

mepc_setup:       
                  la x25, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0xfb0329ff
                  li x3, 0xf06f1971
                  li x4, 0x45c0b9c9
                  li x5, 0x80000000
                  li x6, 0xfcfaa6ca
                  li x7, 0xe8b6e5c3
                  li x8, 0x80000000
                  li x9, 0x386424e
                  li x10, 0x8abf21e0
                  li x11, 0xf88097d4
                  li x12, 0x1d0d1df8
                  li x13, 0x6e4843f0
                  li x14, 0xf992b666
                  li x15, 0x80000000
                  li x16, 0x80000000
                  li x17, 0xd3a3793
                  li x19, 0xfedb667
                  li x20, 0xf628d00f
                  li x21, 0x35743b78
                  li x23, 0xf33343ba
                  li x24, 0x80000000
                  li x25, 0x80000000
                  li x26, 0xf1aee28f
                  li x27, 0x80000000
                  li x28, 0xfe57e981
                  li x29, 0xf3635a98
                  li x30, 0x80000000
                  li x31, 0x3537a840
                  la x18, user_stack_end
                  csrwi vxsat, 1
                  csrwi vxrm, 0
li x10, 4
                  vsetvli x25, x10, e32, m1
vec_reg_init:
                  vmv.v.x v0, x0
                  vmv.v.x v1, x1
                  li x25, 0x2edb5491
                  vslide1up.vx v0, v1, x25
                  vmv.v.v v0, v0
                  li x25, 0xffd328df
                  vslide1up.vx v0, v1, x25
                  vmv.v.v v0, v0
                  li x25, 0xc5066196
                  vslide1up.vx v0, v1, x25
                  vmv.v.v v0, v0
                  li x25, 0x17f5fc89
                  vslide1up.vx v0, v1, x25
                  li x25, 0x9b0953d0
                  vslide1up.vx v1, v0, x25
                  vmv.v.v v0, v1
                  li x25, 0x2780df04
                  vslide1up.vx v1, v0, x25
                  vmv.v.v v0, v1
                  li x25, 0xb4cc4014
                  vslide1up.vx v1, v0, x25
                  vmv.v.v v0, v1
                  li x25, 0xbd0193aa
                  vslide1up.vx v1, v0, x25
                  li x25, 0xf380cc26
                  vslide1up.vx v2, v0, x25
                  vmv.v.v v0, v2
                  li x25, 0x9631111f
                  vslide1up.vx v2, v0, x25
                  vmv.v.v v0, v2
                  li x25, 0x7cf16f69
                  vslide1up.vx v2, v0, x25
                  vmv.v.v v0, v2
                  li x25, 0x3645f080
                  vslide1up.vx v2, v0, x25
                  li x25, 0x4f1f7a03
                  vslide1up.vx v3, v0, x25
                  vmv.v.v v0, v3
                  li x25, 0x2d6f8e50
                  vslide1up.vx v3, v0, x25
                  vmv.v.v v0, v3
                  li x25, 0xde9e7a22
                  vslide1up.vx v3, v0, x25
                  vmv.v.v v0, v3
                  li x25, 0x1e8e2230
                  vslide1up.vx v3, v0, x25
                  li x25, 0xd14e6730
                  vslide1up.vx v4, v0, x25
                  vmv.v.v v0, v4
                  li x25, 0x41f0fc18
                  vslide1up.vx v4, v0, x25
                  vmv.v.v v0, v4
                  li x25, 0x463d1e0c
                  vslide1up.vx v4, v0, x25
                  vmv.v.v v0, v4
                  li x25, 0xb07e51cc
                  vslide1up.vx v4, v0, x25
                  li x25, 0xad4eacb
                  vslide1up.vx v5, v0, x25
                  vmv.v.v v0, v5
                  li x25, 0x88262080
                  vslide1up.vx v5, v0, x25
                  vmv.v.v v0, v5
                  li x25, 0xc1fc6daa
                  vslide1up.vx v5, v0, x25
                  vmv.v.v v0, v5
                  li x25, 0x6a6e41bd
                  vslide1up.vx v5, v0, x25
                  li x25, 0x429474c7
                  vslide1up.vx v6, v0, x25
                  vmv.v.v v0, v6
                  li x25, 0x3756193b
                  vslide1up.vx v6, v0, x25
                  vmv.v.v v0, v6
                  li x25, 0x934e3082
                  vslide1up.vx v6, v0, x25
                  vmv.v.v v0, v6
                  li x25, 0x363d78ef
                  vslide1up.vx v6, v0, x25
                  li x25, 0xaddc7dcd
                  vslide1up.vx v7, v0, x25
                  vmv.v.v v0, v7
                  li x25, 0x8398bab6
                  vslide1up.vx v7, v0, x25
                  vmv.v.v v0, v7
                  li x25, 0x81f0cfb3
                  vslide1up.vx v7, v0, x25
                  vmv.v.v v0, v7
                  li x25, 0x2a0665a3
                  vslide1up.vx v7, v0, x25
                  li x25, 0xb45c7bb1
                  vslide1up.vx v8, v0, x25
                  vmv.v.v v0, v8
                  li x25, 0xb995ab80
                  vslide1up.vx v8, v0, x25
                  vmv.v.v v0, v8
                  li x25, 0x6ac6a1f1
                  vslide1up.vx v8, v0, x25
                  vmv.v.v v0, v8
                  li x25, 0x6bbdc6d5
                  vslide1up.vx v8, v0, x25
                  li x25, 0x4826972e
                  vslide1up.vx v9, v0, x25
                  vmv.v.v v0, v9
                  li x25, 0x2e715478
                  vslide1up.vx v9, v0, x25
                  vmv.v.v v0, v9
                  li x25, 0x31dfc18c
                  vslide1up.vx v9, v0, x25
                  vmv.v.v v0, v9
                  li x25, 0x25222c2a
                  vslide1up.vx v9, v0, x25
                  li x25, 0xde0e29f3
                  vslide1up.vx v10, v0, x25
                  vmv.v.v v0, v10
                  li x25, 0x7db55eb8
                  vslide1up.vx v10, v0, x25
                  vmv.v.v v0, v10
                  li x25, 0xbab45949
                  vslide1up.vx v10, v0, x25
                  vmv.v.v v0, v10
                  li x25, 0x8dd7a0fa
                  vslide1up.vx v10, v0, x25
                  li x25, 0x7366aee7
                  vslide1up.vx v11, v0, x25
                  vmv.v.v v0, v11
                  li x25, 0xef62b519
                  vslide1up.vx v11, v0, x25
                  vmv.v.v v0, v11
                  li x25, 0x910c0b13
                  vslide1up.vx v11, v0, x25
                  vmv.v.v v0, v11
                  li x25, 0x9bb6404f
                  vslide1up.vx v11, v0, x25
                  li x25, 0x52d262fd
                  vslide1up.vx v12, v0, x25
                  vmv.v.v v0, v12
                  li x25, 0x417064e3
                  vslide1up.vx v12, v0, x25
                  vmv.v.v v0, v12
                  li x25, 0x99fe416e
                  vslide1up.vx v12, v0, x25
                  vmv.v.v v0, v12
                  li x25, 0xfe661336
                  vslide1up.vx v12, v0, x25
                  li x25, 0xc2010600
                  vslide1up.vx v13, v0, x25
                  vmv.v.v v0, v13
                  li x25, 0x90824060
                  vslide1up.vx v13, v0, x25
                  vmv.v.v v0, v13
                  li x25, 0x5fc7165b
                  vslide1up.vx v13, v0, x25
                  vmv.v.v v0, v13
                  li x25, 0xb52f8910
                  vslide1up.vx v13, v0, x25
                  li x25, 0xe2560da
                  vslide1up.vx v14, v0, x25
                  vmv.v.v v0, v14
                  li x25, 0x9d2fba10
                  vslide1up.vx v14, v0, x25
                  vmv.v.v v0, v14
                  li x25, 0xe2f4774e
                  vslide1up.vx v14, v0, x25
                  vmv.v.v v0, v14
                  li x25, 0x39d9a22
                  vslide1up.vx v14, v0, x25
                  li x25, 0xa2feee99
                  vslide1up.vx v15, v0, x25
                  vmv.v.v v0, v15
                  li x25, 0x48968bc9
                  vslide1up.vx v15, v0, x25
                  vmv.v.v v0, v15
                  li x25, 0xeabc7765
                  vslide1up.vx v15, v0, x25
                  vmv.v.v v0, v15
                  li x25, 0x6d41053b
                  vslide1up.vx v15, v0, x25
                  li x25, 0x2cdd1cc2
                  vslide1up.vx v16, v0, x25
                  vmv.v.v v0, v16
                  li x25, 0xe5eac71a
                  vslide1up.vx v16, v0, x25
                  vmv.v.v v0, v16
                  li x25, 0xe63c988f
                  vslide1up.vx v16, v0, x25
                  vmv.v.v v0, v16
                  li x25, 0xc652c4e3
                  vslide1up.vx v16, v0, x25
                  li x25, 0x9f93ce83
                  vslide1up.vx v17, v0, x25
                  vmv.v.v v0, v17
                  li x25, 0xd1301371
                  vslide1up.vx v17, v0, x25
                  vmv.v.v v0, v17
                  li x25, 0xbfffc36c
                  vslide1up.vx v17, v0, x25
                  vmv.v.v v0, v17
                  li x25, 0x1e348a23
                  vslide1up.vx v17, v0, x25
                  li x25, 0x2e097311
                  vslide1up.vx v18, v0, x25
                  vmv.v.v v0, v18
                  li x25, 0x400b8bc9
                  vslide1up.vx v18, v0, x25
                  vmv.v.v v0, v18
                  li x25, 0x767faab2
                  vslide1up.vx v18, v0, x25
                  vmv.v.v v0, v18
                  li x25, 0x69b26a1a
                  vslide1up.vx v18, v0, x25
                  li x25, 0x99c5043d
                  vslide1up.vx v19, v0, x25
                  vmv.v.v v0, v19
                  li x25, 0x39366d28
                  vslide1up.vx v19, v0, x25
                  vmv.v.v v0, v19
                  li x25, 0xac25d267
                  vslide1up.vx v19, v0, x25
                  vmv.v.v v0, v19
                  li x25, 0x43c54f16
                  vslide1up.vx v19, v0, x25
                  li x25, 0x8845fc90
                  vslide1up.vx v20, v0, x25
                  vmv.v.v v0, v20
                  li x25, 0xdd349930
                  vslide1up.vx v20, v0, x25
                  vmv.v.v v0, v20
                  li x25, 0xc8ea337e
                  vslide1up.vx v20, v0, x25
                  vmv.v.v v0, v20
                  li x25, 0xb03ff426
                  vslide1up.vx v20, v0, x25
                  li x25, 0x26e7fea9
                  vslide1up.vx v21, v0, x25
                  vmv.v.v v0, v21
                  li x25, 0xf5879ed5
                  vslide1up.vx v21, v0, x25
                  vmv.v.v v0, v21
                  li x25, 0xde2f0ef4
                  vslide1up.vx v21, v0, x25
                  vmv.v.v v0, v21
                  li x25, 0xe9cbf972
                  vslide1up.vx v21, v0, x25
                  li x25, 0x4d3501ba
                  vslide1up.vx v22, v0, x25
                  vmv.v.v v0, v22
                  li x25, 0x3815b856
                  vslide1up.vx v22, v0, x25
                  vmv.v.v v0, v22
                  li x25, 0x324e5184
                  vslide1up.vx v22, v0, x25
                  vmv.v.v v0, v22
                  li x25, 0xab7f3cf9
                  vslide1up.vx v22, v0, x25
                  li x25, 0xbf0dc4f
                  vslide1up.vx v23, v0, x25
                  vmv.v.v v0, v23
                  li x25, 0x932d8cc4
                  vslide1up.vx v23, v0, x25
                  vmv.v.v v0, v23
                  li x25, 0x3565bdd4
                  vslide1up.vx v23, v0, x25
                  vmv.v.v v0, v23
                  li x25, 0xfd21135a
                  vslide1up.vx v23, v0, x25
                  li x25, 0xcc233f85
                  vslide1up.vx v24, v0, x25
                  vmv.v.v v0, v24
                  li x25, 0x3cf58762
                  vslide1up.vx v24, v0, x25
                  vmv.v.v v0, v24
                  li x25, 0xbb8e1e8b
                  vslide1up.vx v24, v0, x25
                  vmv.v.v v0, v24
                  li x25, 0x8e5a8ed9
                  vslide1up.vx v24, v0, x25
                  li x25, 0xd1f46bdc
                  vslide1up.vx v25, v0, x25
                  vmv.v.v v0, v25
                  li x25, 0xb9f01b20
                  vslide1up.vx v25, v0, x25
                  vmv.v.v v0, v25
                  li x25, 0xf8c1a6c
                  vslide1up.vx v25, v0, x25
                  vmv.v.v v0, v25
                  li x25, 0x32220d1c
                  vslide1up.vx v25, v0, x25
                  li x25, 0x664f555d
                  vslide1up.vx v26, v0, x25
                  vmv.v.v v0, v26
                  li x25, 0x4ead4524
                  vslide1up.vx v26, v0, x25
                  vmv.v.v v0, v26
                  li x25, 0x7b936ae9
                  vslide1up.vx v26, v0, x25
                  vmv.v.v v0, v26
                  li x25, 0x6cee0807
                  vslide1up.vx v26, v0, x25
                  li x25, 0xc63b5cb7
                  vslide1up.vx v27, v0, x25
                  vmv.v.v v0, v27
                  li x25, 0xee6b2eb5
                  vslide1up.vx v27, v0, x25
                  vmv.v.v v0, v27
                  li x25, 0xc1787b8b
                  vslide1up.vx v27, v0, x25
                  vmv.v.v v0, v27
                  li x25, 0x9ffa3eed
                  vslide1up.vx v27, v0, x25
                  li x25, 0x6e634bd2
                  vslide1up.vx v28, v0, x25
                  vmv.v.v v0, v28
                  li x25, 0x51049fa4
                  vslide1up.vx v28, v0, x25
                  vmv.v.v v0, v28
                  li x25, 0x318b50ab
                  vslide1up.vx v28, v0, x25
                  vmv.v.v v0, v28
                  li x25, 0xab1c9a0b
                  vslide1up.vx v28, v0, x25
                  li x25, 0x7e80b4c
                  vslide1up.vx v29, v0, x25
                  vmv.v.v v0, v29
                  li x25, 0x2af55858
                  vslide1up.vx v29, v0, x25
                  vmv.v.v v0, v29
                  li x25, 0x6f5be21d
                  vslide1up.vx v29, v0, x25
                  vmv.v.v v0, v29
                  li x25, 0x34ea8615
                  vslide1up.vx v29, v0, x25
                  li x25, 0x3b370cf7
                  vslide1up.vx v30, v0, x25
                  vmv.v.v v0, v30
                  li x25, 0xd4d262e0
                  vslide1up.vx v30, v0, x25
                  vmv.v.v v0, v30
                  li x25, 0x589c92d0
                  vslide1up.vx v30, v0, x25
                  vmv.v.v v0, v30
                  li x25, 0x8c3c1443
                  vslide1up.vx v30, v0, x25
                  li x25, 0x8e2ea4a9
                  vslide1up.vx v31, v0, x25
                  vmv.v.v v0, v31
                  li x25, 0xe3de7645
                  vslide1up.vx v31, v0, x25
                  vmv.v.v v0, v31
                  li x25, 0x172a2204
                  vslide1up.vx v31, v0, x25
                  vmv.v.v v0, v31
                  li x25, 0x12c36527
                  vslide1up.vx v31, v0, x25
li x10, 8
                  vsetvli x25, x10, e16, m1
main:             vfredsum.vs v13,v31,v17
                  vfredosum.vs v3,v21,v26,v0.t
                  vfmin.vf   v19,v0,fa1
                  vfadd.vv   v14,v29,v2
                  sltiu      t6, t0, 510
                  mulhsu     a0, a3, a7
                  or         t0, s0, t0
                  vfcvt.x.f.v v6,v16
                  vfcvt.x.f.v v29,v13
                  sll        s10, a4, s3
                  vfredosum.vs v10,v29,v16
                  div        s4, t2, t4
                  vfsgnj.vv  v11,v17,v26
                  lui        t1, 811612
                  vfcvt.f.xu.v v6,v6,v0.t
                  lui        s0, 433125
                  andi       s5, t4, -655
                  vfsgnj.vf  v26,v15,ft5
                  rem        s7, s0, s0
                  xor        a4, a5, a6
                  vfsub.vf   v30,v27,fs1,v0.t
                  vmfeq.vf   v13,v4,ft3
                  auipc      a7, 290093
                  vfcvt.f.xu.v v1,v16,v0.t
                  vmfge.vf   v4,v1,fa3
                  addi       t5, gp, 353
                  mulhsu     a1, t3, s3
                  sltiu      s5, t6, 473
                  vfrsub.vf  v30,v6,ft10,v0.t
                  mulhu      t6, t2, s1
                  vfadd.vf   v11,v8,fs0
                  srli       s1, a7, 14
                  or         a5, a2, t1
                  ori        a4, a6, -527
                  sltu       t3, t5, tp
                  xori       t4, t0, 214
                  vfclass.v v25,v3
                  lui        a7, 500309
                  vmfgt.vf   v0,v19,fs11
                  vfredmax.vs v2,v30,v14
                  vfmul.vf   v1,v30,fa3
                  add        a6, a0, a4
                  vfclass.v v31,v8
                  vmfne.vf   v18,v14,ft5,v0.t
                  slti       a6, t1, -36
                  vfsgnj.vv  v14,v22,v21,v0.t
                  vmfne.vf   v26,v27,fs1,v0.t
                  xor        t0, t6, t1
                  vfcvt.x.f.v v27,v26
                  sll        a5, zero, s6
                  div        zero, s6, a6
                  vfredosum.vs v20,v2,v5
                  div        s0, s6, s9
                  vfredosum.vs v10,v3,v30
                  vfredmax.vs v15,v0,v16,v0.t
                  vmfne.vf   v25,v29,fs5
                  xori       s8, s10, -816
                  vfsub.vv   v12,v3,v4
                  div        tp, a0, t5
                  add        s0, ra, zero
                  vmfne.vf   v29,v3,ft8
                  slli       a4, gp, 4
                  vfcvt.f.x.v v15,v16
                  vmfge.vf   v25,v30,fa4
                  vmfne.vf   v15,v11,ft7,v0.t
                  vfredosum.vs v29,v11,v25
                  sub        a0, tp, s11
                  div        a4, zero, s10
                  divu       a3, s6, s6
                  vfredmax.vs v2,v21,v11
                  or         t0, sp, s0
                  divu       t3, zero, a1
                  div        a6, zero, a3
                  vmfle.vf   v16,v3,fs2
                  ori        a4, s0, 576
                  remu       a7, a5, a1
                  xori       a2, a6, -358
                  srai       ra, a1, 8
                  vfcvt.xu.f.v v27,v25,v0.t
                  slli       t0, t5, 9
                  slli       sp, t1, 14
                  mul        a6, ra, sp
                  auipc      s9, 441801
                  slti       a1, s3, 756
                  ori        t4, gp, -161
                  mulhsu     s7, ra, s11
                  mulhu      t2, t6, t0
                  sltiu      gp, a7, 612
                  slt        t5, s1, a7
                  slt        s4, a3, zero
                  vfrsub.vf  v26,v24,fs7,v0.t
                  mulhu      s3, t3, t3
                  vmfgt.vf   v10,v31,fs8,v0.t
                  ori        s3, t5, 236
                  sra        t5, zero, s7
                  and        t4, t2, s3
                  vfadd.vf   v2,v19,fs9
                  vfmax.vv   v14,v22,v28,v0.t
                  lui        s1, 499369
                  andi       sp, s11, 380
                  vmfge.vf   v23,v28,fs2
                  xori       t3, ra, -734
                  andi       s8, t5, -821
                  vmflt.vv   v14,v15,v18
                  vfmul.vv   v11,v30,v24,v0.t
                  sub        gp, a6, s0
                  sll        a1, s2, a5
                  div        s9, t4, s6
                  vfsgnjx.vv v7,v5,v21,v0.t
                  vfsub.vv   v9,v25,v16,v0.t
                  vfclass.v v5,v6
                  vmfeq.vf   v21,v1,ft8,v0.t
                  addi       zero, a3, -931
                  vfcvt.xu.f.v v17,v29
                  vfsgnjn.vv v3,v30,v24
                  vfsgnjx.vf v15,v3,ft11
                  sltu       a4, s0, s10
                  addi       t3, a4, 823
                  or         a2, t3, s1
                  vfmax.vf   v31,v30,fs8
                  vfclass.v v21,v17
                  vmfge.vf   v2,v12,ft7
                  vmfge.vf   v3,v8,fs4
                  vfredmin.vs v24,v3,v31
                  srli       s9, zero, 23
                  xor        t2, s8, s6
                  srai       s10, s5, 6
                  sltu       t4, s2, t4
                  div        a3, a2, s6
                  xori       s3, s11, 381
                  vfmin.vv   v15,v6,v9
                  ori        a7, t6, -674
                  vmfge.vf   v9,v7,fs6
                  vfcvt.f.x.v v19,v7
                  vmfne.vf   v13,v3,fs11,v0.t
                  vmfle.vv   v28,v15,v3
                  sltu       s7, t4, ra
                  vfredosum.vs v15,v20,v18
                  vmflt.vv   v25,v13,v18,v0.t
                  vmfgt.vf   v4,v3,fs6,v0.t
                  vmfge.vf   v16,v12,ft11,v0.t
                  add        s8, s3, ra
                  addi       a4, s4, -859
                  vfredmax.vs v4,v4,v22,v0.t
                  vfadd.vv   v2,v24,v22,v0.t
                  vfredmin.vs v26,v0,v26,v0.t
                  ori        s1, a7, 984
                  vfredmax.vs v22,v3,v1
                  xori       t2, s7, 489
                  vfclass.v v2,v6
                  srl        a6, s3, s0
                  srai       sp, s7, 2
                  slti       a1, t3, -471
                  mulhu      a0, s5, t5
                  sub        s3, sp, a7
                  vfmul.vf   v10,v0,fs3
                  xor        t2, a2, a2
                  add        ra, t2, s1
                  sll        a6, t1, s8
                  vmfgt.vf   v17,v18,fs5,v0.t
                  vmflt.vf   v17,v0,fa6,v0.t
                  mul        s3, t4, a3
                  vfcvt.f.xu.v v15,v20
                  vfrsub.vf  v28,v7,fs6
                  rem        sp, a7, s0
                  vfmul.vv   v10,v14,v28
                  mulhu      a4, a0, t5
                  auipc      a5, 292528
                  vfmax.vv   v9,v31,v7
                  mulhsu     a3, gp, a0
                  mulhu      sp, gp, s11
                  vfcvt.f.x.v v16,v26
                  rem        t2, a5, s9
                  vmflt.vv   v1,v9,v20
                  mul        a6, gp, t3
                  vfcvt.f.x.v v13,v10,v0.t
                  vmfle.vf   v19,v20,fs8,v0.t
                  rem        tp, ra, zero
                  vmfge.vf   v5,v15,ft6,v0.t
                  mulhsu     a2, s8, t1
                  xor        t6, s11, s2
                  xor        s10, s11, s9
                  vfcvt.f.x.v v22,v21,v0.t
                  mul        a3, s11, s3
                  vfcvt.f.xu.v v3,v2
                  vmfle.vv   v21,v22,v10,v0.t
                  vmflt.vf   v3,v25,ft10
                  add        tp, t0, a6
                  addi       zero, a0, 1
                  divu       t3, t1, t1
                  srli       s1, s2, 30
                  srl        s8, s10, a4
                  andi       t5, t1, -349
                  mulhsu     s8, t2, a7
                  addi       s7, t0, -611
                  sltiu      t4, a1, -63
                  vfmin.vv   v7,v11,v14,v0.t
                  srl        s1, t4, sp
                  vmfne.vf   v5,v29,fs10,v0.t
                  vfcvt.xu.f.v v9,v15
                  sll        sp, s2, a4
                  andi       t1, t0, 944
                  vfcvt.xu.f.v v12,v27
                  vmfne.vf   v13,v17,ft9,v0.t
                  vfclass.v v26,v17
                  divu       t6, s2, a7
                  vfrsub.vf  v22,v28,fs1
                  mulhu      s5, t1, s9
                  vfredmin.vs v6,v15,v10,v0.t
                  vfmax.vv   v7,v18,v10,v0.t
                  vfmax.vf   v10,v14,fs4
                  slt        t3, a0, s6
                  vmflt.vv   v26,v13,v28,v0.t
                  srai       t2, t1, 4
                  vfrsub.vf  v16,v29,fs0,v0.t
                  xori       a7, t2, 55
                  vfredmin.vs v8,v25,v0
                  xori       s3, s1, -100
                  divu       zero, ra, t1
                  vfcvt.f.x.v v13,v18,v0.t
                  slli       t3, s9, 8
                  vfredosum.vs v18,v7,v28,v0.t
                  vfsgnjn.vv v14,v22,v19,v0.t
                  mulh       a2, s1, t4
                  sltiu      s8, a7, -443
                  or         a6, s8, s2
                  vfsgnjn.vf v4,v19,ft7,v0.t
                  sltiu      t0, a1, 101
                  vfredosum.vs v0,v19,v16
                  vfsub.vv   v8,v28,v11
                  vfmax.vv   v21,v4,v30,v0.t
                  andi       a7, s0, 764
                  or         tp, tp, s9
                  srai       s8, a0, 21
                  remu       tp, s9, a5
                  or         t5, s0, a1
                  sltiu      s10, s8, -693
                  addi       ra, a2, 21
                  lui        gp, 525367
                  vmfeq.vv   v5,v20,v9,v0.t
                  vfsub.vf   v13,v4,ft10
                  slti       s4, sp, 853
                  and        a4, tp, sp
                  sltiu      s4, s10, 555
                  ori        s0, a1, 357
                  ori        t1, gp, -560
                  vfmul.vf   v6,v12,ft7,v0.t
                  mulh       a4, s10, t4
                  mulh       sp, a1, t0
                  ori        t1, s0, -86
                  sltu       zero, a3, t2
                  vfrsub.vf  v27,v3,ft6
                  auipc      s5, 130810
                  vmfgt.vf   v27,v25,ft4
                  divu       t6, a0, a4
                  vfcvt.f.xu.v v6,v16,v0.t
                  lui        t3, 98363
                  vfredmax.vs v14,v3,v23
                  vmflt.vf   v18,v10,ft3
                  vfsgnjx.vv v12,v1,v12
                  addi       s5, s8, -333
                  remu       a2, a6, a3
                  auipc      s10, 187647
                  auipc      s1, 106854
                  srl        s7, s8, sp
                  mulhsu     s3, s5, a3
                  vfsgnjn.vv v10,v3,v16,v0.t
                  srai       s3, a0, 6
                  addi       s5, t0, 705
                  vmfge.vf   v18,v13,ft4
                  sll        s4, s0, s0
                  sra        s10, a0, t0
                  vmfeq.vf   v21,v31,ft0
                  slt        a5, t5, zero
                  ori        gp, t3, -343
                  mulhu      s1, s2, sp
                  add        s10, t0, a5
                  auipc      s0, 954132
                  mulhsu     zero, a4, t1
                  ori        s5, t3, 71
                  sltiu      a4, a5, -453
                  auipc      t5, 710366
                  sltu       sp, a5, a7
                  vfredmin.vs v21,v13,v20
                  sub        a1, a3, s3
                  slti       t4, s8, 705
                  add        s0, t3, tp
                  vfadd.vv   v3,v2,v28,v0.t
                  sub        a1, s0, t5
                  and        zero, zero, a4
                  mul        a6, a4, zero
                  andi       sp, t4, -116
                  vfcvt.x.f.v v29,v5
                  mulh       s9, t1, t3
                  mulhsu     s10, s2, a7
                  sra        t4, a2, s7
                  vfcvt.f.x.v v3,v22,v0.t
                  and        a3, t4, a2
                  vfsgnj.vf  v17,v2,fs6
                  mul        a3, s11, t0
                  xori       s9, s9, -408
                  vfcvt.f.xu.v v2,v23,v0.t
                  auipc      ra, 139217
                  slti       a4, s3, 243
                  and        a3, sp, s8
                  mulhsu     a7, a1, a7
                  vfadd.vv   v5,v15,v12
                  sll        tp, a0, s10
                  sltu       s10, t3, a0
                  vmfgt.vf   v7,v18,ft8,v0.t
                  vfcvt.f.x.v v1,v4,v0.t
                  vfrsub.vf  v22,v25,fs1,v0.t
                  mulhu      t3, gp, a5
                  slli       s1, zero, 17
                  remu       t2, a5, s5
                  div        t5, a3, t3
                  andi       s10, a4, 146
                  vfmax.vv   v5,v29,v0
                  divu       a5, a2, t1
                  srl        tp, tp, tp
                  sub        t0, t0, a5
                  vfredmin.vs v17,v31,v25,v0.t
                  vmfge.vf   v3,v6,fa2
                  vfredsum.vs v7,v13,v3
                  vmflt.vf   v31,v3,ft9
                  auipc      s5, 204298
                  divu       zero, a3, s11
                  rem        sp, s10, ra
                  xori       tp, t3, 340
                  slti       tp, t4, 425
                  ori        a4, a1, 847
                  andi       tp, a7, 1004
                  vfsub.vv   v7,v23,v25,v0.t
                  slti       t2, s5, 952
                  vfcvt.x.f.v v30,v13,v0.t
                  ori        t3, a5, -627
                  vfsub.vf   v3,v5,fs8
                  sll        t0, a3, s8
                  slli       a4, s6, 15
                  add        a1, s5, a2
                  sltu       s3, s4, a4
                  srli       s10, s7, 25
                  vfredosum.vs v23,v22,v20
                  vfcvt.f.xu.v v30,v3,v0.t
                  xor        s0, s11, s11
                  vmfge.vf   v25,v17,fs1,v0.t
                  sltu       a6, gp, s3
                  rem        s8, t3, t2
                  vfclass.v v27,v4
                  ori        t1, s8, -675
                  sltu       t2, s11, t6
                  rem        a6, a0, s3
                  srl        a0, s0, t6
                  div        s8, t0, a7
                  vfsgnjx.vf v17,v11,fs3
                  slti       s4, t5, -602
                  vmfle.vf   v3,v31,fs1,v0.t
                  rem        t1, s4, t2
                  or         s3, t3, a4
                  or         a2, a6, s11
                  vfsgnjn.vv v18,v14,v16,v0.t
                  mul        a6, t5, s7
                  divu       s3, a7, s2
                  ori        a4, t2, 165
                  srai       t4, s9, 18
                  mulhu      t1, tp, t1
                  vfsgnjn.vv v14,v1,v23,v0.t
                  vfredosum.vs v13,v8,v10,v0.t
                  remu       a3, s1, a6
                  srai       sp, s0, 30
                  vfcvt.f.x.v v29,v20,v0.t
                  div        ra, t2, s10
                  div        t5, s4, s0
                  vfredmax.vs v27,v15,v23,v0.t
                  vfredosum.vs v15,v10,v15,v0.t
                  mulhsu     s10, s7, a6
                  sll        a3, s6, a0
                  vfredsum.vs v31,v22,v17,v0.t
                  addi       t0, s9, -805
                  vmfeq.vv   v17,v1,v1,v0.t
                  auipc      a4, 806013
                  vfredosum.vs v27,v4,v18,v0.t
                  vfcvt.f.x.v v30,v23,v0.t
                  srl        a0, a3, a2
                  remu       t1, s3, gp
                  mulh       t2, s1, t5
                  vfcvt.x.f.v v25,v1,v0.t
                  vfmul.vv   v17,v23,v28
                  slti       gp, t3, 920
                  divu       t2, s4, s1
                  or         s9, s4, a3
                  slti       t1, a5, 554
                  vmfgt.vf   v25,v24,ft9
                  remu       t0, zero, a2
                  rem        gp, s2, s4
                  addi       t6, a5, -416
                  and        t1, s10, s9
                  vfsgnjx.vf v5,v6,fa4
                  sltu       a7, t5, t5
                  sub        a5, t4, a7
                  auipc      tp, 451410
                  lui        t4, 887138
                  srai       s3, s0, 21
                  sltiu      s4, a6, -402
                  vmfge.vf   v31,v14,ft9,v0.t
                  slti       tp, s11, 235
                  vfrsub.vf  v10,v4,fs5,v0.t
                  slli       t0, zero, 12
                  div        t5, s4, s4
                  divu       a7, s8, t0
                  vfredmin.vs v6,v0,v9
                  vfcvt.f.x.v v2,v3,v0.t
                  sltiu      gp, s11, -354
                  or         t5, s6, t4
                  slli       s10, s4, 24
                  vfmin.vf   v27,v14,ft11,v0.t
                  vfredmax.vs v7,v19,v18,v0.t
                  slti       t4, zero, -22
                  vfmin.vv   v0,v20,v9
                  mulh       s9, s4, a3
                  remu       s5, zero, a2
                  vfcvt.f.xu.v v4,v7
                  slt        t4, a2, t2
                  vmfgt.vf   v24,v31,fa6
                  slt        a5, gp, s6
                  mul        a4, s5, zero
                  vfcvt.f.xu.v v8,v1
                  vfredsum.vs v27,v0,v13
                  mulhsu     t4, a0, t5
                  xori       tp, s6, 535
                  add        a1, a1, t3
                  mulhu      s8, t6, s3
                  ori        t3, s4, -259
                  auipc      gp, 386259
                  rem        s8, t4, ra
                  sltiu      s10, t1, 661
                  vmfge.vf   v3,v10,ft6
                  lui        t4, 123109
                  andi       s10, sp, -808
                  vmfgt.vf   v30,v2,ft8
                  vfrsub.vf  v18,v23,ft10,v0.t
                  xor        tp, gp, tp
                  sll        a3, a7, t0
                  vfsgnjn.vf v6,v14,ft8
                  sub        s5, ra, a2
                  sltu       s10, s4, t2
                  vfredosum.vs v3,v14,v7,v0.t
                  mulhu      tp, sp, tp
                  srai       t5, a7, 14
                  auipc      a0, 207513
                  vmflt.vv   v24,v15,v19,v0.t
                  srai       t2, t6, 6
                  vfmin.vf   v19,v8,fs5
                  sll        t5, s9, t1
                  mul        s3, a2, gp
                  vmfne.vf   v21,v5,fa3
                  vfcvt.x.f.v v19,v22
                  vfcvt.xu.f.v v29,v15
                  or         t0, t1, s7
                  vfsgnjx.vv v0,v7,v9
                  vmflt.vf   v24,v6,fs7
                  vfsgnjx.vv v18,v7,v5,v0.t
                  sltiu      t0, sp, -670
                  vfredosum.vs v23,v28,v3,v0.t
                  and        zero, s3, s8
                  xor        s8, s6, s10
                  vfsub.vv   v0,v8,v22
                  vmfgt.vf   v16,v11,ft2,v0.t
                  vfcvt.x.f.v v12,v30
                  auipc      s4, 385774
                  sltiu      a1, t0, 695
                  vfsgnj.vf  v6,v3,ft1
                  sra        a0, s2, t1
                  or         s8, a0, s5
                  vfsub.vf   v8,v5,fs1,v0.t
                  vfcvt.f.xu.v v4,v12
                  divu       tp, s6, t1
                  vfredmin.vs v12,v21,v28
                  remu       tp, t6, a1
                  mulhsu     t3, s3, a5
                  vfcvt.f.x.v v2,v7,v0.t
                  slt        s4, s3, t1
                  vfredosum.vs v27,v6,v31,v0.t
                  vmfeq.vf   v0,v2,fs2
                  vfredmin.vs v17,v19,v9
                  vfmax.vf   v22,v20,fs11
                  andi       s4, gp, 731
                  remu       t2, s7, t3
                  remu       zero, a6, a4
                  vfredosum.vs v30,v29,v2
                  vfredosum.vs v11,v28,v5
                  ori        s3, s9, -607
                  xor        s0, sp, s7
                  vfredmax.vs v6,v5,v19,v0.t
                  sra        a0, s10, zero
                  slt        t6, t6, s9
                  vmfgt.vf   v23,v8,ft7
                  vmflt.vf   v26,v3,ft5
                  vfmul.vv   v12,v6,v26
                  vmfgt.vf   v13,v5,fa3,v0.t
                  vfrsub.vf  v14,v7,ft7
                  mulh       s4, a7, sp
                  vfadd.vf   v19,v26,fs5,v0.t
                  mulhsu     s3, t4, s8
                  slti       t0, a7, 1019
                  vfsgnj.vf  v12,v18,fs6
                  vfcvt.x.f.v v20,v0
                  vmfne.vf   v4,v9,ft0
                  vfsgnjn.vv v9,v13,v18,v0.t
                  vfmin.vf   v3,v11,fa0
                  xor        s1, a3, a7
                  srai       a7, a4, 6
                  vfcvt.f.xu.v v23,v22
                  vmfge.vf   v2,v25,ft6,v0.t
                  and        s10, s5, s6
                  vfsgnjx.vv v1,v16,v15
                  vfredsum.vs v5,v0,v30
                  vfsgnjn.vf v22,v31,ft9
                  xori       a1, a5, -722
                  vfredsum.vs v19,v17,v6,v0.t
                  vfredosum.vs v0,v22,v6
                  sub        s10, a7, ra
                  vfsgnj.vv  v11,v14,v23
                  mul        t0, zero, a4
                  mulh       s10, a0, t0
                  or         s9, t5, t3
                  vfcvt.f.xu.v v12,v17
                  vmfne.vf   v7,v14,ft4
                  sra        a1, s5, s11
                  or         t1, sp, ra
                  vfcvt.x.f.v v1,v13
                  srl        t2, a0, a2
                  vfredsum.vs v11,v30,v18,v0.t
                  vfrsub.vf  v5,v27,fs7,v0.t
                  sltiu      a7, a3, -274
                  sltu       s3, a2, a5
                  vmflt.vf   v2,v20,ft10,v0.t
                  vfredosum.vs v27,v27,v11
                  vfcvt.xu.f.v v26,v2,v0.t
                  vfcvt.f.x.v v0,v3
                  vfredmax.vs v31,v17,v19
                  mulhu      a7, a5, a5
                  remu       t5, sp, a4
                  sltiu      a7, a1, -252
                  vmfgt.vf   v20,v0,fa7,v0.t
                  vfadd.vv   v27,v6,v20,v0.t
                  lui        gp, 659674
                  and        a7, a0, s5
                  vfclass.v v8,v21,v0.t
                  vfredsum.vs v20,v9,v25
                  vfcvt.x.f.v v24,v0,v0.t
                  vfadd.vv   v2,v18,v1,v0.t
                  and        t5, sp, a2
                  vfredmax.vs v0,v17,v25
                  xor        a5, s9, s4
                  rem        s7, t1, s8
                  vfmax.vv   v23,v31,v1,v0.t
                  sll        t5, a0, a4
                  vfcvt.x.f.v v7,v31,v0.t
                  and        zero, s10, a6
                  vfcvt.xu.f.v v24,v13
                  addi       a5, s2, 764
                  vfsub.vv   v7,v18,v16,v0.t
                  and        a5, a7, s9
                  andi       s0, s1, 797
                  andi       ra, a6, 341
                  sll        ra, s8, a3
                  vfredmax.vs v10,v25,v4
                  auipc      zero, 720428
                  vfcvt.f.xu.v v31,v19,v0.t
                  and        gp, a6, a3
                  andi       s10, a1, 998
                  vfcvt.xu.f.v v13,v10
                  vfadd.vf   v25,v0,fs0,v0.t
                  vfsgnjn.vv v10,v31,v21
                  xor        t3, t5, s11
                  slt        s9, s5, a6
                  vfredmax.vs v1,v24,v12,v0.t
                  vfsgnj.vf  v15,v14,fa1,v0.t
                  vfmax.vf   v26,v6,fa6,v0.t
                  srl        s10, s8, sp
                  slli       s4, t1, 14
                  sltu       a4, a5, t1
                  sltiu      s5, s1, -37
                  vmfge.vf   v6,v25,fs4
                  sltu       sp, ra, t2
                  vfsgnjn.vf v9,v17,fs9
                  vfmin.vf   v25,v15,fs9,v0.t
                  ori        t2, s8, -524
                  vmfgt.vf   v25,v11,fa5,v0.t
                  xor        s9, t1, a3
                  mul        s10, s0, a4
                  vfredmax.vs v21,v14,v5,v0.t
                  vmfeq.vf   v13,v14,ft1
                  mulhsu     a6, zero, s10
                  and        t0, s7, s7
                  vmfgt.vf   v20,v17,ft1,v0.t
                  vfadd.vf   v20,v4,fa6,v0.t
                  vfcvt.x.f.v v10,v19,v0.t
                  mul        ra, a2, t2
                  mul        t6, t2, tp
                  vmfge.vf   v28,v20,ft7,v0.t
                  auipc      t4, 791380
                  vfsgnjx.vv v27,v20,v20,v0.t
                  div        t6, gp, s9
                  sra        sp, s5, a1
                  addi       zero, s11, -587
                  rem        gp, a6, s10
                  or         s3, a4, s2
                  add        s5, s2, t1
                  srai       a4, s7, 4
                  vmfge.vf   v8,v29,fa4,v0.t
                  mulhsu     a5, s2, a3
                  sra        t2, t5, a1
                  vfsgnjn.vf v5,v27,fs1,v0.t
                  remu       a0, a1, a6
                  vfsgnjn.vf v30,v15,fs6
                  vfadd.vf   v25,v3,ft6
                  vmflt.vv   v13,v29,v20
                  and        t2, s8, s1
                  vfredmin.vs v6,v21,v23,v0.t
                  vmflt.vf   v10,v25,fs9
                  vfcvt.f.xu.v v22,v0,v0.t
                  vmfne.vf   v4,v23,fs9,v0.t
                  sub        s1, s3, s3
                  vfcvt.x.f.v v9,v18
                  slli       t3, s5, 16
                  lui        a6, 679550
                  div        t1, s0, t6
                  vfcvt.x.f.v v9,v6,v0.t
                  vfrsub.vf  v30,v2,fa7,v0.t
                  slli       sp, ra, 18
                  vfrsub.vf  v0,v18,fa0
                  vfcvt.f.xu.v v8,v19,v0.t
                  vfsgnjn.vv v5,v17,v1,v0.t
                  mul        a0, tp, a1
                  and        zero, a3, a5
                  mulhsu     a2, s7, s1
                  mulh       t1, t0, s5
                  lui        t0, 957204
                  vmfne.vv   v30,v15,v9,v0.t
                  add        s5, a0, a5
                  srai       s10, s2, 11
                  vmfgt.vf   v11,v28,fs1,v0.t
                  or         t6, s3, t2
                  vfredosum.vs v28,v11,v24
                  xor        a6, s11, t2
                  slli       t2, s2, 28
                  srli       gp, t5, 23
                  vfadd.vv   v31,v28,v16,v0.t
                  slti       s7, s10, 1021
                  addi       t3, ra, -323
                  slt        t3, a3, s4
                  vfsgnj.vf  v12,v19,fs6
                  vfadd.vf   v1,v0,ft1,v0.t
                  vfcvt.f.xu.v v8,v17,v0.t
                  xor        a0, a3, sp
                  sll        t1, s1, s0
                  vfcvt.f.xu.v v5,v13
                  lui        t1, 459307
                  vfsub.vv   v18,v1,v22,v0.t
                  and        s4, s4, tp
                  xor        t2, t1, s2
                  vfredmax.vs v9,v22,v25
                  and        zero, sp, s9
                  sll        s1, a5, t2
                  remu       a2, s3, gp
                  vmfeq.vf   v8,v18,fs8,v0.t
                  vfredmax.vs v3,v14,v20
                  vfrsub.vf  v31,v20,ft6
                  vmfle.vv   v5,v9,v6,v0.t
                  vmfeq.vv   v27,v5,v30,v0.t
                  vmfeq.vv   v2,v5,v22
                  divu       t5, t3, a0
                  mulh       s0, s8, s6
                  vmfne.vv   v13,v18,v10,v0.t
                  vfsub.vv   v24,v19,v2
                  slt        zero, t3, s9
                  vmfgt.vf   v30,v29,fs8,v0.t
                  vmfgt.vf   v3,v24,fs11,v0.t
                  div        s5, s4, zero
                  xori       t3, s9, -1000
                  or         tp, s8, t3
                  vfsgnj.vv  v15,v15,v2
                  mulhsu     s3, s3, a0
                  sltu       sp, s4, t5
                  auipc      t0, 728771
                  sub        t0, s1, t4
                  vfsgnj.vf  v5,v27,fs4,v0.t
                  vfredsum.vs v27,v25,v15
                  lui        s9, 27050
                  vfcvt.xu.f.v v15,v20
                  vfredmin.vs v2,v14,v7,v0.t
                  mulhsu     a1, s10, t6
                  add        ra, s11, s4
                  lui        sp, 246434
                  vfmin.vf   v24,v6,fs3
                  add        a6, gp, s10
                  or         t0, s0, t4
                  vmflt.vf   v7,v2,ft10,v0.t
                  vmfne.vv   v11,v12,v23,v0.t
                  auipc      t3, 728112
                  sub        s3, t1, zero
                  vfrsub.vf  v3,v28,fa1,v0.t
                  sra        s7, s11, s2
                  addi       ra, a7, -150
                  vfredosum.vs v24,v29,v24
                  vfmax.vf   v2,v10,ft4
                  vfrsub.vf  v17,v12,ft9
                  xori       t3, gp, -695
                  and        t6, t4, a7
                  vfcvt.f.xu.v v17,v31,v0.t
                  andi       a1, t6, -368
                  sub        s3, s9, a4
                  vmfne.vv   v13,v10,v12,v0.t
                  slli       t5, a5, 15
                  mulhu      t1, s9, s8
                  vfcvt.x.f.v v24,v24
                  sub        a4, s11, t6
                  vfadd.vf   v2,v7,fa7,v0.t
                  vfmin.vf   v27,v14,fs10,v0.t
                  sub        a6, s7, a2
                  vmfeq.vv   v6,v14,v0
                  lui        ra, 209489
                  sra        ra, s5, s1
                  xori       t3, t1, 592
                  vfsgnjn.vf v27,v25,fa3
                  srli       s0, s3, 28
                  vfmax.vf   v30,v24,ft10
                  vfrsub.vf  v25,v2,ft11,v0.t
                  vmfge.vf   v13,v16,fs1
                  addi       a1, a7, -909
                  or         t6, t1, a2
                  sll        t4, s0, zero
                  remu       t6, zero, a5
                  mulhu      t4, a4, s4
                  andi       s0, s10, 641
                  andi       s9, s11, 887
                  slli       s5, s3, 10
                  vfmul.vf   v19,v31,fs11
                  vfclass.v v24,v0,v0.t
                  vfmin.vf   v23,v13,fs5
                  xor        a5, zero, a0
                  srl        tp, s5, s7
                  lui        a1, 341503
                  sra        ra, s8, s11
                  mul        t1, a6, a3
                  vmfge.vf   v3,v22,ft6
                  vmfne.vf   v17,v0,ft9,v0.t
                  vfredmin.vs v30,v10,v10,v0.t
                  auipc      t3, 478860
                  remu       a0, s10, s0
                  srli       s10, s10, 12
                  rem        s1, t3, s3
                  vfsgnjx.vf v4,v0,fs7,v0.t
                  auipc      s9, 848200
                  srl        sp, sp, a1
                  andi       s0, t6, 148
                  srli       a2, s10, 27
                  vfcvt.f.xu.v v4,v19
                  lui        zero, 645282
                  and        a3, a3, tp
                  remu       s7, a6, s2
                  sll        ra, s0, a1
                  vmfeq.vv   v19,v15,v18
                  vfredosum.vs v24,v14,v23
                  vfcvt.f.x.v v16,v6
                  remu       s0, a6, t5
                  vfmul.vf   v31,v23,fs10,v0.t
                  vfrsub.vf  v1,v6,fs5,v0.t
                  mulh       zero, s4, s8
                  sra        t2, t0, a6
                  vfredsum.vs v7,v8,v0
                  vmfle.vf   v14,v12,ft3,v0.t
                  andi       a6, a3, -175
                  vfadd.vv   v12,v27,v10
                  vfcvt.f.x.v v15,v25,v0.t
                  vfmax.vf   v28,v19,fs11
                  sra        a6, t6, s5
                  slti       t2, a5, -374
                  vfredosum.vs v11,v19,v8,v0.t
                  vfredmin.vs v13,v4,v3
                  vfrsub.vf  v28,v2,ft3,v0.t
                  srli       s5, a4, 17
                  vfcvt.f.xu.v v13,v0,v0.t
                  vfsgnjn.vf v8,v18,fs0,v0.t
                  and        s0, t6, tp
                  vfsgnj.vf  v10,v1,fs9
                  vfsub.vv   v26,v21,v18
                  mulhu      t0, a1, s4
                  sub        t1, s2, s0
                  sltiu      ra, ra, 837
                  vfsgnjx.vv v6,v15,v8,v0.t
                  srai       a3, t3, 26
                  lui        gp, 380277
                  mul        s4, s1, s5
                  vfredosum.vs v27,v14,v20,v0.t
                  vfredsum.vs v30,v22,v23
                  vfsgnjn.vv v23,v31,v25,v0.t
                  vmfge.vf   v28,v19,fs1
                  vmfne.vf   v13,v15,ft5,v0.t
                  vmfgt.vf   v15,v22,ft6
                  vfcvt.f.xu.v v20,v22,v0.t
                  vmfge.vf   v16,v23,fs1,v0.t
                  vfredosum.vs v19,v10,v1
                  vfmin.vf   v14,v2,fs4
                  vmfle.vf   v11,v30,fs6,v0.t
                  mulhu      s8, tp, a1
                  auipc      tp, 78923
                  divu       s8, s6, s7
                  vmfne.vf   v23,v31,fs11
                  mul        a6, a2, s6
                  vfadd.vv   v25,v30,v13
                  sltu       t4, tp, t5
                  srl        a7, t3, gp
                  slti       s4, t5, 680
                  mul        s3, t4, a4
                  vmfne.vv   v23,v7,v4,v0.t
                  or         t3, s3, s1
                  vfsgnjx.vv v30,v11,v4
                  vfcvt.x.f.v v28,v26,v0.t
                  vmflt.vf   v21,v26,ft2,v0.t
                  vfsgnj.vv  v29,v14,v2,v0.t
                  vfsgnjx.vv v17,v27,v0,v0.t
                  slt        tp, s10, a5
                  slli       s5, s10, 27
                  ori        t4, tp, -321
                  ori        t5, s0, -32
                  mul        sp, zero, tp
                  vmfeq.vf   v29,v12,fs4,v0.t
                  vmfne.vv   v23,v28,v26,v0.t
                  mulhu      a1, s5, a2
                  andi       sp, a6, 148
                  mulhu      s3, gp, t1
                  vfsgnjn.vv v4,v21,v18,v0.t
                  vmfeq.vf   v13,v22,fa2,v0.t
                  vfcvt.f.xu.v v6,v27,v0.t
                  and        s9, s1, t1
                  srli       t0, a4, 29
                  div        a5, a4, sp
                  vfsgnjx.vf v23,v16,fa7,v0.t
                  slt        t6, s4, sp
                  rem        t4, t1, s10
                  div        sp, a6, s9
                  sra        s3, a6, a1
                  andi       t6, sp, 117
                  ori        sp, s8, 160
                  mulhu      gp, a1, s4
                  vfcvt.xu.f.v v27,v25
                  srai       s3, s6, 6
                  sub        sp, s7, s8
                  sub        a4, s11, a5
                  vmfge.vf   v8,v21,fs1
                  srli       s1, s0, 3
                  vfrsub.vf  v19,v31,fs9
                  remu       a6, s9, s2
                  vfmax.vf   v12,v26,ft11
                  or         s9, a1, a3
                  slli       s10, s3, 16
                  vfsgnjn.vf v11,v27,ft11,v0.t
                  vfsgnjn.vf v3,v12,ft11
                  mulhsu     t4, s0, ra
                  lui        tp, 598281
                  mulhu      a1, s8, t3
                  mulhsu     s3, tp, s9
                  vfmin.vf   v28,v30,ft2
                  vfclass.v v6,v4
                  vfredmin.vs v15,v26,v2
                  divu       s5, t6, t1
                  vfsgnjn.vv v25,v11,v2,v0.t
                  lui        s9, 734981
                  sltiu      t0, a6, 280
                  rem        a5, a2, s7
                  vfcvt.f.x.v v17,v0,v0.t
                  rem        a4, s11, t1
                  vfcvt.f.xu.v v2,v19
                  sub        t3, s0, s6
                  or         ra, a2, s7
                  vfsgnjn.vf v5,v24,fa0
                  vfcvt.f.xu.v v9,v11
                  or         tp, a2, a6
                  slti       t6, zero, 594
                  vfmul.vf   v26,v17,fs1,v0.t
                  andi       s1, t1, -906
                  add        s3, t5, s2
                  mul        s8, s6, s5
                  vfadd.vf   v6,v7,fs1
                  vmfgt.vf   v13,v2,fa6
                  vmflt.vv   v28,v23,v17,v0.t
                  vmfle.vf   v15,v31,fa6
                  sltiu      s3, sp, 578
                  lui        a0, 193104
                  mulhu      a6, zero, a5
                  vmfle.vv   v1,v14,v18
                  vfmax.vf   v3,v3,fa0,v0.t
                  remu       t4, tp, s1
                  remu       tp, a0, s5
                  vfredmin.vs v2,v20,v4
                  vfcvt.x.f.v v23,v26,v0.t
                  vmfgt.vf   v27,v14,ft11,v0.t
                  lui        s10, 770631
                  vfcvt.x.f.v v14,v6,v0.t
                  srai       s8, zero, 2
                  andi       s9, t5, -89
                  vfsgnjn.vf v14,v30,ft4
                  sub        s8, s11, t5
                  slli       zero, s0, 27
                  remu       ra, sp, s8
                  or         t4, sp, s1
                  divu       ra, t2, tp
                  vmfne.vf   v19,v3,fs5
                  add        tp, t1, s3
                  mul        t2, ra, a4
                  mul        a3, t0, a6
                  or         a0, s10, s7
                  vfmin.vv   v23,v22,v31,v0.t
                  vfmin.vv   v13,v5,v6,v0.t
                  vfcvt.x.f.v v0,v27
                  vfcvt.xu.f.v v25,v21
                  vfmin.vf   v14,v0,ft1,v0.t
                  vfmin.vv   v28,v26,v17
                  add        s5, s3, s9
                  lui        a0, 983729
                  div        a6, s4, a3
                  sll        a5, t4, a3
                  sltiu      a5, s1, 637
                  vmfle.vf   v1,v25,fs4
                  vfcvt.f.x.v v25,v24,v0.t
                  xor        s5, t5, zero
                  ori        s1, a4, 138
                  vfmax.vv   v8,v0,v5
                  addi       t4, s2, -1014
                  vfredmin.vs v17,v13,v22
                  vmfle.vf   v7,v18,fs11,v0.t
                  sltiu      t0, tp, -158
                  vfsgnjx.vv v10,v5,v23,v0.t
                  vfsub.vv   v31,v8,v22
                  vmflt.vv   v2,v30,v4,v0.t
                  sltu       t0, tp, s3
                  vfredmin.vs v5,v22,v25
                  mulhu      t1, a7, s6
                  vfcvt.f.x.v v14,v15,v0.t
                  div        a4, s11, t3
                  vfclass.v v19,v8
                  xori       a4, a6, 241
                  divu       zero, s3, sp
                  rem        t1, s11, a7
                  vmfeq.vv   v8,v23,v9,v0.t
                  vfrsub.vf  v0,v11,ft6
                  vfredmin.vs v0,v6,v18
                  sltiu      a1, s6, -430
                  vmfge.vf   v12,v2,fs9
                  vfredosum.vs v1,v11,v3
                  vfredmin.vs v4,v11,v13
                  vmfle.vf   v14,v17,ft3,v0.t
                  vfsub.vv   v17,v9,v8,v0.t
                  auipc      a5, 445749
                  vfsgnjn.vf v2,v31,fs5
                  divu       a4, a1, t6
                  srai       a3, t4, 29
                  vfsgnj.vf  v31,v0,fs11,v0.t
                  vfmul.vf   v18,v23,fa7
                  vfcvt.xu.f.v v16,v13,v0.t
                  sub        a6, t6, s10
                  or         s10, s9, a2
                  vmfle.vv   v1,v14,v12
                  vmfeq.vf   v28,v1,fa5
                  sll        a0, t5, a6
                  vfclass.v v18,v31,v0.t
                  lui        a7, 886502
                  vfredmax.vs v31,v7,v24
                  slt        t3, ra, t5
                  srli       a1, gp, 22
                  sltu       s1, s6, s4
                  sltu       a4, a6, a3
                  div        t0, t1, a3
                  srli       a6, t5, 14
                  vfrsub.vf  v23,v8,fs1
                  slli       tp, s4, 17
                  vfredsum.vs v22,v28,v1
                  srl        s7, s2, t6
                  ori        t1, a1, -905
                  div        s3, a7, gp
                  auipc      s1, 92148
                  sltu       s8, gp, t5
                  slli       a3, a3, 16
                  rem        s10, s11, t2
                  add        sp, s0, s6
                  srl        t6, s7, ra
                  slti       a3, s11, 93
                  sra        a4, s8, a6
                  vfclass.v v26,v10,v0.t
                  vfadd.vf   v24,v3,ft1
                  vfsub.vv   v6,v11,v18
                  and        t0, s6, s11
                  sltu       a6, tp, ra
                  vfmul.vf   v3,v13,fs2,v0.t
                  vfcvt.x.f.v v9,v27,v0.t
                  mul        s1, s0, s2
                  srl        a2, s11, sp
                  addi       a5, a0, -893
                  remu       s10, t6, a2
                  ori        t2, s4, 59
                  xor        tp, s2, a2
                  sll        s1, ra, zero
                  vfcvt.f.x.v v13,v28,v0.t
                  vfmax.vf   v18,v30,ft8
                  vfcvt.f.xu.v v31,v22
                  vfmax.vv   v19,v12,v21,v0.t
                  lui        t3, 64086
                  mul        a3, s1, tp
                  addi       a3, a0, 224
                  vfredosum.vs v21,v31,v24
                  lui        s5, 105807
                  vfmul.vv   v19,v13,v4,v0.t
                  mulhu      a6, s10, s0
                  vfmax.vv   v20,v19,v16
                  sltiu      t1, t4, 984
                  andi       ra, tp, 1019
                  vfcvt.f.x.v v19,v27
                  remu       a0, a2, s9
                  vmfne.vv   v14,v6,v20
                  srl        ra, a4, s3
                  srli       t6, s11, 14
                  vfrsub.vf  v27,v10,fa2
                  vmfeq.vf   v19,v28,ft11,v0.t
                  sltu       a1, s0, gp
                  vfsgnjx.vv v14,v8,v0,v0.t
                  vmfgt.vf   v25,v31,fa7,v0.t
                  vfcvt.f.x.v v9,v19
                  vfredmax.vs v11,v22,v22,v0.t
                  vmfge.vf   v24,v17,fs0
                  vfmul.vf   v27,v28,fs11,v0.t
                  vfcvt.xu.f.v v6,v22,v0.t
                  vfcvt.x.f.v v31,v24
                  slt        t6, gp, s5
                  vfmin.vv   v6,v30,v10,v0.t
                  vfcvt.x.f.v v9,v24,v0.t
                  slti       s5, sp, -354
                  mulh       gp, s9, t4
                  vfredsum.vs v16,v4,v22,v0.t
                  vmfne.vf   v26,v24,fa3,v0.t
                  vfadd.vv   v3,v16,v5
                  addi       s3, s4, 997
                  addi       s1, s2, -249
                  mul        t5, t0, s0
                  vfrsub.vf  v5,v0,ft2
                  ori        t0, a5, -452
                  vfredmax.vs v3,v2,v14
                  sltiu      gp, sp, 461
                  vmflt.vv   v30,v29,v4,v0.t
                  vmfgt.vf   v10,v20,fs3
                  mulhu      s8, a4, s11
                  vmflt.vf   v19,v14,fs11
                  vfadd.vv   v27,v27,v27
                  srai       t1, s10, 18
                  slt        t5, ra, t2
                  xori       zero, a1, -47
                  vfrsub.vf  v16,v7,fs2
                  vfredsum.vs v16,v1,v6
                  xor        t5, s1, gp
                  vfsgnj.vf  v16,v30,ft10,v0.t
                  vfsub.vf   v10,v31,ft2,v0.t
                  sub        s9, a3, t4
                  vfcvt.f.xu.v v20,v15
                  vfredosum.vs v22,v5,v0
                  sll        s0, a6, t6
                  and        s10, a4, s8
                  vmfeq.vv   v27,v20,v7,v0.t
                  vfmul.vf   v31,v6,fs0,v0.t
                  sltu       a5, sp, a4
                  vfcvt.f.x.v v26,v28
                  vfcvt.xu.f.v v9,v12,v0.t
                  andi       a4, tp, -267
                  slli       s5, a4, 15
                  mulhsu     s7, s11, s10
                  vfmin.vv   v20,v23,v18
                  vfredosum.vs v21,v19,v11
                  vfsgnjx.vv v27,v31,v30,v0.t
                  slli       a3, a7, 15
                  rem        a7, a1, ra
                  div        a6, s5, s7
                  div        t1, s11, s2
                  slti       sp, s10, -3
                  add        s1, s0, zero
                  vfcvt.f.xu.v v13,v24,v0.t
                  auipc      zero, 728976
                  vfsgnjx.vf v11,v24,fs5,v0.t
                  srai       a2, t6, 1
                  slt        s7, ra, s10
                  and        ra, a0, s7
                  srli       t1, t6, 18
                  srai       t2, s9, 11
                  srl        s5, s1, a1
                  srai       ra, s11, 15
                  lui        a7, 466264
                  sltu       s5, s3, t0
                  vfsub.vv   v30,v21,v17,v0.t
                  mulhu      gp, t1, t1
                  vfredmin.vs v17,v21,v7,v0.t
                  srai       s7, a0, 10
                  rem        s7, a5, s8
                  mul        tp, t2, a5
                  vmfne.vv   v30,v22,v10,v0.t
                  vfredosum.vs v8,v24,v19,v0.t
                  vfsgnj.vv  v11,v0,v8,v0.t
                  vfsub.vf   v31,v9,ft6,v0.t
                  sra        s7, s10, s10
                  vfadd.vv   v29,v24,v8
                  vmfne.vf   v18,v12,fs5
                  vmfne.vf   v18,v31,ft0,v0.t
                  vfmin.vf   v28,v11,fa6,v0.t
                  vfredsum.vs v8,v4,v2,v0.t
                  and        a7, tp, t3
                  divu       a2, s11, s11
                  divu       t3, a5, t1
                  sra        a1, t2, t5
                  rem        a5, s7, s8
                  mul        tp, a7, tp
                  vfclass.v v24,v9,v0.t
                  vfredmin.vs v1,v20,v29
                  srai       s1, a6, 27
                  vmfgt.vf   v0,v8,ft4
                  add        a5, gp, t2
                  xor        t4, t1, t1
                  xor        s7, s3, s7
                  vfsub.vv   v1,v14,v1
                  mulh       gp, a4, s9
                  vfrsub.vf  v14,v18,fs8,v0.t
                  xori       a0, gp, 193
                  vfclass.v v9,v16
                  srl        t3, s0, tp
                  vfmin.vv   v3,v0,v25,v0.t
                  vfmax.vv   v18,v31,v19
                  and        t4, s11, t6
                  vfsgnj.vf  v30,v7,ft5
                  vfmax.vv   v13,v3,v23
                  slti       a2, a4, 697
                  vfcvt.x.f.v v29,v18,v0.t
                  addi       s3, a6, -68
                  vfcvt.xu.f.v v3,v27
                  vfredmax.vs v8,v9,v1,v0.t
                  mulh       t3, s10, s0
                  sltu       s8, sp, a0
                  xori       t2, s8, 11
                  slt        a4, s4, s6
                  srli       t1, ra, 1
                  vfclass.v v4,v17
                  xor        t3, s8, a0
                  vfcvt.xu.f.v v8,v29
                  srli       a0, s6, 26
                  vmfle.vf   v3,v28,fs4,v0.t
                  mulhu      a1, s4, s11
                  vfsgnjn.vf v28,v21,fa0,v0.t
                  vfmin.vf   v28,v29,ft0,v0.t
                  vfsgnjx.vf v0,v30,fa0
                  vfmul.vv   v14,v3,v18
                  srai       a4, t3, 13
                  vfredmin.vs v9,v12,v16
                  vfrsub.vf  v21,v3,ft11,v0.t
                  sub        s3, sp, t4
                  div        a1, ra, s8
                  mulhu      a6, a5, a1
                  vfcvt.xu.f.v v30,v13,v0.t
                  vfcvt.f.x.v v31,v9
                  or         s10, t6, s11
                  srl        t0, s10, t0
                  rem        t3, s3, a5
                  addi       s0, s6, 560
                  auipc      zero, 152730
                  vfsub.vf   v14,v19,fs7,v0.t
                  or         s8, s6, s7
                  srl        a1, s2, s1
                  andi       t5, t5, 433
                  rem        a7, s9, t3
                  sll        zero, a0, a6
                  vfadd.vv   v13,v11,v14,v0.t
                  mul        s5, a1, t0
                  vmfge.vf   v0,v28,fs10
                  addi       s0, a7, 384
                  vmfle.vv   v29,v17,v13,v0.t
                  vfredmin.vs v24,v18,v11
                  vfmax.vf   v14,v26,ft5
                  vfcvt.f.xu.v v18,v1
                  sltiu      t5, s11, -332
                  mulhsu     s8, a5, ra
                  and        a1, t4, s10
                  lui        s3, 744408
                  vfredmax.vs v14,v3,v0
                  vmfle.vf   v10,v12,fs2,v0.t
                  vfsub.vf   v9,v16,fa4,v0.t
                  vfredosum.vs v8,v6,v16
                  vmfgt.vf   v16,v2,fa7
                  add        t2, a1, tp
                  xor        s8, t2, a2
                  vfredsum.vs v2,v4,v4,v0.t
                  vfsgnj.vv  v21,v13,v18
                  vfcvt.xu.f.v v5,v22
                  vfmax.vf   v11,v10,fa7,v0.t
                  rem        a3, t6, a2
                  div        s0, s0, a5
                  andi       t1, a5, -144
                  andi       s0, t1, 528
                  div        s4, s9, a7
                  slt        s7, a4, s8
                  mulhsu     a0, s7, t5
                  sub        a6, a0, t0
                  vfredmax.vs v24,v13,v25
                  rem        s9, s3, s0
                  vmfge.vf   v7,v12,ft11
                  vfrsub.vf  v18,v14,fs10
                  mul        t0, a3, t5
                  slt        sp, t0, sp
                  xor        a5, t6, s9
                  vmfne.vv   v25,v30,v18,v0.t
                  mulhu      a0, zero, s4
                  rem        zero, a7, a4
                  addi       s9, t1, -251
                  srli       s4, t5, 13
                  add        t1, s0, s6
                  vmfge.vf   v11,v0,fs3,v0.t
                  vfcvt.xu.f.v v15,v15,v0.t
                  slt        t6, s1, a6
                  div        a7, tp, a3
                  vfclass.v v11,v10
                  and        s8, t3, s10
                  vfcvt.xu.f.v v23,v2,v0.t
                  vfredmin.vs v25,v3,v9
                  srl        a1, t5, gp
                  andi       t3, s3, -774
                  srl        s10, t4, s4
                  slli       gp, t0, 7
                  sltu       t0, t0, t1
                  sltu       s4, a5, t4
                  vfcvt.f.xu.v v4,v4
                  srai       a2, zero, 21
                  xori       a1, s8, -501
                  vfsgnjx.vf v6,v9,fa1,v0.t
                  vfrsub.vf  v17,v1,fa5
                  xor        s8, a6, a5
                  vfcvt.f.x.v v7,v29
                  sra        s7, t2, s11
                  xori       sp, s10, 559
                  vfcvt.x.f.v v22,v15,v0.t
                  sltiu      tp, ra, -648
                  vfredosum.vs v25,v7,v16,v0.t
                  xor        s8, t4, t5
                  vfsgnjn.vv v18,v31,v16,v0.t
                  vfmul.vv   v0,v28,v17
                  vfcvt.f.x.v v25,v29,v0.t
                  xor        sp, a6, s3
                  and        gp, t6, a5
                  slli       s3, gp, 20
                  auipc      a2, 147301
                  mul        t4, a7, s10
                  vmfle.vf   v14,v4,fa5
                  ori        a1, gp, 897
                  srl        a6, s4, a1
                  vmflt.vv   v3,v22,v16
                  vfcvt.f.xu.v v18,v28,v0.t
                  sra        a1, a0, ra
                  vfsgnjx.vv v4,v23,v16,v0.t
                  ori        s4, s3, -938
                  add        s1, a1, a1
                  sra        zero, s9, a5
                  sll        ra, gp, s7
                  slli       s9, a0, 9
                  vfcvt.f.xu.v v17,v27
                  vfcvt.f.x.v v23,v21,v0.t
                  slt        a6, a4, s7
                  sltiu      s10, s5, -459
                  vfcvt.x.f.v v18,v30
                  vfmax.vf   v26,v18,fa0,v0.t
                  lui        t1, 998853
                  srai       a3, s0, 7
                  vfcvt.f.xu.v v26,v3
                  vmfgt.vf   v4,v24,ft1
                  vfredosum.vs v20,v14,v21
                  sltu       s3, s6, s8
                  div        a4, a5, t3
                  mulhu      tp, s0, a5
                  add        t1, s1, a4
                  vfadd.vf   v2,v30,ft7,v0.t
                  add        s8, a0, a7
                  vfmax.vf   v14,v0,fs6
                  or         s8, s2, s6
                  sll        a0, s2, a4
                  sltu       s5, s2, a2
                  vmfeq.vf   v0,v13,fs4
                  mulhu      a7, a7, a5
                  div        a4, s1, s7
                  vfsub.vv   v9,v7,v0,v0.t
                  vmfne.vf   v1,v12,ft11,v0.t
                  addi       ra, t6, -127
                  slt        s0, s4, t6
                  vfmax.vv   v14,v31,v8
                  or         s0, s0, t5
                  sub        ra, a6, t2
                  vfcvt.f.xu.v v18,v29
                  mul        s1, tp, a3
                  vfclass.v v12,v6,v0.t
                  rem        s9, t4, t3
                  rem        t0, s2, s8
                  vfsgnjx.vf v15,v13,fs7
                  lui        a6, 929603
                  vmfle.vv   v13,v28,v18
                  divu       s8, tp, sp
                  vfredsum.vs v7,v31,v17
                  vfredmin.vs v28,v30,v2
                  vfredmax.vs v6,v30,v21,v0.t
                  vfsgnjn.vf v29,v12,fs2,v0.t
                  vfmax.vf   v31,v22,ft7,v0.t
                  vfredsum.vs v0,v11,v3
                  andi       s4, s4, 460
                  vfcvt.xu.f.v v2,v8,v0.t
                  mulh       s9, t2, a5
                  vmflt.vf   v11,v26,fs0,v0.t
                  remu       t5, a2, s5
                  vfredsum.vs v9,v14,v17
                  lui        t0, 681397
                  sra        a4, a6, s10
                  vfredosum.vs v15,v21,v9,v0.t
                  xori       a5, sp, -12
                  mulh       ra, t4, a4
                  srl        a3, s3, s10
                  add        a1, ra, s5
                  vmflt.vf   v17,v22,fs1
                  slli       ra, a4, 15
                  andi       a6, t4, -159
                  vfredosum.vs v1,v18,v24,v0.t
                  sltiu      t3, s5, 97
                  slt        a4, a3, s7
                  vfmul.vf   v16,v2,ft3
                  vfredmax.vs v3,v26,v4
                  vfsgnj.vv  v23,v6,v16,v0.t
                  addi       s3, a3, 351
                  vfcvt.xu.f.v v28,v17,v0.t
                  mulhu      a4, a6, t0
                  or         a1, s11, t0
                  xori       gp, t4, 989
                  vmflt.vf   v29,v4,fs3,v0.t
                  srl        t2, s6, a4
                  vfcvt.x.f.v v25,v24,v0.t
                  andi       s0, a4, 122
                  remu       t5, tp, s5
                  mulh       s5, s6, t3
                  vfmin.vf   v17,v23,fs8,v0.t
                  srai       s10, s9, 3
                  srl        a4, tp, a7
                  vfclass.v v16,v13,v0.t
                  mulhu      t2, sp, s11
                  sltu       a1, t6, s7
                  mulhu      t6, s8, t0
                  andi       a3, a3, -605
                  vfclass.v v12,v7
                  sltu       t6, s3, s5
                  mulhu      t3, t5, a1
                  vfsub.vv   v29,v2,v14
                  vmfne.vf   v27,v17,fa0
                  vfsgnjx.vf v31,v1,ft5,v0.t
                  sltu       a1, t2, s1
                  vfredmin.vs v30,v21,v3,v0.t
                  add        s4, t2, s10
                  vfredmin.vs v19,v15,v6,v0.t
                  vfrsub.vf  v0,v24,fs3
                  vmflt.vf   v9,v3,fa7,v0.t
                  vmfgt.vf   v15,v10,ft1,v0.t
                  vfcvt.f.xu.v v18,v3
                  slt        a3, s11, s0
                  srl        t6, s7, zero
                  addi       t3, t1, 267
                  srli       sp, s7, 13
                  vfmul.vv   v15,v7,v17
                  vfredmin.vs v3,v31,v0,v0.t
                  and        s9, s1, a2
                  vfredmax.vs v16,v15,v21
                  vfcvt.f.xu.v v20,v18
                  xor        s4, s5, gp
                  vmflt.vv   v7,v15,v8,v0.t
                  mul        s1, zero, s7
                  div        t2, s1, tp
                  vfmax.vf   v4,v18,fs6,v0.t
                  rem        a3, a0, t4
                  auipc      ra, 440690
                  vfmax.vv   v22,v24,v11
                  add        gp, s2, t6
                  xor        sp, s8, s11
                  vfsgnjx.vv v17,v29,v15
                  andi       s0, t3, -227
                  addi       s1, s4, 403
                  srai       s0, t3, 4
                  mulhu      s0, s9, t5
                  vfrsub.vf  v4,v31,ft5
                  vmfne.vf   v15,v14,fs8,v0.t
                  or         s9, s11, s9
                  vmfgt.vf   v29,v8,ft11
                  vmfeq.vv   v14,v20,v25,v0.t
                  vfredmax.vs v5,v4,v22,v0.t
                  vmfgt.vf   v13,v7,ft8
                  vfmul.vv   v11,v4,v5
                  vmfge.vf   v0,v3,ft2
                  xor        t2, t3, s4
                  vfmul.vf   v4,v28,fs0,v0.t
                  div        t6, s9, a0
                  sub        t5, a1, s10
                  div        zero, t0, t0
                  vfredmax.vs v15,v10,v7,v0.t
                  vmflt.vv   v19,v22,v0
                  vfclass.v v28,v21,v0.t
                  vfmax.vv   v13,v1,v0
                  vfadd.vf   v24,v29,ft8,v0.t
                  vfrsub.vf  v24,v8,fs4,v0.t
                  vfmul.vv   v18,v16,v11,v0.t
                  vfmax.vv   v2,v7,v9
                  mul        gp, s2, s3
                  auipc      a7, 152143
                  auipc      s0, 115595
                  slt        s0, s8, s5
                  and        t5, s10, s5
                  vmfgt.vf   v25,v22,ft2
                  slti       a1, t3, -761
                  vfsgnjx.vf v1,v16,fs1,v0.t
                  vmflt.vf   v19,v21,fa0
                  lui        s9, 559134
                  mulhsu     t6, a0, gp
                  ori        t2, a7, 700
                  vfclass.v v6,v30,v0.t
                  and        s0, zero, tp
                  vfmin.vv   v23,v9,v9
                  vfsgnj.vv  v29,v9,v3,v0.t
                  vfredosum.vs v23,v24,v27,v0.t
                  vfmax.vf   v0,v6,fa2
                  vmfge.vf   v12,v27,fs9,v0.t
                  add        sp, zero, a5
                  vfsgnjn.vf v10,v30,ft10,v0.t
                  vfsgnjn.vf v18,v3,fs1
                  or         s0, t5, a2
                  mul        a7, a0, zero
                  srai       a3, s6, 25
                  vmfle.vf   v16,v18,ft5
                  srli       s5, a2, 10
                  vfsgnjx.vv v8,v1,v12
                  mulh       s4, s4, s3
                  vfsgnj.vf  v19,v26,ft0
                  vfmin.vv   v8,v12,v16
                  vfredmax.vs v3,v14,v21,v0.t
                  remu       a6, t1, t0
                  mulh       s1, sp, t0
                  vfredosum.vs v20,v3,v10
                  sltu       s5, s11, sp
                  slt        t4, gp, s9
                  slti       a1, gp, -980
                  xori       s4, a6, 403
                  vfsub.vf   v4,v27,ft9,v0.t
                  sub        s4, a7, s8
                  slli       a3, a6, 22
                  slli       s1, zero, 29
                  addi       s4, s6, 610
                  vfmul.vv   v18,v5,v25,v0.t
                  vmfgt.vf   v16,v18,fa3
                  mulhu      a7, s10, zero
                  slti       s7, a4, 898
                  vfredmax.vs v8,v24,v0
                  mulhsu     s10, t2, t3
                  sltiu      a6, t4, 378
                  srli       gp, s2, 30
                  vmfge.vf   v7,v31,fs8,v0.t
                  sltiu      s5, a6, 977
                  sltiu      s0, s4, 388
                  vfcvt.f.x.v v22,v7,v0.t
                  mul        gp, sp, a2
                  div        s7, a1, t2
                  srai       t6, t0, 0
                  lui        t0, 647483
                  vfcvt.f.xu.v v9,v1
                  slti       tp, s11, 204
                  and        a5, s9, s2
                  vfmin.vv   v10,v16,v22
                  vfmax.vf   v3,v31,fs1,v0.t
                  vfmul.vv   v2,v7,v10
                  and        tp, t4, a0
                  mul        ra, t5, t5
                  rem        s4, t3, gp
                  sra        a6, s11, s11
                  vmfeq.vf   v17,v28,ft3,v0.t
                  sra        t6, tp, s10
                  sll        zero, s0, a4
                  lui        tp, 90450
                  vfredsum.vs v10,v1,v27,v0.t
                  vmflt.vv   v1,v24,v10,v0.t
                  sll        s0, s6, t6
                  mul        s0, a7, a7
                  rem        s4, s6, s11
                  xori       s1, a5, 831
                  andi       s7, s9, -677
                  lui        a6, 197372
                  slli       t1, s8, 10
                  vfredsum.vs v15,v30,v23
                  sub        a5, s4, s3
                  divu       t0, s4, t6
                  div        a3, sp, s11
                  vfadd.vf   v23,v20,ft1,v0.t
                  vfmax.vv   v2,v7,v17
                  ori        s9, a4, 75
                  sltu       s10, gp, a2
                  vmflt.vv   v7,v15,v31,v0.t
                  sll        a3, s10, t4
                  vfcvt.xu.f.v v27,v6
                  vfmul.vv   v30,v23,v18
                  vmfgt.vf   v28,v26,fs0,v0.t
                  srl        t5, s5, s10
                  mulhu      a4, a5, tp
                  vfredmax.vs v20,v0,v4,v0.t
                  vfredsum.vs v22,v22,v21
                  srl        a0, a4, a1
                  vmflt.vf   v25,v31,fa4
                  vfrsub.vf  v4,v20,fs4
                  slt        s9, s8, a1
                  vfsgnjx.vv v24,v3,v2
                  vmfge.vf   v26,v25,ft4,v0.t
                  ori        t2, a0, -781
                  divu       gp, s6, s4
                  vmflt.vv   v17,v26,v16,v0.t
                  sra        a3, t5, a3
                  vfsgnj.vv  v29,v3,v28,v0.t
                  xori       sp, a5, 444
                  sll        a0, t3, s5
                  vfmax.vf   v10,v20,fs7
                  vmflt.vv   v7,v20,v22,v0.t
                  vfadd.vv   v14,v6,v18
                  andi       a4, s1, -321
                  vfcvt.x.f.v v19,v24,v0.t
                  vfmul.vf   v19,v3,ft1
                  vfsgnj.vv  v25,v11,v4,v0.t
                  vfcvt.xu.f.v v18,v11
                  remu       t2, s7, s11
                  vfredmax.vs v23,v16,v26,v0.t
                  vfredmin.vs v13,v28,v27,v0.t
                  vfcvt.xu.f.v v4,v16
                  vfredosum.vs v18,v1,v21
                  lui        a6, 684279
                  ori        t3, t4, -808
                  vfsgnjn.vv v30,v24,v8
                  slli       t6, a7, 26
                  mulhu      a6, t4, s5
                  srai       s1, sp, 7
                  vfsgnj.vf  v3,v4,ft11
                  vfredmin.vs v11,v5,v24,v0.t
                  vfredosum.vs v6,v28,v2
                  divu       s7, s6, s1
                  xori       a6, a2, -334
                  vmfge.vf   v2,v15,fa1
                  sll        a2, s6, a1
                  vfsgnjx.vf v22,v7,ft3,v0.t
                  vfmul.vv   v27,v11,v3,v0.t
                  vfcvt.f.x.v v20,v10
                  auipc      s4, 384030
                  vfredosum.vs v6,v10,v6
                  srli       t0, t2, 17
                  mulhu      t2, t6, s1
                  slti       s4, a0, 453
                  mul        s3, t1, s11
                  div        t2, t3, s0
                  or         a4, s2, s1
                  ori        s4, s7, -37
                  vfsgnjn.vv v18,v20,v10,v0.t
                  vmfeq.vf   v16,v3,fs7
                  vfcvt.x.f.v v12,v23
                  div        a7, a0, a1
                  vfadd.vv   v26,v8,v1
                  vfredosum.vs v1,v5,v30
                  vfredosum.vs v27,v25,v1
                  vfmin.vf   v29,v11,ft8
                  srai       t1, a1, 30
                  vfsgnjx.vf v27,v8,fs2,v0.t
                  srli       a2, s2, 7
                  mulhsu     a1, s10, s3
                  and        s10, s3, t1
                  remu       t0, zero, gp
                  vfcvt.f.x.v v18,v7,v0.t
                  vmfne.vv   v22,v16,v23,v0.t
                  vfclass.v v24,v28
                  vmfge.vf   v24,v27,ft7,v0.t
                  sra        sp, t4, a7
                  vfredosum.vs v17,v20,v11
                  auipc      t5, 799200
                  sltiu      s5, t6, -314
                  add        tp, a6, s1
                  remu       a2, tp, sp
                  or         a0, a7, t3
                  sll        zero, t1, s9
                  mulh       a6, s1, tp
                  xori       t2, t3, -934
                  vfmul.vv   v10,v17,v24,v0.t
                  vfsub.vf   v20,v27,fs10,v0.t
                  andi       sp, a7, -634
                  and        ra, a2, t0
                  mulhu      s9, s2, a0
                  auipc      a0, 995751
                  vfredsum.vs v18,v10,v11
                  mul        a1, t4, a2
                  srl        s5, a2, tp
                  srli       t3, a4, 8
                  srai       s8, s3, 12
                  vfsub.vv   v10,v5,v4,v0.t
                  divu       s4, s11, t3
                  lui        s3, 976925
                  mul        a1, a2, a6
                  xor        s10, a0, s4
                  vfcvt.xu.f.v v17,v7,v0.t
                  sltu       t2, gp, t6
                  vfrsub.vf  v12,v21,fs1
                  vfredmax.vs v3,v28,v29
                  rem        s8, gp, s1
                  slti       gp, s3, 208
                  vfadd.vf   v23,v20,fs5
                  remu       a4, a0, ra
                  vfredosum.vs v26,v18,v13
                  vfrsub.vf  v14,v8,fa7,v0.t
                  xor        s9, s4, s4
                  vfcvt.x.f.v v17,v24
                  vfsub.vv   v27,v24,v6,v0.t
                  vmfge.vf   v28,v7,fs7
                  vmfeq.vf   v18,v31,ft1,v0.t
                  slti       a5, s3, -517
                  sll        s7, t5, a5
                  vmfgt.vf   v22,v5,fs2,v0.t
                  and        a1, a2, t0
                  srli       a0, gp, 27
                  vfrsub.vf  v24,v6,fs2
                  vfredmax.vs v23,v25,v17,v0.t
                  vfsub.vf   v24,v21,ft6
                  vfmax.vv   v8,v17,v5,v0.t
                  auipc      s5, 921470
                  vfclass.v v1,v15
                  slt        a7, ra, s11
                  remu       a1, a0, a5
                  sub        s7, t1, tp
                  srai       s3, a7, 30
                  sll        a2, gp, s5
                  srli       t3, a0, 20
                  vfrsub.vf  v21,v12,ft3
                  vfsgnjx.vf v5,v18,fs8
                  vfcvt.f.x.v v21,v26,v0.t
                  mulhu      a3, s10, s1
                  ori        t3, a6, 449
                  mulhsu     s10, sp, gp
                  vmfeq.vv   v20,v26,v25,v0.t
                  vfadd.vf   v22,v11,fs10
                  vfmax.vv   v1,v26,v2
                  andi       zero, s2, 128
                  lui        s5, 689994
                  vfclass.v v0,v12
                  remu       a0, sp, sp
                  add        a0, s7, a3
                  mulhu      sp, a3, gp
                  vfredmax.vs v16,v29,v11
                  vfcvt.f.xu.v v1,v23,v0.t
                  vfsub.vf   v19,v20,ft9
                  sltiu      t0, a7, 919
                  ori        a3, a7, 973
                  vmfge.vf   v3,v29,fa4
                  vfredmax.vs v27,v23,v3,v0.t
                  vfsub.vf   v1,v31,fs10
                  slt        sp, s10, a1
                  vfmin.vv   v4,v2,v2
                  vfcvt.x.f.v v22,v9
                  sra        t1, t4, a6
                  vfrsub.vf  v30,v13,ft6,v0.t
                  auipc      t5, 833963
                  srl        a7, t3, t2
                  remu       a5, gp, t2
                  vfcvt.f.x.v v31,v27,v0.t
                  vfcvt.x.f.v v14,v8
                  vfcvt.xu.f.v v23,v30,v0.t
                  slti       t1, t1, 784
                  addi       a3, s3, 511
                  vfmax.vv   v12,v6,v17,v0.t
                  lui        a0, 355902
                  auipc      s8, 766620
                  vfcvt.x.f.v v3,v26
                  vfsgnjn.vv v26,v13,v13
                  vfsub.vf   v7,v14,fs7,v0.t
                  sltiu      t6, s1, 557
                  vfsub.vf   v8,v9,fs11,v0.t
                  vfsgnj.vv  v7,v13,v24
                  sltiu      t2, a6, 307
                  vmfeq.vv   v28,v30,v5
                  vfsgnjx.vf v22,v2,fa7
                  vfcvt.x.f.v v24,v4
                  mulhsu     a5, s2, sp
                  xor        s9, s11, a2
                  vfredmin.vs v17,v6,v19,v0.t
                  srai       a5, t0, 12
                  vfsgnj.vv  v15,v2,v13,v0.t
                  vfsub.vv   v16,v20,v22,v0.t
                  sub        s9, s0, a5
                  vfcvt.f.x.v v15,v23
                  vfmax.vf   v23,v20,fa5,v0.t
                  xor        s8, s2, s10
                  xor        s4, a4, s1
                  add        sp, s10, gp
                  vmfge.vf   v14,v24,fa2,v0.t
                  or         t2, t3, a6
                  vfcvt.f.x.v v9,v5,v0.t
                  xor        t3, s2, a4
                  div        s4, s10, a3
                  vfcvt.f.xu.v v25,v15
                  mul        a3, t1, ra
                  divu       sp, zero, t2
                  sltu       a1, s6, a5
                  addi       s1, s7, 81
                  vfcvt.x.f.v v26,v1
                  vfredmax.vs v29,v18,v1
                  div        a1, a1, s11
                  auipc      s9, 89526
                  vfredmin.vs v24,v20,v25
                  srl        s8, t6, zero
                  ori        a6, s10, 298
                  vmfge.vf   v15,v28,fa7
                  xori       sp, gp, 917
                  vfcvt.f.x.v v29,v31
                  and        a7, t2, s3
                  vfmin.vv   v21,v8,v20,v0.t
                  mulhu      zero, s0, t5
                  vmflt.vf   v25,v3,fa5,v0.t
                  ori        a4, gp, 140
                  xori       a4, a1, -506
                  vmfge.vf   v2,v30,fa0,v0.t
                  vfmin.vv   v7,v12,v1,v0.t
                  rem        a4, s11, s7
                  vfcvt.x.f.v v29,v10,v0.t
                  vmfne.vf   v1,v0,fa0
                  vfsgnjx.vf v4,v24,fs7,v0.t
                  ori        s3, a1, -990
                  lui        t1, 397826
                  vmflt.vv   v27,v4,v10,v0.t
                  vfadd.vv   v0,v25,v31
                  mulhu      a7, a6, s9
                  and        gp, t5, tp
                  vfsgnjn.vf v10,v27,ft9
                  vfadd.vf   v28,v18,ft8
                  vmflt.vv   v20,v21,v0,v0.t
                  mulhsu     t6, sp, s11
                  vmfeq.vv   v11,v18,v29
                  add        s7, s5, t0
                  vfrsub.vf  v9,v25,fs5,v0.t
                  vmfge.vf   v2,v14,fs3
                  vmfne.vv   v24,v1,v22,v0.t
                  vfsgnjn.vf v5,v28,fs5,v0.t
                  xori       t1, ra, -31
                  mulh       t6, t5, s3
                  vmfgt.vf   v12,v25,ft1,v0.t
                  sltu       t6, t0, t4
                  vfredmax.vs v21,v4,v13,v0.t
                  and        a3, t1, s10
                  mulh       a3, a1, s8
                  vmfle.vf   v7,v22,ft4
                  sra        a1, a5, s8
                  vfsub.vf   v17,v24,fs7,v0.t
                  andi       a0, s8, -776
                  and        a7, s5, t5
                  mulhsu     t5, a3, s7
                  vmfge.vf   v7,v8,fa3
                  vfsub.vv   v28,v30,v24
                  andi       s1, s10, 116
                  lui        a7, 542463
                  mulh       a2, gp, a1
                  vfredosum.vs v21,v3,v23,v0.t
                  sra        s0, t0, a1
                  xori       t6, a7, -35
                  divu       ra, s5, a1
                  or         s4, t4, t0
                  divu       s3, s3, s3
                  vfredmax.vs v16,v31,v21,v0.t
                  mulhu      a4, t0, s8
                  vfcvt.f.xu.v v2,v8,v0.t
                  sll        sp, a2, gp
                  xor        s3, s4, t4
                  andi       ra, tp, -43
                  addi       s7, a0, -50
                  vfredmax.vs v17,v19,v24
                  auipc      s0, 584591
                  remu       s3, s6, a5
                  vmfeq.vf   v16,v5,fs7,v0.t
                  div        a6, tp, s4
                  srli       a1, a1, 19
                  or         s3, a5, a7
                  xor        t0, a1, s3
                  andi       gp, s5, -986
                  vfrsub.vf  v19,v25,ft9,v0.t
                  srl        gp, s8, s1
                  addi       a3, zero, 81
                  vfsgnj.vf  v17,v27,fs10
                  slli       zero, s0, 4
                  mulh       s9, tp, t2
                  vfsgnj.vv  v16,v10,v26,v0.t
                  vmfne.vf   v28,v1,fs8,v0.t
                  andi       a6, s3, 94
                  slli       s5, a7, 8
                  srl        s4, s6, sp
                  vmflt.vf   v27,v17,ft9,v0.t
                  srli       a1, t3, 16
                  rem        a5, a7, a5
                  or         t2, a7, a3
                  vmfeq.vf   v1,v24,fa7,v0.t
                  mul        t5, a6, t1
                  vmfne.vf   v31,v20,fa6,v0.t
                  vmfgt.vf   v3,v27,fs0
                  sltiu      ra, a1, 50
                  and        zero, zero, gp
                  vfcvt.f.x.v v29,v3,v0.t
                  srli       s9, a3, 5
                  mulhsu     t6, s2, t2
                  slli       s4, t6, 29
                  srli       a3, s10, 23
                  srli       a3, s5, 9
                  mulh       tp, s1, s3
                  vmfeq.vf   v7,v29,fs5
                  vmfeq.vv   v8,v3,v1,v0.t
                  mul        a4, s10, s4
                  vfredmax.vs v27,v24,v2,v0.t
                  andi       s7, gp, 190
                  div        a7, s4, s2
                  sltu       t2, a4, s0
                  rem        s5, ra, s6
                  lui        a5, 861590
                  srli       s1, a7, 20
                  vfcvt.f.x.v v1,v19,v0.t
                  vfsgnjx.vv v0,v20,v18
                  vfmax.vv   v20,v28,v3,v0.t
                  vfclass.v v18,v23,v0.t
                  slti       t2, s1, 391
                  vfcvt.f.x.v v22,v29
                  and        a6, t6, t4
                  vmfeq.vf   v16,v28,ft9,v0.t
                  add        t4, s3, s9
                  vfredmin.vs v17,v28,v27,v0.t
                  vfredosum.vs v11,v27,v29
                  auipc      a6, 971311
                  vfredmax.vs v5,v23,v14
                  vfredsum.vs v19,v4,v25,v0.t
                  mulhu      s3, a2, a4
                  srli       t5, a7, 9
                  vmfle.vv   v29,v31,v16,v0.t
                  slt        a0, s4, t6
                  vmfge.vf   v14,v11,ft11
                  vfsgnjn.vv v19,v14,v9
                  vfclass.v v16,v2,v0.t
                  sll        t3, tp, s11
                  vmfge.vf   v2,v16,fa4
                  slt        t2, sp, a5
                  sll        a4, a0, s3
                  vfsgnj.vf  v11,v31,fa2,v0.t
                  mulhsu     t4, a3, s10
                  add        s7, a2, s0
                  vmflt.vv   v21,v16,v0
                  div        t0, s5, s8
                  vmfge.vf   v26,v5,fs2
                  remu       gp, s6, s2
                  slli       tp, sp, 16
                  vfcvt.f.x.v v13,v26
                  andi       t1, s0, 1002
                  andi       a5, s5, -770
                  vfmax.vf   v21,v27,ft4
                  vmfle.vf   v31,v21,ft6,v0.t
                  vfredmax.vs v28,v10,v12,v0.t
                  lui        a1, 483101
                  vfmin.vv   v31,v8,v27,v0.t
                  vmfge.vf   v3,v29,fs2,v0.t
                  srai       s3, a1, 28
                  vmfeq.vv   v17,v24,v9,v0.t
                  vfcvt.xu.f.v v7,v6,v0.t
                  vfcvt.xu.f.v v22,v18,v0.t
                  mulh       a2, t2, s1
                  rem        s5, a4, s6
                  vmfgt.vf   v11,v1,fa5,v0.t
                  andi       s10, a6, 1014
                  vfclass.v v19,v30,v0.t
                  sub        s3, t6, s9
                  srli       t3, a5, 24
                  divu       t0, zero, a0
                  addi       s1, ra, -648
                  vfredmax.vs v23,v28,v21
                  vmfle.vv   v22,v8,v18
                  vfsgnj.vv  v0,v22,v8
                  vfredsum.vs v0,v26,v27
                  vmfle.vf   v19,v21,fs2
                  vfmul.vf   v7,v30,ft7
                  add        t5, t3, t0
                  mulhsu     tp, s9, a5
                  lui        s8, 859335
                  vfcvt.x.f.v v19,v31
                  srl        a4, a2, a2
                  vmfle.vf   v7,v3,ft6
                  srai       s8, a5, 7
                  ori        t3, t3, -521
                  and        zero, sp, s11
                  andi       s4, s3, -48
                  vfredmin.vs v14,v23,v8,v0.t
                  xori       s9, s4, -834
                  auipc      a2, 514489
                  vfsgnj.vv  v8,v4,v20,v0.t
                  vmfle.vv   v7,v10,v17,v0.t
                  xor        t4, a0, t0
                  mul        a3, t1, s7
                  vfredsum.vs v24,v25,v17,v0.t
                  and        t1, a0, s1
                  vmfge.vf   v31,v7,fs9
                  vmfge.vf   v7,v16,ft8
                  vmfge.vf   v9,v20,fs2
                  sra        t5, s7, s2
                  vfcvt.xu.f.v v9,v1
                  xor        a2, t2, s5
                  remu       s1, t3, a2
                  slli       s4, s8, 31
                  sltiu      t0, a2, -285
                  vmfeq.vv   v7,v15,v16,v0.t
                  vfcvt.f.xu.v v23,v29,v0.t
                  srai       a7, s5, 31
                  vfredosum.vs v20,v15,v31,v0.t
                  sll        t2, a6, s6
                  srai       t5, a6, 10
                  divu       s9, a6, ra
                  remu       s3, a4, s10
                  vfsgnjn.vf v8,v15,ft4
                  remu       s8, a6, t4
                  vfmax.vv   v5,v14,v10,v0.t
                  vfadd.vv   v26,v15,v12,v0.t
                  div        s0, t0, s11
                  slti       t5, a3, 897
                  vfredmin.vs v1,v19,v5,v0.t
                  vfadd.vv   v31,v25,v14
                  xori       a1, s2, 772
                  vfadd.vf   v26,v11,ft9,v0.t
                  rem        a1, sp, a0
                  or         a4, a0, t5
                  vfcvt.f.xu.v v28,v14
                  div        a0, s1, sp
                  vfredmax.vs v5,v3,v12,v0.t
                  div        t1, s6, t2
                  mulhu      s0, a6, s9
                  sltu       a0, a0, ra
                  vfclass.v v18,v9,v0.t
                  add        s9, t1, zero
                  vfcvt.xu.f.v v29,v13,v0.t
                  or         a2, a0, t4
                  vfrsub.vf  v8,v25,ft1,v0.t
                  vfmul.vf   v6,v3,ft6,v0.t
                  vmfgt.vf   v3,v11,fa2
                  vfcvt.f.xu.v v22,v0
                  vfsgnjn.vf v31,v7,ft3
                  vmflt.vv   v28,v3,v6,v0.t
                  vmfgt.vf   v4,v9,ft7,v0.t
                  addi       a2, t4, 39
                  vmflt.vv   v14,v23,v28
                  vfcvt.xu.f.v v13,v12
                  vfadd.vv   v0,v0,v11
                  divu       s5, s9, ra
                  vfmin.vv   v28,v6,v12
                  vmfgt.vf   v23,v30,ft2,v0.t
                  slt        t3, ra, a7
                  vfadd.vf   v25,v23,ft1
                  vfsgnjx.vf v0,v18,fs4
                  vfmin.vf   v25,v4,fa2
                  ori        a4, gp, 129
                  sll        sp, a3, s2
                  mulh       t4, sp, s4
                  addi       a6, a2, 581
                  andi       a2, s5, 838
                  xor        s1, s7, a7
                  divu       s4, s5, t4
                  sltiu      zero, a6, 732
                  and        s9, a2, t4
                  xor        a7, s7, a6
                  vmfle.vv   v21,v3,v6
                  sltiu      s0, tp, 817
                  srl        t6, s7, a5
                  mul        t4, t5, a6
                  rem        tp, t0, s10
                  slli       a0, a2, 9
                  vmflt.vv   v13,v12,v12,v0.t
                  vfmax.vv   v30,v13,v12,v0.t
                  vfredmax.vs v20,v1,v13
                  vfadd.vv   v21,v8,v11
                  rem        s7, a3, s7
                  sll        zero, t3, zero
                  remu       a0, s5, gp
                  srl        s4, t4, t6
                  add        ra, a1, t0
                  slli       a5, s1, 4
                  auipc      s10, 170132
                  vmfgt.vf   v27,v28,fs4,v0.t
                  vmfgt.vf   v3,v6,fs11
                  vmfge.vf   v15,v17,ft2,v0.t
                  sub        zero, a0, s3
                  xori       t2, a1, -68
                  vfsgnj.vf  v29,v11,fa5
                  xori       s9, s8, 438
                  rem        s8, s10, t4
                  vmflt.vf   v31,v30,fs0,v0.t
                  slli       t3, s10, 22
                  vmfge.vf   v22,v27,fa6,v0.t
                  vmfle.vv   v30,v10,v11
                  vfmul.vf   v14,v26,ft10
                  vfredosum.vs v6,v28,v12
                  vfcvt.xu.f.v v0,v12
                  vmfeq.vf   v3,v15,fs8,v0.t
                  mul        t0, a1, a7
                  remu       t2, s10, s1
                  srai       t5, a1, 8
                  divu       a0, t2, a2
                  mulhu      t5, a1, s10
                  sll        s5, a0, t1
                  vfcvt.xu.f.v v29,v15,v0.t
                  or         a5, t6, a4
                  srai       s9, a1, 14
                  vfmul.vf   v12,v0,ft6,v0.t
                  remu       s4, s4, t2
                  slti       ra, t6, -717
                  div        tp, t1, zero
                  vfsgnjx.vf v31,v4,ft9
                  srli       s1, a0, 22
                  slt        t1, a1, s4
                  vmfeq.vv   v9,v8,v10,v0.t
                  vmflt.vf   v14,v10,fa4
                  vfredmin.vs v26,v10,v14,v0.t
                  mul        t0, s4, t1
                  srl        s5, a6, a6
                  vfsgnjx.vf v25,v8,ft10
                  vfcvt.x.f.v v29,v16
                  sub        t5, a1, ra
                  vfrsub.vf  v14,v15,fa6,v0.t
                  mulhu      a4, s9, zero
                  vmfeq.vf   v19,v24,ft1,v0.t
                  vfsub.vf   v30,v15,ft2,v0.t
                  vfclass.v v24,v3,v0.t
                  divu       gp, s7, s10
                  divu       t3, a2, s11
                  vfsub.vf   v0,v18,ft9
                  vfredmax.vs v15,v13,v19
                  and        s4, s1, tp
                  vmflt.vv   v4,v13,v24
                  vfredsum.vs v2,v4,v12,v0.t
                  mulhu      s0, s2, s9
                  or         t5, s0, s10
                  srl        a2, t1, a7
                  srl        t2, a0, a6
                  xori       s3, s3, 113
                  vfmax.vv   v17,v26,v23,v0.t
                  vfmul.vv   v0,v20,v7
                  mulhsu     s9, a6, tp
                  divu       a0, ra, s0
                  and        zero, s2, s6
                  add        a5, t3, a7
                  mulhu      a2, s0, t4
                  srli       t0, s2, 22
                  vmfne.vf   v12,v19,fs11
                  slli       a1, s1, 10
                  vfredmax.vs v21,v11,v5
                  sltu       a0, a2, s5
                  addi       s4, a4, 0
                  vfrsub.vf  v4,v29,ft11,v0.t
                  vfcvt.f.x.v v2,v0,v0.t
                  xor        s8, a5, s5
                  vfsgnjx.vv v19,v16,v27
                  vmfeq.vf   v0,v29,fs4
                  sub        a1, s4, a3
                  vfmin.vv   v19,v25,v0
                  vfcvt.xu.f.v v14,v27,v0.t
                  vfadd.vf   v10,v4,ft9,v0.t
                  or         a0, a0, t4
                  add        a0, sp, s4
                  vfmax.vv   v9,v1,v13,v0.t
                  xori       a2, t3, -91
                  addi       a3, t5, -653
                  srai       ra, s5, 21
                  auipc      s8, 787144
                  addi       a1, t6, 386
                  sll        a2, a3, s2
                  vfmax.vv   v27,v17,v21
                  vfsub.vf   v24,v17,fs1
                  vfcvt.f.xu.v v0,v19
                  divu       s1, sp, s2
                  vfsgnj.vv  v26,v19,v12,v0.t
                  slli       a7, s4, 1
                  vmflt.vv   v21,v12,v27
                  mulhu      s3, a6, ra
                  vmfne.vf   v27,v10,fs10,v0.t
                  vmflt.vf   v28,v4,ft7,v0.t
                  vmfge.vf   v22,v7,fa1
                  vmfne.vv   v13,v11,v30,v0.t
                  sra        t2, a3, s11
                  or         t0, ra, a1
                  vfcvt.f.x.v v7,v29,v0.t
                  srai       s10, t5, 26
                  srli       a4, s1, 13
                  vfrsub.vf  v24,v18,ft11,v0.t
                  andi       s9, a3, 827
                  lui        s1, 906951
                  vfadd.vv   v15,v22,v31
                  slt        s3, s0, t4
                  add        a3, t2, a5
                  sll        t2, s8, s4
                  divu       a4, a7, s11
                  vmfgt.vf   v22,v31,fa5
                  andi       ra, a2, -296
                  and        t6, s5, s6
                  vmfge.vf   v2,v1,fs3,v0.t
                  slti       t0, a0, -96
                  vfadd.vv   v4,v9,v13,v0.t
                  sll        s7, a0, tp
                  vfredmax.vs v22,v26,v22,v0.t
                  vfredsum.vs v22,v14,v7,v0.t
                  vmfne.vv   v8,v9,v14
                  vfcvt.f.x.v v26,v5,v0.t
                  div        ra, s3, s9
                  lui        s9, 244873
                  vfredmin.vs v7,v20,v16,v0.t
                  vfredmin.vs v28,v4,v27
                  vfredmin.vs v25,v12,v4,v0.t
                  lui        a4, 668847
                  srli       t6, a7, 6
                  srli       ra, a1, 15
                  ori        zero, gp, 166
                  andi       ra, s7, 791
                  slt        s1, s6, t3
                  vmfne.vv   v12,v11,v30
                  vfrsub.vf  v29,v16,ft11,v0.t
                  vfcvt.xu.f.v v18,v6,v0.t
                  vfredsum.vs v28,v5,v12
                  rem        t0, a3, s6
                  vmflt.vv   v3,v9,v5
                  vfmul.vv   v2,v22,v18
                  mulhsu     t1, s5, a7
                  vfmul.vv   v18,v2,v27,v0.t
                  vfmax.vf   v26,v12,ft11
                  mulhsu     zero, s5, zero
                  slt        tp, s4, a3
                  vfsgnj.vf  v21,v15,fs0
                  add        t4, s9, s9
                  srai       s4, t2, 25
                  slli       s9, s7, 29
                  vfsgnjx.vf v22,v6,fs4,v0.t
                  vfsgnjn.vf v26,v11,fa2,v0.t
                  rem        t5, a7, t0
                  srl        gp, a6, sp
                  sub        s1, s3, a4
                  vmfge.vf   v14,v25,ft9,v0.t
                  srai       s5, s9, 0
                  slli       zero, s11, 16
                  mul        t5, a6, a3
                  vmfeq.vv   v7,v21,v3,v0.t
                  add        t1, t2, a7
                  mulh       s4, t6, a2
                  srl        a6, s6, t4
                  vfrsub.vf  v16,v18,ft11
                  xor        s8, t2, s7
                  andi       s8, s3, 489
                  vfsgnjx.vf v1,v4,fs6,v0.t
                  vfsgnj.vf  v21,v9,fs4,v0.t
                  srai       t0, sp, 8
                  sub        t1, tp, a6
                  sll        sp, sp, s10
                  sltu       t3, a7, s0
                  lui        t1, 996648
                  sltu       a1, a1, a7
                  div        tp, s6, t2
                  vmfle.vv   v21,v27,v19
                  vfclass.v v3,v6,v0.t
                  vfredmax.vs v18,v16,v9,v0.t
                  ori        gp, s4, 975
                  mulhu      t6, s11, s0
                  vmflt.vv   v25,v12,v27,v0.t
                  vfrsub.vf  v23,v9,ft3
                  slt        a0, s1, a4
                  ori        t4, s6, 840
                  vfsgnjx.vv v11,v29,v12
                  add        s7, t1, s9
                  ori        gp, a7, 34
                  vfclass.v v28,v30
                  lui        zero, 510165
                  vfsgnjx.vf v20,v19,ft6
                  vfcvt.f.xu.v v17,v18,v0.t
                  vfmin.vv   v19,v28,v23,v0.t
                  divu       sp, t1, a3
                  slt        s10, s8, s1
                  and        t6, s9, s11
                  vfsgnjx.vv v6,v26,v15,v0.t
                  vfmin.vv   v20,v22,v8
                  vfredmax.vs v25,v17,v23,v0.t
                  vfmin.vf   v23,v21,ft6
                  srai       a3, gp, 16
                  sll        s3, s4, s11
                  and        t0, sp, s4
                  vfsgnj.vf  v4,v4,ft3
                  vfredosum.vs v26,v12,v10,v0.t
                  vfcvt.xu.f.v v15,v11
                  sltu       a1, t2, s3
                  vfmin.vf   v4,v8,ft9,v0.t
                  vmfge.vf   v29,v5,ft2
                  vfmax.vf   v9,v28,ft5,v0.t
                  sra        zero, tp, a2
                  vmfle.vf   v0,v10,fa6
                  mulhu      a3, a5, a6
                  slt        s1, s11, t3
                  divu       t5, t6, s8
                  vfcvt.f.xu.v v6,v27,v0.t
                  sub        zero, t6, t2
                  sltiu      s10, a7, 534
                  srai       tp, t1, 21
                  div        a7, zero, t2
                  vfsgnj.vv  v26,v13,v22
                  vfredmin.vs v21,v26,v23,v0.t
                  vfsgnjn.vf v20,v19,fa4,v0.t
                  sll        a6, s2, s5
                  vmfge.vf   v9,v27,fs1,v0.t
                  vmfgt.vf   v23,v7,ft3
                  xori       t3, t4, 917
                  sltu       zero, t5, t2
                  xori       a3, tp, -18
                  andi       a7, a4, -167
                  vfcvt.f.xu.v v9,v31
                  sll        s0, zero, ra
                  srai       s4, t0, 17
                  mulhsu     a0, a4, s2
                  vfcvt.xu.f.v v9,v19,v0.t
                  mulh       a7, a0, t4
                  vfsgnj.vv  v31,v7,v15,v0.t
                  vfcvt.f.x.v v22,v14,v0.t
                  vmfgt.vf   v31,v1,ft3
                  vmfge.vf   v17,v6,ft0,v0.t
                  srli       zero, s10, 0
                  mulhu      ra, sp, a6
                  vfrsub.vf  v28,v15,fs9,v0.t
                  xori       a4, s9, 489
                  vfmul.vf   v18,v5,fs9,v0.t
                  vfcvt.xu.f.v v6,v16
                  andi       s1, s6, 357
                  divu       zero, a2, s10
                  andi       a3, a0, -934
                  or         t3, a0, s1
                  vmfgt.vf   v2,v21,ft6
                  vfmin.vv   v16,v11,v27
                  slt        s7, a5, zero
                  mul        a0, t5, s2
                  addi       s10, a5, -759
                  vfsub.vf   v28,v28,ft1,v0.t
                  ori        s7, s0, 1003
                  sub        s10, s0, a2
                  vfredosum.vs v12,v1,v20,v0.t
                  vfclass.v v1,v3
                  mulhu      a3, a6, t6
                  slli       a3, zero, 18
                  divu       t3, s1, s10
                  slli       a4, zero, 22
                  add        s0, s2, a1
                  remu       s10, ra, a7
                  slti       s4, s5, 978
                  auipc      tp, 780464
                  sltu       a3, s8, a2
                  vmfge.vf   v26,v15,fs2,v0.t
                  divu       s0, s1, s0
                  slli       s10, s4, 0
                  vfrsub.vf  v15,v0,fs2,v0.t
                  xori       zero, gp, -134
                  rem        a2, tp, t6
                  vmfne.vv   v9,v17,v20
                  vfredosum.vs v17,v18,v31,v0.t
                  sltu       a3, s4, s9
                  srl        a4, s6, t6
                  lui        ra, 277256
                  xor        a6, t1, s4
                  mul        s3, s7, a4
                  vfredsum.vs v21,v8,v9,v0.t
                  vfcvt.xu.f.v v1,v18
                  vfsgnjn.vf v16,v31,ft5
                  mulhu      t3, t1, t4
                  vfsgnjx.vf v25,v9,ft4,v0.t
                  sra        a0, s0, a7
                  vfcvt.f.xu.v v5,v16
                  sltiu      t3, s7, -795
                  srai       sp, t0, 24
                  div        s9, t2, t2
                  vfadd.vf   v1,v13,fa5,v0.t
                  mulhsu     t0, t3, a3
                  vfmul.vf   v12,v21,fs3,v0.t
                  vfrsub.vf  v3,v21,ft4,v0.t
                  vmfle.vf   v1,v7,fs8,v0.t
                  vfcvt.x.f.v v23,v23
                  vfrsub.vf  v3,v18,ft10
                  vfcvt.x.f.v v24,v31,v0.t
                  add        s8, gp, t1
                  vfredmax.vs v25,v5,v18
                  mulhu      t3, a0, ra
                  lui        a0, 437811
                  vfredmin.vs v26,v5,v1,v0.t
                  vfmin.vv   v13,v7,v10,v0.t
                  vfredmin.vs v2,v17,v16,v0.t
                  mulh       a5, a7, t4
                  ori        a7, s2, -508
                  vmflt.vf   v19,v26,fs3,v0.t
                  vfmax.vv   v13,v20,v26
                  mulh       sp, tp, a3
                  sltiu      t1, t4, -119
                  vfredmax.vs v1,v19,v19,v0.t
                  vmfge.vf   v16,v21,fa0,v0.t
                  vfredosum.vs v2,v6,v24,v0.t
                  sltiu      s7, a2, -380
                  vfredmax.vs v31,v16,v13,v0.t
                  vmfge.vf   v23,v18,ft5
                  xori       tp, a3, -974
                  vmfle.vv   v19,v16,v17
                  div        a0, a5, s0
                  vfredsum.vs v9,v10,v5,v0.t
                  vfredosum.vs v19,v26,v25,v0.t
                  vfredosum.vs v26,v10,v28
                  sra        t6, t1, s3
                  vfcvt.f.x.v v7,v3,v0.t
                  mul        tp, t0, t5
                  auipc      a4, 913542
                  srl        t4, a3, t3
                  ori        t0, a7, -910
                  divu       s3, s0, s5
                  vmfeq.vv   v19,v6,v10,v0.t
                  vfclass.v v4,v31
                  slti       s7, t2, 494
                  remu       a7, zero, t1
                  sltiu      t6, sp, -664
                  vfsgnj.vv  v5,v26,v29,v0.t
                  andi       t4, sp, -880
                  remu       tp, zero, a3
                  vfredmin.vs v17,v19,v31
                  mulhsu     a2, a5, a5
                  vmflt.vf   v23,v29,fs8,v0.t
                  vfredsum.vs v2,v6,v20
                  xor        a4, s1, s4
                  xor        t6, s8, ra
                  vfcvt.xu.f.v v27,v5
                  vfcvt.xu.f.v v5,v27,v0.t
                  sltiu      a4, a1, -172
                  mul        tp, tp, s4
                  auipc      tp, 754366
                  mulhu      tp, a5, a3
                  div        a4, s0, s0
                  div        s0, s6, a5
                  auipc      s1, 240337
                  andi       gp, a4, 295
                  vfrsub.vf  v7,v14,ft4
                  vmflt.vf   v17,v4,ft3
                  vfadd.vv   v3,v25,v2
                  vfcvt.f.x.v v12,v11
                  vfmax.vv   v23,v3,v14,v0.t
                  vfredmin.vs v2,v1,v14,v0.t
                  vfsgnjn.vv v1,v11,v29,v0.t
                  div        s4, a0, a6
                  mulh       sp, a3, t2
                  slli       a1, s5, 12
                  auipc      s10, 458427
                  slt        a6, s11, s9
                  divu       a4, gp, a6
                  vfrsub.vf  v13,v7,fs4,v0.t
                  divu       gp, s10, ra
                  andi       s10, s11, -825
                  mulhsu     ra, a2, s3
                  slli       a7, a1, 28
                  vfrsub.vf  v19,v10,fs3
                  rem        t4, t3, a7
                  vfsgnjn.vv v31,v15,v8,v0.t
                  vfcvt.x.f.v v13,v26,v0.t
                  vmflt.vv   v7,v14,v8,v0.t
                  xor        t4, a7, tp
                  vmfle.vf   v7,v22,ft4
                  sra        s10, s8, a6
                  vfredsum.vs v26,v17,v31,v0.t
                  remu       s4, t1, ra
                  addi       s5, s8, -206
                  sub        ra, t4, t3
                  vfsgnjx.vf v31,v6,fa3
                  sub        t5, t6, tp
                  vfcvt.f.x.v v14,v19
                  srai       a0, a7, 6
                  vmflt.vv   v14,v24,v25,v0.t
                  vfrsub.vf  v20,v1,ft4
                  srai       s1, s5, 6
                  ori        gp, s7, 324
                  srai       s7, a1, 19
                  srai       gp, t1, 15
                  vfsgnjx.vv v18,v21,v31,v0.t
                  vmfgt.vf   v30,v26,fa7,v0.t
                  div        a2, s4, a7
                  vfcvt.f.x.v v12,v15
                  sub        a1, t5, s9
                  vfcvt.f.x.v v12,v14,v0.t
                  vfmin.vf   v22,v12,ft11,v0.t
                  add        tp, s4, a7
                  vmfeq.vf   v23,v6,ft8
                  vmfge.vf   v28,v27,ft5
                  vfrsub.vf  v31,v28,fa7
                  vmfne.vv   v20,v24,v25
                  vfclass.v v17,v7,v0.t
                  vfredsum.vs v16,v10,v2,v0.t
                  srli       t1, sp, 14
                  vfsgnjx.vv v13,v9,v17,v0.t
                  vfrsub.vf  v18,v21,fs5,v0.t
                  srli       a7, a3, 18
                  slt        tp, s0, s5
                  vfcvt.f.x.v v11,v11,v0.t
                  vfsub.vv   v6,v7,v5
                  vfmax.vf   v16,v3,fa5,v0.t
                  remu       s7, t6, a0
                  sll        s9, a1, a7
                  srai       s1, ra, 10
                  remu       s7, a5, a3
                  vfsgnj.vf  v9,v5,ft5,v0.t
                  vfmin.vf   v9,v3,fa6
                  vfsgnj.vf  v26,v27,fs5,v0.t
                  addi       a5, s6, 919
                  vfredmin.vs v19,v7,v3,v0.t
                  srai       t4, s4, 10
                  slli       s10, s2, 12
                  auipc      sp, 583871
                  sll        a4, s2, s6
                  mulhsu     t5, s6, s9
                  xor        a7, sp, s11
                  mul        tp, s7, t4
                  vmfeq.vf   v8,v31,ft6,v0.t
                  vfcvt.f.x.v v11,v26
                  xor        a0, s3, s3
                  xor        a2, s0, t0
                  vmflt.vv   v0,v6,v4
                  andi       t6, a0, -510
                  auipc      t0, 954774
                  remu       s9, s4, ra
                  vfsub.vf   v16,v6,ft0
                  add        s4, s0, s6
                  slt        a3, t2, a4
                  add        a5, s9, s2
                  ori        t1, t0, 993
                  vfrsub.vf  v1,v3,fa0,v0.t
                  rem        ra, s0, s11
                  vmfeq.vv   v29,v8,v0,v0.t
                  vfredosum.vs v19,v9,v17,v0.t
                  vfredmax.vs v16,v24,v13,v0.t
                  mulhu      t2, a6, a6
                  addi       a2, ra, 897
                  vfsgnjx.vv v5,v23,v10,v0.t
                  vmfge.vf   v11,v9,fa7,v0.t
                  add        t3, s0, a7
                  addi       zero, ra, -609
                  sra        t1, sp, t1
                  slt        s10, s7, a6
                  vfmul.vv   v15,v24,v12,v0.t
                  srai       a3, t3, 18
                  vfredosum.vs v8,v24,v29
                  vfsgnjn.vf v21,v24,fa1
                  add        s0, s1, s1
                  vfsgnj.vf  v12,v31,fs10
                  vfsgnjx.vf v24,v17,ft0
                  xori       s4, s0, 867
                  remu       gp, s11, t3
                  vfsgnjx.vv v9,v9,v24
                  vmfle.vv   v22,v18,v16,v0.t
                  srl        s3, a1, t1
                  lui        s10, 717065
                  vmfeq.vf   v6,v31,fa3,v0.t
                  vfsgnjx.vv v5,v21,v0,v0.t
                  mulhsu     a3, a5, a7
                  vfredmin.vs v0,v11,v8
                  vfmul.vv   v12,v13,v23
                  divu       s5, s7, s7
                  mulh       a5, s7, s10
                  vfcvt.xu.f.v v20,v11,v0.t
                  vfadd.vf   v21,v9,ft4
                  vfcvt.f.x.v v8,v6
                  vfsub.vf   v21,v11,fs5,v0.t
                  vfmul.vv   v21,v14,v13
                  slt        a1, zero, a5
                  mulhsu     t6, s8, a5
                  sra        s5, s2, tp
                  andi       t4, s1, -574
                  sll        s8, zero, s6
                  sll        s7, t1, s4
                  andi       sp, t2, -24
                  vfredmax.vs v5,v0,v21,v0.t
                  srai       a7, a6, 27
                  sra        t4, a1, t6
                  sra        a6, s10, s1
                  mul        t2, t3, a4
                  mulhu      t5, t2, a1
                  xori       a3, s5, -347
                  vmfle.vv   v19,v29,v13,v0.t
                  slt        s3, t0, a1
                  vmfge.vf   v28,v30,fa4
                  vmflt.vv   v26,v27,v10,v0.t
                  vfcvt.f.xu.v v14,v29,v0.t
                  sra        ra, t3, s8
                  xor        a2, gp, s8
                  sra        t3, sp, t3
                  xori       a4, t2, 617
                  ori        s9, a7, -611
                  addi       t6, s3, -327
                  vmfeq.vf   v24,v29,fs3,v0.t
                  xor        a7, a7, s0
                  vmfge.vf   v1,v6,fa6
                  andi       a1, s0, 219
                  vfsub.vv   v26,v26,v29
                  sub        t3, t1, a7
                  sltiu      s10, t4, -8
                  slt        t4, s0, t6
                  lui        a2, 192977
                  vmfeq.vv   v11,v28,v22
                  vfmin.vf   v1,v0,fa5
                  mulhu      t4, t2, a2
                  rem        a0, a0, s3
                  xor        t5, a4, s8
                  sltiu      gp, t6, 101
                  vfcvt.xu.f.v v5,v4
                  sltiu      a3, s7, -462
                  slli       s3, s9, 16
                  mulhsu     a4, gp, a3
                  vfsgnj.vf  v29,v7,fs8,v0.t
                  vfmin.vv   v22,v23,v18
                  slt        s8, tp, t2
                  srl        a1, a2, gp
                  or         a5, s3, a3
                  sub        s8, a2, s0
                  vfmul.vv   v11,v4,v0
                  vfmax.vf   v21,v19,ft11,v0.t
                  vfclass.v v18,v5,v0.t
                  vfsgnjx.vv v22,v8,v0
                  vmfeq.vf   v12,v9,ft0
                  slli       a4, a2, 10
                  ori        s8, a4, 21
                  vfcvt.f.xu.v v22,v19
                  srai       t1, s0, 26
                  srl        gp, a1, a2
                  vfsgnj.vf  v29,v8,fs9,v0.t
                  or         t1, a3, a5
                  addi       s1, a6, -70
                  vfsgnjx.vv v5,v21,v28
                  or         tp, s10, t3
                  vfcvt.f.xu.v v31,v0
                  sll        sp, zero, s2
                  auipc      t3, 666219
                  vfredmin.vs v8,v16,v5
                  vfsgnjx.vv v26,v3,v22,v0.t
                  vmfge.vf   v13,v28,fa5
                  mul        a3, s2, t2
                  sll        t0, t4, t3
                  mulhsu     a6, a3, a2
                  sra        s4, s11, s0
                  ori        s3, t4, 30
                  vfcvt.f.xu.v v6,v6
                  mulhsu     a7, s9, a1
                  vfclass.v v21,v19,v0.t
                  vmflt.vv   v23,v24,v8,v0.t
                  sltiu      s8, t5, 630
                  srl        a6, a2, s2
                  slt        s0, a5, a3
                  mul        t5, s0, t2
                  or         a2, a4, s3
                  div        s8, s4, s5
                  slli       gp, gp, 26
                  mul        zero, sp, t1
                  lui        t2, 979495
                  sll        t3, s1, tp
                  vfmax.vv   v31,v5,v10,v0.t
                  mul        sp, a7, t6
                  vfmax.vv   v9,v13,v27,v0.t
                  vfmin.vf   v5,v0,fs5,v0.t
                  auipc      s4, 929410
                  lui        a6, 814429
                  addi       a6, s7, -729
                  vfadd.vf   v3,v22,fs8
                  vmfge.vf   v31,v6,fa4
                  slti       s0, s4, 503
                  vfmul.vv   v12,v13,v0
                  and        t1, s2, s0
                  vfsgnj.vf  v17,v19,fa4
                  vfsgnjn.vv v21,v17,v6
                  div        zero, zero, t1
                  xori       s0, s5, -382
                  sub        s10, s5, s8
                  vmfge.vf   v23,v11,fs5
                  vfsgnjn.vv v13,v27,v29,v0.t
                  andi       s7, s3, 195
                  vfcvt.x.f.v v16,v18
                  vfcvt.f.x.v v2,v21,v0.t
                  slli       t5, s6, 27
                  vmfeq.vv   v30,v25,v28,v0.t
                  vfsgnjx.vf v6,v26,ft8
                  or         s10, s3, t4
                  slt        a7, s7, a2
                  slt        gp, a0, ra
                  sra        s8, a3, s10
                  srai       a2, t5, 4
                  slt        gp, t2, a5
                  vfredosum.vs v21,v29,v19,v0.t
                  lui        s7, 50016
                  divu       sp, a4, s7
                  xori       t2, t3, 1003
                  div        a2, t2, t3
                  vfmul.vf   v9,v24,fa6,v0.t
                  vfmin.vv   v10,v29,v9,v0.t
                  sltu       s3, s6, t3
                  vfmul.vv   v1,v21,v20
                  mulh       gp, t3, ra
                  vfsgnj.vf  v9,v6,fa6
                  vfmin.vv   v31,v19,v29
                  addi       gp, t0, -870
                  or         s9, s7, t1
                  vfredosum.vs v22,v17,v22,v0.t
                  mulh       a6, a6, t6
                  srli       s1, s9, 12
                  ori        tp, s5, 221
                  vfclass.v v10,v1
                  divu       a4, a1, t2
                  sub        a3, ra, s1
                  vfredmin.vs v29,v3,v30,v0.t
                  mulhsu     t6, a5, t2
                  sra        tp, ra, s11
                  vfmin.vf   v29,v26,ft5
                  vfsgnjx.vf v5,v26,ft1,v0.t
                  and        ra, t6, ra
                  vfsgnjx.vf v24,v0,fa6,v0.t
                  xori       a3, s9, 831
                  mulh       tp, a7, gp
                  auipc      sp, 685417
                  vmfeq.vv   v31,v2,v11,v0.t
                  mulhu      a6, tp, a3
                  andi       s7, a4, -842
                  srl        s9, zero, tp
                  divu       sp, ra, a7
                  div        t4, a4, t3
                  xori       zero, s4, -511
                  vfclass.v v4,v29
                  vmfle.vf   v20,v26,ft6
                  vfredmax.vs v14,v30,v12,v0.t
                  srl        gp, t3, a3
                  or         tp, a0, t2
                  xor        t5, t2, s11
                  vfredosum.vs v13,v19,v23,v0.t
                  vmflt.vf   v20,v7,fs11,v0.t
                  vfmax.vv   v26,v15,v16,v0.t
                  vfclass.v v10,v0,v0.t
                  mulh       a4, s10, s7
                  add        t2, a6, sp
                  srl        a6, t1, t1
                  vfcvt.f.xu.v v4,v1
                  vfredsum.vs v18,v9,v14,v0.t
                  xori       t5, t0, -326
                  vfmin.vf   v17,v20,fs3
                  vmfge.vf   v21,v30,fs1,v0.t
                  vfredmin.vs v12,v2,v9
                  and        ra, gp, s0
                  mulh       s1, s4, s9
                  srai       t4, t4, 2
                  add        t2, t6, ra
                  lui        zero, 880449
                  vfmin.vv   v19,v18,v15,v0.t
                  mulhsu     a0, t4, a3
                  srli       t4, t4, 19
                  srli       s5, a7, 3
                  mulhsu     zero, a3, t2
                  vfrsub.vf  v31,v4,ft5,v0.t
                  vmfge.vf   v31,v20,ft6
                  vfredmin.vs v20,v16,v12
                  andi       a5, tp, -261
                  vfcvt.f.x.v v27,v27,v0.t
                  vmfgt.vf   v10,v19,fs7
                  srai       a5, s5, 31
                  xori       a4, s1, -789
                  vfredosum.vs v10,v12,v7,v0.t
                  vfcvt.f.xu.v v23,v19,v0.t
                  vmfge.vf   v9,v11,fs9,v0.t
                  addi       a3, t1, -334
                  vfmin.vv   v12,v26,v16,v0.t
                  vfmul.vv   v7,v14,v16,v0.t
                  vfredosum.vs v0,v13,v27
                  mulh       t0, ra, t5
                  xor        tp, a6, s8
                  vfcvt.f.x.v v21,v17
                  vmfne.vv   v24,v10,v17
                  vmflt.vv   v29,v16,v30,v0.t
                  mulhsu     a1, t5, s0
                  xor        a2, a6, s4
                  vfredmin.vs v26,v10,v25,v0.t
                  vfredsum.vs v27,v8,v22,v0.t
                  vfsgnjx.vf v24,v23,fs3
                  vfsgnjn.vf v3,v13,fs7
                  lui        a0, 217928
                  vfsgnj.vf  v2,v0,fa2
                  slti       t2, tp, 6
                  sll        s5, t0, t2
                  mulh       ra, t1, s11
                  srai       sp, a6, 8
                  mulh       t3, a3, s9
                  mulh       a6, t2, s10
                  vmfne.vv   v12,v24,v3,v0.t
                  or         t5, s2, s9
                  auipc      tp, 844433
                  vfredosum.vs v1,v13,v25
                  mul        a5, a4, s5
                  vmfgt.vf   v17,v31,ft5
                  vmflt.vv   v31,v22,v29
                  andi       s10, s4, -364
                  vfmin.vf   v17,v30,fa6
                  slt        t5, t1, t3
                  vfredmin.vs v4,v22,v18
                  andi       t1, s10, -851
                  xori       a3, a7, 542
                  mul        a2, s1, a7
                  sra        s9, a0, s0
                  mul        t1, a5, s10
                  vmfgt.vf   v27,v7,ft5,v0.t
                  vfsub.vf   v11,v31,fa7,v0.t
                  vfcvt.f.xu.v v30,v10
                  mulh       t5, a5, a0
                  srai       t5, tp, 21
                  vmfge.vf   v15,v22,fs2
                  rem        tp, s5, a0
                  vfmin.vf   v14,v19,fs5,v0.t
                  auipc      t1, 240409
                  vfclass.v v21,v24,v0.t
                  addi       s7, a2, 668
                  vfadd.vf   v30,v10,fa5
                  vmfle.vf   v5,v11,fs0,v0.t
                  divu       s5, s0, s1
                  vfsgnjx.vf v16,v14,ft6,v0.t
                  ori        s7, gp, -931
                  srl        a5, s11, s4
                  vfredmin.vs v17,v22,v1,v0.t
                  vmflt.vf   v4,v13,fs0
                  vfsub.vf   v13,v10,fa3,v0.t
                  vfadd.vv   v2,v23,v18
                  vfmax.vv   v21,v27,v31
                  mulh       a0, s1, s0
                  vfcvt.x.f.v v24,v3,v0.t
                  vfmax.vv   v28,v24,v3,v0.t
                  rem        a6, tp, s11
                  sll        t5, t4, a0
                  vfmin.vv   v19,v0,v7
                  vmfgt.vf   v21,v0,ft0,v0.t
                  vfmax.vv   v24,v5,v12
                  vfredmax.vs v14,v13,v0
                  lui        a2, 45803
                  addi       s5, s0, -769
                  vfmin.vf   v5,v6,fa4,v0.t
                  or         a7, s0, t3
                  add        t5, t6, a3
                  vfadd.vf   v20,v3,fs10
                  vfredmax.vs v5,v23,v29,v0.t
                  vfmax.vf   v11,v1,fs5
                  vfcvt.x.f.v v16,v7,v0.t
                  vfredmax.vs v17,v0,v16
                  addi       a2, a1, -635
                  ori        a5, t4, 5
                  vmfle.vf   v14,v2,fs5,v0.t
                  vfsgnjn.vf v24,v31,ft5
                  vfsgnj.vf  v22,v18,fa4,v0.t
                  vfsub.vf   v17,v28,fs5
                  mulhsu     t5, a2, gp
                  sra        a6, t6, s8
                  or         t5, a5, s4
                  mulhsu     a7, a2, s7
                  andi       sp, t2, 746
                  vfmax.vv   v6,v0,v10,v0.t
                  or         t3, s4, s8
                  vfcvt.f.xu.v v26,v24,v0.t
                  slli       s3, s11, 30
                  divu       t1, a6, t4
                  srai       s5, s9, 5
                  xor        a6, a1, s9
                  vfrsub.vf  v22,v24,fa6,v0.t
                  lui        a4, 796221
                  vfredosum.vs v20,v27,v29,v0.t
                  vmfne.vf   v28,v17,fa3,v0.t
                  vfredsum.vs v18,v23,v30
                  sltiu      a1, s5, 438
                  vfclass.v v23,v5
                  srai       s4, zero, 25
                  srl        s5, t6, t6
                  vmfgt.vf   v4,v17,ft10,v0.t
                  vmfne.vv   v30,v21,v9
                  vfsgnjn.vv v0,v0,v24
                  srli       t5, zero, 16
                  and        s9, gp, s11
                  mul        gp, a4, s7
                  sub        a1, a0, s6
                  vfcvt.xu.f.v v26,v20
                  lui        ra, 864253
                  vfredsum.vs v28,v18,v26
                  slli       a4, a2, 11
                  auipc      a4, 454058
                  vfsgnj.vv  v25,v6,v28,v0.t
                  vfclass.v v19,v1
                  remu       t0, a5, a2
                  vfcvt.x.f.v v0,v15
                  slti       s7, s1, 242
                  sub        s3, gp, zero
                  srli       s1, t4, 9
                  vmfgt.vf   v22,v18,ft8,v0.t
                  vmfeq.vv   v21,v12,v0
                  srli       a2, a1, 10
                  rem        t4, s10, sp
                  vfredsum.vs v26,v26,v4,v0.t
                  srai       t1, t1, 0
                  slt        a2, a0, a7
                  mulh       ra, s4, t4
                  andi       s7, t6, -51
                  vfmul.vv   v7,v31,v0
                  divu       s1, s7, t5
                  vmflt.vv   v13,v7,v0,v0.t
                  vfclass.v v7,v1
                  divu       s8, a0, t3
                  vfredmin.vs v27,v21,v20
                  vmflt.vf   v4,v6,ft3
                  xori       s3, t6, -977
                  vmfle.vv   v11,v28,v7
                  vfsub.vf   v9,v12,fs10
                  vfsgnjx.vv v31,v22,v30,v0.t
                  auipc      a7, 556370
                  vmfgt.vf   v1,v4,ft5
                  vmflt.vf   v7,v9,fs7,v0.t
                  slt        t5, zero, t0
                  xori       sp, s1, 852
                  vfmin.vf   v1,v4,fs2,v0.t
                  auipc      a7, 521383
                  divu       t3, t6, s9
                  slti       s8, t5, -965
                  ori        sp, a1, 618
                  vfsgnjx.vv v20,v0,v0,v0.t
                  vmfgt.vf   v9,v10,ft0
                  vmfgt.vf   v16,v14,fa3,v0.t
                  divu       zero, s0, s9
                  or         a7, a4, a7
                  sra        a6, zero, gp
                  ori        t5, s3, 193
                  srli       t2, a4, 23
                  vfclass.v v30,v26
                  div        a2, t5, gp
                  lui        zero, 757143
                  sub        s3, t2, gp
                  vfmul.vv   v7,v26,v1,v0.t
                  sub        s4, a6, s10
                  vfsgnj.vv  v1,v8,v17,v0.t
                  srli       a0, s5, 14
                  mulhsu     s3, s10, t4
                  vfsub.vf   v23,v11,fs11
                  andi       a4, a6, -228
                  or         s5, s7, t0
                  lui        s7, 479131
                  or         t3, s0, s8
                  divu       s1, s9, t4
                  andi       a0, a5, 808
                  slti       s10, gp, 332
                  vfsgnj.vf  v2,v10,fs10,v0.t
                  sltiu      t5, t6, -120
                  remu       tp, a5, t4
                  srli       tp, a3, 13
                  auipc      s10, 781197
                  vmfle.vv   v16,v10,v8,v0.t
                  vfmul.vf   v29,v7,fs8
                  vfclass.v v18,v31,v0.t
                  divu       s0, s7, a5
                  sra        s1, tp, s11
                  vmfne.vf   v29,v20,fa2
                  mulhu      t1, s5, s7
                  vmfne.vf   v7,v14,fs11,v0.t
                  vfcvt.f.x.v v14,v23,v0.t
                  or         a1, t0, gp
                  vfsgnjx.vf v31,v23,fs5,v0.t
                  vfclass.v v26,v12,v0.t
                  vfcvt.x.f.v v6,v3
                  vfsgnjx.vv v3,v7,v12
                  vfadd.vf   v16,v21,ft5
                  vfadd.vf   v9,v22,fa2
                  vmflt.vf   v26,v3,fs5,v0.t
                  vfmin.vf   v19,v1,ft10
                  xori       a3, t1, 488
                  sltu       a2, a7, t2
                  vfsgnjn.vf v26,v15,ft2,v0.t
                  vfrsub.vf  v28,v7,ft11
                  mulhu      a3, a1, t6
                  vfmul.vf   v3,v0,fa3
                  vmfgt.vf   v5,v8,fs11
                  vfclass.v v7,v9
                  vfredosum.vs v16,v23,v7,v0.t
                  vfsgnj.vf  v26,v16,fs0
                  srli       t4, a3, 8
                  vfredsum.vs v21,v26,v0
                  vmfle.vf   v21,v24,fs10,v0.t
                  addi       zero, t4, -828
                  vfredosum.vs v21,v22,v17
                  vfsgnjx.vv v15,v17,v18
                  vfredmax.vs v10,v31,v28,v0.t
                  srl        t3, a7, s6
                  vmflt.vf   v20,v15,fa3
                  srl        tp, s6, a5
                  srli       a5, a4, 17
                  remu       sp, s7, s6
                  add        a5, s2, t2
                  vfrsub.vf  v15,v4,fa6
                  vfcvt.x.f.v v31,v8,v0.t
                  vfcvt.x.f.v v15,v8,v0.t
                  divu       a4, s7, t3
                  vfsgnj.vv  v5,v20,v6,v0.t
                  vfcvt.x.f.v v13,v31
                  vfcvt.f.x.v v21,v20
                  or         a5, a2, t5
                  sub        s8, zero, s8
                  sra        gp, a3, s11
                  vfsub.vv   v12,v12,v15,v0.t
                  sll        s10, t2, a2
                  vfclass.v v17,v0,v0.t
                  vfclass.v v8,v29,v0.t
                  mulhu      s4, sp, s0
                  vfclass.v v22,v0
                  vmfge.vf   v11,v2,fa1,v0.t
                  slti       t2, t3, 179
                  mulhu      t2, a2, s6
                  vfsgnjn.vv v23,v30,v6
                  srai       t3, tp, 17
                  or         s1, s8, s1
                  xori       t2, t1, 384
                  vfmul.vf   v31,v26,fs10,v0.t
                  vfcvt.xu.f.v v13,v17
                  vfclass.v v5,v20,v0.t
                  mulh       s4, s0, s10
                  xori       s4, tp, -970
                  auipc      a4, 666270
                  vfredmax.vs v8,v13,v18
                  vfcvt.xu.f.v v15,v18,v0.t
                  vmfeq.vv   v2,v7,v5
                  sub        t5, s0, s6
                  vfredosum.vs v4,v3,v30
                  mul        s0, sp, gp
                  vfadd.vv   v7,v29,v14
                  sub        t2, s0, a5
                  mulhu      t0, s10, s0
                  andi       t4, a4, -668
                  vfredmin.vs v30,v25,v8,v0.t
                  vfredmax.vs v5,v22,v23
                  vfredsum.vs v17,v2,v18,v0.t
                  divu       s10, s1, t6
                  vfsgnjx.vf v8,v20,fs8
                  slt        s1, s1, s1
                  xor        a0, s7, a4
                  srli       t1, t4, 9
                  vfclass.v v5,v24
                  vmfne.vv   v23,v15,v29,v0.t
                  vmfgt.vf   v26,v16,ft4
                  div        t5, a3, a2
                  vmfgt.vf   v8,v12,fa7
                  lui        gp, 871259
                  vfredsum.vs v20,v15,v17,v0.t
                  mul        a0, a4, t0
                  auipc      t2, 845465
                  vfadd.vf   v5,v2,fs10
                  vmflt.vf   v25,v20,ft10,v0.t
                  mulh       s8, s10, s2
                  vfredmax.vs v13,v13,v9
                  vfsub.vv   v24,v16,v30
                  vfsgnjn.vv v19,v3,v20
                  vmflt.vf   v5,v22,ft0,v0.t
                  vfredmax.vs v14,v10,v3
                  sub        s7, s0, t5
                  auipc      a2, 661187
                  xori       s8, a3, -837
                  andi       s9, t2, -156
                  slli       a4, t3, 17
                  add        a1, s7, s1
                  vfredosum.vs v24,v16,v8,v0.t
                  xor        a0, s6, ra
                  lui        s1, 205996
                  sub        sp, t2, s6
                  div        s3, t0, s2
                  vfsub.vf   v4,v18,ft2,v0.t
                  mulhu      s4, s1, t0
                  vfcvt.f.xu.v v20,v31
                  vfsgnjn.vv v8,v1,v20
                  add        s5, a5, t4
                  vmfgt.vf   v7,v0,fa3,v0.t
                  sub        a6, s10, t5
                  vmfge.vf   v29,v18,fa4
                  vfcvt.x.f.v v24,v22
                  sra        sp, tp, a4
                  vmfge.vf   v30,v2,ft2
                  addi       s3, a1, 377
                  sub        s3, t2, s5
                  vmfeq.vv   v19,v23,v1
                  vmfne.vv   v24,v6,v0
                  div        a2, s11, t6
                  srl        t6, a0, s2
                  srl        t6, tp, t5
                  mulh       t2, a2, s1
                  vmflt.vf   v25,v17,ft0
                  vfadd.vf   v15,v19,ft5
                  lui        a6, 14370
                  sra        sp, t2, t6
                  xor        tp, zero, t1
                  or         gp, s3, gp
                  auipc      gp, 1046436
                  add        ra, s9, a5
                  vfsgnj.vf  v15,v3,fa5
                  vfadd.vv   v5,v30,v9
                  vfmul.vf   v30,v3,fs11,v0.t
                  vfredsum.vs v16,v29,v8
                  andi       s3, a0, -377
                  sub        t2, a2, t4
                  remu       a7, zero, t6
                  mulh       t1, s2, s0
                  vfcvt.f.xu.v v16,v24
                  auipc      s0, 1006214
                  vfsub.vv   v1,v9,v6
                  rem        t5, zero, ra
                  srli       s10, ra, 1
                  andi       a2, s8, 351
                  slti       s10, s0, -843
                  vfmax.vv   v7,v25,v7,v0.t
                  srl        s8, s3, s5
                  vfsgnjn.vf v11,v26,ft6,v0.t
                  vfcvt.f.x.v v15,v14
                  srai       tp, a7, 24
                  vfsgnj.vv  v14,v18,v5,v0.t
                  vfcvt.xu.f.v v27,v17,v0.t
                  mulhsu     t0, t6, s5
                  vmfne.vv   v13,v21,v23
                  sll        a3, s2, ra
                  slt        t6, t0, s2
                  sub        s10, a3, sp
                  sltu       sp, s8, a0
                  addi       t3, s0, -55
                  vfredsum.vs v27,v22,v7,v0.t
                  vfcvt.x.f.v v29,v23
                  add        a6, s1, t5
                  ori        a6, t2, 460
                  slti       a2, t1, -849
                  slli       t2, a2, 23
                  vmflt.vv   v4,v23,v19,v0.t
                  vfredosum.vs v1,v16,v2,v0.t
                  vfcvt.xu.f.v v10,v8
                  vfcvt.f.x.v v22,v0
                  xori       s7, s4, -808
                  vfclass.v v24,v6
                  or         s5, t0, s4
                  vfredmax.vs v13,v6,v17,v0.t
                  mulh       s5, s4, zero
                  vfsgnj.vv  v26,v1,v14
                  vfsgnjn.vf v16,v31,fa1
                  vfrsub.vf  v21,v25,fa0
                  srai       s5, s7, 5
                  vfredosum.vs v1,v8,v10,v0.t
                  vfredosum.vs v14,v4,v13
                  andi       s0, a5, -17
                  auipc      a7, 310268
                  srai       a5, a5, 23
                  or         a7, s11, a3
                  vmfle.vf   v13,v6,fs4
                  slt        s10, t2, a6
                  vfcvt.xu.f.v v0,v9
                  vfredmin.vs v18,v5,v4,v0.t
                  sltiu      tp, a4, 153
                  srai       s9, t0, 4
                  vfsgnj.vf  v28,v28,fa0,v0.t
                  vfcvt.f.x.v v16,v19
                  mulhsu     a7, s0, zero
                  vfredsum.vs v0,v13,v12
                  vmfeq.vv   v17,v12,v28
                  vmflt.vf   v17,v3,fa0
                  xor        s1, sp, s2
                  sub        a0, a4, a5
                  vfadd.vv   v18,v11,v25
                  vfrsub.vf  v14,v28,fa4
                  vmfgt.vf   v6,v25,fs8
                  mulh       t6, t6, a6
                  vfcvt.f.xu.v v6,v14,v0.t
                  vfsgnjn.vv v3,v29,v23,v0.t
                  vmfgt.vf   v7,v15,ft7
                  srai       a1, t2, 26
                  or         s3, t0, a3
                  vfcvt.x.f.v v6,v28,v0.t
                  vfredmin.vs v5,v5,v7
                  vfadd.vv   v5,v24,v24
                  slti       a7, s7, -75
                  vfmin.vf   v22,v13,fs0
                  remu       s8, s9, s10
                  vmfeq.vv   v13,v27,v22,v0.t
                  vfsgnjn.vf v17,v12,ft7
                  vmfeq.vf   v27,v17,ft6
                  vmfne.vv   v8,v25,v7,v0.t
                  and        a5, s0, a5
                  remu       t4, s1, sp
                  mulh       a4, s6, ra
                  vmfeq.vv   v16,v31,v13,v0.t
                  vfsub.vf   v29,v1,fs0
                  srl        a2, a4, a1
                  vmfeq.vv   v15,v2,v25,v0.t
                  vfcvt.x.f.v v25,v1,v0.t
                  vfsub.vv   v19,v9,v15
                  remu       t2, s3, a5
                  auipc      sp, 441206
                  vmflt.vv   v1,v16,v9
                  vfmul.vv   v21,v10,v1,v0.t
                  vfsgnjn.vf v3,v18,ft2,v0.t
                  vfcvt.x.f.v v3,v31
                  mul        tp, s0, s11
                  vfclass.v v28,v3,v0.t
                  rem        t6, t2, a5
                  ori        a0, t5, -832
                  vfmin.vv   v1,v3,v7
                  vmfle.vf   v1,v3,ft10
                  slli       zero, s11, 3
                  andi       a4, s8, 711
                  mulhu      s8, t3, ra
                  vmflt.vf   v6,v30,fs11,v0.t
                  vmfgt.vf   v5,v16,fs8
                  vfadd.vv   v0,v13,v3
                  vmfne.vv   v30,v5,v31
                  lui        s10, 405124
                  vfsub.vv   v17,v28,v25,v0.t
                  vfsgnj.vf  v30,v1,fa3
                  vfsgnjx.vv v30,v12,v19,v0.t
                  vfsub.vf   v14,v29,fa6
                  add        a1, s1, s1
                  vmfne.vf   v20,v27,ft3,v0.t
                  vmfne.vf   v13,v4,ft8
                  vmfge.vf   v28,v20,fa4
                  vfredmax.vs v16,v23,v22,v0.t
                  sra        a6, a6, gp
                  sra        gp, a7, a1
                  vfmax.vv   v16,v24,v22
                  remu       s7, s4, t4
                  sub        zero, s6, s2
                  vfsgnj.vf  v31,v1,ft11
                  vfmax.vf   v20,v18,fs11
                  vmfge.vf   v17,v30,ft2
                  and        a5, s2, s5
                  vfcvt.f.xu.v v31,v22,v0.t
                  vfcvt.f.xu.v v17,v8
                  vfsub.vf   v9,v11,fs2
                  srli       s4, gp, 1
                  vfclass.v v30,v21,v0.t
                  sltiu      a0, s8, 599
                  vmfle.vf   v21,v13,fs9
                  vfmin.vf   v9,v11,fa7,v0.t
                  vmfeq.vf   v1,v28,fs4
                  mulhu      t3, t3, zero
                  sltiu      s0, t2, -318
                  mulhsu     a6, a2, s4
                  vmfne.vv   v12,v7,v9
                  vfredosum.vs v11,v10,v2
                  xori       s8, a1, -508
                  sub        t4, a0, a6
                  srli       t3, a1, 5
                  xor        s7, t3, a0
                  vfcvt.xu.f.v v19,v15
                  vfcvt.xu.f.v v21,v16,v0.t
                  sltu       t0, a3, zero
                  lui        t3, 679054
                  mul        s10, a3, s2
                  vfmul.vv   v23,v0,v3,v0.t
                  vmfgt.vf   v17,v1,fs4,v0.t
                  vfmax.vf   v23,v1,ft11
                  xori       t3, a7, -914
                  vfmax.vf   v16,v15,ft8
                  vfcvt.x.f.v v0,v13
                  vfsub.vf   v4,v29,ft4
                  sltu       a1, s9, a3
                  mulh       s4, s10, s4
                  slti       a6, a1, 369
                  vfsgnjn.vf v18,v3,fs2,v0.t
                  ori        a0, gp, -498
                  vfredmax.vs v26,v15,v3
                  divu       a7, sp, s1
                  vmfge.vf   v5,v9,ft7,v0.t
                  vfredmin.vs v2,v10,v7,v0.t
                  vmfle.vf   v0,v18,ft2
                  and        a6, s8, s11
                  addi       t3, t5, 827
                  vfmul.vf   v28,v15,fa6
                  mulhu      s9, s9, s1
                  vfcvt.f.xu.v v4,v19,v0.t
                  mul        s9, t4, sp
                  div        t4, a4, a1
                  srai       a7, s1, 10
                  mul        t6, ra, t0
                  vfredosum.vs v5,v20,v16,v0.t
                  xor        s5, s1, s8
                  vfredsum.vs v31,v14,v13
                  mulhsu     gp, s2, t5
                  vfcvt.f.xu.v v22,v27,v0.t
                  xor        s7, s9, ra
                  or         s5, t5, t6
                  vfcvt.xu.f.v v6,v6,v0.t
                  vfclass.v v6,v13,v0.t
                  mulh       tp, a3, t0
                  vmfne.vv   v30,v28,v22
                  or         s0, a5, s6
                  vfsgnjn.vf v17,v9,ft5
                  sltu       t6, s7, a1
                  vfmul.vv   v1,v31,v24,v0.t
                  sll        s7, s10, s5
                  vfredmax.vs v24,v29,v29,v0.t
                  vfcvt.x.f.v v0,v13
                  mulhu      tp, s3, s11
                  vfcvt.xu.f.v v18,v2
                  mulhsu     t0, s7, s3
                  remu       s10, sp, t0
                  vmfne.vv   v18,v21,v9,v0.t
                  or         t3, a5, a4
                  xori       s4, s3, 918
                  vfsub.vf   v14,v16,fs1
                  xor        t5, s0, gp
                  vfadd.vf   v3,v18,ft0,v0.t
                  ori        t1, t6, 416
                  vmfne.vv   v20,v22,v10
                  sra        a0, s2, zero
                  vmfge.vf   v6,v15,fs8
                  vfmax.vv   v19,v28,v16
                  vfcvt.f.xu.v v6,v27
                  vfadd.vv   v0,v3,v23
                  vmfeq.vv   v24,v27,v5
                  vfmul.vf   v3,v13,fs2,v0.t
                  slli       s7, a7, 15
                  vfmul.vv   v16,v19,v17
                  vfsgnjx.vf v24,v28,fa2
                  vfredsum.vs v22,v25,v3
                  vfcvt.xu.f.v v27,v21,v0.t
                  remu       s1, gp, a1
                  sltiu      t5, a4, -4
                  vfclass.v v6,v4
                  vfredmin.vs v14,v0,v8
                  add        t1, s2, s6
                  sub        t6, s0, s0
                  addi       s7, gp, -958
                  xori       s9, s2, 673
                  vmfeq.vf   v23,v17,ft0,v0.t
                  vfcvt.x.f.v v26,v20
                  vmfgt.vf   v14,v8,fs1,v0.t
                  vmfle.vv   v9,v31,v21
                  andi       a3, a3, -551
                  ori        t0, s10, 22
                  vfclass.v v0,v29
                  add        t1, s10, s3
                  vfmul.vv   v6,v4,v18
                  srl        t4, s11, t2
                  vmfle.vv   v1,v7,v29,v0.t
                  mul        sp, s3, s3
                  vfcvt.f.xu.v v16,v5
                  vfsgnj.vv  v18,v10,v6,v0.t
                  vmfne.vf   v24,v6,fa6
                  vmfgt.vf   v1,v21,ft9
                  vfsgnj.vv  v2,v7,v11
                  vfsgnjn.vv v7,v26,v10,v0.t
                  vfclass.v v6,v5,v0.t
                  xor        a0, t3, s2
                  vmfeq.vf   v27,v18,ft1
                  vfcvt.f.xu.v v0,v16
                  sra        a4, s1, s6
                  lui        a2, 378707
                  vmflt.vv   v31,v7,v19
                  vfrsub.vf  v0,v6,ft10
                  vfredosum.vs v3,v6,v28
                  srai       a1, a5, 0
                  mulh       sp, t3, s7
                  vfcvt.f.x.v v2,v31,v0.t
                  vfmul.vf   v8,v2,ft11
                  vmfle.vf   v6,v25,fa7
                  sra        a7, a6, a5
                  ori        s3, s5, -815
                  ori        sp, s9, -472
                  lui        s10, 405642
                  xori       s9, t4, 748
                  div        t0, t1, s10
                  vfmin.vv   v22,v0,v13,v0.t
                  sub        sp, s0, s0
                  vfmax.vf   v6,v10,fs10
                  vfmul.vv   v12,v5,v26
                  rem        s7, a7, a5
                  srli       a0, s11, 3
                  lui        ra, 141285
                  vfsub.vv   v19,v17,v1,v0.t
                  vfcvt.f.xu.v v31,v18
                  div        a4, s10, t3
                  vmfne.vv   v9,v5,v1
                  auipc      sp, 991141
                  addi       t0, a1, 931
                  mulh       s8, t3, a6
                  divu       s10, a2, a0
                  vfredmax.vs v16,v24,v15,v0.t
                  mulhu      ra, a2, t2
                  slt        t6, s11, a3
                  vfredosum.vs v0,v9,v26
                  vfcvt.xu.f.v v11,v4
                  slti       tp, s1, 200
                  vmfge.vf   v22,v18,ft2
                  sra        a2, t2, s0
                  vfsgnjn.vf v24,v0,fs1
                  slt        s0, ra, zero
                  divu       a2, s8, t1
                  andi       sp, s1, -786
                  srai       gp, s4, 30
                  vfclass.v v23,v0,v0.t
                  rem        s4, s10, t5
                  vfadd.vf   v23,v19,fs7
                  rem        s4, t3, gp
                  vfadd.vf   v23,v20,fs5,v0.t
                  slti       a3, a2, -123
                  vmfle.vf   v30,v4,fs11
                  srli       a7, t6, 1
                  slt        t6, zero, t5
                  vfredmin.vs v30,v13,v10,v0.t
                  vfredosum.vs v14,v5,v2,v0.t
                  vfrsub.vf  v3,v25,ft1,v0.t
                  mulhu      s7, t3, a7
                  vmflt.vf   v19,v8,fs9
                  mulhsu     s8, a7, t2
                  vmfge.vf   v3,v28,fs6
                  vfredosum.vs v3,v3,v10
                  vmfgt.vf   v30,v29,ft5,v0.t
                  vmfle.vf   v25,v4,fs1,v0.t
                  remu       s0, s6, a6
                  addi       s1, a2, -15
                  auipc      s8, 969500
                  vmfgt.vf   v22,v29,fa5,v0.t
                  vfsgnjn.vv v31,v5,v20,v0.t
                  ori        t2, gp, -272
                  vfcvt.f.xu.v v20,v6,v0.t
                  auipc      t4, 548933
                  srli       s0, a7, 5
                  vfcvt.xu.f.v v29,v5
                  xori       t3, t4, 627
                  sltu       t1, t6, t0
                  remu       s4, ra, t1
                  vfredmin.vs v20,v27,v5
                  remu       s7, t0, a5
                  vfcvt.f.x.v v20,v28,v0.t
                  mulh       t2, a4, s8
                  vfmax.vf   v2,v11,fs2,v0.t
                  vfsgnjx.vf v9,v21,fs3
                  mulh       tp, a1, t5
                  xori       s8, tp, 287
                  vfredsum.vs v27,v2,v31,v0.t
                  rem        a2, a5, s6
                  andi       s1, t1, 868
                  sll        t5, s6, tp
                  mulhu      s1, s3, tp
                  vfadd.vf   v31,v16,fs5
                  divu       tp, s1, gp
                  slli       t0, t4, 6
                  vfcvt.xu.f.v v3,v12
                  addi       t3, ra, 542
                  divu       t4, a0, t6
                  div        s5, s3, a6
                  vfmin.vv   v4,v13,v16,v0.t
                  and        s1, ra, a3
                  vfmax.vf   v18,v28,fa3
                  vfredmin.vs v5,v16,v3
                  remu       t0, s10, sp
                  mulhu      t5, a1, gp
                  lui        a5, 541343
                  sub        s10, s7, tp
                  mulhu      a7, s10, zero
                  auipc      s10, 591013
                  vmfeq.vv   v21,v28,v15
                  rem        s7, s0, a6
                  vmflt.vf   v15,v14,fs8,v0.t
                  and        s3, tp, t0
                  mulhu      t3, s6, s9
                  mulh       a6, a4, s2
                  andi       t5, a3, -655
                  sltu       t1, tp, s11
                  vfcvt.xu.f.v v23,v6,v0.t
                  srai       s3, zero, 12
                  add        a0, s11, s7
                  vfrsub.vf  v11,v18,fs6
                  xor        s4, t5, t2
                  sra        s0, a0, t6
                  rem        s9, t3, a1
                  mulh       ra, t4, a2
                  vfredsum.vs v6,v16,v31,v0.t
                  vmfeq.vf   v17,v11,fa0
                  vmfne.vv   v7,v27,v15
                  vfmul.vv   v11,v28,v20,v0.t
                  mulhu      s10, t0, sp
                  vfsub.vf   v15,v17,fs0,v0.t
                  vfcvt.f.x.v v25,v27,v0.t
                  vfcvt.f.x.v v5,v9
                  andi       a7, s4, -115
                  auipc      a7, 227108
                  remu       s1, a2, a3
                  xor        a0, zero, s6
                  sltiu      t4, s7, 984
                  and        t3, s9, s7
                  divu       a1, t2, s10
                  divu       a1, t3, s4
                  vfredmin.vs v23,v5,v4
                  rem        s9, s3, sp
                  vfcvt.f.xu.v v25,v12,v0.t
                  sra        t5, s8, s2
                  vfsgnj.vv  v13,v2,v20
                  vfcvt.f.x.v v25,v4,v0.t
                  mulh       gp, a5, s3
                  ori        a4, a3, 114
                  vfredosum.vs v21,v16,v29
                  vfredmax.vs v12,v16,v20
                  vmfgt.vf   v1,v25,ft10
                  mulhsu     s4, a4, t4
                  add        s1, a6, s6
                  vfredosum.vs v17,v2,v29,v0.t
                  sll        sp, a4, s6
                  vmfgt.vf   v16,v25,fs10
                  vfredmax.vs v16,v16,v16,v0.t
                  ori        zero, s8, -588
                  vfcvt.xu.f.v v5,v1
                  auipc      a0, 400828
                  sra        s4, a1, s6
                  vmfge.vf   v22,v21,fa1,v0.t
                  srl        s4, t4, s11
                  andi       a2, a6, -385
                  vfcvt.x.f.v v25,v15,v0.t
                  mul        s5, zero, t2
                  or         t2, t4, s11
                  vmfge.vf   v9,v15,ft0,v0.t
                  vfcvt.f.xu.v v27,v7,v0.t
                  rem        t4, ra, s5
                  vfsgnj.vf  v14,v30,fs3,v0.t
                  rem        s1, a2, a2
                  vfadd.vv   v18,v13,v29
                  vfsgnjn.vf v30,v9,ft9,v0.t
                  vfmax.vf   v18,v25,fs10,v0.t
                  remu       t0, a7, a6
                  srl        s9, s5, sp
                  vfrsub.vf  v9,v12,ft8,v0.t
                  div        a4, t6, s6
                  vmflt.vv   v4,v13,v8,v0.t
                  vfsgnjx.vf v19,v30,ft2
                  xor        a7, a4, gp
                  vfredsum.vs v6,v14,v6
                  vfclass.v v12,v24
                  vmfeq.vv   v30,v1,v2,v0.t
                  slti       gp, t2, -571
                  srl        a0, s9, s6
                  slti       t6, t3, -549
                  div        sp, s4, t1
                  vmfgt.vf   v23,v19,fa2,v0.t
                  add        t3, s0, s4
                  rem        sp, t1, a0
                  mulhsu     t5, t5, a2
                  vfclass.v v12,v27
                  srl        s3, s4, s4
                  vfredosum.vs v13,v19,v1
                  vfcvt.xu.f.v v25,v14,v0.t
                  xori       s5, a2, 860
                  or         a2, a1, zero
                  remu       a1, t1, s8
                  vmfle.vf   v7,v24,ft11,v0.t
                  vfredosum.vs v26,v18,v10,v0.t
                  vfclass.v v15,v7
                  vmfeq.vf   v13,v0,fa7
                  slti       s4, a2, 284
                  srai       a3, t0, 20
                  sltu       s1, a5, t3
                  srli       sp, a6, 26
                  vfredosum.vs v19,v7,v13,v0.t
                  mulhsu     a4, t0, sp
                  mulhu      zero, s5, t3
                  vfmul.vv   v5,v7,v13
                  vmfne.vv   v27,v3,v16
                  ori        a6, s1, 159
                  addi       a5, s8, 175
                  mulh       a4, t1, t6
                  and        s7, a0, s8
                  mulhu      t1, zero, s8
                  addi       a4, s11, 703
                  vfcvt.f.xu.v v12,v11,v0.t
                  vfsgnj.vf  v29,v10,fs11
                  rem        s1, t2, s0
                  vmflt.vf   v4,v3,fs10
                  mulh       zero, sp, a0
                  mul        s10, s2, a4
                  ori        t0, s9, 637
                  slti       t3, s3, -425
                  vmfle.vf   v4,v9,ft10,v0.t
                  sll        a6, a2, gp
                  vmflt.vf   v19,v5,fs1,v0.t
                  sltiu      a3, s11, 783
                  xori       a5, s5, 946
                  vmfeq.vf   v14,v12,fa2
                  vfsgnjx.vv v30,v24,v17,v0.t
                  or         a6, t0, t1
                  mulh       s7, a6, t3
                  vfcvt.xu.f.v v4,v27
                  div        zero, s0, s8
                  mulhu      t2, s2, a5
                  mulh       ra, a3, a7
                  vmfne.vv   v22,v17,v18,v0.t
                  vfredosum.vs v7,v16,v4,v0.t
                  mulh       s3, sp, a7
                  vfcvt.x.f.v v9,v13,v0.t
                  andi       s4, a0, -8
                  slli       s8, s8, 27
                  vfmul.vv   v3,v17,v14
                  andi       s10, a7, 272
                  sltiu      t2, s0, 171
                  sra        a7, s6, s0
                  xor        t0, a2, s8
                  lui        t0, 823149
                  srli       zero, a7, 29
                  mulhu      a4, t1, s11
                  vfadd.vf   v22,v4,fs9
                  vfadd.vf   v24,v18,fa3,v0.t
                  vmfgt.vf   v18,v13,fa3,v0.t
                  slti       t3, s10, 647
                  vmfeq.vv   v11,v5,v14
                  xor        t5, zero, s7
                  mulh       a6, s7, s0
                  div        gp, t2, sp
                  mulhu      t4, t3, ra
                  xor        s8, zero, sp
                  and        a3, t0, a2
                  vfredosum.vs v29,v24,v20
                  vfcvt.x.f.v v8,v27
                  auipc      ra, 816502
                  or         a1, tp, a6
                  vfrsub.vf  v16,v18,ft3,v0.t
                  add        gp, a7, a5
                  lui        a5, 376708
                  vfmul.vf   v0,v22,fs8
                  srli       a7, t2, 16
                  add        t6, a0, a6
                  vfredsum.vs v1,v22,v21
                  slli       a2, gp, 31
                  mulhsu     t0, zero, a2
                  or         s9, s0, s5
                  lui        ra, 668243
                  vmfge.vf   v0,v8,fa0
                  vmflt.vf   v19,v25,fs7
                  addi       a2, a5, -932
                  and        t1, tp, s9
                  vmfeq.vv   v18,v13,v17,v0.t
                  sra        sp, a0, s6
                  and        tp, a5, t3
                  vfmul.vf   v14,v12,ft10,v0.t
                  vfsgnj.vf  v31,v6,fs9,v0.t
                  or         t5, s1, t0
                  andi       t5, t2, -980
                  xor        a2, t0, s0
                  vmfle.vf   v31,v13,fs0,v0.t
                  vmfeq.vv   v19,v2,v8,v0.t
                  divu       t5, s7, s1
                  vfsgnj.vv  v16,v11,v16,v0.t
                  sltu       t1, s3, s3
                  vfrsub.vf  v23,v19,fs5
                  vfadd.vf   v21,v29,fa1
                  vfsgnj.vv  v17,v13,v1,v0.t
                  vfcvt.f.x.v v9,v28
                  vfsub.vv   v4,v29,v29,v0.t
                  xori       t4, a5, -140
                  remu       a5, gp, s3
                  or         s4, s7, a2
                  sub        t6, t1, gp
                  xor        s8, s3, s11
                  vmflt.vv   v13,v8,v8
                  andi       s0, a6, 239
                  vfmax.vv   v12,v8,v23
                  vfcvt.f.x.v v19,v16
                  vfsgnj.vf  v30,v26,ft6
                  sltiu      a2, s8, 718
                  sub        zero, a7, t2
                  srai       s10, s2, 19
                  vfmul.vv   v31,v22,v12,v0.t
                  vmfeq.vv   v10,v29,v23
                  andi       a6, zero, -741
                  vfsub.vv   v28,v8,v27
                  sltiu      s9, s11, 601
                  vfmax.vf   v16,v9,ft10,v0.t
                  vfmin.vv   v23,v25,v13,v0.t
                  vfadd.vv   v16,v21,v28
                  slt        s7, gp, t6
                  div        t2, s7, t6
                  andi       t2, t2, -749
                  vfsub.vv   v8,v18,v23
                  xor        a2, s7, a7
                  divu       gp, s1, a0
                  mul        zero, s2, t6
                  addi       t4, s7, 816
                  vmfge.vf   v30,v22,ft6,v0.t
                  vmfgt.vf   v12,v18,ft9
                  sra        t0, a2, s3
                  srl        t2, a6, a3
                  slti       ra, s0, -413
                  vfmin.vf   v2,v28,ft3,v0.t
                  vmfeq.vv   v20,v27,v25,v0.t
                  vmfne.vf   v31,v17,ft3
                  srl        t5, t3, ra
                  vfsgnj.vf  v18,v11,fs8
                  vfcvt.f.xu.v v30,v8
                  vfredsum.vs v17,v21,v4,v0.t
                  vfcvt.x.f.v v9,v16,v0.t
                  or         a5, t2, t6
                  vfsgnj.vf  v1,v3,fs2,v0.t
                  vfredmin.vs v24,v3,v19,v0.t
                  vfclass.v v29,v4,v0.t
                  vfmin.vf   v16,v22,fa0,v0.t
                  vmfge.vf   v19,v13,fa3
                  sltu       t2, a6, s4
                  vfcvt.f.x.v v3,v28
                  vfredsum.vs v5,v4,v4
                  slli       t4, s2, 0
                  vfredsum.vs v8,v4,v28
                  auipc      s3, 344256
                  add        t3, gp, s10
                  ori        a0, a2, 783
                  vfsgnjn.vv v8,v22,v20
                  vfadd.vv   v4,v24,v11,v0.t
                  vfredsum.vs v18,v14,v15
                  auipc      t4, 540154
                  or         s1, sp, s5
                  vmfgt.vf   v20,v15,fa6,v0.t
                  vmfne.vf   v15,v30,fa0
                  slli       ra, a3, 1
                  ori        ra, a2, -789
                  vfclass.v v10,v27
                  or         sp, zero, t0
                  vfredmax.vs v28,v25,v24
                  vfrsub.vf  v27,v11,ft9
                  mul        a2, t4, a0
                  vfredmin.vs v28,v17,v6,v0.t
                  andi       s9, t2, -551
                  vmfle.vf   v2,v26,ft8,v0.t
                  vfsgnjx.vv v6,v7,v25
                  vmflt.vf   v17,v31,fa7,v0.t
                  vfcvt.f.x.v v17,v17,v0.t
                  addi       s4, s7, 496
                  mulh       tp, t6, t4
                  vfcvt.f.x.v v24,v24
                  vfclass.v v0,v26
                  vfsub.vv   v12,v12,v2
                  vfclass.v v21,v17
                  vfmin.vv   v10,v4,v6,v0.t
                  vfsgnj.vf  v7,v0,fa4,v0.t
                  mulh       t5, zero, s4
                  vfsgnjx.vv v4,v20,v26
                  vfsgnj.vv  v11,v1,v15,v0.t
                  vfadd.vf   v16,v4,ft10,v0.t
                  div        s1, s5, a2
                  vfcvt.xu.f.v v3,v7
                  rem        sp, s3, s8
                  auipc      a4, 885384
                  vfmin.vf   v14,v10,fs4,v0.t
                  mul        s3, a7, a7
                  xor        tp, s8, tp
                  add        zero, t6, sp
                  vfadd.vv   v30,v14,v20
                  mulhu      a6, s3, s6
                  vfmin.vv   v4,v11,v2
                  srl        t0, s5, t4
                  vmfeq.vv   v13,v5,v25,v0.t
                  vfmul.vv   v24,v9,v20,v0.t
                  vfadd.vv   v23,v16,v9
                  xori       s7, t3, -274
                  slli       a0, t3, 4
                  vfadd.vf   v11,v31,fs7,v0.t
                  rem        s4, a6, t6
                  mulh       s3, s6, a7
                  vmfeq.vf   v11,v22,ft6
                  vfredsum.vs v0,v17,v24
                  vmfle.vf   v0,v22,fs4
                  vfredmin.vs v17,v5,v27,v0.t
                  mul        a4, t1, t0
                  vfmax.vf   v16,v18,fa3
                  srli       s5, a6, 28
                  or         s8, a2, s3
                  xori       s7, t0, 702
                  div        s8, a5, a0
                  remu       zero, a4, s11
                  slli       ra, s4, 7
                  vfadd.vf   v19,v8,ft6
                  vfredsum.vs v1,v5,v17,v0.t
                  vfmax.vf   v27,v21,fs10
                  slti       s3, t5, -448
                  vfredmax.vs v9,v30,v23
                  sll        t5, t6, s9
                  vfadd.vf   v15,v22,fs2,v0.t
                  vfadd.vf   v18,v3,fs0
                  vfcvt.xu.f.v v21,v26
                  srai       zero, s9, 26
                  vfredosum.vs v31,v12,v1
                  vfcvt.x.f.v v18,v24
                  vfcvt.f.x.v v10,v26,v0.t
                  xori       t5, a4, -273
                  vmfge.vf   v14,v5,fa1,v0.t
                  vfcvt.f.xu.v v10,v1
                  vfrsub.vf  v5,v9,fs11
                  and        t3, a7, s11
                  or         a0, s10, s0
                  vfadd.vv   v12,v8,v8,v0.t
                  vmfne.vf   v29,v11,fs5
                  vfredsum.vs v5,v6,v11
                  slt        s10, t4, t1
                  sltu       t5, s4, a2
                  srli       s4, t3, 22
                  vfmin.vf   v3,v13,fa2
                  vfcvt.f.xu.v v28,v28
                  vmfgt.vf   v18,v24,fs5
                  auipc      s10, 549553
                  vfcvt.f.x.v v1,v22
                  or         a6, s0, t0
                  remu       a0, s10, gp
                  vfmin.vf   v7,v8,fs6,v0.t
                  slti       s7, t6, -234
                  auipc      s7, 923962
                  vfmax.vf   v9,v31,ft0
                  xor        t4, a6, s1
                  vfredsum.vs v31,v21,v8
                  andi       t6, s8, 371
                  vmfge.vf   v23,v30,fs1,v0.t
                  vfredosum.vs v29,v18,v13,v0.t
                  vfmin.vv   v23,v2,v14,v0.t
                  vfrsub.vf  v4,v15,ft9,v0.t
                  vfmul.vf   v21,v30,ft3,v0.t
                  vmfge.vf   v5,v0,ft5,v0.t
                  vmflt.vf   v31,v29,fs10
                  vfadd.vv   v1,v2,v15
                  srl        t3, t3, ra
                  sll        a1, s11, gp
                  vfsgnjn.vf v14,v20,ft0
                  xori       s3, sp, -649
                  vfrsub.vf  v21,v22,fa1,v0.t
                  vmfle.vv   v21,v16,v27
                  srli       a3, s0, 22
                  vfredsum.vs v15,v0,v9
                  auipc      t4, 252678
                  srl        s0, zero, a0
                  vfmin.vf   v26,v6,fs2
                  vfcvt.f.x.v v8,v4,v0.t
                  mulhsu     a0, a0, tp
                  vmfgt.vf   v15,v23,ft6
                  andi       sp, t4, 226
                  vfredsum.vs v21,v25,v12,v0.t
                  xor        s5, s7, a6
                  slli       ra, a7, 28
                  vfmul.vf   v18,v13,fa1,v0.t
                  vfadd.vf   v24,v9,ft8,v0.t
                  vfredsum.vs v12,v30,v4,v0.t
                  slt        t3, a2, t4
                  vfmul.vv   v0,v15,v13
                  addi       s3, a6, -616
                  addi       tp, s2, 836
                  srli       s7, t5, 29
                  mulhu      t1, t0, ra
                  andi       ra, tp, 220
                  remu       a4, s3, t3
                  remu       t3, s6, a1
                  vmfle.vv   v22,v7,v7
                  or         ra, a1, a3
                  vfcvt.x.f.v v0,v25
                  div        s5, t3, s0
                  vfcvt.x.f.v v22,v15,v0.t
                  slt        t0, a0, gp
                  ori        s0, t5, -699
                  auipc      a6, 64416
                  vmfeq.vf   v17,v24,ft2,v0.t
                  vfredmax.vs v20,v28,v3,v0.t
                  vfsgnjn.vf v13,v1,fs2,v0.t
                  vfmin.vv   v11,v10,v3,v0.t
                  slti       s4, a5, 956
                  mulhu      t0, s7, s7
                  slt        zero, s11, s3
                  vfmul.vf   v25,v28,fs9
                  sltu       a4, s0, ra
                  mulhu      s8, t6, a5
                  slli       t0, a2, 0
                  lui        ra, 30380
                  sub        t4, ra, s9
                  slt        a2, gp, a2
                  auipc      t6, 825548
                  vfredosum.vs v20,v25,v13
                  vfcvt.f.x.v v13,v9,v0.t
                  vfsgnjn.vf v5,v25,fa0,v0.t
                  slt        zero, a2, t6
                  div        t6, s3, tp
                  sll        t2, t2, t4
                  mulhsu     t4, t3, a5
                  sltiu      t6, s10, -144
                  sll        s7, tp, s11
                  vfcvt.xu.f.v v8,v15
                  vfsgnjn.vv v23,v13,v29
                  xori       t6, s7, -540
                  and        a1, s1, t1
                  vmflt.vf   v25,v16,fa3,v0.t
                  vfclass.v v12,v16
                  addi       s10, s4, -446
                  vfsub.vf   v6,v29,ft3,v0.t
                  xori       s1, t0, -12
                  vmflt.vv   v26,v12,v15
                  vfclass.v v15,v23,v0.t
                  vfcvt.f.x.v v15,v19,v0.t
                  slti       t1, s10, 273
                  vfcvt.x.f.v v27,v16
                  or         s0, s2, a7
                  and        tp, a0, t2
                  slt        ra, zero, s1
                  srl        a2, a1, s9
                  xor        s3, t4, a3
                  vfmax.vv   v20,v26,v14
                  add        a2, s10, s8
                  xori       a4, s0, 597
                  vmfgt.vf   v31,v22,fs2
                  vmflt.vv   v30,v6,v6
                  vmfne.vf   v1,v20,ft11,v0.t
                  vfmul.vf   v1,v3,fa3,v0.t
                  vfmax.vv   v3,v3,v14,v0.t
                  srli       s5, a0, 23
                  sra        t4, tp, s1
                  sll        s7, t1, a3
                  mul        t3, a6, t2
                  ori        s8, a2, -19
                  auipc      t4, 549669
                  xor        a5, t5, s3
                  vmfne.vf   v9,v5,ft5
                  sltu       t0, t4, s6
                  mulhu      t4, t6, t1
                  add        t6, s3, s9
                  sltiu      tp, s0, -237
                  remu       t3, s8, a3
                  add        a3, t0, t6
                  vfmax.vf   v23,v14,fs7
                  lui        tp, 317955
                  sltu       t6, t4, s4
                  sll        s9, t2, s4
                  mulhsu     t0, a5, s0
                  srai       a2, t4, 6
                  or         a2, zero, a0
                  vfsgnjn.vf v15,v28,ft8,v0.t
                  and        a6, t4, s4
                  vfadd.vf   v21,v4,fs6
                  vfcvt.xu.f.v v30,v25
                  addi       t5, s1, 573
                  mulh       a2, a0, s2
                  slt        a1, zero, a2
                  vfmul.vv   v0,v27,v19
                  mulh       t6, s11, t1
                  vmfge.vf   v10,v13,ft10,v0.t
                  vfcvt.f.x.v v15,v22,v0.t
                  vfmin.vv   v18,v28,v9
                  vfcvt.f.x.v v10,v21,v0.t
                  slti       t1, s6, -252
                  vfsgnjx.vv v2,v18,v5,v0.t
                  mul        s9, tp, s7
                  mulhsu     t6, s7, t6
                  sltu       t2, s4, s4
                  mulh       s7, zero, s8
                  slli       t0, t2, 30
                  divu       zero, s2, s7
                  vfsgnj.vv  v26,v1,v11
                  vmfge.vf   v20,v29,ft3
                  vmflt.vv   v18,v0,v0,v0.t
                  vfadd.vf   v13,v22,ft9
                  lui        t3, 1045062
                  vfsgnjn.vf v9,v10,ft8
                  remu       a3, a4, t2
                  srli       a6, s0, 27
                  vfsgnjn.vf v17,v30,ft6
                  xor        a4, s8, t3
                  divu       s4, sp, a6
                  vfclass.v v10,v26
                  sltu       s1, t4, tp
                  div        s3, s2, gp
                  vmfne.vf   v25,v24,fa3,v0.t
                  divu       s10, gp, t1
                  slt        tp, zero, s3
                  auipc      a3, 425261
                  divu       s4, s1, a3
                  vfcvt.f.xu.v v31,v1,v0.t
                  div        s9, t6, a1
                  sltiu      a6, s1, -871
                  vfsub.vv   v29,v3,v5
                  add        a4, s1, a3
                  rem        t1, a2, t2
                  vmfgt.vf   v24,v5,fa0
                  or         ra, s4, a0
                  vfredosum.vs v29,v7,v15,v0.t
                  vfcvt.f.x.v v2,v6
                  vfsgnjn.vv v29,v4,v28
                  and        s1, s10, t6
                  and        s5, s4, a5
                  sltu       a7, s6, t2
                  vfcvt.f.x.v v3,v20,v0.t
                  vfcvt.f.xu.v v8,v8,v0.t
                  rem        s5, tp, t1
                  vfredosum.vs v24,v31,v5
                  vmfeq.vv   v9,v31,v2
                  sltu       a1, t3, a7
                  slti       a4, a4, 558
                  vmflt.vv   v13,v8,v31,v0.t
                  sltiu      s4, sp, -1013
                  or         a4, s5, s9
                  vfsgnj.vv  v28,v31,v18,v0.t
                  vmfle.vf   v31,v9,ft8
                  vfsgnj.vv  v26,v25,v8,v0.t
                  vfredmin.vs v10,v12,v5
                  vfrsub.vf  v23,v7,fa3,v0.t
                  mulh       s8, ra, t6
                  xori       a0, s6, -948
                  addi       t6, ra, -255
                  sltu       a6, a2, s6
                  sra        t4, s8, s1
                  vfcvt.f.xu.v v4,v11
                  ori        t1, s4, 143
                  divu       a3, s4, zero
                  vfmax.vf   v0,v18,fa2
                  mulh       s4, a1, t1
                  sll        s10, s3, a2
                  sll        s5, a4, a2
                  vmfge.vf   v6,v31,fa2
                  auipc      a2, 399663
                  vfclass.v v12,v27,v0.t
                  vfcvt.f.x.v v26,v29,v0.t
                  xori       t4, a0, -57
                  sll        a4, a4, t0
                  vfredosum.vs v27,v25,v5,v0.t
                  andi       s4, s0, -658
                  mul        t6, a4, s11
                  sub        s4, zero, a7
                  sll        ra, a4, a3
                  vmfgt.vf   v1,v27,fa2
                  vmfgt.vf   v15,v4,fs1,v0.t
                  vfmul.vv   v5,v7,v22,v0.t
                  vfredosum.vs v17,v2,v14,v0.t
                  slli       t0, a1, 29
                  slt        a1, s9, s0
                  vfmul.vf   v4,v26,ft6
                  andi       s7, gp, -817
                  vfmax.vf   v6,v25,fa4
                  sltiu      t1, s8, 695
                  vmfge.vf   v27,v24,fs1
                  andi       s7, ra, -322
                  sltu       zero, zero, s10
                  vfcvt.xu.f.v v22,v5
                  sll        a0, a5, s2
                  xor        t4, a5, a7
                  sltiu      a6, gp, -944
                  sltu       a7, s5, s11
                  sra        a6, t6, t5
                  vfcvt.x.f.v v21,v28,v0.t
                  vmfle.vv   v6,v20,v8,v0.t
                  vmfeq.vv   v22,v11,v11,v0.t
                  mulh       s9, a6, s0
                  vfsgnjn.vv v0,v1,v5
                  and        ra, t6, a5
                  sub        s0, s11, a7
                  mulhu      sp, s1, sp
                  xori       t4, s6, -371
                  mulhsu     s7, sp, gp
                  vfcvt.f.xu.v v18,v1,v0.t
                  slti       s10, a4, 626
                  ori        a5, a3, -1007
                  vfrsub.vf  v4,v15,fa6
                  vfcvt.x.f.v v9,v14,v0.t
                  vfclass.v v24,v2
                  vfsgnj.vf  v31,v14,ft11
                  vfmul.vf   v8,v12,fa0
                  andi       a6, t5, 339
                  sub        a0, s2, a5
                  vfredsum.vs v7,v24,v19,v0.t
                  addi       t2, t6, 477
                  vfmax.vf   v21,v14,ft8,v0.t
                  sltiu      s5, tp, 586
                  vmfle.vf   v2,v12,ft0
                  mulhsu     a0, s6, a1
                  vfsub.vv   v25,v19,v4,v0.t
                  vmfne.vf   v22,v26,fs11
                  slt        s4, s0, s2
                  mulhu      s1, t6, t5
                  sra        s5, a2, sp
                  auipc      t3, 31132
                  vfcvt.xu.f.v v1,v29,v0.t
                  vmfle.vv   v31,v16,v28
                  mulhu      a7, ra, t1
                  vfredmax.vs v10,v24,v28,v0.t
                  xori       ra, tp, -347
                  srai       t0, s11, 20
                  remu       s9, gp, s6
                  mulh       t4, a1, s4
                  vfcvt.x.f.v v27,v15,v0.t
                  xori       t6, t3, 637
                  or         zero, sp, s9
                  sra        s8, t6, t1
                  vfcvt.xu.f.v v12,v10
                  div        t1, s7, zero
                  auipc      s0, 618901
                  rem        a0, t2, s6
                  sltiu      s9, a0, 836
                  vfcvt.xu.f.v v2,v0,v0.t
                  vfsgnjn.vf v28,v27,fa2
                  vfadd.vf   v26,v21,ft9
                  remu       a0, a6, t6
                  mulhsu     s7, a4, a7
                  ori        s0, gp, 1020
                  mul        s10, t5, s4
                  div        a2, a3, ra
                  vfclass.v v4,v14
                  vfcvt.f.x.v v29,v27,v0.t
                  sltu       a3, s11, s9
                  vfredmax.vs v26,v14,v16
                  slti       a2, s9, 591
                  vfcvt.f.xu.v v15,v29
                  srai       a2, a1, 18
                  vfredmax.vs v0,v11,v29
                  vmflt.vf   v17,v5,fa5
                  vfadd.vf   v9,v10,fs1,v0.t
                  addi       t4, s1, -722
                  vmfeq.vv   v20,v12,v17,v0.t
                  vmflt.vv   v22,v24,v14,v0.t
                  div        t1, s7, t4
                  vfredsum.vs v12,v7,v27,v0.t
                  srai       s1, a3, 15
                  divu       a5, s8, t0
                  mul        t4, s1, s3
                  xor        s1, tp, t3
                  vmfeq.vf   v19,v4,fs7
                  vfsgnj.vv  v2,v2,v6
                  srli       a5, s5, 2
                  or         s5, s0, t6
                  xori       a1, s6, -702
                  vfsgnj.vv  v7,v0,v29
                  remu       a0, t0, ra
                  sltu       a7, s11, t0
                  vfclass.v v21,v14
                  srai       t2, zero, 7
                  xor        gp, a3, a2
                  vfmin.vf   v7,v26,fs6,v0.t
                  add        s10, s9, a0
                  addi       zero, a2, 254
                  vfsub.vf   v17,v9,fs1
                  vfrsub.vf  v12,v20,ft11
                  sub        a4, t5, t4
                  vfsgnjn.vf v13,v18,fa7
                  sltu       s10, t1, zero
                  vmfle.vv   v26,v18,v20
                  slti       a0, t5, -808
                  vfsgnjn.vv v28,v21,v0
                  vmfne.vf   v0,v31,fs1
                  vmfgt.vf   v10,v25,fa4
                  and        a0, s10, t6
                  mul        a4, tp, t2
                  vmfeq.vv   v0,v28,v1
                  slli       a5, a7, 6
                  vfadd.vf   v14,v17,ft8,v0.t
                  vfcvt.x.f.v v25,v26,v0.t
                  vmfgt.vf   v9,v7,fs3,v0.t
                  div        a7, a5, t4
                  vfredmin.vs v15,v16,v3
                  slli       a5, t2, 11
                  vfcvt.f.xu.v v28,v27
                  vfcvt.f.xu.v v16,v14,v0.t
                  or         sp, s7, a3
                  slt        a5, s2, gp
                  vfrsub.vf  v1,v28,ft11,v0.t
                  vfcvt.xu.f.v v1,v5
                  vmfgt.vf   v16,v6,fs8,v0.t
                  vmfeq.vf   v9,v27,ft9,v0.t
                  remu       a0, s8, t5
                  mulhu      s0, a7, a0
                  ori        s0, t3, 535
                  xor        t6, gp, s3
                  xori       s1, t4, -365
                  or         t5, t3, s5
                  rem        a7, s8, s8
                  vfsub.vv   v31,v24,v0
                  and        t4, s5, s6
                  vfredsum.vs v23,v27,v6
                  div        t1, gp, s9
                  sub        t5, t3, gp
                  vfadd.vv   v21,v11,v14
                  sll        a7, t3, ra
                  sltiu      s10, zero, 484
                  remu       s10, a0, t2
                  sltu       s3, t5, a2
                  vfmax.vf   v18,v28,fs11,v0.t
                  vmfge.vf   v30,v13,fs4,v0.t
                  mul        s7, tp, s3
                  mulhu      ra, s9, a5
                  vfsgnjx.vv v23,v25,v0,v0.t
                  vfcvt.f.x.v v18,v2
                  vmfne.vv   v7,v11,v31
                  vfredsum.vs v23,v14,v8,v0.t
                  sub        a3, a1, t4
                  add        a2, t6, s11
                  vfmin.vv   v27,v18,v22,v0.t
                  vfcvt.xu.f.v v30,v19,v0.t
                  lui        a4, 542910
                  addi       t5, s3, 847
                  vmfle.vf   v8,v19,ft8,v0.t
                  vmflt.vf   v23,v29,ft1
                  vfredmax.vs v30,v19,v5
                  vmfeq.vf   v18,v1,fa2,v0.t
                  vfadd.vf   v20,v8,fs0,v0.t
                  vmfne.vv   v1,v7,v17,v0.t
                  vfsgnjx.vv v11,v0,v12,v0.t
                  vfsgnjn.vv v3,v15,v5,v0.t
                  rem        a7, t5, sp
                  div        tp, s11, a0
                  mulhsu     s0, t2, t2
                  sltiu      s9, s5, -800
                  sra        t3, a7, s3
                  vmfle.vf   v9,v22,fs1,v0.t
                  ori        t2, tp, 881
                  vfadd.vf   v31,v29,ft6
                  vmfge.vf   v15,v14,fs1,v0.t
                  vfcvt.f.x.v v8,v14,v0.t
                  or         a6, t0, s7
                  vmfge.vf   v29,v20,fs7
                  ori        s7, s8, -817
                  srl        a5, s8, s3
                  mulh       a1, t4, s3
                  mulh       s3, tp, zero
                  or         tp, zero, gp
                  vfsgnjx.vv v21,v17,v18
                  vmfeq.vv   v4,v30,v2
                  mulh       ra, s3, a3
                  vfsgnj.vv  v22,v11,v1
                  vfredsum.vs v30,v4,v0
                  vmfge.vf   v28,v20,fa4
                  rem        s4, t0, s5
                  srai       t2, ra, 30
                  rem        a5, s1, zero
                  vfmax.vf   v15,v0,ft1
                  ori        a1, t0, 215
                  vfcvt.x.f.v v4,v1
                  vfcvt.f.x.v v21,v1
                  vfcvt.x.f.v v31,v16
                  mulh       zero, s11, s5
                  sltu       a0, t3, a1
                  vfcvt.x.f.v v24,v14
                  and        zero, a0, s11
                  vmfge.vf   v11,v3,fs3
                  auipc      a2, 68233
                  slt        a3, s7, t6
                  vmfle.vv   v15,v19,v10
                  vfmul.vv   v28,v6,v29,v0.t
                  vfcvt.xu.f.v v12,v22
                  vfredmax.vs v11,v3,v8
                  add        t2, s9, s5
                  srl        t5, a2, s3
                  andi       t4, a5, 759
                  vfmin.vv   v28,v11,v24,v0.t
                  mulhu      sp, ra, a3
                  xor        a3, t1, a4
                  vfadd.vf   v4,v12,ft10,v0.t
                  vfcvt.f.xu.v v16,v10
                  xori       sp, a6, 1009
                  vfredosum.vs v22,v21,v20
                  srai       a1, s3, 8
                  vfredsum.vs v8,v6,v16,v0.t
                  vfcvt.xu.f.v v1,v4
                  srl        t0, a3, a2
                  slt        gp, s0, s3
                  vfredmax.vs v30,v13,v30
                  and        a5, sp, s10
                  srl        s7, a3, a3
                  vmfeq.vv   v5,v6,v12
                  or         a2, s8, tp
                  vfcvt.xu.f.v v5,v10,v0.t
                  div        a4, gp, s0
                  vfsgnjn.vv v2,v20,v28,v0.t
                  vfredmax.vs v15,v0,v3,v0.t
                  sltiu      t5, ra, 26
                  slt        s5, s9, sp
                  remu       s1, s1, sp
                  vfcvt.xu.f.v v18,v4
                  vfcvt.x.f.v v11,v26,v0.t
                  sra        a5, s6, t5
                  srai       t0, s10, 4
                  sub        s8, a1, a5
                  vfredsum.vs v10,v10,v9
                  ori        s7, t0, 681
                  vfcvt.f.xu.v v16,v5
                  vfsgnj.vf  v21,v30,fa5
                  vfadd.vv   v20,v2,v7
                  srai       s1, t0, 3
                  sra        tp, s8, s2
                  vfsgnjx.vf v27,v17,ft2,v0.t
                  srli       a5, s2, 24
                  vmfgt.vf   v4,v28,fa1
                  vmflt.vv   v19,v12,v1
                  vfmul.vv   v17,v29,v25,v0.t
                  sub        s4, t3, sp
                  andi       s10, s10, 526
                  srai       s0, t6, 11
                  vfcvt.f.x.v v1,v23,v0.t
                  sra        t4, t1, s5
                  mul        s5, sp, s4
                  vmfge.vf   v23,v10,fa1
                  vfmin.vv   v11,v5,v10
                  vfmin.vf   v6,v1,fs5,v0.t
                  sltu       sp, zero, gp
                  vfadd.vf   v15,v6,ft9,v0.t
                  vfsub.vv   v15,v5,v26
                  mulhsu     zero, sp, tp
                  srli       s3, s11, 17
                  mulhsu     sp, s11, t6
                  vfredmax.vs v7,v8,v1,v0.t
                  vfredmin.vs v31,v23,v9,v0.t
                  mul        s4, a0, t0
                  vfclass.v v5,v16,v0.t
                  vfclass.v v7,v12
                  vfsgnjn.vf v25,v31,fs7,v0.t
                  vfmin.vv   v22,v31,v17,v0.t
                  srli       a0, s7, 6
                  lui        a6, 130315
                  remu       a0, s3, gp
                  srai       a4, ra, 13
                  vmfge.vf   v26,v10,ft5
                  vmflt.vf   v17,v26,ft1,v0.t
                  vfmin.vf   v1,v25,fa1,v0.t
                  rem        a1, s8, s7
                  srli       t3, a6, 10
                  srli       zero, t5, 10
                  ori        t0, s0, -615
                  remu       t6, t4, s1
                  vmfeq.vv   v20,v27,v27
                  vfredmin.vs v23,v18,v29,v0.t
                  xor        a5, s2, a3
                  mul        s7, s4, s1
                  vfsub.vv   v23,v4,v22,v0.t
                  xor        s10, a2, a6
                  ori        s0, s8, 578
                  or         t4, a5, t2
                  vfsgnjn.vf v28,v9,ft1,v0.t
                  srai       tp, t6, 26
                  vfsgnjx.vv v22,v1,v18
                  vmfne.vv   v28,v31,v3,v0.t
                  divu       a0, s1, t5
                  sra        s0, a5, s4
                  vfrsub.vf  v31,v5,fs1,v0.t
                  vfrsub.vf  v17,v19,ft11
                  mul        a6, s1, s3
                  sub        s4, s1, s4
                  srl        a2, s6, s11
                  vfsgnj.vf  v1,v27,ft7
                  vfredmin.vs v31,v24,v24,v0.t
                  div        ra, t0, a6
                  vfredmin.vs v4,v12,v3
                  vmfgt.vf   v28,v16,fs7
                  mulh       a3, t3, s5
                  vfcvt.xu.f.v v6,v17,v0.t
                  xor        a0, s4, a7
                  vfcvt.xu.f.v v21,v5,v0.t
                  lui        sp, 563284
                  and        ra, s5, zero
                  vfsgnjn.vv v25,v16,v24,v0.t
                  vfcvt.f.x.v v27,v27,v0.t
                  add        s8, s8, a0
                  slt        a3, a5, t0
                  vmfgt.vf   v20,v9,ft10
                  addi       a5, t4, 499
                  slt        a4, a7, t0
                  srai       a5, s5, 5
                  vfredsum.vs v5,v11,v14,v0.t
                  add        sp, t5, a0
                  sltiu      t0, s6, 228
                  vmfne.vv   v11,v28,v12
                  vfredmin.vs v13,v9,v28,v0.t
                  vmfeq.vv   v17,v28,v27
                  vfcvt.x.f.v v18,v14,v0.t
                  vmfge.vf   v11,v8,ft3,v0.t
                  vfmul.vv   v10,v14,v30,v0.t
                  sll        s10, a6, a5
                  slli       a0, s11, 24
                  rem        t5, s9, s1
                  sll        s4, sp, s9
                  vfrsub.vf  v26,v10,fs7
                  vfcvt.x.f.v v27,v29
                  slli       a2, t0, 31
                  ori        a7, a5, 751
                  vfmax.vf   v5,v21,ft6,v0.t
                  lui        a6, 115075
                  xor        t2, sp, s0
                  vmfeq.vv   v14,v0,v0,v0.t
                  srai       a4, a5, 11
                  vfmax.vv   v6,v24,v12
                  vfrsub.vf  v1,v18,fs2
                  sltu       s10, s3, zero
                  divu       sp, s0, a5
                  mulhu      sp, tp, s0
                  vfsgnjn.vf v3,v11,ft2,v0.t
                  mulh       s7, s2, s11
                  sra        a2, a2, s3
                  vmfne.vv   v6,v2,v10
                  add        a4, s7, tp
                  sltiu      ra, s5, 417
                  srl        s10, a0, gp
                  vfcvt.xu.f.v v0,v7
                  slt        t0, a2, s0
                  and        t1, a0, t0
                  vfcvt.f.xu.v v7,v11
                  slli       t6, s10, 5
                  mul        a7, s5, zero
                  addi       tp, a7, 94
                  auipc      ra, 223241
                  vfcvt.x.f.v v24,v9
                  vfredmax.vs v10,v12,v6
                  remu       s9, a0, s8
                  mul        a0, s5, s3
                  sll        s5, s5, t5
                  srli       a2, s7, 15
                  vfclass.v v11,v17,v0.t
                  rem        a3, t0, s3
                  vfredosum.vs v17,v14,v7,v0.t
                  divu       ra, a1, a1
                  vfcvt.f.xu.v v16,v24
                  divu       a4, s8, s10
                  xor        a4, s10, sp
                  vfrsub.vf  v10,v1,fs6,v0.t
                  sltiu      tp, a6, 922
                  vfmin.vv   v26,v20,v28
                  add        ra, zero, t3
                  vfmax.vv   v15,v8,v22,v0.t
                  mulhsu     a1, s4, t2
                  remu       a6, s5, tp
                  vmfle.vv   v12,v14,v29
                  ori        gp, s0, 4
                  sra        t6, a0, a7
                  srl        t3, t4, tp
                  vfrsub.vf  v22,v28,ft0
                  sltiu      t2, gp, -130
                  auipc      gp, 806497
                  srai       s3, t3, 14
                  remu       a2, s1, t6
                  vfredosum.vs v4,v9,v29
                  vmfgt.vf   v5,v20,fs4,v0.t
                  vfredmin.vs v13,v12,v25
                  mulh       s0, s10, a0
                  xori       t6, t3, -1016
                  vfsgnj.vf  v17,v4,ft8
                  vfsgnj.vf  v17,v7,ft2
                  sra        a4, a7, t6
                  mul        s0, a5, a7
                  remu       t5, s1, s11
                  slli       a2, s4, 27
                  vfsub.vf   v22,v7,fs6
                  ori        s4, s0, -825
                  vfadd.vf   v21,v5,fs3
                  vfcvt.x.f.v v20,v10,v0.t
                  vmflt.vf   v8,v30,fs11
                  auipc      a6, 930267
                  sltiu      zero, t4, -103
                  slt        t2, s6, a2
                  vfcvt.f.x.v v7,v17
                  vfmax.vf   v12,v2,fs6
                  vmfle.vf   v6,v23,fa5
                  vfredmax.vs v21,v14,v24,v0.t
                  auipc      a7, 265368
                  rem        s4, a6, s10
                  vfcvt.f.x.v v30,v14,v0.t
                  vmfle.vv   v6,v29,v23,v0.t
                  vmfgt.vf   v29,v20,ft6
                  srli       t3, t3, 25
                  sltiu      s4, zero, 186
                  vmfeq.vv   v7,v18,v0
                  vfadd.vv   v26,v21,v17,v0.t
                  slt        t4, t2, zero
                  vfsgnjx.vv v4,v22,v17,v0.t
                  sltu       t0, t5, a7
                  vfredosum.vs v4,v0,v22,v0.t
                  srl        s10, t4, a4
                  div        sp, t2, ra
                  vfcvt.f.x.v v12,v21
                  vfsgnjn.vv v3,v30,v26,v0.t
                  auipc      s0, 150168
                  slli       s1, a4, 25
                  add        t4, s7, s1
                  vfcvt.f.x.v v28,v13,v0.t
                  srl        s7, a4, t1
                  slti       t2, a3, 495
                  mulh       ra, t1, tp
                  vfmul.vv   v5,v12,v12
                  vfmin.vf   v20,v9,fs10
                  or         s7, a2, zero
                  auipc      s3, 749665
                  vmfeq.vv   v27,v8,v25,v0.t
                  mulhsu     t2, s0, sp
                  vfrsub.vf  v28,v9,fa2
                  vmflt.vv   v29,v24,v17
                  vfsub.vf   v27,v31,ft9
                  rem        a7, t0, s4
                  srli       a0, s5, 7
                  vmfgt.vf   v6,v13,ft0,v0.t
                  divu       a4, sp, t0
                  vfadd.vv   v12,v23,v9
                  vfredsum.vs v6,v27,v31
                  vfmax.vf   v29,v13,ft9,v0.t
                  addi       s9, s2, 908
                  vmfge.vf   v11,v12,ft3
                  vfrsub.vf  v30,v15,fa6,v0.t
                  sltu       s4, t4, a0
                  vfredmin.vs v16,v24,v20
                  or         s0, a6, s8
                  sra        a0, s8, a2
                  vmfeq.vf   v26,v17,ft10
                  vmfeq.vf   v14,v1,ft2,v0.t
                  vfcvt.xu.f.v v21,v30
                  ori        t5, s1, 983
                  or         t2, t4, s1
                  srai       s0, s7, 17
                  add        t2, t6, t4
                  vfcvt.xu.f.v v5,v18
                  slt        sp, s1, s4
                  sub        t2, s2, a0
                  remu       s8, s9, s11
                  vfcvt.xu.f.v v25,v18,v0.t
                  addi       a4, s7, 209
                  slli       gp, a3, 8
                  vfadd.vv   v25,v8,v9
                  slli       a6, a3, 12
                  vfredmax.vs v8,v20,v11
                  vfcvt.xu.f.v v12,v6
                  vfsgnjx.vv v7,v27,v8,v0.t
                  sra        tp, t3, s10
                  vmfge.vf   v0,v8,ft8
                  vmfeq.vf   v29,v25,ft6
                  or         t2, s2, t6
                  vfmax.vv   v23,v0,v25,v0.t
                  vmfne.vf   v9,v20,fs7,v0.t
                  slti       s7, t1, 265
                  vmfeq.vv   v16,v4,v30,v0.t
                  and        t0, s6, ra
                  slti       a1, a0, 248
                  auipc      ra, 588069
                  remu       a3, s9, a2
                  vfsgnj.vv  v8,v7,v0
                  slli       s5, a1, 24
                  vfredosum.vs v7,v6,v23
                  slt        a4, a4, t0
                  vfredmin.vs v4,v4,v2
                  ori        a4, s4, 375
                  vfsub.vv   v12,v22,v14
                  mul        a5, s2, t6
                  sll        a7, a4, t1
                  vfcvt.x.f.v v20,v7
                  add        a2, gp, s6
                  vfredosum.vs v24,v23,v23,v0.t
                  and        t6, s0, s4
                  addi       gp, t1, 960
                  vfredosum.vs v8,v24,v5,v0.t
                  vfsub.vf   v17,v2,fa4,v0.t
                  slti       t2, s0, -803
                  vfmin.vf   v19,v12,fs2,v0.t
                  sltiu      a6, s8, 142
                  vfclass.v v27,v0
                  remu       tp, t1, tp
                  vfsgnjx.vv v15,v28,v29
                  srai       s4, s9, 30
                  sltiu      a3, t3, -186
                  vfadd.vv   v24,v22,v26,v0.t
                  vfcvt.x.f.v v9,v3
                  divu       a6, s5, s10
                  mulh       s10, s10, a4
                  vmfne.vv   v9,v16,v27,v0.t
                  div        a2, s0, a6
                  vfcvt.f.xu.v v24,v30
                  vfcvt.xu.f.v v23,v27,v0.t
                  srai       t0, s2, 10
                  vmflt.vv   v7,v5,v0,v0.t
                  vmflt.vf   v1,v16,ft1,v0.t
                  vfsgnjx.vf v17,v31,fs1,v0.t
                  mul        sp, gp, s2
                  vmfeq.vf   v24,v10,fa4
                  vfsgnjn.vf v15,v8,ft8
                  andi       s7, a6, 472
                  sub        zero, s6, s8
                  addi       s1, t0, 767
                  vmfgt.vf   v0,v29,fs1
                  addi       t0, t0, -933
                  remu       s0, s10, t2
                  vfredmin.vs v23,v29,v11
                  vfcvt.f.xu.v v2,v26,v0.t
                  vfcvt.f.xu.v v14,v16
                  vmfeq.vv   v25,v24,v20,v0.t
                  vmfle.vf   v25,v28,fs1
                  add        s10, a7, s1
                  srai       s7, a5, 14
                  sll        s4, a2, t5
                  vfrsub.vf  v15,v21,ft11
                  slti       s0, zero, 569
                  and        gp, t4, s4
                  lui        s1, 259535
                  vfmul.vv   v2,v4,v21,v0.t
                  lui        s10, 385165
                  xori       a6, zero, 981
                  vfclass.v v6,v11
                  vfredmin.vs v1,v30,v30,v0.t
                  auipc      t6, 173572
                  vfmax.vv   v10,v25,v8
                  vfredmin.vs v18,v15,v0
                  ori        gp, s8, 164
                  vfredmax.vs v14,v3,v4
                  vfsgnj.vf  v18,v24,fa0
                  mul        s7, ra, a0
                  sub        s3, s8, t1
                  srai       a2, zero, 2
                  vmfgt.vf   v15,v6,fa6
                  vfredsum.vs v17,v9,v3,v0.t
                  sltiu      s4, a4, 226
                  vfmin.vf   v23,v28,fs1,v0.t
                  vfmax.vf   v10,v5,ft11
                  vmfne.vf   v24,v30,ft7,v0.t
                  remu       s8, t1, s11
                  vmfge.vf   v18,v25,fs8
                  vfredosum.vs v25,v21,v4,v0.t
                  vfsgnjn.vf v2,v13,fa6
                  or         t4, a2, s2
                  vmfge.vf   v19,v12,fs9
                  vfadd.vf   v19,v31,fs3,v0.t
                  vfredosum.vs v26,v14,v22,v0.t
                  andi       gp, a4, -935
                  vfcvt.f.xu.v v3,v1
                  slti       a5, a7, 358
                  vfmax.vf   v28,v23,ft3,v0.t
                  vfredmax.vs v15,v24,v31
                  sub        gp, t4, a5
                  ori        s5, t6, -740
                  srli       zero, s0, 21
                  remu       s3, s1, a4
                  vfrsub.vf  v6,v29,fs1,v0.t
                  div        ra, s7, s10
                  vfadd.vf   v27,v14,ft10
                  divu       zero, gp, a3
                  vmfgt.vf   v7,v28,fs1,v0.t
                  andi       s5, s8, -558
                  vfcvt.f.xu.v v17,v12
                  or         a3, t6, t4
                  vfadd.vf   v22,v18,fa6
                  sltiu      ra, a2, 418
                  xori       t3, s8, 394
                  mulh       s1, s7, a6
                  remu       s8, ra, s4
                  lui        a3, 577926
                  vfsgnj.vv  v18,v4,v7,v0.t
                  vfcvt.x.f.v v9,v27
                  vfredosum.vs v0,v13,v9
                  sub        s8, a6, a1
                  slli       s3, s5, 15
                  or         s7, a6, ra
                  vfsub.vf   v21,v16,fs1,v0.t
                  mul        t5, t0, s1
                  vfrsub.vf  v7,v2,fs9
                  vmfeq.vv   v13,v6,v24,v0.t
                  remu       t2, t0, t5
                  slt        zero, a2, a7
                  vmfgt.vf   v0,v17,ft4
                  mulhu      gp, a0, s3
                  slli       t6, s6, 9
                  ori        a2, a5, 115
                  slt        a5, t0, s6
                  auipc      zero, 946373
                  vmfne.vv   v21,v30,v26
                  vmfgt.vf   v29,v16,fa1
                  vfredmin.vs v4,v31,v20,v0.t
                  xor        sp, tp, ra
                  vfsgnjn.vf v23,v12,fa2,v0.t
                  srli       gp, s0, 7
                  sub        zero, s10, s3
                  vfredosum.vs v22,v25,v27
                  vfredmin.vs v22,v24,v28,v0.t
                  slt        s8, s3, a3
                  vfredsum.vs v2,v8,v30,v0.t
                  vmfeq.vv   v12,v19,v3
                  vmfle.vv   v13,v15,v25,v0.t
                  vmfge.vf   v0,v30,fs10
                  divu       t6, t5, s0
                  vfadd.vf   v21,v1,ft9,v0.t
                  and        a1, t6, s2
                  mulhsu     s5, a3, s1
                  vfcvt.f.xu.v v22,v8,v0.t
                  vfcvt.x.f.v v16,v29
                  vfcvt.xu.f.v v28,v2
                  vfredmin.vs v27,v27,v29,v0.t
                  vfsgnjx.vv v4,v9,v6
                  addi       s1, s9, -850
                  vfsgnjn.vf v31,v25,fs1
                  addi       t5, s1, 927
                  srli       s0, t5, 3
                  sll        s7, s2, tp
                  slti       t0, t1, 430
                  sub        s1, s5, a7
                  vmfle.vv   v22,v18,v1
                  vmfne.vf   v23,v30,fs0
                  vfcvt.x.f.v v3,v8
                  srai       ra, t4, 15
                  xori       s5, a2, -951
                  sll        a7, s1, ra
                  mulhsu     s9, ra, a7
                  vfcvt.f.xu.v v29,v15,v0.t
                  sra        a6, t2, s1
                  xori       t5, t3, -17
                  vfsgnjx.vv v13,v26,v1,v0.t
                  vfmax.vv   v14,v0,v10,v0.t
                  vmfle.vv   v13,v10,v28,v0.t
                  vfredmax.vs v17,v12,v15,v0.t
                  divu       a5, ra, a3
                  vfclass.v v13,v14
                  vfadd.vv   v25,v21,v2
                  or         s10, ra, s2
                  sltiu      t1, s5, -492
                  add        sp, a6, t2
                  sll        s1, t3, ra
                  slli       s9, t2, 11
                  vfmax.vv   v17,v19,v5
                  vfcvt.xu.f.v v24,v27,v0.t
                  vfsgnj.vf  v11,v25,fa3,v0.t
                  lui        t4, 345405
                  sltiu      a0, s11, 428
                  vmfne.vf   v11,v23,fs4,v0.t
                  vfadd.vf   v20,v22,fa3
                  or         gp, tp, s3
                  vfcvt.f.x.v v9,v26
                  srai       s3, sp, 4
                  vfrsub.vf  v9,v1,fs3
                  add        ra, a4, ra
                  mulhu      s0, t5, s1
                  slli       s8, t3, 21
                  srai       a1, a3, 7
                  vmfge.vf   v29,v22,ft0
                  vfsgnj.vv  v12,v13,v2,v0.t
                  srl        a7, t4, tp
                  sra        a0, a7, s9
                  addi       t6, t1, -893
                  vfmax.vv   v5,v30,v11,v0.t
                  sltiu      sp, s7, 374
                  slt        tp, a7, a2
                  sltiu      a5, s11, 818
                  sub        a7, s0, t5
                  vfadd.vv   v25,v19,v28,v0.t
                  auipc      a6, 1047292
                  add        s9, a3, t6
                  vmfne.vv   v27,v26,v25,v0.t
                  div        t2, s2, s2
                  sll        a4, tp, t0
                  vfcvt.f.xu.v v16,v25
                  vfadd.vv   v7,v6,v13
                  sub        t5, t1, ra
                  vmfeq.vv   v15,v0,v24,v0.t
                  sltu       s0, s7, a0
                  vfsgnjx.vv v7,v1,v30
                  rem        t0, t1, zero
                  vfmul.vf   v18,v6,fs2
                  andi       a5, s8, -508
                  mulhu      s3, t1, s8
                  vfclass.v v26,v29,v0.t
                  vfadd.vv   v20,v18,v2
                  srl        sp, s0, s6
                  and        a0, zero, s8
                  vfmax.vf   v24,v26,ft4
                  sltiu      tp, t5, -61
                  vfredmin.vs v2,v0,v28
                  div        a2, t2, s3
                  vmfgt.vf   v15,v4,fs4,v0.t
                  srl        s4, a6, t1
                  vfsgnjx.vf v24,v2,ft5
                  mulhsu     t5, t1, s0
                  vmfgt.vf   v26,v1,fs8,v0.t
                  vfsgnjn.vf v0,v14,fa7
                  vfredosum.vs v29,v26,v13,v0.t
                  vfadd.vv   v23,v8,v5
                  and        a3, t1, s8
                  ori        s8, a1, 414
                  vfmin.vv   v16,v25,v25,v0.t
                  mulhsu     t6, s0, s11
                  vfcvt.x.f.v v25,v7,v0.t
                  vfsgnjn.vv v19,v9,v6,v0.t
                  vfredosum.vs v16,v27,v22,v0.t
                  vfredmin.vs v7,v21,v27,v0.t
                  ori        a2, a4, -811
                  vmfle.vv   v8,v10,v30,v0.t
                  vmflt.vv   v22,v8,v6,v0.t
                  slti       ra, t0, 297
                  add        s1, s8, t6
                  srai       s3, ra, 0
                  vfsgnj.vf  v8,v18,ft1,v0.t
                  vmfgt.vf   v20,v29,fa1
                  sra        t6, s1, s11
                  vfredsum.vs v31,v25,v14
                  vfredmax.vs v1,v7,v28
                  vmfne.vv   v3,v28,v21
                  vfrsub.vf  v11,v6,fa7,v0.t
                  add        zero, a3, s8
                  sltu       ra, a6, s1
                  srl        s0, t3, s7
                  vfmax.vv   v3,v15,v18
                  vfadd.vf   v27,v4,fs10
                  div        s8, zero, s1
                  remu       t3, gp, t5
                  vfsgnjx.vf v20,v0,ft10,v0.t
                  or         s7, s10, s1
                  and        t1, s2, t5
                  vfadd.vv   v11,v19,v24
                  mulhsu     s0, sp, a5
                  slt        a7, s5, s7
                  add        a5, s0, s0
                  rem        ra, s0, s6
                  sra        tp, t0, tp
                  vfsub.vv   v6,v17,v10,v0.t
                  addi       s5, s11, 695
                  or         ra, zero, t4
                  div        t6, s8, sp
                  vfsgnj.vv  v31,v28,v10
                  sltiu      s9, a0, 997
                  or         s3, s4, sp
                  vfcvt.f.x.v v27,v23
                  vfsgnjn.vf v27,v29,fs3
                  sltu       gp, a1, a6
                  slti       t0, gp, -377
                  vfredmin.vs v8,v27,v13
                  vmfge.vf   v30,v18,fa3,v0.t
                  ori        ra, t1, 43
                  ori        zero, a4, 219
                  or         s4, ra, s1
                  vfcvt.xu.f.v v8,v6
                  vfsub.vv   v30,v14,v7
                  vmflt.vf   v29,v26,fs6,v0.t
                  vfrsub.vf  v28,v3,ft0
                  vfadd.vv   v2,v23,v16
                  andi       a3, s3, 137
                  vfmul.vf   v25,v11,fs3,v0.t
                  vmfne.vf   v16,v12,ft10
                  vfsgnjx.vv v30,v1,v13,v0.t
                  mulhsu     a6, a2, gp
                  and        a0, a7, t0
                  srli       t3, s5, 18
                  vfredsum.vs v29,v4,v7
                  lui        gp, 1006323
                  vfredsum.vs v14,v25,v4
                  rem        zero, s7, s1
                  andi       s0, s7, -963
                  vmfne.vf   v28,v17,ft2,v0.t
                  vfcvt.f.x.v v18,v21
                  sltiu      t2, t3, -422
                  add        ra, gp, s7
                  vfmul.vv   v7,v16,v5
                  xor        tp, s5, s0
                  mulh       a3, ra, s0
                  mul        a6, s2, s8
                  vfsgnjn.vf v5,v30,fs2,v0.t
                  slli       s5, a1, 11
                  div        a2, a3, a4
                  rem        t1, t5, sp
                  vfmin.vf   v2,v18,fa4
                  srai       a0, s3, 27
                  vfredmax.vs v1,v24,v13,v0.t
                  xori       t0, s3, 387
                  mulhu      s0, a1, ra
                  vfcvt.xu.f.v v11,v22
                  vfclass.v v19,v26,v0.t
                  addi       s3, a3, 636
                  vmfge.vf   v16,v6,fs8,v0.t
                  vfcvt.f.x.v v25,v14
                  vfredosum.vs v27,v7,v8
                  vfmul.vf   v1,v0,fa3,v0.t
                  vfcvt.x.f.v v22,v13,v0.t
                  vfsgnjn.vv v0,v0,v22
                  slti       s1, s2, 2
                  vfmul.vv   v0,v30,v26
                  mulhu      s1, a2, ra
                  rem        s0, s4, s5
                  vfsgnj.vv  v17,v1,v17
                  lui        t5, 561031
                  vfredsum.vs v17,v29,v4,v0.t
                  vmflt.vv   v23,v12,v31,v0.t
                  xor        s1, s4, s7
                  vfredsum.vs v4,v18,v0
                  divu       ra, a1, sp
                  vfredsum.vs v11,v29,v4,v0.t
                  sra        gp, t1, s2
                  mulhsu     s9, a1, t5
                  vfredosum.vs v12,v12,v1
                  add        a3, gp, t2
                  lui        a2, 436468
                  vfsgnjx.vf v25,v5,fa2
                  srl        s7, sp, t0
                  addi       t0, s8, 432
                  mul        s0, t4, tp
                  or         s10, sp, a4
                  vfredsum.vs v24,v11,v23,v0.t
                  slli       s1, a7, 9
                  vfcvt.x.f.v v11,v1,v0.t
                  vfmul.vf   v3,v26,fs11,v0.t
                  slt        a4, s9, a4
                  vfredosum.vs v26,v9,v8
                  vfrsub.vf  v0,v8,fa7
                  vmfeq.vv   v30,v24,v9
                  srli       s3, a0, 8
                  xor        s7, s1, t0
                  vfcvt.xu.f.v v9,v30
                  vfredmin.vs v30,v23,v2
                  vmfge.vf   v10,v23,fs5,v0.t
                  vfsgnj.vv  v15,v11,v23,v0.t
                  vfcvt.xu.f.v v4,v29
                  vfrsub.vf  v24,v2,ft11,v0.t
                  vmflt.vv   v1,v4,v29,v0.t
                  xor        s8, a1, s10
                  srai       s3, t4, 1
                  sra        s4, s5, a0
                  add        a2, s0, t2
                  srli       a2, s0, 19
                  mulhu      a3, s11, t6
                  sll        s5, s8, t2
                  div        a6, s4, a5
                  vfredmax.vs v21,v10,v7
                  vfredsum.vs v31,v7,v18
                  andi       s5, t3, 293
                  or         s7, t5, s9
                  div        t4, s3, t2
                  xori       a5, s8, 145
                  lui        tp, 366522
                  xor        a1, a3, a7
                  sltiu      s5, a6, 855
                  mulhsu     s5, t1, s7
                  and        t4, sp, a1
                  vfredosum.vs v24,v16,v25,v0.t
                  sub        a5, t6, t1
                  vmfle.vf   v7,v17,ft5,v0.t
                  andi       t0, s10, 596
                  sub        s0, s8, t2
                  xori       s4, s8, 45
                  auipc      t3, 773014
                  vfsgnjn.vf v9,v31,ft7
                  mulhsu     gp, a2, s1
                  srli       t5, s8, 15
                  divu       s0, s5, s9
                  xor        t1, t5, s1
                  andi       t4, a6, -563
                  or         a3, s8, s8
                  vmfle.vv   v2,v5,v29
                  sub        a1, s2, s5
                  mulhu      ra, a1, gp
                  sltu       a0, tp, t0
                  vfsgnjn.vf v30,v23,fs9,v0.t
                  srli       t0, t2, 27
                  lui        a3, 1009722
                  sltu       sp, t0, a4
                  andi       a2, s5, 580
                  vmfgt.vf   v11,v7,ft0,v0.t
                  mulhu      ra, a5, ra
                  lui        sp, 566144
                  vfsub.vf   v9,v8,fs3,v0.t
                  sltiu      a3, t3, 524
                  vfmin.vv   v31,v8,v14,v0.t
                  sub        sp, s8, s11
                  divu       a3, t0, ra
                  vfclass.v v15,v19
                  mulhu      a3, t6, a4
                  vfmul.vv   v27,v20,v5
                  vfmin.vv   v3,v9,v27,v0.t
                  mul        a1, s8, a6
                  srli       a1, s0, 28
                  auipc      a4, 149015
                  vfcvt.f.xu.v v17,v23
                  vfsgnj.vf  v31,v27,fa4
                  sltu       s3, s0, s10
                  slli       t4, ra, 27
                  srai       a7, a2, 25
                  auipc      a6, 516814
                  mulhsu     s10, a4, s3
                  slli       gp, zero, 20
                  slti       a1, a5, -897
                  andi       a4, a0, -991
                  vmfge.vf   v30,v12,fs5,v0.t
                  mulhu      s9, a4, t5
                  or         zero, a4, zero
                  auipc      a7, 63838
                  vfmax.vv   v6,v16,v11
                  mulhu      a5, ra, s2
                  slt        s7, a2, s2
                  sub        t6, s2, t1
                  mul        t2, s4, s11
                  andi       a6, t5, -153
                  mulhu      a0, a3, t0
                  srli       s0, s10, 5
                  auipc      a7, 154836
                  vfcvt.f.x.v v9,v27,v0.t
                  mul        a0, a4, tp
                  slti       s0, s5, -19
                  vfredsum.vs v10,v5,v11
                  slti       t3, gp, 837
                  sltiu      t4, s10, -308
                  vfsgnj.vv  v5,v1,v5
                  add        t0, t3, s1
                  vmfle.vv   v12,v9,v14,v0.t
                  vfsgnjn.vf v21,v10,fs7
                  srai       t5, t0, 29
                  divu       a1, s6, s10
                  vmfeq.vv   v30,v12,v0
                  div        a5, tp, t4
                  sub        s9, t5, s8
                  vmfge.vf   v14,v0,fs5,v0.t
                  sra        t3, s4, t1
                  vfmul.vv   v2,v15,v3
                  divu       s10, a1, a3
                  vmfle.vf   v5,v24,ft8,v0.t
                  srli       zero, t3, 7
                  vfredmin.vs v15,v20,v20,v0.t
                  srai       s0, s11, 10
                  lui        s4, 338096
                  vfadd.vv   v23,v30,v13,v0.t
                  sub        a2, s5, a3
                  xor        t2, t4, t6
                  remu       zero, zero, s1
                  vfcvt.f.x.v v29,v27,v0.t
                  mulhu      a6, t3, t6
                  vmfgt.vf   v20,v29,ft4,v0.t
                  slli       s4, s6, 8
                  vfcvt.f.xu.v v24,v19,v0.t
                  vfredsum.vs v27,v5,v12,v0.t
                  sltiu      s7, s11, 1018
                  ori        a6, s0, 392
                  vfcvt.x.f.v v30,v24
                  vmfle.vf   v14,v12,fs3
                  vfsub.vv   v20,v9,v29
                  vfcvt.xu.f.v v26,v11
                  rem        gp, s10, s8
                  mulhsu     a7, a1, a2
                  andi       t5, t5, -439
                  sltiu      t5, t0, -533
                  or         s1, gp, s4
                  vfcvt.f.xu.v v3,v31,v0.t
                  vfcvt.f.x.v v26,v13,v0.t
                  xori       a7, s5, -744
                  and        ra, t2, a2
                  vfadd.vf   v4,v26,fs11,v0.t
                  divu       s3, s11, s10
                  mul        t1, a2, s2
                  addi       a2, s5, -189
                  mulhu      t3, s9, s3
                  mulhu      a7, s7, a0
                  vmfgt.vf   v26,v22,ft10,v0.t
                  srl        s4, a0, a4
                  vfsgnj.vf  v11,v29,fs0,v0.t
                  vfmul.vf   v21,v17,fs11,v0.t
                  vfcvt.x.f.v v30,v10,v0.t
                  auipc      s7, 745311
                  vmfgt.vf   v25,v6,fa0
                  vfcvt.xu.f.v v5,v8,v0.t
                  vfredosum.vs v12,v14,v3,v0.t
                  srli       s8, s9, 17
                  or         t2, s3, t2
                  vfsgnjx.vv v21,v29,v15
                  slli       a2, t1, 13
                  vmfge.vf   v20,v26,fs9,v0.t
                  vfredsum.vs v3,v1,v21
                  sltiu      s8, t5, -568
                  srli       t2, s7, 17
                  mul        t1, s10, s3
                  divu       s0, t4, s8
                  vmflt.vf   v21,v30,fa3,v0.t
                  mulhsu     t4, s4, t1
                  sra        t0, t3, s7
                  xori       t6, s5, -573
                  vmfne.vf   v11,v3,fa0,v0.t
                  vfmul.vf   v30,v7,ft10
                  vfcvt.f.x.v v29,v21,v0.t
                  vfmax.vv   v11,v20,v31,v0.t
                  xori       s5, a6, -512
                  slti       a4, t6, 26
                  srai       s9, a1, 22
                  sltiu      s1, s1, -506
                  or         s0, t4, s5
                  xor        s10, tp, ra
                  vmfle.vv   v13,v16,v27,v0.t
                  slti       sp, ra, 28
                  xor        s8, t0, s1
                  vmfgt.vf   v7,v18,fa1
                  div        s5, a6, sp
                  slti       t2, s0, -71
                  vmfge.vf   v30,v27,fa6
                  vfadd.vv   v5,v31,v23
                  ori        ra, t6, -74
                  mulh       t5, s9, t1
                  div        gp, s1, t5
                  sltu       a2, a4, t0
                  vmfeq.vv   v17,v13,v31,v0.t
                  vmfgt.vf   v17,v9,fs10,v0.t
                  vfmax.vv   v5,v14,v16,v0.t
                  divu       s0, gp, t2
                  vfmax.vv   v19,v21,v0
                  vmfeq.vv   v6,v25,v20
                  slt        a0, a1, t3
                  addi       a7, sp, -725
                  vfmul.vv   v10,v25,v23,v0.t
                  mul        a4, sp, a3
                  vfsgnjx.vv v2,v23,v1
                  and        a2, t6, t4
                  vfredosum.vs v2,v7,v25
                  sub        s5, a6, t5
                  vfmin.vf   v0,v1,fs1
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
                  1: addi x18, x18, -124
                  sw  x1, 4(x18)
                  sw  x2, 8(x18)
                  sw  x3, 12(x18)
                  sw  x4, 16(x18)
                  sw  x5, 20(x18)
                  sw  x6, 24(x18)
                  sw  x7, 28(x18)
                  sw  x8, 32(x18)
                  sw  x9, 36(x18)
                  sw  x10, 40(x18)
                  sw  x11, 44(x18)
                  sw  x12, 48(x18)
                  sw  x13, 52(x18)
                  sw  x14, 56(x18)
                  sw  x15, 60(x18)
                  sw  x16, 64(x18)
                  sw  x17, 68(x18)
                  sw  x18, 72(x18)
                  sw  x19, 76(x18)
                  sw  x20, 80(x18)
                  sw  x21, 84(x18)
                  sw  x22, 88(x18)
                  sw  x23, 92(x18)
                  sw  x24, 96(x18)
                  sw  x25, 100(x18)
                  sw  x26, 104(x18)
                  sw  x27, 108(x18)
                  sw  x28, 112(x18)
                  sw  x29, 116(x18)
                  sw  x30, 120(x18)
                  sw  x31, 124(x18)
                  csrr x25, 0x341 # MEPC
                  csrr x25, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x25, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x25, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x25, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x25, x10, ecall_handler
                  li x10, 0x1
                  beq x25, x10, instr_fault_handler
                  li x10, 0x5
                  beq x25, x10, load_fault_handler
                  li x10, 0x7
                  beq x25, x10, store_fault_handler
                  li x10, 0xc
                  beq x25, x10, pt_fault_handler
                  li x10, 0xd
                  beq x25, x10, pt_fault_handler
                  li x10, 0xf
                  beq x25, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x25, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x27, test_done
                  jalr x1, x27, 0

ecall_handler:    
                  la x25, _start
                  sw x0, 0(x25)
                  sw x1, 4(x25)
                  sw x2, 8(x25)
                  sw x3, 12(x25)
                  sw x4, 16(x25)
                  sw x5, 20(x25)
                  sw x6, 24(x25)
                  sw x7, 28(x25)
                  sw x8, 32(x25)
                  sw x9, 36(x25)
                  sw x10, 40(x25)
                  sw x11, 44(x25)
                  sw x12, 48(x25)
                  sw x13, 52(x25)
                  sw x14, 56(x25)
                  sw x15, 60(x25)
                  sw x16, 64(x25)
                  sw x17, 68(x25)
                  sw x18, 72(x25)
                  sw x19, 76(x25)
                  sw x20, 80(x25)
                  sw x21, 84(x25)
                  sw x22, 88(x25)
                  sw x23, 92(x25)
                  sw x24, 96(x25)
                  sw x25, 100(x25)
                  sw x26, 104(x25)
                  sw x27, 108(x25)
                  sw x28, 112(x25)
                  sw x29, 116(x25)
                  sw x30, 120(x25)
                  sw x31, 124(x25)
                  la x27, write_tohost
                  jalr x0, x27, 0

instr_fault_handler:
                  li x25, 0
                  csrw 0x340, x25
                  li x26, 0
                  0: csrr x25, 0x340
                  mv x27, x25
                  li x27, 0
                  beq x25, x27, 1f
                  1: csrr x10, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x25, 0x340
                  slli x25, x25, 30
                  srli x25, x25, 30
                  sub x27, x30, x25
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x30, x5, x27
                  slli x25, x25, 3
                  add x27, x27, x25
                  srl x30, x30, x27
                  slli x27, x30, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x25, 1
                  beq x27, x25, 21f
                  li x25, 2
                  beq x27, x25, 25f
                  li x25, 3
                  beq x27, x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: csrr x25, 0x340
                  mv x26, x10
                  addi x25, x25, 1
                  csrw 0x340, x25
                  li x10, 1
                  ble x10, x25, 19f
                  j 0b
                  19: la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: csrr x25, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x25, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x26, x27, 18b
                  23: bleu x10, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 24f
                  la x25, test_done
                  jalr x0, x25, 0
                  24: j 29f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x27, x10, 2
                  srli x27, x27, 2
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 26f
                  la x25, test_done
                  jalr x0, x25, 0
                  26: j 29f
                  27: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x27, x10, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 29f
                  la x25, test_done
                  jalr x0, x25, 0
                  28: j 29f
                  29: ori x30, x30, 4
                  csrr x25, 0x340
                  li x27, 30
                  sll x25, x25, x27
                  srl x25, x25, x27
                  slli x27, x25, 3
                  sll x30, x30, x27
                  or x5, x5, x30
                  csrr x25, 0x340
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x27, 1
                  beq x25, x27, 31f
                  li x27, 2
                  beq x25, x27, 32f
                  li x27, 3
                  beq x25, x27, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
                  mret

load_fault_handler:
                  li x25, 0
                  csrw 0x340, x25
                  li x26, 0
                  0: csrr x25, 0x340
                  mv x27, x25
                  li x27, 0
                  beq x25, x27, 1f
                  1: csrr x10, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x25, 0x340
                  slli x25, x25, 30
                  srli x25, x25, 30
                  sub x27, x30, x25
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x30, x5, x27
                  slli x25, x25, 3
                  add x27, x27, x25
                  srl x30, x30, x27
                  slli x27, x30, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x25, 1
                  beq x27, x25, 21f
                  li x25, 2
                  beq x27, x25, 25f
                  li x25, 3
                  beq x27, x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: csrr x25, 0x340
                  mv x26, x10
                  addi x25, x25, 1
                  csrw 0x340, x25
                  li x10, 1
                  ble x10, x25, 19f
                  j 0b
                  19: la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: csrr x25, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x25, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x26, x27, 18b
                  23: bleu x10, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 24f
                  la x25, test_done
                  jalr x0, x25, 0
                  24: j 29f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x27, x10, 2
                  srli x27, x27, 2
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 26f
                  la x25, test_done
                  jalr x0, x25, 0
                  26: j 29f
                  27: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x27, x10, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 29f
                  la x25, test_done
                  jalr x0, x25, 0
                  28: j 29f
                  29: ori x30, x30, 1
                  csrr x25, 0x340
                  li x27, 30
                  sll x25, x25, x27
                  srl x25, x25, x27
                  slli x27, x25, 3
                  sll x30, x30, x27
                  or x5, x5, x30
                  csrr x25, 0x340
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x27, 1
                  beq x25, x27, 31f
                  li x27, 2
                  beq x25, x27, 32f
                  li x27, 3
                  beq x25, x27, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
                  mret

store_fault_handler:
                  li x25, 0
                  csrw 0x340, x25
                  li x26, 0
                  0: csrr x25, 0x340
                  mv x27, x25
                  li x27, 0
                  beq x25, x27, 1f
                  1: csrr x10, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x25, 0x340
                  slli x25, x25, 30
                  srli x25, x25, 30
                  sub x27, x30, x25
                  addi x27, x27, -1
                  slli x27, x27, 3
                  sll x30, x5, x27
                  slli x25, x25, 3
                  add x27, x27, x25
                  srl x30, x30, x27
                  slli x27, x30, 27
                  srli x27, x27, 30
                  beqz x27, 20f
                  li x25, 1
                  beq x27, x25, 21f
                  li x25, 2
                  beq x27, x25, 25f
                  li x25, 3
                  beq x27, x25, 27f
                  la x25, test_done
                  jalr x0, x25, 0
                  18: csrr x25, 0x340
                  mv x26, x10
                  addi x25, x25, 1
                  csrw 0x340, x25
                  li x10, 1
                  ble x10, x25, 19f
                  j 0b
                  19: la x25, test_done
                  jalr x0, x25, 0
                  20: j 18b
                  21: csrr x25, 0x340
                  csrr x27, 0x343
                  srli x27, x27, 2
                  bnez x25, 22f
                  bltz x27, 18b
                  j 23f
                  22: bgtu x26, x27, 18b
                  23: bleu x10, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 24f
                  la x25, test_done
                  jalr x0, x25, 0
                  24: j 29f
                  25: csrr x25, 0x343
                  srli x25, x25, 2
                  slli x27, x10, 2
                  srli x27, x27, 2
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 26f
                  la x25, test_done
                  jalr x0, x25, 0
                  26: j 29f
                  27: csrr x25, 0x343
                  srli x25, x25, 2
                  srli x25, x25, 0
                  slli x25, x25, 0
                  slli x27, x10, 2
                  srli x27, x27, 2
                  srli x27, x27, 0
                  slli x27, x27, 0
                  bne x25, x27, 18b
                  andi x27, x30, 128
                  beqz x27, 29f
                  la x25, test_done
                  jalr x0, x25, 0
                  28: j 29f
                  29: ori x30, x30, 3
                  csrr x25, 0x340
                  li x27, 30
                  sll x25, x25, x27
                  srl x25, x25, x27
                  slli x27, x25, 3
                  sll x30, x30, x27
                  or x5, x5, x30
                  csrr x25, 0x340
                  srli x25, x25, 2
                  beqz x25, 30f
                  li x27, 1
                  beq x25, x27, 31f
                  li x27, 2
                  beq x25, x27, 32f
                  li x27, 3
                  beq x25, x27, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
                  34: nop
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
                  mret

ebreak_handler:   
                  csrr  x25, 0x341
                  addi  x25, x25, 4
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
                  mret

illegal_instr_handler:
                  csrr  x25, 0x341
                  addi  x25, x25, 4
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x25, 0x300 # MSTATUS;
                  csrr  x25, 0x304 # MIE;
                  csrr  x25, 0x344 # MIP;
                  csrrc x25, 0x344, x25 # MIP;
                  lw  x1, 4(x18)
                  lw  x2, 8(x18)
                  lw  x3, 12(x18)
                  lw  x4, 16(x18)
                  lw  x5, 20(x18)
                  lw  x6, 24(x18)
                  lw  x7, 28(x18)
                  lw  x8, 32(x18)
                  lw  x9, 36(x18)
                  lw  x10, 40(x18)
                  lw  x11, 44(x18)
                  lw  x12, 48(x18)
                  lw  x13, 52(x18)
                  lw  x14, 56(x18)
                  lw  x15, 60(x18)
                  lw  x16, 64(x18)
                  lw  x17, 68(x18)
                  lw  x18, 72(x18)
                  lw  x19, 76(x18)
                  lw  x20, 80(x18)
                  lw  x21, 84(x18)
                  lw  x22, 88(x18)
                  lw  x23, 92(x18)
                  lw  x24, 96(x18)
                  lw  x25, 100(x18)
                  lw  x26, 104(x18)
                  lw  x27, 108(x18)
                  lw  x28, 112(x18)
                  lw  x29, 116(x18)
                  lw  x30, 120(x18)
                  lw  x31, 124(x18)
                  addi x18, x18, 124
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
