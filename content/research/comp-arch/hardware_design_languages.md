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
- Control language
  - Cement (Rust-based HDL, FPGA 2024, 'recipes' tiny eDSL language for control flow synthesis, mostly structural data flow description)
- Specification languages
    - Sail (https://github.com/rems-project/sail)

## Mid-Level HLS

- Calyx (https://calyxir.org/)
  - Dahlia (https://capra.cs.cornell.edu/dahlia/) (an example frontend for Calyx)
- XLS (https://github.com/google/xls)
- Spatial: a language and compiler for application accelerators (https://dl.acm.org/doi/abs/10.1145/3192366.3192379)

## HLS

- HeteroCL (generates C++ to be processed by a regular HLS toolchain)
- Vivado HLS
    - FPGA HLS Today: Successes, Challenges, and Opportunities (https://dl.acm.org/doi/full/10.1145/3530775)
- Catapult
- LegUp
- PandA-Bambu (https://github.com/ferrandi/PandA-bambu)
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

- Chisel treats these as the same (At least originally, now changing), but they have always been different in SV. Is there a common thread here?
    - instance vs module type
    - literal vs signal
    - struct vs interface

- clock generation done by library vs testbench (https://github.com/amaranth-lang/amaranth/blob/a9d03805fff8c3d4f6769320323dbf44619fe422/tests/test_lib_fifo.py#L334)
    - in amaranth, clocks are bound to testbench processes, they only run as needed
    - move this to the simulator API document
    - Clocks should be special constructs in both the frontend and testbench
        - For the design, the enables of a clock are critical to be understood by the simulator
        - Don't use event driven constructs to design a clock and try to re-infer the clock based on those - just have the clock be a primitive in the first place!
        - For the testbench it should be the same

### Discussion with Satnam Singh - 9/13/2023, Wed

- modern day traction of edsls for hw design
- what is the new lava
- what features are missing?

lack of incremental dv holds us back
make verif, spec, and design move together
use sv better
develop quality of vcs, code review, ci, testing, fuzzing, quickcheck, for hardware (like software)

I just talked to Satnam Singh (https://fpcastle.com/satnam/) and he was still a bit salty that Chisel never cited Lava :laughing: . It seems like he has mostly given up on new HDL evangelism and is just doing more type-level proofs in embedded DSLs for hardware (https://github.com/project-oak/silveroak). I think a common thread between him and Jin Yang is the idea that hardware design and verification should be done in lockstep (incrementally) - the verification collateral, design, and specification should move together.

He also commented on the difficulties of adopting new HDLs in existing semi design houses - Google X allowed him to try out BlueSpec for TPU and SilverOak for OpenTitan, but both efforts didn't have any upper management advocacy and fell apart. That's why he now works for a startup - but it seems he's still frustrated by how poor the software engineering is on the hardware design team. He mentioned that just using SystemVerilog better would be a big improvement - it seems many companies restrict its feature usage (e.g. no structs as ports) in ways that make the language seem a lot less capable. Overall a very interesting person and he has a lot of perspective on using and advocating for formal in industry

Also on the topic of semantically analyzing the host language in order to prove properties about 'for all' X this circuit satisfies property Y:
this can be done if 1) the host language is very restricted and we can use quantified proof techniques or 2) we can analyze all the semantics of the host language and build a higher-order proof manually.
The former can be a very restricted subset of Verilog and the latter must be a proof assistant: dafny coq lean agda (maybe idris) (forget about the rest, and certainly OCaml/Haskell/Scala don't fall in this category - their semantics mixed with the generator semantics are just too much to handle)
    - critically the syntax for type-level manipulation should be the same as value-level manipulation (idris is good here, but not haskell or other macro oriented languages for type-level metaprogramming, including Scala)
    - see SilverOak and Kami and all of Adam Chlipala's work as moving in this direction
    - In general, Satnam wants to push PL type-level features to the max (dependent, linear, refinement types) to verify circuits at the type-level across all parameterizations

### Letter to Chris' Student

Hi Peitian,

This is the paper I was talking about from LATTE 21: https://capra.cs.cornell.edu/latte21/paper/19.pdf

I think the high-level directions for HDLs I'm interested in are:

    Preserving semantics down the stack into synthesis, but doing so in a way that we can write passes on the IR that operate on a small set of primitives and have them translated by the compiler framework to operate on a high-level IR
    Formalizing semantics for HDLs. Especially dealing with X's in an intelligent way that's integrated into the design language/frontend. For X's that we can prove never escape past reset and N number of cycles, allowing zeroed initial state; for X's that we can't prove don't escape, either use explicit resets, or randomize state sufficiently to have confidence that nothing will break, or strengthen the formal methods with dynamic information, or pick out certain paths for the simulation tool to use a more-realistic X-prop mode on (VCS doesn't have this level of granularity, the X-prop mode must be set for the entire simulation).
    Encoding more VLSI/FPGA constructs in the frontend HDL and furthermore as IR primitives. Clocks, resets, power domains should be first-class objects. Checks that composition of these primitives should happen as part of the frontend and IR compilation. Functional things like retention flops should have formal checks for whether they can restore the state of a block correctly. Power domain crossings should be aware of the power state of each domain. UPF/CPF/SDC generation should come from the frontend. This information should propagate to the simulation tool to perform power-aware/DVFS-capable simulation, without relying on the UPF format and VCS/Xcelium.
    Incrementally elaborated HDLs. A trend that has emerged for build systems (see Bazel, Buck2) is that not only are the builds executed incrementally (as they did from the days of Make lol), but also the build *descriptions* themselves are being compiled incrementally. This is because reading build descriptions themselves takes a long time. Same problem shows up in HDLs when circuits get really large. Within-run caching in HDL elaboration is easy enough - just have an API for creating an instance and creating several instances of them (see the Chisel Instance API). But run-to-run caching is much more difficult since it requires us to know what source code changed and what it could affect. One solution is a content-addressed language (e.g. Unison), but more practically we could analyze the incremental compilation output of e.g. the Scala compiler and understand what cache entries to invalidate.

Hope to talk with you again soon! Especially interested in the work you and Chris are doing for evolving PyMTL in the coming year.

Thanks,
Vighnesh


# Chisel Warts
## SpinalHDL Cool Stuff
- Zero width wires are supported
- [Design of VexRISCV core with plugins blog post](https://tomverbeure.github.io/rtl/2018/12/06/The-VexRiscV-CPU-A-New-Way-To-Design.html)
- Check out all the SpinalHDL standard library stuff, the Flow and Stream primitives are nice along with the BusMapper library which is easy to use and simple
- The FSM library is also very nice and makes the FSM code really easy to read versus explicitly encoding stuff inside each state switch statement
- Look at how cases are emitted from SpinalHDL, makes a lot of sense and looks like a human written case
- The simulation construct uses verilator only and scala-continuations for fork-join implementation
- The SpinalHDL guy wrote a [critique of Chisel here](https://www.reddit.com/r/chisel/comments/4ivevd/spinalhdl_a_chisel_fork/), which raises many good points and is similar to Google's issues
- [Critique of MyHDL from SpinalHDL creator](https://www.reddit.com/r/FPGA/comments/4lgfvn/tired_of_vhdlverilog_limitation_for_rtl_spinal_hdl/d3ok9yo/)
## MyHDL
- [Examples of generated MyHDL netlists](http://docs.myhdl.org/en/stable/manual/conversion_examples.html#optimizations-for-finite-state-machines)
    - This is very impressive since this is what people want. Easy to read and debug, looks like a human wrote it.
- [Chisel critique from MyHDL creator](http://www.jandecaluwe.com/blog/chisel-flawed-approach.htm)
- MyHDL has a very different and a very nice (in my opinion) approach for hardware modeling in the form of 'reactive' streams (in particular Python yield-based generators) - this can also map nicely to automatic hardware synthesis, but is not so straightforward. It is ideal for modeling concurrency without threading primitives nevertheless.
## Etc
- Chisel 2 to 3 regressions
    - No C++ backend which was faster to emit and compile AND faster to execute than verilator
        - This was a killer feature because the C++ backend was fast and cycle-accurate
    - No explicit compile flow for FPGA vs ASIC
        - Things like clock muxes, clock gating, DVFS, negedge clocking, etc. have very different implementations and cell instantiations
        on FPGA vs ASIC; they are natural to either blackbox generically or add to the FIRRTL IR explicitly and emit correctly.
    - Speed of elaboration and Verilog emission. Chisel 2 was at SpinalHDL speed, while Chisel3 has regressed significantly and is 2-5x slower.

## Chisel Stdlib Circuits

### Priority Queue

- https://github.com/joey0320/chisel-priorityqueue
- https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9730477
- https://ieeexplore.ieee.org/document/895938
- http://fmdb.cs.ucla.edu/Treports/140013.pdf
- Joonho asked me to put something like this, properly verified and generic, into the chisel standard library in November 2022
- I asked Sungwoong (an undergrad) to take a look at it, but he is way too new to digital design to understand what to do - so I asked him to take 151 next semester and maybe we can get back to this later
- I also met Robert P. at the BWRC retreat on Nov 15 2022 and he was currently working with Rebekah on some digital test circuitry for an analog tapeout - he seemed interested in working on more digital stuff (potentially with me) - if so, he would be ideal for this project, he is a competent digital designer


# HW Libraries
- [ ] Look into extraction of diplomacy and bus interfaces from Rocketchip
- [ ] Add tests to ucb-bar/asyncqueues and mill build support along with documentation
- Chisel3 stdlib (so far only a Barrel shifter: https://github.com/chipsalliance/chisel3/commit/6d4e6edc9a62c166af95b41b6aea9634d34275ed)
- Other things
    - Async queue
    - Priority queue w/ various fancy flags
    - Queue with element removal support
    - Queue with tagging support
    - SHA256
    - All the stuff here: https://github.com/freechipsproject/ip-contributions
        - Bitonic sorter, CORDIC, AES, UART, FIFO variations, SPI to Wishbone, DecoupledIO component helpers, ECC
    - CAM (emulated for FPGA) (or multicycle) (existing impl: https://github.com/sifive/sifive-blocks/blob/master/src/main/scala/devices/chiplink/CAM.scala)
    - Hash tables
    - Bloom filters
    - DSP tools (porting to new Chisel or rewriting completely)
- Write formal / dynamic tests for each of these
    - e.g. explore how to port the ZipCPU formal harness for an async queue to Chisel using our formal support (and perhaps the clock stuttering transform)
- A careful study of these structures against their Verilog equivalents in the context of post-synthesis PPA (perhaps for FPGA first, then ASIC)
    - I think there is significant Chisel to Verilog emission issues that prevent optimization that's as good as hand-written Verilog
- fifo, queue
- arbiter, priority arbiter, hold arbiter (control over an interface for multiple cycles)
- circular buffer
- cam
- designware divider / multiplier
- get dsptools maintained again
    - rewrite all the components one by one
    - each chunk is relatively independent
- sha256
- md5
- merseene twister
    - see rand blocks from Jingyi, compressed sensing
- Mempress, add pointer chasing
- firrtl ppa estimator
- width converter at byte level (dynamically select N bytes from N byte input)
- hardware hash table
- banked memory w/ throughput sustainability
- max / min circuits (general reduction circuits / tree style)
- aggregation circuits (cumulative sums w/ prefixes / tree sum)

# Hardware Libraries
- There is a nice FPGA-optimized floating-point operator library which is a C++ VHDL generator caled [flopoco](http://flopoco.gforge.inria.fr/)
    - Originally linked from [here](https://www.reddit.com/r/FPGA/comments/alewi7/highquality_verilog_math_libraries/)
    - It would be nice to port this to Chisel to potentially compete against hardfloat
    - Also useful to have a way of spitting out Verilog from a webapp maybe
- There are a bunch of VLSI CAD courses on Coursera offered by UIUC on digital CAD flows and some analog stuff, worth checking out if planning to build a tool


# Chisel Experimental
- [ ] X propagation analysis due to partial case statements (have a pass which compiles all register input logic cones to see if there's any setting of the inputs which could yield an unknown state, use some SAT solver)
    - [ ] More general analysis of X propagation (see [Cliff's paper](http://www.sutherland-hdl.com/papers/2013-DVCon_In-love-with-my-X_paper.pdf) for reasons why X prop ignorance in the Chisel style could be an issue, and set out to prove it)
    - See [Prakash's X-prop pessimism correction tool](http://www.deepchip.com/items/0583-02.html)
    - Need a good balance between RTL X-optimism (just fake results) and gate-level X-pessimism (which sometimes needs formal technique to fix)
- [ ] FIRRTL pass to add assertions on overflow prevention to annotated or all registers (would have been very useful when debugging CORDIC)
    - This could work at the UInt() or SInt() level on native add/sub operations at the HiFIRRTL level
- [ ] Look at how Cadence autoformal (formal apps) adds assertions to the design via static analysis (like `parallel_case` automatically assert that cases are exclusive, like bounds/address checkers on memories, check dynamic addressing of bitvectors, etc.)
    - [ ] Theres some [stuff here](https://www.electronicdesign.com/industrial-automation/11-myths-about-formal-verification) on formal apps
        - Connectivity checking, tracing clock and reset networks, avoiding propagation of unknown values (x-prop assertions and initialization), fault analysis passes and assertion analysis
    - Analysis of assertion coverage (what design state spaces have been covered by assertions?)
- [ ] Chisel coverage analysis (look at what has been done in RFUZZ and see if we can extend coverage from RTL to lines of Scala code)
    - UCIS (Unified Coverage Interoperability Standard)

# What things should be fixed? (Chisel 4)

- literal construction should be unified with hardware binding (for base types, bundles, records, vectors, and enums)
    - use a functional API
- hardware construction outside a module context
- re-use of the same hardware construction code to build hardware as well as interpret it in memory (see JAX which supports autograd via an internal Python language representation as well as eager, but slow evaluation on the same representation via interpretation)
- prevent re-elaboration of modules already constructed in memory (be able to automatically memoize things by enforcing immutable and serializable configurations)
- downstream usage of the RTL - serialize all the hardware construction metadata automatically to be used in ASIC tool scripting and RTL testbenches
- software (Scala)-based hardware simulation and hardware elaboration contexts should be unified in user-facing API but be compiled down to different forms based on context
- width checking and other sanity checks should be done as early as possible (and be reported as errors) - in very high level firrtl ideally
- x-propagation needs to be handled correctly
    - for rtl simulation - only randomize the few registers that don't need a reset, but cause downstream failures due to (too pessimistic) x-propagation
    - for asic - build in a formal analysis pass that verifies that the few marked registers actually do not permit x escape
    - for x-injection - add assertions that none of the inputs are x's via a compiler flag
    - This is something that's completely elided by existing languages that don't distinguish between X as unknown and X as arbitrary (Chisel + SFC and Circt do this - just treat unknowns as zero and random init)
- built-in boolean optimization to mitigate x emission in synthesis flows

- What about Clash? What are the primitives there? Can this be the basis for Chisel 4? https://www.youtube.com/watch?v=HAhfWsvpt7E
    - Clash uses compiler approach vs Lava which uses deep embedding approach similar to Chisel

- built in modeling language (SystemC TLM level)
- automatic verification of refinements
- ability to inject HLS (simulated as imperative code initially, then refined) in RTL via a unified API
    - use HLS for control flow, use RTL for state declaration
    - be able to generate simulators at every level
    - be able to swap in/out software models or hardware RTL at module granularity
    - use a unified HLS IR (e.g. Calyx)
    - write the testharness using the same HLS IR (w/ SimCommand)

- direct reduction to MLIR HW dialect
    - Can we lower nearly everything, including the modeling dialect into the MLIR framework and use it to emit hybrid compiled models?

- built-in general purpose diplomacy like library - be able to use a general purpose constraint solver to resolve module connectivity (at higher level of abstraction than RTL level modules, but probably transaction interfaces, or even function calls - just like PyMTL3, PyMTL)

- subword assignment
- incremental synthesis / elaboration for IDE viz (connectivity analysis, clock propagation)
- incremental elaboration in general
    - this means that generators need explicit parameterization
    - type ModuleP[P] = P: Serializable => Module
    - then memoize on P for module construction - this should be built into the Chisel frontend and elaboration - right now a major hack is required with Instance and so forth
        - https://vigoo.github.io/desert/docs/codecs/
    - see the Module abstraction Dan uses in hdl21, clearly separating the Generator and a named Parameter struct enables this clean memoization

- https://hackage.haskell.org/package/clash-prelude-1.6.4/docs/Clash-Signal.html#g:1
- Can the HDL directly emit a sea-of-nodes IR representation and later passes can 'group' these into 'modules' logically?
    - This way the optimizations like duplicate instance identification, DCE, and so forth can directly be performed on the CDFG and nodes simply have source markers which we can use for grouping later
    - This also enables easy 'boring' through modules without explicit boring and without a boring pass - simply adjust the module node marker itself!

- https://github.com/blarney-lang/blarney (Blarney - Haskell Lava-like DSL for hardware construction - very nice!)

- Chisel 4 - integrated design environment - modeling, perf correlation, verification, formal, RTL
    - SoC level and chiplet-level and package-level and PCB-level construction are baked in primitives
    - native notion of "HLS" or something higher level than RTL (TLM or even higher)
    - FPGA prototyping and bringup are first-class concerns
    - PPA evaluation baked into the language and the design iteration loop
        - Incremental first flow
    - Basically a RTL design language that isn't just about RTL design
    - All aspects of design and verification and validation, including ECOs, and physical design, and power and clocks, must be part of the language itself
    - emulation first
    - semantic preserving - only at synthesis time should semantics be blasted away - as much as possible hold onto high level constructs (including parameterization and aggregates and potentially even looping constructs)
        - this might have implications on how restricted the hardware design language is - and how much of the host language facilities you can use
    - graph first representation - value driven API (no functions returning Unit)
        - module boundaries are a later addition to a netlist
        - boundaries can be RTL signals, analog signals, event driven signals, TLM signals, etc.

- The evolution of HDL and the future of more integration
    - 1st gen language: SPICE
    - 2nd gen language: Verilog (event driven, discrete events, discrete state)
    - 3rd gen language: SystemVerilog
    - 4th gen language: Chisel, Clash, Lava, SpinalHDL, ... (this is still RTL-level design ONLY, but using a general purpose language + deep embedding / custom compiler)
    - 5th gen language: SystemC (higher-than-RTL), SystemVerilog for DV + UVM / Vera / specman e (tighter verification integration), Kami (formal first hardware generators), LiveHD (incremental first RTL design)
    - 6th gen environment: ???
- Host languages:
    - DSL ergonomics
    - Desirability of type system
    - Ecosystem and testbench integration
    - Candidates: Python, Scala 3 (strongest metaprogramming imo), Haskell, Kotlin, Julia
        - Graal AOT compilation (LLVM flow + JIT for JVM bytecode)
        - In-line JIT (like JAX or others)
- Multi-stage elaboration, each stage should be able to mutate the design a bit in a controlled way, multi-stage macros where the macros aren't operating on a Scala AST directly, but the circuit ADT, but with access to the ADT's construction objects (e.g. intermediary variables in the function)
    - Diplomacy is an example of high level elaboration
    - Chisel aspects is a low-level example (https://github.com/chipsalliance/chisel/blob/v3.6.0/core/src/main/scala/chisel3/ModuleAspect.scala#L15) (https://javadoc.io/doc/edu.berkeley.cs/chisel3_2.13/latest/index.html?search=aspect)
    - We want something like aspects, but with a functional API - this is critical for being able to make small changes (instrumentation) to IPs once they have already been stamped out without changing their code. e.g. adding printf instrumentation for perf counters, or adding test instrumentation for BIST
    - Also could be used for stubbing out / substituting a module for another one within a larger module without having to rewrite it in a separate codebase

- fine grained human parallelism for hardware design
    - how can many people collatborate on a small project and actually get more done?
    - automatic model to RTL correlation for verification, power and perf
    - unified design and PD-aware environment
    - this is just the next-generation hardware design environment
    - issue: you have a block you want to develop - there are five people ready to work on it - however, more than one person working on the block will likely lead to worse productivity since early stage design needs to be in the head of one person - no opportunity to exploit human parallelism
    - I argue this is mainly a tooling problem rather than something intrinsic to the hardware development process itself

## Standard Library

- chisel3.std
- ip-contributions
- priority queue from joonho
- rocket-chip util folder

## Chisel Bootcamp / Docs

- [ ] Fix up the chisel-bootcamp
    - [ ] Get bootcamp running locally with specific almond version
    - [ ] Go through FIRRTL section in anticipation of statevec prediction extraction of control state vector
    - [ ] Try to bump bootcamp to Chisel 3.5 (along with bumping almond to the latest version and using the latest JVM and Scala versions)
    - [ ] PR my changes to bump

- Bump to the latest Chisel and Scala versions.
- Remove all deprecated stuff.
- Make the examples easier to understand (especially the DSPtools stuff).
- Fix link to firrtl spec in chisel-bootcamp (see Ch 4.1)

- [ ] Can we just make a better 'bootcamp'? Anyways, no one really enters code in the bootcamp and tries it out and iterates. It is just intended for reading.

- I'm thinking a revamped Chisel documentation based on an executable Jupyter book
- Cover all the common things to do right away
    - Write a unit test, emit a VCD, select a simulator
    - Generate RTL
    - Generate HiFIRRTL, CHIRRTL, LoFIRRTL
    - Maximize amount of Verilog overlap so people know the equivalent constructs between SV and Chisel


- https://github.com/chipsalliance/firrtl/wiki/transform-writing-manual
- https://gist.github.com/seldridge/0959d714fba6857c5f71ebc7c9044fcf

## Chisel Bugs

- [ ] Look into Chisel Vivado SRAM inference not working correctly
    - https://github.com/eugene-tarassov/vivado-risc-v/commit/8c2d236b2349d6edee625a393f90f6a323e2c637
    - See Tianrui's workaround using BlackBox'ed Verilog (the vlog is in his assertions repo): https://github.com/tianrui-wei/chisel-memory/blob/master/src/main/scala/SinglePortMemoryWrapper.scala

- [ ] Investigate Tianrui's Chisel v SV synthesis showdown

- Potential things to benchmark between Chisel and SV:
    - x's for synthesis comb opt vs Chisel DontCare (Chisel decoder via espresso is an alternative, but requires specific user intervention)
    - unique case/if vs chisel mux chain (see Tianrui's example)
    - SV enum vs raw localparam / constant encoding (supposedly using Enums may be better than inlining constants when it comes to Enum typed nets and synthesis being able to convert them to one-hot coded under the hood)

- Comparison papers:
    - A Comparative Study of Chisel for FPGA Design (ISSC 2018) https://ieeexplore.ieee.org/document/8585292
    - Comparative Analysis between Verilog and Chisel in RISC-V Core Design and Verification (ISOCC 2021) https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=9614007
    - A Comparative Study of Chisel and SystemVerilog, based on Logical Equivalent SweRV-EL2 RISCV Core (DVCon 2022) https://dvcon-proceedings.org/wp-content/uploads/A-Comparative-Study-of-CHISEL-and-SystemVerilog-Based-on-Logical-Equivalent-SweRV-EL2-RISCV-Core.pdf

## Chisel Features

- [ ] Type support for onehot nets?
    - Make onehot an opaque type
    - Addition on one-hot nets becomes shifting
    - Can cast to UInt
    - Indexing is converted to a direct lookup via mask
- [ ] chisel formal support for reset checking + dont care propagation
    - Jasper has functionality to check which registers genuinely need resets
    - Can we integrate this as a pre-processing formal pass?
    - And just emit regular SV with only selective resets (everything else is verified good being non-reset or with a hardcoded initial value)?
    - Requires some deep understanding of x-prop
    - Also can integrate this with dont-cares for synthesis for better combinational optimization
- [ ] Chisel CDC (Clock-Aware) Integration
    - [ ] Create dummy Chisel project repo
    - [ ] Add a few circuits that use a CDC internally
    - [ ] Add some CDC specific circuits (synchronizer, grey code annotation, etc.)
    - [ ] Think about what needs to be emitted (e.g. xdc/sdc clock constraints)
    - [ ] Send to Kevin for more ideas
    - https://docs.google.com/document/d/1NvLiQiGHgzhp-xLO__8tHXgJGUPC2FiCuSDrJ8kB_XM/edit#heading=h.pi1xt54bx3n3
    - https://docs.google.com/document/d/1eNT_bgSnVkjymvXULtAhMia81HmWfJxphnfedc1diX0/edit#heading=h.mutzmdjg9ufw
    - Talk on 11/05/21
        - Clock-aware Chisel CDC checking
        - setting up a repo with examples of multiclock circuits
        - goal is to create a set of Chisel clocking annotations that can be used to identify clock domains, crossings, and CDC paths
        - emit xdc/sdc constraints consistent with the paths + visualize the clock domains
        - later: reset domains (did John work on this before?)
- An IR which supports arbitrary 'views' and runtime translation
    - e.g. a pass can declare what primitives it would like to see in the graph it processes
        - e.g. i don't want to see modules (flatten everything), i don't want to see onehot types or aggregate nets
    - then the compiler will lazily stream a view of that to the pass, which the pass can manipulate/write or just read (both require special support and some restrictions)
    - the compiler will translate back and forth as we stream into the pass and serialize into the next in-memory representation for the next pass
- Another interesting thing is automatic pass fusion - can this be accomplished with a principled pass type?
    - Some similar ideas are present in LiveHD

## Dealing with Undefined Signals and Xs

- places X injection can happen from the dynamic simulation itself (not due to init)
    - out of bound read/write from vector or SRAM
    - firrtl read ports with enable signal where the read data is invalid if enable is false
    - read under write with undefined behavior
    - writes to same address from 2 different write ports
    - division by zero
- Kevin uses arbitrary state to represent X's in formal memories
    - Make sure that the circuit doesn't depend on the X value itself!
    - https://github.com/chipsalliance/firrtl/blob/1.6.x/src/main/scala/firrtl/backends/experimental/smt/random/UndefinedMemoryBehaviorPass.scala
    - https://github.com/chipsalliance/firrtl/blob/1.6.x/src/main/scala/firrtl/backends/experimental/smt/random/InvalidToRandomPass.scala
- Another case is for a case statement with no default (or rather the default is 'x' meaning arbitrary)
    - This is a difficult case to handle, which is why Chisel never emits 'x's for the synthesis tool to optimize
- What's the right strategy to deal with undefined states? The FIRRTL approach isn't right of just forcing only 0/1 values in the circuit.

## Not Separating Structs and Interfaces (with directionality) is a Problem

- Look at how complicated this is: https://www.chisel-lang.org/chisel3/docs/explanations/connectable.html#connecting-components-with-fully-aligned-members
    - This seems to stem from allowing directionality in bundles

> I want to use OpenROAD and ASAP7 to measure the setup time for a module.
>
> To do so, I need for a Foo module to create a FooTop module where I register all inputs and outputs.
>
> How can I best do this in Chisel?
>
> I want to do something like:
>
> class FooTop extends Bundle {
>  val io = IO(new FooBundle)
>  val bar = Module(new Foo)
>  val reg = Reg(new FooBundle)
>  io <> reg
>  bar.io <> reg
> }
>
> https://scastie.scala-lang.org/VFoKDXSrRUmtTIuDbHTKtA
>
> Error message: firrtl.passes.CheckHighFormLike$RegWithFlipException:  @[src/main/scala/main.scala 19:15]: [module FooTop] Register reg cannot be a bundle type with flips.


> There are likely better ways of doing this than what I suggest below.
>
> You can strip the type of the bundle to make it passive before creating the register. You then need to do per-field connections to the register.
>
> E.g., something like the following will work:
>
> ```
> class Foo extends Module {
>   val a = IO(Flipped(new Bar))
>   val b = IO(new Bar)
>
>   val r = Reg(Output(chiselTypeOf(a)))
>
>   r.x :<= a.x
>   r.y :<= b.y
>
>   b.x :<= r.x
>   a.y :<= r.y
> }
> ```
>
> The better approach is that there is likely a pithy way to do this with either: (1) the new connection operators or (2) a utility. What you really want is a way to have the left-hand-side connect (in a flipped or aligned fashion) ignoring the type of the right-hand-side passive thing.

## No Support for Asymmetric Memories as Chisel Primitives

- The common question as to which primitives should be specified in the language directly
    - Chisel has regular SRAMs, but it can't emit banked asymmetric read/write SRAMs in a way that Quartus can infer
    - Chisel now has explicit SRAM instantiation instead of inferred read/write ports and enable logic: https://www.chisel-lang.org/chisel3/docs/explanations/memories.html

> Does Chisel allow defining memories with ports of varying width?
> For instance 2 x 64 bit read and one 64 bit write port and one 512 bit read or write port?

> Example of Verilog code with ports of different widths: https://www.intel.com/content/www/us/en/docs/programmable/683082/22-1/mixed-width-dual-port-ram.html

```verilog
module mixed_width_ram // 256x32 write and 1024x8 read
( input [7:0] waddr, input [31:0] wdata, input we, clk, input [9:0] raddr, output logic [7:0] q );
    logic [3:0][7:0] ram[0:255];
    always_ff@(posedge clk) begin
        if(we) ram[waddr] <= wdata;
        q <= ram[raddr / 4][raddr % 4];
    end
endmodule : mixed_width_ram
```

> There is no support for representing this in FIRRTL. There is no corresponding Chisel API for representing this. This seems like Altera is providing a very convenient way to describe banked memories. Doing this in Chisel would be more natural to handle with a wrapper around a memory to do the banking for you (which sounds like exactly what you are doing). There is some benefit to this as it then isn't specialized for an Altera-specific inference pattern.

### Another Case of Semantics Being Lost

> I am getting one clock per read and write port, even if there is a single clock in my design where SyncReadMem() is invoked.
> Is there a way to tell SyncReadMem() to generate a .sv file for this SRAM with a single clock?

```verilog
module registers_32x64(
  input  [4:0]  R0_addr,
  input         R0_en,
                R0_clk,

  input  [4:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [63:0] W0_data,
  input  [7:0]  W0_mask,
  input  [4:0]  W1_addr,
  input         W1_en,
                W1_clk,
```

> There is currently no way to do this. Keeping this as-is, where you get a memory (or a blackbox module) with this predictable lowering has ABI benefits---you know what you're going to get and it's not a function of whether two clocks are wired together trivially or, as some might expect, in a more complicated way somewhere earlier in the hierarchy.
>
> Chisel or FIRRTL don't have the ideal representation for clocks and resets as these are closer to "global resources" rather than things which are ports and can be put into wires or registers. Reworking Chisel in this direction would help with the desired emission strategy as there is then an unambiguous way to say that two ports of a memory have _the same clock_ as opposed to _the same wire_.
>
> tl;dr: Wiring the ports together is the right way to proceed or to put the memory in a wrapper module in Chisel.

- One more thing, right now we have to make distinction between things passed as constants in ports vs parameters
    - e.g. the RocketTile has the hartid passed in as a port vs a parameter because if it was a parameter, then each instance of RocketTile would be unique and they wouldn't be deduped! also the instance + cloning (Instance API) wouldn't help here!
    - Can we unify these use cases? Make it possible to declare it as a parameter! Constant valued ports should not exist, instead parameters should be used and the frontend should use content-addressing of generated hardware IR to produce largely the same module but with small diffs

- On width inference and subword assignment and last-connect semantics (and 'when' 'behavioral' conditional blocks too)
    - limit width inference everything except ports and registers (only intermediate nets)
    - how about when inference - what about last-connect semantics that cause multiple drivers that we need to resolve?
    - can we also do subword assignment? is this even desirable? look thru prior issues - leads to issues with comb loop detection and multi-driver style assignment
- Prior work on subword assignment
    - https://github.com/chipsalliance/firrtl/pull/2545/files
    - https://github.com/chipsalliance/firrtl-spec/pull/26
    - Weirdness from not having subword assignment: https://github.com/ekiwi/paso/blob/ad2bf83f420ca704ff0e76e7a583791a0e80a545/benchmarks/src/benchmarks/aes/TinyAES128.scala#L181
    - https://github.com/llvm/circt/pull/3658

## New HDL/IR

- Base hardware types should be bitvector (with no operators except comparison), boolean (with boolean operators), uint/sint (with signed-ness arithmetic operators and logical comparison operators)
    - Enum should be first-class - and represented just like Scala enum
    - Consider support for runtime tagged unions right up front
- uint/sint should have representations specified in the type or value (binary, grey-coded, one-hot) and the arithmetic should map onto those representations
- width inference should work for all types in the IR backend
- spire typeclasses for math should be first-class in the language package
- vector type for indexing should be thought carefully
- literal types should be thought carefully, should be possible to describe literals as types when they are needed
- doing runtime interpretation of the hardware should be first-class, shouldn't require lowering to IR - switching between runtime interpretation and deferred interpretation should be first-class
- aggregate types should be separate concepts from interfaces
- clocks and reset should be first-class, not subtypes of booleans
- source-level information should be injected via scala 3 macros (ideally re-using logic in sourcecode)
- behavioral blocks like when statements should be preserved throughout the IR lowering process
    - a IR pass should declare what kinds of things it would like to see and the view mechanism will bring a high-level netlist down to that view for the pass to operate on
    - This can be more flexible for read-only passes, but restrictive for read/write passes
- bus protocol standards should be baked into the language's package, not kept separately, do not accept bikeshedding concerns from others
- enums should use typeclass derivation
- bundles should be regular case classes that use derivation - they should also be type generic with some bound (similar to hardcaml Bits vs Signal)
- 'reflection' on bundle types should be done using macros
- after the basic RTL stuff is done, the next thing is to work on a basic control flow language that we can compile with Calyx or similar (or do it ourselves), but have that directly expressible in the IR and simulatable both at runtime and deferred into another simulator
- what should a circuit be? Critically we want to enable people to extend modules and add functionality by reusing the variables in the original module - we want to basically bake in chisel aspects as a first-class feature to the language
    - adding print statements according to specific variables that are declared
    - this requires separating the declaration of state from the definition of the circuit itself from the declaration of the interface
- interfaces can be based on bundles, but can also have ad-hoc fields - directionality should be encoded in the type! this way we can have very concrete semantics for connecting interfaces to each other
- for the higher-level hdl stuff, look into the primitives in spatial (https://news.ycombinator.com/item?id=37729203)
    - but maybe start with the calyx primitives first actually
- for the internal representation - think about emitting the content-addressed circuits from the front-end itself!
    - Look into Merkle trees: https://en.wikipedia.org/wiki/Merkle_tree

- when having a bunch of FPUs, we don't want to lower to RTL, can we represent these at a higher level and regain simulation performance that's lost if we were to model FPUs at RTL-level?
  - Having a native notion of FP (for sure) and fixed point (maybe) in the IR itself would be good - don't worry much about making this *too* programmable, it's best if it's just good enough

- Preserving semantics down the stack into synthesis, but doing so in a way that we can write passes on the IR that operate on a small set of primitives and have them translated by the compiler framework to operate on a high-level IR
- Formalizing semantics for HDLs. Especially dealing with X's in an intelligent way that's integrated into the design language/frontend. For X's that we can prove never escape past reset and N number of cycles, allowing zeroed initial state; for X's that we can't prove don't escape, either use explicit resets, or randomize state sufficiently to have confidence that nothing will break, or strengthen the formal methods with dynamic information, or pick out certain paths for the simulation tool to use a more-realistic X-prop mode on (VCS doesn't have this level of granularity, the X-prop mode must be set for the entire simulation).
- Encoding more VLSI/FPGA constructs in the frontend HDL and furthermore as IR primitives. Clocks, resets, power domains should be first-class objects. Checks that composition of these primitives should happen as part of the frontend and IR compilation. Functional things like retention flops should have formal checks for whether they can restore the state of a block correctly. Power domain crossings should be aware of the power state of each domain. UPF/CPF/SDC generation should come from the frontend. This information should propagate to the simulation tool to perform power-aware/DVFS-capable simulation, without relying on the UPF format and VCS/Xcelium.
- Incrementally elaborated HDLs. A trend that has emerged for build systems (see Bazel, Buck2) is that not only are the builds executed incrementally (as they did from the days of Make lol), but also the build *descriptions* themselves are being compiled incrementally. This is because reading build descriptions themselves takes a long time. Same problem shows up in HDLs when circuits get really large. Within-run caching in HDL elaboration is easy enough - just have an API for creating an instance and creating several instances of them (see the Chisel Instance API). But run-to-run caching is much more difficult since it requires us to know what source code changed and what it could affect. One solution is a content-addressed language (e.g. Unison), but more practically we could analyze the incremental compilation output of e.g. the Scala compiler and understand what cache entries to invalidate.


## Notes from LATTE Matrix Thread

Hi everyone! The [slides from our overview talk on Saturday are here](https://vighneshiyer.github.io/2024_04-latte-the_next_paradigm_of_hw_design.html) (you can hit Escape to arrow thru the slides quickly).
Also, [here is the code we used to integrate the Calyx module into a Chipyard SoC](https://github.com/ucb-bar/chipyard/commit/0abf79fdd32db4712148375125944e52307cc2cc#diff-43d6868b42d92c56ef9d2f1c15376667e0ab929c9a45bdc3209fb9f215f04b4b) and the [trivial Calyx module we used](https://github.com/joonho3020/calyx/tree/asplos-24-latte-talk).

To respond to some questions/comments from the chat that we didn't get to:

> @MARCO KURZYNSKI
> I read on FireSim's website
>
> > Users can also integrate custom software models for components that they don’t need or want to write as RTL
>
> I wonder if the software models need to be in Scala too?

The software models for FireSim are written in C++; [here is an example of a block device model](https://github.com/firesim/firesim/blob/main/sim/firesim-lib/src/main/cc/bridges/blockdev.cc).

> @nuno.m.paulino
> I think i have a question on the effort to preserve semantics: regardless of how much semantics you preserve in the IR (whatever it is), doesn't it get lost anyway if you emit RTL via that IR? shouldnt the solution be to go from a higher level hardware design -> semantic rich IR -> netlist (w/ mapping step performed?)
>
> > @Can Lehmann
> > Thats basically the long term vision of rebuilding synthesis tools to take advantage of the multi-level IR, isn't it? Using the high level information to augment netlist generation.
>
> > > @Max Korbel
> > > stealing some of the optimization work from the synthesis tools before generating RTL and spitting out something more structural seems like a viable temporary solution, but sounds better in the long term to have synthesis tools consuming a better IR than verilog

Yes, the long-term vision we all share is for the simulation/synthesis tools to ingest an IR natively instead of Verilog, but this is not reasonable in the near term.
The best we can do now is emit Verilog that looks as if a human wrote it, so that the synthesis tools can use their existing heuristics on the Verilog AST to identify common circuit structures (e.g. FSMs).
Trying to do optimizations at the IR-level by a compiler, before structural Verilog emission for the synthesis tool is another option, but it may lead to worse QoR in unexpected ways.
There is also the question as to whether new semantics-preserving IR node types should exist or simply annotations that mark semantics on existing IR nodes.

> @Can Lehmann
> I would be interested in the concrete improvements one could gain from using more semantically rich IR for netlist generation. I know e.g. yosys can do FSM state reencoding, which might benefit if we preserve information about FSMs. What else is there?

Sure, here are a few ideas:

- You already mentioned FSMs, and yes that is a good place to start - being able to mark legal transitions, state bits, and sub-FSMs explicitly would save the trouble of inferring those semantics in synthesis
- IRs like FIRRTL don't have great support for "don't care" semantics for combinational logic (in Verilog this is usually done with casez/casex), so complex logic is [eagerly turned into optimized logic in Chisel itself](https://www.chisel-lang.org/api/latest/chisel3/util/experimental/decode/DecodeTable.html). Ideally we can preserve these semantics and let the synthesis tool do the boolean logic optimization.
- Chisel [doesn't support tagged unions](https://github.com/chipsalliance/chisel/issues/927), but if it did, it would be nice to encode those semantics for any net that holds a tagged union type. Being able to specify the discriminator bits and the values they can take on (like an enum) could enable more aggressive logic optimizations in synthesis.
- In the talk we mentioned that it would be nice to separate the logical and physical representations of integers (among other datatypes). For the FSM case, one could leave the physical encoding (binary vs onehot) of the state register unspecified and let the synthesis tool pick the right choice without having to rewrite the circuit.
- More radically, we could encode more arithmetic operators and datatypes into the IR. Right now, we encode '+' and '*' operators in our IRs and Verilog and let the synthesis tool pick the specific circuit that is inferred (and automatically retime the circuits with user provided registers). In principle, we could eagerly lower '+' and '*' to a specific circuit implementation using just gates, but we don't because we know the synthesis tool will give us higher QoR and has verified implementations of these arithmetic circuits.
  - Concretely, what if we encoded floating point datatypes and arithmetic in the IR? What is stopping us from letting synthesis tools infer '/' (division) circuits? This has the potential to speed up simulation compilation time + throughput and achieve higher QoR.
  - What makes adding a (e.g. division IR node) hard, is that often, dividers are circuits with input-dependent latencies. But, if we leverage higher-level abstractions (e.g. dataflow-style ready-valid), then we can encode division in those abstractions, and make it usable to the logic designer. I think that trying to encode these arithmetic primitives in the RTL abstraction will fail.

- How do you design a language for readability of existing RTL / HW in any abstraction?
  - Right now, a big issue with Chisel and even Verilog is it is hard to get an idea of the overall HW architecture at different levels of detail without manually going through the code and seeing where modules are instantiated and looking at the dataflow. Looking at waveforms for a simple test makes the dataflow a bit more clear, but still requires lots of manual work. Can we do a better job here? The language itself should support visualization of dataflows and module instantiations and chains of bundles and the like: the visual dataflow should also be easy to programmatically inspect after the circuit is elaborated with original references to the functions/classes that generated certain bits of hardware and the ability to do post-elaboration introspection of those structures.
  - Visualization: https://news.ycombinator.com/item?id=40937119 (https://blog.sbensu.com/posts/demand-for-visual-programming/)

## Interesting Projects

- https://capra.cs.cornell.edu/latte25/paper/12.pdf (Zaozi, Reinvent Chisel in Scala 3) (by sequencer)
- https://capra.cs.cornell.edu/latte25/ (general stuff from LATTE in 2025)
- https://ericlyun.me/tutorial-asplos2025/ (very impressive set of tools that I didn't appreciate before, all from Yun Liang's lab in Peking University)
  - Hector HLS language and IRs, Cement HDL, Khronos RTL simulator
- See my email with Scott Beamer and Dustin Richmond - I enumerated languages and they gave some feedback too of ones I missed
