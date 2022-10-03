+++
title = "Undergrad Projects in the SLICE Lab (Hardware Verification)"
date = 2022-08-30
+++

- Vighnesh Iyer (vighnesh.iyer@berkeley.edu)
- If you're interested in any of the projects below, please contact me by email and we'll set up time to talk and discuss ways to get started.

## About Me

- 5th year PhD student advised by [Prof. Bora Nikolic](https://www2.eecs.berkeley.edu/Faculty/Homepages/nikolic.html)
- Part of the [SLICE lab](https://slice.eecs.berkeley.edu/) and [Berkeley Architecture Research](https://bar.eecs.berkeley.edu/) ([github](https://github.com/ucb-bar))
- Working on machine larning for hardware verification and power modeling
- I've advised two 5th year MS students and a handful of undergrads
- I'm planning to graduate by the end of 2023 (you will be able to do research with me for at least 3 semesters)
- Undergraduate research is a great way to get to know professors, work on and read papers, present posters at our lab retreats, get industry contacts and introductions, and get feedback on your work!
    - Also an opportunity to get some food throughout the week :)

## SLICE Lab Tooling

In the [SLICE lab](https://slice.eecs.berkeley.edu/), we work on hardware accelerator design, system-level integration and analysis, and design methodology.
I focus on the verification aspect of our design work.
In particular, I work on testing libraries that are specialized for our [hardware design language, Chisel](https://github.com/chipsalliance/chisel3).

*Most of these proposed projects are built around adding verification features to our [testbench API for Chisel-generated circuits: chiseltest](https://github.com/ucb-bar/chiseltest).*

If you've taken CS 61C, you will recall that digital circuits can be described by instanting primitives (flip-flops, RAMs, boolean logic, arithmetic blocks) and wiring them together to create a digital system, like a RISC-V CPU.
You did this using a schematic entry program, like [Logisim](http://www.cburch.com/logisim/), where you visually laid out the primitives and connections between them.

If you've taken EECS 151, you were introduced to [Verilog](https://en.wikipedia.org/wiki/Verilog), which is a domain-specific language for describing digital circuits.
The primitives you can express in Verilog are similar to the ones you find in Logisim, but instead of using visual schematic entry, you describe the circuit as code (textually).
While this is an improvement over schematic entry when it comes to circuit reusability, Verilog is a poor language for creating digital circuit *generators* due to its idiosyncracies and limited language features.

To enable the desription of hardware generators, our lab developed [Chisel](https://github.com/chipsalliance/chisel3), which is a library written in the [Scala programming language](https://en.wikipedia.org/wiki/Scala_(programming_language)) that allows you to write programs that connect primitives and signals together to construct a digital circuit.
Chisel, by virtue of being a Scala library, can take advantage of the advanced language features of Scala to enable a new level of circuit reusability, abstraction, and ergonomics.

It is important to note though, that Chisel does not translate a Scala program into a circuit.
Instead it allows you to write a Scala program that outputs a circuit, just like a Python program using matplotlib might output a graph.
If you want to learn Chisel, I recommend going through the [Chisel bootcamp](https://github.com/freechipsproject/chisel-bootcamp) which features a series of exercises that you can do in a notebook without having to install anything on your computer.

For an overview of Verilog, see my presentation: [An Overview of SystemVerilog for Design and Verification](https://docs.google.com/presentation/d/1ELLsfgg8NWw1J67gBWA1rxhiA6z760Z-c6iaqVx6c-g/edit?usp=sharing)

## Proposed Projects

### High-Performance FFI Bridge between C++ and JVM for RTL Testbenches

- **Skills**: low-level Java programming, dynamic linking, performance profiling and benchmarking
- **Outcome**: state-of-the-art foreign language (Scala) testbench performance, coming close to the performance of using a native testbench language of an RTL simulator (e.g. C++ with Verilator or SystemVerilog with VCS)

**Description**:

In order to check whether a circuit works as expected, we need to write some tests for it.
The chiseltest library makes that easy by providing a high level-interface in Scala that you can write your tests against.
In order to quickly execute these tests, the circuit is converted into a C++ simulator using [Verilator](https://www.veripool.org/verilator/).
The C++ sources are then compiled into a shared library which is loaded into the Scala program using the [JNA library](https://github.com/java-native-access/jna) (one of Java's foreign function interface (FFI) APIs).

Unfortunately JNA has significant overhead that slows down the simulation.

In this project you would learn how to call C code from Java/Scala using the [JNI (Java Native Interface)](https://en.wikipedia.org/wiki/Java_Native_Interface) or even the [brand new Java 18 FFM (Foreign Function and Memory) API](https://openjdk.org/jeps/412).
Then you would investigate how to load shared libraries at runtime using `dlopen`.
With that knowledge you will speed up our simulator interface by replacing our use of JNA with a small C library and JNI or FFM.

At the end of the project you will contribute those changes to the chiseltest project so that the whole community can benefit from your performance improvement.

### A Functional, High-Performance Testbench API

- **Skills**: functional programming, Scala, testbench design and architecture
- **Outcome**: demonstration of a unique monadic testbench specification approach which will achieve SOTA fork/join testbench parallelism performance from a foreign language (Scala)

**Description**:

The [fork/join construct](https://www.chipverify.com/systemverilog/systemverilog-fork-join) is the primary way to express parallelism when writing an RTL testbench.
For example, if you have a hardware module with two ports, one for data input and another for data output, you will often want to drive the input port and monitor the output port simultaneously.
This is easy enough to do in Verilog, but we want to build a verification environment in a high-level language like Scala where such primitives need to be emulated.

We have previously developed a [testbench API called SimCommand](https://github.com/vighneshiyer/simcommand) which enables writing high-performance testbenches in Scala that can emulate Verilog's fork/join threading.
This library is based around a monad `Command[R]` which describes an RTL simulator interaction that terminates with a value of type `R`.
The library contains an interpreter of `Command[R]` which actually performs the actions described by the `Command`, including fork/join threading emulation, and returns a `value: R`.

- In this project, we will continue to develop and mature this library by:
    - Improving performance by rewriting the core interpreter in an imperative style to minimize allocations
    - Implement looping constructs as primitives to further improve performance
    - Implementing channels to enable deterministic cross-thread communication
    - Implementing scheduling regions to resolve potential race conditions and catch all other races at runtime
    - Adding logging and error reporting functionality to the `Command` monad
- We will also work on building libraries on top of SimCommand such as verification IPs for common bus types (TileLink, AXI4) as well as transaction-level hardware models based on SimCommand's primitives
- We are hoping to integrate this library as an alternative frontend to chiseltest if we can achieve performance that rivals native language testbenches

### High-Level Synthesis (HLS) of Verification IPs (VIPs) for FPGA Accelerated Simulation

- **Skills**: [LLVM / MLIR](https://mlir.llvm.org/), RTL design, compilers
- **Outcome**: a VIP library which can automatically generate accelerated RTL and FPGA simulators by lowering software VIP implementations to hardware via HLS

**Description**:

Most functional verification is done using software RTL simulators.
While they are very flexible and fast to start up, their simulation speeds are slow and this slowness comes from two sources.
(1) the testbench interface to the RTL simulator may have a large overhead such as needing to synchronize every cycle.
(2) the RTL simulator may simply take a long time to advance simulation time independent of the testbench communication latency due to the complexity and size of the RTL.

(1) can be addressed by moving more of the testbench collateral to the RTL simulator, decoupled from the testbench host language (usually Scala in our setups).
This involves translating the verification IP that interacts with the RTL to software that can be tightly linked with the RTL simulator, or into hardware that can be compiled along with the RTL design.
This technique aims to minimize the communication overhead between the testbench host language and RTL simulator.

(2) can be addressed by synthesizing the RTL for FPGA implementation.
The consequence is that the host to FPGA communication latency often becomes the bottleneck in simulation speed.
To solve this, we can use high-level synthesis (HLS) to compile the verification IPs around the RTL to hardware and tightly couple them to the RTL logic in the FPGA.

In this project, we will explore ways to use [SimCommand](https://github.com/vighneshiyer/simcommand) as a front-end for specifying VIPs which are then compiled to hardware using HLS.
We will attempt to translate a constrained subset of SimCommand programs into the [Calyx IR](https://calyxir.org/) and use the LLVM/MLIR flow to lower the programs into hardware.

### Functional, Introspectable Constrained Random API for Stimulus Embedding

- **Skills**: functional programming, Scala, SMT
- **Outcome**: a constrained random generation library with the superpower of introspectability, which enables a far greater level of deep instrumentation than the SOTA

**Description**:

Both hardware and software are tested by supplying some function with inputs and checking if the outputs are what we expect.
In the hardware verification world, we rely extensively on constrained random stimulus generators to produce test inputs for our circuits.
There are both open-source constrained random libraries such as [PyVSC](https://pyvsc.readthedocs.io/en/latest/introduction.html#what-is-pyvsc) as well as commercial libraries such as those baked into Verilog simulators like [VCS](https://www.synopsys.com/verification/simulation/vcs.html) or [Xcelium](https://www.cadence.com/en_US/home/tools/system-design-and-verification/simulation-and-testbench-verification/xcelium-simulator.html) (they take constraints written using the [SystemVerilog constrained random API](https://verificationguide.com/systemverilog/systemverilog-constraints/)).

When a random solver produces stimulus, we only see the stimulus it generates, not *how* it came to generate that stimulus (e.g. which constraints were active, what random values were chosen by the solver, what distribution was sampled from, what decisions were made on a random value).
This information is hidden away in the internals of the solver, but it may prove useful when it comes to constructing a *representation* (embedding) for a given stimulus.
We aim to develop a constrained random solver which offers *instrumentation as a first-class construct* so that it is easy to extract these stimulus features as the stimulus is being generated.

The best way to tackle this problem, is to use techniques from functional programming.
In particular, we can be inspired by prior work in [pure-functional Scala random generators](https://github.com/NICTA/rng) and the [property testing library for Scala: ScalaCheck](https://github.com/typelevel/scalacheck) ([ScalaCheck docs](https://github.com/typelevel/scalacheck/blob/main/doc/UserGuide.md)) ([QuickCheck overview](https://www.dcc.fc.up.pt/~pbv/aulas/tapf/handouts/quickcheck.html)).
In this project, we will study how to apply principled FP techniques along with domain-specific knowledge about hardware stimulus generators to produce an introspectable constrained random library.

See my presentation for details: [Functional Random Stimulus Generators and Their Applications](https://docs.google.com/presentation/d/10dLaAaFjYCly3EufSh-FFrO5ZMZyib2CFwhFaazXQeQ/edit?usp=sharing)

### Coverage Specification API for Chisel

- **Skills**: Scala
- **Outcome**: a user-level Scala library to specify coverpoints and covergroups in Chisel circuits that puts Chisel verification constructs on par with SystemVerilog

**Description**:

Hardware verification is similar to software verification in that we run tests on our circuit until a certain *coverage* has been achieved.
In software, we usually measure line and branch coverage which corresponds to making sure we tested every statement and every branch in our code.

In hardware, defining coverage is more complex.
We also use software-like structural coverage metrics such as line, branch, and conditional coverage.
But we also have hardware specific metrics such as toggle coverage (which measures whether each flip-flop in the design has transitioned from 0 → 1 and 1 → 0).
In addition to these structural metrics, hardware coverage also includes user-defined coverpoints which, among other things, can measure how often some hardware signal lands in a user-specified range.

```systemverilog
module tb();
    logic [1:0] state;
    covergroup state_cg @(posedge clk);
        coverpoint state;
    endgroup
endmodule
```

For instance, in this example, the `state_cg` covergroup will measure how many times `state` lands in each of its bins (0, 1, 2, 3) during a test execution.
The [SystemVerilog covergroup and coverpoint specification API](https://www.chipverify.com/systemverilog/systemverilog-covergroup-coverpoint) provides all kinds of more sophisticated functionality.

In this project, we will implement a coverage specification API for Chisel defined circuits.
We will lower the coverage specification to basic primitives for coverage collection that work across RTL simulation, formal, and FPGA emulation.
In doing so, we will develop a major verification feature for Chisel that has been frequently requested.

### Integration of Coverage Passes, Coverage Merging, and Report Generation into chiseltest

- **Skills**: web frontend development, general purpose data wrangling
- **Outcome**: a coverage report viewer designed specifically for hardware verification

**Description**:

In software, coverage consists mainly of line coverage (which is easy to visualize simply by highlighting lines of source code - e.g. for gcov, [lcov](https://wiki.documentfoundation.org/Development/Lcov) is a simple HTML coverage report generator).
Hardware coverage databases require extra features to visualize properly.
In hardware, many different types of coverage exist such as toggle coverage, sub-conditional coverage, and custom covergroups, which are difficult to visualize in the same manner.

We have developed a methodology for a uniform coverage specification in Chisel based on the [FIRRTL cover IR node](https://github.com/chipsalliance/firrtl/blob/6aa86b13abe25271278498836217c89c00d7b151/src/main/scala/firrtl/ir/IR.scala#L789).
As part of this project, we will upstream our previously developed "Simulator Indepdent Coverage" methodology to chiseltest.

In this project, we will extend chiseltest to support emission of coverage data into the [UCIS coverage format](https://www.accellera.org/activities/working-groups/ucis) and merging coverage across tests.
Concurrently, we will develop a web app which can read a coverage database and Verilog / FIRRTL / Scala source code and visualize coverage metrics in an innovative way.
To our knowledge, there is no existing hardware-specific coverage report generator in open-source and the commercial implementations are clunky and difficult to work with.

Here is some prior work using lcov to visualize RTL line coverage:

- https://substate-tech.github.io/ambel/coverage/ambel/SimpleApb2CSTrgt.sv.gcov.html
- https://github.com/substate-tech/ambel

### Mutation Testing for Chisel Circuits

- **Skills**: programming in Scala, formal methods, circuits, firrtl IR
- **Outcome**: a mutation testing library that can be used to tease out bugs in chiseltest testbenches and demonstrate the viability of new mutation techniques

**Description** (credit to Kevin Laeufer):

I work on tools and techniques to more quickly test circuits written in Chisel.
However, how can we actually know whether these techniques work?
One way of assessing the quality of a test is to see how many bugs it finds.
But how do we get a circuit that has enough bugs to provide us with interesting feedback about the performance of our testing technique?

The approach we are going to investigate in this project is called mutation testing.
The basic idea is to add a single small change to the circuit and then to try and see if the test can detect the change.
For this project you will learn about the firrtl compiler which can be used to programmatically change Chisel circuits.

Once you are able to automatically introduce small changes (i.e., mutations) into the circuit, we need to make sure that we can filter out the changes that might not be detectable.
There are numerous reasons why a change might not be detectable, but a simple example would be changing part of the code that is never executed.
Thus to the outside world, the original circuit as well as the mutated one behave exactly the same.

During the course of this project we will study an [open source mutation testing implementation for Verilog circuits](https://github.com/YosysHQ/mcy) as well as some academic papers on mutation testing.
Then you will implement a version for Chisel circuits.
The final goal of the project is to benchmark and study your implementation and to open-source your code so that others in the Chisel community can use it.

### Waveform Visualization for Debug

- **Skills**: C++
- **Outcome**: a chiseltest extension that enables easy waveform circuit debugging with transactions

**Description**:

The goal is to augment the most popular open source waveform viewer [gtkwave](http://gtkwave.sourceforge.net/) with the ability visualize higher-level information (such as hardware transactions vs. raw wire values) directly on the waveform.
There is some [scant](https://antmicro.com/blog/2019/12/testing-usb-cores-with-python-and-cocotb/) [prior](https://gist.github.com/carlosedp/97188d9b0749c9faf99f8a79df5a3db6) [work](https://github.com/ekiwi/chisel-testers2/commits/gtkwave) that we will systematically incorporate into our testing framework, chiseltest.
See the links for details.


### Fuzzing Hardware Models as a Proxy for Fuzzing Hardware

- **Skills**: C++ and binary instrumentation, software fuzzing
- **Outcome**: In short, we want to use AFL or other software fuzzers to fuzz *models* of hardware such as ISA-level (spike, ovpsim) or arch-level (gem5-riscv) CPU simulators and show that this process can yield stimuli that reaches high coverage in RTL simulation.

**Description**: for details on this project, see [my presentation](https://docs.google.com/presentation/d/1Tt3lf3G8HVGeqw_Ocha_-6l9IdUESixWX4t3oNUjPv0/edit?usp=sharing)

### Undeveloped Ideas

There are many other project ideas I have bounced around, but they aren't sufficiently developed to write a section about them.
If you're interested in any of these, email me and I'll be happy to elaborate.

- Continuous and directly differentiable hardware models with JAX
- A temporal specification language for Chisel
- A systematic hardware modeling approach that permits hybrid RTL / model simulation
- A next-generation CSP-based Diplomacy for SoC construction and parameterization
- OSS RISC-V processor benchmarking (this is already done to some degree)
    - [A Catalog and In-Hardware Evaluation of Open-Source Drop-In Compatible RISC-V Softcore Processors - Carsten Heinz et. al.](https://www.esa.informatik.tu-darmstadt.de/assets/publications/materials/2019/heinz_reconfig19.pdf)
    - [A Comparative Survey of Open-Source Application-Class RISC-V Processor Implementations - Alexander Dörflinger et. al.](https://publikationsserver.tu-braunschweig.de/servlets/MCRFileNodeServlet/dbbs_derivate_00048213/riscv-survey-cf-zweitpublikation_v2.pdf)
- A Netlist-Level Power Estimation Tool (see below for rough notes)

> - write a tool to estimate power from generic cell netlist + generic cell simulation waveforms
>     - use chiseltest to drive blackbox of generic Verilog to get generic VCD
>     - tool computes per-cycle power
>     - need a way to estimate power of a generic cell
>         - start with unitless estimate based on logical effort sizing model (relative to inverter)
>         - refine with per-pin transition power also based on simple cap model
>         - reference 1x inverter power from C_{gate} = W*L*C_{ox} (from MOS spice model) or C_{gate} = 1-3 fF/um
>         - later: derive generic cell power model from process .lib (undergrad project)
>     - reference power from Joules (using RTL VCD, rtlstim2gate, Joules synthesized circuit)

This writeup is inspired by [Kevin Laeufer's undergrad research info document](misc/ugrad-projects/Kevin_Laeufer_Undergraduate_Research_Project_Info.pdf) ([drive link](https://docs.google.com/presentation/d/1Tt3lf3G8HVGeqw_Ocha_-6l9IdUESixWX4t3oNUjPv0/edit?usp=sharing)).

The single pager I laid out at the research fair [can be found here](misc/ugrad-projects/2022_09-Ugrad_Research_Fair_Sheet.pdf).

## My Verification Agenda for 2022/23

This is just a reference for anyone interested in understanding my high-level agenda and objectives.
If you can think of another project that's aligned with my efforts, please feel free to email me.

> We will be concentrating our dynamic verification effort in 2 areas:
>
> 1. High performance testbench APIs and a SystemVerilog/UVM parity DV environment
>     - The ideal DV environment should:
>         - Use a high-level general-purpose language to describe the testbench logic, including VIPs, scoreboards, and the constrained random stimulus generator
>         - It should enable polyglot testbenches (use of Python libraries for common workloads like linear algebra or ML or C/C++ to interface with driver/kernel code for co-simulation)
>         - It must achieve performance parity with the industry standard UVM + SystemVerilog + VCS/Xcelium toolchain, but be composed of open source components
>         - It must achieve feature parity with SystemVerilog (temporal property specification language and functional coverage APIs)
>     - The full scope of this problem is massive, so we will focus our work on a few areas:
>         - Extending our prior work in SimCommand to improve the feature set and testbench performance, in addition to performance improvements within chiseltest
>         - Standardizing interfaces throughout Chisel RTL codebases to enable unified VIPs and test environments
>         - Reviving cosimulation infrastructure for accelerators, such as Gemmini, to evaluate large workloads accurately without resorting to FPGA simulation
> 2. Machine learning for coverage closure, bug hunting, constraint tuning, and regression suite construction
>     - We are investigating techniques for predicting RTL-level coverage from stimulus / random generator features
>     - We will evaluate different methods for solving the 'missing data problem' associated with blackbox supervised learning approaches
>     - We will investigate the utility of fine-grained input features in predicting complex output features such as time-domain coverage metrics
>     - We will use this infrastructure to evaluate coverage-model-guided bug hunting / state exploration techniques and constraint tuning approaches for targeting specific coverpoints
