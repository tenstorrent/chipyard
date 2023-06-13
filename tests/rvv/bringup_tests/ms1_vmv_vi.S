.section .data
.align 4
vec_a:  .word 1, 2, 3, 4
vec_b:  .word 5, 6, 7, 8
result: .space 16

.section .text
.globl _start
_start:

    # Set Vector Configuration
    # avl = 4
    # vtype = 64-bit elements (SEW=64) and (LMUL=1)
    li t0, 4         # 32-bit elements (E32)
    vsetvli t1, a0, e64, m1
    
    # Move immediate to vector register
    vmv.v.i v2, 12
    
    # End
    # Usually, you would call an exit syscall here to terminate the program


