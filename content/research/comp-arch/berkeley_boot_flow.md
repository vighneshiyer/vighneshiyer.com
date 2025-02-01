+++
title = "The Berkeley RISC-V Boot and Bringup Stack"
date = 2023-02-28
+++

Let's try to understand how a RISC-V binary boots and runs on a RISC-V core modeled in spike or in RTL simulation.
We will begin with a very simple baremetal program and try to understand the program loading mechanics, the bootrom and initialization sequence, and communicating with a tethered host.

## Dependencies

Before we get started, install some basic dependencies on your laptop.

### Host Toolchain and Libraries

Install a base development environment for your host system:

- **Arch Linux**: `pacman -S base-devel`
- **Ubuntu**: `apt install build-essential`
- **OSX**: `brew install gcc make cmake automake autoconf libtool` + `xcode-select --install`
- **Windows**: Use WSL

You also need a few other dependencies:

- **Arch Linux**: `pacman -S dtc boost-libs`
- **Ubuntu**: `apt-get install device-tree-compiler libboost-regex-dev libboost-system-dev`
- **OSX**: `brew install dtc boost`

### RISC-V Cross Compiler

We will use a GCC *cross-compiler* that runs on your host architecture (x86 or ARM) and compiles source files to a RISC-V binary.

- **Linux**: Look at the releases page for [riscv-gnu-toolchain](https://github.com/riscv-collab/riscv-gnu-toolchain/tags). Download the file that looks like `riscv64-elf-ubuntu-24.04-gcc-nightly-...tar.xz` (the key words are: `riscv64`, `elf`, `gcc`). Uncompress the file and add the `bin` folder inside to your `$PATH`.
- **OSX**: Follow the instructions in the `README` in [homebrew-riscv](https://github.com/riscv-software-src/homebrew-riscv). Alternatively, you can install the [`riscv64-elf-gcc` Homebrew package](https://formulae.brew.sh/formula/riscv64-elf-gcc), but truthfully I don't know much about the OSX packages.

After you install the cross compiler, verify it exists and runs.

```bash
which riscv64-unknown-elf-gcc
riscv64-unknown-elf-gcc -v
```

### spike: The RISC-V Instruction Set Simulator

`spike` is the golden RISC-V instruction set simulator (ISS).
You give it a RISC-V binary and it will run it for you.

## Let's build and run a tiny RISC-V binary

You'll first need a RISC-V cross compiler for your host architecture (x86 or ARM).
If you're using Arch, you can just run `pacman -S riscv64-elf-gcc`.
OSX users can install the toolchain with `brew install riscv64-elf-gcc`.
If your package manager doesn't contain a RISC-V gcc package, download a RISC-V gcc toolchain [from here](https://github.com/riscv-collab/riscv-gnu-toolchain/tags) (starting with `riscv64-elf`), untar it, and place its `bin` directory on your `$PATH`.
If you're using Windows, use WSL.

### A simple program

Reference: https://github.com/riscv-software-src/riscv-tests/tree/master

### Cross-Compilation with riscv-gcc

### Linker Scripts

### spike: The RISC-V Instruction Set Simulator

#### The SoC Configuration

### Running it in spike

#### What are those beginning instructions?

#### Wait, why won't it stop?


#### What is this magic?

### HTIF

### Bootrom

### CLINT

bootrom, HTIF

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
