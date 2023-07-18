.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x15, h0_start
jalr x0, x15, 0
h0_start:
                  li x8, 0x40000100
                  csrw 0x301, x8
                  csrr x31, 0x301
kernel_sp:        
                  la x20, kernel_stack_end

trap_vec_init:    
                  la x8, mtvec_handler
                  ori x8, x8, 0

mepc_setup:       
                  la x8, init

custom_csr_setup: 
                  nop

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x8, 4286578688
                  fmv.w.x f0, x8
                  li x8, 2139095040
                  fmv.w.x f1, x8
                  li x8, 2495328
                  fmv.w.x f2, x8
                  li x8, 4201197407
                  fmv.w.x f3, x8
                  li x8, 1746175736
                  fmv.w.x f4, x8
                  li x8, 2139095039
                  fmv.w.x f5, x8
                  li x8, 2139095041
                  fmv.w.x f6, x8
                  li x8, 4286578687
                  fmv.w.x f7, x8
                  li x8, 4286578688
                  fmv.w.x f8, x8
                  li x8, 607667212
                  fmv.w.x f9, x8
                  li x8, 4286578688
                  fmv.w.x f10, x8
                  li x8, 2139095041
                  fmv.w.x f11, x8
                  li x8, 3081889362
                  fmv.w.x f12, x8
                  li x8, 4286578688
                  fmv.w.x f13, x8
                  li x8, 2151886974
                  fmv.w.x f14, x8
                  li x8, 2139095040
                  fmv.w.x f15, x8
                  li x8, 2151950883
                  fmv.w.x f16, x8
                  li x8, 2139095041
                  fmv.w.x f17, x8
                  li x8, 0
                  fmv.w.x f18, x8
                  li x8, 2139095039
                  fmv.w.x f19, x8
                  li x8, 4286578688
                  fmv.w.x f20, x8
                  li x8, 2154871907
                  fmv.w.x f21, x8
                  li x8, 4286578687
                  fmv.w.x f22, x8
                  li x8, 0
                  fmv.w.x f23, x8
                  li x8, 2155711426
                  fmv.w.x f24, x8
                  li x8, 5437052
                  fmv.w.x f25, x8
                  li x8, 2139095041
                  fmv.w.x f26, x8
                  li x8, 4286578687
                  fmv.w.x f27, x8
                  li x8, 2139095039
                  fmv.w.x f28, x8
                  li x8, 4286578687
                  fmv.w.x f29, x8
                  li x8, 2139095041
                  fmv.w.x f30, x8
                  li x8, 2888890747
                  fmv.w.x f31, x8
                  fsrmi 0
                  li x0, 0x80000000
                  li x1, 0xfed03ffe
                  li x2, 0xf8b083fd
                  li x3, 0x80000000
                  li x4, 0x832be7d3
                  li x5, 0x80000000
                  li x6, 0x80a05ea6
                  li x7, 0xf6efeab9
                  li x8, 0x80000000
                  li x9, 0x80000000
                  li x10, 0xf13868f5
                  li x11, 0xfb57fe28
                  li x12, 0x2c0b50e8
                  li x13, 0x4773f023
                  li x14, 0xfef4723d
                  li x15, 0xe441b39
                  li x16, 0x9eb19da5
                  li x17, 0xf14d54c5
                  li x19, 0xac3b9a70
                  li x21, 0xf392094d
                  li x22, 0xf86e85d8
                  li x23, 0x80000000
                  li x24, 0x80000000
                  li x25, 0xffb8f180
                  li x26, 0x80000000
                  li x27, 0x80000000
                  li x28, 0xe66b91be
                  li x29, 0xfa4781ba
                  li x30, 0x80000000
                  li x31, 0x80000000
                  la x18, user_stack_end
