.include "user_define.h"
.globl _start
.section .text
.option norvc;
_start:           
                  .include "user_init.s"
                  csrr x5, 0xf14
                  li x6, 0
                  beq x5, x6, 0f

0: la x1, h0_start
jalr x0, x1, 0
h0_start:
                  li x2, 0x40000100
                  csrw 0x301, x2
                  csrr x31, 0x301
kernel_sp:        
                  la x17, kernel_stack_end

trap_vec_init:    
                  la x2, mtvec_handler
                  ori x2, x2, 0

mepc_setup:       
                  la x2, init

custom_csr_setup: 
                  nop

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x2, 0x18e4cd33
                  li x3, 0x3ad08281
                  li x4, 0xf71bb906
                  li x5, 0x80000000
                  li x6, 0xe29769b9
                  li x7, 0x80000000
                  li x8, 0x80000000
                  li x9, 0x80000000
                  li x10, 0x35f37415
                  li x11, 0x80000000
                  li x12, 0xf83d9ea3
                  li x13, 0xfae26230
                  li x14, 0x6e1adadb
                  li x15, 0x80000000
                  li x16, 0xf698329c
                  li x18, 0x47849220
                  li x19, 0xf34c22fd
                  li x20, 0xfe3c083f
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x80000000
                  li x24, 0xfb35d00e
                  li x25, 0x949eb27f
                  li x26, 0xa882d8f2
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x30, 0x7f941339
                  li x31, 0x80000000
                  la x29, user_stack_end
