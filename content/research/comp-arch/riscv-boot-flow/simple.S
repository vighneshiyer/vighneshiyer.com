.pushsection .tohost,"aw",@progbits
.align 6 # align tohost on a 64-byte (cache line) boundary
.global tohost
tohost: .dword 0
.size tohost, 8

.align 6
.global fromhost
fromhost: .dword 0
.size fromhost, 8
.popsection

.section .text
.global _start
_start:
    li a0, 10
    li a1, 20
    add a2, a0, a1
    slli a2, a2, 1
    ori a2, a2, 1
    la t0, tohost
write_tohost:
    sd a2, 0(t0)
    j write_tohost
