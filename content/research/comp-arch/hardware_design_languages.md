+++
title = "An Overview of Hardware Design Languages"
date = 2023-05-04
draft = false
aliases = ["research_topics/hardware-design-languages"]
+++

Over the past several decades, the tools for designing digital circuits have gone from [hand-cutting Rubylith](https://en.wikipedia.org/wiki/Rubylith#VLSI_production) tape to manually lay out transistors and wires, to 
A *hardware design language* is:

## Axes of HDL Design

### Abstraction

### Implementation

### Elaboration-Time Verification

### API

Imperative constructs vs purely functional (monadic)

{{ badge(text="Implementation: eDSL",class="grey") }}

https://mlir.llvm.org/users/
https://llvm.org/devmtg/2020-09/slides/MLIR_Tutorial.pdf

- https://ptolemy.berkeley.edu/publications/papers/07/unifying/index.htm
- Merging CT and DT simulations via tokens and other stuff: https://ptolemy.berkeley.edu/, also see Edward A Lee's book on Actors as an abstraction for this
- Also could be related to mixed-abstraction HDLs and maybe stuff in UMOC / PyMTL3

- Incremental HDLs
    - requires support for dependency tracking at the source level, this could enable partial elaboration. run-to-run is different from call-to-call within the same run (e.g. in Chisel, and other HDLs)
    - Scala compiler plugins or tasty file analysis might help here: https://github.com/lightbend-labs/scala-sculpt, https://contributors.scala-lang.org/t/sculpt-dependency-graph-extraction-for-scala/1507/3

primitives:
notion of time:
execution semantics:
underlying simulation algorithm:

- abstraction
    - comes with primitives, simulation strategy, utility, and domain
- implementation strategy
    - freestanding DSL
    - embedded DSL
    - user-space tracing / AST analysis
    - custom compiler
- type system / compile-time checking
    - nothing at all
    - datatypes matching
    - aggregates matching
    - width matching
    - pre/post conditions on FOL
    - HOL in general
- every language has an abstraction and implementation strategy
    - IRs are freestanding DSLs and usually model one or more abstractions

- https://capra.cs.cornell.edu/latte21/paper/20.pdf (Towards Higher-Level Synthesis and Co-design with Python)
1998 Lava [4], created in Haskell;
2008 Kiwi [10], written in C#;
2010 Clash [2], also in Haskell;
2011 FloPoCo [6], made in C++;
2012 Chisel [3], designed in Scala;
2012 Vivado HLS [14], enabling C and C++;
2013 LegUp [5], built in C;
2014 PyMTL [12, 13], written in Python;
2018 LeFlow [15], created in Python;
2021 PyLog [11], also in Python.
- koika / cuttlesim, bluespec
- also cover IRs: RTLIL, CoreIR

## Generic Event-Driven

These languages support somewhat arbitrary descriptions of event-driven components - the only common primitive construct is some notion of time.

- Verilog / SystemVerilog
- Verilog-A / Verilog-AMS
- LLHD (https://llhd.io/)

Arguably, these two below aren't as general in their modeling approach as the ones above.

- SystemC + TLM
- PyMTL3 (Python) (https://github.com/pymtl/pymtl3)

## RTL Abstraction

These languages deal in the realm of explicit state and logic, both for the data and control path, governed by a clock.

### Deep Embedding of HW Primitives

These are embeddings of hardware primitives (boolean logic, arithmetic, registers, memories) in a general-purpose programming language as a DSL.
Execution of the hardware generator in the host language constructs an in-memory representation of a circuit, which can be serialized to a hardware IR, or emitted directly as Verilog.

- Chisel (https://github.com/chipsalliance/chisel) / SpinalHDL (https://github.com/SpinalHDL/SpinalHDL) (Scala)
    - SCIRT: Bridging the Type System Gap for Circuit Generators (https://www.youtube.com/watch?v=fPl4eZHh1-M&list=PL02hojk7ZTSek-Zro6Zdj_nDlp6khGssJ&index=7)
- Lava (https://ku-fpg.github.io/software/kansas-lava/) / Blarney (https://github.com/blarney-lang/blarney) (Haskell)
- Magma (https://github.com/phanrahan/magma) (Python)
- nMigen (Amaranth) (https://github.com/amaranth-lang/amaranth) (Python)
- PyRTL (https://github.com/UCSBarchlab/PyRTL) (Python)
- Intel ROHD (https://github.com/intel/rohd) (Dart)
- HardCaml (https://github.com/janestreet/hardcaml) (OCaml)

### Custom Compiler

- MyHDL (https://www.myhdl.org/) (Python)
    - This is arguably a 'generic event-driven' language since it is a Python "compiler" that translates directly to Verilog
    - It is implemented using runtime Python reflection (not as a deep embddding of hardware primitives)
- Clash (https://clash-lang.org/) (Haskell)
    - COQ meets CλaSH Proposing a Hardware Design Synthesis Flow that Combined Proof Assistants with Functional Hardware Description Languages (https://media.suub.uni-bremen.de/bitstream/elib/4986/4/Dissertation_Bornebusch.pdf)

### Custom Language

- Pyrope (https://github.com/masc-ucsc/pyrope_artifacts) (Python-like syntax)
- Veryl (https://github.com/dalance/veryl) (Rust-like syntax)
- Silice (https://github.com/sylefeb/Silice) (C-like syntax)
- Filament (https://filament.rachitnigam.com/) (Rust-like syntax, timing-aware type system)
- Reticle: a virtual machine for programming modern FPGAs (https://dl.acm.org/doi/10.1145/3453483.3454075)

## Above RTL But Below Full-Blown HLS

- Guarded atomic actions
    - Bluespec Verilog / Bluespec Haskell (https://github.com/B-Lang-org/bsc) (Custom, Verilog-like syntax / Haskell)
    - Kôika: A Core Language for Rule-Based Hardware Design (https://github.com/mit-plv/koika) (Coq)
        - The essence of Bluespec: a core language for rule-based hardware design (https://dl.acm.org/doi/abs/10.1145/3385412.3385965)
    - Kami: A Platform for High-Level Parametric Hardware Specification and Its Modular Verification (https://plv.csail.mit.edu/kami/) (Coq)
- Pipelining automation / ready-valid dataflow
    - PipelineC (https://github.com/JulianKemmerer/PipelineC) (Custom, C-like syntax)
    - TL-Verilog (https://www.redwoodeda.com/tl-verilog) (Custom, Verilog-like syntax)
    - Shakeflow (https://github.com/kaist-cp/shakeflow) (Rust)
    - Liam: an actor based programming model for HDLs (https://dl.acm.org/doi/abs/10.1145/3127041.3127060) (Pyrope)
    - Spade (https://spade-lang.org/) (Custom, Rust-like syntax)
    - DFiant (https://github.com/DFiantHDL/DFiant) (Scala)
    - PDL: A High-Level Hardware Design Language for Pipelined Processors (https://www.cs.cornell.edu/andru/papers/pdl/pdl-pldi22.pdf)
- Specification languages
    - Sail (https://github.com/rems-project/sail)

## HLS

- Spatial: a language and compiler for application accelerators (https://dl.acm.org/doi/abs/10.1145/3192366.3192379)
- Calyx (https://calyxir.org/)
- XLS (https://github.com/google/xls)
- Dahlia (https://capra.cs.cornell.edu/dahlia/) (frontend for Calyx)
- Vivado HLS
    - FPGA HLS Today: Successes, Challenges, and Opportunities (https://dl.acm.org/doi/full/10.1145/3530775)
- Catapult
- LegUp
- Synphony
- SystemC TLM HLS
    - A modular digital VLSI flow for high-productivity SoC design (https://dl.acm.org/doi/abs/10.1145/3195970.3199846)
    - Intel's SystemC compiler (https://github.com/intel/systemc-compiler)
    - Bambu (https://github.com/ferrandi/PandA-bambu)
- μIR -An intermediate representation for transforming and optimizing the microarchitecture of application accelerators (https://dl.acm.org/doi/abs/10.1145/3352460.3358292)

## Intermediate Representations

These can represent circuits at one or more of the above levels of abstraction

- LLHD (https://dl.acm.org/doi/10.1145/3385412.3386024)
- Circt's dialects (https://circt.llvm.org/docs/Dialects/)
    - RTL-level dialects: `hw`, `seq`, `comb`
    - HLS-like dialects: `handshake` + `esi`, `pipeline` + `ssp`
- FIRRTL (https://github.com/chipsalliance/firrtl) / RTLIL (https://github.com/YosysHQ/yosys/blob/master/kernel/rtlil.h)
- LGraph (https://github.com/masc-ucsc/livehd)
