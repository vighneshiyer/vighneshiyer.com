- [ ] Chinese labs and social pockets... I need a better title, talk about internationalization of labs and fake notions of diversity. Chinese labs work hard and get papers but what value do they produce?
  - Consider the ASPLOS top submitting universities - top 3 are Chinese, mass paper pushers

- [ ] Summarize SoC generator frameworks

- BSG (http://bjump.org/manycore/)
- ESP (https://esp.cs.columbia.edu/tutorials/asplos2023/)
- OpenPiton (https://github.com/PrincetonUniversity/openpiton)
- Chipyard (https://github.com/ucb-bar/chipyard)
- Pulp Platform (ETH) (https://github.com/pulp-platform)
- LiteX (https://github.com/enjoy-digital/litex)

- [ ] Compare RISC-V performance models and correlate them to RTL simulation

- gem5 riscv (not maintained, but decent)
- rivet (Albert's spike fork)
- https://github.com/masc-ucsc/esesc (most comprehensive, QEMU-based)
- https://github.com/riscv-software-src/riscv-perf-model (Olympia)

- Alibaba C910 Xuantie (may be a QEMU-based perf model somewhere according to Tianrui) (https://github.com/T-head-Semi/openc910)
- https://github.com/mariusmm/RISC-V-TLM (ISA-level)
- https://github.com/riscv-ovpsim/imperas-riscv-tests (likely only ISA-level)
- Ask Jerry about others

- https://github.com/machineware-gmbh/vcml (Virtual Components Modeling Library (vcml) - SystemC modeling primitives)

- [ ] Evaluate hardware design languages
    - Chisel, SV, PyMTL3, MyHDL, Spinal, ROHD (https://github.com/intel/rohd), Shakeflow, DfiantHDL, Magma, PipelineC, TLVerilog, BlueSpec, Blarney
    - Look at the circt meeting notes: https://docs.google.com/document/d/1fOSRdyZR2w75D87yU2Ma9h2-_lEPL4NxvhJGJd-s5pk/edit#
    - https://www.youtube.com/watch?v=fPl4eZHh1-M&list=PL02hojk7ZTSek-Zro6Zdj_nDlp6khGssJ&index=7 ( SCIRT: Bridging the Type System Gap for Circuit Generators - Ruikang Wang@THU+PLCT )
    - HLS tools: Intel HLS compiler SystemC, Calyx, all the other open source ones Bambu etc.
    - https://ucsbarchlab.github.io/PyRTL/ (lots of other older HDLs listed there - would be nice to have an actual comparison), pyrope
    - Also HLS IRs and libraries:
        - SystemC
        - Dahlia https://github.com/cucapra/dahlia
        - XLS IR from Google
        - other dataflow HDLs (see references from Dahlia)
        - Spatial (from Kunle's group, written on top of Chisel) - more of a dataflow language vs general purpose HLS

- [ ] Evaluate RTL testing and modeling libraries (see hw_testing.md)
    - UVM
    - SystemVerilog native
    - MyHDL ( + High level modeling)
    - SystemC-TLM
    - nmigen/migen
    - chiseltest / VIP extensions
    - hardCaml
    - https://masc.soe.ucsc.edu/pyrope.html#31 PyRope (lots of comparisons too)
    - Dart based HDL (from Intel)
    - Stanford fault

- [ ] Evaluate modeling libraries
    - PyMTL3
    - Paso
    - ILA
    - [sail-riscv](https://github.com/riscv/sail-riscv)
    - [ ] SystemC - parallelism, ports, TLM, events
    - [ ] DCm++: https://www.researchgate.net/publication/224647512_DCim_A_C_library_for_object_oriented_hardware_design_and_distributed_simulation
    - [ ] Dahlia: https://capra.cs.cornell.edu/dahlia/page/about/
    - [ ] Calyx: https://github.com/cucapra/calyx
    - [ ] XLS: https://google.github.io/xls/tutorials/crc32/
    - [ ] PyMTL3: https://www.csl.cornell.edu/~cbatten/pdfs/jiang-pymtl3-ieeemicro2020.pdf
    - [ ] SiFive has a discrete event simulator framework (not under the sifive github org) (ask Jack about this and to put us in touch with a modeling guy from sifive)

> Write a post summarizing all this stuff. Possible merger of HLS-able and analyzable (formally) model and actually exucatable. How is this usually done (e.g. spike, commercial models, gem5, etc.). How do we do hierarchical modeling? Can we merge RTL and hardware models (swap in and out)?
>
> How do I model the L2 for fuzzing, cov prediction, stim gen, and other stuff? (perf prediction)

- [ ] Evaluate performance correlation between gem5 and RISC-V cores in RTL sim
    - perf model, event model, uarch/arch model, power model, DRAM model, relative speed vs spike

- [ ] Evaluate SimPoint-style trace sampling for accelerators

- https://link.springer.com/chapter/10.1007/978-3-031-01750-6_5
- Just like we can isolate program segments worth replaying in RTL simulation by phase analysis, can we do the same with programs that use accelerators? One issue is that accelerators are often exposed via intrinsics and don't reveal anything about the internal uarch updates that might warrant replaying.
- The high level idea is we can start with a TLM model of an accelerator and refine it.
- Maybe start for the CPU case: can we can switch between ISS, gem5 style sim, and RTL sim dynamically as the program is being executed, only executing the critical (never before seen) portions in detailed simulation?

- [ ] Investigate the new breed of programming languages

- Ballerina, Idris, Crystal, Zig, Nim, Unison, VLang, Mojo
  - [Some interesting notes on VLang being vaporvare](https://n-skvortsov-1997.github.io/reviews/), but maybe V is actually much better today (https://vlang.io/compare)
- Compare Languages and Purposes
- C/C++, Rust, Go, Zig, Nim, Python, Java/Scala/Kotlin, Crystal, Julia, Javascript, Swift, Ada, Elm, Elixir, Liquid Haskell, Dafny
- Compare on what they ought to be used for and their performance and library availability primarily as well as LSP/editor/IDE support. Decide on a minimal set of languages for covering a wide range of applications.
- Zig seems to have interesting features (comptime, which replaces a bunch of rust features, at the cost of generic type safety and only specific type safety)
  - https://www.scattered-thoughts.net/writing/assorted-thoughts-on-zig-and-rust/
  - https://matklad.github.io/2023/03/26/zig-and-rust.html
- Automatic parallelism extraction: https://github.com/HigherOrderCO/Bend (HN: https://news.ycombinator.com/item?id=40390287)
  - Similar idea but embedded in Scala specifically for for-comprehensions: https://github.com/kitlangton/parallel-for (scala 3 only version: https://github.com/VirtusLab/avocADO)

