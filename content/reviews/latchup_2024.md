+++
title = "Latch-Up 2024"
date = 2024-05-07
draft = true
+++

[Latch-Up 2024](https://fossi-foundation.org/latch-up/2024) was held in Cambridge from April 19-21, 2024.
Here are some talks I found interesting, which were recently posted to the [FOSSi Foundation's Youtube channel](https://www.youtube.com/@FOSSiFoundation/videos).
The [talk slides can be found here](https://drive.google.com/drive/folders/1vPCOoBrt5J2O4a-tyj9oJFg9fsEGehws).

## The CIRCT Talk from Latch-Up 2023

["CIRCT: Open Source Circuit IR Compilers and Tools" - Mike Urbach](https://www.youtube.com/watch?v=w_W0_Z3n9PA).

- They presented the usual thing
- The core dialects of `HW`, `Seq`, and `Comb` are produced from the `firrtl` dialect or the `moore` SV frontend dialect and lowered to the `SV` or `SystemC` dialect and then emitted
- SSA oriented dialects, even for the more graph oriented data structures that are more natural for hardware (due to being designed within the LLVM framework)
  - Explicit wires are required to describe circuit structures that aren't purely feedforward but have some feedback past a timing barrier (e.g. register, SRAM). Ordering of statements within a circt netlist matter.
- The SystemVerilog emission has been crafted carefully to ensure it looks like a human wrote it
  - Of course, when the source netlist comes from FIRRTL, many intermediary nodes are created during lowering, so there are still generated and temporary net names. They take efforts to inline as many nets as they can to produce readable SystemVerilog.
  - They have lots of control over the features used in the emitted SystemVerilog to support different tools and coax tools to do 'the right thing' with the Verilog they are given
- The `handshake` and `esi` dialects seem interesting for lightweight HLS-like dataflow pipelines
  - There are a bunch of these random dialects, but there is no usable frontend for them - seems like a lot of compiler infrastructure without a proper application/design-driven motivation
  - Interactions between these dialects like `pipeline` and `calyx` also seem undefined. There seems to be 2 types of dialects
    - Dialects for analysis (`ssp`, `loopschedule`, `dc`): During lowering of other dialects, specific problems are turned into these analysis dialects and the results are extracted to guide the lowering.
    - Dialects for lowering to RTL (`calyx`, `firrtl`, `handshake`), which seem to use the analysis dialects as needed


## Chisel 6/7

- ok looking at the chisel6/7 talk, the things that seem interesting are: verdi debug integration, firtool packaging (which should save some conda dependency annoyances), minor SVA support, probes (could actually be useful for generating state injection harnesses), eventually Scala 3 support (very nice, seemed like a lot of work to rewrite macros)
- the thing that seem iffy are: intrinsics (this is just a pure hack to avoid extending the IR), 
