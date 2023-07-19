.section .text
.globl _start
.option norvc
_start:
h0_start:
                  li x8, 0x40201123
                  csrw 0x301, x8
                  csrr x31, 0x301
kernel_sp:        
                  la x2, kernel_stack_end

trap_vec_init:    
                  la x8, mtvec_handler
                  ori x8, x8, 1

mepc_setup:       
                  la x8, init

custom_csr_setup: 

init_machine_mode:
init:             
                  li x1, 0x80007e00
                  csrw 0x300, x1   #MSTATUS Write
                  csrr x31, 0x300  #MSTATUS Read
                  li x0, 0x80000000
                  li x1, 0x80000000
                  li x3, 0xffa65dfd
                  li x4, 0xf233f172
                  li x5, 0x80000000
                  li x6, 0xfedbdfc8
                  li x7, 0xfd435bb4
                  li x8, 0xc87f741a
                  li x9, 0x80000000
                  li x10, 0x80000000
                  li x11, 0xff2b0a70
                  li x12, 0xf27cb5b0
                  li x13, 0x80000000
                  li x14, 0x80000000
                  li x15, 0x81be3106
                  li x16, 0xffe47f87
                  li x17, 0x8f326223
                  li x18, 0x80000000
                  li x19, 0xfd4b97ec
                  li x20, 0xf0cbc76e
                  li x21, 0xa5d7cb10
                  li x22, 0xc2e59998
                  li x23, 0x80000000
                  li x24, 0x7c811521
                  li x26, 0x1dfb9a53
                  li x27, 0x80000000
                  li x28, 0xf71a23cf
                  li x29, 0xf7b5572b
                  li x30, 0x55f00e3f
                  li x31, 0xfa82e187
                  la x25, user_stack_end
                  csrwi vxsat, 0
                  csrwi vxrm, 0
main:
		  li x9, 32
                  vsetvli x8, x9, e32, m2
                  vmv.v.i v2, 12
                  li x6, 0x80002000
                  vse32.v v2, (x6)
                  ld t2, (x6)
                  vle32.v v4, (x6)
                  lui        t4, 655069
                  la x15, test_done
                  jalr x0, x15, 0
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
                  1: addi x25, x25, -124
                  sw  x1, 4(x25)
                  sw  x2, 8(x25)
                  sw  x3, 12(x25)
                  sw  x4, 16(x25)
                  sw  x5, 20(x25)
                  sw  x6, 24(x25)
                  sw  x7, 28(x25)
                  sw  x8, 32(x25)
                  sw  x9, 36(x25)
                  sw  x10, 40(x25)
                  sw  x11, 44(x25)
                  sw  x12, 48(x25)
                  sw  x13, 52(x25)
                  sw  x14, 56(x25)
                  sw  x15, 60(x25)
                  sw  x16, 64(x25)
                  sw  x17, 68(x25)
                  sw  x18, 72(x25)
                  sw  x19, 76(x25)
                  sw  x20, 80(x25)
                  sw  x21, 84(x25)
                  sw  x22, 88(x25)
                  sw  x23, 92(x25)
                  sw  x24, 96(x25)
                  sw  x25, 100(x25)
                  sw  x26, 104(x25)
                  sw  x27, 108(x25)
                  sw  x28, 112(x25)
                  sw  x29, 116(x25)
                  sw  x30, 120(x25)
                  sw  x31, 124(x25)
                  csrr x8, 0x341 # MEPC
                  csrr x8, 0x342 # MCAUSE
                  li x9, 0x3 # BREAKPOINT
                  beq x8, x9, ebreak_handler
                  li x9, 0x8 # ECALL_UMODE
                  beq x8, x9, ecall_handler
                  li x9, 0x9 # ECALL_SMODE
                  beq x8, x9, ecall_handler
                  li x9, 0xb # ECALL_MMODE
                  beq x8, x9, ecall_handler
                  li x9, 0x1
                  beq x8, x9, instr_fault_handler
                  li x9, 0x5
                  beq x8, x9, load_fault_handler
                  li x9, 0x7
                  beq x8, x9, store_fault_handler
                  li x9, 0xc
                  beq x8, x9, pt_fault_handler
                  li x9, 0xd
                  beq x8, x9, pt_fault_handler
                  li x9, 0xf
                  beq x8, x9, pt_fault_handler
                  li x9, 0x2 # ILLEGAL_INSTRUCTION
                  beq x8, x9, illegal_instr_handler
                  csrr x9, 0x343 # MTVAL
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
                  li x18, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x9, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x30, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x30, x17, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x30, x30, x15
                  slli x15, x30, 27
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
                  mv x18, x9
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x9, 1
                  ble x9, x8, 19f
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
                  22: bgtu x18, x15, 18b
                  23: bleu x9, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x9, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x9, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x30, x30, 4
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x30, x30, x15
                  or x17, x17, x30
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

