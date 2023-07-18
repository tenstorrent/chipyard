.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x10, 0x40201123
                  csrw 0x301, x10
                  csrr x31, 0x301
kernel_sp:        
                  la x14, kernel_stack_end

trap_vec_init:    
                  la x10, mtvec_handler
                  ori x10, x10, 1

mepc_setup:       
                  la x10, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0xf8605163
                  li x1, 0xf5bdba39
                  li x2, 0xa6972314
                  li x3, 0xf23d654f
                  li x4, 0x63a9a6f2
                  li x5, 0xf182bc87
                  li x6, 0xf9a18026
                  li x7, 0xf373f237
                  li x8, 0xf34c4706
                  li x9, 0xc8692c83
                  li x10, 0xf247167c
                  li x11, 0xf74b1143
                  li x12, 0xf6981330
                  li x13, 0x80000000
                  li x15, 0xa0d2106a
                  li x16, 0xf0e699e7
                  li x17, 0x80000000
                  li x18, 0x85580e37
                  li x19, 0xf3a0c447
                  li x21, 0xfeea7cad
                  li x22, 0xfe7ebe07
                  li x23, 0xf26f9c3d
                  li x24, 0xfa91d805
                  li x25, 0x80000000
                  li x26, 0x212392ed
                  li x27, 0xf5415ce8
                  li x28, 0x80000000
                  li x29, 0x80000000
                  li x30, 0xe299a64b
                  li x31, 0xf9ba5e62
                  la x20, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x11, 4
                  vsetvli x10, x11, e32, m1
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
                  li x10, 0x64930272
                  vslide1up.vx v0, v1, x10
                  vmv.v.v v0, v0
                  li x10, 0xcd249dbf
                  vslide1up.vx v0, v1, x10
                  vmv.v.v v0, v0
                  li x10, 0x74cfef4e
                  vslide1up.vx v0, v1, x10
                  vmv.v.v v0, v0
                  li x10, 0x6985bcbb
                  vslide1up.vx v0, v1, x10
                  li x10, 0x3870deaa
                  vslide1up.vx v1, v0, x10
                  vmv.v.v v0, v1
                  li x10, 0xdb6a3ded
                  vslide1up.vx v1, v0, x10
                  vmv.v.v v0, v1
                  li x10, 0xbd87af93
                  vslide1up.vx v1, v0, x10
                  vmv.v.v v0, v1
                  li x10, 0xbe96d050
                  vslide1up.vx v1, v0, x10
                  li x10, 0x1efe8a34
                  vslide1up.vx v2, v0, x10
                  vmv.v.v v0, v2
                  li x10, 0x5808e899
                  vslide1up.vx v2, v0, x10
                  vmv.v.v v0, v2
                  li x10, 0xcecd0202
                  vslide1up.vx v2, v0, x10
                  vmv.v.v v0, v2
                  li x10, 0x37caf3de
                  vslide1up.vx v2, v0, x10
                  li x10, 0x93cff428
                  vslide1up.vx v3, v0, x10
                  vmv.v.v v0, v3
                  li x10, 0x9fc93626
                  vslide1up.vx v3, v0, x10
                  vmv.v.v v0, v3
                  li x10, 0xb3832056
                  vslide1up.vx v3, v0, x10
                  vmv.v.v v0, v3
                  li x10, 0x82bce29a
                  vslide1up.vx v3, v0, x10
                  li x10, 0x679858ea
                  vslide1up.vx v4, v0, x10
                  vmv.v.v v0, v4
                  li x10, 0xef676c80
                  vslide1up.vx v4, v0, x10
                  vmv.v.v v0, v4
                  li x10, 0xfbdd18
                  vslide1up.vx v4, v0, x10
                  vmv.v.v v0, v4
                  li x10, 0x4fafe7eb
                  vslide1up.vx v4, v0, x10
                  li x10, 0xadfb553c
                  vslide1up.vx v5, v0, x10
                  vmv.v.v v0, v5
                  li x10, 0x5a977672
                  vslide1up.vx v5, v0, x10
                  vmv.v.v v0, v5
                  li x10, 0x5521443e
                  vslide1up.vx v5, v0, x10
                  vmv.v.v v0, v5
                  li x10, 0xe340ee10
                  vslide1up.vx v5, v0, x10
                  li x10, 0xe758c5be
                  vslide1up.vx v6, v0, x10
                  vmv.v.v v0, v6
                  li x10, 0x52d8c8d
                  vslide1up.vx v6, v0, x10
                  vmv.v.v v0, v6
                  li x10, 0x3ffefc26
                  vslide1up.vx v6, v0, x10
                  vmv.v.v v0, v6
                  li x10, 0xf37ef340
                  vslide1up.vx v6, v0, x10
                  li x10, 0x91bf00d9
                  vslide1up.vx v7, v0, x10
                  vmv.v.v v0, v7
                  li x10, 0x539e4018
                  vslide1up.vx v7, v0, x10
                  vmv.v.v v0, v7
                  li x10, 0x9feeb3b
                  vslide1up.vx v7, v0, x10
                  vmv.v.v v0, v7
                  li x10, 0xbe6bbd8a
                  vslide1up.vx v7, v0, x10
                  li x10, 0x246d64b
                  vslide1up.vx v8, v0, x10
                  vmv.v.v v0, v8
                  li x10, 0x63a1c2d0
                  vslide1up.vx v8, v0, x10
                  vmv.v.v v0, v8
                  li x10, 0xca5f3a54
                  vslide1up.vx v8, v0, x10
                  vmv.v.v v0, v8
                  li x10, 0x191bb73b
                  vslide1up.vx v8, v0, x10
                  li x10, 0xd260078a
                  vslide1up.vx v9, v0, x10
                  vmv.v.v v0, v9
                  li x10, 0xccd9d402
                  vslide1up.vx v9, v0, x10
                  vmv.v.v v0, v9
                  li x10, 0x1001aa84
                  vslide1up.vx v9, v0, x10
                  vmv.v.v v0, v9
                  li x10, 0x9d5f8e8d
                  vslide1up.vx v9, v0, x10
                  li x10, 0xfe4d9faf
                  vslide1up.vx v10, v0, x10
                  vmv.v.v v0, v10
                  li x10, 0x9738515b
                  vslide1up.vx v10, v0, x10
                  vmv.v.v v0, v10
                  li x10, 0xac7f02ba
                  vslide1up.vx v10, v0, x10
                  vmv.v.v v0, v10
                  li x10, 0x6efd6e05
                  vslide1up.vx v10, v0, x10
                  li x10, 0xeb8566a2
                  vslide1up.vx v11, v0, x10
                  vmv.v.v v0, v11
                  li x10, 0x6493dff4
                  vslide1up.vx v11, v0, x10
                  vmv.v.v v0, v11
                  li x10, 0x2d838a2
                  vslide1up.vx v11, v0, x10
                  vmv.v.v v0, v11
                  li x10, 0xf6f5be9
                  vslide1up.vx v11, v0, x10
                  li x10, 0x659833ce
                  vslide1up.vx v12, v0, x10
                  vmv.v.v v0, v12
                  li x10, 0xa34cb7
                  vslide1up.vx v12, v0, x10
                  vmv.v.v v0, v12
                  li x10, 0x73e0dcb0
                  vslide1up.vx v12, v0, x10
                  vmv.v.v v0, v12
                  li x10, 0xe960bf34
                  vslide1up.vx v12, v0, x10
                  li x10, 0x56ac91dd
                  vslide1up.vx v13, v0, x10
                  vmv.v.v v0, v13
                  li x10, 0xbab572ee
                  vslide1up.vx v13, v0, x10
                  vmv.v.v v0, v13
                  li x10, 0x5d369bb7
                  vslide1up.vx v13, v0, x10
                  vmv.v.v v0, v13
                  li x10, 0xf74a7057
                  vslide1up.vx v13, v0, x10
                  li x10, 0x498d98d8
                  vslide1up.vx v14, v0, x10
                  vmv.v.v v0, v14
                  li x10, 0x1a27c62
                  vslide1up.vx v14, v0, x10
                  vmv.v.v v0, v14
                  li x10, 0xf22fc329
                  vslide1up.vx v14, v0, x10
                  vmv.v.v v0, v14
                  li x10, 0xc991f022
                  vslide1up.vx v14, v0, x10
                  li x10, 0xadf2a5dc
                  vslide1up.vx v15, v0, x10
                  vmv.v.v v0, v15
                  li x10, 0xb1c0f2df
                  vslide1up.vx v15, v0, x10
                  vmv.v.v v0, v15
                  li x10, 0xbdc8e3e
                  vslide1up.vx v15, v0, x10
                  vmv.v.v v0, v15
                  li x10, 0x893ef9df
                  vslide1up.vx v15, v0, x10
                  li x10, 0xfec318ce
                  vslide1up.vx v16, v0, x10
                  vmv.v.v v0, v16
                  li x10, 0x3cf782e
                  vslide1up.vx v16, v0, x10
                  vmv.v.v v0, v16
                  li x10, 0xee5887e5
                  vslide1up.vx v16, v0, x10
                  vmv.v.v v0, v16
                  li x10, 0xa4a24c5c
                  vslide1up.vx v16, v0, x10
                  li x10, 0x57637b9d
                  vslide1up.vx v17, v0, x10
                  vmv.v.v v0, v17
                  li x10, 0xa7fbe9c2
                  vslide1up.vx v17, v0, x10
                  vmv.v.v v0, v17
                  li x10, 0xedc03e68
                  vslide1up.vx v17, v0, x10
                  vmv.v.v v0, v17
                  li x10, 0xef1a27dd
                  vslide1up.vx v17, v0, x10
                  li x10, 0x4cb50a41
                  vslide1up.vx v18, v0, x10
                  vmv.v.v v0, v18
                  li x10, 0x886cea5f
                  vslide1up.vx v18, v0, x10
                  vmv.v.v v0, v18
                  li x10, 0x698a1c2
                  vslide1up.vx v18, v0, x10
                  vmv.v.v v0, v18
                  li x10, 0x92c5186d
                  vslide1up.vx v18, v0, x10
                  li x10, 0x953d27e5
                  vslide1up.vx v19, v0, x10
                  vmv.v.v v0, v19
                  li x10, 0x4281e3cb
                  vslide1up.vx v19, v0, x10
                  vmv.v.v v0, v19
                  li x10, 0xb07a32a
                  vslide1up.vx v19, v0, x10
                  vmv.v.v v0, v19
                  li x10, 0x799a982a
                  vslide1up.vx v19, v0, x10
                  li x10, 0xa35b549e
                  vslide1up.vx v20, v0, x10
                  vmv.v.v v0, v20
                  li x10, 0x2d8022e6
                  vslide1up.vx v20, v0, x10
                  vmv.v.v v0, v20
                  li x10, 0x2c01baa1
                  vslide1up.vx v20, v0, x10
                  vmv.v.v v0, v20
                  li x10, 0x619aea
                  vslide1up.vx v20, v0, x10
                  li x10, 0x6e10e85e
                  vslide1up.vx v21, v0, x10
                  vmv.v.v v0, v21
                  li x10, 0x5513a82e
                  vslide1up.vx v21, v0, x10
                  vmv.v.v v0, v21
                  li x10, 0x4e429e96
                  vslide1up.vx v21, v0, x10
                  vmv.v.v v0, v21
                  li x10, 0x9dba6439
                  vslide1up.vx v21, v0, x10
                  li x10, 0xc294eb02
                  vslide1up.vx v22, v0, x10
                  vmv.v.v v0, v22
                  li x10, 0xbee26ac5
                  vslide1up.vx v22, v0, x10
                  vmv.v.v v0, v22
                  li x10, 0x94e2e63c
                  vslide1up.vx v22, v0, x10
                  vmv.v.v v0, v22
                  li x10, 0x84956db
                  vslide1up.vx v22, v0, x10
                  li x10, 0xf866cee5
                  vslide1up.vx v23, v0, x10
                  vmv.v.v v0, v23
                  li x10, 0x8f3792ff
                  vslide1up.vx v23, v0, x10
                  vmv.v.v v0, v23
                  li x10, 0xe92645b9
                  vslide1up.vx v23, v0, x10
                  vmv.v.v v0, v23
                  li x10, 0x63f80356
                  vslide1up.vx v23, v0, x10
                  li x10, 0xb54b21ba
                  vslide1up.vx v24, v0, x10
                  vmv.v.v v0, v24
                  li x10, 0x5bb9d1a5
                  vslide1up.vx v24, v0, x10
                  vmv.v.v v0, v24
                  li x10, 0x5974b8f4
                  vslide1up.vx v24, v0, x10
                  vmv.v.v v0, v24
                  li x10, 0x11944644
                  vslide1up.vx v24, v0, x10
                  li x10, 0xe4ab6b16
                  vslide1up.vx v25, v0, x10
                  vmv.v.v v0, v25
                  li x10, 0x6c228555
                  vslide1up.vx v25, v0, x10
                  vmv.v.v v0, v25
                  li x10, 0x2067786d
                  vslide1up.vx v25, v0, x10
                  vmv.v.v v0, v25
                  li x10, 0xae51597f
                  vslide1up.vx v25, v0, x10
                  li x10, 0xd29e8c4b
                  vslide1up.vx v26, v0, x10
                  vmv.v.v v0, v26
                  li x10, 0xcf429790
                  vslide1up.vx v26, v0, x10
                  vmv.v.v v0, v26
                  li x10, 0x2e2646c2
                  vslide1up.vx v26, v0, x10
                  vmv.v.v v0, v26
                  li x10, 0xf7a841a2
                  vslide1up.vx v26, v0, x10
                  li x10, 0xcc6708a
                  vslide1up.vx v27, v0, x10
                  vmv.v.v v0, v27
                  li x10, 0x74f4c34
                  vslide1up.vx v27, v0, x10
                  vmv.v.v v0, v27
                  li x10, 0xe3ed270f
                  vslide1up.vx v27, v0, x10
                  vmv.v.v v0, v27
                  li x10, 0xc407c519
                  vslide1up.vx v27, v0, x10
                  li x10, 0x6f4a48fa
                  vslide1up.vx v28, v0, x10
                  vmv.v.v v0, v28
                  li x10, 0x9308b1b1
                  vslide1up.vx v28, v0, x10
                  vmv.v.v v0, v28
                  li x10, 0x396c3e34
                  vslide1up.vx v28, v0, x10
                  vmv.v.v v0, v28
                  li x10, 0x1fe244a6
                  vslide1up.vx v28, v0, x10
                  li x10, 0x681eb2fd
                  vslide1up.vx v29, v0, x10
                  vmv.v.v v0, v29
                  li x10, 0x143f4b77
                  vslide1up.vx v29, v0, x10
                  vmv.v.v v0, v29
                  li x10, 0x9c831e0d
                  vslide1up.vx v29, v0, x10
                  vmv.v.v v0, v29
                  li x10, 0x9e4c9ba6
                  vslide1up.vx v29, v0, x10
                  li x10, 0x617cebc
                  vslide1up.vx v30, v0, x10
                  vmv.v.v v0, v30
                  li x10, 0x688216a7
                  vslide1up.vx v30, v0, x10
                  vmv.v.v v0, v30
                  li x10, 0xef446f36
                  vslide1up.vx v30, v0, x10
                  vmv.v.v v0, v30
                  li x10, 0x6f6b8d20
                  vslide1up.vx v30, v0, x10
                  li x10, 0x6b4e9a81
                  vslide1up.vx v31, v0, x10
                  vmv.v.v v0, v31
                  li x10, 0xfd429571
                  vslide1up.vx v31, v0, x10
                  vmv.v.v v0, v31
                  li x10, 0xc757209a
                  vslide1up.vx v31, v0, x10
                  vmv.v.v v0, v31
                  li x10, 0x9c7e6951
                  vslide1up.vx v31, v0, x10