main:             ori        s6, a5, -582
                  sra        gp, a4, a5
                  sll        s1, t5, tp
                  ori        s10, t1, 23
                  srai       a1, s9, 29
                  sll        a3, s3, s3
                  auipc      s1, 687844
                  sll        s0, s3, t1
                  ori        sp, sp, 437
                  sll        s1, t5, t5
                  slti       a6, s10, 126
                  slti       a6, ra, -119
                  auipc      sp, 623116
                  sub        a6, t4, t1
                  lui        a3, 260539
                  xori       a4, t4, 434
                  srl        t5, t1, t5
                  srli       t0, gp, 1
                  slt        s4, a4, s11
                  lui        s9, 459263
                  srl        s8, tp, a6
                  slli       a6, s10, 10
                  sra        t1, a2, s5
                  add        t3, s3, zero
                  sra        t3, s6, s9
                  sra        a3, gp, a4
                  nop
                  slti       sp, sp, 937
                  auipc      t5, 647433
                  sltiu      s7, s8, 225
                  add        s5, a0, t6
                  nop
                  andi       s1, a0, -656
                  srl        a3, t5, sp
                  sltiu      a4, zero, -174
                  srai       s4, tp, 3
                  addi       s10, t4, -452
                  sll        s6, t5, s5
                  ori        s1, zero, -947
                  and        a6, sp, a3
                  add        s2, t1, s1
                  or         a6, t5, s9
                  sll        a3, s9, a1
                  srli       t3, s10, 23
                  slti       s3, s4, -44
                  and        s1, a3, t1
                  slli       s1, s10, 7
                  slt        tp, a5, s3
                  add        s10, s1, a7
                  srli       s8, sp, 10
                  andi       a6, t0, -142
                  sub        gp, s2, t4
                  addi       a2, s7, -704
                  nop
                  slt        a3, a7, s11
                  sll        a4, t1, a4
                  slt        a1, s5, t2
                  sltu       a2, s5, t5
                  ori        s3, t6, -36
                  or         s11, t4, s3
                  nop
                  srai       t5, t0, 2
                  addi       t1, s3, -889
                  xor        a4, t0, t0
                  and        a1, t5, gp
                  or         t6, a0, a4
                  andi       s0, s8, -556
                  add        a4, t1, t6
                  sub        s8, s2, t0
                  or         s11, s0, s7
                  and        t6, a5, t1
                  sltu       s5, t1, t0
                  ori        a0, t2, 198
                  andi       sp, s10, -380
                  srl        a3, s1, s7
                  sltiu      s2, t2, 443
                  sltu       s7, s5, s11
                  sll        s7, s1, s5
                  sltu       zero, t3, s11
                  add        t3, sp, s10
                  auipc      a6, 252700
                  sltu       a4, s1, a6
                  srli       a1, s0, 2
                  ori        a4, zero, 122
                  sub        a6, s4, s10
                  srli       sp, s0, 29
                  srli       a2, a2, 5
                  addi       s10, a2, 83
                  xor        a5, s2, s1
                  slli       t5, s7, 7
                  slli       t0, a1, 13
                  sltu       t1, s0, t4
                  xori       a5, s1, 428
                  xor        s4, t0, t0
                  auipc      s9, 719956
                  slli       s9, t2, 31
                  auipc      s10, 231023
                  addi       s11, a1, -86
                  srli       zero, t6, 1
                  slt        a0, s10, s7
                  slti       t5, a5, -391
                  sub        s4, t0, a0
                  or         tp, a5, s11
                  srl        s9, sp, tp
                  slt        a3, s7, tp
                  nop
                  add        zero, sp, sp
                  sra        a1, a5, sp
                  nop
                  andi       t2, ra, -364
                  add        s2, s2, t2
                  xor        s10, s7, t4
                  sll        t2, s10, s5
                  xor        s7, a6, s5
                  srl        t0, sp, s3
                  and        a3, a2, a3
                  or         s8, ra, sp
                  slli       s2, t5, 17
                  nop
                  add        a4, a0, t4
                  srli       t1, sp, 9
                  slt        s6, s2, a6
                  andi       a3, t5, 93
                  srli       s0, t1, 27
                  slti       a0, a5, 253
                  slli       t2, tp, 13
                  ori        s1, zero, -269
                  xori       a5, t6, -908
                  or         a6, t0, a0
                  andi       a5, t2, 877
                  auipc      a2, 801845
                  ori        a5, a1, -945
                  xor        tp, t0, t4
                  andi       t2, s3, 548
                  sltu       s6, a1, t6
                  sll        s10, a4, s1
                  lui        s5, 352960
                  addi       a5, s6, 274
                  and        s9, zero, t3
                  ori        t0, s11, -231
                  slt        a2, s7, s11
                  srai       a5, gp, 22
                  slli       t1, a3, 22
                  ori        s11, tp, -916
                  sltu       s7, a1, a5
                  and        t0, s5, s0
                  and        sp, t5, t2
                  nop
                  or         s5, s7, a4
                  and        t1, t6, ra
                  auipc      a1, 585464
                  and        a6, t4, a6
                  sll        s5, s8, s9
                  srl        zero, s5, ra
                  lui        gp, 983373
                  srai       s3, s5, 0
                  addi       gp, t3, -928
                  addi       s10, tp, 578
                  ori        s4, s7, -779
                  xori       a4, t0, -413
                  xori       t0, t6, 239
                  auipc      s4, 231740
                  auipc      a6, 333168
                  srai       s7, a0, 4
                  srai       s0, s8, 9
                  sltiu      a6, a2, 485
                  xor        a2, sp, ra
                  sll        a2, zero, s8
                  or         s8, a6, tp
                  xor        s9, s11, a7
                  sll        s4, s8, a0
                  addi       s4, t0, 829
                  xori       t0, t3, -267
                  srl        t2, a1, t2
                  srl        gp, s4, a1
                  nop
                  srli       s8, a6, 5
                  sltiu      s1, s10, 960
                  or         s4, zero, s1
                  xori       t5, t5, 564
                  xori       tp, t2, -775
                  sltiu      gp, a5, -87
                  andi       s7, s1, -132
                  xor        a2, s10, s11
                  andi       t2, s11, 719
                  sub        s0, a7, a7
                  srli       s4, s4, 15
                  ori        s6, t2, 794
                  addi       s8, s0, 441
                  sltiu      s6, s3, 692
                  srli       a4, s2, 19
                  sll        s9, s6, t6
                  andi       s3, a2, -724
                  sltiu      s8, s6, 185
                  srl        t2, a5, s5
                  add        s5, tp, s0
                  srli       tp, t5, 11
                  xor        s5, ra, a4
                  or         a2, t2, zero
                  andi       s10, t1, 368
                  sltu       a3, s6, s7
                  add        gp, ra, a7
                  nop
                  or         a0, zero, a2
                  andi       a5, s7, -588
                  slt        s4, s10, a6
                  addi       a3, a0, 375
                  sub        s4, s2, a5
                  slt        a0, s3, a7
                  sltu       s7, a7, t3
                  sltiu      a2, a5, 30
                  auipc      zero, 165623
                  addi       s11, ra, 518
                  sltu       s8, a2, t0
                  slli       s7, t2, 2
                  add        tp, t6, t2
                  ori        s0, sp, -167
                  sltiu      tp, t5, -408
                  xor        gp, t6, a7
                  auipc      s4, 448427
                  srli       s4, s8, 15
                  srli       t5, s8, 7
                  xori       t2, a6, 13
                  sra        a3, a4, t3
                  srl        s8, ra, t2
                  slti       s9, a3, -391
                  sll        tp, gp, t4
                  andi       s8, s11, 518
                  srai       s5, s6, 25
                  lui        s3, 687869
                  srli       s8, a5, 24
                  andi       s8, t6, -480
                  slli       s6, t4, 16
                  srl        s7, t0, t5
                  or         sp, a7, a0
                  srl        s5, t2, a6
                  slli       zero, a6, 18
                  srl        s9, a6, tp
                  srl        a4, tp, a0
                  add        s6, s9, t3
                  slti       s3, a7, 320
                  srl        a6, s11, t5
                  sra        zero, s10, t6
                  srl        t2, a0, s1
                  slli       t1, a0, 8
                  sltu       a5, sp, t3
                  sltiu      s10, a0, 155
                  or         s3, s6, ra
                  sra        sp, s0, a4
                  sll        s8, s0, t0
                  srl        tp, t0, t6
                  sltu       s0, a0, a5
                  srai       s11, s11, 18
                  auipc      t6, 194925
                  addi       t6, s6, 1015
                  xor        s0, s3, s1
                  srli       a3, a0, 14
                  xor        s2, a3, tp
                  andi       s1, s3, -527
                  slt        gp, gp, s7
                  sub        zero, s7, a2
                  srl        s4, s9, t6
                  and        sp, t4, ra
                  nop
                  xor        t6, s7, t6
                  andi       a2, s11, 999
                  sltiu      t6, a3, 686
                  auipc      s1, 579191
                  srai       t6, a2, 7
                  srai       s0, zero, 27
                  sra        s3, gp, s0
                  slti       gp, s0, 914
                  xor        a0, t5, t4
                  ori        a2, ra, 253
                  or         s5, s8, t5
                  xori       t6, a2, 180
                  slt        s4, a7, t6
                  slti       s2, t4, -751
                  and        t2, a2, tp
                  sltiu      s1, t0, 218
                  slt        gp, a4, a6
                  lui        a0, 959905
                  srli       t6, t1, 22
                  and        s3, s3, s9
                  slli       t3, a7, 26
                  nop
                  slti       a3, a5, -175
                  andi       a0, tp, -284
                  sub        gp, t5, s11
                  slt        a5, s3, s1
                  sll        s8, a2, t0
                  sub        t3, a2, tp
                  sltiu      t1, s8, -598
                  ori        s1, a1, -228
                  sll        a3, s6, s5
                  sltiu      gp, a5, 982
                  xori       a3, s5, 386
                  srli       a0, s10, 22
                  sll        t5, a6, a5
                  srli       t2, sp, 10
                  slt        s5, s5, t3
                  andi       s7, t3, 280
                  slt        s9, s8, ra
                  lui        s6, 16549
                  slt        s5, t6, s9
                  lui        t5, 464495
                  lui        t2, 691528
                  sltu       t0, s10, t0
                  srli       s11, sp, 22
                  sltiu      s7, s9, 491
                  sltiu      s6, a6, 685
                  or         t0, a3, ra
                  sra        gp, a1, s7
                  and        gp, t2, a2
                  sll        s11, t6, t1
                  sra        s8, t5, s2
                  or         zero, s11, s8
                  srl        t1, t0, sp
                  srl        s7, s4, s11
                  ori        s3, s2, 388
                  xor        a2, s1, t0
                  sltiu      s10, s2, 967
                  add        a5, a7, s10
                  sll        s11, a7, a4
                  andi       s7, s1, 897
                  auipc      a6, 63212
                  add        t2, t5, s2
                  or         s11, s4, s0
                  add        a2, a5, s3
                  srli       t0, a2, 12
                  sltu       s3, s3, s5
                  sll        s8, t5, ra
                  xor        sp, s6, t6
                  add        a0, t4, gp
                  nop
                  srl        s5, a7, s5
                  sll        tp, t1, t5
                  slt        a6, zero, s6
                  sub        s7, a3, gp
                  srl        t3, t4, s5
                  sub        s6, s2, s0
                  sub        s3, s3, s6
                  sll        a2, a6, t0
                  ori        s7, t2, 730
                  srai       s6, s5, 19
                  sub        s6, s3, t5
                  and        zero, a1, t0
                  slti       a3, s3, -408
                  add        a4, s3, s5
                  sll        s0, t5, s4
                  sub        s10, s2, s9
                  addi       zero, t3, 854
                  sltiu      s6, s0, 534
                  and        s3, s0, a2
                  srl        t3, s7, t0
                  and        sp, a6, t4
                  xori       a5, s10, -335
                  auipc      s6, 768973
                  sub        t2, gp, a1
                  auipc      t5, 327562
                  xor        t2, s9, a6
                  ori        tp, s5, 456
                  sll        gp, t3, a6
                  ori        a0, zero, -3
                  lui        s5, 58370
                  xori       s6, a5, -774
                  nop
                  ori        s1, a3, 907
                  or         s8, s0, t4
                  sub        a4, s4, t2
                  srai       s7, t5, 0
                  srl        s9, t6, tp
                  slt        t6, t4, a7
                  and        s6, a4, s0
                  sltu       a0, t5, sp
                  and        s7, tp, s0
                  or         t1, a0, zero
                  sra        tp, s2, ra
                  slti       t5, gp, 519
                  addi       a6, t0, 329
                  or         a5, s5, a6
                  xor        t1, t3, ra
                  nop
                  slli       zero, t4, 0
                  srl        a2, s0, s2
                  andi       a4, gp, 110
                  slti       s6, a4, 475
                  andi       t3, t4, 589
                  srli       zero, sp, 2
                  xori       t5, t6, -15
                  xori       gp, s6, -232
                  slt        a2, a4, t2
                  srl        a1, t3, s5
                  sra        gp, s0, t0
                  xor        s7, a7, a3
                  andi       s8, a0, -409
                  and        s8, s10, gp
                  lui        a5, 111549
                  slt        gp, a6, t1
                  slt        s8, s5, a2
                  lui        s4, 335409
                  sll        t0, tp, s1
                  xori       t0, s8, -773
                  nop
                  auipc      a2, 97525
                  srli       a4, t1, 20
                  nop
                  lui        s8, 346943
                  srai       s0, s0, 29
                  slt        t0, s7, sp
                  xor        t3, a6, s1
                  add        zero, s8, s7
                  sltiu      s1, a1, 537
                  and        t3, a4, s0
                  sra        a5, t0, s6
                  sra        t6, ra, t5
                  slti       a0, a1, -751
                  srl        t1, a3, t0
                  srl        a0, s11, a5
                  and        s6, t6, s6
                  add        gp, s6, s3
                  addi       t0, sp, -721
                  srai       gp, a0, 25
                  lui        t1, 221466
                  sra        t1, ra, a7
                  slt        t6, s4, gp
                  auipc      a4, 349831
                  slti       a6, t6, -328
                  srli       s11, gp, 24
                  auipc      s3, 621311
                  slli       s2, s5, 30
                  srli       s9, s5, 19
                  addi       t6, a5, 113
                  sltiu      sp, s10, -819
                  srl        t0, a6, s1
                  slli       s8, s1, 27
                  sltiu      a0, s1, 940
                  sltiu      t3, t1, 289
                  srl        s3, s0, s2
                  sltu       s9, a5, ra
                  xori       s2, a6, -229
                  sub        s11, gp, s6
                  add        sp, ra, t1
                  lui        a6, 533194
                  or         s4, gp, a2
                  sub        t0, a2, a5
                  srl        t5, s2, s4
                  sltu       s6, a7, a3
                  slt        s7, a5, a4
                  ori        s7, s7, -99
                  xori       t6, s0, 584
                  sltu       s8, s4, a7
                  srl        s7, sp, s0
                  slti       t5, s5, 151
                  srli       gp, a7, 14
                  sltu       s0, t5, ra
                  ori        tp, a1, 884
                  and        a2, t1, t1
                  auipc      s3, 678464
                  sra        a2, sp, s8
                  srl        tp, s11, s8
                  slli       s11, t6, 30
                  sra        gp, a2, s7
                  xori       t6, tp, 218
                  ori        s9, a3, 216
                  sltiu      a6, s9, 933
                  sltu       a4, s1, s9
                  slti       t2, t4, -573
                  and        a5, s5, ra
                  ori        a2, s11, 938
                  or         s7, s8, a2
                  slt        a0, sp, a7
                  nop
                  slt        s3, s2, a5
                  slli       s2, a5, 8
                  slti       sp, a0, 989
                  sltiu      a1, t4, -737
                  andi       t0, a5, 518
                  sltu       s2, ra, s4
                  xor        zero, t3, s6
                  srli       a6, t4, 8
                  srli       t2, a2, 11
                  slli       s2, a5, 8
                  sra        t2, s4, t4
                  srai       gp, a3, 20
                  ori        t5, t1, -415
                  addi       t2, s11, -957
                  srl        s4, s11, s7
                  srl        s1, s6, t4
                  slli       s9, t4, 31
                  sub        sp, ra, t3
                  xor        s0, s3, a1
                  srai       a0, sp, 27
                  and        a0, s11, a2
                  slti       s9, s10, -557
                  srai       t5, a3, 2
                  sll        a2, tp, ra
                  or         a6, s1, s8
                  srl        t0, t6, ra
                  ori        a6, t0, 392
                  sra        t2, a6, ra
                  sra        s7, a4, a0
                  sltu       s4, s1, sp
                  xor        t3, a5, s3
                  addi       sp, s7, 588
                  lui        t5, 244792
                  xori       t3, t3, -648
                  xori       s3, t0, 107
                  slli       s0, t0, 1
                  and        t6, a4, t4
                  srli       t6, t1, 31
                  lui        a2, 881913
                  auipc      t5, 893778
                  sra        zero, s7, a0
                  lui        s7, 320391
                  slti       s9, s4, 832
                  srai       a3, s5, 31
                  slt        s10, t6, ra
                  sra        s3, a1, s11
                  sub        s6, s3, s2
                  andi       s7, t1, 502
                  or         t2, t6, t3
                  srai       zero, gp, 29
                  nop
                  srl        gp, s11, s10
                  or         t0, s10, s10
                  srl        s10, gp, a0
                  sra        t0, a2, a4
                  slli       s6, a7, 6
                  andi       s6, a0, 52
                  and        t5, a0, t0
                  slt        t2, t6, s4
                  sltu       a5, s11, ra
                  slti       t0, s10, -930
                  slt        a5, s1, a6
                  srli       s6, s5, 7
                  sll        a0, t1, s0
                  ori        t1, s1, -63
                  slti       t0, tp, 395
                  auipc      t5, 219078
                  lui        s6, 244047
                  sltiu      s9, t0, -783
                  srl        sp, t2, s7
                  xori       a0, t4, -970
                  xor        t0, s0, a0
                  xor        t2, s3, t6
                  nop
                  sll        a1, s11, s1
                  slt        t0, sp, a2
                  slti       s0, a4, 20
                  xor        a5, s2, s3
                  sltiu      a1, sp, -23
                  and        s9, zero, t2
                  auipc      a2, 633173
                  andi       s8, t1, -243
                  add        a2, s4, s2
                  slti       a4, s3, 624
                  add        t2, t0, s3
                  srl        a4, zero, s2
                  sub        sp, s1, s1
                  or         s0, ra, s1
                  srl        gp, t3, s4
                  sltiu      s9, s10, -641
                  srai       a2, a1, 4
                  sltu       t1, t4, s2
                  slli       s0, t0, 0
                  nop
                  lui        t0, 799450
                  sltu       s0, a0, ra
                  sll        s8, a1, t0
                  xori       sp, t6, 460
                  slli       s3, s9, 14
                  slti       s10, s3, -911
                  addi       s3, a2, -656
                  srl        s3, a2, a1
                  slli       s6, s6, 26
                  xor        s6, a5, zero
                  srai       t2, a5, 13
                  srai       s4, a6, 15
                  or         s11, s8, a5
                  srli       s11, a0, 10
                  sltiu      a6, ra, -15
                  sltiu      t2, s8, -778
                  andi       a0, a3, 389
                  slli       s0, a3, 28
                  andi       s6, tp, -8
                  or         s8, s4, s9
                  sra        s9, s11, s4
                  lui        t3, 625063
                  xor        a4, a1, s4
                  or         a5, a2, s2
                  auipc      s3, 238549
                  or         a4, a0, s0
                  lui        s6, 853526
                  xor        a6, tp, sp
                  slt        gp, t5, s1
                  ori        s11, s4, 708
                  sra        a0, a5, a1
                  sra        s9, s2, t6
                  slli       s10, s4, 0
                  slli       t5, t2, 31
                  ori        s6, s1, 638
                  or         s10, s8, s11
                  addi       s5, s9, 307
                  sub        s2, a3, a5
                  slti       a5, t3, -509
                  slt        a6, s2, s2
                  or         zero, a2, s11
                  and        s3, t0, t4
                  nop
                  sltu       a5, s10, s3
                  auipc      sp, 684504
                  add        s2, a7, a1
                  lui        t3, 102575
                  ori        s2, zero, -118
                  xori       a4, s6, -205
                  nop
                  lui        t1, 525698
                  slti       s8, tp, 749
                  nop
                  slti       s2, s7, 249
                  sltiu      s7, t3, 64
                  addi       a6, t3, -303
                  nop
                  slti       s6, s6, -614
                  lui        s7, 994137
                  sub        t6, zero, s0
                  srl        a3, s4, a7
                  slt        t0, s7, s5
                  sll        sp, t0, tp
                  sll        s1, s2, t6
                  slt        s3, zero, t5
                  srli       t5, s10, 12
                  nop
                  slti       s11, t5, -38
                  or         sp, t0, t2
                  sltiu      s2, s6, -497
                  srl        s6, ra, a5
                  or         zero, a7, zero
                  auipc      s1, 15529
                  srai       s5, a3, 0
                  slt        s0, s5, s7
                  or         a1, ra, t5
                  srli       a0, t1, 23
                  srl        a1, s8, s11
                  add        a6, t5, t6
                  srai       a6, s1, 5
                  srai       a4, t3, 25
                  addi       a2, s5, -591
                  ori        a4, s7, -214
                  or         t2, t0, sp
                  lui        s10, 166290
                  srai       s1, s7, 12
                  xori       s0, s4, 355
                  xor        a6, a6, ra
                  andi       a1, sp, 47
                  sltiu      zero, s3, -244
                  sltu       gp, a7, a1
                  slt        s7, t4, a3
                  xori       a3, gp, -85
                  srai       t3, t5, 30
                  srai       a1, tp, 25
                  srl        a6, tp, a7
                  add        s9, t3, a5
                  srl        a1, s11, a6
                  slli       s11, s5, 23
                  slt        t1, sp, s4
                  sra        t6, t6, a7
                  sll        s0, s10, tp
                  sra        s6, gp, s10
                  sll        s9, t2, sp
                  addi       t5, t6, -988
                  lui        a5, 614425
                  slli       a0, s5, 29
                  sub        s9, a3, t0
                  lui        t6, 263033
                  sra        s7, s5, a7
                  nop
                  srli       t5, ra, 10
                  and        s3, s9, t1
                  auipc      s4, 874299
                  auipc      a3, 492706
                  slt        s5, tp, s7
                  or         t3, t4, a6
                  srai       zero, s0, 30
                  add        s4, gp, a4
                  sltu       s2, gp, sp
                  slt        t1, a1, sp
                  add        s8, a2, t0
                  slti       a3, a3, 572
                  add        sp, t5, a7
                  sll        a2, a2, s3
                  lui        s3, 147848
                  nop
                  and        zero, zero, s0
                  lui        tp, 1032491
                  addi       sp, t4, -841
                  slli       a4, a1, 16
                  sltiu      a2, s2, -849
                  auipc      a1, 805254
                  nop
                  add        a5, a0, a1
                  ori        s1, a0, -411
                  slli       s10, a5, 19
                  sll        t1, t2, a4
                  ori        s8, t0, 910
                  sll        t6, s7, s5
                  auipc      s6, 804921
                  srl        t0, sp, s1
                  xor        a0, t5, s0
                  sltiu      zero, a7, 936
                  auipc      s6, 818126
                  sra        a4, tp, s3
                  srl        a3, t3, s3
                  xori       a5, a3, 276
                  add        t0, s11, s0
                  sltiu      t1, a4, -5
                  sub        a3, s9, s10
                  nop
                  sltu       s7, s1, s1
                  and        t3, t3, sp
                  srl        a3, a4, t1
                  sltiu      t1, s2, -667
                  srli       gp, t0, 18
                  srai       a4, a7, 19
                  srai       s0, s7, 23
                  slli       gp, zero, 25
                  xor        s0, s0, t4
                  addi       s0, a0, -852
                  auipc      s4, 279700
                  slt        s0, a1, sp
                  xori       s2, s8, 94
                  slt        t0, t2, tp
                  srai       s5, ra, 26
                  sll        s11, t4, s3
                  and        s0, s10, zero
                  and        sp, a7, s8
                  add        s3, s7, ra
                  andi       s6, s10, -203
                  add        gp, s9, zero
                  sll        sp, t5, t1
                  xori       sp, t1, 458
                  sra        s3, a3, t1
                  sub        s5, a3, t1
                  nop
                  sll        s5, a0, a6
                  sltiu      s4, s3, -416
                  sltiu      a3, a6, -645
                  xori       s10, gp, -674
                  sltiu      a0, s2, -728
                  lui        t1, 708097
                  srai       a0, t5, 14
                  sltiu      t0, t0, -895
                  srai       s1, t6, 0
                  andi       gp, a4, 450
                  lui        s0, 1036070
                  or         s3, s10, a4
                  slt        a3, t2, t4
                  srai       a4, ra, 20
                  xor        s11, s9, a1
                  auipc      t5, 592586
                  andi       a6, t5, -561
                  lui        s2, 828694
                  sltu       s3, s3, s8
                  sub        tp, t2, a5
                  sra        s1, a1, s4
                  srai       s2, s11, 1
                  sltiu      s10, t4, 736
                  or         s8, t3, zero
                  sll        t2, s6, a3
                  srai       s4, t3, 18
                  sltiu      s8, t0, -708
                  nop
                  sra        s10, t5, a1
                  ori        s5, a3, 981
                  and        s7, t4, a4
                  slt        a3, s10, a7
                  xori       t6, t4, 136
                  slti       gp, t1, -344
                  sltiu      s4, sp, -824
                  sra        s11, t1, a6
                  nop
                  slli       a3, ra, 3
                  sll        s10, s9, t0
                  sra        s8, t4, sp
                  nop
                  srai       t3, a1, 10
                  srl        zero, s0, s7
                  sra        s10, s9, t5
                  xori       sp, s6, -368
                  xori       t3, sp, -438
                  sltiu      a4, a4, 444
                  and        s5, s1, t1
                  ori        t1, s4, 208
                  srli       t3, s2, 23
                  and        s9, t3, t4
                  sub        s4, s0, s3
                  sltu       a3, a1, t0
                  or         s3, a7, s9
                  add        a6, t1, a5
                  add        zero, t2, a7
                  xor        s8, s11, a7
                  nop
                  slt        a1, gp, gp
                  sltu       s8, s10, s2
                  and        t5, s5, sp
                  sltu       tp, zero, s10
                  or         s3, a6, s0
                  sltu       sp, s6, a4
                  srli       s3, a3, 10
                  srai       t1, a2, 1
                  lui        a0, 105956
                  nop
                  srai       a1, a3, 27
                  sub        t5, a6, t6
                  sltiu      t1, a5, 458
                  lui        t3, 301999
                  sltiu      a4, t5, 604
                  slli       s1, a1, 28
                  sub        tp, s3, s11
                  auipc      s2, 588867
                  sra        t5, t0, s2
                  nop
                  srli       s4, a2, 3
                  sltiu      s5, t1, 40
                  sra        t2, a3, t0
                  slli       s7, gp, 15
                  andi       t0, s0, 408
                  xori       s1, a0, -549
                  sub        t5, a7, t2
                  and        s3, sp, a7
                  sra        zero, gp, t2
                  slt        s3, a2, zero
                  srai       tp, a5, 18
                  nop
                  slt        s4, s6, t6
                  srl        t2, s2, a4
                  srl        a4, s5, s9
                  addi       sp, t2, 8
                  add        tp, a7, s10
                  srli       s11, s11, 2
                  sll        s6, s11, t6
                  srl        a1, s0, gp
                  xor        s1, a3, a4
                  srl        s11, tp, a3
                  sltu       a1, a4, s4
                  sll        zero, s7, s5
                  andi       s6, t5, 193
                  ori        s5, t2, 409
                  sltiu      a3, s11, -636
                  nop
                  slli       s8, t1, 28
                  auipc      t1, 413775
                  xori       s9, ra, -831
                  lui        s1, 124319
                  srli       a3, zero, 15
                  slt        s10, sp, t5
                  sltiu      s3, a6, -288
                  add        s9, a5, sp
                  srai       gp, s5, 21
                  and        t6, t1, a6
                  xori       t5, t3, -122
                  ori        s6, a1, 869
                  slt        a4, a5, s3
                  nop
                  xor        t0, s10, t3
                  or         s4, a7, t0
                  srli       t6, a6, 25
                  or         tp, s5, t5
                  lui        a6, 317663
                  add        s2, t3, t2
                  ori        a6, s2, -262
                  addi       s9, s7, -867
                  or         t6, t1, s0
                  lui        t6, 486412
                  and        a3, s11, a5
                  sll        t0, t2, ra
                  slti       gp, s10, -45
                  xor        zero, s2, t4
                  and        s11, s0, s10
                  srl        t6, sp, s10
                  srai       zero, s10, 18
                  addi       a3, s10, 316
                  or         zero, t1, t2
                  or         s0, s6, a3
                  sltu       gp, gp, t0
                  ori        s2, a4, -830
                  addi       t0, a5, -915
                  lui        s2, 130362
                  nop
                  sub        s5, t6, a3
                  xori       gp, t6, 129
                  slt        t2, t1, a1
                  sltu       sp, s5, s10
                  or         a1, s1, sp
                  xori       t2, a2, -654
                  sra        s0, t1, s10
                  sltiu      t6, s10, -263
                  auipc      a3, 511740
                  sltiu      a3, s1, -623
                  add        s3, t3, t0
                  addi       s10, t5, -114
                  xor        zero, tp, s11
                  sra        a0, tp, ra
                  sltu       a4, t6, t6
                  lui        s6, 374633
                  sra        t6, s10, s6
                  slt        s3, s7, a4
                  addi       zero, s4, 144
                  nop
                  srl        t1, a4, s9
                  auipc      t6, 353556
                  sra        a2, s1, zero
                  andi       s7, a6, 939
                  sll        s9, t6, s3
                  sra        a0, a1, ra
                  lui        s1, 713625
                  sltiu      s2, t2, 884
                  and        a6, tp, ra
                  xor        a5, a6, tp
                  srai       s4, s10, 18
                  lui        gp, 337499
                  xori       a0, s3, 78
                  slti       t3, a1, 770
                  sra        a0, t2, s2
                  add        s5, zero, s4
                  slli       a2, tp, 17
                  add        s9, s8, ra
                  xor        zero, s1, a3
                  lui        s10, 450849
                  auipc      s4, 877678
                  slli       t5, s10, 27
                  xori       a3, a7, 750
                  or         a2, ra, s4
                  andi       s6, s0, -706
                  sltu       t2, a6, s0
                  slti       tp, s2, 311
                  xor        s1, t6, t3
                  addi       a2, t1, 445
                  sltiu      t3, t0, 496
                  sub        s3, a4, s10
                  sltu       a0, s10, s2
                  sra        s7, t6, s4
                  sra        s1, a3, s1
                  or         gp, t0, a2
                  xor        zero, t2, t4
                  auipc      s4, 26001
                  lui        a5, 217077
                  ori        a3, t2, -654
                  srl        s7, a0, t0
                  sra        s6, a7, s7
                  andi       t3, s0, 29
                  srli       a3, t5, 26
                  sub        tp, s5, s2
                  nop
                  and        s10, s2, a0
                  srli       a2, t1, 9
                  srli       t1, a6, 25
                  xor        a1, a7, s1
                  or         s3, a4, t4
                  xori       sp, ra, 298
                  sltiu      s6, gp, 675
                  srl        a4, s9, a6
                  addi       t0, zero, -118
                  add        s3, a0, s0
                  add        zero, s7, sp
                  slt        t0, a3, sp
                  ori        s11, s0, -880
                  xori       t5, s2, -679
                  auipc      sp, 438479
                  addi       a5, zero, -569
                  or         s4, s2, gp
                  nop
                  slli       a6, s6, 13
                  add        t3, s1, s8
                  or         a1, s1, t5
                  sub        t0, t3, a4
                  sltiu      s7, t6, -686
                  sltu       a3, t1, a1
                  xor        t0, s5, s0
                  ori        a3, s11, -466
                  nop
                  srl        t6, s7, t3
                  sll        t6, t6, zero
                  sltiu      t2, s0, 838
                  xor        s3, t4, a4
                  ori        a5, t3, -385
                  and        s10, t2, s3
                  xori       sp, a6, 70
                  srl        sp, t4, tp
                  auipc      a4, 390808
                  auipc      t5, 321316
                  sra        gp, t2, t3
                  slti       a5, s7, -679
                  slt        s4, t6, s2
                  lui        a5, 234534
                  and        gp, a7, s10
                  sra        s3, a3, s3
                  nop
                  and        zero, s7, ra
                  la x1, test_done
                  jalr x0, x1, 0
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
                  1: addi x29, x29, -124
                  sw  x1, 4(x29)
                  sw  x2, 8(x29)
                  sw  x3, 12(x29)
                  sw  x4, 16(x29)
                  sw  x5, 20(x29)
                  sw  x6, 24(x29)
                  sw  x7, 28(x29)
                  sw  x8, 32(x29)
                  sw  x9, 36(x29)
                  sw  x10, 40(x29)
                  sw  x11, 44(x29)
                  sw  x12, 48(x29)
                  sw  x13, 52(x29)
                  sw  x14, 56(x29)
                  sw  x15, 60(x29)
                  sw  x16, 64(x29)
                  sw  x17, 68(x29)
                  sw  x18, 72(x29)
                  sw  x19, 76(x29)
                  sw  x20, 80(x29)
                  sw  x21, 84(x29)
                  sw  x22, 88(x29)
                  sw  x23, 92(x29)
                  sw  x24, 96(x29)
                  sw  x25, 100(x29)
                  sw  x26, 104(x29)
                  sw  x27, 108(x29)
                  sw  x28, 112(x29)
                  sw  x29, 116(x29)
                  sw  x30, 120(x29)
                  sw  x31, 124(x29)
                  csrr x2, 0x300 # MSTATUS
                  csrr x2, 0x342 # MCAUSE
                  srli x2, x2, 31
                  bne x2, x0, mmode_intr_handler

