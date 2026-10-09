.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x14, h0_start
jalr x0, x14, 0
h0_start:
                  li x17, 0x40000100
                  csrw 0x301, x17
                  csrr x31, 0x301
kernel_sp:        
                  la x16, kernel_stack_end

trap_vec_init:    
                  la x17, mtvec_handler
                  ori x17, x17, 0

mepc_setup:       
                  la x17, init

custom_csr_setup: 
                  nop

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0xf8ece463
                  li x2, 0x49e27905
                  li x3, 0x164f466e
                  li x4, 0x95755db1
                  li x5, 0xf19efff2
                  li x6, 0x80000000
                  li x7, 0xda311749
                  li x8, 0x80000000
                  li x9, 0x3685dca8
                  li x10, 0x80000000
                  li x11, 0xfd7e2c55
                  li x12, 0x80000000
                  li x13, 0xfbd82a15
                  li x14, 0x80000000
                  li x15, 0xd10f7379
                  li x17, 0xe4d9ade7
                  li x18, 0x80000000
                  li x19, 0x80000000
                  li x20, 0xf83e03ea
                  li x21, 0x69efdce8
                  li x22, 0xf4fbacfa
                  li x23, 0xf2dbc2e
                  li x24, 0x80000000
                  li x25, 0x80000000
                  li x26, 0xb5b05ac3
                  li x27, 0xd4839cc3
                  li x29, 0x984ee99d
                  li x30, 0xfb9aff8f
                  li x31, 0xf6882765
                  la x28, user_stack_end
