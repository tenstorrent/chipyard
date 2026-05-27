.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x31, 0x40201123
                  csrw 0x301, x31
                  csrr x31, 0x301
kernel_sp:        
                  la x8, kernel_stack_end

trap_vec_init:    
                  la x31, mtvec_handler
                  ori x31, x31, 1

mepc_setup:       
                  la x31, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0xf8c1a355
                  li x1, 0xf1c412a6
                  li x2, 0x80000000
                  li x3, 0xfcf01f8b
                  li x4, 0x80000000
                  li x5, 0x80000000
                  li x6, 0xfccbf753
                  li x7, 0x5d0caa44
                  li x9, 0x80000000
                  li x10, 0x80000000
                  li x11, 0xff41c137
                  li x12, 0x80000000
                  li x13, 0x80000000
                  li x14, 0x80000000
                  li x15, 0x80000000
                  li x16, 0xf82680da
                  li x18, 0xff3f02de
                  li x19, 0x80000000
                  li x20, 0x80000000
                  li x21, 0xb4d9482b
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0x80000000
                  li x25, 0xf825d23c
                  li x26, 0xf8034580
                  li x27, 0xd70d6715
                  li x28, 0x80000000
                  li x29, 0xf84f32bd
                  li x30, 0xf33dc665
                  li x31, 0xa0ae7cd7
                  la x17, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
li x10, 8
                  vsetvli x31, x10, e16, m1
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
                  li x31, 0xc86cef7f
                  vslide1up.vx v0, v1, x31
                  vmv.v.v v0, v0
                  li x31, 0xf7bff357
                  vslide1up.vx v0, v1, x31
                  vmv.v.v v0, v0
                  li x31, 0x1c73d0bd
                  vslide1up.vx v0, v1, x31
                  vmv.v.v v0, v0
                  li x31, 0x5c18dc40
                  vslide1up.vx v0, v1, x31
                  li x31, 0xe12bd8bb
                  vslide1up.vx v1, v0, x31
                  vmv.v.v v0, v1
                  li x31, 0xdf44dd4f
                  vslide1up.vx v1, v0, x31
                  vmv.v.v v0, v1
                  li x31, 0xa97bb9a2
                  vslide1up.vx v1, v0, x31
                  vmv.v.v v0, v1
                  li x31, 0x993fb9ea
                  vslide1up.vx v1, v0, x31
                  li x31, 0x74c28497
                  vslide1up.vx v2, v0, x31
                  vmv.v.v v0, v2
                  li x31, 0x6b7a2b1d
                  vslide1up.vx v2, v0, x31
                  vmv.v.v v0, v2
                  li x31, 0xda64c39f
                  vslide1up.vx v2, v0, x31
                  vmv.v.v v0, v2
                  li x31, 0x9e4a8312
                  vslide1up.vx v2, v0, x31
                  li x31, 0xb75227c7
                  vslide1up.vx v3, v0, x31
                  vmv.v.v v0, v3
                  li x31, 0x59d3a0e9
                  vslide1up.vx v3, v0, x31
                  vmv.v.v v0, v3
                  li x31, 0x3c4fca3c
                  vslide1up.vx v3, v0, x31
                  vmv.v.v v0, v3
                  li x31, 0xc1dd9aa2
                  vslide1up.vx v3, v0, x31
                  li x31, 0x591dc7ed
                  vslide1up.vx v4, v0, x31
                  vmv.v.v v0, v4
                  li x31, 0x5b9dcd58
                  vslide1up.vx v4, v0, x31
                  vmv.v.v v0, v4
                  li x31, 0xd2f9a861
                  vslide1up.vx v4, v0, x31
                  vmv.v.v v0, v4
                  li x31, 0x645a05c0
                  vslide1up.vx v4, v0, x31
                  li x31, 0x70c2137a
                  vslide1up.vx v5, v0, x31
                  vmv.v.v v0, v5
                  li x31, 0x136cf7fb
                  vslide1up.vx v5, v0, x31
                  vmv.v.v v0, v5
                  li x31, 0x2166212
                  vslide1up.vx v5, v0, x31
                  vmv.v.v v0, v5
                  li x31, 0x2be909e3
                  vslide1up.vx v5, v0, x31
                  li x31, 0xc2b4fe24
                  vslide1up.vx v6, v0, x31
                  vmv.v.v v0, v6
                  li x31, 0x13b1c68a
                  vslide1up.vx v6, v0, x31
                  vmv.v.v v0, v6
                  li x31, 0x2321602f
                  vslide1up.vx v6, v0, x31
                  vmv.v.v v0, v6
                  li x31, 0xa3bbe8f9
                  vslide1up.vx v6, v0, x31
                  li x31, 0x9b17c957
                  vslide1up.vx v7, v0, x31
                  vmv.v.v v0, v7
                  li x31, 0x26212fcb
                  vslide1up.vx v7, v0, x31
                  vmv.v.v v0, v7
                  li x31, 0x29fafb10
                  vslide1up.vx v7, v0, x31
                  vmv.v.v v0, v7
                  li x31, 0xb03740c9
                  vslide1up.vx v7, v0, x31
                  li x31, 0x1a12d58f
                  vslide1up.vx v8, v0, x31
                  vmv.v.v v0, v8
                  li x31, 0xf0b814f2
                  vslide1up.vx v8, v0, x31
                  vmv.v.v v0, v8
                  li x31, 0x35facdb9
                  vslide1up.vx v8, v0, x31
                  vmv.v.v v0, v8
                  li x31, 0xefc2b1fd
                  vslide1up.vx v8, v0, x31
                  li x31, 0xc364e347
                  vslide1up.vx v9, v0, x31
                  vmv.v.v v0, v9
                  li x31, 0x57a59bb8
                  vslide1up.vx v9, v0, x31
                  vmv.v.v v0, v9
                  li x31, 0x68687245
                  vslide1up.vx v9, v0, x31
                  vmv.v.v v0, v9
                  li x31, 0x5706c5cd
                  vslide1up.vx v9, v0, x31
                  li x31, 0xc6c11364
                  vslide1up.vx v10, v0, x31
                  vmv.v.v v0, v10
                  li x31, 0xc4373673
                  vslide1up.vx v10, v0, x31
                  vmv.v.v v0, v10
                  li x31, 0x672311e4
                  vslide1up.vx v10, v0, x31
                  vmv.v.v v0, v10
                  li x31, 0xf9703d9e
                  vslide1up.vx v10, v0, x31
                  li x31, 0x3763eda7
                  vslide1up.vx v11, v0, x31
                  vmv.v.v v0, v11
                  li x31, 0x27fe5dc0
                  vslide1up.vx v11, v0, x31
                  vmv.v.v v0, v11
                  li x31, 0x5ba64302
                  vslide1up.vx v11, v0, x31
                  vmv.v.v v0, v11
                  li x31, 0x2abdb381
                  vslide1up.vx v11, v0, x31
                  li x31, 0x4c7d6f43
                  vslide1up.vx v12, v0, x31
                  vmv.v.v v0, v12
                  li x31, 0xbbb34662
                  vslide1up.vx v12, v0, x31
                  vmv.v.v v0, v12
                  li x31, 0x3f0bfd89
                  vslide1up.vx v12, v0, x31
                  vmv.v.v v0, v12
                  li x31, 0x6dc1ecff
                  vslide1up.vx v12, v0, x31
                  li x31, 0xcdb0acdb
                  vslide1up.vx v13, v0, x31
                  vmv.v.v v0, v13
                  li x31, 0x85f401c8
                  vslide1up.vx v13, v0, x31
                  vmv.v.v v0, v13
                  li x31, 0xd92809ac
                  vslide1up.vx v13, v0, x31
                  vmv.v.v v0, v13
                  li x31, 0xb99591a7
                  vslide1up.vx v13, v0, x31
                  li x31, 0x3db09903
                  vslide1up.vx v14, v0, x31
                  vmv.v.v v0, v14
                  li x31, 0x5d34fc0a
                  vslide1up.vx v14, v0, x31
                  vmv.v.v v0, v14
                  li x31, 0xac51c1e2
                  vslide1up.vx v14, v0, x31
                  vmv.v.v v0, v14
                  li x31, 0xb2145a36
                  vslide1up.vx v14, v0, x31
                  li x31, 0x69e1b936
                  vslide1up.vx v15, v0, x31
                  vmv.v.v v0, v15
                  li x31, 0x214b254a
                  vslide1up.vx v15, v0, x31
                  vmv.v.v v0, v15
                  li x31, 0xed5111f1
                  vslide1up.vx v15, v0, x31
                  vmv.v.v v0, v15
                  li x31, 0xb6e80dce
                  vslide1up.vx v15, v0, x31
                  li x31, 0x5db07212
                  vslide1up.vx v16, v0, x31
                  vmv.v.v v0, v16
                  li x31, 0x637ef4a8
                  vslide1up.vx v16, v0, x31
                  vmv.v.v v0, v16
                  li x31, 0x1753b03d
                  vslide1up.vx v16, v0, x31
                  vmv.v.v v0, v16
                  li x31, 0x33ba7f8b
                  vslide1up.vx v16, v0, x31
                  li x31, 0x9cdad9a6
                  vslide1up.vx v17, v0, x31
                  vmv.v.v v0, v17
                  li x31, 0x19a4e82
                  vslide1up.vx v17, v0, x31
                  vmv.v.v v0, v17
                  li x31, 0x3af7aef7
                  vslide1up.vx v17, v0, x31
                  vmv.v.v v0, v17
                  li x31, 0x5fe2450f
                  vslide1up.vx v17, v0, x31
                  li x31, 0xc83fe8eb
                  vslide1up.vx v18, v0, x31
                  vmv.v.v v0, v18
                  li x31, 0xeeb47d9a
                  vslide1up.vx v18, v0, x31
                  vmv.v.v v0, v18
                  li x31, 0x13b9b8c6
                  vslide1up.vx v18, v0, x31
                  vmv.v.v v0, v18
                  li x31, 0xf910e391
                  vslide1up.vx v18, v0, x31
                  li x31, 0x4cd12c2c
                  vslide1up.vx v19, v0, x31
                  vmv.v.v v0, v19
                  li x31, 0x21676810
                  vslide1up.vx v19, v0, x31
                  vmv.v.v v0, v19
                  li x31, 0xc4c57eb5
                  vslide1up.vx v19, v0, x31
                  vmv.v.v v0, v19
                  li x31, 0x76b5615e
                  vslide1up.vx v19, v0, x31
                  li x31, 0x7953468a
                  vslide1up.vx v20, v0, x31
                  vmv.v.v v0, v20
                  li x31, 0xb47f5a3a
                  vslide1up.vx v20, v0, x31
                  vmv.v.v v0, v20
                  li x31, 0x16c65df3
                  vslide1up.vx v20, v0, x31
                  vmv.v.v v0, v20
                  li x31, 0xb71ea62b
                  vslide1up.vx v20, v0, x31
                  li x31, 0x75239a26
                  vslide1up.vx v21, v0, x31
                  vmv.v.v v0, v21
                  li x31, 0xd69555c6
                  vslide1up.vx v21, v0, x31
                  vmv.v.v v0, v21
                  li x31, 0xc037d44c
                  vslide1up.vx v21, v0, x31
                  vmv.v.v v0, v21
                  li x31, 0xa8d54194
                  vslide1up.vx v21, v0, x31
                  li x31, 0xbb927800
                  vslide1up.vx v22, v0, x31
                  vmv.v.v v0, v22
                  li x31, 0x403354c2
                  vslide1up.vx v22, v0, x31
                  vmv.v.v v0, v22
                  li x31, 0xcc351838
                  vslide1up.vx v22, v0, x31
                  vmv.v.v v0, v22
                  li x31, 0x68273c8
                  vslide1up.vx v22, v0, x31
                  li x31, 0x5ddb8d81
                  vslide1up.vx v23, v0, x31
                  vmv.v.v v0, v23
                  li x31, 0x1623d672
                  vslide1up.vx v23, v0, x31
                  vmv.v.v v0, v23
                  li x31, 0x9dfbadc0
                  vslide1up.vx v23, v0, x31
                  vmv.v.v v0, v23
                  li x31, 0x86b2a203
                  vslide1up.vx v23, v0, x31
                  li x31, 0x65d9000b
                  vslide1up.vx v24, v0, x31
                  vmv.v.v v0, v24
                  li x31, 0x4bab7956
                  vslide1up.vx v24, v0, x31
                  vmv.v.v v0, v24
                  li x31, 0x6fc93a39
                  vslide1up.vx v24, v0, x31
                  vmv.v.v v0, v24
                  li x31, 0x68087306
                  vslide1up.vx v24, v0, x31
                  li x31, 0x44df7c60
                  vslide1up.vx v25, v0, x31
                  vmv.v.v v0, v25
                  li x31, 0x8fe10456
                  vslide1up.vx v25, v0, x31
                  vmv.v.v v0, v25
                  li x31, 0x651b05bc
                  vslide1up.vx v25, v0, x31
                  vmv.v.v v0, v25
                  li x31, 0xfcd4e19a
                  vslide1up.vx v25, v0, x31
                  li x31, 0x1171c0ee
                  vslide1up.vx v26, v0, x31
                  vmv.v.v v0, v26
                  li x31, 0x636d3323
                  vslide1up.vx v26, v0, x31
                  vmv.v.v v0, v26
                  li x31, 0xf717991e
                  vslide1up.vx v26, v0, x31
                  vmv.v.v v0, v26
                  li x31, 0x8843398b
                  vslide1up.vx v26, v0, x31
                  li x31, 0x993034bb
                  vslide1up.vx v27, v0, x31
                  vmv.v.v v0, v27
                  li x31, 0x5b62780f
                  vslide1up.vx v27, v0, x31
                  vmv.v.v v0, v27
                  li x31, 0x4f9018c6
                  vslide1up.vx v27, v0, x31
                  vmv.v.v v0, v27
                  li x31, 0x6a3529f4
                  vslide1up.vx v27, v0, x31
                  li x31, 0x53dc8803
                  vslide1up.vx v28, v0, x31
                  vmv.v.v v0, v28
                  li x31, 0x1ef186b9
                  vslide1up.vx v28, v0, x31
                  vmv.v.v v0, v28
                  li x31, 0x654af554
                  vslide1up.vx v28, v0, x31
                  vmv.v.v v0, v28
                  li x31, 0x753ab5ba
                  vslide1up.vx v28, v0, x31
                  li x31, 0xf72dec95
                  vslide1up.vx v29, v0, x31
                  vmv.v.v v0, v29
                  li x31, 0xf508ce8e
                  vslide1up.vx v29, v0, x31
                  vmv.v.v v0, v29
                  li x31, 0x8040da4b
                  vslide1up.vx v29, v0, x31
                  vmv.v.v v0, v29
                  li x31, 0xa5e1115f
                  vslide1up.vx v29, v0, x31
                  li x31, 0xdb616b6c
                  vslide1up.vx v30, v0, x31
                  vmv.v.v v0, v30
                  li x31, 0x8d18b2c2
                  vslide1up.vx v30, v0, x31
                  vmv.v.v v0, v30
                  li x31, 0xe750a7d9
                  vslide1up.vx v30, v0, x31
                  vmv.v.v v0, v30
                  li x31, 0x3b991546
                  vslide1up.vx v30, v0, x31
                  li x31, 0x1f345707
                  vslide1up.vx v31, v0, x31
                  vmv.v.v v0, v31
                  li x31, 0x70f18e0f
                  vslide1up.vx v31, v0, x31
                  vmv.v.v v0, v31
                  li x31, 0x1b16bc23
                  vslide1up.vx v31, v0, x31
                  vmv.v.v v0, v31
                  li x31, 0xb076f6ce
                  vslide1up.vx v31, v0, x31
li x10, 8
                  vsetvli x31, x10, e16, m1