mmode_exception_handler:
                  csrr x2, 0x341 # MEPC
                  csrr x2, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x2, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x2, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x2, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x2, x9, ecall_handler
                  li x9, 0x1
                  beq x2, x9, instr_fault_handler
                  li x9, 0x5
                  beq x2, x9, load_fault_handler
                  li x9, 0x7
                  beq x2, x9, store_fault_handler
                  li x9, 0xc
                  beq x2, x9, pt_fault_handler
                  li x9, 0xd
                  beq x2, x9, pt_fault_handler
                  li x9, 0xf
                  beq x2, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x2, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
                  1: la x1, test_done
                  jalr x1, x1, 0

ecall_handler:    
                  la x2, _start
                  sw x0, 0(x2)
                  sw x1, 4(x2)
                  sw x2, 8(x2)
                  sw x3, 12(x2)
                  sw x4, 16(x2)
                  sw x5, 20(x2)
                  sw x6, 24(x2)
                  sw x7, 28(x2)
                  sw x8, 32(x2)
                  sw x9, 36(x2)
                  sw x10, 40(x2)
                  sw x11, 44(x2)
                  sw x12, 48(x2)
                  sw x13, 52(x2)
                  sw x14, 56(x2)
                  sw x15, 60(x2)
                  sw x16, 64(x2)
                  sw x17, 68(x2)
                  sw x18, 72(x2)
                  sw x19, 76(x2)
                  sw x20, 80(x2)
                  sw x21, 84(x2)
                  sw x22, 88(x2)
                  sw x23, 92(x2)
                  sw x24, 96(x2)
                  sw x25, 100(x2)
                  sw x26, 104(x2)
                  sw x27, 108(x2)
                  sw x28, 112(x2)
                  sw x29, 116(x2)
                  sw x30, 120(x2)
                  sw x31, 124(x2)
                  la x1, write_tohost
                  jalr x0, x1, 0