main:             xori       s0, s3, -614
                  add        s3, s11, t0
                  sll        s11, s3, a7
                  sub        s1, s11, a5
                  slt        s0, t0, s1
                  sra        s10, a5, tp
                  or         s4, a4, gp
                  slti       t2, t2, -753
                  lui        s11, 702432
                  xor        t2, a7, t2
                  lui        ra, 1031818
                  xori       tp, s8, 690
                  slt        s0, a4, s8
                  auipc      s0, 94649
                  andi       a1, s4, 431
                  xori       s1, a2, -602
                  slt        s0, a5, s7
                  sltu       ra, s1, zero
                  sra        s8, s2, a1
                  sltu       a2, tp, gp
                  slli       t5, t0, 12
                  sltiu      a0, a4, -899
                  lui        t0, 726616
                  srl        s7, tp, s8
                  xori       gp, s3, -135
                  srl        a2, s9, gp
                  auipc      t4, 690296
                  and        s6, t5, t5
                  andi       t2, s5, 933
                  andi       s8, a7, 406
                  srai       a7, s0, 2
                  sra        a3, a1, s2
                  or         ra, s0, a4
                  xor        a7, s9, t3
                  slt        a3, s3, s0
                  xor        s9, s0, gp
                  andi       s7, t3, -913
                  nop
                  srli       t1, sp, 19
                  nop
                  nop
                  slli       t1, s5, 31
                  xor        tp, t1, a6
                  sll        gp, s10, s5
                  sltiu      s2, s1, 55
                  sltu       s2, gp, s3
                  slti       a3, s3, -353
                  sltu       t4, s5, s3
                  xor        s10, a7, s5
                  andi       s11, tp, 428
                  xor        s6, s11, s8
                  or         s1, a3, s5
                  sub        s0, t6, t3
                  auipc      s11, 873987
                  lui        s5, 9415
                  nop
                  sub        s7, a6, s5
                  ori        ra, s8, 253
                  slti       s9, s6, 430
                  srl        gp, s10, a1
                  srl        t4, t4, t5
                  or         s9, a3, a2
                  or         zero, t6, t0
                  sltu       a0, s10, s9
                  slt        a7, t4, ra
                  xori       s11, a6, -734
                  srai       t5, s5, 22
                  srli       a5, s9, 22
                  sra        zero, tp, a1
                  xori       gp, a1, -368
                  srai       t1, a5, 0
                  addi       zero, t4, 316
                  or         tp, s6, s5
                  or         gp, t3, a5
                  auipc      t2, 163239
                  sub        t6, s2, zero
                  sltu       t6, a5, t0
                  add        s5, a2, gp
                  auipc      a1, 752013
                  xori       a1, s9, 36
                  sra        s3, zero, s8
                  or         a3, ra, s4
                  nop
                  sltiu      s6, s8, -543
                  auipc      s7, 348462
                  sltu       s6, t3, a6
                  slti       t5, s9, -407
                  srai       s6, a4, 3
                  and        sp, a5, s3
                  add        s8, t3, ra
                  and        t0, t3, s6
                  and        tp, t3, t6
                  auipc      s1, 634520
                  andi       s4, s11, 574
                  sub        s7, zero, tp
                  and        s1, a0, s4
                  srl        t2, a4, a7
                  xor        zero, s0, s3
                  slti       s11, s6, 553
                  slti       s3, s3, 807
                  add        s5, gp, sp
                  slti       s5, a5, -626
                  sll        s10, t1, s1
                  add        ra, a4, s8
                  srl        s0, t2, t3
                  sra        a3, a3, tp
                  andi       a3, t2, 456
                  sltu       sp, s3, a0
                  sltiu      s5, s1, -599
                  srai       t6, zero, 29
                  auipc      s11, 676722
                  and        s9, s6, a6
                  sub        t5, s0, a5
                  slti       t4, s5, 286
                  slti       t2, sp, -532
                  or         a0, gp, a5
                  add        t0, sp, a2
                  xori       s5, t0, -373
                  sll        s5, a5, a2
                  and        t4, t5, s1
                  nop
                  sltu       t1, s5, a2
                  sub        a3, sp, s0
                  slti       t5, a6, 324
                  add        s5, a1, a7
                  srli       s9, s10, 10
                  xori       s0, zero, -240
                  srli       s1, s11, 13
                  add        s7, s4, ra
                  sra        s8, t4, s6
                  xori       s0, a5, -336
                  addi       a2, a0, 979
                  srl        s5, zero, a3
                  srai       s7, t2, 3
                  nop
                  and        a2, t5, s9
                  or         a0, s8, ra
                  slti       s11, gp, 920
                  sll        t2, s9, s11
                  srl        s10, t5, s5
                  xori       a0, t0, 283
                  xor        a2, s10, s8
                  slli       s7, s5, 9
                  sltu       s6, a6, t6
                  xor        t4, s0, a0
                  slti       t2, a6, 777
                  srli       t6, tp, 1
                  or         t6, t6, zero
                  srli       a1, sp, 15
                  addi       s9, s0, -593
                  sra        tp, t5, t1
                  slt        a0, t1, a4
                  srl        s0, s10, s5
                  slt        a5, s7, s4
                  xor        s1, t2, s11
                  srli       s1, s6, 2
                  andi       s3, a7, 498
                  srai       s4, gp, 0
                  nop
                  auipc      a0, 673957
                  and        t5, s0, s9
                  slt        s10, gp, t3
                  srli       a1, s11, 2
                  srli       a7, s7, 30
                  slt        sp, s0, s8
                  addi       t4, s9, 886
                  xori       gp, t3, 536
                  sub        s10, a2, t2
                  sltiu      s11, tp, 821
                  xor        a0, t3, t0
                  srli       s6, t0, 8
                  and        a2, s8, a4
                  nop
                  sra        s9, a6, s9
                  xori       t6, s8, -281
                  addi       t6, t5, -416
                  slli       sp, t4, 1
                  sll        s2, a4, a4
                  slti       t2, s5, 932
                  auipc      a1, 296315
                  srai       s8, s2, 4
                  xori       s6, a2, -144
                  sltu       gp, t4, t1
                  srl        gp, s0, a1
                  auipc      tp, 785390
                  sra        s11, s6, t3
                  ori        a5, s6, -155
                  nop
                  slti       t5, a3, 273
                  auipc      s8, 357611
                  sub        a1, s9, sp
                  auipc      a2, 143232
                  add        ra, s3, gp
                  srl        s7, a4, s11
                  srli       t1, s3, 24
                  sub        t2, a4, a4
                  slt        zero, t6, a7
                  srli       s9, a2, 4
                  sltiu      s7, s5, 572
                  sll        s1, ra, a5
                  sltiu      ra, t6, -286
                  xor        s2, t4, s4
                  sltu       tp, a5, a3
                  slti       t1, s6, 542
                  slti       t6, s9, 309
                  xor        zero, a0, t5
                  sll        t4, s5, s9
                  srai       s7, t0, 15
                  srli       s2, s1, 30
                  sltu       t5, s4, s5
                  sra        t1, t6, zero
                  srai       t4, t6, 27
                  sra        s4, s8, t5
                  srl        s5, gp, s8
                  srai       ra, gp, 14
                  srl        a3, s5, a4
                  slt        s4, a2, a3
                  xori       s3, t6, -973
                  sltu       a5, s2, a4
                  add        s9, s7, t3
                  srli       s8, s8, 26
                  slli       s6, a0, 31
                  xor        a5, s9, t0
                  slt        gp, s2, a6
                  slt        s3, a6, s3
                  andi       t4, a3, -888
                  addi       s2, s5, 904
                  lui        t1, 594877
                  sub        a2, t3, gp
                  sub        s8, a3, s5
                  srl        sp, s2, s3
                  nop
                  andi       s8, s8, -1014
                  xor        s4, s1, t0
                  sltiu      t1, sp, 602
                  srl        s0, ra, sp
                  sra        s0, s7, s8
                  srli       t0, sp, 31
                  andi       s11, ra, -767
                  and        a1, s3, t4
                  slli       s4, s1, 13
                  slt        s1, s4, t0
                  addi       s9, s5, -634
                  or         t5, s5, s5
                  xor        tp, t6, sp
                  addi       s1, a7, -239
                  sra        zero, t4, a7
                  lui        s6, 399666
                  sltiu      s7, s7, 642
                  lui        s1, 338581
                  slli       t5, s9, 2
                  addi       s9, t4, -312
                  ori        s5, s2, 196
                  xor        s7, s8, a2
                  nop
                  slli       gp, s11, 5
                  xori       tp, s9, -485
                  slli       a3, s1, 15
                  andi       s2, s1, -304
                  add        tp, tp, t4
                  xor        t1, tp, a7
                  sltiu      sp, a1, 621
                  addi       t4, t1, 649
                  sltiu      a5, a4, -482
                  and        sp, t5, tp
                  sltiu      t1, a2, -759
                  slt        t0, t2, s7
                  nop
                  slti       s8, tp, -880
                  slti       s6, ra, -738
                  sll        s4, zero, s0
                  and        s0, t1, s4
                  and        a3, a7, s9
                  slt        s6, a6, a4
                  xor        t5, t5, ra
                  srl        a1, a3, a4
                  sltu       ra, s4, t0
                  addi       s10, zero, -427
                  srai       s6, s11, 12
                  sltiu      s7, tp, 269
                  sltiu      s9, ra, -413
                  auipc      s5, 569379
                  lui        s7, 1018178
                  slli       t6, t5, 15
                  sra        s9, t4, tp
                  slti       s11, s1, -57
                  lui        t4, 111572
                  slti       sp, a2, -884
                  srl        a7, ra, a2
                  sra        a5, t2, t3
                  add        s8, s9, zero
                  nop
                  addi       a0, s0, 585
                  xori       a3, a4, -777
                  xori       sp, a7, -26
                  sltu       a1, s4, t2
                  andi       t4, s7, 80
                  lui        s6, 792447
                  addi       s10, s11, -999
                  sub        a5, a4, gp
                  ori        a7, s9, 531
                  sltu       t5, s11, gp
                  andi       a0, s8, 960
                  xor        s11, s10, gp
                  slti       a7, s1, 45
                  auipc      a7, 1018224
                  sub        t4, s10, s2
                  srli       s7, s6, 16
                  sub        sp, gp, a5
                  sra        t5, s1, a3
                  and        s8, a5, a2
                  andi       t2, t2, -850
                  xori       t6, ra, -156
                  ori        t2, s10, -645
                  lui        a5, 177957
                  sltu       s6, s2, s3
                  srli       s4, s7, 10
                  slti       a3, a3, -520
                  or         s6, t1, zero
                  andi       s2, t3, -743
                  slli       a0, zero, 10
                  lui        t6, 722193
                  srai       s6, t2, 11
                  srli       s2, s6, 31
                  sub        tp, a6, t3
                  andi       s11, s2, -237
                  add        s6, s8, t6
                  slli       s10, s8, 28
                  auipc      s6, 532932
                  sltu       s8, a5, a2
                  andi       s6, s10, 265
                  srli       s1, gp, 26
                  or         a7, a2, a3
                  slt        gp, s3, t3
                  slti       gp, a5, -716
                  sltiu      a1, s5, -254
                  slt        s1, t6, t1
                  slli       s0, t6, 23
                  sra        s10, t0, gp
                  add        t6, s0, ra
                  srl        ra, s9, t1
                  sra        t6, s7, a7
                  or         a2, zero, a3
                  addi       s3, t0, -380
                  sub        t6, s5, gp
                  addi       t1, s5, 747
                  srl        a2, t6, zero
                  or         s6, a7, s1
                  andi       a0, s5, -876
                  srl        s7, t6, a7
                  xor        s10, t2, s0
                  auipc      t6, 317108
                  sltu       a7, t6, s11
                  srli       s8, tp, 1
                  sub        a3, s6, t0
                  sra        s2, s5, a6
                  srai       s6, s6, 7
                  addi       s9, s4, -368
                  sub        a1, zero, s8
                  sll        t0, sp, s0
                  auipc      t1, 500344
                  or         a0, s4, s1
                  slti       tp, a1, 574
                  ori        tp, a7, -251
                  xor        t1, a6, s4
                  or         a3, s1, sp
                  sll        sp, s8, s7
                  srai       s11, a5, 17
                  srl        s7, ra, a1
                  slti       s4, s0, -879
                  ori        gp, s10, -108
                  srai       t5, a5, 22
                  sub        s1, a4, a5
                  slt        t1, s10, a0
                  andi       s9, s6, -979
                  slli       s1, s9, 8
                  srai       s7, a0, 21
                  slt        t4, t0, a3
                  srl        a5, t4, a3
                  sub        a1, tp, s2
                  sltu       t1, s1, a6
                  sltu       s10, s9, t3
                  sub        s7, a5, a7
                  slti       t0, a7, 315
                  auipc      s3, 280991
                  slt        s1, tp, t0
                  slti       s6, sp, -1017
                  or         ra, a3, s8
                  or         tp, a6, t1
                  and        s6, s8, a3
                  slli       t2, a2, 25
                  add        tp, t4, a2
                  sra        zero, a6, t2
                  and        sp, a6, a2
                  ori        gp, a3, 829
                  sltu       tp, a1, t4
                  slti       t5, t6, 797
                  sub        gp, tp, t4
                  auipc      ra, 149994
                  sra        s10, a3, t3
                  slli       a7, s8, 24
                  slli       a0, a2, 15
                  sltiu      s7, a5, -416
                  addi       a7, t2, 220
                  ori        t4, s2, -773
                  sub        t6, tp, ra
                  sub        zero, a1, s0
                  lui        ra, 881655
                  ori        s11, s11, -930
                  slt        s7, a0, t6
                  sltiu      a1, a3, -350
                  auipc      s6, 1008734
                  addi       s2, a6, 694
                  auipc      zero, 851287
                  add        a0, t3, s9
                  sltu       s4, ra, s2
                  auipc      s10, 212802
                  xor        s2, s8, tp
                  slt        gp, s7, s3
                  xor        a3, s1, s9
                  sub        t0, s3, t3
                  sltu       a0, t2, s8
                  nop
                  xor        s0, tp, a4
                  auipc      a0, 22936
                  sltu       s11, gp, s5
                  addi       t5, s0, 205
                  xori       t2, s2, 694
                  and        a2, a5, s3
                  sra        t1, t4, a2
                  sltu       s7, a6, a3
                  addi       s2, a6, -998
                  sltu       a1, t0, a6
                  and        s5, s3, a1
                  nop
                  sll        s5, a5, gp
                  slti       s10, gp, 642
                  xori       gp, s8, 642
                  or         s5, t5, zero
                  nop
                  slt        s4, s10, s11
                  andi       t4, t5, -533
                  sub        a3, a2, t1
                  or         t4, s2, s10
                  addi       s8, t4, -756
                  slt        a5, zero, s4
                  xori       s10, t2, 370
                  slti       s5, a2, -212
                  or         t4, s0, s6
                  nop
                  add        s7, gp, s3
                  or         a2, gp, a1
                  ori        t1, a7, 419
                  sub        s0, s11, ra
                  add        s7, a1, s11
                  srai       s10, s10, 0
                  srl        a0, s3, t5
                  srai       a0, s2, 29
                  ori        a0, t5, -112
                  sub        s10, sp, s2
                  sll        s3, a4, a6
                  nop
                  sltiu      s4, s4, 958
                  auipc      s3, 302658
                  sltu       a0, s10, s5
                  slti       a5, zero, -104
                  slt        a7, s11, a7
                  andi       sp, gp, 538
                  lui        t2, 955777
                  slti       s2, t2, 156
                  xori       a2, a1, 712
                  sub        t0, t6, a3
                  xori       ra, a0, 568
                  slli       s4, s8, 2
                  slt        a3, s6, s3
                  srl        a7, t3, gp
                  slti       s10, a7, 855
                  addi       s0, s0, -320
                  sltiu      t5, t6, -432
                  lui        t0, 424603
                  nop
                  sltiu      t4, gp, 952
                  srli       s5, t3, 2
                  sll        a1, sp, t6
                  addi       a7, a4, 193
                  sub        t4, s1, s6
                  lui        a3, 184185
                  sltiu      a0, s2, 199
                  xori       s6, s0, -931
                  addi       t2, s6, 878
                  xori       t6, t6, -287
                  auipc      t4, 556875
                  slli       s1, s7, 0
                  srl        s11, a3, s11
                  andi       s8, s1, 792
                  srli       s0, tp, 23
                  srl        t0, a2, a5
                  slt        sp, t4, s10
                  and        gp, s8, s11
                  and        a2, a3, s4
                  andi       t5, a2, -668
                  andi       s10, a2, 638
                  lui        s1, 28476
                  nop
                  and        s5, t5, zero
                  lui        s9, 135099
                  sll        s8, t1, s9
                  ori        t1, s0, 287
                  srai       a3, a7, 18
                  lui        t1, 803035
                  sll        s9, a4, a1
                  sltiu      s2, a7, 567
                  sltiu      s4, s3, -255
                  sltu       a3, t4, gp
                  lui        sp, 383877
                  auipc      s11, 955815
                  slti       s7, s6, -823
                  srai       a7, zero, 26
                  nop
                  srai       s7, ra, 11
                  xor        a0, t3, s11
                  srai       s11, a0, 12
                  slli       s6, t6, 5
                  add        s3, tp, a7
                  auipc      a0, 997265
                  addi       s0, s8, 157
                  ori        s4, t4, 161
                  sltiu      s11, s1, -828
                  slt        sp, a6, ra
                  sltu       zero, s8, t5
                  sub        s9, s1, s8
                  sltiu      a7, a1, 881
                  slti       s1, s7, -125
                  sll        t4, s5, a0
                  slt        s8, t1, s9
                  sltiu      a1, s5, -258
                  lui        ra, 792914
                  xor        a7, t3, s5
                  and        tp, a1, s11
                  srli       t5, s11, 9
                  slli       t6, a7, 4
                  xor        s9, a0, t0
                  srai       t6, t6, 0
                  xor        s0, s5, t5
                  srl        t4, s9, t1
                  auipc      s3, 163424
                  srl        s1, a2, s6
                  addi       a5, ra, 96
                  sltu       s3, s2, a6
                  sub        s3, s7, zero
                  srli       gp, a1, 4
                  srai       s9, a5, 26
                  sll        a1, t6, gp
                  andi       a2, a1, -250
                  nop
                  sltiu      s10, s7, 46
                  lui        ra, 1024623
                  or         s1, t3, s1
                  add        t2, t4, s6
                  and        t6, s11, t2
                  xor        s7, t0, s3
                  sub        s3, s10, s10
                  and        zero, s6, a3
                  ori        a5, s9, 900
                  ori        s5, s2, 144
                  auipc      zero, 17212
                  auipc      tp, 881188
                  sub        ra, s3, t1
                  sra        s2, t6, s6
                  sra        zero, s2, a0
                  sub        t1, s8, a6
                  andi       a2, a3, -979
                  sltu       a1, s6, sp
                  sub        s1, s7, a0
                  sra        t1, t1, a7
                  sltiu      s2, t3, -900
                  xori       t1, t1, 70
                  and        s2, a4, t6
                  andi       s7, s4, 807
                  srai       gp, ra, 26
                  ori        s4, t6, -984
                  addi       t2, t2, -814
                  nop
                  srli       a1, s5, 24
                  slli       a2, ra, 6
                  sltiu      t5, s0, 845
                  sltu       s4, t4, a1
                  srli       tp, t1, 5
                  slli       s11, s6, 12
                  slli       s9, s3, 6
                  sub        s8, s7, a5
                  slli       s1, ra, 11
                  auipc      s10, 1018935
                  slli       s8, a3, 29
                  srl        tp, gp, s6
                  add        sp, t1, a4
                  ori        a2, a7, 33
                  lui        a7, 268630
                  sub        a1, t3, a6
                  sra        t6, t1, t0
                  andi       ra, s1, 69
                  ori        s1, t1, 528
                  slti       s11, t3, 125
                  ori        a2, a2, -672
                  add        s5, s2, a3
                  ori        a7, s0, -971
                  sra        s2, s5, a7
                  sll        ra, zero, a5
                  nop
                  add        gp, s6, s0
                  ori        ra, t3, 726
                  sltiu      t4, s8, 328
                  auipc      gp, 1027936
                  slt        a1, a1, a4
                  nop
                  xori       s8, t3, 327
                  sub        t0, t2, s7
                  slti       gp, s9, -959
                  srli       a3, a6, 17
                  ori        s10, t3, -708
                  lui        t2, 755176
                  srai       a3, t1, 2
                  add        t6, s3, s0
                  slli       tp, s4, 17
                  auipc      a2, 577554
                  andi       s4, a0, -468
                  or         tp, a6, t0
                  ori        s11, a7, 7
                  xor        s11, s6, tp
                  sub        t2, a1, t0
                  or         a5, t6, t2
                  sub        s1, s9, s2
                  srl        gp, s7, t3
                  srli       t4, s0, 28
                  ori        ra, s4, 62
                  nop
                  sra        a5, s9, tp
                  or         t6, t4, ra
                  slli       s1, tp, 12
                  sub        s1, t5, s8
                  nop
                  slli       ra, a1, 25
                  srli       gp, s3, 9
                  sltiu      t4, s7, -763
                  or         s1, s10, t3
                  sltiu      a0, t5, -373
                  ori        t4, zero, 577
                  slt        sp, t4, a0
                  slt        t5, s0, t4
                  srai       tp, a0, 19
                  sll        s3, gp, t3
                  sub        t0, tp, t6
                  slti       s3, zero, 902
                  srl        t5, zero, tp
                  srai       s11, s4, 1
                  andi       t4, a7, -182
                  slli       s7, t6, 18
                  sra        s9, t2, tp
                  sub        s5, t4, s2
                  sra        a1, s11, tp
                  and        s9, ra, zero
                  xor        a2, a2, s1
                  sltu       s6, t4, a1
                  and        a5, s7, s3
                  nop
                  andi       s1, sp, 907
                  addi       s2, a5, -473
                  auipc      ra, 140402
                  or         t1, a1, zero
                  sltu       s9, s9, t5
                  slli       s5, s10, 2
                  sltiu      t4, s2, -710
                  xori       s7, t2, 643
                  auipc      t6, 889798
                  add        s6, s0, s2
                  slti       t1, s5, -882
                  sltu       a0, zero, a6
                  srl        t5, s6, s2
                  nop
                  srli       s11, t2, 29
                  sub        s4, a0, s7
                  slti       t1, s2, 216
                  addi       t5, s0, 553
                  xor        s3, s11, t6
                  andi       s4, a4, 992
                  srl        s6, a4, t3
                  sltu       s9, gp, s0
                  xor        t6, a7, s7
                  sltu       a2, a7, t1
                  or         sp, a7, gp
                  sltu       tp, s4, zero
                  srli       zero, s6, 18
                  slt        s1, s7, s1
                  add        s5, a7, a1
                  and        a3, s4, s4
                  slt        s7, s5, s5
                  or         a3, t3, s4
                  xor        gp, s10, sp
                  or         s4, a1, s7
                  sll        s2, a1, a3
                  addi       zero, sp, -736
                  ori        s7, zero, 741
                  slli       a1, s5, 23
                  slt        tp, t4, a1
                  andi       a2, a4, -811
                  xori       t5, s1, 528
                  sra        s2, t0, s5
                  sll        t5, t4, a7
                  sub        tp, t2, s6
                  sll        s0, gp, s3
                  xori       t2, a3, 798
                  slt        t1, t0, s2
                  srli       s3, s1, 21
                  sub        a3, s2, tp
                  slti       a0, a2, 929
                  ori        s3, s5, -922
                  and        s4, t1, s8
                  slti       t5, s7, 118
                  xor        a0, s6, gp
                  and        s7, a3, a1
                  srli       s6, t4, 19
                  auipc      t5, 113696
                  slt        t4, a1, s8
                  auipc      a3, 174365
                  add        s4, t6, s0
                  slti       s1, a2, -176
                  xori       t0, a2, 155
                  slli       s0, ra, 18
                  lui        s10, 40693
                  sll        s8, t2, t4
                  auipc      s11, 360016
                  srai       a2, a4, 13
                  xor        gp, t6, s3
                  ori        s4, s7, 558
                  xori       s5, ra, 139
                  slli       t4, s6, 29
                  sltiu      a7, t0, 686
                  and        ra, t1, a5
                  sltiu      s1, a0, 919
                  andi       t5, s4, 334
                  slli       t4, s7, 11
                  slt        s5, zero, t0
                  srli       s4, ra, 14
                  xori       s6, s6, -156
                  sll        t6, s1, zero
                  xor        s7, a1, s10
                  slti       a0, t4, -934
                  slli       t5, a1, 20
                  slti       s8, a0, -792
                  or         s5, s10, s10
                  slt        zero, t3, a4
                  addi       s5, a4, -796
                  srli       a0, t2, 10
                  ori        t2, t6, -878
                  and        ra, t4, gp
                  slt        s11, t0, t6
                  xori       s5, a4, 76
                  add        t5, a1, s0
                  xor        t2, s9, gp
                  slti       s7, s9, -334
                  and        s4, s4, t2
                  slli       t5, s0, 2
                  nop
                  xor        ra, a4, t4
                  xor        t6, s9, a5
                  srli       a5, gp, 29
                  slli       a5, sp, 23
                  nop
                  and        s6, gp, s11
                  and        ra, a2, zero
                  sra        a7, s4, t4
                  sll        s10, s11, ra
                  addi       s5, sp, -366
                  srl        s1, s0, t0
                  addi       s6, t6, -127
                  sub        ra, t3, t6
                  add        t0, t4, a5
                  ori        s0, s4, 927
                  xor        s0, a7, s11
                  xori       t0, s9, 394
                  sltiu      s9, s0, 689
                  srai       s7, s1, 17
                  sub        s9, t6, s2
                  srl        a0, s0, s0
                  sltiu      sp, a2, -721
                  auipc      a0, 427116
                  sra        s11, s5, gp
                  auipc      s10, 107751
                  nop
                  andi       a0, s10, -206
                  sltu       s0, s8, sp
                  auipc      s1, 275527
                  or         s7, a1, s5
                  addi       s3, t4, 65
                  slt        a2, s1, s11
                  addi       s8, s6, 550
                  sra        s10, a2, t3
                  sub        s2, a7, a3
                  lui        a0, 564883
                  xori       zero, t4, -364
                  lui        s9, 668784
                  auipc      a3, 828237
                  ori        t4, gp, 405
                  srl        t4, s1, zero
                  and        a2, t0, t4
                  slti       s10, a3, -648
                  slli       a7, ra, 17
                  lui        s10, 774933
                  lui        t0, 704143
                  slti       tp, s4, 884
                  srai       s0, s8, 30
                  add        s2, a3, a5
                  srl        s8, sp, a7
                  sra        s6, s9, a6
                  or         tp, zero, t4
                  srli       s6, s3, 9
                  add        s5, t5, s11
                  nop
                  srl        s4, t1, zero
                  or         a5, a5, s3
                  xori       a2, t4, -119
                  nop
                  addi       s10, tp, 513
                  sll        t0, s11, s2
                  or         s6, s9, s10
                  nop
                  srl        a5, t1, tp
                  sltu       t2, s2, t1
                  sra        tp, s9, gp
                  srai       a3, a1, 22
                  andi       s3, ra, -152
                  srli       t0, s9, 25
                  srai       s8, s11, 3
                  sltu       a5, s1, s2
                  sltiu      zero, t2, 231
                  nop
                  addi       s9, t3, 965
                  add        t0, a4, sp
                  sltiu      tp, ra, -407
                  auipc      s10, 906359
                  slt        t0, gp, a4
                  sub        s5, s9, a3
                  slt        s2, a3, t1
                  slt        s7, t4, t4
                  slli       zero, t3, 12
                  sll        gp, t1, a7
                  nop
                  xori       t6, a3, 491
                  nop
                  xor        s1, gp, a1
                  and        a7, s7, s6
                  nop
                  sub        s6, a4, t2
                  and        s6, gp, a6
                  slt        s3, t6, a3
                  auipc      gp, 388654
                  auipc      s8, 724603
                  slti       gp, a5, 563
                  srli       t5, sp, 13
                  sra        a3, t2, a3
                  addi       gp, gp, -832
                  sub        s11, s9, t3
                  sltiu      s11, s8, -219
                  sltu       s9, s3, t4
                  add        t1, a2, s4
                  sub        t0, t4, s2
                  sll        a2, s0, s5
                  andi       t0, tp, 463
                  ori        a3, sp, -618
                  add        s1, s9, a1
                  and        ra, t3, a4
                  sll        s1, a0, a0
                  srli       s3, s2, 25
                  xori       s8, t0, 105
                  xor        tp, t5, t3
                  addi       t1, a3, 937
                  srl        a1, a0, s1
                  addi       t0, s11, -589
                  ori        t4, a6, -833
                  slli       s4, a7, 28
                  ori        a7, a3, -250
                  and        a1, zero, gp
                  lui        s3, 683879
                  slti       s1, t4, 510
                  andi       s2, s7, 1006
                  slt        s4, t6, zero
                  lui        a0, 806313
                  srai       a2, ra, 5
                  slli       tp, s2, 5
                  sltu       t2, s11, s5
                  slti       t2, a1, 508
                  auipc      t5, 963505
                  sll        s2, t3, s11
                  slli       a5, zero, 23
                  sra        a7, t0, t5
                  and        s2, zero, t5
                  srl        s7, s4, t2
                  sltiu      sp, zero, -365
                  slli       a5, t4, 2
                  sltu       t1, a2, t5
                  sra        ra, gp, tp
                  sll        s8, sp, t0
                  srli       a5, t0, 28
                  or         tp, s7, a2
                  slt        a1, t5, s10
                  lui        t0, 922077
                  sub        t2, s5, a6
                  andi       t0, s4, -980
                  addi       s1, sp, -522
                  slli       tp, s1, 5
                  srli       s0, s11, 18
                  sltu       s0, t2, a2
                  sub        a5, a6, sp
                  slti       t0, s1, -495
                  srl        t6, t1, t2
                  sltiu      s9, t2, -935
                  auipc      s0, 201036
                  or         s6, s9, s8
                  addi       gp, a3, -294
                  srli       t0, s1, 22
                  addi       a3, a1, 538
                  slt        tp, s4, zero
                  slt        s5, a6, a1
                  srli       a2, s3, 20
                  nop
                  sltiu      t5, t6, 852
                  addi       s8, s3, -520
                  srli       sp, a1, 21
                  sltu       s8, s11, s9
                  srli       a0, s6, 19
                  ori        t6, t4, -21
                  sra        zero, s2, a2
                  slli       t0, s7, 2
                  ori        sp, tp, 68
                  andi       s1, s1, 922
                  sub        s9, s4, a2
                  sltiu      t6, zero, -804
                  xor        s11, s11, t1
                  sltu       s10, t1, gp
                  xor        t5, s1, a5
                  slt        ra, s3, s2
                  sltu       s7, t5, zero
                  slti       s5, s2, -738
                  xor        t1, s8, zero
                  xori       s7, a5, 624
                  slli       a2, gp, 4
                  add        ra, t6, zero
                  srli       t6, a7, 23
                  add        s10, s1, s4
                  sltu       ra, s8, a2
                  sra        gp, s3, s2
                  auipc      s0, 52199
                  addi       s7, s4, -345
                  add        s7, ra, a3
                  slli       s11, t0, 21
                  slt        t5, s0, s2
                  slti       s7, s2, -551
                  sra        gp, s4, a1
                  auipc      t6, 917835
                  slti       zero, s5, 47
                  or         t1, t6, ra
                  srai       a0, a0, 2
                  srli       s6, t5, 6
                  sub        gp, a6, a5
                  nop
                  srl        t2, a1, a4
                  lui        a7, 201813
                  sltu       sp, a4, s11
                  slti       t1, t3, -76
                  srl        s8, a5, ra
                  sll        a1, s10, a5
                  sra        a3, ra, s11
                  and        s7, t3, tp
                  sra        s6, gp, a0
                  srli       t2, t1, 13
                  addi       t4, s3, 677
                  xor        gp, ra, gp
                  or         a7, a6, t2
                  sll        s10, s5, s4
                  ori        s1, t6, -233
                  addi       s7, s7, 925
                  add        a2, a0, ra
                  slti       s9, s5, -298
                  and        a5, gp, sp
                  and        s9, t6, s8
                  addi       zero, a3, -410
                  add        t2, t5, s4
                  sll        s6, t2, a0
                  sll        s7, s9, t1
                  srai       s10, a3, 6
                  or         t0, a5, sp
                  addi       ra, s9, 224
                  sltiu      sp, t6, 318
                  or         a0, s0, t3
                  and        s0, s4, s10
                  srai       s1, s3, 15
                  add        a0, s1, a1
                  or         s8, t6, a3
                  xori       t1, s10, 817
                  and        t2, s1, t1
                  la x14, test_done
                  jalr x0, x14, 0
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
                  1: addi x28, x28, -124
                  sw  x1, 4(x28)
                  sw  x2, 8(x28)
                  sw  x3, 12(x28)
                  sw  x4, 16(x28)
                  sw  x5, 20(x28)
                  sw  x6, 24(x28)
                  sw  x7, 28(x28)
                  sw  x8, 32(x28)
                  sw  x9, 36(x28)
                  sw  x10, 40(x28)
                  sw  x11, 44(x28)
                  sw  x12, 48(x28)
                  sw  x13, 52(x28)
                  sw  x14, 56(x28)
                  sw  x15, 60(x28)
                  sw  x16, 64(x28)
                  sw  x17, 68(x28)
                  sw  x18, 72(x28)
                  sw  x19, 76(x28)
                  sw  x20, 80(x28)
                  sw  x21, 84(x28)
                  sw  x22, 88(x28)
                  sw  x23, 92(x28)
                  sw  x24, 96(x28)
                  sw  x25, 100(x28)
                  sw  x26, 104(x28)
                  sw  x27, 108(x28)
                  sw  x28, 112(x28)
                  sw  x29, 116(x28)
                  sw  x30, 120(x28)
                  sw  x31, 124(x28)
                  csrr x17, 0x300 # MSTATUS
                  csrr x17, 0x342 # MCAUSE
                  srli x17, x17, 31
                  bne x17, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x17, 0x341 # MEPC
                  csrr x17, 0x342 # MCAUSE
                  li x27, 0x3 # BREAKPOINT
                  beq x17, x27, ebreak_handler
                  li x27, 0x8 # ECALL_UMODE
                  beq x17, x27, ecall_handler
                  li x27, 0x9 # ECALL_SMODE
                  beq x17, x27, ecall_handler
                  li x27, 0xb # ECALL_MMODE
                  beq x17, x27, ecall_handler
                  li x27, 0x1
                  beq x17, x27, instr_fault_handler
                  li x27, 0x5
                  beq x17, x27, load_fault_handler
                  li x27, 0x7
                  beq x17, x27, store_fault_handler
                  li x27, 0xc
                  beq x17, x27, pt_fault_handler
                  li x27, 0xd
                  beq x17, x27, pt_fault_handler
                  li x27, 0xf
                  beq x17, x27, pt_fault_handler
                  li x27, 0x2 # ILLEGAL_INSTRUCTION
                  beq x17, x27, illegal_instr_handler
                  csrr x27, 0x343 # MTVAL
                  1: la x14, test_done
                  jalr x1, x14, 0

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
                  la x14, write_tohost
                  jalr x0, x14, 0

instr_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x29, 0
                  0: csrr x17, 0x340
                  mv x14, x17
                  li x14, 0
                  beq x17, x14, 1f
                  1: csrr x27, 0x3b0
                  csrr x15, 0x3a0
                  j 17f
                  17: li x5, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x14, x5, x17
                  addi x14, x14, -1
                  slli x14, x14, 3
                  sll x5, x15, x14
                  slli x17, x17, 3
                  add x14, x14, x17
                  srl x5, x5, x14
                  slli x14, x5, 27
                  srli x14, x14, 30
                  beqz x14, 20f
                  li x17, 1
                  beq x14, x17, 21f
                  li x17, 2
                  beq x14, x17, 25f
                  li x17, 3
                  beq x14, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x29, x27
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x27, 1
                  ble x27, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x14, 0x343
                  srli x14, x14, 2
                  bnez x17, 22f
                  bltz x14, 18b
                  j 23f
                  22: bgtu x29, x14, 18b
                  23: bleu x27, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x14, x27, 2
                  srli x14, x14, 2
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x14, x27, 2
                  srli x14, x14, 2
                  srli x14, x14, 0
                  slli x14, x14, 0
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x5, x5, 4
                  csrr x17, 0x340
                  li x14, 30
                  sll x17, x17, x14
                  srl x17, x17, x14
                  slli x14, x17, 3
                  sll x5, x5, x14
                  or x15, x15, x5
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x14, 1
                  beq x17, x14, 31f
                  li x14, 2
                  beq x17, x14, 32f
                  li x14, 3
                  beq x17, x14, 33f
                  30: csrw 0x3a0, x15
                  j 34f
                  31: csrw 0x3a1, x15
                  j 34f
                  32: csrw 0x3a2, x15
                  j 34f
                  33: csrw 0x3a3, x15
                  34: nop
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
                  mret