load_fault_handler:
                  li x8, 0
                  csrw 0x340, x8
                  li x18, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x9, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x30, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x30, x17, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x30, x30, x15
                  slli x15, x30, 27
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
                  mv x18, x9
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x9, 1
                  ble x9, x8, 19f
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
                  22: bgtu x18, x15, 18b
                  23: bleu x9, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x9, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x9, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x30, x30, 1
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x30, x30, x15
                  or x17, x17, x30
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

store_fault_handler:
                  li x8, 0
                  csrw 0x340, x8
                  li x18, 0
                  0: csrr x8, 0x340
                  mv x15, x8
                  li x15, 0
                  beq x8, x15, 1f
                  1: csrr x9, 0x3b0
                  csrr x17, 0x3a0
                  j 17f
                  17: li x30, 4
                  csrr x8, 0x340
                  slli x8, x8, 30
                  srli x8, x8, 30
                  sub x15, x30, x8
                  addi x15, x15, -1
                  slli x15, x15, 3
                  sll x30, x17, x15
                  slli x8, x8, 3
                  add x15, x15, x8
                  srl x30, x30, x15
                  slli x15, x30, 27
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
                  mv x18, x9
                  addi x8, x8, 1
                  csrw 0x340, x8
                  li x9, 1
                  ble x9, x8, 19f
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
                  22: bgtu x18, x15, 18b
                  23: bleu x9, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 24f
                  la x8, test_done
                  jalr x0, x8, 0
                  24: j 29f
                  25: csrr x8, 0x343
                  srli x8, x8, 2
                  slli x15, x9, 2
                  srli x15, x15, 2
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 26f
                  la x8, test_done
                  jalr x0, x8, 0
                  26: j 29f
                  27: csrr x8, 0x343
                  srli x8, x8, 2
                  srli x8, x8, 0
                  slli x8, x8, 0
                  slli x15, x9, 2
                  srli x15, x15, 2
                  srli x15, x15, 0
                  slli x15, x15, 0
                  bne x8, x15, 18b
                  andi x15, x30, 128
                  beqz x15, 29f
                  la x8, test_done
                  jalr x0, x8, 0
                  28: j 29f
                  29: ori x30, x30, 3
                  csrr x8, 0x340
                  li x15, 30
                  sll x8, x8, x15
                  srl x8, x8, x15
                  slli x15, x8, 3
                  sll x30, x30, x15
                  or x17, x17, x30
                  csrr x8, 0x340
                  srli x8, x8, 2
                  beqz x8, 30f
                  li x15, 1
                  beq x8, x15, 31f
                  li x15, 2
                  beq x8, x15, 32f
                  li x15, 3
                  beq x8, x15, 33f
                  30: csrw 0x3a0, x17
                  j 34f
                  31: csrw 0x3a1, x17
                  j 34f
                  32: csrw 0x3a2, x17
                  j 34f
                  33: csrw 0x3a3, x17
                  34: nop
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

ebreak_handler:   
                  csrr  x8, 0x341
                  addi  x8, x8, 4
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

illegal_instr_handler:
                  csrr  x8, 0x341
                  addi  x8, x8, 4
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
                  mret

pt_fault_handler: 
                  nop

.align 2
mmode_intr_handler:
                  csrr  x8, 0x300 # MSTATUS;
                  csrr  x8, 0x304 # MIE;
                  csrr  x8, 0x344 # MIP;
                  csrrc x8, 0x344, x8 # MIP;
                  lw  x1, 4(x25)
                  lw  x2, 8(x25)
                  lw  x3, 12(x25)
                  lw  x4, 16(x25)
                  lw  x5, 20(x25)
                  lw  x6, 24(x25)
                  lw  x7, 28(x25)
                  lw  x8, 32(x25)
                  lw  x9, 36(x25)
                  lw  x10, 40(x25)
                  lw  x11, 44(x25)
                  lw  x12, 48(x25)
                  lw  x13, 52(x25)
                  lw  x14, 56(x25)
                  lw  x15, 60(x25)
                  lw  x16, 64(x25)
                  lw  x17, 68(x25)
                  lw  x18, 72(x25)
                  lw  x19, 76(x25)
                  lw  x20, 80(x25)
                  lw  x21, 84(x25)
                  lw  x22, 88(x25)
                  lw  x23, 92(x25)
                  lw  x24, 96(x25)
                  lw  x25, 100(x25)
                  lw  x26, 104(x25)
                  lw  x27, 108(x25)
                  lw  x28, 112(x25)
                  lw  x29, 116(x25)
                  lw  x30, 120(x25)
                  lw  x31, 124(x25)
                  addi x25, x25, 124
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