instr_fault_handler:
                  li x2, 0
                  csrw 0x340, x2
                  li x23, 0
                  0: csrr x2, 0x340
                  mv x1, x2
                  li x1, 0
                  beq x2, x1, 1f
                  1: csrr x9, 0x3b0
                  csrr x24, 0x3a0
                  j 17f
                  17: li x15, 4
                  csrr x2, 0x340
                  slli x2, x2, 30
                  srli x2, x2, 30
                  sub x1, x15, x2
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x15, x24, x1
                  slli x2, x2, 3
                  add x1, x1, x2
                  srl x15, x15, x1
                  slli x1, x15, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x2, 1
                  beq x1, x2, 21f
                  li x2, 2
                  beq x1, x2, 25f
                  li x2, 3
                  beq x1, x2, 27f
                  la x2, test_done
                  jalr x0, x2, 0
                  18: csrr x2, 0x340
                  mv x23, x9
                  addi x2, x2, 1
                  csrw 0x340, x2
                  li x9, 1
                  ble x9, x2, 19f
                  j 0b
                  19: la x2, test_done
                  jalr x0, x2, 0
                  20: j 18b
                  21: csrr x2, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x2, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x23, x1, 18b
                  23: bleu x9, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 24f
                  la x2, test_done
                  jalr x0, x2, 0
                  24: j 29f
                  25: csrr x2, 0x343
                  srli x2, x2, 2
                  slli x1, x9, 2
                  srli x1, x1, 2
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 26f
                  la x2, test_done
                  jalr x0, x2, 0
                  26: j 29f
                  27: csrr x2, 0x343
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  slli x1, x9, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 29f
                  la x2, test_done
                  jalr x0, x2, 0
                  28: j 29f
                  29: ori x15, x15, 4
                  csrr x2, 0x340
                  li x1, 30
                  sll x2, x2, x1
                  srl x2, x2, x1
                  slli x1, x2, 3
                  sll x15, x15, x1
                  or x24, x24, x15
                  csrr x2, 0x340
                  srli x2, x2, 2
                  beqz x2, 30f
                  li x1, 1
                  beq x2, x1, 31f
                  li x1, 2
                  beq x2, x1, 32f
                  li x1, 3
                  beq x2, x1, 33f
                  30: csrw 0x3a0, x24
                  j 34f
                  31: csrw 0x3a1, x24
                  j 34f
                  32: csrw 0x3a2, x24
                  j 34f
                  33: csrw 0x3a3, x24
                  34: nop
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
                  mret

