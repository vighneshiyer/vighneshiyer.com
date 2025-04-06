OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS {
    . = 0x80000000; /* Typical start address for RISC-V */
    .text : {
        *(.text)
    }
    . = ALIGN(0x1000);
    .tohost : { *(.tohost) }
    . = ALIGN(0x1000);
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}
