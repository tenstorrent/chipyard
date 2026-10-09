.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x16, 0x40201123
                  csrw 0x301, x16
                  csrr x31, 0x301
kernel_sp:        
                  la x15, kernel_stack_end

trap_vec_init:    
                  la x16, mtvec_handler
                  ori x16, x16, 1

mepc_setup:       
                  la x16, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0xad2fea34
                  li x1, 0x9c7d0176
                  li x2, 0x390ada29
                  li x3, 0x80000000
                  li x4, 0xf5bdd275
                  li x5, 0xe82d68f5
                  li x6, 0xf1e5420a
                  li x7, 0x80000000
                  li x8, 0xa6ec268e
                  li x9, 0xd63f6842
                  li x10, 0xffd78051
                  li x11, 0x80000000
                  li x12, 0x80000000
                  li x13, 0x70dcfad9
                  li x14, 0xfa7a8bcd
                  li x16, 0x1247e339
                  li x17, 0xf89696a6
                  li x18, 0x80000000
                  li x20, 0x4022f904
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0x200e1022
                  li x25, 0xf9ae0129
                  li x26, 0xf46da99f
                  li x27, 0x60111d27
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0xf703a30e
                  li x31, 0xf2e5d938
                  la x19, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x27, 8
                  vsetvli x16, x27, e16, m1
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
                  li x16, 0x5f013de6
                  vslide1up.vx v0, v1, x16
                  vmv.v.v v0, v0
                  li x16, 0x6c8d5c90
                  vslide1up.vx v0, v1, x16
                  vmv.v.v v0, v0
                  li x16, 0xf61fbffd
                  vslide1up.vx v0, v1, x16
                  vmv.v.v v0, v0
                  li x16, 0x5a183903
                  vslide1up.vx v0, v1, x16
                  li x16, 0xef01ee2b
                  vslide1up.vx v1, v0, x16
                  vmv.v.v v0, v1
                  li x16, 0xec83beaf
                  vslide1up.vx v1, v0, x16
                  vmv.v.v v0, v1
                  li x16, 0x780631fa
                  vslide1up.vx v1, v0, x16
                  vmv.v.v v0, v1
                  li x16, 0x7b9a9a8f
                  vslide1up.vx v1, v0, x16
                  li x16, 0xa6d99513
                  vslide1up.vx v2, v0, x16
                  vmv.v.v v0, v2
                  li x16, 0x6e90a29e
                  vslide1up.vx v2, v0, x16
                  vmv.v.v v0, v2
                  li x16, 0xfb907de9
                  vslide1up.vx v2, v0, x16
                  vmv.v.v v0, v2
                  li x16, 0x863b19a0
                  vslide1up.vx v2, v0, x16
                  li x16, 0x866bc31e
                  vslide1up.vx v3, v0, x16
                  vmv.v.v v0, v3
                  li x16, 0xa40142ea
                  vslide1up.vx v3, v0, x16
                  vmv.v.v v0, v3
                  li x16, 0xaf0f913f
                  vslide1up.vx v3, v0, x16
                  vmv.v.v v0, v3
                  li x16, 0xd91f2643
                  vslide1up.vx v3, v0, x16
                  li x16, 0xafc9af5f
                  vslide1up.vx v4, v0, x16
                  vmv.v.v v0, v4
                  li x16, 0xf9bafc9a
                  vslide1up.vx v4, v0, x16
                  vmv.v.v v0, v4
                  li x16, 0x397845d
                  vslide1up.vx v4, v0, x16
                  vmv.v.v v0, v4
                  li x16, 0xf58c3e5a
                  vslide1up.vx v4, v0, x16
                  li x16, 0x699a49dc
                  vslide1up.vx v5, v0, x16
                  vmv.v.v v0, v5
                  li x16, 0x5efbe2cf
                  vslide1up.vx v5, v0, x16
                  vmv.v.v v0, v5
                  li x16, 0x6258a1de
                  vslide1up.vx v5, v0, x16
                  vmv.v.v v0, v5
                  li x16, 0x1b2df342
                  vslide1up.vx v5, v0, x16
                  li x16, 0x65e99b96
                  vslide1up.vx v6, v0, x16
                  vmv.v.v v0, v6
                  li x16, 0x439e6100
                  vslide1up.vx v6, v0, x16
                  vmv.v.v v0, v6
                  li x16, 0x8a3900b7
                  vslide1up.vx v6, v0, x16
                  vmv.v.v v0, v6
                  li x16, 0x546c3d47
                  vslide1up.vx v6, v0, x16
                  li x16, 0xa1e632e9
                  vslide1up.vx v7, v0, x16
                  vmv.v.v v0, v7
                  li x16, 0x12caaf72
                  vslide1up.vx v7, v0, x16
                  vmv.v.v v0, v7
                  li x16, 0x296cdb5a
                  vslide1up.vx v7, v0, x16
                  vmv.v.v v0, v7
                  li x16, 0xc5a44384
                  vslide1up.vx v7, v0, x16
                  li x16, 0x231188f
                  vslide1up.vx v8, v0, x16
                  vmv.v.v v0, v8
                  li x16, 0x4642dafd
                  vslide1up.vx v8, v0, x16
                  vmv.v.v v0, v8
                  li x16, 0xbbdc4e0a
                  vslide1up.vx v8, v0, x16
                  vmv.v.v v0, v8
                  li x16, 0xcbce0f45
                  vslide1up.vx v8, v0, x16
                  li x16, 0x51b3459
                  vslide1up.vx v9, v0, x16
                  vmv.v.v v0, v9
                  li x16, 0xc74690c4
                  vslide1up.vx v9, v0, x16
                  vmv.v.v v0, v9
                  li x16, 0xe253cd7a
                  vslide1up.vx v9, v0, x16
                  vmv.v.v v0, v9
                  li x16, 0xdf9d27ba
                  vslide1up.vx v9, v0, x16
                  li x16, 0xe26f2789
                  vslide1up.vx v10, v0, x16
                  vmv.v.v v0, v10
                  li x16, 0x3bb49ad4
                  vslide1up.vx v10, v0, x16
                  vmv.v.v v0, v10
                  li x16, 0x82bc8a89
                  vslide1up.vx v10, v0, x16
                  vmv.v.v v0, v10
                  li x16, 0x50e9706e
                  vslide1up.vx v10, v0, x16
                  li x16, 0x445428d5
                  vslide1up.vx v11, v0, x16
                  vmv.v.v v0, v11
                  li x16, 0x9abcf59d
                  vslide1up.vx v11, v0, x16
                  vmv.v.v v0, v11
                  li x16, 0x7b3c131
                  vslide1up.vx v11, v0, x16
                  vmv.v.v v0, v11
                  li x16, 0xce9079b5
                  vslide1up.vx v11, v0, x16
                  li x16, 0x32fea5eb
                  vslide1up.vx v12, v0, x16
                  vmv.v.v v0, v12
                  li x16, 0xf1bf9b0a
                  vslide1up.vx v12, v0, x16
                  vmv.v.v v0, v12
                  li x16, 0xb406ce93
                  vslide1up.vx v12, v0, x16
                  vmv.v.v v0, v12
                  li x16, 0xa5c2e8ad
                  vslide1up.vx v12, v0, x16
                  li x16, 0x1d27b4d1
                  vslide1up.vx v13, v0, x16
                  vmv.v.v v0, v13
                  li x16, 0x494e0d9f
                  vslide1up.vx v13, v0, x16
                  vmv.v.v v0, v13
                  li x16, 0xa4e1dbf5
                  vslide1up.vx v13, v0, x16
                  vmv.v.v v0, v13
                  li x16, 0xc11523e2
                  vslide1up.vx v13, v0, x16
                  li x16, 0x8975bf72
                  vslide1up.vx v14, v0, x16
                  vmv.v.v v0, v14
                  li x16, 0x747d8cc3
                  vslide1up.vx v14, v0, x16
                  vmv.v.v v0, v14
                  li x16, 0x82ce0933
                  vslide1up.vx v14, v0, x16
                  vmv.v.v v0, v14
                  li x16, 0xebe61b85
                  vslide1up.vx v14, v0, x16
                  li x16, 0x2c54a1f0
                  vslide1up.vx v15, v0, x16
                  vmv.v.v v0, v15
                  li x16, 0xec95b133
                  vslide1up.vx v15, v0, x16
                  vmv.v.v v0, v15
                  li x16, 0xe04f9de4
                  vslide1up.vx v15, v0, x16
                  vmv.v.v v0, v15
                  li x16, 0xd6bd764b
                  vslide1up.vx v15, v0, x16
                  li x16, 0x321e7a2f
                  vslide1up.vx v16, v0, x16
                  vmv.v.v v0, v16
                  li x16, 0x497f87b7
                  vslide1up.vx v16, v0, x16
                  vmv.v.v v0, v16
                  li x16, 0x542a9924
                  vslide1up.vx v16, v0, x16
                  vmv.v.v v0, v16
                  li x16, 0xd28532f2
                  vslide1up.vx v16, v0, x16
                  li x16, 0x8f71f4ee
                  vslide1up.vx v17, v0, x16
                  vmv.v.v v0, v17
                  li x16, 0x4ba3a5b3
                  vslide1up.vx v17, v0, x16
                  vmv.v.v v0, v17
                  li x16, 0x6d6ccd12
                  vslide1up.vx v17, v0, x16
                  vmv.v.v v0, v17
                  li x16, 0xfe9445ce
                  vslide1up.vx v17, v0, x16
                  li x16, 0xde83e0b9
                  vslide1up.vx v18, v0, x16
                  vmv.v.v v0, v18
                  li x16, 0xa8f2b534
                  vslide1up.vx v18, v0, x16
                  vmv.v.v v0, v18
                  li x16, 0xf4bd65b2
                  vslide1up.vx v18, v0, x16
                  vmv.v.v v0, v18
                  li x16, 0xf85f3f57
                  vslide1up.vx v18, v0, x16
                  li x16, 0xf47ec6f2
                  vslide1up.vx v19, v0, x16
                  vmv.v.v v0, v19
                  li x16, 0x61af8b99
                  vslide1up.vx v19, v0, x16
                  vmv.v.v v0, v19
                  li x16, 0x43f8d2fc
                  vslide1up.vx v19, v0, x16
                  vmv.v.v v0, v19
                  li x16, 0x91907c91
                  vslide1up.vx v19, v0, x16
                  li x16, 0x896f2fe3
                  vslide1up.vx v20, v0, x16
                  vmv.v.v v0, v20
                  li x16, 0x653049c7
                  vslide1up.vx v20, v0, x16
                  vmv.v.v v0, v20
                  li x16, 0x946943a1
                  vslide1up.vx v20, v0, x16
                  vmv.v.v v0, v20
                  li x16, 0xabf83a41
                  vslide1up.vx v20, v0, x16
                  li x16, 0x5f306b55
                  vslide1up.vx v21, v0, x16
                  vmv.v.v v0, v21
                  li x16, 0xc8b6bbde
                  vslide1up.vx v21, v0, x16
                  vmv.v.v v0, v21
                  li x16, 0xcb24cf58
                  vslide1up.vx v21, v0, x16
                  vmv.v.v v0, v21
                  li x16, 0x1d0fa49e
                  vslide1up.vx v21, v0, x16
                  li x16, 0x8358a9e1
                  vslide1up.vx v22, v0, x16
                  vmv.v.v v0, v22
                  li x16, 0xd0c03fad
                  vslide1up.vx v22, v0, x16
                  vmv.v.v v0, v22
                  li x16, 0x6c0a2465
                  vslide1up.vx v22, v0, x16
                  vmv.v.v v0, v22
                  li x16, 0x1b1ae8a2
                  vslide1up.vx v22, v0, x16
                  li x16, 0x9b8ff773
                  vslide1up.vx v23, v0, x16
                  vmv.v.v v0, v23
                  li x16, 0x9d5e3ded
                  vslide1up.vx v23, v0, x16
                  vmv.v.v v0, v23
                  li x16, 0x6fdab060
                  vslide1up.vx v23, v0, x16
                  vmv.v.v v0, v23
                  li x16, 0x1fdbc5f1
                  vslide1up.vx v23, v0, x16
                  li x16, 0x7cf967c9
                  vslide1up.vx v24, v0, x16
                  vmv.v.v v0, v24
                  li x16, 0x8c47066a
                  vslide1up.vx v24, v0, x16
                  vmv.v.v v0, v24
                  li x16, 0x794dfbab
                  vslide1up.vx v24, v0, x16
                  vmv.v.v v0, v24
                  li x16, 0xe390386e
                  vslide1up.vx v24, v0, x16
                  li x16, 0x4115589a
                  vslide1up.vx v25, v0, x16
                  vmv.v.v v0, v25
                  li x16, 0xe4c26a75
                  vslide1up.vx v25, v0, x16
                  vmv.v.v v0, v25
                  li x16, 0x4a509f6a
                  vslide1up.vx v25, v0, x16
                  vmv.v.v v0, v25
                  li x16, 0x3afdbbcb
                  vslide1up.vx v25, v0, x16
                  li x16, 0x6f2e0791
                  vslide1up.vx v26, v0, x16
                  vmv.v.v v0, v26
                  li x16, 0x5a065135
                  vslide1up.vx v26, v0, x16
                  vmv.v.v v0, v26
                  li x16, 0x8dea21d1
                  vslide1up.vx v26, v0, x16
                  vmv.v.v v0, v26
                  li x16, 0x51ecd569
                  vslide1up.vx v26, v0, x16
                  li x16, 0x2b798fca
                  vslide1up.vx v27, v0, x16
                  vmv.v.v v0, v27
                  li x16, 0x2e6f5afa
                  vslide1up.vx v27, v0, x16
                  vmv.v.v v0, v27
                  li x16, 0xb7be209b
                  vslide1up.vx v27, v0, x16
                  vmv.v.v v0, v27
                  li x16, 0x1fbfa719
                  vslide1up.vx v27, v0, x16
                  li x16, 0xb777be32
                  vslide1up.vx v28, v0, x16
                  vmv.v.v v0, v28
                  li x16, 0xdc8526ac
                  vslide1up.vx v28, v0, x16
                  vmv.v.v v0, v28
                  li x16, 0x73b30e8b
                  vslide1up.vx v28, v0, x16
                  vmv.v.v v0, v28
                  li x16, 0xe5093dda
                  vslide1up.vx v28, v0, x16
                  li x16, 0x507449a7
                  vslide1up.vx v29, v0, x16
                  vmv.v.v v0, v29
                  li x16, 0x9bcac229
                  vslide1up.vx v29, v0, x16
                  vmv.v.v v0, v29
                  li x16, 0x57908357
                  vslide1up.vx v29, v0, x16
                  vmv.v.v v0, v29
                  li x16, 0x5c9bfdf2
                  vslide1up.vx v29, v0, x16
                  li x16, 0x29850fad
                  vslide1up.vx v30, v0, x16
                  vmv.v.v v0, v30
                  li x16, 0xc85fe3b5
                  vslide1up.vx v30, v0, x16
                  vmv.v.v v0, v30
                  li x16, 0x3c0a0ed7
                  vslide1up.vx v30, v0, x16
                  vmv.v.v v0, v30
                  li x16, 0xcc79396f
                  vslide1up.vx v30, v0, x16
                  li x16, 0x87349411
                  vslide1up.vx v31, v0, x16
                  vmv.v.v v0, v31
                  li x16, 0xe1e135c6
                  vslide1up.vx v31, v0, x16
                  vmv.v.v v0, v31
                  li x16, 0x2c207687
                  vslide1up.vx v31, v0, x16
                  vmv.v.v v0, v31
                  li x16, 0x5d8ad3e7
                  vslide1up.vx v31, v0, x16