load_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x29, 0
                  0: csrr x17, 0x340
                  mv x14, x17
                  li x14, 0
                  beq x17, x14, 1f
                  1: csrr x27, 0x3b0
                  csrr x15, 0x3a0
                  j 17f
                  17: li x5, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x14, x5, x17
                  addi x14, x14, -1
                  slli x14, x14, 3
                  sll x5, x15, x14
                  slli x17, x17, 3
                  add x14, x14, x17
                  srl x5, x5, x14
                  slli x14, x5, 27
                  srli x14, x14, 30
                  beqz x14, 20f
                  li x17, 1
                  beq x14, x17, 21f
                  li x17, 2
                  beq x14, x17, 25f
                  li x17, 3
                  beq x14, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x29, x27
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x27, 1
                  ble x27, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x14, 0x343
                  srli x14, x14, 2
                  bnez x17, 22f
                  bltz x14, 18b
                  j 23f
                  22: bgtu x29, x14, 18b
                  23: bleu x27, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x14, x27, 2
                  srli x14, x14, 2
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x14, x27, 2
                  srli x14, x14, 2
                  srli x14, x14, 0
                  slli x14, x14, 0
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x5, x5, 1
                  csrr x17, 0x340
                  li x14, 30
                  sll x17, x17, x14
                  srl x17, x17, x14
                  slli x14, x17, 3
                  sll x5, x5, x14
                  or x15, x15, x5
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x14, 1
                  beq x17, x14, 31f
                  li x14, 2
                  beq x17, x14, 32f
                  li x14, 3
                  beq x17, x14, 33f
                  30: csrw 0x3a0, x15
                  j 34f
                  31: csrw 0x3a1, x15
                  j 34f
                  32: csrw 0x3a2, x15
                  j 34f
                  33: csrw 0x3a3, x15
                  34: nop
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
                  mret