main:             sltu       s11, ra, s4
                  sub        s6, a0, a2
                  and        a1, zero, s10
                  srai       s7, a0, 9
                  auipc      t0, 800422
                  nop
                  sra        gp, a0, s7
                  srai       tp, s3, 17
                  or         ra, tp, gp
                  nop
                  addi       t0, sp, 794
                  ori        a2, s5, 950
                  srai       t1, t0, 23
                  nop
                  sra        a6, s11, ra
                  slli       a1, s6, 0
                  nop
                  slt        a4, t1, t3
                  and        s7, t5, zero
                  sll        a4, s8, t6
                  srli       gp, s9, 0
                  xor        a1, s7, s11
                  slli       t1, t6, 30
                  nop
                  sub        t5, t4, s6
                  xor        a4, t1, t6
                  xori       t0, zero, -622
                  or         t4, t0, t6
                  xori       tp, gp, -2
                  srai       t4, t5, 22
                  srl        a1, a2, a0
                  sll        t5, s9, a0
                  slli       s9, s0, 29
                  xori       ra, a5, -602
                  srai       t5, s11, 1
                  lui        t2, 252593
                  sltiu      a4, s7, -606
                  sll        gp, s2, sp
                  sltu       s3, a3, t4
                  addi       t4, t3, -986
                  xori       sp, a3, 1
                  sltiu      zero, sp, -952
                  srli       s6, t4, 10
                  add        zero, a5, a1
                  srai       zero, s7, 18
                  slti       t3, s7, -920
                  or         s3, s2, s4
                  slli       a7, s5, 21
                  slt        a2, a0, s0
                  sll        t2, t6, a0
                  sltiu      zero, s3, 309
                  or         t4, tp, a3
                  or         tp, a7, s4
                  srli       t6, s8, 18
                  lui        s7, 197744
                  ori        a7, tp, -224
                  sra        a0, a7, sp
                  or         t0, s4, s11
                  srl        s6, t1, t2
                  srai       s7, s2, 20
                  sub        t5, a1, a0
                  addi       s7, a5, 811
                  auipc      a3, 684708
                  auipc      t6, 253505
                  and        s0, tp, a5
                  xori       s1, sp, 886
                  sub        t6, a3, a3
                  srli       a3, s9, 26
                  slt        a4, a7, t1
                  srli       t6, ra, 26
                  slti       a0, t6, -949
                  slli       t6, ra, 9
                  xori       s3, sp, 752
                  add        t6, s8, s4
                  xor        t6, s10, zero
                  sltu       a4, s0, s11
                  lui        a3, 867376
                  auipc      t5, 386615
                  srli       a6, s8, 14
                  add        t5, s6, s7
                  add        a2, sp, t5
                  lui        s11, 253077
                  add        s9, s0, s3
                  lui        s0, 912477
                  srai       a2, s7, 9
                  sltu       a7, a3, t6
                  andi       s9, t0, -131
                  srli       s10, a2, 9
                  or         t0, ra, t6
                  slt        sp, s4, t4
                  and        a7, a0, a7
                  slli       a0, sp, 9
                  slti       s9, s0, -991
                  lui        a2, 955312
                  xor        t4, sp, s0
                  lui        sp, 708023
                  xori       a2, a6, 523
                  add        t4, s4, a3
                  sltu       gp, a3, s4
                  add        s8, s0, a7
                  addi       s7, t2, -979
                  sra        s11, a4, s6
                  srai       a2, a1, 12
                  ori        a4, t0, -607
                  sltu       s1, t0, sp
                  auipc      a1, 225191
                  lui        t1, 497767
                  ori        a2, a1, -609
                  auipc      t2, 140063
                  or         t6, s8, s3
                  srai       a7, s10, 29
                  sll        s1, t3, t2
                  sub        t5, a0, t1
                  slt        a4, t6, t3
                  and        ra, gp, s10
                  sub        a1, zero, s1
                  sub        t2, s9, t1
                  ori        a3, s11, -931
                  xori       s6, s8, -691
                  andi       s7, s5, 687
                  sltiu      t6, gp, -131
                  or         a0, s2, t3
                  sltu       s10, s0, a0
                  add        s5, t6, zero
                  srli       ra, t1, 27
                  andi       s6, s3, -996
                  sltu       t2, a5, t6
                  slt        s0, t1, a0
                  xori       a7, s8, 176
                  srl        t1, a7, s1
                  auipc      t6, 71935
                  srl        s9, tp, zero
                  sltu       tp, s7, a0
                  srai       t6, ra, 13
                  xori       tp, s8, -322
                  srli       a1, s8, 15
                  auipc      s0, 640783
                  sltu       s7, s6, s8
                  sltu       a6, tp, t3
                  slt        a6, s7, s2
                  slli       s8, t3, 12
                  slt        s11, t6, s10
                  srl        s9, t3, t2
                  sltiu      gp, s7, -244
                  srai       s8, tp, 17
                  sll        a1, t2, t2
                  auipc      t1, 649517
                  and        tp, t6, s1
                  auipc      ra, 860965
                  lui        gp, 881114
                  addi       s7, s7, 353
                  slt        s3, t3, sp
                  srl        a1, zero, zero
                  nop
                  srai       s5, zero, 5
                  add        s10, gp, s2
                  xori       t2, s11, 900
                  xor        a6, t5, s6
                  srli       t0, t2, 29
                  slti       t0, a3, 602
                  sltiu      t3, gp, -575
                  srl        s9, a4, s3
                  addi       t0, s8, -476
                  sub        s11, a4, zero
                  xor        a1, sp, a6
                  sltiu      s9, a3, -1008
                  addi       gp, a4, 461
                  srl        s8, a5, tp
                  sll        tp, ra, a2
                  lui        a3, 883470
                  srli       t5, s10, 4
                  xor        t4, a3, a4
                  add        a1, s3, s1
                  xori       s1, s5, 370
                  xor        sp, t5, a5
                  auipc      s3, 535786
                  xor        a3, t6, a4
                  sub        a2, s5, t3
                  add        a2, sp, t5
                  srl        t2, a2, ra
                  sltu       a7, t3, s2
                  andi       s7, s6, -83
                  auipc      a1, 675165
                  slti       t6, ra, -109
                  addi       t6, t3, -769
                  slti       a3, a0, 16
                  auipc      a1, 401018
                  slti       a4, a5, -968
                  or         t2, t6, sp
                  sll        a2, t6, s9
                  sltu       t2, t6, sp
                  nop
                  add        a3, t3, t3
                  srai       a3, a3, 30
                  sra        sp, s2, t2
                  ori        t5, s9, 302
                  slt        zero, a0, a6
                  and        t4, tp, t1
                  nop
                  lui        a7, 71213
                  sltu       gp, t3, a4
                  sra        zero, tp, t6
                  srl        t0, t0, s0
                  lui        sp, 524351
                  srli       a7, s8, 19
                  andi       t1, a2, -228
                  andi       t2, s1, 818
                  or         a2, s4, s0
                  srai       s5, a4, 2
                  srai       s6, s1, 5
                  andi       s8, t4, 441
                  slli       t6, ra, 2
                  slli       t4, ra, 25
                  srl        s9, t6, a7
                  srai       s11, t0, 26
                  lui        s10, 483618
                  slti       a2, t5, 103
                  ori        t0, s8, 302
                  auipc      a7, 206672
                  or         sp, t2, a6
                  ori        t2, s0, 801
                  srai       s1, s5, 29
                  auipc      t1, 258400
                  addi       s3, a6, -422
                  sltiu      t2, sp, 115
                  add        s9, s7, a0
                  srl        a1, zero, ra
                  sll        t5, sp, t6
                  sub        t3, a4, a1
                  ori        a7, t3, 270
                  nop
                  addi       a6, a4, 687
                  andi       s8, ra, -501
                  sll        s3, t6, a7
                  sra        s1, t0, s8
                  sll        a0, s7, s11
                  addi       a0, t2, 801
                  srl        s10, t1, t3
                  slt        a3, a3, s8
                  slt        a3, a4, a4
                  add        a4, s7, t4
                  srl        a7, s6, a2
                  srli       s9, s4, 5
                  xor        t5, s6, a3
                  auipc      ra, 882179
                  xor        gp, zero, a6
                  xor        a7, t6, s3
                  sub        a2, a5, t0
                  srl        t6, a0, t1
                  addi       a6, a6, -932
                  slti       s7, s8, 283
                  srai       t4, t3, 27
                  sra        t3, zero, t1
                  slt        zero, t3, t1
                  sll        s0, s11, s1
                  xor        s8, t1, tp
                  slli       t3, a0, 15
                  lui        s7, 1013374
                  xor        a7, t1, t2
                  sltiu      a1, s1, -173
                  nop
                  sub        a3, sp, s10
                  srli       a3, a6, 8
                  or         a3, a5, ra
                  xor        t1, a2, t0
                  srai       tp, a4, 16
                  slli       t6, a6, 30
                  xori       t4, s10, -844
                  srl        a4, s0, a0
                  lui        a7, 743146
                  xor        s5, t2, s2
                  slt        a7, gp, s0
                  add        a0, t6, a3
                  sltu       a3, a5, s1
                  srai       sp, zero, 5
                  addi       s11, t6, -1
                  sra        s0, s5, sp
                  auipc      t1, 750167
                  srl        s1, t5, a7
                  sltiu      s9, s6, 219
                  sra        t3, a4, s5
                  or         gp, a2, s10
                  slli       s10, s11, 3
                  sltiu      s10, a4, -636
                  sra        a2, a5, t3
                  sll        ra, a2, t4
                  nop
                  sltiu      gp, s3, 592
                  sll        s0, s10, sp
                  slt        t6, t6, s7
                  or         s8, s4, a5
                  slti       a3, a0, -113
                  auipc      t0, 218761
                  slt        t3, s8, s2
                  srli       s3, a4, 11
                  xor        s7, s1, gp
                  sltiu      a7, a1, 947
                  sltu       gp, s8, a1
                  addi       a6, s6, 836
                  or         t5, a3, sp
                  xori       s10, t0, 502
                  auipc      s0, 370960
                  slt        s9, t4, t6
                  add        sp, s1, t4
                  slti       tp, tp, 1002
                  auipc      s1, 310884
                  slt        s11, s0, s1
                  srai       a0, a7, 6
                  slli       s5, t0, 25
                  sub        s3, a1, a4
                  xori       a2, s4, 139
                  nop
                  slli       s3, t3, 1
                  slli       a0, t0, 27
                  lui        s0, 500822
                  add        s3, s9, s9
                  slti       a3, a2, 728
                  sltu       a4, t0, s5
                  srl        zero, gp, s4
                  or         a3, s6, s2
                  ori        t5, s8, -923
                  srli       t3, gp, 12
                  sltiu      a3, a0, -164
                  or         sp, s3, t5
                  sltiu      ra, s5, 785
                  nop
                  srli       sp, t0, 1
                  and        zero, sp, zero
                  sltiu      s5, s2, 517
                  addi       s11, a2, 0
                  or         a7, s2, t0
                  xor        s11, sp, t4
                  xori       s11, ra, -69
                  srl        s6, gp, t1
                  slt        t3, a0, ra
                  xor        s3, a3, s6
                  xori       s6, sp, 201
                  or         a1, t6, s11
                  sll        a1, tp, a5
                  lui        s6, 392063
                  ori        s1, s2, 475
                  nop
                  sub        gp, a7, s11
                  sltu       a1, a1, s2
                  or         s11, s1, a4
                  slt        t3, s0, s8
                  sltiu      a7, t3, -116
                  sub        t3, a5, a7
                  andi       t3, a2, -247
                  srli       a6, tp, 20
                  xor        t3, s0, gp
                  lui        s8, 978060
                  xori       t1, t3, -860
                  slti       t1, a3, 592
                  xor        t1, tp, a3
                  and        t1, zero, s11
                  andi       gp, a2, 861
                  sub        s8, s10, a0
                  xori       zero, t0, -682
                  nop
                  add        t3, zero, a1
                  nop
                  xor        s6, ra, s1
                  slli       s5, t2, 31
                  and        t0, s5, s4
                  sub        tp, a1, zero
                  srl        s9, s8, t4
                  or         t2, s8, a1
                  nop
                  sll        a3, t1, zero
                  andi       s0, t4, -976
                  sltiu      s7, s4, 283
                  ori        gp, s4, -982
                  sltiu      gp, s1, 335
                  lui        a7, 356214
                  add        a6, a1, s9
                  srai       a4, zero, 25
                  lui        s1, 440945
                  ori        zero, s8, 39
                  srli       tp, t5, 24
                  nop
                  srl        t0, t1, s0
                  srli       s11, t4, 2
                  sll        s3, s3, s6
                  lui        t3, 984511
                  sub        t4, sp, t3
                  slli       s6, s1, 29
                  sub        s5, a3, t1
                  andi       a3, t2, -636
                  and        s1, t2, sp
                  nop
                  slli       s9, t2, 13
                  slli       a1, a4, 4
                  nop
                  slt        a4, a3, a2
                  sltiu      t5, t5, 10
                  slli       s6, a7, 9
                  lui        zero, 57232
                  sltu       s8, s4, a4
                  sltiu      sp, gp, -272
                  xori       a6, a7, -635
                  sltu       s8, ra, t2
                  slt        a2, t4, s6
                  srli       s9, a4, 24
                  srai       s7, t5, 31
                  slti       t3, a3, 693
                  xor        a3, t5, tp
                  slt        s5, a1, a7
                  slli       t6, s0, 27
                  sltiu      a1, s8, -451
                  and        s1, s3, s6
                  and        a2, a2, a2
                  and        t0, t6, t4
                  addi       s1, a2, 342
                  xori       ra, a7, 655
                  srl        a1, tp, t6
                  and        tp, a5, a0
                  addi       gp, s8, 732
                  xor        a0, s5, s0
                  sltu       sp, t6, ra
                  lui        tp, 176799
                  srli       a4, s4, 27
                  xori       t0, s7, 970
                  slti       t1, s5, -748
                  andi       t6, s10, 355
                  nop
                  andi       t3, t0, 252
                  addi       a0, s1, -909
                  sll        s0, t2, t1
                  sub        s1, s9, a1
                  srli       t1, t0, 24
                  lui        s10, 755063
                  ori        s7, ra, -186
                  sltu       s5, a2, s1
                  srai       s1, s4, 26
                  srl        a0, a7, s9
                  or         a0, s4, a6
                  sltiu      s1, a4, 497
                  slti       tp, s2, 447
                  srl        a4, a3, s9
                  lui        s5, 267414
                  slt        a2, t4, a0
                  srai       t3, s1, 19
                  srl        a3, s3, a2
                  sltiu      a6, s10, -614
                  srli       s3, t2, 5
                  srl        t0, s10, ra
                  sltu       tp, s10, a5
                  slt        a0, t1, s8
                  addi       a6, a2, -221
                  xor        a1, s9, a5
                  nop
                  xori       sp, gp, 146
                  xor        t4, s11, s10
                  lui        s1, 83698
                  and        t6, s10, t0
                  srai       s7, s11, 30
                  auipc      a4, 285295
                  or         t4, s1, zero
                  lui        gp, 839451
                  sub        t6, s3, s6
                  sub        ra, t3, s3
                  addi       a7, s9, -407
                  nop
                  sub        t6, sp, ra
                  nop
                  srli       s5, s4, 23
                  xori       s7, s9, -3
                  and        t6, s3, a1
                  srl        s5, s5, s4
                  slli       a0, ra, 27
                  srl        a6, sp, t2
                  srl        s1, s2, s4
                  auipc      t5, 884769
                  or         t3, s11, s7
                  slt        a4, s11, s4
                  xori       t1, s7, -813
                  auipc      ra, 626561
                  nop
                  or         t3, s0, ra
                  sltiu      t2, s9, 414
                  addi       t0, s6, 16
                  nop
                  auipc      zero, 628139
                  xor        tp, ra, t2
                  srli       ra, a3, 14
                  slli       tp, s10, 28
                  sltiu      sp, a7, -427
                  sub        s11, s8, s10
                  xori       s3, t6, -629
                  slti       zero, a0, -501
                  add        s1, ra, s5
                  sll        gp, zero, s7
                  slt        sp, t2, s3
                  sra        t5, s8, a6
                  sltiu      s0, tp, 254
                  addi       a2, a2, -1010
                  srli       a6, s9, 24
                  andi       a7, a1, 839
                  slti       t0, t2, 336
                  and        s1, s8, a2
                  srli       t4, t5, 18
                  andi       sp, tp, -426
                  sra        ra, s4, s9
                  srli       s1, t6, 18
                  or         tp, tp, a2
                  addi       a1, s5, -765
                  xori       a1, a0, 682
                  xori       t6, sp, 179
                  xori       s8, s11, -144
                  nop
                  andi       t0, s4, 32
                  lui        t4, 871010
                  auipc      sp, 512257
                  sltiu      t4, t2, 747
                  ori        a7, s6, 666
                  srai       t5, zero, 16
                  srli       t2, t3, 14
                  add        gp, t2, s6
                  srli       s6, s2, 19
                  slli       a2, s4, 22
                  slt        a1, sp, a1
                  sltiu      zero, t6, 505
                  srli       s3, a7, 22
                  sll        s8, a4, a3
                  sub        s8, a7, s3
                  slt        a4, t0, s5
                  srai       ra, t6, 19
                  nop
                  or         a3, s8, a2
                  slti       t2, a5, 717
                  sll        a6, t0, a5
                  srli       a3, zero, 28
                  srai       t3, s10, 18
                  srai       a6, t6, 14
                  lui        a4, 1020065
                  sltu       t6, s2, a5
                  srai       a6, a1, 5
                  and        a1, t2, a7
                  sub        t5, a7, t4
                  srl        t4, a6, a0
                  lui        sp, 1020585
                  andi       s3, a2, -612
                  andi       a3, t5, 238
                  ori        t6, ra, -576
                  andi       a3, t6, -851
                  slt        a4, gp, s0
                  srai       s5, s6, 10
                  ori        sp, s1, 706
                  auipc      s10, 39263
                  srl        a1, s10, s4
                  and        a7, a6, tp
                  sll        s11, s1, s9
                  slti       t6, a2, -840
                  srai       a2, t5, 31
                  xori       a1, s4, -521
                  sltu       s9, t4, tp
                  add        tp, tp, s3
                  sra        a2, t0, t1
                  ori        t6, tp, 904
                  sub        tp, ra, s1
                  sltiu      a6, zero, 381
                  slti       s5, s7, 134
                  addi       tp, s9, 337
                  sub        s5, a5, a5
                  andi       t3, t2, -598
                  nop
                  lui        sp, 78074
                  andi       s9, a2, -17
                  auipc      ra, 527832
                  sltiu      s5, a2, -844
                  addi       s11, a7, -653
                  slt        s10, t5, a2
                  xor        zero, s1, s1
                  srai       a6, t4, 9
                  srl        t3, t1, t0
                  xori       s1, t6, -72
                  xor        a1, t3, zero
                  xor        t4, sp, s7
                  xori       t5, a6, -516
                  addi       a0, a0, 382
                  xori       sp, s6, -438
                  srl        s7, t1, a5
                  nop
                  sll        s6, s11, t5
                  xor        a3, zero, s11
                  sll        s7, zero, t1
                  slli       s1, a1, 31
                  srli       s11, a1, 5
                  nop
                  lui        a3, 1011733
                  or         a0, a1, t3
                  slli       sp, a2, 15
                  lui        t0, 952501
                  sltiu      s1, s8, 310
                  add        t4, t1, s7
                  slli       t1, zero, 15
                  sltu       a0, s10, tp
                  nop
                  and        sp, gp, a5
                  srl        a4, a6, t0
                  sltiu      t5, t1, -131
                  srli       s1, a0, 18
                  or         t2, s4, s8
                  ori        sp, a2, 322
                  andi       s0, s7, 439
                  sll        ra, t3, s7
                  add        t3, s11, s11
                  sll        a6, s10, a4
                  lui        gp, 906321
                  add        t2, s5, t1
                  sll        t3, s8, s10
                  sltu       a0, zero, zero
                  sub        s6, t6, s4
                  sll        sp, a7, a2
                  andi       tp, s4, 831
                  slti       a7, s0, 782
                  srai       t3, s3, 2
                  srl        a6, t0, a6
                  sltiu      s3, t1, 42
                  xori       a1, a6, 453
                  addi       t3, s7, 632
                  andi       s5, s11, 92
                  sltu       t5, t6, a6
                  xor        t1, s10, t6
                  sra        ra, a4, s9
                  sltu       a6, a1, a2
                  lui        t1, 992189
                  xor        a3, a7, ra
                  nop
                  lui        a6, 135233
                  or         t1, a7, s0
                  sub        s11, s8, a2
                  or         a0, a1, a4
                  xori       a0, tp, 507
                  addi       t5, s2, -405
                  sll        s7, a4, a2
                  ori        t1, a2, -727
                  slti       ra, zero, 785
                  ori        s0, s7, -916
                  andi       s7, a6, 776
                  add        s9, t6, a7
                  srl        t1, t6, s7
                  srai       sp, t3, 15
                  or         s9, t2, s7
                  auipc      t1, 261719
                  or         s5, t0, t3
                  addi       s3, s2, -107
                  srai       s3, s1, 7
                  slli       a0, a3, 18
                  ori        a0, gp, 883
                  or         ra, s5, s7
                  ori        s8, s3, -793
                  nop
                  xor        a2, t6, s6
                  and        a7, s4, t4
                  srli       a2, a3, 23
                  slti       s1, s6, -531
                  xor        a7, a1, t0
                  xor        zero, a5, a5
                  srl        s10, t0, s6
                  xor        t4, zero, sp
                  auipc      s3, 924650
                  sltu       s6, a0, s6
                  srli       s5, s1, 4
                  lui        a6, 496091
                  add        s5, s2, tp
                  sll        a6, s2, t5
                  or         s9, t3, s2
                  or         a0, s5, zero
                  nop
                  andi       s8, s11, -122
                  add        a6, s6, a4
                  slt        gp, s4, t5
                  lui        sp, 7077
                  auipc      t0, 854972
                  slti       t0, s9, 48
                  add        t2, s11, a6
                  nop
                  auipc      t1, 913788
                  slti       gp, a1, 120
                  sub        gp, s1, a5
                  auipc      t0, 774036
                  or         t6, tp, t3
                  sltiu      t4, t0, -836
                  or         a0, ra, t0
                  and        a6, tp, s5
                  or         a4, s11, s4
                  xori       a6, sp, 595
                  nop
                  auipc      s9, 565415
                  ori        tp, a7, 530
                  ori        t6, a0, -787
                  or         t1, s11, s0
                  auipc      a1, 306203
                  auipc      s5, 745759
                  sll        t6, t4, t3
                  sltu       s10, s10, gp
                  add        gp, t2, a6
                  srli       t5, zero, 2
                  slli       t0, sp, 13
                  nop
                  lui        a2, 731642
                  xori       a0, s8, -413
                  or         zero, tp, s7
                  and        gp, s9, s9
                  srl        s5, tp, s8
                  and        gp, t4, s2
                  and        s11, a0, a5
                  slt        sp, tp, s4
                  and        a6, t6, a3
                  sub        a2, s3, s5
                  auipc      s7, 969918
                  ori        a1, a5, 93
                  srl        s1, gp, t1
                  sltu       s9, t2, s5
                  sub        t1, t0, a6
                  xor        t6, tp, a0
                  sltu       ra, t0, s2
                  slti       sp, t2, -418
                  lui        ra, 128451
                  ori        s0, s1, 389
                  srl        t5, s11, s11
                  slti       s3, s9, 214
                  addi       s7, a7, 106
                  ori        a6, a6, -816
                  or         t2, s8, a7
                  sub        a7, a3, s9
                  lui        s11, 983300
                  xor        t1, a0, t6
                  xori       a7, t4, 952
                  nop
                  xori       s9, s7, -7
                  xor        s1, s7, a3
                  srli       a4, a2, 8
                  slti       s6, t3, 64
                  sra        a6, tp, t4
                  slt        t6, a5, a3
                  sub        tp, ra, s6
                  andi       a2, t1, -327
                  lui        sp, 856491
                  lui        a7, 880124
                  add        t4, a4, a2
                  or         t0, ra, s1
                  nop
                  ori        s7, zero, -642
                  sub        a4, s8, s1
                  slt        t3, t0, s5
                  sltiu      t1, s8, 641
                  nop
                  nop
                  add        t2, t2, a1
                  andi       s5, t6, 579
                  slli       sp, zero, 17
                  xor        s5, a2, t6
                  lui        t4, 944445
                  or         t0, s5, a0
                  auipc      s1, 781412
                  slti       a4, s10, -382
                  sltu       s7, zero, t6
                  srai       s9, a6, 30
                  srl        s1, s6, t2
                  xori       s9, a4, 758
                  add        s10, tp, s3
                  nop
                  lui        s3, 48253
                  and        t0, s2, s11
                  srai       s5, t1, 9
                  or         s8, s9, s4
                  sltu       a7, t5, a5
                  or         s1, s4, a6
                  srai       a2, s11, 3
                  srli       a3, s2, 19
                  srai       a6, s3, 21
                  lui        a4, 525181
                  lui        t5, 738443
                  sub        zero, a6, s3
                  lui        t4, 85672
                  srli       a7, s6, 11
                  slt        a0, s8, a3
                  add        s8, t1, s0
                  andi       t1, s7, 171
                  andi       a4, gp, -501
                  sub        a6, s1, zero
                  sltu       s9, t0, s6
                  or         a1, s8, gp
                  xori       a1, zero, 128
                  slli       s3, a7, 17
                  nop
                  auipc      a2, 947830
                  lui        s10, 914245
                  xori       t4, t5, 18
                  nop
                  lui        s0, 820567
                  add        tp, a6, a7
                  ori        t2, gp, 751
                  auipc      ra, 272206
                  sltu       a7, s0, a7
                  lui        s0, 582707
                  sltiu      a1, t2, -419
                  xori       gp, a5, 632
                  ori        s6, s7, 122
                  slli       sp, a2, 21
                  add        gp, t4, s7
                  ori        t2, t5, -283
                  sll        zero, t5, s1
                  nop
                  slti       t4, gp, -423
                  sub        ra, s6, s10
                  slti       a0, s10, -402
                  xor        t3, a3, sp
                  sra        s1, s0, t3
                  sll        a3, a2, s2
                  sltiu      s9, sp, -503
                  auipc      gp, 115259
                  andi       a1, a1, 685
                  slt        t6, t6, t6
                  sra        s8, s9, s6
                  ori        s3, s11, -1024
                  addi       s3, s9, 457
                  srli       t5, s11, 20
                  addi       a6, gp, -455
                  sub        t1, sp, ra
                  nop
                  nop
                  srai       ra, ra, 3
                  slt        s7, s9, a1
                  andi       s11, a0, 961
                  srli       s10, a0, 16
                  auipc      s3, 924853
                  nop
                  sra        t2, s11, s1
                  xori       zero, a5, -209
                  addi       s3, a2, -96
                  addi       zero, gp, -105
                  nop
                  sltu       t2, s3, s0
                  xori       a6, zero, 470
                  add        ra, t2, t1
                  srai       s11, a0, 28
                  slti       t4, a0, -128
                  add        a4, t2, t3
                  or         t1, a4, s1
                  nop
                  sll        ra, a0, s6
                  sltu       a1, s11, gp
                  sltiu      sp, tp, -778
                  sub        tp, s4, t3
                  lui        t1, 387515
                  srl        t2, s1, t6
                  andi       a2, s9, -110
                  sltiu      t3, ra, -810
                  srl        sp, a5, a6
                  slli       t2, a0, 3
                  srai       t5, a4, 27
                  slli       a3, s9, 13
                  sub        t3, a5, a5
                  addi       s9, a2, 400
                  or         s6, s1, a0
                  slti       a4, tp, -201
                  slti       s11, s6, -130
                  slti       a6, t4, -258
                  auipc      ra, 731344
                  sltu       s11, a7, a1
                  sltu       a7, a0, s5
                  add        s1, a1, t0
                  or         s1, s10, s7
                  sub        a3, a4, a7
                  andi       s3, s3, -990
                  srl        t4, s7, s7
                  lui        tp, 77919
                  slt        s5, t3, tp
                  sub        t4, t6, sp
                  add        t1, t6, a6
                  sll        s0, t3, a1
                  xor        s11, gp, t2
                  xori       s10, a5, 895
                  lui        zero, 750365
                  and        s1, s10, ra
                  andi       zero, a5, 371
                  and        ra, a7, t6
                  srl        a6, s11, t0
                  srai       zero, t1, 6
                  or         t0, s8, ra
                  andi       ra, tp, 509
                  sltiu      a7, a6, -193
                  sra        s1, s0, gp
                  sll        t4, s0, s5
                  sub        tp, s3, a6
                  ori        t2, s7, 313
                  ori        s3, s8, -704
                  sltu       a0, t0, ra
                  slt        t2, t5, s1
                  sra        s10, a3, gp
                  add        a1, s1, sp
                  slt        t3, a5, ra
                  sra        t1, s3, a3
                  addi       t4, t6, -619
                  sltiu      s9, s2, -189
                  srai       zero, s2, 16
                  srli       s8, ra, 4
                  slti       tp, sp, 33
                  andi       s5, s9, -942
                  sra        t6, sp, t2
                  sra        s5, ra, s5
                  sltu       tp, a6, s5
                  xori       tp, gp, 642
                  ori        a4, t0, -890
                  sub        a3, s9, a0
                  lui        s7, 837538
                  auipc      s7, 184331
                  srai       t4, a3, 4
                  sll        t6, tp, s5
                  sra        a6, tp, s11
                  srai       s7, s3, 8
                  srai       s11, tp, 27
                  or         t2, a0, gp
                  slli       s11, s5, 9
                  srli       a4, s9, 30
                  addi       zero, a2, -484
                  sub        s1, sp, s2
                  and        t1, s6, gp
                  slti       s9, s10, 418
                  and        s6, t5, t1
                  slli       a7, t5, 30
                  srl        gp, t4, s5
                  slti       sp, a5, 944
                  auipc      t6, 733944
                  nop
                  and        a7, s0, tp
                  sub        t4, t4, sp
                  lui        s7, 68000
                  slt        t2, a2, a3
                  add        t5, t4, t0
                  srl        s1, t6, a5
                  slli       s1, s5, 0
                  sltiu      tp, s5, -550
                  andi       s1, a7, 485
                  sltiu      s8, t6, -234
                  nop
                  sra        a3, t5, t2
                  xor        t1, s7, ra
                  sub        a6, t1, a7
                  nop
                  andi       sp, tp, 434
                  sltiu      s1, t5, -58
                  srli       t4, s1, 7
                  slti       s0, tp, -246
                  addi       s6, t6, -721
                  slti       a1, gp, 788
                  sltu       tp, t0, tp
                  xor        gp, a6, s8
                  andi       gp, t0, 892
                  ori        tp, tp, -2
                  slt        s11, sp, s6
                  and        s1, t6, a6
                  srli       s8, tp, 14
                  sltiu      a4, zero, -453
                  add        t1, t0, a4
                  andi       t4, s6, -319
                  or         t0, s9, s4
                  lui        s11, 600386
                  lui        s7, 962803
                  andi       s3, s11, 313
                  slti       a4, a7, -426
                  and        s9, s5, t2
                  xor        zero, s8, t1
                  srai       t0, t3, 27
                  sltiu      t1, t3, 587
                  xor        s0, ra, s3
                  lui        s9, 559746
                  andi       a3, t1, 830
                  auipc      t5, 392894
                  add        t6, s5, s1
                  srai       t3, s8, 4
                  andi       t5, t6, -400
                  nop
                  slti       a0, sp, 939
                  srli       s1, s2, 21
                  srli       a0, s1, 14
                  xor        a1, a0, s3
                  lui        a4, 522789
                  add        s1, a0, t3
                  or         s11, a4, a5
                  srli       a2, t3, 21
                  nop
                  addi       a7, sp, 813
                  add        t5, zero, a3
                  nop
                  sub        t4, tp, s11
                  lui        s8, 485902
                  slli       a3, a6, 26
                  slti       tp, t3, -624
                  sltiu      s10, a7, 252
                  sltiu      a7, tp, 512
                  ori        sp, s3, 807
                  addi       s5, t3, 151
                  sltiu      t5, s3, 966
                  auipc      tp, 412455
                  sra        gp, s0, s3
                  sra        t5, a4, s8
                  sra        sp, t1, a4
                  sltu       gp, a7, s3
                  xori       t2, s9, -673
                  ori        a3, s4, 511
                  or         sp, a5, a4
                  sltiu      gp, s1, 358
                  sra        zero, s6, gp
                  sra        s10, a4, s1
                  sra        s6, a4, t2
                  sltu       a6, a1, s4
                  lui        s9, 377824
                  andi       a4, s3, -721
                  auipc      a3, 874283
                  andi       zero, a2, -347
                  slti       t0, s10, 175
                  and        s3, t5, a1
                  add        s1, ra, s10
                  andi       tp, s0, 120
                  xori       s11, t2, -3
                  nop
                  srai       s3, s4, 29
                  and        s10, s4, t3
                  andi       a7, a0, 452
                  sub        s11, ra, tp
                  srai       tp, t2, 4
                  ori        sp, sp, 58
                  addi       s7, t0, -411
                  nop
                  sltu       tp, s11, t5
                  slli       zero, t6, 9
                  addi       a0, t5, 66
                  slli       s6, s11, 31
                  sltiu      a1, a3, -910
                  sub        sp, gp, s5
                  sltu       s11, t4, s8
                  sub        s6, s9, a0
                  srli       s0, s6, 22
                  nop
                  sll        t1, a0, a6
                  and        s6, a5, s7
                  slti       s10, a6, -385
                  sltiu      a2, s3, -752
                  sltu       a2, a7, s0
                  ori        ra, t4, -689
                  sll        t1, t4, a0
                  slli       s8, s5, 20
                  and        s5, s7, s5
                  lui        a6, 261975
                  slli       sp, t0, 16
                  or         s10, a6, a2
                  addi       a7, tp, 627
                  auipc      sp, 364369
                  and        s10, t1, ra
                  addi       s6, tp, 725
                  addi       a6, t5, -38
                  andi       s3, t6, -391
                  add        s5, a0, sp
                  slti       zero, t0, 248
                  slti       s1, sp, 922
                  srli       s9, t5, 13
                  nop
                  srl        t1, a4, s4
                  and        t1, s11, a4
                  sltiu      t0, s3, -603
                  slti       s9, t4, 748
                  slti       s5, a6, 238
                  srai       t6, a2, 10
                  sll        zero, ra, t6
                  or         a0, s0, a7
                  sltiu      t4, a3, -991
                  nop
                  sltiu      s8, a4, -821
                  srl        t5, a3, a7
                  xor        gp, s3, t4
                  srli       s5, s2, 4
                  sltu       s1, sp, a7
                  srl        zero, s8, s5
                  ori        t3, s5, -861
                  slt        s3, s2, a6
                  ori        a2, t4, -387
                  add        s5, s3, a6
                  lui        a1, 730038
                  xor        zero, s3, tp
                  srli       a6, s8, 23
                  slti       t1, sp, -615
                  or         s0, a5, a0
                  ori        t2, s5, 339
                  slli       t4, t1, 18
                  auipc      gp, 323777
                  sltu       a4, t3, t5
                  sub        s6, s10, s3
                  nop
                  ori        a2, t5, 412
                  auipc      t1, 433666
                  sra        s0, a5, sp
                  srl        a1, s3, tp
                  slli       t2, t0, 31
                  or         t5, t6, tp
                  xori       t6, gp, -486
                  slti       s8, a5, 128
                  slli       s0, tp, 15
                  srl        t1, a3, s9
                  nop
                  addi       t6, s8, -429
                  srl        a2, ra, a5
                  or         ra, s9, s11
                  srai       s10, a7, 27
                  slt        a4, a3, s5
                  slli       s5, t6, 2
                  slli       t2, s0, 8
                  andi       a3, a2, 586
                  xori       a3, s3, 810
                  sub        a2, t4, a6
                  srai       a2, a4, 27
                  slt        t2, t0, a4
                  srai       s11, a4, 6
                  sltu       a7, a4, s0
                  slti       a7, a7, -381
                  sll        s3, t1, a1
                  srli       s0, t5, 30
                  sra        s6, gp, t0
                  sub        s10, gp, s2
                  slti       zero, sp, -84
                  lui        t5, 933436
                  ori        sp, sp, -62
                  slti       a2, t0, 408
                  slti       a0, ra, 53
                  or         s6, t2, a6
                  srai       a3, s4, 31
                  auipc      s5, 340328
                  srai       t3, gp, 0
                  srai       t3, a2, 14
                  sra        a3, zero, s4
                  sltiu      s1, s4, 687
                  lui        t5, 195698
                  srl        sp, s10, s1
                  andi       s10, a2, 995
                  nop
                  xor        a3, tp, s5
                  sltu       s1, t4, s9
                  ori        t6, s2, -166
                  slti       s10, a4, 371
                  srl        a6, s11, a5
                  add        a1, sp, s9
                  ori        s5, s2, -708
                  srai       t3, t4, 2
                  lui        sp, 475508
                  slti       s6, a1, 243
                  srai       t0, t6, 5
                  nop
                  lui        t2, 561359
                  lui        t3, 730508
                  srl        a6, a6, tp
                  sltiu      t2, a1, 127
                  andi       s1, t4, 592
                  sltu       t2, ra, s1
                  ori        a0, s6, 74
                  and        gp, gp, t3
                  sltiu      gp, a7, 299
                  andi       a4, sp, 848
                  addi       a2, s0, -789
                  and        t1, s5, a3
                  srli       t6, s7, 9
                  or         t1, gp, t0
                  andi       a4, s2, 752
                  sub        ra, t0, tp
                  srli       a6, a7, 2
                  auipc      sp, 219557
                  ori        sp, s2, -952
                  and        a0, s9, t1
                  slli       gp, s2, 4
                  sll        s6, s11, s10
                  auipc      zero, 495410
                  and        s1, a5, s11
                  xor        a6, sp, t0
                  sub        s10, s4, s9
                  sra        a4, s8, s6
                  nop
                  slli       zero, s9, 7
                  addi       s0, s11, -527
                  and        zero, s7, s11
                  slt        gp, s3, a6
                  nop
                  srai       ra, s0, 28
                  ori        a1, a5, -980
                  sltiu      ra, a3, -520
                  slt        t2, t1, t2
                  lui        a4, 782778
                  ori        a2, a4, 672
                  nop
                  srai       sp, t4, 30
                  or         s5, s1, t6
                  nop
                  srai       s8, t2, 5
                  andi       a4, s2, 143
                  and        s5, a2, a5
                  auipc      a7, 522602
                  sra        s5, s6, s6
                  andi       sp, a4, -463
                  sra        tp, ra, a3
                  srl        a3, t2, s9
                  andi       s1, s7, 4
                  addi       t0, s10, -88
                  andi       s5, zero, -823
                  srai       t3, s7, 27
                  sltiu      gp, s7, 413
                  sra        t3, a3, a5
                  slli       s5, tp, 29
                  srai       s7, a1, 9
                  lui        tp, 905288
                  ori        s11, a0, -744
                  andi       t1, s10, -111
                  addi       t0, gp, -11
                  lui        s5, 1004907
                  lui        t5, 891069
                  slt        s8, zero, tp
                  lui        t3, 10631
                  srai       zero, t4, 29
                  sub        tp, s10, a1
                  slli       t5, t3, 18
                  nop
                  add        a3, s7, t2
                  and        a4, gp, s2
                  sub        s5, a0, s8
                  sltiu      t1, s7, 2
                  slti       s10, s5, -1001
                  sub        s11, t6, s10
                  and        s5, a3, t1
                  lui        s5, 861129
                  sltu       t2, s3, a7
                  lui        s7, 772053
                  auipc      tp, 718395
                  addi       s0, t0, -525
                  sra        zero, t6, s10
                  slti       a6, a5, -240
                  xor        ra, s7, s1
                  srai       tp, t5, 27
                  srl        s9, s11, s2
                  andi       s6, s2, 404
                  addi       a0, a0, -310
                  ori        s8, a0, -677
                  xori       s10, zero, -187
                  slti       t3, a3, 435
                  sra        s0, s6, a6
                  sub        s11, a2, a4
                  srli       t1, gp, 1
                  andi       a6, s6, 441
                  slli       s1, s10, 7
                  srl        ra, s4, s7
                  srl        gp, gp, s0
                  sra        tp, a7, a6
                  sltu       s7, s5, a4
                  addi       a7, gp, 620
                  and        s5, s1, t3
                  nop
                  srl        s5, a6, zero
                  ori        a6, tp, -496
                  sltu       sp, a0, s10
                  ori        t5, s9, -679
                  sltiu      a4, a0, -102
                  srli       gp, t3, 24
                  sltiu      s3, s9, -578
                  ori        s1, t2, -870
                  slt        tp, t2, t0
                  slti       t6, s7, 22
                  addi       t4, a7, -934
                  ori        t2, s4, 881
                  sra        s7, t4, a2
                  addi       a0, s11, -584
                  sub        t0, t4, t3
                  slli       t0, sp, 26
                  sra        a4, zero, a0
                  slli       ra, s7, 22
                  srli       t4, s10, 13
                  sll        a6, s2, tp
                  lui        a3, 426707
                  sra        a2, sp, s5
                  srli       a7, s4, 20
                  nop
                  sltiu      s8, a4, -319
                  ori        a6, a4, -552
                  lui        a4, 212139
                  addi       s11, a0, 97
                  nop
                  sll        s1, a6, a7
                  slti       s5, s7, -169
                  srai       t2, ra, 11
                  xori       s7, t5, 276
                  lui        t6, 189209
                  auipc      gp, 105527
                  or         t6, t0, a2
                  xori       s1, sp, 967
                  slt        tp, a4, s4
                  xor        a1, a3, t5
                  slti       s9, s1, -240
                  auipc      a7, 895895
                  lui        a4, 864276
                  xor        a3, s10, s5
                  and        a0, a3, s9
                  addi       a6, a3, 302
                  lui        s11, 394280
                  lui        a7, 895600
                  slt        a7, s2, sp
                  sltu       gp, a5, gp
                  auipc      a4, 752485
                  sltu       s6, a5, t0
                  sltiu      gp, s10, -664
                  lui        t1, 929053
                  sra        tp, a2, s11
                  xor        s1, s4, s4
                  slli       tp, s6, 17
                  ori        a2, t5, -53
                  or         s7, s7, s10
                  sltiu      ra, a1, 361
                  slli       s3, s2, 2
                  auipc      a7, 701243
                  slli       t6, t4, 16
                  or         s10, s3, t6
                  auipc      s7, 422039
                  addi       a7, a0, -496
                  srl        ra, s6, sp
                  srl        a6, s7, ra
                  srl        t5, a6, t2
                  sll        t3, s7, tp
                  ori        t0, t3, 485
                  or         s10, s7, a3
                  andi       sp, a7, 852
                  sltiu      s5, s0, 472
                  nop
                  auipc      s7, 852734
                  add        a7, t1, s10
                  and        a6, a2, s1
                  sltu       s6, ra, a6
                  sltu       s10, t4, s11
                  sltiu      t3, s10, 23
                  xori       a7, s1, 525
                  srai       s5, s0, 30
                  auipc      zero, 973065
                  auipc      sp, 507774
                  or         a2, t2, s6
                  xor        a2, s5, t4
                  sltu       s0, a0, s2
                  slti       s0, s8, 827
                  andi       zero, s2, -677
                  slti       zero, t5, 13
                  add        s1, a1, s6
                  and        t6, a4, s0
                  sll        s9, t4, a2
                  lui        s3, 53942
                  slli       a7, a2, 18
                  and        t4, s10, s8
                  or         a4, s6, s3
                  srl        a3, a0, a2
                  sra        a3, ra, tp
                  auipc      s3, 961243
                  srli       ra, s2, 1
                  add        gp, t4, t4
                  nop
                  add        t4, a1, t2
                  add        a3, t2, a4
                  xori       t3, s5, -642
                  slli       s0, t0, 25
                  sra        t5, s11, s0
                  and        gp, t2, s9
                  srl        a7, s9, a5
                  sra        t6, s5, s8
                  sll        a1, a7, t3
                  sll        a7, a7, a4
                  srl        s10, a1, a2
                  auipc      ra, 199922
                  auipc      a2, 841236
                  sltu       t6, ra, s6
                  srl        a2, a6, s3
                  ori        a4, a1, -1015
                  srl        sp, s6, s9
                  lui        s0, 466799
                  srai       a2, tp, 18
                  xor        a4, a6, t3
                  add        t2, a7, s4
                  lui        a2, 1043011
                  or         s3, s10, a4
                  sll        a7, t1, a2
                  and        s5, t2, t6
                  andi       t4, t1, -1008
                  slt        s5, t1, ra
                  auipc      gp, 317489
                  ori        s0, s4, 617
                  auipc      t6, 793937
                  ori        s3, s2, 869
                  srli       s9, s9, 3
                  andi       s0, s3, 62
                  sra        a3, t0, t3
                  srli       a3, s0, 19
                  sll        t1, ra, a4
                  andi       sp, s5, 404
                  sltiu      s5, t4, 480
                  sltu       a2, a3, t1
                  addi       s3, s10, -800
                  addi       s3, a1, -702
                  xori       a7, t1, 344
                  sub        s10, s1, t3
                  sltiu      t3, ra, -274
                  auipc      s6, 747510
                  lui        s1, 788401
                  auipc      s5, 640080
                  auipc      s1, 240546
                  sltu       t1, a3, t6
                  srl        s10, t4, a3
                  xori       a2, s11, -578
                  or         s10, t6, a6
                  slli       tp, a2, 31
                  addi       s8, s6, 731
                  lui        a6, 680866
                  nop
                  srli       a1, sp, 28
                  slti       a2, tp, 302
                  srai       zero, tp, 23
                  srai       s3, t2, 29
                  srl        a3, sp, tp
                  sll        sp, t4, s8
                  slli       t4, s4, 11
                  addi       tp, a1, -110
                  ori        a1, s3, 602
                  add        gp, t0, s3
                  add        s7, a3, t3
                  slli       s3, a3, 11
                  slti       t4, zero, -318
                  add        gp, s2, s6
                  add        s1, s10, t4
                  slt        t5, s6, s9
                  slti       s9, s4, -155
                  nop
                  sra        t2, t4, s4
                  sltiu      s5, a6, 962
                  andi       t6, s0, -340
                  addi       s9, a3, -718
                  and        t1, a0, s8
                  and        t4, s2, tp
                  srli       a0, s4, 7
                  slti       a6, a4, 972
                  slti       a7, s5, 76
                  slt        s6, ra, s7
                  slti       s7, s1, -733
                  xori       tp, t2, -329
                  srl        t6, a4, a0
                  andi       s0, s5, 964
                  slt        a1, s8, ra
                  sra        a4, s8, s10
                  sll        s5, tp, s1
                  ori        s9, t6, 340
                  nop
                  srai       s7, a7, 28
                  sub        s6, tp, ra
                  srai       a6, gp, 10
                  and        a4, t6, s10
                  add        t0, a3, t3
                  auipc      s0, 317265
                  sll        zero, t4, a4
                  sll        t4, zero, s0
                  addi       t3, t4, -72
                  sltu       s11, t2, zero
                  sub        a6, a5, a5
                  sra        zero, a5, a5
                  or         tp, a0, t4
                  nop
                  and        a2, gp, a4
                  srli       a1, sp, 15
                  ori        t3, s9, 585
                  slti       a6, s3, 299
                  addi       ra, a5, 365
                  and        s3, a5, ra
                  xor        a7, s6, t2
                  sll        ra, s11, s1
                  and        s9, s7, a0
                  sub        s7, sp, ra
                  xor        a6, s9, s3
                  ori        s8, a5, -205
                  sltu       t5, s10, s3
                  xor        sp, a2, s9
                  srli       t6, t6, 11
                  slti       s9, a4, -75
                  srai       zero, a4, 3
                  sltiu      s3, ra, -845
                  sra        s11, a5, zero
                  xori       s3, sp, -226
                  sub        s8, zero, s7
                  auipc      a7, 446880
                  and        ra, s6, a0
                  sll        sp, s4, a6
                  sltiu      a3, tp, -158
                  srl        a6, s5, a6
                  sra        a4, t4, t3
                  and        a6, s8, a4
                  sltiu      s7, s6, -259
                  sltiu      a2, s3, -425
                  srli       s9, gp, 21
                  ori        t5, tp, -945
                  add        t1, zero, gp
                  auipc      a0, 484022
                  andi       s10, t3, -876
                  xori       s7, s2, 732
                  srl        tp, gp, t1
                  srli       s1, s5, 9
                  ori        a1, t3, 844
                  andi       t4, s8, 564
                  sll        sp, t2, ra
                  lui        a2, 431023
                  srai       s6, s7, 29
                  sltiu      t6, a2, -857
                  auipc      sp, 201433
                  auipc      a4, 46794
                  nop
                  xor        s1, a7, a0
                  slli       a2, a4, 14
                  lui        t2, 686446
                  and        a4, s8, s5
                  srai       a3, s3, 15
                  srai       s9, ra, 7
                  sub        t4, t3, t0
                  sub        a6, a6, t4
                  auipc      t2, 657693
                  auipc      t4, 966977
                  slt        s8, t3, t6
                  auipc      zero, 215326
                  ori        a3, a2, 511
                  sltu       s3, a4, tp
                  srl        t5, s4, t6
                  add        t3, s0, s7
                  addi       s0, s1, 696
                  sltu       s0, gp, t2
                  or         a2, t5, a4
                  lui        a3, 31237
                  or         s1, t1, t2
                  sltu       tp, gp, a4
                  lui        s7, 111404
                  nop
                  slt        s6, a3, gp
                  srli       s8, a2, 5
                  sra        s5, t0, s0
                  sll        zero, s5, sp
                  sub        t0, a3, t0
                  slti       a1, a7, -476
                  xor        s10, a6, gp
                  sltu       tp, t5, s0
                  xori       t6, s1, 551
                  addi       s1, a2, -797
                  slt        t5, sp, a2
                  srai       s6, s2, 30
                  lui        ra, 221388
                  sltiu      s5, s11, -51
                  lui        s0, 712568
                  slli       s6, s8, 3
                  sub        s10, s7, a0
                  srli       a2, s10, 14
                  sltiu      s3, t1, -127
                  auipc      zero, 963119
                  srli       a7, a4, 27
                  srli       s11, t4, 0
                  slt        sp, a0, s7
                  srli       a2, s9, 6
                  addi       a1, s1, 41
                  lui        a6, 963127
                  sll        a1, s11, a5
                  sra        s5, a7, sp
                  sll        s11, s5, s3
                  slti       t5, s5, -366
                  add        t1, s7, s8
                  sll        t3, t4, t0
                  or         s10, tp, s2
                  xori       t4, t1, 110
                  and        t2, t4, t1
                  addi       s7, t1, 611
                  addi       t4, s0, -806
                  addi       a3, a3, 20
                  srli       a3, a4, 20
                  auipc      s3, 271631
                  sltu       a1, t4, t2
                  ori        tp, s4, 610
                  ori        a2, s10, 915
                  sll        ra, t6, s5
                  xori       s10, s1, -547
                  slt        a7, s4, s1
                  addi       s8, s2, 321
                  ori        a3, t5, 576
                  auipc      a2, 310918
                  slli       a3, s9, 1
                  auipc      t1, 871168
                  xori       a6, a2, 385
                  lui        tp, 367821
                  xori       t4, t5, 15
                  or         a4, t1, ra
                  xori       s5, ra, 27
                  sra        s7, s4, a6
                  sltiu      s7, a2, 335
                  or         a6, s2, t6
                  lui        t2, 830063
                  and        a1, tp, a5
                  sll        a6, s3, s8
                  srli       t3, gp, 12
                  sltu       t6, s2, s1
                  slti       a0, a5, -183
                  srli       s8, s10, 9
                  srl        s6, s9, s9
                  or         tp, s3, t2
                  and        s5, t2, t3
                  nop
                  srai       s5, zero, 18
                  srl        a2, a3, tp
                  addi       sp, a0, 374
                  sra        s3, a4, a1
                  slt        s8, s11, a6
                  sra        s5, t5, s2
                  slli       a4, s5, 1
                  add        a0, s3, ra
                  sra        s5, a1, t6
                  nop
                  xor        ra, s1, t4
                  nop
                  sra        t4, s0, a6
                  sltu       a0, a6, s2
                  slt        a7, gp, sp
                  and        s0, s9, t3
                  lui        zero, 804583
                  ori        t2, tp, 660
                  slt        t5, sp, s0
                  xor        s10, a0, t2
                  or         s8, t3, a3
                  nop
                  auipc      s11, 660834
                  slt        t0, a7, s0
                  sltiu      t0, gp, 893
                  xori       s8, ra, -634
                  sll        a0, a2, a6
                  addi       sp, gp, -394
                  or         a2, tp, t3
                  andi       s9, zero, 355
                  lui        s8, 998478
                  srai       ra, s3, 21
                  xor        t3, sp, s10
                  srai       t1, t0, 18
                  auipc      s5, 54926
                  srl        s0, s7, zero
                  lui        s0, 750585
                  add        s0, s11, s8
                  add        s5, s9, s9
                  sub        t6, s0, s8
                  slli       gp, a2, 28
                  auipc      s11, 775251
                  lui        sp, 672749
                  sltiu      a3, s5, 752
                  slt        t0, t5, s2
                  lui        s6, 11995
                  lui        a1, 182025
                  slli       a6, t4, 22
                  sltiu      s5, a1, -121
                  andi       t0, sp, -729
                  sltiu      ra, s7, 726
                  nop
                  add        a6, a4, gp
                  srl        sp, sp, a4
                  lui        a6, 816979
                  or         sp, a5, s7
                  lui        s6, 943529
                  srl        s10, t0, t1
                  addi       tp, sp, 155
                  slt        a4, t3, t1
                  nop
                  ori        gp, a0, -823
                  sra        a4, s0, s6
                  slli       s8, s4, 23
                  xori       s3, a0, -405
                  sltiu      sp, a6, -255
                  sltiu      t1, s2, -513
                  sll        zero, t4, a7
                  slti       gp, ra, -373
                  srl        zero, t1, t2
                  srl        t6, a5, a2
                  lui        s11, 300615
                  slt        zero, s11, s5
                  slti       tp, s3, -144
                  and        s11, s11, s1
                  slti       tp, a5, 242
                  or         ra, a3, a1
                  srl        zero, ra, s0
                  srai       s10, s10, 0
                  sub        s7, t2, s11
                  or         s10, s3, t0
                  nop
                  slli       a6, s3, 31
                  xor        s9, tp, a4
                  sltu       a0, s8, s7
                  srai       s9, s3, 7
                  nop
                  xor        s3, s5, a1
                  sll        t5, s10, a0
                  addi       zero, a0, 992
                  lui        s6, 26462
                  xor        zero, s0, t2
                  ori        t4, t1, -1003
                  srai       t5, s7, 10
                  sra        a3, t6, a4
                  addi       a3, a5, 592
                  xori       tp, s1, -944
                  addi       s10, t6, 763
                  srai       t6, s3, 14
                  sub        a0, a3, t3
                  sll        s10, gp, s0
                  sltu       t4, s9, s11
                  or         a0, a3, t2
                  nop
                  sra        s8, s0, t4
                  sll        zero, a7, t4
                  or         t2, a6, gp
                  srl        s5, t6, s11
                  and        t4, zero, s1
                  srai       t4, tp, 29
                  lui        zero, 70932
                  xori       sp, s11, 894
                  or         t2, t6, s2
                  xor        t0, s1, a3
                  sltu       t2, a5, tp
                  sltu       a4, a1, a4
                  sra        a2, t6, a6
                  or         s11, s5, ra
                  srai       t1, s5, 29
                  slti       s0, t2, 463
                  sltu       s5, sp, s11
                  sll        a6, a1, ra
                  slli       s10, ra, 4
                  srl        a7, sp, t1
                  sll        zero, s9, a3
                  sltu       sp, t2, s3
                  auipc      tp, 1041528
                  auipc      s10, 265198
                  sltu       s7, s10, sp
                  slt        gp, t4, t2
                  nop
                  auipc      t6, 1001000
                  sltiu      s11, a0, -391
                  addi       zero, sp, -624
                  slti       s8, s2, -223
                  nop
                  auipc      s1, 837028
                  sltiu      sp, a3, -554
                  slli       s10, s10, 11
                  xor        a6, a6, s5
                  addi       s9, a1, 14
                  slt        s5, t2, a3
                  or         a0, s1, tp
                  ori        s11, tp, -707
                  slli       s6, s4, 26
                  slt        t4, t3, t1
                  xori       s8, a1, -1017
                  xor        t3, s7, t3
                  or         s3, a5, a6
                  slli       s0, t2, 22
                  nop
                  nop
                  sra        a7, a6, zero
                  xori       a1, zero, -479
                  add        t1, a1, s6
                  slli       t1, a0, 6
                  slti       s9, sp, 1003
                  srli       s0, s4, 28
                  or         a2, t2, a2
                  xori       a4, t6, -366
                  add        t1, s6, s10
                  slti       t6, t0, -238
                  or         s5, t3, t2
                  slti       a2, s11, -375
                  xori       t4, a6, 226
                  addi       s1, s5, -756
                  nop
                  slt        gp, s2, t3
                  srl        a7, t4, s5
                  sll        s0, s7, s9
                  sub        s0, a7, a5
                  nop
                  ori        gp, tp, -425
                  lui        t5, 474403
                  sltu       t4, t2, gp
                  sltu       a2, s3, s0
                  sll        t0, s6, a6
                  slt        zero, a3, t0
                  nop
                  sltiu      tp, s4, 701
                  slt        s5, t3, a0
                  slt        a4, s9, a5
                  slt        a1, a7, s0
                  nop
                  ori        a2, s8, -1020
                  srli       a4, a3, 3
                  xori       s8, s1, -840
                  sltu       t3, s7, s10
                  sll        s6, t6, t4
                  slt        tp, a5, s3
                  or         a2, s8, t6
                  and        zero, s0, s3
                  srli       t5, sp, 7
                  sra        a0, t1, a1
                  or         s9, a6, s1
                  add        s11, t6, a5
                  sltiu      t0, t3, -214
                  xori       t5, t0, 351
                  ori        t2, s0, 323
                  slli       s9, s6, 25
                  auipc      t5, 617938
                  addi       a7, s4, 95
                  slt        t0, s10, a6
                  sll        a0, s5, t5
                  slli       t3, a7, 23
                  slt        a4, a5, s8
                  nop
                  xor        sp, s2, s0
                  srai       tp, s7, 24
                  slti       zero, s11, -588
                  xor        sp, zero, gp
                  srai       s9, a7, 4
                  sub        t4, gp, s1
                  sltu       s3, a3, tp
                  auipc      s6, 450138
                  auipc      a4, 821167
                  xor        s1, s10, t0
                  or         s10, s2, zero
                  or         s0, s10, s1
                  slt        s8, t1, t1
                  slli       a7, t6, 16
                  ori        s5, s3, -414
                  slti       s9, s2, 555
                  srl        s6, t1, gp
                  add        zero, s11, t2
                  ori        s3, sp, -790
                  sub        s0, gp, s0
                  slti       t0, a2, 313
                  addi       a6, t5, -607
                  addi       t1, a0, 376
                  sub        t5, s9, t5
                  sltiu      sp, a0, 743
                  sltiu      a4, s3, -950
                  slti       s11, tp, -112
                  srli       ra, a2, 17
                  sltu       s6, s1, a1
                  sra        a1, a5, s10
                  sltiu      s10, t5, -634
                  sub        s7, s9, s9
                  sltu       t6, a5, sp
                  or         t3, a3, zero
                  sltiu      t1, s11, -929
                  sltu       t3, s6, s1
                  slti       t5, t4, -840
                  lui        zero, 394970
                  sltu       s3, a1, sp
                  auipc      a0, 59549
                  andi       a6, t5, 356
                  srai       a3, s3, 21
                  slti       t4, a6, -927
                  xori       s8, s8, -321
                  sra        sp, s6, t5
                  slli       s0, t5, 11
                  ori        t5, s9, -222
                  slti       gp, s2, 573
                  add        gp, a0, s2
                  and        t5, t5, t1
                  srai       t6, s1, 29
                  srai       ra, a6, 18
                  xor        tp, a2, zero
                  xori       s3, a4, -681
                  srai       t4, s0, 16
                  slli       a4, a7, 21
                  sra        s5, s0, t6
                  sltiu      s9, t3, -962
                  ori        t6, zero, 569
                  srl        a6, s1, s5
                  lui        tp, 948194
                  nop
                  lui        gp, 367448
                  sltiu      tp, a3, -595
                  xori       a0, tp, 277
                  sltiu      t0, t4, 253
                  sra        s7, s6, gp
                  andi       s6, a4, 854
                  xor        sp, s4, gp
                  lui        s8, 781983
                  sltiu      t6, t6, 706
                  addi       a6, s3, 194
                  andi       s9, a6, 784
                  add        t4, s1, s4
                  sub        sp, s2, t0
                  sltu       t1, a4, t4
                  lui        t3, 860203
                  srli       a0, s6, 23
                  sra        a1, s3, a6
                  sra        s8, a1, s6
                  and        gp, t3, a0
                  addi       t4, t6, -236
                  add        t5, a0, s9
                  xor        a3, a1, a1
                  srai       a6, a4, 10
                  slli       t3, a4, 6
                  srl        zero, s10, t4
                  sltiu      s8, sp, -338
                  ori        a6, a4, -872
                  slli       zero, s4, 0
                  sub        t3, t0, a5
                  xor        s8, t0, s10
                  xori       s1, t1, -82
                  auipc      tp, 4341
                  andi       a6, a2, -877
                  and        t5, sp, a4
                  sll        s6, s11, a6
                  xor        s0, a5, s5
                  srl        a2, a4, s5
                  slti       a1, s6, -393
                  add        a1, s11, s2
                  auipc      s9, 715194
                  xori       t6, a4, -388
                  and        tp, t2, a4
                  andi       s3, s8, -782
                  slli       s7, a2, 1
                  auipc      s5, 242849
                  srli       s6, a3, 18
                  auipc      a7, 271261
                  slli       s5, s2, 13
                  or         t6, a3, s6
                  sub        gp, a4, s3
                  addi       s5, a4, 378
                  slli       a7, a0, 1
                  srli       s7, s7, 25
                  srl        zero, s11, a4
                  sub        t1, s9, s5
                  ori        s10, a2, 96
                  add        t6, t3, s8
                  sub        s8, a6, s0
                  sltu       s8, a4, a4
                  slti       s10, s3, -811
                  add        t3, s4, s5
                  sll        s5, s2, s4
                  sll        t4, gp, t3
                  add        s7, t5, s2
                  srai       s8, s8, 24
                  nop
                  sll        a4, s0, t0
                  auipc      a4, 294184
                  ori        a6, s5, -1022
                  srai       s10, t0, 30
                  and        t3, s3, s7
                  nop
                  sll        t2, s10, t4
                  sub        a3, s8, t3
                  auipc      a2, 874281
                  nop
                  slti       zero, s2, 292
                  slt        tp, t0, t4
                  and        s7, ra, t3
                  xor        a3, s1, s10
                  slti       t0, t3, -840
                  sub        t1, a7, s2
                  xori       s6, t1, 753
                  xor        sp, s10, t3
                  auipc      s0, 875943
                  and        sp, t1, t4
                  srl        gp, a3, t6
                  or         a0, a0, a7
                  slti       t0, s1, -308
                  slti       s7, zero, 291
                  ori        tp, t6, -139
                  slt        ra, t6, a4
                  sra        t3, s10, ra
                  sltiu      s5, t1, 717
                  addi       s3, s1, 121
                  lui        a7, 127720
                  and        s3, a6, a4
                  xor        t4, s0, s7
                  srai       a1, s7, 17
                  sll        s1, tp, a4
                  ori        t1, s1, 380
                  slt        gp, s7, a4
                  nop
                  sub        s9, t5, s2
                  slti       t5, s0, -402
                  srai       s1, a4, 23
                  and        t0, a7, t1
                  sltiu      s3, s6, -88
                  sltu       s8, a6, a2
                  lui        sp, 1046234
                  auipc      t3, 777910
                  srl        t2, t0, s0
                  sub        s7, s11, s4
                  sltiu      s11, a1, 629
                  andi       t5, tp, 806
                  srl        t1, a3, s4
                  srai       zero, t5, 7
                  slt        s1, t0, t1
                  srli       a6, s11, 30
                  slli       a6, s8, 19
                  lui        t5, 541906
                  slti       t5, s2, 369
                  xor        s5, ra, t1
                  slli       s11, gp, 6
                  la x15, test_done
                  jalr x0, x15, 0