load_fault_handler:
                  li x2, 0
                  csrw 0x340, x2
                  li x23, 0
                  0: csrr x2, 0x340
                  mv x1, x2
                  li x1, 0
                  beq x2, x1, 1f
                  1: csrr x9, 0x3b0
                  csrr x24, 0x3a0
                  j 17f
                  17: li x15, 4
                  csrr x2, 0x340
                  slli x2, x2, 30
                  srli x2, x2, 30
                  sub x1, x15, x2
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x15, x24, x1
                  slli x2, x2, 3
                  add x1, x1, x2
                  srl x15, x15, x1
                  slli x1, x15, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x2, 1
                  beq x1, x2, 21f
                  li x2, 2
                  beq x1, x2, 25f
                  li x2, 3
                  beq x1, x2, 27f
                  la x2, test_done
                  jalr x0, x2, 0
                  18: csrr x2, 0x340
                  mv x23, x9
                  addi x2, x2, 1
                  csrw 0x340, x2
                  li x9, 1
                  ble x9, x2, 19f
                  j 0b
                  19: la x2, test_done
                  jalr x0, x2, 0
                  20: j 18b
                  21: csrr x2, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x2, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x23, x1, 18b
                  23: bleu x9, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 24f
                  la x2, test_done
                  jalr x0, x2, 0
                  24: j 29f
                  25: csrr x2, 0x343
                  srli x2, x2, 2
                  slli x1, x9, 2
                  srli x1, x1, 2
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 26f
                  la x2, test_done
                  jalr x0, x2, 0
                  26: j 29f
                  27: csrr x2, 0x343
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  slli x1, x9, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 29f
                  la x2, test_done
                  jalr x0, x2, 0
                  28: j 29f
                  29: ori x15, x15, 1
                  csrr x2, 0x340
                  li x1, 30
                  sll x2, x2, x1
                  srl x2, x2, x1
                  slli x1, x2, 3
                  sll x15, x15, x1
                  or x24, x24, x15
                  csrr x2, 0x340
                  srli x2, x2, 2
                  beqz x2, 30f
                  li x1, 1
                  beq x2, x1, 31f
                  li x1, 2
                  beq x2, x1, 32f
                  li x1, 3
                  beq x2, x1, 33f
                  30: csrw 0x3a0, x24
                  j 34f
                  31: csrw 0x3a1, x24
                  j 34f
                  32: csrw 0x3a2, x24
                  j 34f
                  33: csrw 0x3a3, x24
                  34: nop
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
                  mret