li x11, 8
                  vsetvli x10, x11, e16, m1
main:             mulhu      t3, sp, s10
                  lui        a1, 350134
                  mul        a3, s10, tp
                  xori       zero, s2, 311
                  sltu       s9, s8, a2
                  vfwnmacc.vv   v2,v29,v26,v0.t
                  auipc      zero, 383571
                  mulh       tp, sp, tp
                  sltu       s6, s1, s2
                  xori       s10, ra, -374
                  sra        t3, a6, a0
                  vfwmacc.vf   v16,ft2,v0
                  mulhu      s8, s6, s10
                  ori        t3, t2, -28
                  remu       a0, a5, a4
                  vfwnmacc.vv   v20,v10,v1,v0.t
                  andi       t0, s7, -481
                  remu       a6, a5, gp
                  vfwmacc.vf   v28,ft0,v17,v0.t
                  addi       s11, a5, 479
                  sltu       t0, s6, t5
                  divu       s6, tp, s1
                  mulh       s5, a0, s2
                  xor        t3, tp, t5
                  sub        a2, t3, s10
                  srai       a1, a1, 4
                  add        gp, tp, t2
                  lui        gp, 505314
                  srli       t0, t3, 10
                  div        gp, a4, a4
                  srai       s3, t0, 19
                  sra        s7, s8, a5
                  div        t6, t4, t4
                  srl        t6, s6, a0
                  mulhsu     s2, a7, t2
                  andi       a5, zero, 830
                  sub        s11, sp, a3
                  xor        s1, s4, t2
                  or         s7, a5, s10
                  add        s1, s7, s6
                  slt        tp, a7, s0
                  slt        t5, s9, a6
                  slt        s11, s4, s10
                  add        t1, s8, ra
                  or         s9, a1, s10
                  mulhu      t1, zero, s6
                  srai       t2, t2, 7
                  ori        s5, t2, 584
                  auipc      t6, 509229
                  andi       s2, t5, 630
                  add        t5, t5, t0
                  divu       s7, t3, a2
                  srli       t3, a3, 12
                  rem        s10, t5, s10
                  rem        t0, s10, s4
                  divu       s5, t0, s0
                  slt        a0, a0, s6
                  mul        s7, a2, gp
                  sra        s2, t6, a4
                  vfwmacc.vv   v16,v27,v25
                  mulh       s11, s0, tp
                  sub        s1, a7, s2
                  xor        s7, s3, a4
                  mulhsu     a5, s7, t3
                  slti       a1, ra, 601
                  sltu       s9, t3, t1
                  sll        s3, a2, t1
                  remu       tp, ra, s6
                  auipc      s10, 899210
                  andi       s3, t4, 762
                  mulh       sp, s8, ra
                  div        s5, a0, t5
                  srai       s2, s2, 31
                  or         s3, a5, s11
                  sub        a0, t5, ra
                  rem        a1, a4, s6
                  auipc      s6, 243529
                  srli       t1, ra, 13
                  sra        t3, zero, s8
                  xor        zero, t4, t5
                  div        s1, t3, s1
                  sra        t6, s6, tp
                  sltu       sp, a3, tp
                  srai       s9, tp, 29
                  slt        s10, a7, t2
                  remu       tp, s0, t3
                  mul        t0, sp, ra
                  divu       t1, t4, a4
                  sltu       sp, s9, s6
                  mulh       sp, s8, sp
                  andi       a5, s4, -169
                  slli       s5, t4, 31
                  mulh       s11, zero, s10
                  auipc      s10, 28463
                  mul        s7, s8, a4
                  addi       t0, s3, 991
                  srli       s2, t0, 9
                  mul        s3, zero, s2
                  srl        gp, s8, s1
                  add        a7, t1, zero
                  auipc      t4, 719217
                  srai       s7, s0, 22
                  ori        s1, gp, 707
                  vfwnmacc.vv   v24,v0,v17,v0.t
                  andi       t0, ra, -82
                  mul        s0, a3, a6
                  remu       s6, a6, a3
                  or         a3, s6, s4
                  divu       t1, a1, a5
                  sltu       gp, s9, t2
                  and        t6, t3, a0
                  mul        gp, s7, t4
                  and        gp, s7, a5
                  and        s2, s3, t4
                  vfwnmacc.vv   v18,v2,v21,v0.t
                  mul        a6, s3, s3
                  remu       a2, s4, t1
                  sltiu      sp, s1, -679
                  sltu       s6, a0, a6
                  remu       sp, s8, a6
                  slti       t3, s0, 581
                  andi       s2, a6, 168
                  and        a5, t6, s2
                  sra        s0, a4, s11
                  srai       gp, s10, 29
                  slli       t2, ra, 4
                  remu       s10, s5, t2
                  rem        t1, s11, t5
                  addi       t5, a7, 830
                  andi       zero, a1, -18
                  sll        s5, gp, s1
                  and        t3, a7, ra
                  or         s1, a2, a1
                  sltiu      s7, a0, 159
                  srai       sp, t1, 11
                  slli       a7, t1, 8
                  mulhu      s3, a5, a6
                  slli       a1, a0, 7
                  slt        s1, t3, s8
                  rem        s6, s6, s2
                  xor        t2, t1, a6
                  xor        zero, tp, s7
                  ori        s5, s7, -39
                  auipc      s1, 568526
                  slti       s6, a1, 508
                  ori        t1, sp, 493
                  andi       a1, s5, -655
                  mulh       s11, t1, t5
                  sltu       s7, s2, t4
                  xor        a5, gp, gp
                  divu       t1, s9, tp
                  vfwmacc.vf   v16,fa5,v3
                  slti       t6, a2, 422
                  mulhsu     t6, t6, a4
                  rem        zero, sp, s11
                  rem        a6, a6, s5
                  mulh       a2, s0, t6
                  slli       s0, s7, 30
                  mulhsu     s5, s6, gp
                  lui        gp, 245451
                  srl        s6, s7, s0
                  andi       s8, t5, 750
                  sltu       s8, s1, a2
                  sra        s2, t5, a5
                  remu       s5, gp, s1
                  mul        t5, a7, tp
                  rem        s10, a7, t2
                  sltiu      s6, tp, 940
                  and        a2, s6, s4
                  srli       t4, a5, 16
                  sltu       s11, a0, a6
                  srai       t3, t5, 31
                  sltu       s7, a5, s11
                  andi       s7, t5, 391
                  mulhu      t3, sp, t4
                  mulh       s5, s3, s3
                  srai       zero, t2, 19
                  mulhu      s2, s11, s11
                  sra        zero, a6, t1
                  srli       a7, a3, 24
                  sltiu      zero, a0, -921
                  div        s9, a0, a0
                  and        t6, s6, t1
                  or         a5, a2, s8
                  remu       t0, t0, a2
                  slt        s10, a2, ra
                  andi       gp, zero, 75
                  mulhsu     a2, a6, t1
                  auipc      s3, 542197
                  auipc      a6, 307543
                  slli       s10, t3, 26
                  ori        t1, a0, -773
                  slli       zero, a5, 20
                  sra        sp, t0, tp
                  div        a0, s7, t0
                  and        a1, t6, t4
                  sra        t6, a5, s1
                  sub        s2, a3, s11
                  divu       s11, a6, a7
                  sra        s0, s5, a6
                  la x1, test_done
                  jalr x0, x1, 0
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
                  1: addi x20, x20, -124
                  sw  x1, 4(x20)
                  sw  x2, 8(x20)
                  sw  x3, 12(x20)
                  sw  x4, 16(x20)
                  sw  x5, 20(x20)
                  sw  x6, 24(x20)
                  sw  x7, 28(x20)
                  sw  x8, 32(x20)
                  sw  x9, 36(x20)
                  sw  x10, 40(x20)
                  sw  x11, 44(x20)
                  sw  x12, 48(x20)
                  sw  x13, 52(x20)
                  sw  x14, 56(x20)
                  sw  x15, 60(x20)
                  sw  x16, 64(x20)
                  sw  x17, 68(x20)
                  sw  x18, 72(x20)
                  sw  x19, 76(x20)
                  sw  x20, 80(x20)
                  sw  x21, 84(x20)
                  sw  x22, 88(x20)
                  sw  x23, 92(x20)
                  sw  x24, 96(x20)
                  sw  x25, 100(x20)
                  sw  x26, 104(x20)
                  sw  x27, 108(x20)
                  sw  x28, 112(x20)
                  sw  x29, 116(x20)
                  sw  x30, 120(x20)
                  sw  x31, 124(x20)
                  csrr x10, 0x341 # MEPC
                  csrr x10, 0x342 # MCAUSE
                  li x11, 0x3 # BREAKPOINT
                  beq x10, x11, ebreak_handler
                  li x11, 0x8 # ECALL_UMODE
                  beq x10, x11, ecall_handler
                  li x11, 0x9 # ECALL_SMODE
                  beq x10, x11, ecall_handler
                  li x11, 0xb # ECALL_MMODE
                  beq x10, x11, ecall_handler
                  li x11, 0x1
                  beq x10, x11, instr_fault_handler
                  li x11, 0x5
                  beq x10, x11, load_fault_handler
                  li x11, 0x7
                  beq x10, x11, store_fault_handler
                  li x11, 0xc
                  beq x10, x11, pt_fault_handler
                  li x11, 0xd
                  beq x10, x11, pt_fault_handler
                  li x11, 0xf
                  beq x10, x11, pt_fault_handler
                  li x11, 0x2 # ILLEGAL_INSTRUCTION
                  beq x10, x11, illegal_instr_handler
                  csrr x11, 0x343 # MTVAL
                  1: la x1, test_done
                  jalr x1, x1, 0

