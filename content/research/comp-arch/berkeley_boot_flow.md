+++
title = "The RISC-V Boot and Bringup Flow (Berkeley Edition)"
date = 2025-02-05
+++

Let's understand how a RISC-V binary boots and runs on a RISC-V core modeled in spike or in RTL simulation.
We will begin with a very simple baremetal program and understand the program loading mechanics, the bootrom and initialization sequence, and how the RISC-V core communicates with a tethered host.

This article assumes basic knowledge about using the command line / shell, Linux, the RISC-V ISA, and CPU architecture.
If you don't possess these prerequisites, you must carefully go through [MIT's "missing semester" course](https://missing.csail.mit.edu/) before reading on.

## Dependencies

Before we get started, let's install some required dependencies on your laptop.

### Host Toolchain and Libraries

Install a basic development environment (`gcc`, `make`, etc.) on your host system:

- **Arch Linux**: `pacman -S base-devel`
- **Ubuntu**: `apt install build-essential`
- **OSX**: `brew install gcc make cmake automake autoconf libtool` + `xcode-select --install`
- **Windows**: Use WSL

You also need a few other dependencies for `spike`:

- **Arch Linux**: `pacman -S dtc boost-libs`
- **Ubuntu**: `apt-get install device-tree-compiler libboost-regex-dev libboost-system-dev`
- **OSX**: `brew install dtc boost`

### RISC-V Cross Compiler

You need a GCC *cross-compiler* that runs on your host architecture (x86 or ARM) and compiles source code (e.g. C, assembly) into a RISC-V binary.

- **Linux**: Look at the releases page for [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/tags). Download the file that looks like `riscv64-elf-ubuntu-24.04-gcc-nightly-...tar.xz` (the key words are: `riscv64`, `elf`, `gcc`). Uncompress the `.tar.xz` file and add the `bin` folder inside to your `$PATH`.
- **OSX**: Follow the instructions in the `README` in [homebrew-riscv](https://github.com/riscv-software-src/homebrew-riscv). Alternatively, you can install the [`riscv64-elf-gcc` Homebrew package](https://formulae.brew.sh/formula/riscv64-elf-gcc), but truthfully I don't know if this package contains everything you need.

After you install the cross compiler, verify it exists and runs.

```bash
which riscv64-unknown-elf-gcc
riscv64-unknown-elf-gcc -v
```

### spike: The RISC-V Instruction Set Simulator

`spike` is the golden RISC-V instruction set simulator (ISS).
You give it a RISC-V binary and `spike` will interpret it one instruction at a time.
`spike` models all the architectural state of a RISC-V hart (hardware thread), backing memory (DRAM), and several other devices in a RISC-V SoC (CLINT, PLIC, UART) we will learn about soon.

You need to set the `$RISCV` environment variable to some folder where `spike` will be installed to.
Typically, it is set to the folder where you decompressed the riscv-gcc toolchain.
You can also just create a folder anywhere on your disk.

```bash
export RISCV=/path/to/some/sysroot
export PATH="$PATH:$RISCV/bin"
```

Time to build `spike` from source.

```bash
git clone git@github.com:riscv-software-src/riscv-isa-sim && cd riscv-isa-sim
mkdir build
cd build
../configure --prefix=$RISCV
make -j8
make install
```

Verify everything is OK:

```bash
which spike
spike --dump-dts TEST
```

## First Steps

### A Simple Assembly Program

Let's start with the simplest program we could write.
It just loads 2 registers with literals, adds them together, and does this in a loop.

```asm
// simple.S
.section .text
.global _start
_start:
    li a0, 1
    li a1, 2
    add a2, a0, a1
    j _start
```

**Find out for yourself**: what do `.section .text` and `.global _start` mean?
Let's compile this program and run it with spike.

```bash
riscv64-unknown-elf-gcc -nostartfiles -ffreestanding -march=rv64gc -mabi=lp64 -o simple.elf simple.S
```

**Find out for yourself**: what do the command line options passed to `gcc` mean?
Now let's run the generated `elf` file with spike.

```bash
spike simple.elf
Access exception occurred while loading payload simple.elf:
Memory address 0x100b8 is invalid
```

Oh no, something is wrong. Spike is unhappy with the ELF we gave it.
To investigate further, let's disassemble the ELF binary.

```bash
riscv64-unknown-elf-objdump -D simple.elf
```

```text
simple.elf:     file format elf64-littleriscv

Disassembly of section .text:

00000000000100b0 <_start>:
   100b0:	4505                  li  a0,1
   100b2:	4589                  li  a1,2
   100b4:	00b50633              add a2,a0,a1
   100b8:	bfe5                  j   100b0 <_start>
```

Indeed, we can see that the binary starts at the address `0x100b0`, but it seems spike doesn't like that.
If you do some more investigation, you'll find that gcc has a default linker script for RISC-V which sets the starting address for the ELF to `0x10000`, which is followed by the ELF headers, and then the program itself at `0x100b0`.

### The SoC Memory Map and Linker Scripts

It seems spike doesn't like that this binary begins at the memory address `0x100b0`.
So, what address should this binary be loaded at?

When a RISC-V hart executes a load or store instruction, or fetches from the current PC, it sends an addressed request into the memory system.
The request's address determines which device in the SoC the request will be routed to.
This map from address to device is referred to as the *SoC memory map*.

So, what is the memory map of the SoC that spike is modeling?
We can run `spike --dump-dts DUMP` to find out (this dumps the *device tree* of the modeled SoC).
**Find out for yourself**: what is a device tree?

```text
  memory@80000000 {
    device_type = "memory";
    reg = <0x0 0x80000000 0x0 0x80000000>;
  };
```

These lines indicate that memory (DRAM) begins at address `0x8000_0000` and is `0x8000_0000` bytes (2 GiB).
So the address `0x100b0` isn't mapped to DRAM. It isn't mapped to anything!
This explains why spike raised an error saying the ELF base memory address is invalid.

How do we fix this?
We want the linker to place the program's instructions at the beginning of the DRAM address space.
Let's write a custom linker script that instructs gcc to place the program at `0x8000_0000`.

```linker
# link.ld
OUTPUT_ARCH(riscv)
ENTRY(_start)

SECTIONS {
    . = 0x80000000; /* Typical start address for RISC-V */
    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}
```

**Find out for yourself**: what does this linker script do? What data do the various sections (`.text`, `.data`, `.bss`) hold?
Now, use this linker script with `gcc`.

```bash
riscv64-unknown-elf-gcc -nostartfiles -ffreestanding -march=rv64gc -mabi=lp64 -o simple.elf -T link.ld simple.S
```

**Find out for yourself**: disassemble this binary and observe the impact that using this linker script had.
Let's run this binary on spike.
We know this binary has an infinite loop, so we should only run a handful of instructions to observe what is happening.
To do this, we will use spike's debug (`-d`) mode (run `help` for a full list of commands in debug mode) and dump spike's instruction commit log to a file (`spike.log`).

```bash
spike -d --log=spike.log simple.elf
warning: tohost and fromhost symbols not in ELF; can't communicate with target
(spike) run 100
(spike) quit
```

Let's look at the log that spike wrote.

```text
core   0: 0x0000000000001000 (0x00000297) auipc   t0, 0x0
core   0: 0x0000000000001004 (0x02028593) addi    a1, t0, 32
core   0: 0x0000000000001008 (0xf1402573) csrr    a0, mhartid
core   0: 0x000000000000100c (0x0182b283) ld      t0, 24(t0)
core   0: 0x0000000000001010 (0x00028067) jr      t0
core   0: >>>>  $xrv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0
core   0: 0x0000000080000000 (0x00004505) c.li    a0, 1
core   0: 0x0000000080000002 (0x00004589) c.li    a1, 2
core   0: 0x0000000080000004 (0x00b50633) add     a2, a0, a1
core   0: 0x0000000080000008 (0x0000bfe5) c.j     pc - 8
core   0: >>>>  $xrv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0_zaamo1p0_zalrsc1p0
core   0: 0x0000000080000000 (0x00004505) c.li    a0, 1
core   0: 0x0000000080000002 (0x00004589) c.li    a1, 2
core   0: 0x0000000080000004 (0x00b50633) add     a2, a0, a1
core   0: 0x0000000080000008 (0x0000bfe5) c.j     pc - 8
```

The format of this log is `core <core number>: <PC> (<raw instruction bytes>) <disassembled instruction>`.
We can see the code we wrote and observe the infinite loop.
But there is some code that spike seems to run even before it reaches our program at (`0x8000_0000`)!

### The Bootrom

Notice that the first instruction spike fetches is at address `0x1000`.
But we don't see that address in the spike DTS.

What's happening is that spike models a hart that begins executing instructions from a hardcoded address (in this case `0x1000`) upon coming out of reset.
The hardcoded set of instructions that a hart executes at boot is called the *reset vector*, and it is stored in the *bootrom*.

The reset vector and bootrom are defined in [`riscv/sim.cc` in spike](https://github.com/riscv-software-src/riscv-isa-sim/blob/master/riscv/sim.cc#L361).

```cpp
  reg_t start_pc = cfg->start_pc.value_or(get_entry_point());

  uint32_t reset_vec[reset_vec_size] = {
    0x297,                                      // auipc  t0,0x0
    0x28593 + (reset_vec_size * 4 << 20),       // addi   a1, t0, &dtb
    0xf1402573,                                 // csrr   a0, mhartid
    get_core(0)->get_xlen() == 32 ?
      0x0182a283u :                             // lw     t0,24(t0)
      0x0182b283u,                              // ld     t0,24(t0)
    0x28067,                                    // jr     t0
    0,
    (uint32_t) (start_pc & 0xffffffff),
    (uint32_t) (start_pc >> 32)
  };
  // ...
  std::vector<char> rom((char*)reset_vec, (char*)reset_vec + sizeof(reset_vec));
  rom.insert(rom.end(), dtb.begin(), dtb.end());
```

The bootrom consists of the instructions we just saw + the `start_pc` + the DTB (the binary form of the device tree).
Let's break down what these instructions do.

1. `auipc t0, 0x0`: The current PC (`0x1000`) is loaded into `t0`
2. `addi a1, t0, 32`: The base address of the DTS is stored in `a1`
3. `csrr a0, mhartid`: Load the current hart's ID into `a0` (every hart in a RISC-V SoC has a unique id, starting at 0)
4. `ld t0, 24(t0)`: Load the `start_pc` into `t0` (the `start_pc` is located 24 bytes from the start of the reset vector)
5. `jr t0`: Jump to the `start_pc`

When the program we pass to spike begins to run, it can immediately reference the hart ID and the base of the DTS.
But wait, where does this `start_pc` come from?

Looking at the code, it comes from calling `get_entry_point()`, which is [defined in `fesvr/htif.h`](https://github.com/riscv-software-src/riscv-isa-sim/blob/master/fesvr/htif.h#L70).
We will get back to that soon, but essentially it reads the ELF file and queries where program execution should begin.
**Try this yourself**: `riscv64-unknown-elf-readelf -a simple.elf`.

### How Can The Program Exit?

OK, so far, so good.
The program runs on spike and we know how spike's bootup routine works.

But, the program runs in an infinite loop!
If we left off the final jump instruction, the program still wouldn't exit.
**Try this yourself**. **What happens**?

To be able to exit the program, we must first understand *host-tethering*.

## HTIF (Berkeley Host-Target Interface)

Image of the system (fesvr, htif)

### Printing Strings via HTIF

## Booting a Rocket Core in RTL Simulation

### Loading the Program Into Memory

fast memload vs TSI

### CLINT

software interrupt trigger to jump to start PC

Now going into RTL simulation world:

- Standalone TSI: https://github.com/ucb-bar/tsi
- TSI protocol
  - https://github.com/riscv-software-src/riscv-isa-sim/blob/master/fesvr/tsi.cc#L55
  - https://github.com/riscv-software-src/riscv-isa-sim/blob/master/fesvr/tsi.h
- TSI to tilelink:
  - https://github.com/ucb-bar/testchipip/blob/master/src/main/scala/tsi/TSIToTileLink.scala
- Serializing TSI:
  - https://github.com/ucb-bar/testchipip/blob/master/src/main/scala/uart/UARTToSerial.scala

- How does the RTL-side memory map get generated?
  - See the diplomacy API: https://chipyard.readthedocs.io/en/latest/TileLink-Diplomacy-Reference/index.html
  - Diplomacy paper: https://carrv.github.io/2017/papers/cook-diplomacy-carrv2017.pdf


- HTIF, Fesvr, TSI, PLIC, CLINT, spike, what is all of this stuff
- From the RocketTile alone, reset vector, baremetal programs, the role of crt0.S, how the linker script works, physical memory
- Moving up: how does HTIF work, how does the target program signal termination to the host tether, how does the host load programs into the processor
- Even more: how do syscalls work, how does proxying work, how can we use CSRs for measuring time and performance
- Virtual memory: how does the virtual memory environment work for the ISA tests, how does pk work?
- FSBL: how does opensbi work? understanding privilege modes
- https://www.sifive.com/blog/all-aboard-part-1-compiler-args
- https://www.sifive.com/blog/all-aboard-part-6-booting-a-risc-v-linux-kernel (Palmer's series is great, just needs an update and consolidation)
- https://news.ycombinator.com/item?id=37062422 (https://github.com/hackclub/putting-the-you-in-cpu)
- https://github.com/defermelowie/bare-metal-rust-on-riscv (Rust mode!)
  - embedded rust book: https://docs.rust-embedded.org/book/start/semihosting.html
  - rust based tsi implementation: https://github.com/ucb-bar/tsi
  - https://docs.rust-embedded.org/embedonomicon/smallest-no-std.html

1. Start with the simplest possible asm program, introduce host htif communication to exit the program
  - Will have to discuss linker scripts, memory layout, assembler, spike, and htif
1. Write print syscall via htif in asm
1. Then use C (need to discuss crt.S, how to compile baremetal, buliding a htif library for launching syscalls)
  - Then show the htif library that exists already within spike
1. libgloss, what is it? how does it let us use regular libc functions, but delegate the syscall interface as we would like
1. Multicore programs, how do the riscv-benchmarks work in multicore mode?
1. Virtual memory (setup routines and CSR configuration and page tables)
1. Targeting baremetal with rust
1. How does pk work?
1. OpenSBI + Linux boot? Final thing to show is how Linux sets up kernel mode logic and hands off things to userspace

Notes from Joonho:

> # Boot Sequence
> 1. The core wakes out of reset
> 2. The core fetches instructions from the BootROM (the address of the BootROM 0x10000, is a hardcoded value inside the core)
> 3. The core spins using the instructions from the BootROM (boot sequence)
> 4. Meanwhile, fesvr writes to binary to DRAM (this is not-coherent)
> 5. When the fesvr is done writing the binary to the DRAM, it sends a TSI msg which gets translated to a TL msg which is sent to the CLINT which raises the MSIP(machine software) interrupt which pulls the core out of the boot sequence, and makes it jump to the starting point of the binary
>
> [6.13. Chipyard Boot Process — Chipyard 1.9.0 documentation](https://chipyard.readthedocs.io/en/stable/Customization/Boot-Process.html#bootrom-and-risc-v-frontend-server)
>
>
> # How the program prints stuff & executes sys-calls in bare metal mode
> * There are `toHost` and `fromHost` addresses in the `elf` file
> * While the binary is executing in the SoC and meets a `printf` function…
>   1. It writes the address of the string to the `toHost` address
>   2. Fesvr periodically checks `toHost` address
>   3. When the value of `toHost` is not zero, it executes some action according to the value
>      * E.g., `abort` `tohost_exit` `handle_trap` `print_str` all have different addresses
>
> ```cpp
> #include <stdio.h>
> #include <inttypes.h>
>
> char *arr[] = "Hello";
>
> int main() {
> 	uint64_t addr = (uint64_t)arr;
> 	for (int i = 0; i < 5; i++) {
> 		// This will make the core write "addr" to the "toHost" address. When fesvr sends a TL-A req through TSI, the response will be "addr"
>  		// Then, fesvr will send another request to "addr".
>   		printf("%c", arr[i]);
> 	};
> 	return 0;
> }
> ```

- https://riscv.org/wp-content/uploads/2015/01/riscv-software-stack-bootcamp-jan2015.pdf (Sagar's slides from a long time ago)