main:             sltiu      s10, s11, 836
                  vsub.vx    v26,v16,s9
                  vmadd.vx   v9,t2,v9
                  sra        a5, s5, ra
                  vmulh.vx   v11,v16,s11
                  sll        gp, a1, a3
                  mulhu      s11, ra, zero
                  sll        s6, t4, tp
                  vfmin.vv   v20,v6,v30,v0.t
                  sll        zero, t0, a3
                  vsaddu.vi  v26,v28,0,v0.t
                  srli       s4, t4, 4
                  or         s9, a7, t3
                  sra        s9, s6, zero
                  slt        a3, s7, s5
                  vmul.vv    v23,v20,v21
                  and        s11, s9, s7
                  vsadd.vv   v24,v9,v22,v0.t
                  mulhsu     t3, t2, s8
                  vmulh.vx   v28,v21,t1
                  mulhsu     a3, gp, s3
                  slt        t1, s7, t4
                  vsub.vv    v11,v10,v17,v0.t
                  xor        t6, a6, s9
                  vsaddu.vx  v4,v24,a6
                  sltiu      a5, s1, 758
                  rem        s2, a2, t6
                  mulhsu     a4, s3, t0
                  and        ra, zero, t1
                  slt        s2, t4, s4
                  srai       gp, a1, 24
                  slti       a5, a3, -202
                  sltu       gp, t3, a1
                  ori        s6, s7, 170
                  slt        a6, s6, t6
                  vrsub.vi   v1,v21,0,v0.t
                  sra        t2, a3, ra
                  mulh       a1, tp, t4
                  mulhu      s4, t1, a0
                  mulhu      tp, t6, s5
                  vslide1up.vx v21,v29,t5
                  vsub.vx    v27,v5,t2,v0.t
                  slli       sp, s2, 15
                  mulh       s5, t1, a0
                  srli       s9, a5, 8
                  auipc      s8, 1034342
                  vslideup.vx v28,v0,tp,v0.t
                  sltu       a4, zero, t2
                  and        s5, t1, t4
                  sltiu      s7, s8, 693
                  srai       a4, t1, 0
                  vsadd.vx   v2,v9,s4
                  vslide1up.vx v5,v16,zero,v0.t
                  sltu       a6, s2, s11
                  vfmax.vf   v4,v7,ft1,v0.t
                  mulhsu     a4, zero, a1
                  vrsub.vx   v16,v27,s10
                  ori        a0, a7, -399
                  vslidedown.vx v5,v11,s3,v0.t
                  addi       s11, a0, -456
                  div        a0, a6, a3
                  vsll.vv    v27,v17,v21
                  vslide1up.vx v25,v16,s8
                  divu       s10, t4, s7
                  vmadd.vx   v13,zero,v8
                  mul        t0, a5, s6
                  srl        s1, a0, t6
                  vslidedown.vi v23,v24,0
                  auipc      s4, 330923
                  mulhsu     s7, t0, s6
                  slli       tp, s0, 11
                  vslidedown.vi v13,v24,0
                  vfmax.vf   v31,v16,ft3,v0.t
                  sra        s1, sp, a0
                  mulhsu     t2, s6, tp
                  slli       t6, s2, 9
                  srli       t2, s2, 10
                  auipc      tp, 713157
                  vsadd.vi   v28,v4,0
                  ori        s8, t4, -412
                  vsadd.vi   v1,v7,0
                  andi       a2, s6, 636
                  vmul.vx    v26,v17,a1,v0.t
                  vmulhu.vv  v2,v7,v21
                  vadd.vx    v27,v12,tp,v0.t
                  vadd.vi    v9,v6,0,v0.t
                  vmul.vv    v6,v28,v5,v0.t
                  mulhu      a3, a3, a5
                  vadc.vim   v18,v0,0,v0
                  slt        a5, s0, s10
                  srai       t3, s11, 26
                  xor        gp, a6, gp
                  vadc.vim   v24,v1,0,v0
                  addi       a1, s7, 920
                  sll        s10, t2, t4
                  vmulh.vx   v1,v21,t1,v0.t
                  xor        s2, t3, s8
                  auipc      a3, 218950
                  vadc.vim   v5,v0,0,v0
                  mulhu      zero, s1, a6
                  srli       s9, gp, 2
                  slt        a5, s3, a1
                  xor        ra, s5, s8
                  divu       t6, s4, s0
                  vsub.vv    v27,v8,v14,v0.t
                  slt        a4, zero, s10
                  remu       s5, a1, zero
                  ori        gp, s7, 491
                  xori       t3, s9, 783
                  vsll.vi    v26,v28,0,v0.t
                  add        s2, a6, a0
                  sll        s10, s1, sp
                  slti       t2, a2, -437
                  vsll.vx    v21,v16,s7
                  auipc      a6, 420089
                  vmulh.vx   v22,v30,t0
                  srai       s1, s8, 12
                  rem        a6, a1, s11
                  vadd.vi    v3,v22,0,v0.t
                  vslidedown.vi v12,v5,0,v0.t
                  mulh       a6, s0, sp
                  vmul.vv    v0,v22,v29
                  remu       s6, t4, s7
                  add        sp, t6, s0
                  xor        tp, s0, s5
                  vrsub.vi   v26,v20,0
                  auipc      a5, 693991
                  vmul.vv    v27,v31,v27
                  vmulh.vv   v18,v10,v18
                  vrsub.vx   v14,v7,a7,v0.t
                  vrsub.vx   v13,v20,s6,v0.t
                  vslideup.vx v0,v9,a2
                  vfmin.vf   v13,v15,fa7
                  vfmin.vv   v18,v20,v20
                  or         t2, s5, s11
                  and        sp, s8, a6
                  vmadd.vv   v11,v5,v13
                  sll        tp, s3, t4
                  vadc.vxm   v20,v8,tp,v0
                  vadd.vv    v29,v4,v31,v0.t
                  vmadd.vv   v9,v20,v21,v0.t
                  lui        zero, 287628
                  or         s9, s0, s10
                  sub        a5, a6, sp
                  div        t1, s4, ra
                  vmulh.vx   v0,v24,s0
                  or         s9, a6, gp
                  sub        s9, a4, zero
                  srli       s2, s5, 17
                  mulhu      s7, s8, s7
                  add        s8, a0, gp
                  remu       a5, s0, s6
                  ori        t3, a7, 720
                  slli       s9, s4, 21
                  vsadd.vv   v29,v13,v8,v0.t
                  divu       a2, a6, a1
                  mulh       a3, s1, s5
                  vadd.vv    v25,v3,v21,v0.t
                  or         s3, a2, s5
                  divu       s3, a0, a2
                  addi       t0, t0, 412
                  andi       a3, s2, -160
                  vslide1up.vx v4,v31,t2
                  srli       sp, s4, 11
                  mulhu      t0, a5, s2
                  vmulh.vx   v19,v7,ra
                  sll        a6, t4, t0
                  vrsub.vi   v6,v9,0
                  mul        s9, s4, t1
                  mulh       s9, sp, ra
                  sltu       s5, s4, s1
                  slt        s8, s7, s3
                  andi       a1, gp, -681
                  vmul.vx    v21,v27,t5
                  vslide1up.vx v23,v17,t4
                  vmul.vx    v31,v21,a1,v0.t
                  xori       t2, zero, 899
                  sltu       gp, s3, s3
                  vfmin.vf   v2,v5,ft5
                  slt        zero, t5, tp
                  sltiu      ra, s9, -229
                  sra        t5, gp, s9
                  sll        t6, s8, s9
                  mulh       t6, s1, s4
                  srai       a2, a1, 9
                  xori       zero, s6, 839
                  srai       a6, a5, 0
                  sra        t1, a0, s8
                  vmulhu.vx  v4,v11,t6,v0.t
                  sub        s9, a6, t0
                  sll        s9, s6, s2
                  srai       t0, s10, 14
                  sra        a3, s4, s2
                  auipc      ra, 117752
                  slli       s5, a5, 3
                  mulhsu     s3, s8, s3
                  vfmin.vf   v26,v6,fs11,v0.t
                  vsub.vx    v0,v10,s6
                  add        t3, gp, a6
                  sub        s11, tp, a6
                  vslideup.vx v28,v6,a0,v0.t
                  srai       a2, s10, 0
                  vmulh.vx   v8,v14,t1,v0.t
                  and        sp, tp, s9
                  andi       s4, s2, -178
                  slt        sp, t4, t3
                  mulh       a5, a0, tp
                  srli       gp, a6, 21
                  remu       t3, a4, a7
                  srai       t3, s4, 16
                  sra        s6, s6, t3
                  srli       s4, a6, 5
                  mul        s5, t0, s8
                  vfmax.vv   v13,v17,v17,v0.t
                  xori       t2, s9, 959
                  and        zero, s2, t1
                  sltiu      a6, s7, 517
                  vadc.vim   v14,v22,0,v0
                  mulh       t5, t4, t2
                  mulhu      s2, s0, s9
                  vmadd.vx   v30,s8,v26,v0.t
                  sll        s4, a7, a2
                  vsll.vx    v24,v25,a2,v0.t
                  vadd.vv    v24,v4,v13
                  srai       t0, t0, 9
                  mulh       s3, t5, s0
                  vmul.vv    v25,v22,v23,v0.t
                  vfmin.vv   v5,v23,v11,v0.t
                  vsll.vi    v7,v29,0
                  addi       s10, s5, -680
                  vslide1up.vx v3,v7,a6,v0.t
                  sltiu      ra, t3, -345
                  srai       s10, s7, 1
                  vadc.vxm   v3,v28,t4,v0
                  vsub.vx    v7,v28,t6
                  sltiu      t1, zero, 845
                  vrsub.vx   v2,v28,t0
                  vslidedown.vi v12,v5,0,v0.t
                  auipc      t2, 1031336
                  remu       a6, s0, s6
                  sra        t1, s6, t5
                  vslideup.vi v10,v13,0,v0.t
                  or         sp, a6, zero
                  vmulh.vx   v25,v17,gp,v0.t
                  slli       s8, t4, 27
                  mul        s2, t4, gp
                  vsadd.vx   v31,v5,s6,v0.t
                  vadd.vi    v5,v26,0,v0.t
                  xori       t6, s1, -928
                  ori        t2, s3, -318
                  rem        s6, zero, s5
                  vmadd.vv   v27,v1,v4
                  rem        t5, t5, s11
                  vsaddu.vv  v15,v25,v19
                  vfmax.vv   v19,v16,v17,v0.t
                  rem        a0, a1, a7
                  srli       s7, s10, 26
                  slli       ra, t3, 16
                  mulhsu     a0, s0, a4
                  mulhu      gp, s7, t2
                  vrsub.vx   v27,v6,a1,v0.t
                  vfmax.vf   v10,v4,fs1,v0.t
                  vmulhu.vx  v18,v24,t2
                  vsaddu.vi  v7,v23,0,v0.t
                  vrsub.vi   v31,v14,0
                  vfmin.vf   v18,v26,fa6,v0.t
                  vmul.vx    v18,v8,gp,v0.t
                  vmulhu.vv  v20,v6,v27,v0.t
                  vmul.vv    v27,v24,v0,v0.t
                  xori       s3, t2, -891
                  auipc      t1, 171864
                  srl        sp, t0, a5
                  srl        s3, s11, s6
                  vmadd.vv   v9,v19,v26
                  vsll.vi    v30,v26,0,v0.t
                  sra        tp, s9, t6
                  andi       s3, a7, -604
                  vsll.vx    v28,v15,s9,v0.t
                  mulh       a3, a4, s5
                  rem        t0, s11, s0
                  vsub.vx    v8,v19,gp
                  sll        a1, a4, s5
                  vslidedown.vi v2,v30,0
                  slli       a1, s2, 2
                  auipc      s10, 269107
                  sll        a5, s3, s7
                  vfmin.vv   v22,v23,v14
                  vmulh.vv   v19,v16,v24,v0.t
                  mulhsu     t0, t6, s4
                  slti       a1, t6, 231
                  or         a4, s3, a7
                  xori       a4, t6, -442
                  vrsub.vi   v23,v1,0
                  sll        ra, a1, a4
                  remu       a5, s5, t1
                  slt        a3, s4, t2
                  vadc.vvm   v8,v27,v20,v0
                  vadc.vxm   v18,v20,a7,v0
                  sltiu      a5, zero, 165
                  vslide1up.vx v21,v8,s10,v0.t
                  vmadd.vv   v18,v21,v26
                  xor        t5, a7, a5
                  sltiu      s6, t5, -351
                  xor        a5, t3, s9
                  vslide1up.vx v18,v10,a1,v0.t
                  vmadd.vv   v9,v20,v18
                  vmadd.vv   v27,v24,v1
                  vsll.vx    v19,v31,t0,v0.t
                  vslidedown.vi v15,v6,0
                  vslidedown.vi v21,v25,0
                  sltiu      a0, a6, 1013
                  rem        s4, ra, a6
                  vmadd.vv   v11,v14,v17,v0.t
                  vsaddu.vx  v9,v30,t3,v0.t
                  and        s11, a0, tp
                  vmadd.vv   v7,v9,v27
                  slt        s2, t5, s3
                  add        a2, t2, a5
                  andi       t3, s11, -121
                  vadd.vi    v10,v26,0
                  srli       a0, sp, 28
                  vmul.vv    v16,v14,v1,v0.t
                  xor        a5, a1, a5
                  vsadd.vv   v7,v9,v23
                  vsadd.vi   v8,v1,0
                  vfmax.vv   v31,v14,v13,v0.t
                  xor        t0, gp, gp
                  or         s11, s8, t3
                  vrsub.vx   v31,v11,t3
                  slti       sp, s6, 349
                  vadc.vvm   v29,v11,v11,v0
                  sll        ra, t6, s9
                  addi       s2, t0, -849
                  vmulh.vv   v25,v28,v24
                  slti       a0, a3, -424
                  vsaddu.vx  v17,v8,s6
                  sra        t5, a3, a3
                  andi       s4, tp, -235
                  vmulh.vv   v31,v20,v19,v0.t
                  srl        s7, t2, s9
                  vrsub.vx   v3,v26,t0,v0.t
                  sltiu      t5, s0, -520
                  mul        a1, s9, t4
                  srai       tp, zero, 22
                  slt        ra, s1, t6
                  vsaddu.vv  v15,v8,v20
                  vslidedown.vi v5,v9,0
                  mulhu      a3, s0, ra
                  vfmax.vf   v21,v23,ft7
                  slli       a4, a5, 1
                  vfmax.vf   v24,v1,fa5
                  slli       a5, s8, 12
                  sltiu      s8, a6, -901
                  mulhsu     s4, zero, gp
                  or         s6, gp, s2
                  div        s2, s7, s7
                  rem        a0, tp, a6
                  slti       t1, zero, 1020
                  sltu       zero, s0, gp
                  vsll.vi    v26,v12,0,v0.t
                  vmadd.vx   v12,a6,v4
                  vmul.vv    v14,v26,v20,v0.t
                  srai       zero, s10, 5
                  vmul.vx    v1,v19,a1
                  vmul.vv    v1,v29,v0,v0.t
                  mulhu      a5, a5, a2
                  and        s10, s1, s9
                  sltiu      s10, zero, -27
                  vrsub.vx   v11,v23,a6
                  addi       a5, s7, -1004
                  mulhu      s5, s3, ra
                  srai       s9, s7, 13
                  mulh       s11, s2, s5
                  andi       s3, s1, -871
                  sub        a4, gp, s3
                  slli       t1, a5, 27
                  vmulhu.vx  v8,v10,t0
                  xor        t0, ra, s3
                  vmulh.vv   v12,v8,v25,v0.t
                  vfmax.vf   v23,v29,ft7,v0.t
                  sub        t1, s1, t4
                  vmulhu.vv  v2,v25,v27
                  add        t2, gp, s3
                  slt        s8, t4, t0
                  lui        s4, 556723
                  sltu       t1, a3, s1
                  auipc      s8, 352492
                  sll        s7, s9, s9
                  vsub.vv    v12,v15,v29,v0.t
                  addi       t3, s10, 30
                  slti       a6, a3, -447
                  vfmax.vf   v10,v24,ft5
                  mulhu      t5, s1, tp
                  xor        tp, s7, s4
                  srli       s4, a1, 9
                  rem        t1, a0, s6
                  sra        zero, a4, a5
                  vsaddu.vx  v26,v3,sp,v0.t
                  or         a6, s3, tp
                  slli       s5, s0, 1
                  slt        s10, s3, s6
                  sub        s10, ra, s2
                  srli       a5, s4, 0
                  lui        a4, 87097
                  mulhsu     s1, s1, s4
                  add        s9, s5, s10
                  vadc.vxm   v23,v8,a1,v0
                  auipc      a2, 844000
                  div        zero, ra, a5
                  auipc      a5, 235667
                  mulhsu     s10, a7, s8
                  sra        sp, a1, s2
                  vslidedown.vx v5,v7,t1
                  slti       s1, a6, 919
                  vsadd.vx   v4,v11,s4
                  slli       s1, t6, 21
                  mulhsu     zero, a3, s7
                  and        s6, a7, t2
                  slt        a0, t0, gp
                  andi       sp, ra, -612
                  slli       a2, s2, 24
                  sltiu      s11, s2, 818
                  slli       a4, a6, 25
                  or         sp, a0, t5
                  or         t6, s9, a6
                  and        s6, zero, t2
                  sltiu      a1, zero, 804
                  vslidedown.vi v28,v12,0,v0.t
                  lui        t3, 407646
                  remu       s1, a6, s5
                  srli       s6, s3, 28
                  xori       t5, s10, -751
                  slt        t6, t0, t2
                  vslidedown.vx v29,v6,t3,v0.t
                  mulh       tp, t0, tp
                  div        s7, a4, tp
                  mulh       a2, s10, a0
                  vmulh.vv   v1,v15,v3
                  divu       s11, s7, t2
                  vmadd.vx   v4,a5,v22
                  vsll.vi    v25,v23,0,v0.t
                  remu       t5, s8, a1
                  mulh       s5, s8, a0
                  srli       sp, sp, 26
                  sub        t1, t2, t2
                  slti       a5, s1, 459
                  srli       a0, ra, 25
                  vslideup.vx v19,v14,s1
                  mul        t2, t0, t0
                  andi       s7, zero, 449
                  xor        s11, t6, t5
                  vslidedown.vx v2,v12,tp
                  div        s2, t5, s0
                  slli       a0, s10, 2
                  vmulh.vx   v22,v8,a0,v0.t
                  lui        s11, 667938
                  or         a2, a7, gp
                  vfmax.vf   v21,v2,ft8
                  add        s3, a0, a5
                  sll        s8, a7, t2
                  sltu       ra, ra, s5
                  lui        zero, 445297
                  add        t0, t4, t0
                  and        t3, t1, tp
                  vmulh.vv   v8,v29,v28
                  remu       t0, s1, a6
                  lui        a5, 488213
                  vmulh.vv   v27,v28,v21,v0.t
                  sra        ra, gp, t0
                  vadd.vi    v8,v10,0,v0.t
                  xor        zero, s8, gp
                  vrsub.vi   v17,v25,0
                  mulhu      s3, tp, a7
                  mulhsu     sp, a6, s11
                  xor        t6, a7, a4
                  vsub.vv    v9,v21,v4,v0.t
                  mulhsu     s6, s0, s11
                  vmadd.vv   v15,v5,v13
                  vfmax.vv   v2,v28,v10,v0.t
                  srli       zero, a3, 13
                  auipc      t6, 211340
                  sub        sp, a7, s4
                  add        zero, a3, a1
                  vfmin.vf   v6,v29,fs7,v0.t
                  addi       t2, t4, -763
                  vfmin.vf   v31,v3,fs1
                  and        s10, s4, tp
                  vmulhu.vv  v25,v23,v12,v0.t
                  ori        s3, s6, 903
                  ori        a5, t3, -794
                  divu       t1, zero, s9
                  vmul.vv    v10,v13,v9,v0.t
                  sltu       s1, t3, ra
                  vmulh.vv   v8,v29,v6,v0.t
                  lui        t0, 566082
                  vsaddu.vi  v5,v20,0
                  vslidedown.vx v18,v31,s0,v0.t
                  slti       s4, s7, 291
                  srl        s6, a0, a1
                  vfmax.vv   v17,v22,v26,v0.t
                  vslide1up.vx v2,v23,t0,v0.t
                  sll        t2, zero, s9
                  xor        ra, t2, s6
                  vsaddu.vv  v16,v29,v25
                  slli       s5, t3, 6
                  mulhsu     t2, a5, t5
                  vfmin.vv   v25,v22,v1
                  vmulh.vv   v12,v15,v8
                  sltiu      sp, t5, -1008
                  slti       s3, t0, -257
                  mul        t0, a3, s11
                  sub        sp, ra, t3
                  vmulhu.vv  v5,v7,v31
                  andi       a2, s3, -382
                  vmadd.vv   v9,v27,v29,v0.t
                  srai       ra, t3, 26
                  or         a0, t4, s3
                  vsub.vx    v14,v24,t1
                  slli       a1, s10, 27
                  vadd.vv    v3,v26,v10,v0.t
                  vadc.vxm   v12,v21,s0,v0
                  vsub.vv    v9,v3,v10,v0.t
                  xori       a0, t6, 1013
                  xori       ra, zero, -291
                  vsub.vx    v0,v15,s5
                  vsadd.vx   v24,v24,sp
                  add        s8, t2, t6
                  or         s8, s5, a4
                  slti       t2, tp, 718
                  vslidedown.vx v20,v0,t5
                  rem        a0, s0, s0
                  vmulh.vx   v30,v3,s10,v0.t
                  vslide1up.vx v4,v1,s3
                  vfmin.vv   v1,v17,v5
                  vfmin.vv   v8,v16,v9
                  mulh       gp, s2, s4
                  slti       t6, tp, 291
                  vmulh.vv   v31,v23,v18,v0.t
                  vmulhu.vx  v13,v2,s3
                  add        s10, a1, a4
                  srl        zero, s6, s8
                  srai       a6, s10, 24
                  vmadd.vx   v22,sp,v6
                  vfmax.vf   v18,v24,fs10
                  vrsub.vx   v27,v12,s5,v0.t
                  sll        s8, s6, s3
                  rem        a6, s11, t4
                  vslidedown.vi v9,v10,0,v0.t
                  and        s2, a3, a2
                  srl        t0, a2, ra
                  add        s9, sp, t2
                  sub        gp, a6, t1
                  slti       ra, t1, 880
                  vslideup.vi v4,v2,0,v0.t
                  vslide1up.vx v16,v22,gp,v0.t
                  mulhsu     sp, s2, t5
                  and        s1, s11, s8
                  vslidedown.vx v16,v15,s2,v0.t
                  vmulh.vx   v19,v25,a2
                  ori        gp, tp, 890
                  and        tp, s1, gp
                  sll        s7, s10, zero
                  vmulh.vv   v20,v24,v1,v0.t
                  slti       a1, a7, -11
                  and        a3, s4, a1
                  mul        t1, s8, s0
                  slt        s2, zero, s3
                  xor        a5, t4, a5
                  sra        t0, gp, a1
                  vsaddu.vi  v2,v18,0,v0.t
                  vmulhu.vv  v19,v31,v10,v0.t
                  srli       t3, a1, 9
                  srai       t2, t0, 1
                  remu       a5, s6, zero
                  sltu       s5, a2, s4
                  vslidedown.vi v29,v12,0,v0.t
                  srai       s6, s7, 30
                  sltu       a2, a4, tp
                  vfmax.vv   v16,v5,v20,v0.t
                  remu       a5, a4, t5
                  mulh       sp, t3, t4
                  rem        zero, s3, t2
                  ori        zero, t3, -712
                  add        s4, t5, t3
                  sltiu      a4, s11, 224
                  sll        s10, t1, s3
                  vmul.vv    v14,v1,v10
                  or         a6, a6, a6
                  vsadd.vi   v15,v1,0
                  remu       a2, t0, s9
                  vslideup.vx v27,v12,s1,v0.t
                  slli       s9, s10, 9
                  vfmax.vf   v2,v4,fs11
                  srli       tp, t6, 15
                  vslide1up.vx v0,v26,t2
                  mulhsu     t0, tp, s0
                  addi       a5, s8, 856
                  vsll.vi    v6,v29,0
                  vsll.vv    v6,v14,v19,v0.t
                  lui        s3, 704491
                  mulhsu     s9, a4, s3
                  divu       s8, a1, s2
                  srai       s1, a0, 24
                  vmulhu.vv  v31,v15,v20
                  sltu       a2, t3, s6
                  mulhsu     t0, gp, s4
                  vfmax.vf   v0,v6,fa7
                  xor        s11, a7, s9
                  lui        s9, 669993
                  vadd.vi    v31,v23,0
                  mul        t6, a2, gp
                  sltiu      s10, ra, 971
                  ori        s3, s10, -485
                  xori       t1, ra, -84
                  mulhsu     t1, t3, zero
                  xori       a0, s9, -637
                  vsll.vx    v29,v17,t4,v0.t
                  vmulh.vx   v2,v4,s2
                  remu       a1, a7, s7
                  slli       t0, zero, 24
                  vmulh.vv   v28,v30,v8,v0.t
                  vrsub.vx   v13,v11,ra,v0.t
                  mulh       t0, s5, t6
                  div        a4, s4, a3
                  mulh       s7, a5, a4
                  vsub.vv    v17,v0,v7,v0.t
                  vmulhu.vv  v19,v24,v18,v0.t
                  sra        s6, a0, t5
                  andi       zero, s11, 646
                  lui        t2, 105660
                  sub        a2, s5, t6
                  sra        t2, s0, s10
                  vslide1up.vx v28,v4,s4
                  ori        a2, a5, 775
                  divu       s11, a6, tp
                  and        gp, t5, s4
                  vsadd.vi   v14,v4,0,v0.t
                  xori       t6, s4, 287
                  mulhsu     s9, s9, a0
                  xor        s11, t0, t6
                  vfmin.vv   v11,v24,v0
                  xori       s11, s1, 212
                  vsub.vx    v17,v21,a4,v0.t
                  remu       a1, s1, s1
                  slt        a0, a6, s11
                  vslidedown.vi v17,v23,0
                  auipc      a5, 368162
                  vfmin.vv   v17,v18,v13,v0.t
                  sra        t5, s11, a1
                  mul        t1, s4, a4
                  vsll.vv    v15,v31,v6
                  vslideup.vx v4,v30,t0
                  vadd.vx    v30,v2,s1,v0.t
                  srai       a0, s0, 29
                  remu       zero, s1, ra
                  addi       t2, t4, 138
                  srli       tp, s7, 12
                  lui        zero, 393992
                  slti       s11, s7, -142
                  remu       t2, s0, a1
                  vmulh.vx   v24,v4,s9
                  slti       tp, t3, -856
                  mulhu      t5, s11, t6
                  mulhu      t3, s6, t4
                  vsaddu.vi  v31,v31,0
                  rem        s1, t1, s9
                  vslidedown.vx v10,v8,s7,v0.t
                  and        s7, s0, t0
                  mulhsu     zero, a0, s4
                  vsaddu.vv  v5,v20,v0
                  vmulhu.vv  v8,v2,v27
                  or         t3, t0, a4
                  sra        s8, t4, s4
                  divu       a2, a5, s0
                  auipc      s1, 185184
                  slli       s7, s1, 28
                  vsadd.vi   v17,v12,0
                  sltiu      t1, t4, -845
                  sll        ra, ra, s3
                  auipc      gp, 412953
                  vmadd.vx   v22,t3,v10,v0.t
                  mul        s10, s3, s8
                  add        ra, s1, tp
                  auipc      s11, 393096
                  and        t0, t4, a6
                  vslidedown.vx v11,v29,a4,v0.t
                  sltu       t2, s9, s4
                  sub        s3, s2, t5
                  sltiu      ra, s8, 853
                  sll        s1, t5, a7
                  slti       sp, a3, -696
                  srl        a6, a3, tp
                  addi       s11, s9, 392
                  ori        tp, t2, -482
                  lui        a2, 278882
                  mulhsu     a4, s5, t1
                  divu       s1, a5, t6
                  vmadd.vx   v23,sp,v17,v0.t
                  mulhu      t3, gp, gp
                  srl        s4, s0, a5
                  lui        tp, 268733
                  div        s9, a7, a6
                  vsll.vv    v8,v13,v1,v0.t
                  vslideup.vx v5,v17,s2,v0.t
                  vsll.vi    v29,v16,0,v0.t
                  sltiu      s3, zero, 802
                  vslide1up.vx v11,v2,s8,v0.t
                  div        tp, t6, t3
                  srli       a4, t1, 29
                  srai       sp, tp, 12
                  sll        t2, t3, s11
                  vslideup.vi v0,v24,0
                  vslidedown.vi v1,v5,0,v0.t
                  slti       a1, t4, -886
                  mulhsu     t5, a6, s0
                  vmulh.vv   v16,v23,v1,v0.t
                  vrsub.vx   v3,v25,s8
                  vsadd.vv   v0,v7,v7
                  vmulh.vv   v1,v16,v2
                  vmadd.vx   v20,t4,v7,v0.t
                  auipc      s6, 914841
                  xori       a6, s2, 746
                  vsub.vx    v17,v20,t3
                  sltiu      a0, t3, -363
                  sra        t3, t3, t3
                  vsll.vv    v0,v3,v9
                  srli       ra, a0, 14
                  vadd.vx    v31,v16,s11
                  lui        gp, 584437
                  sltiu      s6, tp, 810
                  add        s10, zero, s11
                  vsadd.vi   v31,v21,0,v0.t
                  sll        a0, a5, s3
                  mulhsu     a0, gp, s3
                  vfmax.vv   v16,v17,v15
                  vsadd.vv   v16,v3,v1,v0.t
                  sra        a5, a6, s0
                  vslide1up.vx v22,v8,a4
                  vmadd.vv   v16,v13,v22
                  vmulh.vx   v3,v20,s11,v0.t
                  and        s6, t4, ra
                  vmadd.vx   v24,t5,v27
                  vsll.vi    v12,v5,0,v0.t
                  div        s4, s3, a3
                  sll        s8, s11, a7
                  vsadd.vx   v1,v28,s5
                  vadc.vim   v28,v4,0,v0
                  lui        s1, 571534
                  vslide1up.vx v30,v19,t6,v0.t
                  sltu       t5, s1, t4
                  vslidedown.vi v1,v12,0
                  sltu       zero, a2, t3
                  vsadd.vx   v27,v23,a1
                  sll        s4, a4, s5
                  xor        zero, gp, s4
                  vsadd.vi   v4,v0,0,v0.t
                  mulh       t2, ra, t1
                  vslide1up.vx v11,v3,s0,v0.t
                  andi       s10, a4, -741
                  sltu       s1, a5, t4
                  sub        t6, t5, s0
                  xori       sp, t2, -656
                  srli       sp, t0, 3
                  mulhu      a6, t4, a1
                  vmadd.vx   v13,a2,v23,v0.t
                  mulh       a3, s10, s0
                  vslide1up.vx v19,v15,s3
                  slli       tp, a4, 24
                  sll        a6, s1, a1
                  sra        ra, a4, zero
                  vsadd.vx   v11,v26,a4,v0.t
                  mulh       s2, s2, s4
                  vmul.vv    v26,v3,v28,v0.t
                  div        s10, s1, s4
                  add        ra, s4, zero
                  auipc      s1, 649888
                  vmulhu.vv  v12,v7,v27
                  vmadd.vv   v7,v20,v15
                  divu       t1, a5, s2
                  vmul.vv    v1,v6,v8
                  sra        sp, t2, t5
                  vfmax.vf   v21,v15,fa5,v0.t
                  vslideup.vi v28,v26,0,v0.t
                  srl        a4, zero, t5
                  vsub.vv    v3,v5,v20,v0.t
                  divu       t0, t2, a3
                  srai       ra, s10, 30
                  vrsub.vx   v26,v26,ra,v0.t
                  vslide1up.vx v31,v16,s3
                  vrsub.vx   v23,v24,a3,v0.t
                  mulhu      s1, s0, a2
                  srl        s11, s9, s10
                  or         ra, s4, s4
                  sltu       s4, t4, t3
                  vslide1up.vx v8,v28,a3,v0.t
                  vsaddu.vv  v26,v28,v30
                  vslideup.vi v17,v13,0,v0.t
                  mulh       s10, ra, a6
                  srl        s4, s10, s10
                  slt        tp, s2, s10
                  vfmin.vf   v1,v5,ft10,v0.t
                  slt        gp, a0, t4
                  ori        gp, s10, 1019
                  remu       t0, a1, s9
                  lui        s8, 810212
                  add        t3, s7, a6
                  vslideup.vx v2,v6,s0,v0.t
                  vmul.vv    v31,v16,v2,v0.t
                  divu       s9, a0, a0
                  andi       a4, tp, -676
                  divu       s2, s11, zero
                  vslide1up.vx v29,v7,t6
                  xor        sp, t5, s10
                  div        ra, s3, a6
                  vslideup.vx v21,v23,s2,v0.t
                  mulh       zero, t3, tp
                  vmulh.vv   v3,v19,v20,v0.t
                  slti       a1, zero, 758
                  mulhsu     a4, s9, a5
                  xor        s4, a3, s7
                  add        s7, ra, t3
                  vmul.vv    v17,v7,v21,v0.t
                  add        s10, s10, t1
                  div        s8, zero, s2
                  lui        t0, 408601
                  xor        s11, t5, t0
                  vmadd.vv   v30,v7,v11,v0.t
                  srl        s7, s3, s8
                  or         a5, a1, t0
                  srl        s5, gp, s4
                  vslidedown.vx v21,v30,a4,v0.t
                  add        s4, a1, a7
                  srl        a0, s2, a6
                  ori        s1, s4, -4
                  xori       t2, t3, 358
                  vrsub.vi   v30,v24,0,v0.t
                  vadc.vvm   v4,v13,v11,v0
                  addi       t5, t5, 866
                  sub        t2, sp, a1
                  auipc      a2, 361188
                  sltiu      a4, s0, -490
                  andi       sp, s6, -971
                  mulh       t3, s1, s3
                  srli       zero, s8, 3
                  add        a2, t2, a5
                  div        s2, t4, t2
                  vslide1up.vx v16,v31,s7
                  vmadd.vv   v31,v14,v2
                  vfmax.vf   v1,v12,fa6
                  sra        zero, s7, t3
                  rem        s9, a1, t0
                  srl        s7, a5, a5
                  vmadd.vx   v27,s6,v4,v0.t
                  vsll.vv    v6,v13,v3,v0.t
                  auipc      s5, 450733
                  and        s9, a6, s11
                  mulhsu     s4, ra, zero
                  vfmax.vf   v25,v28,fa2
                  vrsub.vi   v5,v13,0
                  auipc      a0, 891843
                  mulh       t5, a0, t5
                  vmulh.vx   v8,v9,t3,v0.t
                  vmulhu.vx  v10,v11,t6,v0.t
                  mul        tp, s7, s11
                  rem        a2, a7, s10
                  vfmax.vf   v13,v19,fa5,v0.t
                  mulhu      tp, s2, t5
                  vslidedown.vi v23,v17,0
                  slti       a4, t3, -882
                  sub        a0, t5, s4
                  div        t3, a7, s7
                  sra        a6, a7, t0
                  vmul.vv    v30,v3,v16
                  mulh       s7, t6, s3
                  vslide1up.vx v23,v20,t1,v0.t
                  auipc      t0, 483517
                  mulhsu     s7, s1, ra
                  vslideup.vx v26,v14,a7
                  sll        sp, t4, a4
                  vfmin.vv   v16,v26,v25,v0.t
                  rem        gp, t0, s5
                  srl        a2, a5, s5
                  ori        ra, s0, 3
                  xori       a6, t2, -139
                  srl        a4, t5, s8
                  vmulh.vx   v27,v29,s11
                  vsadd.vx   v13,v11,s10
                  vrsub.vi   v1,v29,0,v0.t
                  srli       s9, s7, 20
                  vslidedown.vi v19,v27,0,v0.t
                  vmulhu.vv  v11,v8,v2,v0.t
                  srli       a1, t5, 16
                  or         s3, t3, sp
                  vslidedown.vi v8,v23,0,v0.t
                  vslideup.vi v24,v8,0
                  vmulh.vx   v0,v29,t5
                  vslide1up.vx v19,v1,t5
                  sra        s11, s7, t3
                  vslide1up.vx v8,v1,a4,v0.t
                  vslideup.vi v12,v27,0
                  vsll.vx    v0,v19,a5
                  vsadd.vv   v3,v15,v26,v0.t
                  srli       tp, t0, 18
                  vrsub.vx   v3,v24,s4
                  mulhsu     gp, zero, t2
                  sll        s2, sp, a3
                  vfmin.vv   v7,v26,v21,v0.t
                  vadc.vvm   v12,v16,v20,v0
                  slti       t2, t3, -338
                  add        gp, a2, s7
                  divu       s1, a6, t1
                  ori        sp, s9, 506
                  vslidedown.vi v21,v31,0
                  vsadd.vv   v23,v14,v26,v0.t
                  vadc.vim   v28,v7,0,v0
                  addi       s7, s1, -792
                  ori        gp, gp, -864
                  addi       ra, a2, -314
                  ori        s11, a3, -818
                  auipc      a2, 119812
                  mulh       s5, ra, t3
                  xori       sp, t3, -379
                  andi       a2, t3, 870
                  vmulh.vx   v11,v13,sp,v0.t
                  ori        ra, s4, -148
                  srai       t0, s3, 12
                  xor        s7, gp, t4
                  mulhsu     t3, sp, s11
                  sub        a4, a3, s1
                  remu       t0, sp, s7
                  lui        t2, 909298
                  vmadd.vv   v22,v13,v17,v0.t
                  remu       t0, sp, a5
                  vsub.vv    v12,v24,v25,v0.t
                  mulhsu     a4, s5, s9
                  slli       a6, s0, 28
                  addi       a0, a5, 102
                  xori       t3, s3, -21
                  add        s1, t3, gp
                  ori        s5, s9, 148
                  sltu       s8, s11, a4
                  vfmax.vv   v18,v4,v31,v0.t
                  vslide1up.vx v1,v16,ra,v0.t
                  and        a6, a0, a0
                  vrsub.vi   v15,v1,0
                  xor        t1, s9, s1
                  addi       s9, s6, -898
                  vrsub.vi   v6,v17,0
                  slt        a0, s9, s10
                  vslideup.vx v1,v10,a2,v0.t
                  slti       t1, a1, 996
                  vmadd.vv   v31,v6,v12,v0.t
                  andi       a3, a7, 760
                  divu       a3, a0, t2
                  rem        sp, s0, t1
                  xori       zero, a1, -928
                  sub        t5, sp, s9
                  divu       gp, ra, sp
                  sll        a5, s5, s7
                  lui        a5, 75068
                  vadc.vvm   v19,v7,v12,v0
                  slti       s6, a6, -610
                  sll        a4, t4, t5
                  vsaddu.vv  v18,v10,v21,v0.t
                  vadc.vxm   v4,v14,a1,v0
                  vmulhu.vv  v29,v29,v25,v0.t
                  vmulhu.vv  v26,v9,v6
                  sltiu      s3, s5, 271
                  vfmin.vv   v31,v21,v5,v0.t
                  vmulhu.vv  v25,v18,v13,v0.t
                  or         t3, t0, a0
                  vslideup.vi v21,v24,0,v0.t
                  lui        s1, 729667
                  div        a5, a2, s7
                  vmulhu.vx  v12,v27,a2
                  mulhsu     s8, t5, a3
                  divu       a4, t4, s11
                  srl        s8, zero, s1
                  vmadd.vv   v11,v23,v20,v0.t
                  slli       s11, t1, 21
                  add        a5, s2, ra
                  vsaddu.vi  v27,v29,0,v0.t
                  xor        a6, s8, s10
                  xor        gp, a7, ra
                  sll        a5, s0, s6
                  vslideup.vi v24,v9,0
                  and        t6, s6, tp
                  sub        sp, s5, s2
                  vmulh.vv   v31,v3,v20,v0.t
                  or         s1, gp, s7
                  vmulh.vx   v1,v28,t2,v0.t
                  xor        a3, s11, t2
                  xor        s1, a5, s5
                  vsll.vx    v11,v25,s2
                  or         a0, tp, t4
                  vsaddu.vv  v30,v3,v6
                  slti       t1, a3, -234
                  vmulh.vx   v4,v10,s0
                  vfmax.vv   v0,v15,v24
                  vsadd.vx   v16,v27,tp
                  slli       s7, s9, 16
                  srai       zero, s5, 14
                  vmulhu.vv  v26,v11,v22,v0.t
                  slli       s1, t6, 21
                  vsub.vv    v1,v2,v25,v0.t
                  vfmin.vv   v3,v2,v24
                  ori        t3, t6, 222
                  srl        s3, s7, s7
                  mulh       a2, a4, a5
                  ori        s8, sp, -316
                  mulh       s5, a5, s2
                  vsub.vx    v25,v6,t1
                  add        a4, s11, a5
                  slti       s6, t0, -472
                  vsadd.vx   v2,v24,s2,v0.t
                  vsll.vi    v17,v29,0,v0.t
                  srli       t2, a3, 2
                  sltu       sp, tp, s7
                  srl        tp, t3, s7
                  vslideup.vi v16,v15,0,v0.t
                  sra        a3, a0, s0
                  vslidedown.vx v5,v8,a0
                  slli       t0, a3, 24
                  remu       a5, t0, s0
                  remu       a5, t3, s1
                  ori        s5, a5, -168
                  slli       a4, t2, 13
                  vrsub.vi   v18,v31,0,v0.t
                  sub        s5, s4, a1
                  divu       tp, a1, s9
                  srai       a5, s4, 15
                  addi       zero, s9, 205
                  vmulh.vx   v24,v16,a7,v0.t
                  add        a0, s4, a0
                  srai       s9, t0, 9
                  lui        t2, 235292
                  vmadd.vx   v4,a3,v2
                  mulhsu     a5, t6, a0
                  vmulh.vx   v29,v22,a1
                  sll        s5, gp, a4
                  slt        a3, a7, ra
                  vmulh.vx   v7,v14,s10
                  or         a3, a2, s7
                  sub        s11, gp, s9
                  vadc.vim   v18,v10,0,v0
                  vmulhu.vv  v26,v1,v2,v0.t
                  vfmin.vf   v17,v19,ft4,v0.t
                  srli       tp, s5, 25
                  srai       s10, t0, 26
                  slt        s2, t1, t2
                  vadc.vxm   v16,v10,a0,v0
                  mulh       ra, s11, tp
                  xor        tp, s8, s7
                  vsaddu.vv  v22,v25,v19,v0.t
                  vadc.vim   v19,v26,0,v0
                  vmulh.vx   v26,v29,s10,v0.t
                  vsadd.vx   v30,v27,t1
                  vsaddu.vv  v31,v1,v15,v0.t
                  srai       t3, s2, 9
                  vfmin.vf   v6,v23,ft4
                  sra        ra, t5, a4
                  vmulh.vx   v11,v8,a1,v0.t
                  ori        a2, t1, -409
                  vmulhu.vv  v3,v1,v26
                  sub        zero, a0, zero
                  and        zero, t1, s2
                  vadd.vv    v29,v3,v26,v0.t
                  mulh       s3, sp, a6
                  sltu       s1, s4, s10
                  addi       s9, a6, -165
                  vadd.vx    v22,v26,a4,v0.t
                  xori       t3, ra, 716
                  mulhu      a4, t0, zero
                  sltu       s7, s4, a0
                  mulhsu     a2, a5, s0
                  srli       t0, a6, 23
                  vrsub.vi   v8,v4,0,v0.t
                  lui        a0, 616790
                  vsll.vi    v3,v11,0,v0.t
                  vsub.vx    v22,v27,a0,v0.t
                  remu       a4, s6, zero
                  srli       s9, a6, 0
                  andi       s1, s8, 268
                  vslideup.vi v18,v14,0
                  auipc      t3, 205327
                  vfmin.vf   v11,v23,fa1
                  mulhu      a0, a4, t1
                  vslideup.vx v28,v3,t4,v0.t
                  mul        s10, zero, s2
                  mul        a3, t2, t2
                  sub        s7, s4, t1
                  add        t0, s0, s4
                  slli       sp, a3, 29
                  slt        s10, t4, t6
                  sltu       a5, s4, a5
                  vsaddu.vv  v24,v24,v16,v0.t
                  vadd.vv    v13,v0,v17
                  xor        t3, s1, s10
                  andi       a6, t4, -256
                  sra        zero, a4, a4
                  vslideup.vx v10,v26,a0,v0.t
                  vslide1up.vx v6,v2,a5
                  auipc      zero, 544783
                  mulhsu     s11, s8, tp
                  srl        t6, a4, s6
                  and        a5, s5, s1
                  vsadd.vi   v25,v21,0
                  vfmin.vf   v28,v12,fa3,v0.t
                  sltiu      a3, t3, -463
                  slt        a0, zero, s10
                  vslidedown.vi v21,v26,0,v0.t
                  vmulh.vv   v4,v12,v3
                  slti       a3, tp, 211
                  slli       a1, s11, 19
                  vrsub.vi   v20,v19,0,v0.t
                  remu       s9, t1, tp
                  div        s5, a7, t2
                  mulh       s4, a3, ra
                  rem        zero, t3, sp
                  slti       s7, ra, 761
                  vsadd.vi   v4,v6,0,v0.t
                  vrsub.vi   v4,v14,0,v0.t
                  rem        t3, s1, a1
                  vslidedown.vi v0,v14,0
                  vsub.vx    v23,v26,s10,v0.t
                  lui        a1, 950583
                  mulhu      t2, a2, t2
                  divu       ra, t6, s7
                  srai       s9, zero, 19
                  vmulh.vx   v25,v12,s10,v0.t
                  divu       t3, s10, t3
                  vmul.vv    v24,v4,v25,v0.t
                  rem        s3, s4, gp
                  vmadd.vv   v25,v21,v8,v0.t
                  mulhsu     t3, a2, s9
                  auipc      s10, 373660
                  vsadd.vx   v16,v30,t5
                  vmulhu.vv  v19,v26,v9
                  xor        t0, a6, tp
                  srli       s7, a2, 12
                  vmul.vv    v0,v2,v16
                  mulh       zero, t2, s6
                  mulh       s9, a6, t4
                  slli       s10, gp, 12
                  vmadd.vx   v0,s3,v22
                  remu       gp, s4, t1
                  sltu       a0, t3, a5
                  vmadd.vv   v17,v1,v25,v0.t
                  and        t3, a6, t2
                  lui        s1, 412608
                  vadd.vv    v31,v18,v21
                  vslide1up.vx v16,v13,t1,v0.t
                  mulh       s6, ra, a5
                  sra        a3, s10, t5
                  vsll.vx    v23,v5,a2,v0.t
                  vadd.vi    v29,v19,0,v0.t
                  divu       s1, s5, a4
                  srl        s7, a5, s10
                  mulhsu     t0, t0, t5
                  vsaddu.vv  v18,v31,v0
                  vsub.vx    v3,v14,s11,v0.t
                  vmulh.vx   v10,v12,t6,v0.t
                  vsll.vv    v10,v29,v21
                  sll        t6, sp, t1
                  srli       t0, tp, 2
                  remu       s9, a5, s9
                  vslide1up.vx v4,v19,t4
                  xor        s3, a2, a7
                  mulhsu     s7, s7, s11
                  vfmin.vf   v25,v23,ft0,v0.t
                  vslide1up.vx v26,v17,t1,v0.t
                  add        s7, s2, t5
                  lui        t3, 415079
                  rem        t0, s9, t2
                  sra        s8, t3, ra
                  auipc      a0, 515808
                  xor        s6, s10, a7
                  remu       t6, t4, s7
                  vmul.vv    v0,v11,v4
                  srai       sp, sp, 27
                  mulh       ra, s10, t2
                  mulhu      a0, s9, a6
                  div        a2, t1, s11
                  andi       ra, tp, -177
                  ori        a2, t5, 455
                  and        s11, t3, s0
                  mul        t1, t2, sp
                  vmadd.vx   v3,a6,v21
                  slt        t5, t2, t2
                  add        s2, ra, a3
                  vfmax.vf   v9,v5,fs6
                  srl        tp, t3, s3
                  andi       a5, a2, 159
                  and        s4, s9, s4
                  xori       a0, a6, -88
                  ori        tp, s11, 274
                  srai       a1, zero, 16
                  xori       t3, gp, 702
                  xor        s8, s10, t6
                  sub        sp, a7, t1
                  vmadd.vv   v3,v14,v19
                  divu       gp, s1, t4
                  vadd.vi    v25,v15,0
                  auipc      a2, 192325
                  or         a5, tp, s1
                  slli       s10, sp, 1
                  add        zero, s4, ra
                  sltu       gp, s8, sp
                  rem        s10, gp, t4
                  vadc.vvm   v27,v7,v19,v0
                  slli       s10, s3, 20
                  slti       a6, a7, 450
                  xori       a2, s4, 167
                  sll        a6, s9, a3
                  sll        s11, a4, s3
                  vslidedown.vx v29,v0,s7,v0.t
                  add        s10, a4, sp
                  vsaddu.vv  v3,v28,v8,v0.t
                  remu       t5, sp, a3
                  mulhu      a1, ra, a0
                  vmul.vv    v27,v16,v21,v0.t
                  xori       ra, ra, 1014
                  sub        t6, t1, s2
                  sub        s4, s10, a5
                  vmulhu.vv  v11,v8,v26,v0.t
                  vmulh.vx   v8,v21,a2
                  vsll.vx    v4,v24,t6
                  vsub.vv    v4,v29,v16
                  vadc.vim   v24,v10,0,v0
                  remu       s8, s8, s3
                  xor        sp, a6, s2
                  and        a5, s11, t2
                  vmulh.vv   v20,v27,v19
                  vrsub.vx   v26,v0,a0
                  vsub.vv    v9,v12,v12,v0.t
                  vfmin.vf   v15,v1,fs5,v0.t
                  divu       s8, s1, s11
                  sltiu      t5, ra, -845
                  lui        a5, 327787
                  rem        a4, s8, a1
                  vslide1up.vx v30,v5,s10,v0.t
                  addi       s2, s2, -518
                  vslide1up.vx v8,v13,s8
                  slt        a5, s10, s6
                  srli       s6, a3, 4
                  vslideup.vx v22,v24,s2
                  vmulhu.vv  v19,v20,v8,v0.t
                  rem        a0, t3, s4
                  mul        s1, s0, t3
                  vsadd.vv   v7,v24,v31,v0.t
                  auipc      a5, 484474
                  or         s1, zero, ra
                  slt        t3, a7, a7
                  add        s4, s11, a1
                  srai       gp, t2, 9
                  vmulh.vv   v29,v22,v23,v0.t
                  vmulh.vx   v19,v28,a0,v0.t
                  slli       t6, t2, 5
                  vrsub.vx   v31,v0,s10
                  sltu       a5, s4, a2
                  vsadd.vx   v18,v11,a3,v0.t
                  vmul.vv    v23,v2,v11,v0.t
                  vrsub.vi   v1,v5,0,v0.t
                  vmulhu.vx  v14,v22,t3,v0.t
                  or         t0, a5, s1
                  addi       a5, s7, -996
                  sltu       s2, a3, sp
                  andi       a4, t3, -527
                  mul        a3, a0, tp
                  vmulh.vv   v22,v20,v24
                  remu       s8, ra, tp
                  slti       a4, sp, -839
                  andi       t1, sp, 411
                  vsub.vv    v24,v1,v31,v0.t
                  sra        s6, t6, s4
                  addi       a0, s6, 225
                  sra        a4, a3, a5
                  sll        t3, a6, sp
                  vfmin.vv   v17,v4,v16
                  or         s10, s0, a0
                  add        t0, a5, zero
                  or         s9, s9, s8
                  mulhsu     t0, a1, s0
                  sltu       a2, t3, a4
                  addi       a2, ra, -191
                  sll        s1, a4, s2
                  vfmin.vf   v18,v17,ft3
                  rem        ra, zero, s4
                  addi       a4, a1, 702
                  vslidedown.vx v24,v0,s10,v0.t
                  div        s11, s1, a6
                  vadd.vi    v24,v25,0,v0.t
                  and        a1, t2, ra
                  and        a2, t6, s6
                  vmulhu.vx  v13,v2,sp,v0.t
                  remu       s1, s10, s9
                  vslide1up.vx v3,v4,a6,v0.t
                  ori        sp, s3, -223
                  srli       a3, s1, 10
                  remu       s3, s8, s4
                  xori       a3, t0, 585
                  remu       sp, s5, t1
                  remu       s10, ra, s7
                  auipc      t1, 947974
                  mul        a4, s1, a6
                  auipc      a2, 483995
                  andi       t1, a4, -767
                  srl        a0, s6, s8
                  vmulhu.vv  v17,v27,v5
                  vslide1up.vx v23,v19,s5
                  mul        sp, sp, a2
                  and        tp, s8, s7
                  vslidedown.vx v12,v10,s3,v0.t
                  remu       t6, sp, t0
                  or         gp, a0, a1
                  addi       a6, a5, -555
                  vmulhu.vv  v11,v8,v30
                  vmulhu.vv  v25,v13,v14,v0.t
                  vslidedown.vi v5,v24,0,v0.t
                  vsll.vv    v31,v4,v10,v0.t
                  slti       s3, tp, 259
                  ori        t0, a1, -546
                  vfmin.vf   v20,v5,ft10,v0.t
                  sltu       t2, s9, t1
                  vadc.vxm   v10,v22,a7,v0
                  xori       s11, gp, 715
                  srai       zero, ra, 15
                  mulh       s7, s11, s11
                  vadc.vxm   v28,v29,t5,v0
                  lui        t1, 980127
                  vmulh.vv   v8,v24,v24
                  sra        a4, a3, ra
                  vslidedown.vi v14,v2,0
                  vsub.vx    v13,v29,sp
                  auipc      t2, 1040505
                  ori        ra, t5, 69
                  auipc      s3, 376389
                  div        s1, s10, t0
                  xor        s5, a6, t1
                  vslideup.vi v21,v24,0
                  srl        a6, s1, sp
                  vfmin.vf   v4,v3,fs7
                  vsadd.vx   v11,v5,s10,v0.t
                  vslide1up.vx v28,v20,a0
                  vsub.vx    v6,v12,s7
                  sub        s2, s7, s8
                  div        sp, t1, t6
                  mul        a3, s5, a5
                  mulh       s3, s4, t2
                  srli       tp, s6, 0
                  vsadd.vi   v23,v21,0
                  xor        sp, a3, s7
                  add        a2, tp, a3
                  mulh       s4, s3, a2
                  sltiu      t0, s4, -65
                  vrsub.vx   v23,v30,t5,v0.t
                  slt        s1, s8, s2
                  vmulh.vx   v9,v25,s11,v0.t
                  vfmin.vf   v24,v5,fa2,v0.t
                  auipc      s4, 1037299
                  sltiu      tp, s2, 119
                  vmulhu.vx  v9,v6,t3,v0.t
                  ori        s11, ra, -544
                  andi       s9, a4, -523
                  vmul.vx    v13,v2,s10
                  div        a3, t3, zero
                  vfmin.vf   v7,v6,fs4
                  vslide1up.vx v30,v1,s4,v0.t
                  vadc.vvm   v26,v21,v23,v0
                  rem        a0, s10, a2
                  sltu       s9, s3, a7
                  srli       tp, s11, 6
                  vmul.vx    v3,v10,a2,v0.t
                  remu       t6, a1, a1
                  vslideup.vi v19,v29,0
                  auipc      s2, 608652
                  sltu       t6, t0, t1
                  slt        a3, tp, tp
                  mulhu      a5, s6, t4
                  addi       s9, t4, 275
                  vslidedown.vx v20,v10,sp,v0.t
                  vslidedown.vi v5,v21,0
                  slti       s2, tp, -695
                  vadc.vim   v19,v28,0,v0
                  vadc.vxm   v1,v12,a3,v0
                  remu       t5, t4, t3
                  vsll.vv    v8,v19,v9,v0.t
                  mul        s4, t3, s4
                  sll        ra, a0, a1
                  vmulh.vx   v29,v16,a7,v0.t
                  ori        zero, t3, -628
                  vmulh.vx   v12,v21,a2
                  vsadd.vv   v15,v31,v13
                  mulhsu     s2, s6, t1
                  mul        a6, t6, s9
                  vslideup.vx v1,v14,s10
                  slt        a1, a2, t2
                  vfmin.vv   v2,v1,v23,v0.t
                  sll        a4, a7, s7
                  vsub.vx    v16,v26,s7
                  sltiu      s2, a5, 111
                  vslideup.vi v22,v26,0
                  add        a2, t0, tp
                  vmulh.vx   v16,v13,s11
                  vsadd.vx   v11,v30,s2
                  srli       s8, a1, 9
                  andi       s11, s5, -497
                  sltiu      s9, s7, 728
                  lui        s10, 139758
                  vmul.vv    v17,v4,v6
                  add        s1, t4, s11
                  sltu       gp, s5, t4
                  vslide1up.vx v25,v14,s1
                  vfmax.vv   v14,v11,v29
                  auipc      gp, 911863
                  sra        t3, a6, s9
                  vsll.vv    v7,v10,v28
                  sll        a0, s4, s10
                  mulhsu     gp, t3, s9
                  sltu       s8, s3, t0
                  mulh       a4, s0, s11
                  slt        s2, t3, a1
                  vadc.vxm   v11,v3,t0,v0
                  divu       a6, a0, ra
                  add        t3, s0, sp
                  vrsub.vx   v27,v24,zero
                  vslideup.vi v15,v28,0
                  sll        sp, t3, t5
                  vslideup.vi v31,v19,0,v0.t
                  vadc.vim   v15,v21,0,v0
                  vmul.vx    v3,v19,t5
                  div        s10, s7, a0
                  slti       s11, ra, 337
                  vmulh.vv   v0,v23,v15
                  vsadd.vi   v1,v7,0,v0.t
                  vadc.vxm   v29,v31,s2,v0
                  vadc.vim   v29,v31,0,v0
                  vmadd.vx   v31,s9,v25
                  mulh       a5, a2, s11
                  sub        a4, a1, t4
                  or         sp, s0, s0
                  vadd.vi    v22,v25,0,v0.t
                  xori       t0, t4, -158
                  vadd.vx    v21,v11,t1
                  xor        t6, t6, a4
                  vmul.vv    v7,v13,v13,v0.t
                  vslide1up.vx v17,v16,a7
                  auipc      a6, 6286
                  mulhsu     s4, s9, a4
                  vmulhu.vx  v29,v1,s10,v0.t
                  xori       a2, ra, 602
                  sltiu      ra, s7, -16
                  sltiu      s7, s2, -640
                  sub        s8, a1, a4
                  vslideup.vx v24,v18,s8,v0.t
                  lui        s11, 935390
                  remu       tp, tp, gp
                  xori       ra, s3, 925
                  ori        a0, s7, 108
                  mulhsu     t2, zero, s2
                  vsll.vv    v4,v8,v21
                  vslide1up.vx v3,v16,gp,v0.t
                  divu       s3, t3, t6
                  rem        s10, zero, s9
                  or         s9, s11, a7
                  xor        s3, s9, s1
                  vslidedown.vx v9,v19,t5
                  vmul.vv    v18,v22,v26,v0.t
                  vmadd.vv   v5,v20,v0,v0.t
                  divu       t2, s5, s10
                  add        a1, t1, a2
                  vslidedown.vi v25,v28,0,v0.t
                  or         s8, s5, s4
                  vadc.vim   v9,v26,0,v0
                  remu       s4, s0, s10
                  div        t1, a1, t0
                  div        s4, s10, t2
                  srl        t5, s3, t4
                  remu       a3, t4, s7
                  vfmax.vv   v11,v11,v28
                  vadd.vv    v2,v4,v30
                  andi       s1, tp, 85
                  vsub.vv    v7,v11,v30
                  remu       zero, a7, t4
                  lui        a4, 480714
                  sltu       s5, zero, s2
                  vsll.vv    v11,v25,v14,v0.t
                  or         s5, s10, a0
                  rem        s3, s10, a7
                  mulhu      s6, t2, a1
                  mulhsu     t2, a7, s10
                  vadd.vi    v1,v12,0
                  vfmin.vv   v10,v7,v10
                  auipc      a0, 717149
                  vadc.vim   v24,v28,0,v0
                  srai       zero, t6, 23
                  andi       ra, s7, 976
                  mul        t2, a7, sp
                  slti       t6, a6, -466
                  slli       s8, s3, 23
                  vsub.vv    v26,v14,v12
                  remu       s3, sp, s1
                  mulhsu     t6, s9, a4
                  ori        t0, s9, -684
                  sra        t2, zero, sp
                  sll        sp, t6, t6
                  and        a3, gp, s8
                  vslidedown.vi v26,v17,0
                  sltu       gp, t3, sp
                  addi       s2, s10, -953
                  mulh       s5, a2, s3
                  vslidedown.vi v28,v22,0,v0.t
                  vslide1up.vx v6,v31,s7
                  vsub.vv    v19,v22,v11
                  vmul.vv    v9,v14,v6
                  xori       sp, s10, -855
                  vrsub.vi   v8,v26,0
                  slti       s1, t0, 112
                  and        t6, a0, sp
                  vsaddu.vx  v6,v30,s10
                  slt        t1, t0, t2
                  vsub.vv    v22,v28,v6,v0.t
                  ori        t0, t0, -896
                  slti       ra, a5, 999
                  vmulhu.vv  v11,v31,v15
                  lui        a0, 134402
                  sub        s4, a6, gp
                  rem        a0, gp, s8
                  slt        s10, t1, t0
                  vadd.vi    v10,v6,0
                  vslide1up.vx v12,v20,s7
                  vsub.vx    v29,v24,t4,v0.t
                  auipc      s3, 900822
                  slti       t3, a4, -645
                  xor        s9, tp, s4
                  remu       s6, t5, a5
                  div        s11, s8, a2
                  vslide1up.vx v7,v2,a6,v0.t
                  srl        s1, s1, t5
                  mulh       sp, tp, s6
                  vslide1up.vx v11,v26,t1
                  sub        s9, s11, s0
                  vsadd.vv   v9,v26,v5
                  sll        sp, tp, zero
                  mulh       t6, s2, a4
                  vmadd.vx   v16,s5,v26
                  sltu       zero, tp, t6
                  add        s1, s1, a6
                  vadc.vim   v11,v15,0,v0
                  sltiu      a4, a4, -241
                  vslide1up.vx v26,v24,t0,v0.t
                  vsll.vi    v26,v6,0,v0.t
                  sltiu      t5, a3, -601
                  sra        t3, s10, t2
                  remu       zero, s0, a6
                  vmulhu.vx  v7,v22,zero
                  vmadd.vx   v10,a1,v22
                  vslidedown.vx v13,v30,tp,v0.t
                  vslideup.vi v29,v15,0
                  auipc      tp, 651717
                  vmul.vv    v22,v19,v12
                  vsaddu.vx  v13,v28,a3
                  vslidedown.vi v17,v0,0
                  ori        a1, s3, 790
                  vslide1up.vx v8,v12,a0,v0.t
                  sub        a3, t5, s4
                  sra        s11, s9, s2
                  vrsub.vi   v7,v20,0
                  vfmin.vv   v19,v25,v11,v0.t
                  mulhu      s1, a3, s11
                  addi       s4, t2, -504
                  vslide1up.vx v8,v9,a0,v0.t
                  srli       a4, s6, 1
                  mulhsu     tp, sp, ra
                  sltiu      s3, s2, 417
                  vslidedown.vi v10,v20,0,v0.t
                  mul        a6, s0, s1
                  divu       s8, t2, s4
                  mulhu      s5, s10, gp
                  vmul.vx    v9,v9,tp
                  xor        s2, t3, a6
                  and        s2, t4, t6
                  lui        t5, 535034
                  vmulh.vv   v25,v27,v31
                  srli       a4, s3, 20
                  vadd.vv    v24,v9,v27,v0.t
                  vmulhu.vx  v31,v25,s10,v0.t
                  andi       s2, a0, -750
                  mulhu      tp, tp, a5
                  vmulhu.vv  v10,v26,v7,v0.t
                  srai       gp, s5, 16
                  div        s1, s11, t3
                  addi       t6, s9, 897
                  mulhsu     s11, t2, sp
                  vrsub.vx   v4,v11,a6
                  add        s5, t5, tp
                  mulh       s5, a7, t6
                  vslide1up.vx v15,v25,sp
                  vadc.vim   v21,v9,0,v0
                  vadc.vim   v20,v2,0,v0
                  rem        a1, t2, s0
                  vsub.vx    v22,v23,s5,v0.t
                  vmulhu.vx  v23,v23,t2
                  or         a6, s11, t0
                  addi       s11, a7, -123
                  and        s1, s7, t1
                  srai       a3, s7, 3
                  vfmax.vv   v22,v7,v3
                  vslidedown.vi v0,v10,0
                  vadc.vxm   v27,v15,s3,v0
                  vslide1up.vx v10,v4,tp
                  vfmax.vf   v23,v27,fa3,v0.t
                  mulh       s4, a2, a1
                  sra        gp, gp, t2
                  vfmin.vv   v24,v22,v2,v0.t
                  sub        ra, a2, s2
                  vslide1up.vx v5,v14,t3,v0.t
                  vmadd.vx   v30,gp,v10,v0.t
                  div        gp, s5, s3
                  xor        s9, zero, s6
                  div        s8, t5, s2
                  mulhu      a0, a7, t5
                  remu       s6, a6, s10
                  vsadd.vx   v19,v20,t3,v0.t
                  slli       s6, a7, 8
                  vrsub.vx   v18,v28,a0,v0.t
                  mulhu      s4, a3, s3
                  andi       sp, s1, 569
                  vsub.vv    v5,v21,v17,v0.t
                  vslideup.vx v29,v28,s10
                  srai       a3, a6, 27
                  vmulhu.vv  v21,v0,v21,v0.t
                  add        t6, a2, zero
                  remu       t3, t4, ra
                  rem        s6, a2, t1
                  rem        s5, sp, s2
                  slt        s5, t2, t4
                  sub        s2, s4, t2
                  vadc.vim   v5,v21,0,v0
                  srl        a5, s11, t6
                  vslidedown.vx v25,v28,t2,v0.t
                  sltiu      s5, s3, 843
                  vadc.vxm   v29,v19,a6,v0
                  slti       a2, ra, 63
                  vfmax.vv   v23,v0,v8
                  xor        zero, s11, s10
                  slti       s1, a4, 220
                  sra        s8, s0, t0
                  auipc      s5, 118062
                  sub        s1, a7, t0
                  div        t1, sp, t4
                  vmulh.vv   v24,v22,v7
                  sub        s4, s5, s7
                  mulhu      s4, t5, ra
                  srli       s1, a2, 6
                  and        a1, tp, a6
                  sll        a0, a3, tp
                  vslidedown.vx v16,v22,t6
                  or         s2, s6, s8
                  xori       t1, s7, 790
                  mul        tp, a5, t3
                  vsub.vx    v11,v7,s2,v0.t
                  srl        sp, s6, s3
                  add        a3, s2, s9
                  mulhu      s10, t4, s8
                  divu       s3, a2, t6
                  vmadd.vx   v24,s6,v2,v0.t
                  addi       a4, a4, -267
                  slt        a4, s4, s4
                  auipc      s2, 109968
                  rem        a5, s10, a4
                  sra        a1, a4, a0
                  sll        t0, a3, sp
                  sltiu      a5, s2, 265
                  vmadd.vv   v6,v14,v25,v0.t
                  srl        tp, s4, a0
                  vsadd.vx   v18,v1,a7
                  vsadd.vx   v30,v22,t4,v0.t
                  mulh       t1, t0, a7
                  vadd.vi    v23,v31,0
                  srl        a0, s7, t4
                  vsub.vv    v27,v13,v13,v0.t
                  slt        gp, a6, tp
                  vslidedown.vi v31,v4,0,v0.t
                  vmulh.vx   v7,v9,s1,v0.t
                  andi       s7, t6, 225
                  ori        a3, s5, -349
                  vadd.vi    v31,v5,0,v0.t
                  slti       s1, gp, 496
                  lui        s6, 338617
                  slli       tp, s2, 16
                  or         s5, s0, s8
                  mul        t3, s5, t3
                  or         sp, a7, s2
                  vslidedown.vx v25,v18,t3,v0.t
                  div        s11, a2, t1
                  vsaddu.vi  v1,v6,0
                  vsll.vi    v31,v17,0
                  sltu       tp, s6, t5
                  vadd.vx    v15,v10,s4,v0.t
                  sra        t1, s11, s8
                  vadd.vv    v7,v26,v5,v0.t
                  remu       a3, a7, ra
                  vmulh.vx   v19,v23,s3,v0.t
                  mul        t1, ra, tp
                  vrsub.vx   v7,v26,t4
                  slti       ra, s5, 1002
                  xori       ra, t4, 859
                  slli       a3, s10, 7
                  vsaddu.vi  v4,v7,0
                  remu       s1, t6, a1
                  slti       t1, sp, 388
                  mulhsu     s9, a6, a2
                  auipc      s10, 692599
                  vmul.vx    v28,v9,s8
                  vsub.vx    v24,v1,a6,v0.t
                  xori       s10, s9, -791
                  sltiu      s10, t2, 241
                  ori        t3, s1, 179
                  vslidedown.vx v19,v15,a3
                  vadc.vxm   v10,v9,zero,v0
                  vrsub.vx   v8,v9,ra,v0.t
                  sll        tp, a0, t1
                  vmulhu.vx  v26,v3,t4,v0.t
                  sub        tp, a6, gp
                  vsaddu.vv  v31,v23,v25,v0.t
                  sltiu      t1, a5, 973
                  vsaddu.vi  v19,v20,0
                  andi       zero, s4, 410
                  vslide1up.vx v29,v8,s4
                  andi       a6, ra, -919
                  vsub.vv    v11,v1,v15
                  sll        t3, s3, a4
                  andi       t2, a7, -979
                  vmulhu.vx  v28,v17,s4,v0.t
                  mul        t2, s0, sp
                  srl        t5, ra, a3
                  srai       t3, t5, 26
                  slli       a1, t0, 23
                  vmadd.vv   v20,v27,v11
                  vsaddu.vv  v13,v16,v17
                  div        s10, a2, sp
                  sltu       s5, t5, s6
                  srli       s4, s2, 28
                  vrsub.vx   v3,v18,t4
                  or         a1, s2, a3
                  mul        ra, ra, t4
                  xori       t3, a0, -251
                  vslideup.vi v12,v16,0
                  andi       tp, tp, -65
                  vmulh.vv   v27,v12,v16,v0.t
                  srli       t3, a1, 4
                  srl        s9, t6, s7
                  vslidedown.vi v9,v5,0,v0.t
                  mul        a5, gp, a7
                  slt        s10, t3, s4
                  vadc.vvm   v9,v12,v22,v0
                  xori       s3, s4, -176
                  vadc.vxm   v15,v14,a0,v0
                  vslideup.vx v6,v22,s7,v0.t
                  vsub.vv    v11,v5,v7
                  sltu       ra, s4, ra
                  div        s9, t3, s4
                  mulhu      a1, sp, t2
                  vslide1up.vx v3,v9,sp
                  vsadd.vi   v21,v10,0,v0.t
                  vsub.vx    v25,v19,s5,v0.t
                  sll        ra, s7, s0
                  sltu       zero, a4, s11
                  lui        s11, 712291
                  vslidedown.vx v7,v14,t3
                  andi       t1, s9, 774
                  sub        gp, s10, sp
                  slli       t5, t5, 24
                  auipc      a5, 953332
                  vmulh.vv   v15,v1,v9,v0.t
                  rem        ra, s10, s8
                  srl        t0, t2, s9
                  sltu       t2, a4, tp
                  mulhu      sp, t4, s5
                  mul        s5, s8, s6
                  mulhsu     a4, a4, t0
                  sra        a1, s9, ra
                  rem        t0, s3, a7
                  sll        s7, a6, s0
                  vsll.vi    v28,v17,0,v0.t
                  xor        s5, ra, a6
                  vsadd.vx   v3,v17,s10
                  vmulhu.vx  v17,v7,s3,v0.t
                  mul        t1, s10, s9
                  slti       s7, sp, 411
                  sltu       s7, s9, a4
                  vsadd.vv   v17,v14,v12
                  slti       s7, a6, -92
                  xor        a1, tp, s4
                  vsadd.vv   v4,v1,v19
                  xor        ra, a7, a4
                  vsadd.vi   v23,v30,0
                  xor        s11, t2, t1
                  remu       s3, s3, ra
                  srli       a1, s5, 25
                  srai       s5, t6, 2
                  or         zero, tp, a6
                  vmul.vx    v3,v28,s11,v0.t
                  vmadd.vv   v26,v6,v19,v0.t
                  sltiu      gp, a7, -344
                  vsll.vi    v15,v25,0
                  srl        tp, s1, a3
                  rem        t5, s4, s4
                  mulhsu     s8, s1, t3
                  vadc.vvm   v26,v27,v12,v0
                  remu       zero, s10, zero
                  and        s9, a3, sp
                  auipc      s5, 457700
                  vmadd.vv   v23,v21,v18
                  add        s10, t0, a1
                  vslide1up.vx v8,v11,a6
                  xor        a0, a5, a7
                  ori        s9, a2, -370
                  srli       a2, t2, 21
                  andi       s3, s3, -423
                  vadd.vx    v13,v14,t5
                  vsadd.vi   v5,v25,0
                  vsub.vv    v23,v2,v8,v0.t
                  andi       tp, s0, 712
                  remu       a6, s10, t3
                  mulhsu     t1, a6, s3
                  vmulhu.vx  v13,v7,a3
                  xor        t6, s4, s8
                  srai       a2, zero, 18
                  rem        s4, s2, s11
                  xori       a0, s9, -529
                  addi       t6, s6, 291
                  xor        a3, s8, a2
                  slt        zero, s2, s8
                  vsadd.vi   v5,v3,0
                  mulhu      a1, s8, a4
                  sll        a1, a3, s9
                  vmul.vx    v19,v11,s0,v0.t
                  vadc.vxm   v19,v8,a6,v0
                  vrsub.vx   v9,v3,a7,v0.t
                  slli       s4, s6, 23
                  vfmax.vf   v2,v4,fs10
                  slli       a6, tp, 25
                  srli       a6, t1, 20
                  vslide1up.vx v28,v21,ra
                  vadd.vv    v9,v4,v13,v0.t
                  sra        a1, gp, t3
                  divu       s11, t4, s6
                  lui        a3, 200843
                  mulhsu     s11, s10, s11
                  vmulh.vx   v2,v7,a4
                  vsll.vx    v10,v9,t5,v0.t
                  xori       s8, a0, 55
                  vmulh.vx   v14,v19,a5,v0.t
                  vadc.vxm   v21,v12,zero,v0
                  and        a0, t1, t3
                  vmadd.vx   v9,s6,v5
                  sra        t5, s6, s11
                  vsub.vx    v20,v18,s2,v0.t
                  vsll.vv    v0,v14,v27
                  sltiu      ra, s6, 4
                  vfmax.vf   v1,v21,ft7,v0.t
                  vrsub.vi   v26,v26,0,v0.t
                  vfmin.vf   v12,v7,ft11,v0.t
                  vslideup.vx v24,v17,s6
                  xor        s5, t1, a6
                  mulhsu     zero, s4, t4
                  vmulhu.vx  v14,v11,a1,v0.t
                  lui        t6, 131441
                  vslidedown.vx v28,v4,t1,v0.t
                  auipc      s3, 1047413
                  remu       s8, t3, s5
                  vmulh.vv   v17,v13,v30,v0.t
                  mulhsu     s2, a1, a7
                  vadd.vv    v4,v5,v29,v0.t
                  slti       s1, s10, -55
                  sltu       t2, ra, t3
                  vadd.vv    v18,v10,v24,v0.t
                  sltiu      a3, s6, -258
                  vsll.vx    v24,v9,s2
                  vmul.vx    v16,v25,t0
                  add        t3, a1, a6
                  vsub.vx    v2,v20,s2,v0.t
                  sub        s1, a6, s0
                  sra        t3, sp, t1
                  vsaddu.vv  v6,v28,v4,v0.t
                  xor        t6, t5, gp
                  addi       a6, a1, 593
                  vfmax.vv   v5,v5,v7,v0.t
                  lui        a3, 816889
                  or         s1, s8, s9
                  sll        s11, s0, gp
                  vslideup.vi v24,v13,0
                  or         zero, t0, sp
                  add        a1, a7, zero
                  ori        tp, s11, -194
                  sll        s7, s4, s2
                  vadd.vi    v1,v11,0,v0.t
                  vmul.vx    v27,v27,zero,v0.t
                  vadd.vx    v18,v22,a0,v0.t
                  auipc      zero, 292723
                  slti       t1, t1, 623
                  add        t1, t0, sp
                  sltiu      a0, a0, -653
                  vmulhu.vx  v23,v21,t4
                  vsll.vv    v0,v11,v26
                  vmulh.vx   v30,v8,a5,v0.t
                  addi       t3, s2, 933
                  vfmin.vf   v4,v22,ft8,v0.t
                  vadc.vim   v4,v30,0,v0
                  mulhsu     s11, t3, s1
                  srai       s8, t0, 5
                  vmulh.vv   v22,v26,v25,v0.t
                  vmulhu.vv  v28,v22,v2
                  mulhsu     s2, a3, a7
                  vsub.vx    v11,v21,sp
                  div        s11, s9, s6
                  mulhsu     t1, s5, s10
                  vsub.vv    v0,v22,v17
                  vadc.vvm   v31,v28,v11,v0
                  slli       s2, a3, 7
                  vmulhu.vx  v29,v5,t1,v0.t
                  vslideup.vi v18,v1,0
                  sub        s2, t5, t0
                  slli       a1, s7, 23
                  vmulh.vx   v22,v6,gp
                  vslide1up.vx v3,v6,a4,v0.t
                  vslidedown.vi v18,v16,0,v0.t
                  vfmin.vf   v13,v15,fa3
                  vmadd.vx   v6,a7,v16,v0.t
                  or         s6, t1, s1
                  vmulhu.vx  v21,v5,t4
                  slt        s11, t4, t2
                  div        a1, s5, gp
                  sltu       s4, s2, ra
                  xori       gp, sp, 76
                  slli       s9, t5, 31
                  vsub.vx    v27,v22,s5,v0.t
                  srl        t1, a3, a7
                  addi       sp, a5, -608
                  mul        a3, s10, a4
                  vsaddu.vx  v5,v14,sp
                  div        s7, s2, a3
                  mulh       s8, s4, s3
                  vmulh.vv   v20,v2,v9
                  mulhsu     t1, t5, zero
                  sub        tp, a1, gp
                  rem        s2, s4, t2
                  slti       s6, a2, 441
                  ori        t5, s3, 788
                  remu       t5, a6, ra
                  vslide1up.vx v29,v1,t1
                  vsaddu.vx  v4,v29,ra,v0.t
                  div        t5, t2, ra
                  xori       s6, t1, 294
                  vslide1up.vx v16,v15,t0
                  xori       t1, s1, -914
                  mul        t6, s9, s4
                  vmulh.vx   v8,v28,s2
                  vslide1up.vx v26,v17,s6
                  mul        a3, a1, zero
                  vmulhu.vx  v9,v9,s11
                  sra        ra, s10, a6
                  vfmax.vv   v6,v25,v8,v0.t
                  sltiu      s5, t1, -503
                  srai       zero, tp, 4
                  lui        s5, 846542
                  rem        a0, t6, t4
                  add        a4, a4, s4
                  vsub.vv    v11,v14,v15
                  sll        s8, s6, s5
                  mulh       s1, t2, s10
                  add        s4, s7, t3
                  vsub.vv    v7,v30,v9
                  vadd.vx    v11,v14,s8
                  srai       ra, gp, 0
                  vsll.vv    v22,v16,v15,v0.t
                  ori        s5, t3, 858
                  vslidedown.vx v3,v2,s11,v0.t
                  vsll.vi    v0,v14,0
                  mulhsu     s4, t1, ra
                  vsadd.vx   v17,v8,tp
                  mul        a5, a6, s0
                  auipc      s10, 476287
                  add        s4, tp, a3
                  add        a1, a1, sp
                  vmadd.vv   v24,v27,v9,v0.t
                  vsll.vv    v21,v3,v22
                  vfmin.vv   v7,v26,v13,v0.t
                  mul        t2, t3, t6
                  vslidedown.vi v31,v16,0,v0.t
                  sll        s6, s0, t2
                  and        t3, t4, tp
                  slli       t6, ra, 14
                  sub        t3, s3, t4
                  vmadd.vx   v14,s9,v4,v0.t
                  add        gp, t0, a4
                  andi       a0, a3, 294
                  auipc      t1, 396751
                  vsll.vx    v20,v22,tp,v0.t
                  vadd.vi    v26,v19,0
                  vadd.vx    v28,v22,s3,v0.t
                  xor        s5, s0, t6
                  vslidedown.vi v1,v0,0
                  mulhsu     s7, s2, a6
                  slt        a0, s7, s8
                  add        t1, t6, t6
                  vslidedown.vx v5,v1,zero
                  srl        zero, tp, a4
                  sra        ra, s5, s4
                  mulhsu     s8, a5, s10
                  vfmax.vf   v16,v6,fs7,v0.t
                  vadd.vv    v20,v5,v31
                  add        s7, t1, sp
                  andi       s2, t5, 989
                  div        t5, s1, gp
                  slt        s3, a6, s2
                  add        s6, t5, s8
                  vslide1up.vx v0,v10,a2
                  vslidedown.vi v24,v13,0,v0.t
                  vsaddu.vi  v26,v18,0,v0.t
                  vmadd.vx   v24,s4,v16,v0.t
                  addi       gp, s0, -459
                  vmul.vv    v25,v2,v7,v0.t
                  vsub.vx    v12,v8,t1,v0.t
                  vmulhu.vx  v26,v14,a0
                  divu       a5, a0, s1
                  mulh       s7, s3, s10
                  rem        t6, a2, a3
                  mulhsu     s8, a6, t3
                  rem        s5, tp, s8
                  vmul.vv    v4,v18,v8,v0.t
                  or         tp, s7, tp
                  or         t1, t0, t4
                  slti       s5, s9, -769
                  vslidedown.vx v19,v8,s8,v0.t
                  or         a3, s4, s6
                  slli       s2, t4, 16
                  xor        s3, s5, s3
                  srli       sp, tp, 2
                  sra        zero, a0, s8
                  vmadd.vx   v7,s8,v20,v0.t
                  vsub.vx    v8,v17,s8,v0.t
                  vmul.vx    v28,v27,sp
                  slt        a2, t4, tp
                  vfmin.vv   v16,v9,v14,v0.t
                  slti       s2, s2, 218
                  slli       s5, s10, 4
                  xori       s8, t3, -818
                  vsaddu.vv  v5,v10,v21
                  div        sp, a2, s11
                  vsub.vx    v10,v12,zero,v0.t
                  slli       t5, t1, 23
                  auipc      s11, 481050
                  vrsub.vx   v9,v16,t1,v0.t
                  mul        a6, s1, a0
                  vrsub.vx   v4,v19,t1
                  vsll.vv    v24,v25,v9,v0.t
                  vfmin.vf   v0,v21,ft9
                  vslidedown.vx v3,v26,t5
                  slli       t0, s3, 7
                  slt        ra, t2, s3
                  mulhsu     a1, t4, t3
                  or         s10, a3, s9
                  ori        t1, a4, 132
                  slt        a0, a3, t4
                  vsadd.vx   v17,v1,s1,v0.t
                  mul        gp, s5, t3
                  lui        t2, 52850
                  vsaddu.vi  v3,v7,0,v0.t
                  vadc.vxm   v15,v17,s7,v0
                  vrsub.vi   v24,v3,0,v0.t
                  slli       a6, s7, 30
                  slti       a4, t2, -291
                  srai       zero, a2, 10
                  vfmin.vf   v0,v26,fs4
                  vmulhu.vx  v6,v28,t5
                  xor        s8, gp, a2
                  vsll.vv    v2,v3,v30,v0.t
                  div        t6, s3, s7
                  vslidedown.vx v26,v29,t5,v0.t
                  vfmin.vv   v26,v18,v13,v0.t
                  lui        a1, 845476
                  mulhsu     t0, s4, s4
                  vsub.vx    v12,v11,a6
                  div        gp, s0, t3
                  vsll.vx    v16,v26,t2,v0.t
                  sll        s4, t5, a0
                  srl        s6, a7, s5
                  rem        a5, t2, sp
                  mulh       t2, s9, s3
                  vrsub.vx   v7,v9,a0,v0.t
                  srl        ra, s3, a4
                  vslidedown.vx v6,v25,s0
                  vsub.vv    v23,v29,v21,v0.t
                  vsub.vx    v30,v11,s10
                  vsll.vi    v0,v27,0
                  remu       s9, s2, s4
                  or         t2, s5, t1
                  andi       s7, gp, 196
                  vmadd.vv   v7,v24,v22
                  sub        t2, t4, a1
                  addi       ra, gp, 918
                  vrsub.vx   v19,v20,a5
                  lui        s1, 84696
                  vmadd.vx   v0,t1,v25
                  srli       t5, s11, 11
                  remu       s4, gp, sp
                  srli       sp, s11, 7
                  addi       t3, s7, 860
                  auipc      t5, 519172
                  mulhsu     t5, t6, a6
                  or         a6, a6, a5
                  vmulh.vx   v0,v17,a7
                  srl        s6, s2, s7
                  slt        s1, s1, s3
                  vfmin.vf   v12,v31,fs6,v0.t
                  vfmax.vf   v7,v10,ft0
                  add        t0, s10, s2
                  vsaddu.vi  v3,v8,0
                  div        s6, tp, t2
                  srl        s10, t2, s1
                  sltiu      a5, s4, -357
                  rem        tp, t0, s1
                  mulhsu     tp, s9, s11
                  srl        a6, a1, s11
                  vslideup.vi v14,v9,0
                  vmulh.vx   v8,v21,sp
                  vadc.vim   v11,v14,0,v0
                  vadc.vim   v1,v4,0,v0
                  vmulhu.vv  v19,v25,v14
                  slt        s8, sp, t3
                  slti       t3, t4, -868
                  vadc.vxm   v4,v15,t5,v0
                  xori       s7, a0, 676
                  vsaddu.vi  v14,v0,0,v0.t
                  srai       s10, tp, 15
                  vmulhu.vx  v26,v14,s7
                  mul        s6, s11, a2
                  vadd.vv    v24,v20,v25
                  vsub.vv    v16,v17,v6
                  addi       s1, t2, -196
                  mulhsu     a4, s11, s0
                  lui        t5, 990789
                  addi       t1, a3, 516
                  add        a4, s3, s11
                  vfmin.vf   v10,v31,ft8
                  vmul.vx    v16,v0,s2,v0.t
                  andi       s3, a0, -347
                  xori       s3, s4, 976
                  or         a0, t6, zero
                  slli       s4, a0, 13
                  srl        s3, sp, a4
                  vsaddu.vi  v19,v2,0
                  mulhu      t1, s3, s5
                  remu       a1, gp, s7
                  vslideup.vi v16,v12,0
                  srai       a2, a3, 0
                  auipc      t6, 846802
                  xor        s9, sp, a3
                  andi       gp, s1, -795
                  mulhsu     a0, s3, sp
                  vsaddu.vv  v16,v12,v12
                  vsll.vi    v16,v21,0,v0.t
                  and        a4, a3, t6
                  vslideup.vi v8,v24,0,v0.t
                  vadc.vxm   v25,v25,a3,v0
                  sra        t5, t4, s6
                  mul        t2, a1, t6
                  vrsub.vi   v29,v0,0
                  vsaddu.vi  v12,v9,0,v0.t
                  sltiu      s1, t2, 325
                  add        t5, t1, s1
                  auipc      t2, 483856
                  ori        a3, gp, -116
                  remu       a5, s1, a7
                  div        s10, a4, s3
                  vfmax.vf   v22,v10,fs0,v0.t
                  xor        sp, s5, s1
                  vfmax.vv   v30,v9,v8
                  srai       t3, s11, 10
                  div        a0, ra, s3
                  slti       t2, ra, 610
                  sra        s3, a1, t1
                  vslidedown.vi v27,v30,0
                  vsaddu.vx  v10,v21,gp
                  vmadd.vx   v4,a7,v24,v0.t
                  sltu       a1, a4, s1
                  mulh       ra, s8, s5
                  andi       tp, t0, -323
                  vslidedown.vi v3,v25,0,v0.t
                  slti       tp, gp, 909
                  srli       s3, a5, 13
                  sltiu      t3, sp, -338
                  vadc.vim   v13,v28,0,v0
                  vadd.vx    v1,v29,tp,v0.t
                  slti       t0, s4, 311
                  srai       t0, s10, 9
                  vadc.vvm   v8,v7,v4,v0
                  vsaddu.vx  v6,v1,s6,v0.t
                  sll        tp, s2, gp
                  slt        zero, t3, a4
                  vsll.vi    v27,v17,0,v0.t
                  or         a1, s3, t1
                  vmulhu.vv  v23,v11,v27
                  srai       t6, s10, 8
                  vmadd.vx   v27,t6,v3
                  vslidedown.vx v0,v2,s10
                  mul        a1, a0, s4
                  slt        a2, s0, t2
                  add        s8, s0, s0
                  vadd.vi    v1,v6,0,v0.t
                  or         ra, a3, s4
                  and        s2, a7, s10
                  or         a6, gp, t5
                  and        t6, t3, a6
                  remu       t6, gp, zero
                  vslidedown.vi v12,v11,0,v0.t
                  or         ra, s2, t6
                  sll        s8, s4, s1
                  vsaddu.vv  v17,v31,v14,v0.t
                  vsadd.vi   v8,v21,0
                  lui        t3, 842323
                  vsll.vx    v15,v21,t3
                  vmulh.vx   v24,v7,s1,v0.t
                  vmulhu.vx  v19,v28,s8
                  mulhu      s3, a0, s0
                  sub        t0, t2, a4
                  sltu       tp, a0, a0
                  vslide1up.vx v23,v24,a1
                  vfmin.vf   v24,v26,ft5
                  or         sp, s5, s10
                  slti       s4, sp, -572
                  xori       a0, s7, -153
                  vslidedown.vi v25,v16,0
                  divu       a4, a0, s9
                  remu       zero, t2, s9
                  vslideup.vi v13,v31,0
                  mulhsu     tp, a7, t3
                  ori        t1, s4, 635
                  mulhsu     a6, s8, a0
                  vrsub.vx   v12,v9,s5,v0.t
                  lui        s2, 124580
                  mulh       s8, sp, a2
                  vslide1up.vx v18,v7,s9,v0.t
                  lui        a3, 69578
                  vsll.vi    v17,v14,0,v0.t
                  srl        gp, a1, a4
                  vmul.vx    v23,v24,s4,v0.t
                  srai       t2, gp, 9
                  sltiu      sp, s8, -23
                  vslideup.vx v31,v27,a1,v0.t
                  vsaddu.vv  v8,v28,v6
                  or         ra, a6, s0
                  vslideup.vx v22,v21,s6,v0.t
                  div        a1, a2, t4
                  and        a5, a2, s10
                  or         s5, a1, a1
                  vslidedown.vi v21,v19,0
                  vsub.vv    v19,v6,v28
                  vslide1up.vx v12,v11,ra,v0.t
                  add        ra, s0, zero
                  andi       s7, s5, 185
                  vmul.vv    v0,v9,v11
                  lui        s9, 941450
                  srli       s3, t3, 12
                  vadc.vim   v7,v3,0,v0
                  mulhu      sp, t4, s3
                  vmadd.vx   v30,a3,v28
                  slti       s1, s1, 774
                  slli       s4, a2, 25
                  or         a1, a2, s5
                  sra        t3, sp, a5
                  auipc      s3, 538894
                  divu       t0, s8, s8
                  xori       gp, a6, 985
                  divu       t2, sp, zero
                  vslide1up.vx v24,v30,t6,v0.t
                  vsub.vx    v9,v28,t5
                  sra        zero, sp, t2
                  div        a0, a0, ra
                  vmulhu.vv  v2,v6,v12,v0.t
                  slti       s10, a7, 945
                  vslide1up.vx v24,v4,s5,v0.t
                  vfmax.vv   v25,v16,v24
                  xor        sp, t4, s7
                  remu       a2, a0, s5
                  div        a6, a7, s9
                  vslideup.vi v8,v7,0,v0.t
                  sltu       s8, s0, s4
                  vmulh.vx   v28,v18,tp,v0.t
                  rem        t1, s7, s6
                  vmul.vx    v21,v0,s6
                  srai       t3, a6, 24
                  mulhu      t1, t4, t0
                  sub        t2, t3, t4
                  vrsub.vx   v16,v19,a5,v0.t
                  srai       s11, t5, 26
                  slt        a4, zero, s1
                  vmulhu.vx  v14,v25,a5
                  divu       s5, t5, zero
                  vmul.vv    v4,v30,v28
                  slti       a6, s2, 899
                  slli       s1, t0, 1
                  auipc      s2, 274943
                  xor        s8, s0, s1
                  vsadd.vx   v9,v26,a2
                  vadc.vvm   v29,v12,v17,v0
                  andi       a6, s0, -41
                  or         ra, zero, s3
                  vmadd.vv   v23,v17,v26
                  mulhu      s9, a1, a0
                  srli       s4, s3, 27
                  xori       a2, s2, 495
                  div        s5, a4, ra
                  vmul.vv    v3,v22,v16
                  slli       s10, a5, 21
                  vfmax.vf   v29,v4,ft8
                  vslidedown.vi v30,v0,0,v0.t
                  srli       s6, a4, 30
                  vrsub.vi   v7,v18,0,v0.t
                  vslide1up.vx v6,v3,s1,v0.t
                  vmul.vx    v28,v11,t0
                  ori        s4, s7, -743
                  mulh       zero, a0, t5
                  vsub.vv    v2,v5,v3
                  vmulh.vv   v22,v24,v27,v0.t
                  lui        a2, 463195
                  xori       s2, s3, 338
                  vslidedown.vx v3,v0,a6,v0.t
                  rem        t2, s9, zero
                  sltu       gp, a4, t1
                  srli       s7, s11, 9
                  xori       a4, s9, 994
                  lui        t0, 731913
                  vmul.vv    v14,v0,v16,v0.t
                  div        a5, ra, s11
                  vmulh.vx   v12,v6,a3
                  remu       sp, a0, t5
                  mul        s1, a0, sp
                  sltu       s6, t5, gp
                  vmulh.vv   v27,v19,v13
                  srl        s6, ra, gp
                  srl        s3, t1, zero
                  xori       a0, a1, -352
                  srai       t1, a4, 23
                  addi       t2, t3, 182
                  vfmax.vf   v8,v1,fs4,v0.t
                  rem        t5, t6, t1
                  slli       t0, s8, 19
                  mul        t1, s8, s11
                  vmulh.vv   v5,v18,v13,v0.t
                  srl        a6, gp, zero
                  or         s3, a3, t1
                  mulhu      t6, s11, sp
                  remu       a5, t2, zero
                  vadd.vv    v11,v23,v7
                  vslideup.vi v10,v20,0
                  vadd.vx    v30,v2,s1
                  srai       a2, t6, 30
                  sltu       s1, s7, tp
                  vsll.vi    v25,v18,0,v0.t
                  vmadd.vv   v28,v6,v13,v0.t
                  remu       gp, s11, t1
                  mul        s8, s11, s11
                  vmulh.vx   v17,v11,a6,v0.t
                  vmulhu.vx  v4,v6,a4
                  vsll.vx    v11,v10,a6
                  vslidedown.vi v10,v3,0
                  vmulh.vv   v18,v29,v28
                  andi       s10, s11, 638
                  mul        ra, ra, t0
                  sub        t0, a0, zero
                  vslide1up.vx v25,v28,s6
                  and        t1, s9, s0
                  vmulhu.vv  v16,v19,v13,v0.t
                  vfmin.vv   v17,v13,v13
                  vslide1up.vx v1,v3,sp
                  vslideup.vx v4,v22,s2
                  addi       ra, s5, 189
                  sll        t6, a0, a1
                  vsll.vx    v27,v16,s9
                  mul        ra, a4, zero
                  sltu       tp, a7, sp
                  srli       s7, s1, 7
                  vsaddu.vv  v22,v28,v2,v0.t
                  vsub.vv    v20,v22,v28,v0.t
                  vsadd.vi   v24,v31,0
                  sub        t0, a1, s0
                  vfmax.vv   v12,v7,v17
                  vslide1up.vx v27,v25,ra,v0.t
                  vmul.vx    v15,v1,sp,v0.t
                  vfmax.vv   v20,v29,v8,v0.t
                  divu       gp, t2, a5
                  sub        t6, s5, gp
                  sll        s7, sp, s5
                  div        s6, tp, gp
                  sub        a5, s4, a2
                  add        s10, zero, a2
                  sub        a1, a6, s9
                  srl        t0, t3, t0
                  slt        s4, zero, t2
                  and        t5, s3, a6
                  vadc.vxm   v25,v15,s10,v0
                  sltiu      gp, a6, 778
                  srai       a4, t0, 2
                  andi       s4, a3, 345
                  vfmin.vf   v7,v22,fs3,v0.t
                  mulh       s11, zero, a3
                  divu       a0, a1, t0
                  slli       s4, a1, 21
                  slt        s7, s1, a0
                  auipc      s10, 736432
                  sltiu      sp, a4, 692
                  sltiu      s2, zero, -56
                  xor        zero, s0, s11
                  sra        s10, t5, a6
                  add        a2, s10, a6
                  vfmin.vv   v29,v12,v0,v0.t
                  srai       s2, t4, 22
                  remu       zero, s10, s4
                  slli       s8, s2, 22
                  ori        s9, t5, -542
                  divu       a3, t4, a3
                  vmulhu.vx  v23,v6,a3
                  mul        a6, zero, a1
                  mulh       zero, s5, sp
                  slt        a5, a4, s10
                  sub        zero, a0, t3
                  mul        t0, tp, t1
                  vslidedown.vx v21,v0,a2
                  vrsub.vi   v4,v16,0
                  vadd.vv    v30,v13,v31,v0.t
                  sltu       s1, t6, t6
                  andi       a0, a1, 32
                  sll        a2, t3, s5
                  addi       s4, a2, 843
                  vfmax.vv   v19,v19,v28,v0.t
                  vadc.vxm   v22,v28,gp,v0
                  srai       t5, a3, 26
                  divu       a3, s6, s11
                  or         gp, t2, a3
                  vmadd.vv   v17,v10,v28
                  slt        s10, a3, a6
                  srai       s4, s7, 7
                  sub        s7, ra, t3
                  sltiu      a1, s7, -161
                  sub        t2, a2, s11
                  auipc      s11, 833746
                  vsll.vv    v27,v0,v3
                  vrsub.vi   v4,v29,0
                  ori        ra, ra, -705
                  vmulhu.vx  v3,v11,s8,v0.t
                  rem        a1, s3, tp
                  or         s10, a3, s4
                  mulhu      a2, s7, t5
                  vslideup.vi v15,v14,0
                  vadc.vim   v9,v24,0,v0
                  lui        a2, 490844
                  srl        tp, tp, tp
                  srli       a3, s8, 25
                  vslide1up.vx v17,v6,s7
                  xor        t6, t3, t0
                  addi       s1, t3, 975
                  mulh       a5, a0, a2
                  sltiu      s7, t3, 910
                  or         a4, t3, s8
                  vslideup.vi v23,v19,0
                  add        gp, s5, s9
                  sub        s3, s1, gp
                  vsaddu.vx  v4,v23,s9
                  remu       tp, t5, t4
                  or         s4, a6, s10
                  xor        t2, s9, tp
                  slli       tp, s5, 10
                  slti       s10, s9, 944
                  or         ra, a1, t5
                  vsadd.vi   v2,v16,0,v0.t
                  vfmin.vf   v4,v23,fs4
                  mulh       s7, s7, s7
                  andi       a0, a1, 515
                  div        a4, a6, zero
                  mulhsu     gp, s8, s11
                  srai       t3, s3, 22
                  or         s8, s1, sp
                  sra        s4, s3, s10
                  auipc      a5, 995625
                  vsadd.vv   v26,v1,v4,v0.t
                  xori       s11, t1, 186
                  vsadd.vi   v3,v29,0,v0.t
                  ori        sp, s6, -649
                  sltu       a2, s3, a6
                  vmulh.vx   v13,v26,gp,v0.t
                  vsaddu.vv  v10,v3,v4
                  vadd.vi    v8,v7,0
                  and        t2, tp, ra
                  sltiu      a0, a4, -1008
                  addi       tp, s0, -983
                  lui        ra, 47239
                  or         s11, tp, t3
                  vmulhu.vv  v22,v24,v14
                  vadc.vim   v31,v11,0,v0
                  ori        s4, a2, 387
                  sra        a6, s1, s1
                  xor        s3, sp, s4
                  srli       tp, sp, 7
                  and        a3, s1, a3
                  vfmin.vf   v21,v30,fa4,v0.t
                  xor        a5, ra, ra
                  srl        t5, t0, s7
                  slli       s6, s3, 25
                  vmulh.vv   v26,v6,v15,v0.t
                  rem        ra, zero, a3
                  ori        s3, s4, 191
                  vmadd.vx   v26,s7,v3
                  mul        a4, gp, t6
                  vmulhu.vx  v23,v9,a5
                  vmulh.vx   v22,v4,a6
                  srli       t3, gp, 27
                  lui        s3, 168198
                  mulh       s9, s8, s4
                  vadc.vim   v12,v3,0,v0
                  remu       s4, t0, s6
                  divu       a1, s7, tp
                  vadd.vv    v3,v20,v17,v0.t
                  vsadd.vv   v18,v24,v1,v0.t
                  ori        t0, s11, 86
                  xori       a6, a4, -979
                  xor        t0, a3, t3
                  vfmax.vf   v14,v23,ft5,v0.t
                  rem        gp, s0, a5
                  divu       zero, s6, s6
                  slti       s6, a0, -300
                  divu       sp, s2, a6
                  divu       s7, t2, gp
                  vadd.vi    v0,v27,0
                  andi       tp, t5, -272
                  andi       zero, zero, -197
                  sra        a0, s3, gp
                  vadc.vvm   v7,v24,v30,v0
                  vsll.vv    v29,v0,v28
                  sub        t1, t0, a3
                  lui        a6, 277219
                  mulhu      t3, a3, s10
                  sltu       t2, s3, s0
                  vslideup.vi v1,v23,0,v0.t
                  and        t6, s0, gp
                  add        zero, s11, s7
                  vmulh.vv   v15,v29,v18,v0.t
                  addi       s5, sp, -916
                  vsadd.vv   v6,v4,v26,v0.t
                  xori       t5, s1, -331
                  divu       s5, s0, s9
                  slli       a6, a1, 9
                  vslide1up.vx v11,v25,a6
                  srl        s1, s5, s2
                  slli       a1, t2, 4
                  slli       a3, a3, 18
                  vmulhu.vv  v13,v25,v19,v0.t
                  divu       a6, a3, a1
                  divu       a0, s8, zero
                  sra        t6, gp, gp
                  mulhsu     a3, zero, s2
                  srli       t0, t1, 28
                  andi       a6, s6, -658
                  vsub.vv    v24,v28,v21
                  add        a0, tp, a3
                  sll        t5, t3, s1
                  xori       t0, tp, 357
                  andi       a4, s0, 918
                  vslidedown.vi v23,v12,0,v0.t
                  mul        a0, a7, t0
                  mulhu      a3, t0, t4
                  add        a1, t3, a0
                  div        s11, a7, zero
                  auipc      a2, 522944
                  srai       s11, t1, 18
                  slt        s4, a1, t3
                  vfmin.vv   v3,v20,v31
                  slli       s2, t2, 30
                  srl        s6, s8, s0
                  mulhu      t0, t3, a1
                  mulhsu     s9, t6, s4
                  vslidedown.vi v24,v18,0,v0.t
                  sll        ra, s3, s6
                  mul        s7, a6, s6
                  xori       a2, ra, -826
                  mulhsu     ra, s9, s5
                  vslidedown.vi v19,v12,0,v0.t
                  vsaddu.vx  v7,v0,a2,v0.t
                  srai       s11, a4, 20
                  vmadd.vv   v3,v15,v20
                  addi       s8, t5, -344
                  and        s7, s3, t6
                  srai       a4, s7, 29
                  add        gp, tp, s10
                  vsll.vi    v25,v21,0
                  vsll.vi    v31,v11,0
                  addi       t6, s9, -431
                  srl        a2, s1, t0
                  vsaddu.vi  v21,v15,0,v0.t
                  mulh       s8, s11, a1
                  addi       s1, t0, 243
                  div        s4, s4, t0
                  srli       s11, a3, 29
                  and        s1, tp, a3
                  add        t2, s9, zero
                  vsll.vi    v15,v3,0
                  vfmin.vf   v12,v26,ft2,v0.t
                  mulhsu     s9, t5, s11
                  mul        s8, s2, s5
                  slli       t2, s5, 24
                  vslide1up.vx v4,v20,t1,v0.t
                  slli       a6, t6, 16
                  xori       s4, tp, 209
                  andi       gp, sp, 82
                  add        s9, tp, gp
                  vsadd.vi   v3,v7,0,v0.t
                  mulh       s10, s6, s5
                  vmadd.vv   v1,v3,v24,v0.t
                  slti       a5, s11, 952
                  mulhsu     s6, s3, s6
                  vmulhu.vx  v30,v8,s6,v0.t
                  vsub.vx    v25,v29,tp,v0.t
                  vsub.vv    v11,v3,v9
                  remu       a0, a0, s10
                  xori       t6, t1, -988
                  srl        t2, s10, s0
                  xor        a6, t1, t4
                  vsub.vx    v4,v13,t5
                  slt        sp, t1, t2
                  or         a6, t1, a5
                  auipc      t6, 843327
                  sub        t3, s3, a3
                  vslidedown.vi v7,v0,0,v0.t
                  vrsub.vi   v29,v17,0,v0.t
                  sltiu      a3, s4, 38
                  mul        s4, a5, s11
                  vslide1up.vx v27,v13,sp
                  vmadd.vx   v21,a2,v0,v0.t
                  vslideup.vx v23,v26,a4
                  vslideup.vi v12,v0,0,v0.t
                  or         s9, a4, s2
                  mul        s1, a6, s10
                  or         gp, s3, s3
                  ori        s3, s7, 330
                  vmul.vx    v28,v27,t2,v0.t
                  vsaddu.vx  v31,v14,gp,v0.t
                  sra        zero, t3, s4
                  slti       a2, s4, 300
                  vmulhu.vv  v15,v12,v20
                  sll        t3, t2, s3
                  addi       s8, zero, -140
                  vfmin.vf   v22,v27,fs11
                  mul        s3, s11, s0
                  vadc.vvm   v9,v11,v18,v0
                  srl        t1, t0, s0
                  vfmin.vv   v9,v29,v14,v0.t
                  rem        a0, a2, s0
                  vrsub.vi   v15,v5,0,v0.t
                  vsll.vv    v4,v10,v19,v0.t
                  mulhu      a0, s8, a4
                  mulhu      s3, a2, t3
                  vadd.vi    v11,v14,0
                  remu       t1, a0, zero
                  or         s7, ra, s4
                  srli       s6, a5, 27
                  slti       zero, ra, -114
                  vfmax.vf   v4,v20,ft3,v0.t
                  xor        a4, t1, s9
                  and        a6, t3, s6
                  vadc.vim   v24,v27,0,v0
                  vslideup.vx v11,v0,a1
                  sra        t0, s11, a2
                  vsll.vv    v11,v29,v30
                  vfmin.vf   v23,v10,ft2
                  srai       s7, s5, 8
                  addi       t3, t5, 981
                  sltiu      s10, gp, 870
                  slli       t2, s8, 0
                  xori       t6, a0, 100
                  vsll.vx    v29,v22,a4,v0.t
                  slt        s8, t1, s4
                  vsub.vv    v17,v24,v31,v0.t
                  vmulh.vx   v26,v17,s4,v0.t
                  and        t6, t2, a5
                  add        a6, a1, a0
                  add        t2, gp, t3
                  vmul.vv    v25,v14,v18
                  srai       a0, s7, 28
                  auipc      a3, 694985
                  lui        ra, 857537
                  xori       t3, t5, -696
                  sll        s9, s6, s9
                  vsadd.vv   v26,v15,v19,v0.t
                  div        a3, s0, s11
                  vmulh.vx   v20,v12,a1
                  vmadd.vv   v18,v18,v13,v0.t
                  vadc.vvm   v2,v28,v22,v0
                  mulhu      a6, s2, a0
                  vslideup.vx v27,v17,s3,v0.t
                  vmul.vx    v7,v11,a1,v0.t
                  sltu       t0, t6, tp
                  mulhsu     t6, s0, t1
                  addi       t1, a7, 19
                  andi       a6, a0, -945
                  vslideup.vx v31,v24,t2
                  vrsub.vx   v0,v17,t4
                  vslideup.vx v0,v27,a2
                  srai       t1, s10, 4
                  xor        a6, a5, s1
                  rem        s9, s9, a5
                  vmulh.vv   v10,v12,v23,v0.t
                  add        gp, t5, s3
                  vmulh.vx   v3,v12,s1
                  lui        s7, 875081
                  vsll.vx    v3,v0,sp,v0.t
                  mulh       s7, sp, s4
                  vsadd.vv   v31,v14,v6,v0.t
                  vfmax.vv   v9,v15,v26
                  div        s10, s4, s1
                  mulhu      t1, t5, s3
                  or         a5, s5, s3
                  addi       t0, a5, -105
                  remu       s10, ra, a7
                  mulhsu     s7, a7, s2
                  sll        t2, ra, t3
                  vfmin.vv   v15,v19,v28,v0.t
                  sltu       ra, s4, t4
                  xor        a3, s3, a4
                  and        t6, sp, s8
                  slt        zero, t0, s2
                  divu       tp, s3, s7
                  srli       a0, zero, 31
                  sltiu      t3, t1, -539
                  slli       s2, s5, 10
                  sltiu      s4, s3, -180
                  vmul.vx    v26,v21,s7
                  mulhsu     s2, a0, tp
                  add        s8, s11, s0
                  vsll.vx    v23,v15,gp
                  xor        s10, s8, t1
                  mul        s7, s11, s9
                  vfmin.vv   v18,v16,v2,v0.t
                  vmulh.vx   v10,v18,a1
                  sll        s1, t5, gp
                  addi       s6, a5, 1023
                  slli       s10, a5, 17
                  lui        a4, 874837
                  vmadd.vv   v28,v22,v11,v0.t
                  auipc      sp, 901602
                  lui        zero, 65814
                  div        a3, a5, s2
                  vsaddu.vx  v22,v17,s11,v0.t
                  slti       tp, s8, -302
                  slt        s2, a5, a5
                  vmulh.vx   v25,v6,s3,v0.t
                  mulh       t0, a4, gp
                  vsadd.vx   v22,v15,s5
                  vmadd.vx   v22,t5,v27,v0.t
                  ori        a4, s2, 24
                  lui        s7, 940971
                  and        a5, a0, sp
                  vrsub.vi   v23,v8,0,v0.t
                  vmadd.vv   v26,v0,v10
                  sltiu      t1, s8, -1008
                  slti       t6, s5, -496
                  xori       a5, sp, 49
                  vfmax.vv   v14,v27,v0,v0.t
                  mulhu      t5, tp, a1
                  add        t3, s10, ra
                  vmadd.vx   v9,ra,v16
                  lui        sp, 1041318
                  vsll.vx    v16,v7,t5
                  vsll.vi    v27,v21,0,v0.t
                  remu       gp, t5, s0
                  sra        a6, s5, a0
                  sltiu      s7, a2, 336
                  sltiu      s2, a6, -384
                  slti       gp, sp, -786
                  vslideup.vi v2,v31,0
                  remu       sp, s8, a6
                  add        t1, s6, s6
                  vmulh.vx   v13,v8,t5,v0.t
                  vmulh.vx   v9,v11,a1
                  slt        s6, s8, s8
                  vsadd.vi   v7,v2,0
                  vsub.vv    v14,v24,v3,v0.t
                  srli       a0, a4, 19
                  remu       s3, s11, s6
                  mulhu      s3, s9, s11
                  auipc      a5, 1000138
                  slti       a5, tp, -999
                  vadd.vi    v25,v24,0,v0.t
                  mulhu      zero, t1, gp
                  vmulh.vv   v22,v28,v8
                  mulhsu     a5, s5, a7
                  vsub.vx    v8,v4,s9,v0.t
                  auipc      a5, 182627
                  srli       t0, a4, 30
                  remu       t5, a0, a0
                  vsadd.vv   v25,v19,v15
                  vsll.vi    v7,v13,0,v0.t
                  remu       s4, s10, s0
                  sra        s10, a1, ra
                  and        zero, a0, t4
                  srai       s9, t2, 21
                  sra        t3, s9, s1
                  srli       zero, s9, 15
                  vrsub.vi   v1,v10,0
                  remu       t2, sp, s9
                  vfmin.vv   v2,v27,v2,v0.t
                  add        a4, a6, s7
                  auipc      a0, 351984
                  mul        s7, s0, s10
                  vadd.vi    v1,v26,0,v0.t
                  div        t2, a2, a4
                  vrsub.vx   v13,v0,tp,v0.t
                  vfmax.vf   v8,v20,ft7,v0.t
                  sra        sp, ra, t5
                  mulh       s10, tp, s10
                  sub        a6, a5, t5
                  mulhu      s8, t5, s0
                  vmulh.vx   v9,v9,s5,v0.t
                  sltiu      tp, a2, -347
                  vsll.vv    v12,v8,v17
                  sltu       t6, s7, a4
                  addi       s10, a7, -611
                  vfmax.vv   v19,v6,v4,v0.t
                  slli       s4, tp, 23
                  vmadd.vv   v24,v12,v21,v0.t
                  vsll.vx    v24,v7,a3,v0.t
                  divu       t5, s0, s4
                  slt        a4, t0, t4
                  ori        tp, a1, 154
                  mulh       s5, a1, tp
                  slti       a0, zero, -702
                  srai       t3, tp, 24
                  vslideup.vi v15,v26,0,v0.t
                  remu       zero, gp, t3
                  ori        a3, a6, -793
                  add        t6, tp, a3
                  xor        sp, a5, gp
                  vfmin.vv   v6,v8,v30
                  rem        s3, a2, s4
                  vrsub.vx   v1,v8,s11
                  srl        s1, s2, s2
                  addi       s4, s11, -589
                  vslideup.vi v20,v24,0,v0.t
                  slt        t1, tp, zero
                  ori        ra, s5, 105
                  vmul.vv    v25,v26,v15
                  srli       sp, s4, 21
                  vsadd.vi   v31,v9,0,v0.t
                  div        t0, s2, a7
                  auipc      s8, 999362
                  slli       t6, t4, 0
                  srai       zero, s2, 13
                  auipc      a6, 408915
                  add        s9, t0, t4
                  div        t1, a5, t4
                  vslideup.vx v1,v5,a3
                  sra        ra, t1, s3
                  sra        s9, t0, s9
                  mul        a0, t4, s3
                  vadd.vx    v19,v26,s11
                  srli       t2, t1, 28
                  sub        ra, s2, a0
                  rem        t2, s8, s6
                  vsadd.vx   v14,v25,tp,v0.t
                  remu       s2, t3, s4
                  slt        ra, s3, a3
                  vmadd.vx   v16,s10,v11,v0.t
                  vsaddu.vv  v3,v0,v6
                  mulhu      s3, tp, t6
                  vslideup.vx v15,v4,s7
                  andi       a2, t4, 954
                  vslideup.vx v25,v15,a4
                  xori       a2, s6, -104
                  divu       t1, tp, ra
                  vsub.vv    v31,v18,v31
                  vmadd.vx   v8,s6,v0
                  vfmin.vv   v31,v4,v9,v0.t
                  slt        s10, s5, s3
                  auipc      zero, 619927
                  vsaddu.vx  v4,v21,s4
                  vslide1up.vx v31,v27,s3
                  vsaddu.vx  v27,v8,s1,v0.t
                  vsadd.vi   v21,v9,0
                  rem        ra, a0, s5
                  mulh       a5, t1, sp
                  sll        s4, s10, s0
                  vsadd.vx   v12,v21,s3,v0.t
                  vslide1up.vx v6,v30,s1
                  sra        s4, s3, a5
                  vsll.vx    v26,v24,tp
                  rem        a1, a7, t6
                  mulhu      s10, s1, zero
                  rem        s1, tp, a4
                  xori       t0, s0, -333
                  mulhsu     a2, t6, s10
                  ori        zero, s4, 806
                  vfmax.vv   v26,v25,v15
                  srli       a0, gp, 0
                  vmulhu.vx  v15,v2,s7
                  vsll.vx    v24,v13,t6,v0.t
                  mul        s1, s3, t5
                  srli       s11, zero, 20
                  divu       s6, t2, t4
                  vmadd.vx   v27,t0,v22
                  slli       t3, s7, 5
                  mulh       s10, a6, s9
                  vfmax.vv   v19,v29,v16
                  sra        a2, gp, s0
                  sra        s4, s3, zero
                  vsll.vi    v3,v31,0
                  vfmax.vf   v8,v30,fa7,v0.t
                  divu       s3, s3, sp
                  slli       s10, t4, 11
                  xori       s4, t6, -468
                  vsadd.vv   v30,v30,v23,v0.t
                  remu       s2, s11, s0
                  sra        s5, t4, s0
                  sra        s6, s11, a0
                  sra        a6, t3, a0
                  vsll.vi    v15,v31,0,v0.t
                  slt        a4, a4, a5
                  srl        a2, s4, t3
                  slti       ra, s3, 965
                  or         s4, t5, a3
                  lui        s2, 828808
                  rem        s4, s7, a0
                  auipc      gp, 683308
                  slt        t6, s9, t0
                  mul        a1, s10, a5
                  vsadd.vi   v16,v5,0,v0.t
                  vsaddu.vi  v11,v15,0
                  or         zero, gp, ra
                  div        s8, t4, a3
                  sltiu      a6, t0, 364
                  mulh       s10, s6, t5
                  vfmin.vv   v12,v28,v25,v0.t
                  add        s2, t0, a3
                  ori        s2, gp, -689
                  vmulh.vv   v16,v10,v14
                  vsaddu.vi  v18,v4,0
                  slti       s8, t4, 313
                  sub        s7, a0, tp
                  vfmax.vf   v18,v29,fs4
                  rem        s3, t6, s11
                  slt        s7, s3, t1
                  ori        a4, ra, -290
                  vsub.vx    v15,v8,sp,v0.t
                  vfmax.vf   v17,v5,fs6
                  sra        a4, s3, s5
                  vmulhu.vv  v24,v26,v28
                  slt        gp, sp, s11
                  vmulh.vv   v30,v2,v13
                  ori        a6, t1, 932
                  div        s4, t0, sp
                  vmadd.vv   v30,v10,v14,v0.t
                  xori       ra, s4, -1001
                  vmulhu.vv  v31,v1,v21
                  vfmax.vv   v0,v25,v3
                  slt        s4, t4, a1
                  ori        a4, t3, 241
                  slt        tp, s5, s0
                  slli       t0, s6, 18
                  slti       t0, a6, -850
                  mulh       a6, s2, t0
                  divu       t3, t3, a0
                  srli       t6, s6, 24
                  add        a5, t3, a0
                  mulhu      a3, t5, t4
                  add        t5, s10, s0
                  sll        a0, a1, a0
                  slti       zero, t5, -143
                  xor        gp, s4, s6
                  sltiu      tp, s4, 474
                  divu       t1, ra, a3
                  mulhu      s9, s10, t3
                  rem        s9, t2, s7
                  vslideup.vi v31,v8,0
                  sub        s10, a5, zero
                  vfmin.vv   v31,v26,v22
                  srl        s10, a6, a2
                  sltiu      s4, tp, -163
                  xori       a3, t1, 290
                  sra        tp, a6, sp
                  vmul.vv    v1,v17,v24
                  vmul.vv    v10,v14,v11
                  mulhu      s11, t2, t0
                  xor        s9, s7, tp
                  slti       t6, s10, 742
                  vfmax.vf   v24,v10,fa5,v0.t
                  srl        s4, s3, a0
                  vfmax.vf   v22,v23,fs11,v0.t
                  srli       s2, s3, 21
                  vslidedown.vi v0,v4,0
                  ori        a2, s5, -169
                  vmul.vx    v20,v18,s10
                  sub        t5, s7, a5
                  slli       s6, a5, 29
                  vmadd.vx   v14,t3,v3
                  vmul.vv    v3,v1,v8,v0.t
                  slli       t2, zero, 13
                  sra        tp, a5, tp
                  vsll.vv    v22,v9,v20,v0.t
                  vfmin.vv   v16,v22,v4
                  rem        t0, s11, t3
                  vmulhu.vv  v28,v16,v31,v0.t
                  sra        t3, sp, s7
                  vfmax.vv   v17,v19,v2
                  sltu       sp, s3, s5
                  vadd.vx    v17,v26,s2,v0.t
                  slti       ra, t4, -776
                  add        s4, t4, zero
                  mul        ra, s3, s8
                  rem        s9, a1, a4
                  sltu       a4, a4, a6
                  xori       a6, a7, -193
                  vsadd.vv   v20,v30,v24,v0.t
                  sra        s9, t6, a2
                  sltiu      s3, zero, -707
                  vmul.vv    v6,v7,v6
                  vsadd.vv   v19,v8,v16,v0.t
                  vfmin.vv   v19,v11,v21,v0.t
                  vadd.vx    v26,v13,gp
                  remu       a6, s6, s8
                  mulhu      s10, ra, a2
                  mulh       a3, a3, s0
                  mulhu      s9, t4, a0
                  vfmax.vf   v16,v11,fs10,v0.t
                  slt        s10, s4, s11
                  div        t0, s4, a6
                  srl        a3, a2, t2
                  div        zero, tp, s11
                  vadc.vim   v30,v14,0,v0
                  and        t5, tp, t0
                  slli       s2, s1, 15
                  sra        gp, a0, s8
                  or         t2, s4, t0
                  ori        s2, s1, 82
                  vslide1up.vx v9,v15,a4
                  vslidedown.vx v3,v0,s0,v0.t
                  ori        s7, a5, 174
                  add        a6, s1, s6
                  vmul.vv    v6,v29,v22,v0.t
                  divu       zero, t1, ra
                  srli       gp, s8, 12
                  mul        s7, ra, s8
                  add        s11, s11, a2
                  sll        s11, gp, s2
                  or         a3, a1, s5
                  sll        s6, t6, t3
                  srai       s10, s7, 12
                  mul        a4, s1, ra
                  div        a0, ra, s10
                  div        t6, t3, s5
                  vsadd.vi   v6,v25,0
                  slti       a3, t3, -558
                  vsub.vx    v11,v18,a5,v0.t
                  slti       s2, s0, -67
                  rem        a3, t4, s9
                  vsll.vx    v23,v6,t5
                  mulhu      t0, a3, s10
                  vslideup.vi v5,v6,0
                  vmulhu.vv  v11,v6,v17
                  mul        a4, t3, a0
                  vmadd.vv   v4,v23,v29,v0.t
                  mulhu      a6, gp, gp
                  xor        a6, a6, a5
                  vslide1up.vx v9,v15,a3
                  remu       t3, a1, a2
                  add        s9, zero, a3
                  and        s7, a7, s6
                  mulhu      t0, s10, s10
                  vmadd.vx   v10,s4,v28,v0.t
                  ori        s7, a5, -631
                  div        a3, s0, t0
                  vsadd.vv   v12,v22,v12
                  vsadd.vi   v5,v12,0,v0.t
                  remu       gp, sp, ra
                  ori        t0, t0, -465
                  vslide1up.vx v15,v0,s7
                  divu       t2, s6, t4
                  vslidedown.vi v3,v19,0,v0.t
                  vsadd.vx   v15,v0,sp,v0.t
                  sra        a2, t1, t0
                  vmulh.vv   v24,v14,v26,v0.t
                  sub        t0, t1, s4
                  xori       t1, t5, 880
                  vmulh.vv   v26,v2,v4
                  lui        s8, 1009878
                  vslideup.vx v15,v29,s4,v0.t
                  divu       a4, a3, t5
                  div        ra, a0, zero
                  mulhu      t3, s2, s7
                  sltu       s7, s4, a1
                  mulh       t1, s8, s0
                  vadc.vvm   v3,v16,v10,v0
                  slt        t1, a2, t6
                  mulhu      t3, s10, gp
                  ori        t6, s0, 67
                  sltiu      s7, s0, -738
                  ori        s8, t0, -735
                  vmulhu.vx  v6,v14,t1,v0.t
                  vsaddu.vi  v19,v2,0,v0.t
                  andi       s6, t6, 919
                  add        a1, s7, a6
                  vmadd.vv   v1,v14,v15
                  mulhsu     s11, s11, s1
                  mulh       a3, a0, a7
                  andi       tp, a6, 475
                  vsadd.vv   v8,v9,v26,v0.t
                  ori        s4, s1, -312
                  vsadd.vx   v9,v23,gp
                  sra        t1, t1, s3
                  vslide1up.vx v19,v25,s6,v0.t
                  lui        s6, 1039658
                  auipc      zero, 308565
                  slt        zero, sp, s7
                  vmul.vv    v30,v24,v23
                  xori       a1, t6, 437
                  add        a4, s5, t4
                  vsadd.vi   v20,v23,0,v0.t
                  and        a2, t5, a4
                  rem        s1, t3, t2
                  vsll.vi    v27,v21,0
                  sltiu      t1, ra, 718
                  rem        a2, a7, s2
                  slti       a0, s2, 80
                  andi       s11, t5, -991
                  and        s8, a4, s9
                  vsadd.vv   v2,v22,v20,v0.t
                  or         s9, a2, sp
                  vslidedown.vi v12,v14,0,v0.t
                  vfmax.vf   v4,v2,fs5
                  mulhu      s6, a7, sp
                  auipc      t2, 932580
                  addi       zero, a7, 904
                  vfmin.vv   v7,v6,v27
                  srai       zero, a4, 3
                  ori        t1, a4, -921
                  sltu       s6, s11, s8
                  vsaddu.vx  v15,v18,zero
                  vslide1up.vx v30,v1,s2,v0.t
                  rem        t5, s2, a0
                  vsub.vx    v9,v12,s4,v0.t
                  vslideup.vi v5,v24,0
                  xori       zero, s1, 589
                  vslidedown.vi v5,v29,0
                  mulhu      zero, s1, s4
                  and        s1, s4, s11
                  xori       t3, s1, -431
                  sltu       t5, s4, a4
                  vslideup.vi v17,v0,0,v0.t
                  add        t5, t1, s4
                  slt        s11, t2, gp
                  sub        a3, t3, a0
                  vsaddu.vv  v30,v19,v13,v0.t
                  vmul.vv    v2,v13,v30
                  mul        s6, s1, s8
                  ori        t3, s10, 756
                  remu       a4, a3, s9
                  auipc      a5, 196838
                  vsaddu.vx  v22,v3,a5
                  sltu       s6, tp, s10
                  vadc.vvm   v11,v28,v14,v0
                  vmadd.vv   v2,v7,v25
                  vmul.vx    v29,v27,ra,v0.t
                  mulh       s2, a6, s10
                  div        s6, a1, t1
                  vfmin.vf   v29,v16,fs1
                  and        t1, t4, a2
                  and        t2, s2, a7
                  vadc.vxm   v13,v25,zero,v0
                  vslideup.vx v7,v4,t5
                  vmulhu.vx  v4,v17,s7,v0.t
                  vmulhu.vx  v3,v5,ra,v0.t
                  vmulhu.vv  v1,v30,v0
                  xor        s6, s9, s1
                  mulhsu     s3, t1, a0
                  vsll.vi    v20,v17,0,v0.t
                  add        a0, t5, a6
                  sub        t2, t0, zero
                  mulhu      s5, s7, t6
                  vfmax.vv   v18,v0,v2,v0.t
                  sll        t0, s6, s2
                  vslide1up.vx v15,v18,t2
                  mulhsu     a4, a2, s11
                  or         ra, ra, s0
                  and        s4, s0, a4
                  mul        gp, t3, a2
                  divu       sp, gp, a0
                  mul        s2, t2, s11
                  div        s3, s0, s2
                  sra        s3, t5, s6
                  vmul.vv    v26,v0,v31,v0.t
                  andi       s9, s0, 666
                  sra        gp, s9, s0
                  divu       s11, tp, t2
                  mul        a1, s5, s4
                  slt        s1, s3, t5
                  vadc.vxm   v30,v2,s7,v0
                  and        ra, sp, sp
                  vsadd.vv   v1,v2,v6
                  rem        a6, a2, s8
                  vsub.vx    v9,v6,a1
                  vmulhu.vv  v8,v1,v31,v0.t
                  vmadd.vv   v12,v17,v13
                  addi       a3, tp, -791
                  add        a2, s7, ra
                  or         a6, a1, s11
                  slli       s4, s1, 16
                  mul        a1, s2, t2
                  vrsub.vi   v21,v23,0
                  div        t1, a5, s6
                  mul        s8, t2, s8
                  xor        tp, s6, t5
                  addi       ra, s10, 523
                  sll        zero, zero, s5
                  mul        tp, a6, a3
                  vmulhu.vv  v14,v31,v9,v0.t
                  vsaddu.vx  v31,v23,zero
                  vrsub.vx   v26,v5,t1,v0.t
                  lui        t1, 846542
                  vsaddu.vx  v26,v21,a3
                  rem        zero, s6, s9
                  srai       s4, sp, 5
                  mulhsu     s8, s6, t6
                  mulhsu     t1, s11, s2
                  lui        t3, 791015
                  slli       s6, a5, 11
                  add        s3, t1, s2
                  vmulhu.vv  v21,v5,v20,v0.t
                  ori        a1, zero, 950
                  vslidedown.vi v1,v9,0
                  lui        a0, 282131
                  vsadd.vv   v18,v20,v10,v0.t
                  divu       s11, ra, sp
                  add        s5, a7, a1
                  vfmax.vv   v27,v13,v29
                  srai       tp, t6, 17
                  sll        sp, s1, s3
                  srl        tp, t2, s9
                  vfmin.vf   v28,v22,fs6,v0.t
                  vmadd.vx   v14,s7,v1,v0.t
                  vslidedown.vi v25,v15,0,v0.t
                  vrsub.vx   v9,v25,tp,v0.t
                  vadc.vim   v6,v7,0,v0
                  vsadd.vx   v13,v29,a3
                  mulhsu     t1, a0, s0
                  andi       a0, a1, -99
                  vslidedown.vx v17,v21,s0,v0.t
                  addi       a2, s11, -704
                  rem        a2, s5, a4
                  slli       s3, s6, 11
                  xori       s1, tp, 274
                  vsub.vx    v11,v15,t3,v0.t
                  vfmin.vf   v9,v21,fs4
                  vadd.vv    v3,v1,v14,v0.t
                  vmadd.vx   v3,s6,v12
                  vmulh.vv   v3,v1,v11,v0.t
                  and        t5, t6, t6
                  add        zero, s11, s7
                  addi       t6, s4, 342
                  sltiu      sp, a1, 172
                  divu       a4, s5, s5
                  mulhu      gp, s1, a1
                  srai       s4, gp, 15
                  vslide1up.vx v13,v29,t2,v0.t
                  vslidedown.vx v26,v29,gp
                  xori       a4, gp, 555
                  sll        zero, t3, s5
                  slli       s9, s4, 17
                  addi       s8, s3, -512
                  div        a0, a0, t1
                  remu       s8, a0, t2
                  slti       t2, s4, 995
                  vsadd.vx   v17,v19,a3
                  slli       ra, t5, 12
                  rem        zero, t2, a6
                  andi       t5, a0, 331
                  vrsub.vi   v13,v1,0
                  vmadd.vv   v3,v28,v26,v0.t
                  mulhsu     t1, t3, t4
                  ori        t0, s0, -800
                  vrsub.vx   v30,v28,a0
                  srli       a2, s9, 5
                  or         t0, t2, s2
                  vslide1up.vx v26,v25,s3,v0.t
                  vslide1up.vx v29,v27,zero
                  or         t0, t1, s8
                  rem        s9, a7, ra
                  vsll.vx    v23,v24,t0,v0.t
                  srl        a5, a3, tp
                  vmul.vx    v20,v3,t3,v0.t
                  vfmin.vf   v0,v22,ft5
                  remu       s1, a7, a5
                  vsadd.vi   v27,v13,0,v0.t
                  srl        s9, s5, tp
                  lui        a6, 684843
                  vslide1up.vx v7,v20,tp
                  srai       t1, zero, 0
                  vadd.vx    v19,v13,a7,v0.t
                  sltu       s7, a5, sp
                  xor        s2, a2, ra
                  addi       t1, t0, -653
                  vslideup.vx v14,v9,t4
                  vslide1up.vx v17,v12,ra,v0.t
                  vfmax.vv   v27,v12,v10
                  auipc      s4, 401363
                  addi       a2, a1, -361
                  vsaddu.vv  v26,v10,v29,v0.t
                  div        t0, s7, s7
                  vfmax.vf   v18,v15,ft4,v0.t
                  vadc.vxm   v5,v11,s3,v0
                  srl        t2, s8, tp
                  sltiu      a4, tp, -871
                  andi       t2, s1, -130
                  mul        tp, t2, t0
                  rem        s11, s6, a1
                  xori       a3, s9, 921
                  vmul.vv    v6,v21,v3,v0.t
                  and        s7, tp, t6
                  sltu       a1, s8, a7
                  addi       zero, t5, 364
                  sll        t6, a4, t6
                  andi       t5, s5, -18
                  sll        s4, s4, a6
                  xor        s9, sp, t6
                  mul        a2, a7, a5
                  addi       s5, t1, -641
                  slli       s6, s5, 18
                  mulhsu     s9, s9, a6
                  rem        t6, s7, gp
                  slli       t5, s4, 6
                  divu       t2, a2, a3
                  vfmax.vv   v14,v24,v12
                  vmadd.vv   v24,v21,v17,v0.t
                  srl        ra, t6, s9
                  xor        a1, a6, tp
                  divu       s7, gp, t0
                  sltiu      a2, tp, 953
                  sub        s3, t2, zero
                  vsll.vx    v15,v30,a6
                  slti       s2, a2, 899
                  srl        s10, t5, s2
                  vrsub.vi   v26,v31,0
                  vmulhu.vv  v21,v16,v22,v0.t
                  vfmin.vv   v7,v20,v22
                  vsll.vx    v29,v18,a6,v0.t
                  vslide1up.vx v1,v29,a1
                  or         a4, a4, s8
                  vadc.vim   v15,v23,0,v0
                  sra        t5, t0, tp
                  div        sp, t3, s11
                  srai       s7, a3, 7
                  auipc      sp, 19857
                  mulh       t2, a2, s9
                  vsll.vv    v8,v0,v17
                  mulhu      a1, a7, sp
                  add        a4, a1, s11
                  vadc.vvm   v12,v1,v3,v0
                  vsub.vx    v17,v4,t5
                  vsll.vx    v22,v16,s0
                  vfmax.vf   v12,v4,ft6,v0.t
                  vslideup.vi v0,v26,0
                  vmadd.vx   v30,a1,v2
                  ori        a3, t6, 92
                  vfmin.vv   v2,v1,v8
                  vsub.vx    v8,v2,t6,v0.t
                  vmul.vx    v21,v5,a2
                  slli       s1, t6, 30
                  slli       a5, t1, 2
                  srl        a0, s10, a3
                  addi       a1, s9, -524
                  vrsub.vi   v31,v2,0,v0.t
                  divu       a0, a7, a7
                  and        s11, t3, s5
                  vmulhu.vx  v1,v1,gp,v0.t
                  vfmax.vf   v24,v20,fa5,v0.t
                  vslidedown.vi v22,v10,0
                  slt        s6, a2, zero
                  sll        s8, s5, a2
                  slt        t1, s4, s9
                  sltu       a3, a1, s0
                  vsub.vv    v1,v5,v1
                  xor        s4, s4, s10
                  sub        t5, t2, a0
                  vslidedown.vx v31,v4,a5
                  vfmax.vv   v10,v8,v17,v0.t
                  sll        a0, t0, s3
                  sra        s8, a2, tp
                  vmulh.vv   v9,v10,v23,v0.t
                  vfmax.vf   v10,v4,ft4,v0.t
                  rem        t0, s11, t1
                  srli       tp, t6, 18
                  mulh       a6, s2, a6
                  or         a2, a7, sp
                  vrsub.vx   v7,v27,a6,v0.t
                  addi       gp, zero, -106
                  vadd.vx    v2,v31,s8,v0.t
                  or         a3, s3, a7
                  vslide1up.vx v31,v22,s8
                  vmul.vv    v21,v14,v16
                  vslideup.vx v26,v11,a7,v0.t
                  addi       a3, tp, 218
                  divu       t2, t5, a1
                  vmadd.vx   v21,a4,v29,v0.t
                  auipc      tp, 1031539
                  auipc      s7, 465858
                  slt        t0, s2, a2
                  srli       s8, s7, 12
                  andi       a0, zero, 24
                  and        a3, a4, a4
                  andi       ra, s8, -971
                  vfmax.vf   v1,v3,fa2,v0.t
                  lui        s9, 519993
                  vmul.vv    v19,v29,v8
                  vslideup.vx v29,v18,t5
                  vsaddu.vx  v21,v16,sp,v0.t
                  vslide1up.vx v0,v26,t2
                  sltiu      s5, t5, 454
                  andi       a5, s3, -534
                  vslidedown.vx v15,v31,s10,v0.t
                  vmul.vv    v8,v30,v17
                  mulh       t3, t6, t3
                  vmulhu.vv  v25,v15,v12,v0.t
                  vslidedown.vi v4,v21,0,v0.t
                  remu       t6, s2, t0
                  vmulh.vx   v30,v10,ra
                  vmulh.vx   v2,v8,t4
                  vmulh.vv   v3,v11,v0
                  mulhu      s8, t6, ra
                  srai       zero, s6, 26
                  xor        a0, a0, t6
                  xori       t3, a0, -874
                  mulhu      a6, s0, sp
                  auipc      t0, 499381
                  div        s9, s5, a7
                  sltiu      s5, s8, -450
                  vfmax.vv   v7,v26,v22
                  rem        gp, s3, s8
                  srli       tp, ra, 16
                  srli       s7, a0, 18
                  vsll.vv    v14,v18,v0
                  divu       s5, a3, a0
                  vslidedown.vx v8,v22,a1
                  mul        s8, a0, s11
                  vrsub.vx   v8,v25,s1
                  and        s6, zero, s9
                  vmul.vv    v3,v24,v12
                  vmadd.vv   v18,v10,v4,v0.t
                  andi       t3, a7, -415
                  add        a2, s2, t2
                  slti       a3, s10, -884
                  vrsub.vi   v29,v25,0,v0.t
                  rem        a4, s6, s11
                  sll        a4, gp, s8
                  srai       t3, t3, 26
                  sltu       s11, s3, sp
                  vfmin.vv   v19,v26,v15,v0.t
                  andi       t5, a1, 388
                  divu       t3, a0, s11
                  remu       gp, s8, t2
                  vmadd.vv   v23,v16,v27
                  sltu       a4, t5, s4
                  or         s3, a7, t5
                  vadd.vi    v31,v8,0
                  slti       s11, a5, 592
                  vslideup.vi v13,v30,0,v0.t
                  and        a6, a3, a3
                  divu       a5, a0, t4
                  vslidedown.vx v9,v4,s6
                  xor        s3, sp, ra
                  sltiu      t2, t4, -46
                  vsaddu.vv  v11,v14,v19
                  vslide1up.vx v1,v22,tp,v0.t
                  divu       ra, s7, a7
                  vfmin.vf   v0,v2,ft9
                  vrsub.vx   v31,v3,s1
                  vmulhu.vx  v3,v0,s1,v0.t
                  vslide1up.vx v26,v7,a4
                  srli       s3, s8, 14
                  sub        a0, tp, s5
                  slti       s8, s0, -584
                  xori       t5, a1, -980
                  mulhu      a3, a0, a7
                  remu       ra, s11, s8
                  srl        t3, a3, a6
                  vfmax.vv   v30,v17,v17
                  vmulh.vx   v22,v29,sp
                  vfmax.vv   v21,v16,v14,v0.t
                  vmul.vx    v3,v26,a0,v0.t
                  slti       sp, sp, -881
                  mulhu      s9, t0, t5
                  rem        t1, t1, t2
                  srl        s3, ra, s3
                  mul        t3, a4, s5
                  xori       a5, t1, -185
                  srai       a5, t4, 17
                  vsadd.vi   v23,v1,0,v0.t
                  vsaddu.vx  v15,v9,a2
                  slli       t0, sp, 10
                  sub        a6, s10, s0
                  sll        t0, s7, a3
                  slt        s3, t2, tp
                  vfmin.vv   v30,v6,v26,v0.t
                  vmulhu.vv  v7,v27,v10
                  mulh       s10, gp, s9
                  vadc.vim   v16,v28,0,v0
                  sltiu      a1, t6, -708
                  vmulhu.vx  v5,v26,ra
                  mul        a2, s8, a7
                  slt        s5, a2, t5
                  auipc      s3, 418403
                  srli       t0, s10, 15
                  xor        s6, s9, t4
                  sltiu      ra, a6, -523
                  srai       sp, a7, 14
                  vfmax.vv   v2,v19,v30,v0.t
                  vsub.vv    v16,v25,v0,v0.t
                  divu       t2, t5, s2
                  and        t1, s11, s1
                  vsll.vx    v16,v16,s6,v0.t
                  sub        ra, a1, a1
                  divu       s5, t2, a2
                  mul        a0, sp, s2
                  andi       a4, t5, 731
                  srl        a2, t3, t4
                  sltu       s2, s7, zero
                  ori        s11, tp, 144
                  mulhsu     s6, a6, a7
                  vfmax.vf   v19,v18,fs11,v0.t
                  mulhu      s10, s7, a5
                  sltu       t3, a5, s10
                  mul        zero, zero, s3
                  divu       s11, a5, a6
                  mul        t2, t1, a3
                  mul        t5, a7, a6
                  vmulhu.vv  v13,v26,v24,v0.t
                  vfmin.vf   v20,v0,ft5
                  sra        t3, tp, s1
                  mul        zero, s8, s10
                  sltiu      a0, t6, -107
                  sra        a0, s5, s6
                  vmul.vx    v8,v25,t4
                  sltu       sp, t6, t5
                  auipc      s11, 220744
                  mulhsu     s4, ra, s6
                  mulhu      a0, a0, s4
                  vslideup.vx v13,v9,s0,v0.t
                  vsll.vx    v3,v27,ra
                  vadd.vi    v18,v7,0
                  vfmax.vf   v1,v6,fa1
                  srl        a1, s10, s6
                  slli       t3, s0, 23
                  srai       a6, t6, 30
                  and        t3, a2, a0
                  srl        t1, s2, a5
                  andi       zero, t2, -419
                  vslidedown.vx v12,v21,gp
                  vfmax.vv   v4,v21,v5,v0.t
                  vsub.vv    v18,v13,v24,v0.t
                  addi       a6, s11, 462
                  ori        gp, a6, 145
                  sra        s6, t5, s6
                  vfmax.vv   v8,v29,v6
                  sltu       s9, t0, s4
                  divu       a4, a3, s5
                  lui        tp, 499125
                  xor        tp, s2, a1
                  slt        s11, tp, s7
                  sub        s7, a4, s1
                  slt        s11, a2, t2
                  mulh       s7, t2, s3
                  srli       t6, a6, 0
                  sll        t2, s9, a7
                  sltiu      t1, s9, 305
                  mulh       a6, s3, zero
                  srai       a2, a5, 16
                  vmulh.vx   v12,v5,s8
                  vrsub.vx   v7,v26,t4
                  xori       zero, zero, 1002
                  mulhu      s8, tp, t2
                  vsaddu.vv  v12,v16,v2,v0.t
                  sltu       sp, s11, t2
                  add        t1, a0, t3
                  vmadd.vx   v20,s0,v27
                  sub        a2, a4, t3
                  add        a2, t5, a7
                  or         a5, s8, s8
                  xor        zero, a7, s8
                  vadd.vi    v5,v22,0,v0.t
                  vmulhu.vv  v4,v24,v15
                  sltu       gp, zero, gp
                  add        t3, t5, s7
                  vsadd.vi   v20,v18,0,v0.t
                  srai       t6, s2, 27
                  mulh       sp, sp, gp
                  vslideup.vi v6,v9,0,v0.t
                  vadd.vv    v16,v22,v7
                  vslide1up.vx v1,v17,a3
                  vfmax.vv   v18,v13,v1,v0.t
                  sub        s11, s6, s8
                  sltu       tp, t0, s4
                  sll        ra, sp, s11
                  or         t2, t3, a6
                  vadd.vv    v14,v6,v12
                  auipc      s5, 737546
                  andi       a5, s4, -168
                  vadc.vim   v5,v23,0,v0
                  mulh       s4, t6, s7
                  sra        a2, zero, s3
                  xor        t6, a1, t0
                  lui        a5, 363569
                  sltiu      a1, t5, -650
                  srl        s10, a5, t3
                  divu       s7, s3, s6
                  vslide1up.vx v31,v13,s6,v0.t
                  vmadd.vx   v11,a1,v21
                  vslidedown.vx v15,v11,a1,v0.t
                  vfmin.vf   v27,v7,fa6
                  mul        ra, s11, s8
                  vsub.vx    v24,v4,t6,v0.t
                  mulhsu     t6, s3, tp
                  srli       sp, s7, 1
                  div        s9, t0, s0
                  vsub.vv    v18,v28,v6,v0.t
                  vadc.vim   v22,v12,0,v0
                  slt        a5, gp, s7
                  sltiu      s2, a5, -578
                  andi       s1, s9, -496
                  divu       a1, s6, s0
                  or         gp, t2, a2
                  andi       s9, s11, 517
                  slt        s5, s5, a7
                  vslide1up.vx v12,v18,s0,v0.t
                  sltu       t2, a3, a0
                  slti       a5, s3, -606
                  vsaddu.vx  v20,v9,a2,v0.t
                  vsub.vv    v19,v27,v23,v0.t
                  vmadd.vv   v26,v2,v5,v0.t
                  andi       s9, t0, 971
                  slli       s3, s4, 22
                  vslide1up.vx v15,v7,t2
                  vsadd.vx   v13,v20,s11
                  add        t2, s9, t6
                  vsub.vv    v23,v16,v0
                  slli       s7, t5, 2
                  sltiu      a0, t5, -766
                  sltiu      a4, s7, 272
                  srl        s11, t0, s9
                  rem        a1, zero, t5
                  lui        s6, 672722
                  vfmin.vf   v19,v2,ft11,v0.t
                  srl        a4, s7, t1
                  sll        s8, s10, s4
                  sra        gp, t4, s4
                  slt        t1, t4, s0
                  sll        a6, ra, a2
                  vsadd.vi   v29,v22,0
                  slt        sp, s1, a6
                  and        a4, sp, a4
                  sll        ra, a6, s4
                  slt        gp, sp, s2
                  auipc      t6, 870747
                  and        t6, t6, a0
                  andi       s2, s1, 895
                  vsaddu.vx  v15,v17,t6
                  xor        s5, a3, a0
                  vsll.vi    v15,v8,0
                  vslidedown.vi v5,v11,0,v0.t
                  vsub.vv    v5,v1,v25,v0.t
                  vmulh.vv   v1,v8,v26,v0.t
                  andi       a0, t5, -867
                  sltiu      a0, a6, 204
                  vadd.vi    v21,v27,0
                  mul        t2, t3, s11
                  vfmax.vf   v2,v7,fa6
                  mulhu      s8, s3, t6
                  slti       t2, tp, 671
                  mulhsu     s7, ra, t4
                  sll        t0, s7, ra
                  srli       a3, s6, 16
                  addi       s4, s0, -573
                  divu       s5, t0, s5
                  andi       a2, s11, -657
                  srai       s2, gp, 7
                  sltu       t5, t0, t5
                  srli       ra, s4, 0
                  rem        s2, ra, a1
                  srai       s1, a1, 3
                  slt        t3, a5, a6
                  vsub.vv    v0,v10,v9
                  add        s4, s8, s11
                  and        s9, a7, a6
                  vadc.vxm   v28,v21,a0,v0
                  and        t1, s1, a1
                  slli       s1, a7, 28
                  mulhsu     t1, s7, zero
                  mulh       t1, zero, a7
                  auipc      t3, 240451
                  vfmax.vf   v3,v15,fa0,v0.t
                  or         ra, s10, gp
                  vslide1up.vx v8,v12,a1,v0.t
                  auipc      zero, 998755
                  and        s5, a2, a5
                  mulh       t6, t0, t3
                  srl        s9, t2, t1
                  vfmin.vf   v24,v24,ft9
                  srl        s6, t1, a2
                  vmulh.vv   v14,v25,v9,v0.t
                  vmadd.vx   v1,s7,v19
                  sra        sp, s7, s0
                  slli       s9, t4, 24
                  vsaddu.vv  v30,v1,v2,v0.t
                  srai       t6, zero, 15
                  or         a1, t5, s6
                  vfmin.vv   v6,v14,v29
                  slli       ra, sp, 17
                  vfmax.vf   v31,v17,fs1,v0.t
                  vmulh.vx   v11,v8,s11
                  vslide1up.vx v25,v23,s4,v0.t
                  sll        s3, s3, a5
                  vmul.vx    v12,v19,t3
                  slli       s1, s5, 28
                  addi       s9, s6, -728
                  vsadd.vx   v29,v20,zero,v0.t
                  vmul.vx    v25,v13,s9
                  vslide1up.vx v3,v0,sp
                  vmul.vv    v22,v22,v15
                  vmadd.vx   v30,a4,v14
                  vmadd.vv   v10,v4,v8
                  slti       s9, s4, 56
                  sub        t0, s6, a7
                  vsadd.vi   v11,v12,0,v0.t
                  auipc      t0, 836398
                  mulhsu     a5, a1, a1
                  remu       s9, s3, a4
                  addi       s6, ra, 843
                  mul        s6, ra, zero
                  or         s3, s0, a3
                  vsll.vx    v31,v8,tp
                  vslide1up.vx v18,v28,s11
                  div        s5, tp, s11
                  vsaddu.vx  v7,v17,s9,v0.t
                  addi       a6, sp, 383
                  lui        s1, 978383
                  vsaddu.vi  v12,v23,0,v0.t
                  vmulh.vv   v3,v10,v19,v0.t
                  auipc      t0, 464359
                  mulhu      ra, t3, t6
                  srai       s5, s8, 9
                  sub        zero, t3, s4
                  srli       t3, s4, 2
                  vmulhu.vv  v20,v30,v9,v0.t
                  auipc      zero, 872124
                  sltu       s2, s4, s8
                  and        a6, s10, t3
                  sra        s9, zero, s9
                  auipc      tp, 324370
                  remu       a1, a0, sp
                  mulhsu     s10, tp, t2
                  divu       s3, s10, s0
                  sltu       t2, t6, t6
                  sub        s7, t5, a3
                  slt        s11, a5, t6
                  slti       s2, s7, 240
                  add        a1, a3, a2
                  or         gp, a5, s10
                  slli       s7, zero, 23
                  sub        s1, s6, s5
                  divu       t5, sp, s3
                  sub        a1, a1, a1
                  slt        a0, s9, s9
                  slt        gp, ra, s10
                  vmulhu.vv  v24,v20,v24
                  xori       s10, a2, 1020
                  slt        a3, t6, a1
                  vslideup.vx v11,v4,s9
                  sll        tp, s10, t2
                  sub        t3, s5, a1
                  slt        a5, zero, s9
                  vslide1up.vx v8,v0,ra,v0.t
                  mul        s3, a5, gp
                  vsub.vx    v31,v8,a6,v0.t
                  vadc.vim   v11,v31,0,v0
                  mulhsu     t5, t6, s11
                  vadd.vx    v17,v8,a2,v0.t
                  and        s2, zero, s4
                  srai       s11, s7, 9
                  vrsub.vx   v13,v16,t2,v0.t
                  addi       a3, t6, 692
                  slt        a4, t4, a3
                  sltiu      tp, s3, -468
                  div        gp, s0, a5
                  vmulhu.vx  v4,v30,s7,v0.t
                  sltu       a1, s0, a0
                  add        s7, s6, a0
                  vmul.vx    v8,v6,s3,v0.t
                  xor        s6, s1, sp
                  vmulh.vv   v11,v31,v12
                  sra        a4, gp, t6
                  vmadd.vx   v9,a7,v8,v0.t
                  vrsub.vi   v30,v26,0,v0.t
                  srli       t2, a0, 29
                  rem        sp, a7, t1
                  vmulh.vv   v29,v19,v22,v0.t
                  vadc.vim   v18,v30,0,v0
                  rem        a5, a5, a0
                  vfmax.vf   v18,v15,fs4
                  slt        a3, s11, t2
                  vfmax.vv   v25,v24,v4
                  ori        s5, s5, -651
                  vslide1up.vx v19,v6,t6,v0.t
                  mulhu      a1, a4, s2
                  remu       t1, s8, ra
                  sra        s6, s8, tp
                  vsub.vx    v6,v28,a0
                  vrsub.vi   v19,v21,0
                  mul        t3, sp, a6
                  slli       a1, t5, 30
                  mulhsu     a0, a7, s0
                  vsadd.vv   v4,v6,v27
                  srai       zero, s5, 24
                  sub        s3, s1, s3
                  vsub.vv    v21,v21,v24
                  slti       s9, a4, 828
                  slti       t0, s3, -14
                  vsadd.vv   v23,v28,v25,v0.t
                  slt        s6, s8, tp
                  vslidedown.vx v6,v0,a3
                  sll        a3, s3, t4
                  sll        s11, s4, t5
                  vmadd.vv   v6,v18,v9
                  mulh       s8, s1, s0
                  remu       s6, s2, ra
                  srai       ra, t4, 31
                  vmulh.vx   v2,v18,t0,v0.t
                  srl        t2, s6, s4
                  mulhsu     t0, a5, s10
                  vsub.vx    v15,v31,s8
                  addi       gp, s11, 823
                  vmul.vx    v16,v31,t6,v0.t
                  remu       t2, t3, zero
                  vsadd.vx   v5,v17,a7
                  vmul.vv    v20,v8,v7,v0.t
                  vmulhu.vx  v24,v12,zero
                  sub        t5, s8, sp
                  div        s4, gp, s1
                  srli       a1, a4, 10
                  xor        s5, a0, s4
                  vslide1up.vx v3,v31,ra,v0.t
                  slt        a5, tp, zero
                  vsadd.vx   v22,v1,gp
                  vslidedown.vx v15,v5,a0,v0.t
                  rem        t3, a4, s8
                  vsaddu.vx  v22,v30,gp,v0.t
                  or         s4, a7, a4
                  vfmax.vv   v29,v10,v14,v0.t
                  vmulh.vx   v13,v5,t6,v0.t
                  add        t2, s6, sp
                  vrsub.vi   v30,v14,0
                  lui        s7, 388281
                  vslidedown.vi v9,v0,0,v0.t
                  andi       s2, s1, 354
                  auipc      s4, 75115
                  andi       s8, s1, 296
                  add        s4, s3, a4
                  srai       a4, a2, 4
                  slli       t1, zero, 2
                  slti       s5, s4, -572
                  vsaddu.vx  v12,v18,s10,v0.t
                  srai       ra, gp, 28
                  vslidedown.vi v23,v11,0
                  mulhu      ra, a2, s11
                  vrsub.vi   v3,v21,0,v0.t
                  andi       s10, ra, 386
                  vslidedown.vx v14,v20,s11
                  vslide1up.vx v11,v16,s1,v0.t
                  auipc      s7, 306306
                  ori        a5, s4, -977
                  sll        s2, a4, s1
                  vmadd.vv   v0,v5,v23
                  xor        a3, a1, s8
                  sltu       s11, s9, s5
                  slti       s8, s5, -76
                  sltiu      t0, t1, 335
                  vfmin.vf   v23,v27,fs1
                  mulhsu     a5, t1, s1
                  vmul.vv    v20,v8,v2
                  vmulhu.vx  v5,v26,a2
                  addi       s11, s10, -241
                  vfmin.vf   v23,v3,ft6
                  mul        s9, a4, a5
                  vsll.vv    v29,v3,v20,v0.t
                  vsll.vi    v21,v28,0,v0.t
                  srl        tp, t6, s9
                  and        t2, a6, a1
                  vfmax.vv   v30,v2,v4,v0.t
                  vadc.vvm   v23,v20,v24,v0
                  and        t6, tp, tp
                  ori        gp, s2, 73
                  vrsub.vi   v29,v9,0,v0.t
                  xori       t0, zero, 981
                  slti       ra, ra, -156
                  divu       zero, a6, a7
                  slt        s6, t2, sp
                  rem        s6, a6, a2
                  vsadd.vx   v18,v19,a5
                  mulh       s2, zero, s10
                  mul        s1, t6, t3
                  vmadd.vv   v3,v24,v1
                  vrsub.vi   v25,v28,0,v0.t
                  srai       sp, s0, 15
                  divu       sp, t1, s9
                  mul        s7, t2, s6
                  divu       ra, s8, ra
                  mulh       s3, sp, a7
                  mul        t6, a0, gp
                  vrsub.vi   v28,v21,0
                  xori       a2, s10, 247
                  xori       t5, a6, -754
                  vslideup.vi v1,v11,0
                  mulhsu     ra, zero, t6
                  vmulh.vv   v29,v21,v27
                  srli       a4, t1, 4
                  vrsub.vx   v0,v15,a5
                  vsll.vi    v26,v4,0
                  slt        s1, a6, t2
                  ori        a2, zero, 23
                  xor        a2, s10, a5
                  ori        s9, a3, -95
                  divu       a0, s7, s3
                  sltu       tp, a1, a7
                  div        a0, a4, a1
                  lui        t1, 950724
                  slt        t6, s9, s3
                  or         a3, s3, zero
                  addi       s4, a0, -236
                  mulh       gp, s9, t0
                  xor        a3, tp, a6
                  srl        s3, t4, s8
                  vslide1up.vx v30,v25,t2,v0.t
                  xori       t2, s10, -190
                  sll        t2, s10, gp
                  andi       s4, zero, 1017
                  vfmax.vf   v18,v7,fs2,v0.t
                  divu       s5, a3, a2
                  vslidedown.vi v17,v6,0
                  vmulhu.vx  v17,v9,a6
                  vmulhu.vv  v22,v9,v30
                  lui        a4, 828305
                  lui        a4, 110276
                  vrsub.vi   v0,v13,0
                  vsll.vv    v1,v6,v12,v0.t
                  divu       s9, a5, a0
                  xor        a5, s11, sp
                  mulh       a3, s3, ra
                  remu       s7, s4, ra
                  vsll.vi    v14,v14,0
                  sltiu      sp, tp, 317
                  or         t3, a0, s11
                  vslide1up.vx v2,v4,t5
                  vmadd.vv   v15,v29,v13
                  vslidedown.vi v22,v24,0,v0.t
                  auipc      s10, 1034145
                  and        tp, s3, tp
                  srli       a6, a7, 22
                  and        a0, s3, zero
                  vslidedown.vi v5,v8,0
                  srai       a3, t6, 21
                  vfmin.vv   v2,v1,v15,v0.t
                  sll        t2, a0, a1
                  mulhsu     a0, tp, a5
                  mul        s11, t2, a1
                  mulhsu     s3, a7, s5
                  vmadd.vv   v23,v22,v6,v0.t
                  slli       s2, a6, 13
                  add        t5, a0, s8
                  sll        a4, s9, a7
                  vmulhu.vv  v0,v7,v27
                  vmulhu.vx  v22,v23,a5,v0.t
                  sra        t2, s8, s8
                  vmulhu.vv  v30,v18,v4,v0.t
                  vmulhu.vx  v5,v16,s1
                  mul        s7, t1, s11
                  sll        s2, s10, t5
                  vadc.vim   v29,v31,0,v0
                  xor        t0, t6, tp
                  vadc.vvm   v30,v25,v16,v0
                  sltu       s9, t0, a7
                  slti       t6, a4, 261
                  or         a5, s2, a7
                  sub        s8, t2, a1
                  remu       s11, a2, s0
                  xori       s11, s0, 358
                  vsaddu.vx  v23,v18,s3,v0.t
                  vsll.vv    v9,v0,v13
                  slti       t3, t1, 313
                  sll        s9, t5, s10
                  rem        a4, t0, s6
                  sll        s8, sp, t2
                  sltiu      tp, s7, 943
                  xori       t5, s1, -353
                  rem        s10, t4, t5
                  vmulhu.vx  v9,v3,sp,v0.t
                  vsub.vv    v0,v26,v5
                  mulhu      a5, s0, a0
                  sll        t6, t4, s1
                  lui        ra, 617084
                  xor        s10, a3, a1
                  vmulhu.vx  v13,v8,s8
                  xor        a1, s8, t1
                  lui        t5, 880434
                  vfmax.vv   v11,v27,v20,v0.t
                  vrsub.vx   v28,v28,a5
                  vsub.vx    v1,v18,s8,v0.t
                  add        s1, tp, a7
                  and        a0, t5, gp
                  slti       zero, s1, -313
                  vfmin.vf   v18,v2,fa0
                  sll        a1, zero, zero
                  rem        a0, t0, ra
                  remu       a4, s4, s6
                  vrsub.vi   v15,v1,0
                  vfmin.vv   v23,v4,v17
                  sub        a0, s11, a3
                  mul        s2, s1, s1
                  rem        sp, a7, t6
                  auipc      t1, 406625
                  mulhu      s6, tp, s5
                  vadc.vvm   v9,v4,v7,v0
                  add        zero, s11, s8
                  sll        a5, t5, s5
                  addi       a1, a3, 119
                  vsub.vx    v3,v3,a1
                  vslidedown.vi v29,v31,0
                  andi       ra, s5, -353
                  mulh       s3, a2, a3
                  vmadd.vx   v1,s8,v28,v0.t
                  mul        a1, s4, a0
                  rem        s6, zero, a1
                  slli       s2, s7, 4
                  vslideup.vi v12,v8,0
                  xor        zero, gp, sp
                  andi       s7, a1, -14
                  mulhu      gp, s0, s0
                  vadc.vim   v17,v1,0,v0
                  vslide1up.vx v20,v1,a2,v0.t
                  rem        gp, s0, s10
                  sltiu      sp, t4, 901
                  mul        a4, s6, a6
                  vmulh.vv   v14,v17,v15,v0.t
                  vmul.vx    v7,v24,t5,v0.t
                  div        s5, s9, t1
                  vfmax.vv   v19,v0,v12,v0.t
                  sltu       zero, zero, s7
                  and        s4, a2, t1
                  slt        t6, tp, t4
                  div        zero, a1, a4
                  lui        s2, 195657
                  vslideup.vx v3,v15,s10,v0.t
                  lui        a5, 636413
                  slti       a5, s8, 782
                  div        s9, a6, s1
                  vfmax.vv   v9,v8,v24
                  sltu       t1, s0, a4
                  srai       tp, t1, 20
                  vsadd.vx   v21,v19,ra
                  vmadd.vv   v30,v3,v1
                  rem        ra, s11, s0
                  div        s2, s7, a4
                  vmulh.vv   v21,v14,v24,v0.t
                  vmulhu.vv  v4,v19,v1,v0.t
                  add        t1, s1, s5
                  addi       s3, s11, 830
                  srli       gp, t2, 17
                  sra        sp, t6, a3
                  ori        s7, s0, -591
                  auipc      tp, 927378
                  and        a0, a4, s1
                  sltu       t3, a6, a3
                  srli       gp, a1, 28
                  vrsub.vx   v19,v27,s3,v0.t
                  divu       a0, s9, s2
                  sll        a2, t4, gp
                  srli       t2, s8, 15
                  sub        t5, s2, a6
                  mul        sp, ra, a3
                  divu       s4, sp, t1
                  srai       t6, a1, 18
                  xor        s7, gp, s6
                  vmulhu.vv  v23,v16,v11,v0.t
                  vsadd.vv   v8,v27,v1
                  vrsub.vi   v21,v26,0,v0.t
                  addi       s4, a0, 354
                  sltiu      gp, s11, 303
                  srl        ra, t5, a5
                  auipc      s11, 965065
                  slli       a5, s3, 21
                  vslide1up.vx v2,v23,s5,v0.t
                  sll        a5, t5, s7
                  addi       t6, t1, -491
                  sub        sp, s3, a6
                  vfmin.vf   v5,v12,ft6,v0.t
                  mul        t5, t3, t2
                  sra        a6, gp, t5
                  vsaddu.vv  v23,v7,v4,v0.t
                  mul        t6, s10, s0
                  slti       tp, t6, 417
                  div        zero, s7, a7
                  sltiu      tp, s2, 632
                  mulh       a6, a0, sp
                  vsadd.vi   v6,v19,0,v0.t
                  vsll.vx    v3,v23,s6
                  mulh       s7, s11, s0
                  sltu       t3, t2, s8
                  sltiu      zero, t1, -541
                  mul        a2, a1, sp
                  vsadd.vv   v15,v10,v15
                  slti       t3, a3, 484
                  vsaddu.vv  v31,v10,v27
                  vsub.vv    v14,v28,v7
                  vslidedown.vi v10,v8,0,v0.t
                  vrsub.vi   v5,v11,0,v0.t
                  sra        s1, s8, ra
                  addi       tp, t0, 626
                  div        s4, s7, t3
                  vfmin.vv   v18,v23,v17
                  vslide1up.vx v30,v14,a5,v0.t
                  vrsub.vi   v1,v24,0,v0.t
                  srli       t6, s7, 5
                  auipc      t3, 708119
                  vmulhu.vx  v7,v13,s1
                  slti       s1, s11, -620
                  auipc      s5, 448741
                  vsub.vv    v10,v21,v23,v0.t
                  andi       t2, a2, 574
                  sra        gp, s0, s10
                  sll        t0, s1, t5
                  vslide1up.vx v2,v11,tp,v0.t
                  and        gp, a6, a4
                  lui        t6, 575469
                  srai       a5, s6, 17
                  vsub.vx    v20,v22,sp
                  vfmax.vf   v17,v25,ft4
                  vmul.vx    v7,v5,a0,v0.t
                  mulh       s2, a0, s5
                  vslideup.vi v14,v2,0
                  slt        s4, s3, t4
                  vmulhu.vv  v6,v8,v18,v0.t
                  vmadd.vx   v29,t0,v10,v0.t
                  vslide1up.vx v5,v30,s6,v0.t
                  vslideup.vi v13,v24,0
                  vrsub.vi   v28,v7,0,v0.t
                  vslidedown.vi v18,v27,0,v0.t
                  mulhu      t0, t5, s7
                  vadd.vv    v18,v8,v13,v0.t
                  div        s10, a1, s6
                  sll        s9, s7, a5
                  vsaddu.vi  v11,v15,0,v0.t
                  vadd.vx    v27,v18,zero
                  remu       a3, t5, a5
                  slli       s2, t6, 20
                  remu       s9, s2, s1
                  srl        s2, a5, s6
                  vrsub.vx   v14,v1,s1
                  slti       s4, s1, -1015
                  srai       t2, s11, 18
                  slt        ra, s7, a1
                  vfmin.vv   v29,v28,v27
                  slli       t3, t4, 23
                  mulhu      tp, s11, s7
                  mulhsu     t2, t2, sp
                  vsub.vx    v31,v18,s0
                  srli       t3, s11, 6
                  sub        a0, t4, t4
                  vmul.vx    v12,v22,tp
                  vmulhu.vx  v10,v19,gp
                  mul        t3, a4, s1
                  auipc      s8, 834329
                  div        s5, gp, s5
                  remu       t3, s8, t4
                  vmulhu.vx  v30,v20,s9,v0.t
                  ori        s7, s0, 28
                  mulhsu     a0, s10, s11
                  andi       gp, s10, 949
                  xori       t0, s10, -578
                  vmadd.vv   v10,v5,v23,v0.t
                  vmulh.vv   v12,v13,v22,v0.t
                  xor        a2, a7, s3
                  vsadd.vv   v28,v14,v8,v0.t
                  srli       ra, s10, 10
                  sltu       s1, t6, a1
                  vsadd.vx   v18,v27,s1
                  and        t2, s0, a3
                  remu       a2, a7, s3
                  vfmax.vv   v0,v3,v3
                  vmadd.vv   v23,v23,v21
                  vsaddu.vi  v13,v16,0
                  vslideup.vi v23,v14,0,v0.t
                  sub        t1, s1, gp
                  ori        s6, t4, -326
                  vsaddu.vi  v15,v18,0
                  mulhsu     s5, a6, a7
                  divu       t2, s8, t0
                  vsadd.vx   v13,v30,ra,v0.t
                  vsaddu.vi  v19,v25,0,v0.t
                  addi       s11, tp, -44
                  vadd.vi    v16,v1,0,v0.t
                  mulhu      tp, a5, a1
                  divu       t2, s0, a1
                  vmulhu.vx  v22,v5,tp
                  div        s6, a0, a3
                  slti       s11, a2, -846
                  vsub.vx    v31,v31,a7,v0.t
                  mulh       a0, a6, s6
                  vadc.vxm   v11,v5,t1,v0
                  lui        a3, 924940
                  remu       a1, s1, gp
                  vsll.vv    v19,v22,v30,v0.t
                  vslidedown.vi v0,v24,0
                  andi       s4, sp, 765
                  addi       s11, a1, -934
                  or         s1, s10, s6
                  vslideup.vx v27,v11,t6
                  vmul.vv    v8,v14,v22
                  srl        a5, a5, t0
                  vmul.vx    v21,v4,s11
                  vsadd.vx   v2,v0,s9
                  divu       a1, s7, s11
                  srl        t3, t0, a6
                  rem        s5, a4, gp
                  div        sp, s3, s11
                  lui        t1, 3846
                  vfmax.vv   v23,v16,v24,v0.t
                  mul        s5, s1, a5
                  srl        t0, t4, s5
                  sll        ra, s10, s5
                  sll        t0, a2, a1
                  add        a4, t1, t2
                  mulhsu     s6, a0, s8
                  andi       a1, t2, -678
                  xor        a1, a1, s10
                  vmul.vx    v20,v15,s1,v0.t
                  or         s7, s6, t2
                  vsaddu.vv  v16,v24,v3,v0.t
                  vadc.vvm   v26,v13,v16,v0
                  vsadd.vi   v12,v13,0
                  vsub.vv    v6,v5,v23
                  srl        zero, a4, s7
                  vslide1up.vx v27,v30,s0
                  vsadd.vx   v18,v1,s11
                  vmul.vv    v4,v21,v14,v0.t
                  sub        ra, a1, t6
                  sltu       s10, a0, a5
                  vadc.vxm   v27,v24,a3,v0
                  sub        s1, s11, a0
                  vmulh.vx   v17,v7,s8,v0.t
                  srli       t1, a0, 18
                  mulh       a2, a5, s1
                  srai       s9, a0, 6
                  andi       t1, t6, -161
                  vfmin.vv   v23,v8,v4
                  remu       a2, t4, zero
                  vmulhu.vv  v17,v15,v5
                  sub        a0, a7, zero
                  sra        s2, s8, s10
                  add        t5, s5, s10
                  mul        s11, ra, s7
                  srl        t6, t1, t6
                  vsub.vx    v8,v28,a7,v0.t
                  lui        sp, 442590
                  mulhu      sp, t0, s11
                  andi       t0, s9, 40
                  mulh       ra, s10, s4
                  slt        a6, t4, s5
                  mulh       a3, tp, tp
                  sra        t3, s8, t1
                  srli       s10, s2, 19
                  vadd.vi    v31,v24,0,v0.t
                  auipc      t6, 171884
                  div        s1, s8, s2
                  vadc.vim   v9,v18,0,v0
                  add        s3, a2, zero
                  vsub.vv    v18,v29,v18,v0.t
                  vsll.vv    v14,v7,v31
                  auipc      s1, 429865
                  vmadd.vx   v28,s11,v26,v0.t
                  rem        a4, a3, gp
                  add        ra, t0, s6
                  vslidedown.vi v28,v20,0,v0.t
                  vsll.vi    v4,v13,0
                  sltiu      t6, ra, -892
                  vmadd.vv   v3,v20,v2
                  or         s3, s3, s11
                  div        s8, a6, s5
                  and        s6, s2, zero
                  slli       a2, t5, 26
                  vmadd.vx   v25,a0,v4
                  mulhsu     s11, s0, s4
                  mulhsu     s8, a6, s8
                  vmulh.vv   v15,v20,v21
                  sll        a2, s9, t6
                  andi       s1, gp, -593
                  slt        a6, s7, sp
                  vmulh.vx   v8,v16,s9
                  srli       s3, a0, 20
                  mulhsu     t0, s6, a2
                  add        sp, t4, a5
                  vmadd.vv   v9,v8,v3
                  addi       s8, s0, -405
                  mul        s1, a1, a1
                  mulh       t1, zero, s8
                  srli       s10, a3, 31
                  lui        tp, 419201
                  slt        a2, t0, a2
                  srai       a2, s6, 8
                  vsaddu.vi  v11,v11,0
                  remu       a0, a3, tp
                  mulhu      t2, a2, s6
                  vsub.vv    v25,v9,v23
                  mulhsu     s3, s8, s11
                  slti       s2, a2, 115
                  xor        a2, a2, s3
                  srai       s6, s10, 29
                  sra        a6, t3, sp
                  and        a4, s0, a3
                  andi       a3, t4, 78
                  ori        t1, gp, -43
                  vsaddu.vv  v24,v7,v3,v0.t
                  vslidedown.vx v22,v16,t3,v0.t
                  mulhsu     t2, s10, tp
                  vadd.vx    v29,v15,t0
                  vsaddu.vi  v0,v14,0
                  lui        t0, 143292
                  slt        s4, t3, a4
                  vmulhu.vv  v19,v4,v11
                  div        zero, a2, s10
                  sll        a5, a4, s7
                  sltiu      sp, a0, -64
                  vmadd.vv   v3,v9,v24,v0.t
                  lui        a1, 553625
                  slti       t1, t0, -404
                  srl        s5, s10, s4
                  slti       s9, t5, 978
                  vslide1up.vx v28,v1,tp,v0.t
                  vslide1up.vx v4,v12,s3
                  xor        zero, s5, a6
                  xori       a1, s2, 63
                  mulh       t6, s11, s6
                  srli       s3, t3, 11
                  xori       tp, t3, 621
                  mul        a6, t2, zero
                  vslideup.vx v28,v10,t0,v0.t
                  add        s6, s2, t6
                  divu       s1, a4, zero
                  srl        t5, s7, s9
                  auipc      gp, 878932
                  xor        t6, t4, s2
                  sltiu      s8, sp, 0
                  rem        a5, tp, t3
                  andi       s2, t5, -697
                  srai       a2, s5, 23
                  vslide1up.vx v27,v7,a6,v0.t
                  slti       a3, s10, -121
                  sub        zero, a6, t6
                  remu       a4, t0, sp
                  vfmax.vv   v0,v27,v2
                  slt        gp, zero, a4
                  add        t0, s6, s7
                  vadd.vv    v28,v28,v12,v0.t
                  div        gp, s11, a2
                  xor        zero, a5, a2
                  auipc      t2, 319208
                  vmulh.vv   v7,v20,v6
                  rem        s2, s1, a1
                  remu       t1, a5, tp
                  vsaddu.vx  v12,v14,s8
                  add        s3, t3, a4
                  slli       s7, zero, 30
                  vrsub.vx   v19,v18,a5
                  vsaddu.vx  v25,v21,t0
                  rem        s10, t3, s11
                  vsll.vx    v29,v21,ra,v0.t
                  slli       a5, a7, 23
                  remu       zero, zero, s9
                  andi       s11, t2, -409
                  srl        s3, t0, tp
                  vsll.vv    v13,v6,v3
                  auipc      t6, 442663
                  divu       s3, s11, s2
                  slti       a5, s4, 345
                  addi       a3, gp, 992
                  slt        tp, t6, t5
                  sltiu      a6, a4, -9
                  vadd.vi    v3,v21,0,v0.t
                  vsub.vv    v19,v18,v17,v0.t
                  vslidedown.vi v26,v9,0,v0.t
                  sub        t0, t1, t6
                  remu       s9, a1, s5
                  vmadd.vx   v3,a0,v2,v0.t
                  vrsub.vi   v12,v14,0,v0.t
                  and        a5, s3, gp
                  vfmax.vf   v15,v10,ft4,v0.t
                  vfmin.vv   v26,v29,v18
                  ori        zero, s11, -463
                  vfmax.vv   v15,v13,v2,v0.t
                  divu       s3, a4, sp
                  lui        s11, 33839
                  vmadd.vv   v31,v26,v23
                  slli       t5, s0, 27
                  srl        t5, s11, a0
                  sll        t0, a4, s1
                  vmulhu.vv  v8,v21,v5
                  mul        tp, t3, s2
                  mul        a6, t3, s9
                  xori       ra, s11, -688
                  vadc.vxm   v12,v26,zero,v0
                  vadc.vxm   v25,v22,gp,v0
                  ori        a3, a7, -338
                  remu       t3, a0, a2
                  or         tp, a1, t2
                  mulhsu     t2, a2, t1
                  rem        gp, s11, t5
                  mulhu      sp, a0, t5
                  srl        t6, a0, ra
                  vadc.vxm   v29,v12,a4,v0
                  mulhsu     gp, a3, t4
                  vslide1up.vx v14,v8,s5,v0.t
                  sltiu      sp, s11, 762
                  sra        a5, ra, zero
                  mulhsu     s4, s8, a0
                  sltu       s7, zero, zero
                  mulhsu     t1, ra, s10
                  sll        sp, t2, tp
                  slti       s10, t0, -593
                  andi       t0, t3, 602
                  vslide1up.vx v30,v18,s7
                  vadc.vvm   v10,v16,v22,v0
                  sltiu      s7, t0, 822
                  slt        t3, s8, s1
                  srli       a2, s5, 4
                  vrsub.vi   v12,v6,0,v0.t
                  vadc.vvm   v22,v5,v14,v0
                  vslide1up.vx v24,v11,s7,v0.t
                  rem        s8, s10, s11
                  vadd.vv    v30,v22,v10
                  rem        s10, sp, t1
                  vmul.vx    v15,v0,a7,v0.t
                  slt        tp, s9, s3
                  slli       t2, a6, 25
                  mulhu      t3, t3, a4
                  and        s6, s10, t0
                  remu       s11, a4, s3
                  sltu       s4, a3, t4
                  xori       s9, s2, 401
                  vrsub.vi   v27,v31,0,v0.t
                  srl        s9, t3, t2
                  vadc.vvm   v12,v25,v8,v0
                  srl        s4, zero, t4
                  slli       a2, t4, 31
                  vadd.vi    v0,v9,0
                  vmul.vv    v13,v19,v10
                  sll        s7, t3, a6
                  mulhu      t5, ra, a3
                  remu       zero, t2, s11
                  mulhsu     a1, gp, s6
                  remu       a5, s2, t5
                  sltu       gp, a0, s2
                  divu       t5, gp, s9
                  vsub.vv    v24,v27,v20,v0.t
                  andi       a6, s0, -954
                  vrsub.vi   v21,v12,0,v0.t
                  vsll.vx    v15,v22,sp
                  vslidedown.vi v19,v14,0
                  vfmax.vv   v21,v30,v14
                  vsadd.vi   v16,v21,0,v0.t
                  sll        a0, s7, zero
                  sltiu      a5, s11, -48
                  divu       s3, s9, zero
                  div        a3, gp, s9
                  ori        s2, s11, 339
                  ori        t1, s3, -962
                  or         s10, s11, a4
                  xor        s11, t0, s0
                  vmadd.vx   v5,gp,v10,v0.t
                  addi       s9, a4, 670
                  ori        t5, t2, -752
                  sltu       a3, a2, ra
                  vsll.vx    v23,v8,s10,v0.t
                  slt        t2, s2, sp
                  add        t2, ra, s4
                  div        a6, s3, s1
                  slti       a6, zero, 395
                  sltu       a6, a7, s3
                  vslideup.vx v9,v16,a5,v0.t
                  auipc      gp, 574208
                  vmulhu.vv  v21,v25,v5
                  lui        t0, 778823
                  div        t2, t0, s11
                  add        t6, a6, s8
                  lui        a0, 83520
                  sub        s9, s7, s4
                  andi       t6, a1, -496
                  slli       t0, t1, 25
                  vsub.vv    v5,v22,v17
                  mulhu      s4, s9, s9
                  vmul.vx    v15,v21,s5
                  vsub.vx    v23,v31,a7,v0.t
                  vmadd.vx   v24,a6,v18
                  auipc      t0, 140347
                  slt        a1, a0, a6
                  mulh       t6, s8, a4
                  xor        ra, sp, sp
                  slli       t2, s3, 9
                  slti       a2, t1, -1012
                  vrsub.vx   v20,v9,s3,v0.t
                  vadd.vi    v8,v19,0
                  add        t2, a3, a6
                  slt        s9, a2, t1
                  vmulhu.vv  v29,v19,v20
                  rem        a2, t1, zero
                  slli       sp, s7, 21
                  vmulh.vv   v20,v1,v13,v0.t
                  vadc.vvm   v9,v4,v16,v0
                  vsll.vx    v19,v27,a7,v0.t
                  vsadd.vv   v27,v28,v9
                  srai       a6, ra, 15
                  vslide1up.vx v23,v0,a4,v0.t
                  auipc      s5, 219848
                  vsub.vv    v1,v23,v7,v0.t
                  vmulh.vv   v3,v13,v23
                  srl        ra, s3, s0
                  vmul.vx    v0,v27,t6
                  vfmax.vv   v21,v15,v0
                  srl        a2, a3, s0
                  slt        s1, a2, t0
                  vsub.vx    v8,v11,t2,v0.t
                  vadc.vvm   v13,v7,v10,v0
                  vmulh.vx   v28,v5,a4
                  sll        t1, s2, sp
                  add        s7, t0, s8
                  srli       zero, a2, 14
                  andi       sp, s11, -719
                  slti       s9, zero, 411
                  vsaddu.vi  v13,v20,0
                  vslideup.vi v24,v11,0
                  mulh       a2, s0, s6
                  srli       t0, s8, 20
                  vslidedown.vi v15,v16,0
                  vfmin.vf   v29,v3,fa4
                  xori       s4, t2, -670
                  vrsub.vi   v4,v24,0
                  srai       t3, s7, 7
                  auipc      a3, 649069
                  sra        gp, t5, a1
                  vfmax.vv   v20,v17,v15
                  vfmin.vv   v30,v23,v19,v0.t
                  vmulh.vv   v2,v6,v30,v0.t
                  mulhu      s2, a3, tp
                  vadd.vx    v20,v7,zero,v0.t
                  vrsub.vi   v25,v4,0
                  xor        s9, s1, a5
                  vmulh.vv   v15,v3,v22
                  sltiu      s5, t3, 226
                  vsub.vv    v12,v3,v24,v0.t
                  slli       a3, s5, 7
                  mulhu      t6, s4, s11
                  slti       s5, s2, -936
                  or         tp, a0, s7
                  vmulh.vv   v10,v0,v3,v0.t
                  vadd.vi    v11,v18,0
                  remu       gp, a2, t3
                  mulhu      a4, a7, t4
                  and        s7, a3, s0
                  xor        t0, s1, s2
                  div        s9, tp, gp
                  vadd.vv    v19,v13,v12,v0.t
                  mul        a5, a5, t3
                  rem        s7, a0, t5
                  auipc      s4, 18825
                  vmul.vx    v20,v31,s0
                  mul        s4, t4, s4
                  mulh       t5, t3, sp
                  vmadd.vv   v1,v30,v21,v0.t
                  rem        s4, s6, s5
                  rem        t5, t4, s11
                  srai       a1, t6, 27
                  mulhu      t0, ra, s9
                  vsaddu.vv  v3,v9,v21,v0.t
                  andi       a1, zero, 610
                  and        s9, a6, a6
                  vsaddu.vv  v25,v29,v29,v0.t
                  vslide1up.vx v7,v3,s6
                  addi       s11, a1, -539
                  xor        ra, s5, a6
                  vmul.vx    v14,v24,s6,v0.t
                  remu       t3, s10, s4
                  sltu       s1, s9, s11
                  srai       s2, t2, 19
                  vadd.vv    v31,v31,v25
                  sll        s5, t4, t2
                  rem        s9, s7, s10
                  remu       t0, t4, s4
                  vsll.vv    v12,v27,v21,v0.t
                  vsadd.vi   v12,v21,0
                  sltu       t0, gp, tp
                  ori        s6, s7, 843
                  vrsub.vx   v20,v18,s2
                  mulh       gp, s4, s9
                  vfmin.vf   v24,v27,ft9,v0.t
                  mulhsu     a4, s8, t3
                  xor        t2, t4, s3
                  sltu       sp, a5, s2
                  remu       s10, a3, s7
                  srl        t5, a6, s1
                  andi       gp, a1, -885
                  vslidedown.vx v8,v20,s8,v0.t
                  slli       s11, s0, 6
                  andi       t0, s10, 307
                  divu       s11, s0, a0
                  srli       zero, t6, 21
                  xori       t6, s1, 706
                  vsub.vv    v17,v29,v31,v0.t
                  ori        s9, a0, 105
                  auipc      a6, 823964
                  vslidedown.vx v0,v23,s8
                  slli       s5, t2, 5
                  sltu       s9, zero, a0
                  vsadd.vv   v9,v2,v26,v0.t
                  and        t0, a7, tp
                  srl        tp, tp, s10
                  xor        a5, s3, s3
                  vmul.vx    v21,v18,s3,v0.t
                  sltiu      a4, t0, -168
                  ori        t0, a1, 628
                  srli       t6, s5, 27
                  vslidedown.vx v8,v7,t3,v0.t
                  vsll.vv    v19,v25,v8
                  or         a1, s5, t6
                  slt        t5, s1, ra
                  rem        zero, s9, t4
                  remu       t5, s5, t5
                  vadd.vx    v10,v21,t1
                  vsub.vv    v8,v0,v22
                  vrsub.vi   v10,v6,0
                  add        a5, t5, a5
                  vsll.vi    v7,v30,0,v0.t
                  ori        sp, ra, -65
                  vrsub.vi   v4,v25,0
                  vmul.vv    v13,v28,v25
                  mulhsu     s3, s7, tp
                  or         t5, a7, t5
                  vslide1up.vx v19,v23,gp,v0.t
                  vmul.vx    v31,v19,gp,v0.t
                  addi       t3, ra, 905
                  vadd.vv    v16,v14,v4,v0.t
                  sll        zero, a3, s8
                  vadc.vxm   v15,v0,t4,v0
                  sll        s4, s9, t1
                  vsub.vx    v22,v30,t4
                  vrsub.vx   v20,v8,t4
                  sub        ra, s5, s8
                  vmul.vx    v0,v5,zero
                  vslidedown.vx v4,v26,tp,v0.t
                  vadd.vi    v30,v24,0
                  vmul.vv    v22,v23,v19,v0.t
                  mulh       s2, gp, s5
                  srli       sp, tp, 21
                  andi       s8, s9, 358
                  sltu       a5, sp, t1
                  andi       a4, a2, 522
                  vrsub.vi   v29,v23,0,v0.t
                  vsub.vx    v29,v19,t6
                  vadd.vv    v9,v6,v23,v0.t
                  divu       s8, a1, s6
                  vfmin.vf   v21,v7,fa7
                  add        a0, gp, s3
                  mulhu      s8, s9, t1
                  sra        ra, s0, a4
                  vsub.vv    v13,v0,v23
                  andi       s11, s6, -499
                  auipc      s10, 526590
                  vsadd.vv   v10,v30,v1
                  and        s7, a0, a3
                  sltiu      zero, gp, 739
                  mulhu      sp, s2, s3
                  sll        s4, zero, s8
                  divu       sp, s9, zero
                  xor        s11, s6, t0
                  vsaddu.vx  v5,v2,a2,v0.t
                  mulhsu     s8, tp, a1
                  sub        s2, a7, s11
                  andi       t5, s0, 819
                  srl        gp, t5, a2
                  add        s2, t6, a0
                  vfmax.vf   v5,v17,ft11,v0.t
                  mul        t0, a6, s11
                  andi       s1, t1, 92
                  auipc      s4, 767366
                  mulhu      s9, gp, s9
                  sub        a4, gp, t1
                  srl        sp, a0, a1
                  remu       t6, a6, a5
                  vadd.vx    v10,v29,s4
                  and        s4, gp, s5
                  slti       t0, a2, -770
                  sltiu      s2, s11, -545
                  vadd.vv    v22,v18,v13,v0.t
                  sltu       sp, t5, a1
                  sltu       s7, ra, s1
                  sra        a5, t3, t2
                  lui        s2, 632556
                  mulhu      a0, s9, a0
                  vmul.vx    v9,v10,s7,v0.t
                  vmulh.vv   v21,v23,v28,v0.t
                  vmulh.vv   v29,v12,v31,v0.t
                  mulhu      a6, a0, s3
                  vadc.vim   v10,v9,0,v0
                  vmadd.vx   v14,sp,v25,v0.t
                  rem        s2, t6, s3
                  andi       t5, gp, 34
                  sltiu      t5, s10, 61
                  vslidedown.vx v11,v9,t0
                  srl        t5, s1, t1
                  xori       a3, ra, -354
                  vsadd.vx   v1,v14,s5
                  xor        t5, s3, s4
                  sra        s2, a1, a5
                  mulhsu     s5, ra, a1
                  xor        a2, s10, s10
                  mul        s3, s0, s5
                  rem        s7, s7, t1
                  vadc.vim   v16,v18,0,v0
                  div        a5, s0, t5
                  srl        s5, a7, a1
                  srli       s4, s6, 10
                  auipc      s11, 663106
                  addi       a6, t2, 667
                  xor        a3, a6, sp
                  sll        s4, a0, t1
                  vsub.vv    v10,v13,v4
                  vrsub.vx   v29,v16,s9
                  slli       tp, s7, 21
                  div        s11, s6, s8
                  vsaddu.vx  v28,v21,s4,v0.t
                  mulhu      s1, sp, t3
                  mulhu      s6, ra, t6
                  lui        t5, 147778
                  srli       a6, sp, 4
                  vsaddu.vi  v26,v1,0,v0.t
                  vmulhu.vv  v12,v26,v26,v0.t
                  srli       s3, a0, 20
                  rem        s7, t4, t1
                  vmadd.vx   v25,s4,v31
                  or         s3, s9, ra
                  sub        zero, s6, a5
                  xor        a5, a6, s3
                  srli       s3, t0, 28
                  sltiu      a2, s4, 721
                  sub        s4, a7, s5
                  sltu       t0, a5, a7
                  sub        s3, ra, gp
                  vsadd.vi   v20,v22,0
                  auipc      s7, 624831
                  xori       t6, zero, 85
                  sltiu      t3, t3, 990
                  vadc.vvm   v1,v5,v24,v0
                  and        a1, a7, a3
                  vmulhu.vv  v21,v14,v26,v0.t
                  vsll.vv    v27,v14,v1
                  xori       t5, a7, 365
                  vadd.vi    v2,v11,0,v0.t
                  vslidedown.vx v24,v17,a0,v0.t
                  vsaddu.vx  v25,v23,a1,v0.t
                  addi       t0, gp, -719
                  or         a6, s11, gp
                  srli       t5, s5, 10
                  mul        t0, s10, s11
                  auipc      ra, 646712
                  sltu       t2, t1, sp
                  remu       s3, s10, tp
                  mulhsu     s7, t4, a5
                  sra        zero, s0, s2
                  vslidedown.vx v6,v5,s10
                  mul        zero, gp, s7
                  xor        a4, a7, t6
                  vmulh.vx   v15,v29,gp
                  remu       s7, t6, s5
                  vslidedown.vi v21,v18,0,v0.t
                  xor        s11, t5, sp
                  vadd.vx    v0,v7,t2
                  vmadd.vv   v3,v5,v23,v0.t
                  mulh       t1, s10, sp
                  vsaddu.vx  v10,v16,sp
                  addi       s11, a5, 208
                  sub        a3, tp, s11
                  ori        t1, t5, -197
                  vfmin.vv   v12,v23,v15
                  vsub.vx    v17,v28,a2
                  vrsub.vx   v27,v24,s11
                  auipc      a5, 595234
                  vrsub.vi   v8,v3,0,v0.t
                  div        a0, ra, a2
                  slli       t6, t6, 27
                  vfmax.vv   v13,v2,v31
                  vmul.vx    v30,v27,a7,v0.t
                  sll        ra, a3, a5
                  ori        s3, s9, 693
                  sll        t5, t4, t6
                  srl        a5, s6, s5
                  and        a5, a4, a2
                  vsll.vv    v21,v20,v20
                  slli       s6, s11, 27
                  xori       s2, a3, -118
                  srai       t6, t3, 29
                  xori       a2, a3, -391
                  remu       a4, t5, a4
                  vadc.vim   v16,v1,0,v0
                  and        zero, tp, s3
                  vadc.vim   v28,v23,0,v0
                  vmul.vv    v17,v15,v28
                  vmulh.vv   v30,v15,v3,v0.t
                  mul        t2, s10, a4
                  vslidedown.vx v1,v16,a0
                  vslideup.vi v5,v4,0,v0.t
                  mul        t0, s7, s0
                  vslide1up.vx v3,v31,s10
                  divu       t3, a2, s8
                  slli       t1, t0, 20
                  vmulh.vx   v26,v0,a5,v0.t
                  slli       zero, s2, 12
                  andi       t1, a6, -801
                  remu       s8, gp, t2
                  vsll.vi    v11,v0,0
                  andi       tp, a6, 378
                  slli       zero, t0, 20
                  vmulh.vx   v16,v9,s0
                  vmulh.vv   v25,v21,v1,v0.t
                  divu       a3, zero, t3
                  sub        s2, a2, a0
                  srli       s10, a6, 9
                  vadc.vxm   v23,v8,a1,v0
                  auipc      s8, 316863
                  div        s7, s3, sp
                  xori       a3, s2, -126
                  slt        a2, s5, s7
                  auipc      s5, 108377
                  addi       ra, s4, 787
                  or         t0, sp, t1
                  vslideup.vx v21,v8,sp,v0.t
                  vfmin.vv   v14,v31,v19,v0.t
                  vmulhu.vx  v28,v6,a3,v0.t
                  xori       s9, a3, 234
                  vsll.vv    v8,v12,v23
                  vmadd.vx   v30,a1,v24
                  mulh       t3, s6, t1
                  ori        a0, a0, 944
                  srli       t6, a7, 30
                  vmul.vx    v3,v14,t3,v0.t
                  addi       s10, s5, 884
                  sll        s2, t1, t0
                  auipc      s1, 846704
                  srli       s2, tp, 3
                  vrsub.vx   v27,v23,s5,v0.t
                  auipc      zero, 190661
                  slti       gp, t2, 682
                  sltiu      s8, a2, 152
                  divu       a0, t4, t2
                  vsll.vv    v13,v30,v10,v0.t
                  sltu       sp, a6, s5
                  vmulhu.vv  v26,v23,v31,v0.t
                  rem        t5, a0, t2
                  andi       s1, s2, -314
                  vfmin.vf   v4,v29,fs4
                  vsaddu.vv  v27,v20,v0
                  remu       s9, s9, a3
                  add        zero, t3, s1
                  div        s10, s8, t3
                  vadd.vi    v13,v17,0,v0.t
                  vslideup.vi v1,v21,0,v0.t
                  vsadd.vi   v20,v4,0,v0.t
                  sub        s8, s0, t2
                  vslide1up.vx v1,v24,s3
                  rem        s2, s1, t2
                  vsaddu.vx  v13,v5,a0,v0.t
                  vfmax.vf   v25,v26,fs3
                  mulh       t0, a0, a1
                  vadd.vi    v4,v28,0
                  vsub.vv    v25,v20,v31,v0.t
                  vfmax.vf   v18,v30,fa4
                  vfmax.vf   v16,v18,fs2
                  vmulh.vv   v11,v5,v14,v0.t
                  divu       s7, tp, a4
                  divu       s3, s10, a3
                  vslidedown.vx v7,v10,s8,v0.t
                  vsll.vi    v12,v16,0
                  and        s8, s11, a0
                  sra        s4, t4, s9
                  vslidedown.vi v27,v22,0,v0.t
                  vrsub.vx   v7,v7,s11,v0.t
                  and        s4, s2, a7
                  vfmax.vf   v22,v8,fs10
                  div        s5, a0, s4
                  mulhsu     sp, s0, s8
                  xori       t6, t3, 627
                  xor        s6, a1, t4
                  vsaddu.vi  v10,v29,0
                  vmulh.vv   v7,v31,v29,v0.t
                  mulhsu     t5, s8, tp
                  vsadd.vx   v26,v15,t6,v0.t
                  mulh       sp, s2, t1
                  slt        s11, s1, t1
                  vfmax.vv   v4,v7,v0
                  vfmin.vv   v3,v27,v18
                  vsll.vx    v29,v27,s7,v0.t
                  srl        s1, t6, s7
                  rem        t1, t1, a5
                  vsub.vv    v2,v14,v25,v0.t
                  vmulh.vv   v28,v22,v17,v0.t
                  vmulhu.vv  v26,v2,v31,v0.t
                  sll        s4, s7, gp
                  vmulhu.vv  v8,v22,v3,v0.t
                  vslideup.vx v12,v1,a5,v0.t
                  vslidedown.vi v16,v10,0
                  add        s8, a6, a1
                  vsaddu.vx  v23,v28,a7,v0.t
                  mulhsu     ra, t2, s9
                  divu       a4, s2, a7
                  mul        a0, s10, s10
                  vslidedown.vi v15,v13,0,v0.t
                  srli       zero, ra, 30
                  rem        s3, t0, a3
                  srli       s8, s6, 6
                  rem        s10, s7, tp
                  mul        zero, sp, s0
                  vfmax.vf   v18,v6,fa2,v0.t
                  mulhu      t2, s9, ra
                  vslidedown.vx v13,v0,s1,v0.t
                  remu       t3, a7, t4
                  vsadd.vi   v13,v27,0,v0.t
                  vmul.vx    v24,v6,s5,v0.t
                  slli       s8, t4, 8
                  ori        a5, a7, -224
                  addi       a4, s11, -418
                  slti       t5, s10, 856
                  mulh       s5, t4, s10
                  rem        ra, t5, s2
                  or         s9, a1, zero
                  div        t5, s7, s8
                  vsll.vi    v12,v28,0,v0.t
                  rem        s10, a1, s10
                  vfmax.vf   v29,v23,fs3,v0.t
                  vfmin.vf   v13,v13,fs11
                  sra        sp, sp, s6
                  vsaddu.vv  v31,v16,v27,v0.t
                  vmul.vv    v28,v23,v9,v0.t
                  div        s5, sp, a7
                  remu       a4, a2, t0
                  vsub.vv    v3,v25,v18
                  vsadd.vv   v3,v30,v22,v0.t
                  mulh       a5, s7, gp
                  andi       s7, s7, -86
                  sll        t6, t0, gp
                  sll        a3, s1, s4
                  ori        a3, s4, 27
                  srli       s11, a0, 6
                  add        s5, s8, a0
                  vrsub.vx   v28,v18,a5,v0.t
                  vslideup.vi v18,v25,0
                  xor        a5, zero, t3
                  sra        s1, a0, a6
                  xor        a4, s3, gp
                  andi       t0, t0, 991
                  vmul.vv    v4,v8,v6
                  and        s5, tp, a7
                  sltu       s11, s10, s4
                  vmulhu.vx  v27,v30,a5
                  mulhsu     t1, s9, a1
                  or         s10, a4, s9
                  sltu       a0, gp, s9
                  vsaddu.vv  v4,v30,v21
                  vslideup.vx v14,v24,a5,v0.t
                  ori        s11, gp, -413
                  add        a1, s11, ra
                  vmadd.vv   v8,v1,v8,v0.t
                  sltiu      t1, sp, 250
                  mulhu      a2, a1, ra
                  slt        t5, t3, s0
                  vslidedown.vi v30,v22,0,v0.t
                  slt        t1, t6, s10
                  vfmax.vv   v12,v11,v0,v0.t
                  vmul.vx    v4,v0,t4,v0.t
                  srl        a3, t2, t3
                  la x29, test_done
                  jalr x0, x29, 0
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
                  1: addi x17, x17, -124
                  sw  x1, 4(x17)
                  sw  x2, 8(x17)
                  sw  x3, 12(x17)
                  sw  x4, 16(x17)
                  sw  x5, 20(x17)
                  sw  x6, 24(x17)
                  sw  x7, 28(x17)
                  sw  x8, 32(x17)
                  sw  x9, 36(x17)
                  sw  x10, 40(x17)
                  sw  x11, 44(x17)
                  sw  x12, 48(x17)
                  sw  x13, 52(x17)
                  sw  x14, 56(x17)
                  sw  x15, 60(x17)
                  sw  x16, 64(x17)
                  sw  x17, 68(x17)
                  sw  x18, 72(x17)
                  sw  x19, 76(x17)
                  sw  x20, 80(x17)
                  sw  x21, 84(x17)
                  sw  x22, 88(x17)
                  sw  x23, 92(x17)
                  sw  x24, 96(x17)
                  sw  x25, 100(x17)
                  sw  x26, 104(x17)
                  sw  x27, 108(x17)
                  sw  x28, 112(x17)
                  sw  x29, 116(x17)
                  sw  x30, 120(x17)
                  sw  x31, 124(x17)
                  csrr x31, 0x341 # MEPC
                  csrr x31, 0x342 # MCAUSE
                  li x10, 0x3 # BREAKPOINT
                  beq x31, x10, ebreak_handler
                  li x10, 0x8 # ECALL_UMODE
                  beq x31, x10, ecall_handler
                  li x10, 0x9 # ECALL_SMODE
                  beq x31, x10, ecall_handler
                  li x10, 0xb # ECALL_MMODE
                  beq x31, x10, ecall_handler
                  li x10, 0x1
                  beq x31, x10, instr_fault_handler
                  li x10, 0x5
                  beq x31, x10, load_fault_handler
                  li x10, 0x7
                  beq x31, x10, store_fault_handler
                  li x10, 0xc
                  beq x31, x10, pt_fault_handler
                  li x10, 0xd
                  beq x31, x10, pt_fault_handler
                  li x10, 0xf
                  beq x31, x10, pt_fault_handler
                  li x10, 0x2 # ILLEGAL_INSTRUCTION
                  beq x31, x10, illegal_instr_handler
                  csrr x10, 0x343 # MTVAL
                  1: la x29, test_done
                  jalr x1, x29, 0