ecall_handler:    
                  la x10, _start
                  sw x0, 0(x10)
                  sw x1, 4(x10)
                  sw x2, 8(x10)
                  sw x3, 12(x10)
                  sw x4, 16(x10)
                  sw x5, 20(x10)
                  sw x6, 24(x10)
                  sw x7, 28(x10)
                  sw x8, 32(x10)
                  sw x9, 36(x10)
                  sw x10, 40(x10)
                  sw x11, 44(x10)
                  sw x12, 48(x10)
                  sw x13, 52(x10)
                  sw x14, 56(x10)
                  sw x15, 60(x10)
                  sw x16, 64(x10)
                  sw x17, 68(x10)
                  sw x18, 72(x10)
                  sw x19, 76(x10)
                  sw x20, 80(x10)
                  sw x21, 84(x10)
                  sw x22, 88(x10)
                  sw x23, 92(x10)
                  sw x24, 96(x10)
                  sw x25, 100(x10)
                  sw x26, 104(x10)
                  sw x27, 108(x10)
                  sw x28, 112(x10)
                  sw x29, 116(x10)
                  sw x30, 120(x10)
                  sw x31, 124(x10)
                  la x1, write_tohost
                  jalr x0, x1, 0

instr_fault_handler:
                  li x10, 0
                  csrw 0x340, x10
                  li x17, 0
                  0: csrr x10, 0x340
                  mv x1, x10
                  li x1, 0
                  beq x10, x1, 1f
                  1: csrr x11, 0x3b0
                  csrr x28, 0x3a0
                  j 17f
                  17: li x9, 4
                  csrr x10, 0x340
                  slli x10, x10, 30
                  srli x10, x10, 30
                  sub x1, x9, x10
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x9, x28, x1
                  slli x10, x10, 3
                  add x1, x1, x10
                  srl x9, x9, x1
                  slli x1, x9, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x10, 1
                  beq x1, x10, 21f
                  li x10, 2
                  beq x1, x10, 25f
                  li x10, 3
                  beq x1, x10, 27f
                  la x10, test_done
                  jalr x0, x10, 0
                  18: csrr x10, 0x340
                  mv x17, x11
                  addi x10, x10, 1
                  csrw 0x340, x10
                  li x11, 1
                  ble x11, x10, 19f
                  j 0b
                  19: la x10, test_done
                  jalr x0, x10, 0
                  20: j 18b
                  21: csrr x10, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x10, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x17, x1, 18b
                  23: bleu x11, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 24f
                  la x10, test_done
                  jalr x0, x10, 0
                  24: j 29f
                  25: csrr x10, 0x343
                  srli x10, x10, 2
                  slli x1, x11, 2
                  srli x1, x1, 2
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 26f
                  la x10, test_done
                  jalr x0, x10, 0
                  26: j 29f
                  27: csrr x10, 0x343
                  srli x10, x10, 2
                  srli x10, x10, 0
                  slli x10, x10, 0
                  slli x1, x11, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 29f
                  la x10, test_done
                  jalr x0, x10, 0
                  28: j 29f
                  29: ori x9, x9, 4
                  csrr x10, 0x340
                  li x1, 30
                  sll x10, x10, x1
                  srl x10, x10, x1
                  slli x1, x10, 3
                  sll x9, x9, x1
                  or x28, x28, x9
                  csrr x10, 0x340
                  srli x10, x10, 2
                  beqz x10, 30f
                  li x1, 1
                  beq x10, x1, 31f
                  li x1, 2
                  beq x10, x1, 32f
                  li x1, 3
                  beq x10, x1, 33f
                  30: csrw 0x3a0, x28
                  j 34f
                  31: csrw 0x3a1, x28
                  j 34f
                  32: csrw 0x3a2, x28
                  j 34f
                  33: csrw 0x3a3, x28
                  34: nop
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
                  mret