store_fault_handler:
                  li x2, 0
                  csrw 0x340, x2
                  li x23, 0
                  0: csrr x2, 0x340
                  mv x1, x2
                  li x1, 0
                  beq x2, x1, 1f
                  1: csrr x9, 0x3b0
                  csrr x24, 0x3a0
                  j 17f
                  17: li x15, 4
                  csrr x2, 0x340
                  slli x2, x2, 30
                  srli x2, x2, 30
                  sub x1, x15, x2
                  addi x1, x1, -1
                  slli x1, x1, 3
                  sll x15, x24, x1
                  slli x2, x2, 3
                  add x1, x1, x2
                  srl x15, x15, x1
                  slli x1, x15, 27
                  srli x1, x1, 30
                  beqz x1, 20f
                  li x2, 1
                  beq x1, x2, 21f
                  li x2, 2
                  beq x1, x2, 25f
                  li x2, 3
                  beq x1, x2, 27f
                  la x2, test_done
                  jalr x0, x2, 0
                  18: csrr x2, 0x340
                  mv x23, x9
                  addi x2, x2, 1
                  csrw 0x340, x2
                  li x9, 1
                  ble x9, x2, 19f
                  j 0b
                  19: la x2, test_done
                  jalr x0, x2, 0
                  20: j 18b
                  21: csrr x2, 0x340
                  csrr x1, 0x343
                  srli x1, x1, 2
                  bnez x2, 22f
                  bltz x1, 18b
                  j 23f
                  22: bgtu x23, x1, 18b
                  23: bleu x9, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 24f
                  la x2, test_done
                  jalr x0, x2, 0
                  24: j 29f
                  25: csrr x2, 0x343
                  srli x2, x2, 2
                  slli x1, x9, 2
                  srli x1, x1, 2
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 26f
                  la x2, test_done
                  jalr x0, x2, 0
                  26: j 29f
                  27: csrr x2, 0x343
                  srli x2, x2, 2
                  srli x2, x2, 0
                  slli x2, x2, 0
                  slli x1, x9, 2
                  srli x1, x1, 2
                  srli x1, x1, 0
                  slli x1, x1, 0
                  bne x2, x1, 18b
                  andi x1, x15, 128
                  beqz x1, 29f
                  la x2, test_done
                  jalr x0, x2, 0
                  28: j 29f
                  29: ori x15, x15, 3
                  csrr x2, 0x340
                  li x1, 30
                  sll x2, x2, x1
                  srl x2, x2, x1
                  slli x1, x2, 3
                  sll x15, x15, x1
                  or x24, x24, x15
                  csrr x2, 0x340
                  srli x2, x2, 2
                  beqz x2, 30f
                  li x1, 1
                  beq x2, x1, 31f
                  li x1, 2
                  beq x2, x1, 32f
                  li x1, 3
                  beq x2, x1, 33f
                  30: csrw 0x3a0, x24
                  j 34f
                  31: csrw 0x3a1, x24
                  j 34f
                  32: csrw 0x3a2, x24
                  j 34f
                  33: csrw 0x3a3, x24
                  34: nop
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
                  mret