test_done:        
                  li gp, 0x1
                  j write_tohost

write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

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
                  csrr x8, 0x300 # MSTATUS
                  csrr x8, 0x342 # MCAUSE
                  srli x8, x8, 31
                  bne x8, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x8, 0x341 # MEPC
                  csrr x8, 0x342 # MCAUSE
                  li x17, 0x3 # BREAKPOINT
                  beq x8, x17, ebreak_handler
                  li x17, 0x8 # ECALL_UMODE
                  beq x8, x17, ecall_handler
                  li x17, 0x9 # ECALL_SMODE
                  beq x8, x17, ecall_handler
                  li x17, 0xb # ECALL_MMODE
                  beq x8, x17, ecall_handler
                  li x17, 0x1
                  beq x8, x17, instr_fault_handler
                  li x17, 0x5
                  beq x8, x17, load_fault_handler
                  li x17, 0x7
                  beq x8, x17, store_fault_handler
                  li x17, 0xc
                  beq x8, x17, pt_fault_handler
                  li x17, 0xd
                  beq x8, x17, pt_fault_handler
                  li x17, 0xf
                  beq x8, x17, pt_fault_handler
                  li x17, 0x2 # ILLEGAL_INSTRUCTION
                  beq x8, x17, illegal_instr_handler
                  csrr x17, 0x343 # MTVAL
                  1: la x15, test_done
                  jalr x1, x15, 0