load_fault_handler:
                  li x10, 0
                  csrw 0x340, x10
                  li x17, 0
                  0: csrr x10, 0x340
                  mv x1, x10
                  li x1, 0
                  beq x10, x1, 1f
                  1: csrr x11, 0x3b0
                  csrr x28, 0x3a0
                  j 17f
                  17: li x9, 4
                  csrr x10, 0x340
                  slli x10, x10, 30
                  srli x10, x10, 30
                  sub x1, x9, x10
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x9, x28, x1
                  slli x10, x10, 3
                  add x1, x1, x10
                  srl x9, x9, x1
                  slli x1, x9, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x10, 1
                  beq x1, x10, 21f
                  li x10, 2
                  beq x1, x10, 25f
                  li x10, 3
                  beq x1, x10, 27f
                  la x10, test_done
                  jalr x0, x10, 0
                  18: csrr x10, 0x340
                  mv x17, x11
                  addi x10, x10, 1
                  csrw 0x340, x10
                  li x11, 1
                  ble x11, x10, 19f
                  j 0b
                  19: la x10, test_done
                  jalr x0, x10, 0
                  20: j 18b
                  21: csrr x10, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x10, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x17, x1, 18b
                  23: bleu x11, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 24f
                  la x10, test_done
                  jalr x0, x10, 0
                  24: j 29f
                  25: csrr x10, 0x343
                  srli x10, x10, 2
                  slli x1, x11, 2
                  srli x1, x1, 2
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 26f
                  la x10, test_done
                  jalr x0, x10, 0
                  26: j 29f
                  27: csrr x10, 0x343
                  srli x10, x10, 2
                  srli x10, x10, 0
                  slli x10, x10, 0
                  slli x1, x11, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 29f
                  la x10, test_done
                  jalr x0, x10, 0
                  28: j 29f
                  29: ori x9, x9, 1
                  csrr x10, 0x340
                  li x1, 30
                  sll x10, x10, x1
                  srl x10, x10, x1
                  slli x1, x10, 3
                  sll x9, x9, x1
                  or x28, x28, x9
                  csrr x10, 0x340
                  srli x10, x10, 2
                  beqz x10, 30f
                  li x1, 1
                  beq x10, x1, 31f
                  li x1, 2
                  beq x10, x1, 32f
                  li x1, 3
                  beq x10, x1, 33f
                  30: csrw 0x3a0, x28
                  j 34f
                  31: csrw 0x3a1, x28
                  j 34f
                  32: csrw 0x3a2, x28
                  j 34f
                  33: csrw 0x3a3, x28
                  34: nop
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
                  mret