store_fault_handler:
                  li x17, 0
                  csrw 0x340, x17
                  li x29, 0
                  0: csrr x17, 0x340
                  mv x14, x17
                  li x14, 0
                  beq x17, x14, 1f
                  1: csrr x27, 0x3b0
                  csrr x15, 0x3a0
                  j 17f
                  17: li x5, 4
                  csrr x17, 0x340
                  slli x17, x17, 30
                  srli x17, x17, 30
                  sub x14, x5, x17
                  addi x14, x14, -1
                  slli x14, x14, 3
                  sll x5, x15, x14
                  slli x17, x17, 3
                  add x14, x14, x17
                  srl x5, x5, x14
                  slli x14, x5, 27
                  srli x14, x14, 30
                  beqz x14, 20f
                  li x17, 1
                  beq x14, x17, 21f
                  li x17, 2
                  beq x14, x17, 25f
                  li x17, 3
                  beq x14, x17, 27f
                  la x17, test_done
                  jalr x0, x17, 0
                  18: csrr x17, 0x340
                  mv x29, x27
                  addi x17, x17, 1
                  csrw 0x340, x17
                  li x27, 1
                  ble x27, x17, 19f
                  j 0b
                  19: la x17, test_done
                  jalr x0, x17, 0
                  20: j 18b
                  21: csrr x17, 0x340
                  csrr x14, 0x343
                  srli x14, x14, 2
                  bnez x17, 22f
                  bltz x14, 18b
                  j 23f
                  22: bgtu x29, x14, 18b
                  23: bleu x27, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 24f
                  la x17, test_done
                  jalr x0, x17, 0
                  24: j 29f
                  25: csrr x17, 0x343
                  srli x17, x17, 2
                  slli x14, x27, 2
                  srli x14, x14, 2
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 26f
                  la x17, test_done
                  jalr x0, x17, 0
                  26: j 29f
                  27: csrr x17, 0x343
                  srli x17, x17, 2
                  srli x17, x17, 0
                  slli x17, x17, 0
                  slli x14, x27, 2
                  srli x14, x14, 2
                  srli x14, x14, 0
                  slli x14, x14, 0
                  bne x17, x14, 18b
                  andi x14, x5, 128
                  beqz x14, 29f
                  la x17, test_done
                  jalr x0, x17, 0
                  28: j 29f
                  29: ori x5, x5, 3
                  csrr x17, 0x340
                  li x14, 30
                  sll x17, x17, x14
                  srl x17, x17, x14
                  slli x14, x17, 3
                  sll x5, x5, x14
                  or x15, x15, x5
                  csrr x17, 0x340
                  srli x17, x17, 2
                  beqz x17, 30f
                  li x14, 1
                  beq x17, x14, 31f
                  li x14, 2
                  beq x17, x14, 32f
                  li x14, 3
                  beq x17, x14, 33f
                  30: csrw 0x3a0, x15
                  j 34f
                  31: csrw 0x3a1, x15
                  j 34f
                  32: csrw 0x3a2, x15
                  j 34f
                  33: csrw 0x3a3, x15
                  34: nop
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
                  mret