li x27, 8
                  vsetvli x16, x27, e16, m1
main:             sltiu      a6, s6, -470
                  divu       s0, a2, a7
                  lui        s9, 237757
                  divu       a4, s5, t0
                  mulhsu     s6, t5, zero
                  rem        a1, s7, s4
                  or         t4, s6, tp
                  mulhsu     s8, s9, s4
                  andi       s11, a2, -376
                  add        s8, t2, s11
                  sll        t1, a4, s9
                  remu       s7, t0, ra
                  srai       s8, a2, 0
                  slt        a6, t3, tp
                  divu       gp, t5, a3
                  xori       s9, a4, -592
                  srl        s10, s2, s2
                  srai       s4, s5, 25
                  xor        s10, s8, t6
                  remu       t0, s2, a0
                  srl        t3, a7, ra
                  mul        s0, s7, zero
                  addi       t2, a0, -359
                  srai       s7, s10, 16
                  srl        s2, t2, t4
                  vfwnmsac.vf   v10,fs2,v3,v0.t
                  auipc      sp, 870049
                  slt        t6, s3, a0
                  sltiu      a4, zero, -572
                  sra        ra, s11, t3
                  mulh       a2, t6, s10
                  mulhsu     s2, gp, a3
                  mulh       s6, a3, s4
                  sltiu      a2, a7, -308
                  divu       s4, t3, ra
                  addi       s11, a1, 988
                  mul        a0, ra, s2
                  remu       sp, s11, t6
                  xor        s2, s3, s6
                  xori       s1, a2, -935
                  mulhsu     a2, t2, a4
                  andi       tp, s6, 383
                  slli       a0, t1, 9
                  or         t2, a3, sp
                  vfwmsac.vv   v4,v17,v31
                  xori       t6, zero, 840
                  srai       s11, t3, 14
                  srai       a7, t6, 13
                  auipc      t0, 748282
                  mulhsu     gp, sp, gp
                  xori       s10, t1, 704
                  mulh       a4, a3, gp
                  xori       s8, gp, -648
                  slt        s0, t3, s6
                  sub        s2, s4, a5
                  sra        a1, s1, s5
                  addi       a4, t1, -24
                  ori        t3, t5, -720
                  lui        a4, 803944
                  mulhu      s7, t1, t5
                  sltiu      s6, s3, -215
                  or         a4, a3, sp
                  sra        a6, s8, s1
                  and        s10, s7, t5
                  srli       s10, s9, 5
                  vfwnmsac.vv   v2,v21,v7
                  auipc      a4, 244922
                  divu       s11, s0, t3
                  andi       s5, zero, 861
                  mulh       s0, ra, a5
                  slli       s10, s2, 28
                  mulhu      s2, s0, tp
                  ori        t2, a2, -560
                  xor        s11, a5, s6
                  addi       s2, t5, 210
                  slt        s6, t2, s4
                  ori        s8, sp, 56
                  xori       a2, gp, 417
                  sra        a7, s10, s11
                  vfwnmsac.vv   v8,v23,v5,v0.t
                  xor        t6, a6, a7
                  div        t2, s0, s3
                  sltiu      tp, a1, 514
                  mulh       s8, zero, t1
                  div        a7, s11, s1
                  srli       s8, t1, 7
                  srli       t4, s3, 19
                  add        s9, s9, a1
                  remu       a2, s8, s0
                  slt        s0, t1, s10
                  srli       t0, zero, 27
                  srl        s4, a3, a3
                  slti       gp, a7, 614
                  sll        a0, a6, ra
                  or         t4, a5, s6
                  addi       t6, s6, -226
                  slti       ra, a6, -931
                  mul        s1, s1, t4
                  vfwmsac.vv   v22,v10,v11
                  addi       t6, tp, -328
                  or         s5, s7, s8
                  slli       sp, s3, 15
                  rem        ra, s5, s3
                  lui        t4, 273351
                  or         s7, t3, s10
                  div        s1, a1, zero
                  lui        a6, 608612
                  vfwmsac.vv   v18,v1,v0
                  xor        sp, a5, a3
                  sltiu      a1, s1, 997
                  sltu       s8, t2, t4
                  xor        s11, a5, a2
                  sltu       t3, a7, sp
                  and        s2, a4, a0
                  vfwmsac.vv   v14,v2,v17
                  srl        a7, a0, a6
                  vfwnmsac.vv   v6,v12,v31,v0.t
                  mulh       s1, s2, t5
                  srai       s4, s2, 28
                  mulhu      a6, a5, s5
                  lui        s11, 1006908
                  and        tp, a4, a6
                  or         s11, s9, a1
                  remu       t4, s3, tp
                  slli       t3, s3, 3
                  sub        tp, a4, t2
                  mulhsu     t1, s11, t5
                  sra        ra, t5, a5
                  ori        t3, t5, 781
                  mulh       s5, t2, s6
                  slli       s5, s9, 5
                  vfwnmsac.vv   v20,v4,v3
                  xor        a7, a6, s7
                  sub        s11, s11, s7
                  add        a6, tp, s4
                  slt        t2, s0, t0
                  mul        t2, a5, s4
                  slli       sp, s2, 14
                  remu       s4, t3, tp
                  auipc      t3, 123034
                  slti       a7, s8, -771
                  andi       s1, a2, -341
                  slti       s5, s7, 104
                  sltu       s1, gp, a0
                  mulh       tp, t5, s6
                  mul        s2, t3, sp
                  ori        s5, s6, 878
                  andi       a0, a1, -639
                  slli       t0, s4, 7
                  mul        a2, s5, t3
                  or         a6, s11, s7
                  or         s2, t6, s10
                  xori       t6, t1, -647
                  srl        t5, a6, t6
                  slt        s8, t1, a0
                  sub        t1, t6, ra
                  sub        t6, a5, a3
                  srl        s2, s6, s5
                  srl        a2, tp, a6
                  add        t0, sp, t2
                  sub        s9, s3, a4
                  mul        sp, s0, s10
                  ori        s8, s5, -596
                  addi       s6, ra, -206
                  sub        s8, t2, s5
                  and        s8, sp, t4
                  vfwmsac.vv   v24,v9,v26,v0.t
                  srl        t3, s8, s9
                  sub        t0, t6, s0
                  slt        a7, a0, s7
                  sra        t0, sp, t1
                  sra        t3, s1, sp
                  divu       t2, s8, a4
                  mulhsu     t5, s9, a1
                  sltu       t0, s10, a2
                  sub        s11, s7, s11
                  srai       s5, s7, 28
                  vfwnmsac.vf   v2,fs7,v5
                  srai       a6, s8, 24
                  xori       a4, s8, 619
                  xor        s10, t1, s11
                  srli       sp, a4, 15
                  slli       s11, s11, 0
                  sltu       gp, s11, t5
                  sltu       s6, t0, tp
                  slli       s6, a1, 30
                  mul        gp, a2, s4
                  auipc      s8, 5118
                  auipc      a6, 731840
                  ori        zero, s0, 78
                  sll        s8, a2, t4
                  mulhu      t0, a4, a2
                  remu       t3, s9, s9
                  rem        tp, s0, s10
                  or         s2, t5, a6
                  sltiu      s5, a2, 395
                  sra        zero, s11, a7
                  slti       t3, s4, -738
                  remu       t3, s4, s3
                  auipc      a7, 791320
                  la x13, test_done
                  jalr x0, x13, 0
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
                  csrr x16, 0x341 # MEPC
                  csrr x16, 0x342 # MCAUSE
                  li x27, 0x3 # BREAKPOINT
                  beq x16, x27, ebreak_handler
                  li x27, 0x8 # ECALL_UMODE
                  beq x16, x27, ecall_handler
                  li x27, 0x9 # ECALL_SMODE
                  beq x16, x27, ecall_handler
                  li x27, 0xb # ECALL_MMODE
                  beq x16, x27, ecall_handler
                  li x27, 0x1
                  beq x16, x27, instr_fault_handler
                  li x27, 0x5
                  beq x16, x27, load_fault_handler
                  li x27, 0x7
                  beq x16, x27, store_fault_handler
                  li x27, 0xc
                  beq x16, x27, pt_fault_handler
                  li x27, 0xd
                  beq x16, x27, pt_fault_handler
                  li x27, 0xf
                  beq x16, x27, pt_fault_handler
                  li x27, 0x2 # ILLEGAL_INSTRUCTION
                  beq x16, x27, illegal_instr_handler
                  csrr x27, 0x343 # MTVAL
                  1: la x13, test_done
                  jalr x1, x13, 0