ebreak_handler:   
                  csrr  x2, 0x341
                  addi  x2, x2, 4
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
                  mret

illegal_instr_handler:
                  csrr  x2, 0x341
                  addi  x2, x2, 4
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x2, 0x300 # MSTATUS;
                  csrr  x2, 0x304 # MIE;
                  csrr  x2, 0x344 # MIP;
                  csrrc x2, 0x344, x2 # MIP;
                  lw  x1, 4(x29)
                  lw  x2, 8(x29)
                  lw  x3, 12(x29)
                  lw  x4, 16(x29)
                  lw  x5, 20(x29)
                  lw  x6, 24(x29)
                  lw  x7, 28(x29)
                  lw  x8, 32(x29)
                  lw  x9, 36(x29)
                  lw  x10, 40(x29)
                  lw  x11, 44(x29)
                  lw  x12, 48(x29)
                  lw  x13, 52(x29)
                  lw  x14, 56(x29)
                  lw  x15, 60(x29)
                  lw  x16, 64(x29)
                  lw  x17, 68(x29)
                  lw  x18, 72(x29)
                  lw  x19, 76(x29)
                  lw  x20, 80(x29)
                  lw  x21, 84(x29)
                  lw  x22, 88(x29)
                  lw  x23, 92(x29)
                  lw  x24, 96(x29)
                  lw  x25, 100(x29)
                  lw  x26, 104(x29)
                  lw  x27, 108(x29)
                  lw  x28, 112(x29)
                  lw  x29, 116(x29)
                  lw  x30, 120(x29)
                  lw  x31, 124(x29)
                  addi x29, x29, 124
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