ebreak_handler:   
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
                  mret

illegal_instr_handler:
                  csrr  x17, 0x341
                  addi  x17, x17, 4
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x17, 0x300 # MSTATUS;
                  csrr  x17, 0x304 # MIE;
                  csrr  x17, 0x344 # MIP;
                  csrrc x17, 0x344, x17 # MIP;
                  lw  x1, 4(x28)
                  lw  x2, 8(x28)
                  lw  x3, 12(x28)
                  lw  x4, 16(x28)
                  lw  x5, 20(x28)
                  lw  x6, 24(x28)
                  lw  x7, 28(x28)
                  lw  x8, 32(x28)
                  lw  x9, 36(x28)
                  lw  x10, 40(x28)
                  lw  x11, 44(x28)
                  lw  x12, 48(x28)
                  lw  x13, 52(x28)
                  lw  x14, 56(x28)
                  lw  x15, 60(x28)
                  lw  x16, 64(x28)
                  lw  x17, 68(x28)
                  lw  x18, 72(x28)
                  lw  x19, 76(x28)
                  lw  x20, 80(x28)
                  lw  x21, 84(x28)
                  lw  x22, 88(x28)
                  lw  x23, 92(x28)
                  lw  x24, 96(x28)
                  lw  x25, 100(x28)
                  lw  x26, 104(x28)
                  lw  x27, 108(x28)
                  lw  x28, 112(x28)
                  lw  x29, 116(x28)
                  lw  x30, 120(x28)
                  lw  x31, 124(x28)
                  addi x28, x28, 124
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