ecall_handler:    
                  la x16, _start
                  sw x0, 0(x16)
                  sw x1, 4(x16)
                  sw x2, 8(x16)
                  sw x3, 12(x16)
                  sw x4, 16(x16)
                  sw x5, 20(x16)
                  sw x6, 24(x16)
                  sw x7, 28(x16)
                  sw x8, 32(x16)
                  sw x9, 36(x16)
                  sw x10, 40(x16)
                  sw x11, 44(x16)
                  sw x12, 48(x16)
                  sw x13, 52(x16)
                  sw x14, 56(x16)
                  sw x15, 60(x16)
                  sw x16, 64(x16)
                  sw x17, 68(x16)
                  sw x18, 72(x16)
                  sw x19, 76(x16)
                  sw x20, 80(x16)
                  sw x21, 84(x16)
                  sw x22, 88(x16)
                  sw x23, 92(x16)
                  sw x24, 96(x16)
                  sw x25, 100(x16)
                  sw x26, 104(x16)
                  sw x27, 108(x16)
                  sw x28, 112(x16)
                  sw x29, 116(x16)
                  sw x30, 120(x16)
                  sw x31, 124(x16)
                  la x13, write_tohost
                  jalr x0, x13, 0

instr_fault_handler:
                  li x16, 0
                  csrw 0x340, x16
                  li x13, 0
                  0: csrr x16, 0x340
                  mv x13, x16
                  li x13, 0
                  beq x16, x13, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x26, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x13, x26, x16
                  addi x13, x13, -1
                  slli x13, x13, 3
                  sll x26, x5, x13
                  slli x16, x16, 3
                  add x13, x13, x16
                  srl x26, x26, x13
                  slli x13, x26, 27
                  srli x13, x13, 30
                  beqz x13, 20f
                  li x16, 1
                  beq x13, x16, 21f
                  li x16, 2
                  beq x13, x16, 25f
                  li x16, 3
                  beq x13, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x13, x27
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x27, 1
                  ble x27, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x13, 0x343
                  srli x13, x13, 2
                  bnez x16, 22f
                  bltz x13, 18b
                  j 23f
                  22: bgtu x13, x13, 18b
                  23: bleu x27, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x13, x27, 2
                  srli x13, x13, 2
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x13, x27, 2
                  srli x13, x13, 2
                  srli x13, x13, 0
                  slli x13, x13, 0
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x26, x26, 4
                  csrr x16, 0x340
                  li x13, 30
                  sll x16, x16, x13
                  srl x16, x16, x13
                  slli x13, x16, 3
                  sll x26, x26, x13
                  or x5, x5, x26
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x13, 1
                  beq x16, x13, 31f
                  li x13, 2
                  beq x16, x13, 32f
                  li x13, 3
                  beq x16, x13, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
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
                  li x16, 0
                  csrw 0x340, x16
                  li x13, 0
                  0: csrr x16, 0x340
                  mv x13, x16
                  li x13, 0
                  beq x16, x13, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x26, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x13, x26, x16
                  addi x13, x13, -1
                  slli x13, x13, 3
                  sll x26, x5, x13
                  slli x16, x16, 3
                  add x13, x13, x16
                  srl x26, x26, x13
                  slli x13, x26, 27
                  srli x13, x13, 30
                  beqz x13, 20f
                  li x16, 1
                  beq x13, x16, 21f
                  li x16, 2
                  beq x13, x16, 25f
                  li x16, 3
                  beq x13, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x13, x27
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x27, 1
                  ble x27, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x13, 0x343
                  srli x13, x13, 2
                  bnez x16, 22f
                  bltz x13, 18b
                  j 23f
                  22: bgtu x13, x13, 18b
                  23: bleu x27, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x13, x27, 2
                  srli x13, x13, 2
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x13, x27, 2
                  srli x13, x13, 2
                  srli x13, x13, 0
                  slli x13, x13, 0
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x26, x26, 1
                  csrr x16, 0x340
                  li x13, 30
                  sll x16, x16, x13
                  srl x16, x16, x13
                  slli x13, x16, 3
                  sll x26, x26, x13
                  or x5, x5, x26
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x13, 1
                  beq x16, x13, 31f
                  li x13, 2
                  beq x16, x13, 32f
                  li x13, 3
                  beq x16, x13, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
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
                  li x16, 0
                  csrw 0x340, x16
                  li x13, 0
                  0: csrr x16, 0x340
                  mv x13, x16
                  li x13, 0
                  beq x16, x13, 1f
                  1: csrr x27, 0x3b0
                  csrr x5, 0x3a0
                  j 17f
                  17: li x26, 4
                  csrr x16, 0x340
                  slli x16, x16, 30
                  srli x16, x16, 30
                  sub x13, x26, x16
                  addi x13, x13, -1
                  slli x13, x13, 3
                  sll x26, x5, x13
                  slli x16, x16, 3
                  add x13, x13, x16
                  srl x26, x26, x13
                  slli x13, x26, 27
                  srli x13, x13, 30
                  beqz x13, 20f
                  li x16, 1
                  beq x13, x16, 21f
                  li x16, 2
                  beq x13, x16, 25f
                  li x16, 3
                  beq x13, x16, 27f
                  la x16, test_done
                  jalr x0, x16, 0
                  18: csrr x16, 0x340
                  mv x13, x27
                  addi x16, x16, 1
                  csrw 0x340, x16
                  li x27, 1
                  ble x27, x16, 19f
                  j 0b
                  19: la x16, test_done
                  jalr x0, x16, 0
                  20: j 18b
                  21: csrr x16, 0x340
                  csrr x13, 0x343
                  srli x13, x13, 2
                  bnez x16, 22f
                  bltz x13, 18b
                  j 23f
                  22: bgtu x13, x13, 18b
                  23: bleu x27, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 24f
                  la x16, test_done
                  jalr x0, x16, 0
                  24: j 29f
                  25: csrr x16, 0x343
                  srli x16, x16, 2
                  slli x13, x27, 2
                  srli x13, x13, 2
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 26f
                  la x16, test_done
                  jalr x0, x16, 0
                  26: j 29f
                  27: csrr x16, 0x343
                  srli x16, x16, 2
                  srli x16, x16, 0
                  slli x16, x16, 0
                  slli x13, x27, 2
                  srli x13, x13, 2
                  srli x13, x13, 0
                  slli x13, x13, 0
                  bne x16, x13, 18b
                  andi x13, x26, 128
                  beqz x13, 29f
                  la x16, test_done
                  jalr x0, x16, 0
                  28: j 29f
                  29: ori x26, x26, 3
                  csrr x16, 0x340
                  li x13, 30
                  sll x16, x16, x13
                  srl x16, x16, x13
                  slli x13, x16, 3
                  sll x26, x26, x13
                  or x5, x5, x26
                  csrr x16, 0x340
                  srli x16, x16, 2
                  beqz x16, 30f
                  li x13, 1
                  beq x16, x13, 31f
                  li x13, 2
                  beq x16, x13, 32f
                  li x13, 3
                  beq x16, x13, 33f
                  30: csrw 0x3a0, x5
                  j 34f
                  31: csrw 0x3a1, x5
                  j 34f
                  32: csrw 0x3a2, x5
                  j 34f
                  33: csrw 0x3a3, x5
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
                  csrr  x16, 0x341
                  addi  x16, x16, 4
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
                  csrr  x16, 0x341
                  addi  x16, x16, 4
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
                  csrr  x16, 0x300 # MSTATUS;
                  csrr  x16, 0x304 # MIE;
                  csrr  x16, 0x344 # MIP;
                  csrrc x16, 0x344, x16 # MIP;
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
