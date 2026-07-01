# ms14_vls_e64_m8.S  (Step-14 matrix: unit-stride vle64/vse64 LMUL=8, AVL=vlmax=32)
.section .text
.globl _start
.option norvc
_start:
    la      sp, stack_top
    la      t0, trap_vector
    csrw    mtvec, t0
    li      t0, (3 << 9) | (3 << 13)
    csrs    mstatus, t0
    li      gp, 1
    la      t0, src
    la      t1, dst
    li      a0, 32
    vsetvli a1, a0, e64, m8, ta, ma
    vle64.v v8, (t0)
    vse64.v v8, (t1)
    fence
    la      t1, dst
    la      t4, src
    li      a0, 32
1:
    ld      t2, 0(t1)
    ld      t3, 0(t4)
    bne     t2, t3, fail
    addi    t1, t1, 8
    addi    t4, t4, 8
    addi    a0, a0, -1
    bnez    a0, 1b
    j       pass
pass:
    li      gp, 1
    j       wt
fail:
    slli    gp, gp, 1
    ori     gp, gp, 1
    j       wt
wt:
    la      t5, tohost
    sd      gp, 0(t5)
1:  j       1b
.align 2
trap_vector:
    li      gp, 0x1F
    j       fail
.section .data
.align 6
.global tohost
tohost:   .dword 0
.align 6
.global fromhost
fromhost: .dword 0
.align 6
src:
    .byte 0
    .byte 1
    .byte 2
    .byte 3
    .byte 4
    .byte 5
    .byte 6
    .byte 7
    .byte 8
    .byte 9
    .byte 10
    .byte 11
    .byte 12
    .byte 13
    .byte 14
    .byte 15
    .byte 16
    .byte 17
    .byte 18
    .byte 19
    .byte 20
    .byte 21
    .byte 22
    .byte 23
    .byte 24
    .byte 25
    .byte 26
    .byte 27
    .byte 28
    .byte 29
    .byte 30
    .byte 31
    .byte 32
    .byte 33
    .byte 34
    .byte 35
    .byte 36
    .byte 37
    .byte 38
    .byte 39
    .byte 40
    .byte 41
    .byte 42
    .byte 43
    .byte 44
    .byte 45
    .byte 46
    .byte 47
    .byte 48
    .byte 49
    .byte 50
    .byte 51
    .byte 52
    .byte 53
    .byte 54
    .byte 55
    .byte 56
    .byte 57
    .byte 58
    .byte 59
    .byte 60
    .byte 61
    .byte 62
    .byte 63
    .byte 64
    .byte 65
    .byte 66
    .byte 67
    .byte 68
    .byte 69
    .byte 70
    .byte 71
    .byte 72
    .byte 73
    .byte 74
    .byte 75
    .byte 76
    .byte 77
    .byte 78
    .byte 79
    .byte 80
    .byte 81
    .byte 82
    .byte 83
    .byte 84
    .byte 85
    .byte 86
    .byte 87
    .byte 88
    .byte 89
    .byte 90
    .byte 91
    .byte 92
    .byte 93
    .byte 94
    .byte 95
    .byte 96
    .byte 97
    .byte 98
    .byte 99
    .byte 100
    .byte 101
    .byte 102
    .byte 103
    .byte 104
    .byte 105
    .byte 106
    .byte 107
    .byte 108
    .byte 109
    .byte 110
    .byte 111
    .byte 112
    .byte 113
    .byte 114
    .byte 115
    .byte 116
    .byte 117
    .byte 118
    .byte 119
    .byte 120
    .byte 121
    .byte 122
    .byte 123
    .byte 124
    .byte 125
    .byte 126
    .byte 127
    .byte 128
    .byte 129
    .byte 130
    .byte 131
    .byte 132
    .byte 133
    .byte 134
    .byte 135
    .byte 136
    .byte 137
    .byte 138
    .byte 139
    .byte 140
    .byte 141
    .byte 142
    .byte 143
    .byte 144
    .byte 145
    .byte 146
    .byte 147
    .byte 148
    .byte 149
    .byte 150
    .byte 151
    .byte 152
    .byte 153
    .byte 154
    .byte 155
    .byte 156
    .byte 157
    .byte 158
    .byte 159
    .byte 160
    .byte 161
    .byte 162
    .byte 163
    .byte 164
    .byte 165
    .byte 166
    .byte 167
    .byte 168
    .byte 169
    .byte 170
    .byte 171
    .byte 172
    .byte 173
    .byte 174
    .byte 175
    .byte 176
    .byte 177
    .byte 178
    .byte 179
    .byte 180
    .byte 181
    .byte 182
    .byte 183
    .byte 184
    .byte 185
    .byte 186
    .byte 187
    .byte 188
    .byte 189
    .byte 190
    .byte 191
    .byte 192
    .byte 193
    .byte 194
    .byte 195
    .byte 196
    .byte 197
    .byte 198
    .byte 199
    .byte 200
    .byte 201
    .byte 202
    .byte 203
    .byte 204
    .byte 205
    .byte 206
    .byte 207
    .byte 208
    .byte 209
    .byte 210
    .byte 211
    .byte 212
    .byte 213
    .byte 214
    .byte 215
    .byte 216
    .byte 217
    .byte 218
    .byte 219
    .byte 220
    .byte 221
    .byte 222
    .byte 223
    .byte 224
    .byte 225
    .byte 226
    .byte 227
    .byte 228
    .byte 229
    .byte 230
    .byte 231
    .byte 232
    .byte 233
    .byte 234
    .byte 235
    .byte 236
    .byte 237
    .byte 238
    .byte 239
    .byte 240
    .byte 241
    .byte 242
    .byte 243
    .byte 244
    .byte 245
    .byte 246
    .byte 247
    .byte 248
    .byte 249
    .byte 250
    .byte 251
    .byte 252
    .byte 253
    .byte 254
    .byte 255
.align 6
dst:
    .skip 256
.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top:
