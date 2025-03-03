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
print_bcd:
    li t0, 0x0101
    slli t0, t0, 48 # device 1, command 1
    ori t0, t0, 97 # payload = 97 (ASCII 'a')
    la t1, tohost
    sd t0, 0(t1)
prepare_to_wait:
    li t2, 0
    li t3, 50000 # loop 10000 times to wait
wait_a_while:
    addi t2, t2, 1
    blt t2, t3, wait_a_while
write_tohost:
    la t0, tohost
    sd a2, 0(t0)
    j write_tohost

poll_fromhost:
    la t2, fromhost
    ld t3, 0(t2)
    beqz t3, poll_fromhost
    sd x0, 0(t2)