ecall_handler:    
                  la x31, _start
                  sw x0, 0(x31)
                  sw x1, 4(x31)
                  sw x2, 8(x31)
                  sw x3, 12(x31)
                  sw x4, 16(x31)
                  sw x5, 20(x31)
                  sw x6, 24(x31)
                  sw x7, 28(x31)
                  sw x8, 32(x31)
                  sw x9, 36(x31)
                  sw x10, 40(x31)
                  sw x11, 44(x31)
                  sw x12, 48(x31)
                  sw x13, 52(x31)
                  sw x14, 56(x31)
                  sw x15, 60(x31)
                  sw x16, 64(x31)
                  sw x17, 68(x31)
                  sw x18, 72(x31)
                  sw x19, 76(x31)
                  sw x20, 80(x31)
                  sw x21, 84(x31)
                  sw x22, 88(x31)
                  sw x23, 92(x31)
                  sw x24, 96(x31)
                  sw x25, 100(x31)
                  sw x26, 104(x31)
                  sw x27, 108(x31)
                  sw x28, 112(x31)
                  sw x29, 116(x31)
                  sw x30, 120(x31)
                  sw x31, 124(x31)
                  la x29, write_tohost
                  jalr x0, x29, 0

instr_fault_handler:
                  li x31, 0
                  csrw 0x340, x31
                  li x4, 0
                  0: csrr x31, 0x340
                  mv x29, x31
                  li x29, 0
                  beq x31, x29, 1f
                  1: csrr x10, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x28, 4
                  csrr x31, 0x340
                  slli x31, x31, 30
                  srli x31, x31, 30
                  sub x29, x28, x31
                  addi x29, x29, -1
                  slli x29, x29, 3
                  sll x28, x12, x29
                  slli x31, x31, 3
                  add x29, x29, x31
                  srl x28, x28, x29
                  slli x29, x28, 27
                  srli x29, x29, 30
                  beqz x29, 20f
                  li x31, 1
                  beq x29, x31, 21f
                  li x31, 2
                  beq x29, x31, 25f
                  li x31, 3
                  beq x29, x31, 27f
                  la x31, test_done
                  jalr x0, x31, 0
                  18: csrr x31, 0x340
                  mv x4, x10
                  addi x31, x31, 1
                  csrw 0x340, x31
                  li x10, 1
                  ble x10, x31, 19f
                  j 0b
                  19: la x31, test_done
                  jalr x0, x31, 0
                  20: j 18b
                  21: csrr x31, 0x340
                  csrr x29, 0x343
                  srli x29, x29, 2
                  bnez x31, 22f
                  bltz x29, 18b
                  j 23f
                  22: bgtu x4, x29, 18b
                  23: bleu x10, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 24f
                  la x31, test_done
                  jalr x0, x31, 0
                  24: j 29f
                  25: csrr x31, 0x343
                  srli x31, x31, 2
                  slli x29, x10, 2
                  srli x29, x29, 2
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 26f
                  la x31, test_done
                  jalr x0, x31, 0
                  26: j 29f
                  27: csrr x31, 0x343
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  slli x29, x10, 2
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 29f
                  la x31, test_done
                  jalr x0, x31, 0
                  28: j 29f
                  29: ori x28, x28, 4
                  csrr x31, 0x340
                  li x29, 30
                  sll x31, x31, x29
                  srl x31, x31, x29
                  slli x29, x31, 3
                  sll x28, x28, x29
                  or x12, x12, x28
                  csrr x31, 0x340
                  srli x31, x31, 2
                  beqz x31, 30f
                  li x29, 1
                  beq x31, x29, 31f
                  li x29, 2
                  beq x31, x29, 32f
                  li x29, 3
                  beq x31, x29, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
                  mret

load_fault_handler:
                  li x31, 0
                  csrw 0x340, x31
                  li x4, 0
                  0: csrr x31, 0x340
                  mv x29, x31
                  li x29, 0
                  beq x31, x29, 1f
                  1: csrr x10, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x28, 4
                  csrr x31, 0x340
                  slli x31, x31, 30
                  srli x31, x31, 30
                  sub x29, x28, x31
                  addi x29, x29, -1
                  slli x29, x29, 3
                  sll x28, x12, x29
                  slli x31, x31, 3
                  add x29, x29, x31
                  srl x28, x28, x29
                  slli x29, x28, 27
                  srli x29, x29, 30
                  beqz x29, 20f
                  li x31, 1
                  beq x29, x31, 21f
                  li x31, 2
                  beq x29, x31, 25f
                  li x31, 3
                  beq x29, x31, 27f
                  la x31, test_done
                  jalr x0, x31, 0
                  18: csrr x31, 0x340
                  mv x4, x10
                  addi x31, x31, 1
                  csrw 0x340, x31
                  li x10, 1
                  ble x10, x31, 19f
                  j 0b
                  19: la x31, test_done
                  jalr x0, x31, 0
                  20: j 18b
                  21: csrr x31, 0x340
                  csrr x29, 0x343
                  srli x29, x29, 2
                  bnez x31, 22f
                  bltz x29, 18b
                  j 23f
                  22: bgtu x4, x29, 18b
                  23: bleu x10, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 24f
                  la x31, test_done
                  jalr x0, x31, 0
                  24: j 29f
                  25: csrr x31, 0x343
                  srli x31, x31, 2
                  slli x29, x10, 2
                  srli x29, x29, 2
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 26f
                  la x31, test_done
                  jalr x0, x31, 0
                  26: j 29f
                  27: csrr x31, 0x343
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  slli x29, x10, 2
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 29f
                  la x31, test_done
                  jalr x0, x31, 0
                  28: j 29f
                  29: ori x28, x28, 1
                  csrr x31, 0x340
                  li x29, 30
                  sll x31, x31, x29
                  srl x31, x31, x29
                  slli x29, x31, 3
                  sll x28, x28, x29
                  or x12, x12, x28
                  csrr x31, 0x340
                  srli x31, x31, 2
                  beqz x31, 30f
                  li x29, 1
                  beq x31, x29, 31f
                  li x29, 2
                  beq x31, x29, 32f
                  li x29, 3
                  beq x31, x29, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
                  mret