store_fault_handler:
                  li x10, 0
                  csrw 0x340, x10
                  li x17, 0
                  0: csrr x10, 0x340
                  mv x1, x10
                  li x1, 0
                  beq x10, x1, 1f
                  1: csrr x11, 0x3b0
                  csrr x28, 0x3a0
                  j 17f
                  17: li x9, 4
                  csrr x10, 0x340
                  slli x10, x10, 30
                  srli x10, x10, 30
                  sub x1, x9, x10
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x9, x28, x1
                  slli x10, x10, 3
                  add x1, x1, x10
                  srl x9, x9, x1
                  slli x1, x9, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x10, 1
                  beq x1, x10, 21f
                  li x10, 2
                  beq x1, x10, 25f
                  li x10, 3
                  beq x1, x10, 27f
                  la x10, test_done
                  jalr x0, x10, 0
                  18: csrr x10, 0x340
                  mv x17, x11
                  addi x10, x10, 1
                  csrw 0x340, x10
                  li x11, 1
                  ble x11, x10, 19f
                  j 0b
                  19: la x10, test_done
                  jalr x0, x10, 0
                  20: j 18b
                  21: csrr x10, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x10, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x17, x1, 18b
                  23: bleu x11, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 24f
                  la x10, test_done
                  jalr x0, x10, 0
                  24: j 29f
                  25: csrr x10, 0x343
                  srli x10, x10, 2
                  slli x1, x11, 2
                  srli x1, x1, 2
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 26f
                  la x10, test_done
                  jalr x0, x10, 0
                  26: j 29f
                  27: csrr x10, 0x343
                  srli x10, x10, 2
                  srli x10, x10, 0
                  slli x10, x10, 0
                  slli x1, x11, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x10, x1, 18b
                  andi x1, x9, 128
                  beqz x1, 29f
                  la x10, test_done
                  jalr x0, x10, 0
                  28: j 29f
                  29: ori x9, x9, 3
                  csrr x10, 0x340
                  li x1, 30
                  sll x10, x10, x1
                  srl x10, x10, x1
                  slli x1, x10, 3
                  sll x9, x9, x1
                  or x28, x28, x9
                  csrr x10, 0x340
                  srli x10, x10, 2
                  beqz x10, 30f
                  li x1, 1
                  beq x10, x1, 31f
                  li x1, 2
                  beq x10, x1, 32f
                  li x1, 3
                  beq x10, x1, 33f
                  30: csrw 0x3a0, x28
                  j 34f
                  31: csrw 0x3a1, x28
                  j 34f
                  32: csrw 0x3a2, x28
                  j 34f
                  33: csrw 0x3a3, x28
                  34: nop
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
                  mret