ecall_handler:    
                  la x8, _start
                  sw x0, 0(x8)
                  sw x1, 4(x8)
                  sw x2, 8(x8)
                  sw x3, 12(x8)
                  sw x4, 16(x8)
                  sw x5, 20(x8)
                  sw x6, 24(x8)
                  sw x7, 28(x8)
                  sw x8, 32(x8)
                  sw x9, 36(x8)
                  sw x10, 40(x8)
                  sw x11, 44(x8)
                  sw x12, 48(x8)
                  sw x13, 52(x8)
                  sw x14, 56(x8)
                  sw x15, 60(x8)
                  sw x16, 64(x8)
                  sw x17, 68(x8)
                  sw x18, 72(x8)
                  sw x19, 76(x8)
                  sw x20, 80(x8)
                  sw x21, 84(x8)
                  sw x22, 88(x8)
                  sw x23, 92(x8)
                  sw x24, 96(x8)
                  sw x25, 100(x8)
                  sw x26, 104(x8)
                  sw x27, 108(x8)
                  sw x28, 112(x8)
                  sw x29, 116(x8)
                  sw x30, 120(x8)
                  sw x31, 124(x8)
                  la x15, write_tohost
                  jalr x0, x15, 0

instr_fault_handler:
                  li x8, 0
                  csrw 0x340, x8
                  li x25, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x17, 0x3b0
                  csrr x11, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x21, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x21, x11, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x21, x21, x15
                  slli x15, x21, 27
                  srli x15, x15, 30
                  beqz x15, 20f
                  li x8, 1
                  beq x15, x8, 21f
                  li x8, 2
                  beq x15, x8, 25f
                  li x8, 3
                  beq x15, x8, 27f
                  la x8, test_done
                  jalr x0, x8, 0
                  18: csrr x8, 0x340
                  mv x25, x17
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x17, 1
                  ble x17, x8, 19f
                  j 0b
                  19: la x8, test_done
                  jalr x0, x8, 0
                  20: j 18b
                  21: csrr x8, 0x340
                  csrr x15, 0x343
                  srli x15, x15, 2
                  bnez x8, 22f
                  bltz x15, 18b
                  j 23f
                  22: bgtu x25, x15, 18b
                  23: bleu x17, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x17, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x17, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x21, x21, 4
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x21, x21, x15
                  or x11, x11, x21
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x11
                  j 34f
                  31: csrw 0x3a1, x11
                  j 34f
                  32: csrw 0x3a2, x11
                  j 34f
                  33: csrw 0x3a3, x11
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
                  li x8, 0
                  csrw 0x340, x8
                  li x25, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x17, 0x3b0
                  csrr x11, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x21, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x21, x11, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x21, x21, x15
                  slli x15, x21, 27
                  srli x15, x15, 30
                  beqz x15, 20f
                  li x8, 1
                  beq x15, x8, 21f
                  li x8, 2
                  beq x15, x8, 25f
                  li x8, 3
                  beq x15, x8, 27f
                  la x8, test_done
                  jalr x0, x8, 0
                  18: csrr x8, 0x340
                  mv x25, x17
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x17, 1
                  ble x17, x8, 19f
                  j 0b
                  19: la x8, test_done
                  jalr x0, x8, 0
                  20: j 18b
                  21: csrr x8, 0x340
                  csrr x15, 0x343
                  srli x15, x15, 2
                  bnez x8, 22f
                  bltz x15, 18b
                  j 23f
                  22: bgtu x25, x15, 18b
                  23: bleu x17, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x17, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x17, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x21, x21, 1
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x21, x21, x15
                  or x11, x11, x21
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x11
                  j 34f
                  31: csrw 0x3a1, x11
                  j 34f
                  32: csrw 0x3a2, x11
                  j 34f
                  33: csrw 0x3a3, x11
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
                  li x8, 0
                  csrw 0x340, x8
                  li x25, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x17, 0x3b0
                  csrr x11, 0x3a0
                  j 17f
                  17: li x21, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x21, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x21, x11, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x21, x21, x15
                  slli x15, x21, 27
                  srli x15, x15, 30
                  beqz x15, 20f
                  li x8, 1
                  beq x15, x8, 21f
                  li x8, 2
                  beq x15, x8, 25f
                  li x8, 3
                  beq x15, x8, 27f
                  la x8, test_done
                  jalr x0, x8, 0
                  18: csrr x8, 0x340
                  mv x25, x17
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x17, 1
                  ble x17, x8, 19f
                  j 0b
                  19: la x8, test_done
                  jalr x0, x8, 0
                  20: j 18b
                  21: csrr x8, 0x340
                  csrr x15, 0x343
                  srli x15, x15, 2
                  bnez x8, 22f
                  bltz x15, 18b
                  j 23f
                  22: bgtu x25, x15, 18b
                  23: bleu x17, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x17, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x17, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x21, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x21, x21, 3
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x21, x21, x15
                  or x11, x11, x21
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x11
                  j 34f
                  31: csrw 0x3a1, x11
                  j 34f
                  32: csrw 0x3a2, x11
                  j 34f
                  33: csrw 0x3a3, x11
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
                  csrr  x8, 0x341
                  addi  x8, x8, 4
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
                  csrr  x8, 0x341
                  addi  x8, x8, 4
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
                  csrr  x8, 0x300 # MSTATUS;
                  csrr  x8, 0x304 # MIE;
                  csrr  x8, 0x344 # MIP;
                  csrrc x8, 0x344, x8 # MIP;
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