store_fault_handler:
                  li x31, 0
                  csrw 0x340, x31
                  li x4, 0
                  0: csrr x31, 0x340
                  mv x29, x31
                  li x29, 0
                  beq x31, x29, 1f
                  1: csrr x10, 0x3b0
                  csrr x12, 0x3a0
                  j 17f
                  17: li x28, 4
                  csrr x31, 0x340
                  slli x31, x31, 30
                  srli x31, x31, 30
                  sub x29, x28, x31
                  addi x29, x29, -1
                  slli x29, x29, 3
                  sll x28, x12, x29
                  slli x31, x31, 3
                  add x29, x29, x31
                  srl x28, x28, x29
                  slli x29, x28, 27
                  srli x29, x29, 30
                  beqz x29, 20f
                  li x31, 1
                  beq x29, x31, 21f
                  li x31, 2
                  beq x29, x31, 25f
                  li x31, 3
                  beq x29, x31, 27f
                  la x31, test_done
                  jalr x0, x31, 0
                  18: csrr x31, 0x340
                  mv x4, x10
                  addi x31, x31, 1
                  csrw 0x340, x31
                  li x10, 1
                  ble x10, x31, 19f
                  j 0b
                  19: la x31, test_done
                  jalr x0, x31, 0
                  20: j 18b
                  21: csrr x31, 0x340
                  csrr x29, 0x343
                  srli x29, x29, 2
                  bnez x31, 22f
                  bltz x29, 18b
                  j 23f
                  22: bgtu x4, x29, 18b
                  23: bleu x10, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 24f
                  la x31, test_done
                  jalr x0, x31, 0
                  24: j 29f
                  25: csrr x31, 0x343
                  srli x31, x31, 2
                  slli x29, x10, 2
                  srli x29, x29, 2
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 26f
                  la x31, test_done
                  jalr x0, x31, 0
                  26: j 29f
                  27: csrr x31, 0x343
                  srli x31, x31, 2
                  srli x31, x31, 0
                  slli x31, x31, 0
                  slli x29, x10, 2
                  srli x29, x29, 2
                  srli x29, x29, 0
                  slli x29, x29, 0
                  bne x31, x29, 18b
                  andi x29, x28, 128
                  beqz x29, 29f
                  la x31, test_done
                  jalr x0, x31, 0
                  28: j 29f
                  29: ori x28, x28, 3
                  csrr x31, 0x340
                  li x29, 30
                  sll x31, x31, x29
                  srl x31, x31, x29
                  slli x29, x31, 3
                  sll x28, x28, x29
                  or x12, x12, x28
                  csrr x31, 0x340
                  srli x31, x31, 2
                  beqz x31, 30f
                  li x29, 1
                  beq x31, x29, 31f
                  li x29, 2
                  beq x31, x29, 32f
                  li x29, 3
                  beq x31, x29, 33f
                  30: csrw 0x3a0, x12
                  j 34f
                  31: csrw 0x3a1, x12
                  j 34f
                  32: csrw 0x3a2, x12
                  j 34f
                  33: csrw 0x3a3, x12
                  34: nop
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
                  mret