ebreak_handler:   
                  csrr  x10, 0x341
                  addi  x10, x10, 4
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
                  mret

illegal_instr_handler:
                  csrr  x10, 0x341
                  addi  x10, x10, 4
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x10, 0x300 # MSTATUS;
                  csrr  x10, 0x304 # MIE;
                  csrr  x10, 0x344 # MIP;
                  csrrc x10, 0x344, x10 # MIP;
                  lw  x1, 4(x20)
                  lw  x2, 8(x20)
                  lw  x3, 12(x20)
                  lw  x4, 16(x20)
                  lw  x5, 20(x20)
                  lw  x6, 24(x20)
                  lw  x7, 28(x20)
                  lw  x8, 32(x20)
                  lw  x9, 36(x20)
                  lw  x10, 40(x20)
                  lw  x11, 44(x20)
                  lw  x12, 48(x20)
                  lw  x13, 52(x20)
                  lw  x14, 56(x20)
                  lw  x15, 60(x20)
                  lw  x16, 64(x20)
                  lw  x17, 68(x20)
                  lw  x18, 72(x20)
                  lw  x19, 76(x20)
                  lw  x20, 80(x20)
                  lw  x21, 84(x20)
                  lw  x22, 88(x20)
                  lw  x23, 92(x20)
                  lw  x24, 96(x20)
                  lw  x25, 100(x20)
                  lw  x26, 104(x20)
                  lw  x27, 108(x20)
                  lw  x28, 112(x20)
                  lw  x29, 116(x20)
                  lw  x30, 120(x20)
                  lw  x31, 124(x20)
                  addi x20, x20, 124
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