ebreak_handler:   
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
                  mret

illegal_instr_handler:
                  csrr  x31, 0x341
                  addi  x31, x31, 4
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x31, 0x300 # MSTATUS;
                  csrr  x31, 0x304 # MIE;
                  csrr  x31, 0x344 # MIP;
                  csrrc x31, 0x344, x31 # MIP;
                  lw  x1, 4(x17)
                  lw  x2, 8(x17)
                  lw  x3, 12(x17)
                  lw  x4, 16(x17)
                  lw  x5, 20(x17)
                  lw  x6, 24(x17)
                  lw  x7, 28(x17)
                  lw  x8, 32(x17)
                  lw  x9, 36(x17)
                  lw  x10, 40(x17)
                  lw  x11, 44(x17)
                  lw  x12, 48(x17)
                  lw  x13, 52(x17)
                  lw  x14, 56(x17)
                  lw  x15, 60(x17)
                  lw  x16, 64(x17)
                  lw  x17, 68(x17)
                  lw  x18, 72(x17)
                  lw  x19, 76(x17)
                  lw  x20, 80(x17)
                  lw  x21, 84(x17)
                  lw  x22, 88(x17)
                  lw  x23, 92(x17)
                  lw  x24, 96(x17)
                  lw  x25, 100(x17)
                  lw  x26, 104(x17)
                  lw  x27, 108(x17)
                  lw  x28, 112(x17)
                  lw  x29, 116(x17)
                  lw  x30, 120(x17)
                  lw  x31, 124(x17)
                  addi x17, x17, 124
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
