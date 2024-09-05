+++
title = "Worthwhile Directions in Academic Computer Architecture Research"
date = 2023-12-18
draft = false
slug = "worthwhile-directions-in-academic-computer-architecture-research"
+++

This article is a full-form version of a [talk I presented to the SLICE Lab](https://docs.google.com/presentation/d/1K9ljkV5xASLpvs-hxx1Hruop512EWR6atFtepTYHKT0/edit?usp=sharing) in September 2023.
In the talk, I discussed the recent history of computer architecture research labs at Berkeley, fundamental vs domain-specific research, infrastructure vs application-driven work, different types of project risk, and gave an overview of areas of computer architecture that academic researchers were in a good position to attack.

This article is *my opinion* on what an academic computer architecture research agenda would look like and why.

## The Recent History of Computer Architecture Research at Berkeley

In the talk, I began with an overview of what research has been accomplished at Berkeley over the past two decades, its impact, and what it can teach us about what's worth pursuing in the future.

Labs in Berkeley run in 5 year cycles.
Each lab begins with a problem statement or observation, some high level goals, and then operates for 5 years before a new lab is christened.
This is supposed to allow us reflect on the past 5 years of research and recalibrate with new branding and goals, although the people (both professors and grad students) in the new lab carry over from the previous one.

### PAR Lab (2007-2012)

The [UC Berkeley Parallel Computing Lab](https://old.hotchips.org/wp-content/uploads/hc_archives/hc21/2_mon/HC21.24.300.ParallelComputingCenters-Epub/HC21.24.310.Patterson-UCB-ParLab.pdf) (PAR Lab) ran from the late 2000s to early 2010s.
The lab's objectives were multifaceted (not purely computer architecture, but a blend of algorithms, PL, compilers, systems, architecture, and simulation), but the lab's mission can be summarized in one tagline:

<p style="font-size: 1.05rem; font-weight: 500; text-align: center;">"Easy to write, correct, programs that run efficiently on manycore"</p>

#### The Berkeley Position on the Future of Parallel Computing

The effort began with a whitepaper published in 2006 titled ["The Landscape of Parallel Computing Research: A View from Berkeley](https://people.eecs.berkeley.edu/~krste/papers/BerkeleyView.pdf).

> Industry has laid out a roadmap for multicore designs that preserves the programming paradigm of the past via binary compatibility and cache coherence. Conventional wisdom is now to double the number of cores on a chip with each silicon generation.
>
> A multidisciplinary group of Berkeley researchers met nearly two years to discuss this change. Our view is that this evolutionary approach to parallel hardware and software may work from 2 or 8 processor systems, but is likely to face diminishing returns as 16 and 32 processor systems are realized, just as returns fell with greater instruction-level parallelism.

The whitepaper identified trends in computing, extrapolated them well into the future, and proposed research directions that could solve anticipated problems if the trends came to pass.
In particular, the following recommendations / predictions were made:

> *Regarding multicore versus manycore*: We believe that manycore is the future of computing.
> Furthermore, it is unwise to presume that multicore architectures and programming models suitable for 2 to 32 processors can incrementally evolve to serve manycore systems of 1000s of processors.

> *Regarding the application tower*: We believe a promising approach is to use 13 Dwarfs as stand-ins for future parallel applications since applications are rapidly changing and because we need to investigate parallel programming models as well as architectures.

> *Regarding the hardware tower*: We advise using simple processors, to innovate in memory as well as in processor design, to consider separate latency-oriented and bandwidth-oriented networks

> We believe that future benchmark sets must evolve to reflect a more representative mix of applications, including parallel codes based on the 13 dwarfs, to avoid over-optimization for single-thread performance (SPEC)

<p style="text-align: center;"><strong>Looking back on these predictions, some of them just didn't pan out.</strong></p>

For example, we don't see these massive wimpy-manycore chips with fine-grained synchronization primitives today; instead we see chips with modest core counts (8-64) that are optimized for single-thread performance and use a traditional cache coherency scheme for sychronization and data sharing.
Additionally, techniques and libraries for parallel programming are still relatively unchanged from the days of the PAR Lab, although highly concurrent programming has become a lot easier with the proliferation of language-level features such as coroutines.

However, other recommendations seem pertinent today.
The authors recognized that optimizing for single-thread performance using SPEC as a benchmark was not a good idea, and instead architectures should be optimized around benchmarks based on the 13 Dwarfs, which are common computational motifs (e.g. GEMM, SpMV, graph traversal) found in many application domains.

Variants of these Dwarfs can be seen in benchmark suites today, such as MLPerf, and the Dwarfs guided research into application-driven domain-specific accelerators, although they didn't have much influence in the microarchitecture of general-purpose cores.
Competent, vertically-integrated companies like Apple have gone well beyond SPEC and have crafted benchmarks that are specialized to real workloads: in doing so, they now lead the industry in power efficient compute.

#### The PAR Lab's Agenda

The PAR Lab came into existance along with a whitepaper titled ["The Parallel Computing Laboratory at U.C. Berkeley: A Research Agenda Based on the Berkeley View (2008)"](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2008/EECS-2008-23.pdf), which summarized the lab vision and the concrete projects they were going to work on.
On the computer architecture side, the projects include:

- RAMP Gold
    - A handwritten FPGA-based simulator for performance evaluation of massive manycore systems and custom core architectures
- A parallel web browser
    - An attempt to exploit manycore architectures to improve the performance of web browsers
    - In today's world, while browsers are multi-process and concurrent, the core algorithms for parsing, layout, rendering, and Javascript JIT themselves aren't parallel, and will likely never be
- Core architecture for manycore systems
    -
- Workload characterization
    -

### ASPIRE (2012-2017)

### ADEPT (2017-2022)

### SLICE (2022-2027 (projected))

## A Reflection on Successful Research Labs

### Whitepapers

Other comparch whitepapers:

- Patterson (2008) whitepaper: The Future of Computer Architecture: https://cra.org/ccc/wp-content/uploads/sites/2/2015/05/Computer_Architecture.pdf
- Arch2030: A Vision of Computer Architecture Research over the Next 15 Years: https://cra.org/ccc/wp-content/uploads/sites/2/2016/12/15447-CCC-ARCH-2030-report-v3-1-1.pdf
    - From here: https://cra.org/ccc/resources/ccc-led-whitepapers/

Systems whitepapers:

- A Berkeley View of Systems Challenges for AI (2017, Ion Stoica): https://sands.kaust.edu.sa/classes/CS290E/F19/papers/berkeley-sysai.pdf
- Above the Clouds: A Berkeley View of Cloud Computing: https://cs.lbl.gov/news-media/news/news-archive/2009/above-the-clouds-a-berkeley-view-of-cloud-computing/
- From Cloud Computing to Sky Computing (2021, Ion Stoica): https://sigops.org/s/conferences/hotos/2021/papers/hotos21-s02-stoica.pdf

- https://joey0320.github.io/articles/research-on-domain-specific-architectures.html

The CS department at Berkeley has a history of writing whitepapers that broadly examine an area of computer science,
This (PAR Lab) was the last architecture lab whitepaper. what happened? are we not confident placing bets anymore?

Writing forces clarity. Forces an idea to become clear. Makes what you say easy to critize. Allows you to be proven wrong.
Slides on the other hand are vague, hand-wavey, can have meaningless drivel
Cite Simon peyton jones
Cite Bezos on Amazon memos, writing forces clarity

Harrison on first principles thinking rather than iteration

### Making Bets and Picking Fights

Make bets and then get proven wrong, but still come out with interesting and useful research.
Can you be proven wrong? What happens if your vision doesn't work out in the real world?

What was the bet? What was the actual outcome? Placing bets that fail isn't a problem - but the bet must be placed in the first place. Working on a hypothetical solution, even if it fails, teaches us a lot.

Placing bets and looking at where the dice land.
The value is in placing the bet to begin with.

trendfollowing is a big risk, trendsetting is even more risky, but it is the right type of risk to assume

### Mission Accomplished?

Never assume the thing that was said is actually done - usually that is not the case.
What has been accomplished and what remains to be done?
Trying to move past objectives that were never completed is like allowing students to graduate while still failing their tests.

Have you really succeeded in your past mission? It's like graduating a grade while still failing all the tests

Paper titles and conclusions don't tell you what the on-the-ground reality is.
Just because there was 'prior work' doesn't mean it is usable or practical.
Often, getting it there might seem like 'engineering', but there is always hidden research insights and innovations required.
Consider Simon Peyton Jones' notes on writing a paper - no matter how insignificant an idea may seem (pure engineering), there are always challenges along the way.

### On Publications

See Quinell's article.
Can't let bad benchmarks, old paper comparisons, and lack of faith from others (our work seen as too 'engineering' vs 'research') stop us from making progress.
The best ideas always win eventually. We know this - we've never had a paper pumping mill to begin with (unlike UMich / KAIST), our PIs (Patterson, Asanovic, Nikolic) have never been paper pushers.

> Citations for motivation are unfounded, you need to make short motivation with reasoned arguments or else you propagate stupid motivations. You don't always need a citation to identify a problem or describe how a problem is typically solved
> This is in the context of profiling

### On Meaningful Research

Cite Hamming's "you and your research" talk
Mention hammings you and your research

Research is about new paradigms not iteration
New paradigms require destruction
Boiling the ocean is the norm

### Teamwork

Are people making conscious decisions?
Should everyone just work on what they want in quotes to work on?
Does that create a lab?
Building a graven prototype that demonstrates a unified vision (see Patterson's paper).

### Patterson's Take

Cite his article on research labs
Point to Dave Patersons how to build a research center

## Industry vs Academia

- Academia is NOT 'industry-lite'
intellectual vs economic risk
is there really a 'spectrum'?

- Re-examine existing paradigms, tools, languages, and IRs - re-design them if we can do a better job! The same idea that applies to ISAs also applies to HDLs, scripts, schemas, and so forth.
    - Never be constrained by having to 'support' what already exists - this constraint is only an industry concern! The ability to break free of this constraint is the power of academia
    - But what if industry doesn't want to use our things?! Who cares, this isn't the point of research anyways. And see RISC-V as an example - if the new paradigm (better cleanroom ISA) and its tools (assembler, compiler, peripheral specs) are in place, then a new ecosystem can evolve around them given time. We can boil the ocean - that should also not be a limiter. We can throw away old things! Having to support old things shouldn't be a limiter either!

- Palladium, arch sim with palladium cores on chip, rtl sims opt, bridge reuse firesim and palladium and maybe bringup, dse, fpga overlay
    - Credit to Daniel Sanchez's group at MIT who are doing great work in this area
- Alladin like stuff
- Integrate with language level stuff and irs
- Ppa estimation, early stage iteration, live flow
- Sampled simulation / evaluation methodology
  - SoC level sampled simulation / activity embedding
  - Never been done before either for perf models or for RTL especially, lots of things have to come together for this to work

## Magic box thinking

- Forces us to think at a high abstract-level divorced from specific applications
- Usually motivates general broadly-applicable research rather than some local random optimization
- Give some examples of magic box thinking
- Then we can refine and produce a very small slice of that magic box
- Lends itself to methodology innovation that academics are well positioned to attack vs industry - often requires rethinking existing paradigms

## Worthwhile Directions

### My Bet

What is my bet?

I bet that SoC development will be bottlenecked by stagnation in the fundamental building blocks of circuit design (language, simulation tools, verification), and industry will struggle to break through this bottleneck due to accumulated cruft - new competitors will emerge that innovate at this level and will crush the dinosaurs who rely on old paradigms and stagnate.
I bet that there is a lot of low hanging fruit in languages, IRs, simulators, design methodology, etc. just waiting to be picked - but no one wants to pick the fruit because of the full-stack boil-the-ocean effort it requires.
This fruit must be picked if we are to make paradigm-shifting advancements in computer architecture - vastly lower effort digital design, much higher first-spin success confidence, must less headache and pain for engineers.

It is wrong to think that this is the 'end of time' and that SystemVerilog and others are entrenched so far that there can't be any deviance or upstart.

What is my anti-bet?

I bet that there are no innovations left at the SoC architecture area that academics are well positioned to examine.

This list *is not* all-encompassing.
PLARCH talks on eDSLs and mixed-abstraction HDLs
live iteration flow - we keep getting asked about PPA
look at past industry feedback from retreats too
- specification first interpreter/jit generator for ISA simulation
- look at NEMU and Vienna
  - https://stackoverflow.com/questions/75028678/is-it-impossible-to-write-thread-code-in-rust
  - https://users.rust-lang.org/t/how-can-i-approach-the-performance-of-c-interpreter-that-uses-computed-gotos/6261
  - https://stackoverflow.com/questions/58774170/how-to-speed-up-dynamic-dispatch-by-20-using-computed-gotos-in-standard-c
  - https://www.complang.tuwien.ac.at/forth/threaded-code.html

- P core and e core unified generator
- Fpga and asic targeted rtl design language, syncreadmem is not a good abstraction for eg multiport rf with different latencies for each design and able to perform perf area tradeoff

### Good Examples

- Priyanka's group - unified vision going towards common project (a specialized architecture for sparse tensor algebra) - unifying work across discplines (horizontally, NOT vertically) in compilers, PL, RTL, Arch, applications, PD/VLSI.

### My Vision

If I could lead a lab of 5-10 students and had complete directional control, what areas would I hit, how would I allocate resources, and what paper/research targets would I want to hit?

Avoid using minions under a specific project but make them feel independent and empowered on their own, don't bottleneck them by forcing them to contribute to an existing project with very strict development cycles or for a completely new project with many people working that will stamp on each other.

Instead, everyone should work on something that they lead, but critically, it must integrate into one thing that exemplifies the lab vision and graven prototype. e.g. using agile development as something that everything slots into like an emulation platform which requires vertical innovation across HDL, IR, compiler, simulator infra, RTL designs, and so forth

- FPGA overlay emulation platform
- Coming up with datacenter benchmarks
- New HDL & IR
- Aladdin v2.0

Take stuff from `90/research/planning/idea_archive` too

Consider the cache generator project - all the things that need to slot into place are quite varied in nature
- formal modeling of coherency protocols, consistency models
- generation of verification collateral
- cache modeling and design methodology - combining lightweight HLS and RTL

### Simulation Methodology

- New paradigm of tightly-integrated with IR simulator
    - First class support for low-power optimization, DVFS modeling (rather than UPF hacks in VCS NLP mode)
        - IR-level support for CPF/UPF constructs, but done cleanly and compositionally with well and formally defined semantics
    - First class support for dipping in and out of code written in general purpose language during simulation execution (generalize the DPI hacks we currently use)
    - Clean x-prop support with localized xprop modes (https://www.synopsys.com/verification/simulation/vcs.html)
    - Highly incremental simulator builds and aggressive global (cloud) caching
- Synthesis that is tightly integrated with the frontend language and IR
    - Semantics preserving
    - Highly parallel with quick synthesis mode and early PPA feedback
    - Incremental-first so you can fearlessly re-run synthesis

### Datacenter Profiling

- [Tales of the Tail: Hardware, OS, and Application-level Sources of Tail Latency](https://www.comp.nus.edu.sg/~lijl/papers/latency-socc14.pdf)
- Benchmark duplication using oss
- Why do things explode (throughput cliff)
- Why is there tail latency (fundamental causes and exact ascription)
- Can we mitigate with hw or os things
  - Microkernel vs monolithic kernel

### SoC Design Methodology

#### Hardware Design Languages

- Fast PPA iteration loop
- Power, clock, reset aware (semantics carried over + first-class simulation support)
  - https://vlsitutorials.com/retention-cells-low-power-vlsi/
  - https://vlsitutorials.com/isolation-cells-level-shifter-cells-low-power-vlsi/
  - Power-aware as a first-class primitive (same with clock and reset). Encoding CPF-like things directly in the front-end. Being able to describe reset (multi-cycle) and clock constraints and encode those in the front-end + have them validated statically + at runtime (simulation runtime and even in-circuit).
- Injection ready (for sampled simulation in both FPGA and RTL sims)
- Event annotated (native event annotation support)
- Verification collateral and APIs directly in the design language (and zero overhead conversion of collateral to C-like shared objects for direct linking in simulations)
    - a DPI-like API for adding software verif/modeling stuff inside RTL

#### Hardware Intermediate Representations

#### Incrementalism

##### Build Systems

#### VLSI Flow Methodology

- API-first flow - enabled by open source CAD tools
    - Direct database query
    - Full fine-grained control over CAD tool execution
    - Remove the multi-interpreter problem (yaml -> hammer -> tcl -> interpreter in Cadence tools -> internal API -> action) becomes (top-level -> API -> action)
    - Error reporting as first-class rather than random log messages
    - Unit-testing of CAD tool APIs with small examples (cutting out irrelevant details) from larger designs
    - What does this enable? Where can we use design semantics to improve the QoR and the way we invoke the CAD tool APIs? Can we design new heuristics outside the CAD tool itself?
    - Can this enable new kinds of incrementalism?
    - Can we do 'unit tests' for PD where we construct a minimal database as we like, then manipulate it with our custom commands / parameters along with fine-grained tool API calls and verify the results (geometrically? wrt DRCs?)

### Novel Architectures

- RTL is critical for evaluation - we have never believed in *modeling* - always strive for high fidelity
- At the same time, don't use high fidelity models when low fidelity ones suffice (cite "arch sims considered harmful" paper)
- What architectures do we have?
    - Systolic GEMM accelerator
    - Vector machine
    - Scalar cores (both in and out of order)
    - NoC
- What architectures are missing?
    - DRAM MC/PHY, various IO things (PCIe, CXL)
    - GPU (large-scale SIMD)
    - GGRA (MIMD / streaming / dataflow architectures)

### Workload Analysis and Kernel Extraction

### Compilers

### Microarchitecture

#### Fundamental questions in microarchitecture

##### Code Density and ISAs

- Putting the nail in the coffin of VLIW

##### Fixed Width ISAs vs Variable Width

- Both for scalar ISAs and SIMD code
- Fundamental tradeoff analysis

##### Why Do ML Chip Architectures Diverge into Two Camps?

- Tradeoffs in efficiency vs flexibility/programmability
  - To analyze the tradeoffs properly, we would have to take a historical view
  - Assume we build a specialized (less programmable, to various degrees) accelerator for ML workloads as of 5 years ago
  - Then we also build a generalized architecture
  - Evaluate the tradeoffs at that time-point
  - Then go forward year-by-year and investigate whether new models can be efficiently mapped onto the specialized accelerator (also attempt to re-design it) vs the general purpose vector machine
  - The notion of specialization exists both for generalized architectures (new instructions + new arch state / new specialized memory architectures or scratchpads) and for specialized architectures (new structures like transpose/conv arrays, activation functions)
  - Prior work: https://research.nvidia.com/publication/2021-01_flexion-quantitative-metric-flexibility-dnn-accelerators
    - FLAT: An Optimized Dataflow for Mitigating Attention Bottlenecks (ASPLOS 23)
    - A Formalism of DNN Accelerator Flexibility (https://dl.acm.org/doi/abs/10.1145/3530907)
- Tradeoffs wrt PPA and compute density / power density / bandwidth density
- What is the right PU granularity and functionality? (outer product machine with broadcast, systolic array for GEMM, inner product machine)
  - What is a PE? The smallest unit of compute that has independent control flow?
- One major difficulty
  - separating the incidental things from the fundamental things - what makes an architecture good?
  - How can we make sure that the compiler quality or the uArch details aren't the bottleneck in the evaluation of each architecture?
  - Another problem: how do we quantify the implementation complexity of the new specializations in both the vector/matrix general arch or the specialized arch and for the compilers of each one?
- There are 2 camps
  - Big vector engine, big matrix engine, lots of memory bandwidth, not really fine-grained, just a few control processors in the periphery
    - TPU / Trainium / Apple Neural Engine / Qualcomm NPU
    - From the Trainium talk
      - They use heavily cisc vliw arch, instructions take hundreds of cycles, they don't do multicore RISC-V, very specialized hardware
      - The control flow has a lot of flexibility without using classical control cpu, instead there is some microcoded compiler programmed control engine
      - Ability to add new instructions over time that chains things or does some complex control stuff, programmed during chip boot or per network
      - Custom operator and activation functions or data types can be supported by the vector unit, nearly arbitrary pytorch or jax can be targeted to this unit
      - They have insane amount of flexibility wrt data types, they have support for things like 3-bit precision using their vector engine, not sure how granular it actually is
  - GPUs exist kind of in the middle
  - Manycore architecture with many tiny vector + tensor engines coupled to a control core and NoC mesh interconnect
    - Tenstorrent / SiFive "Intelligence" / Cerebras / Groq
    - Jerry thinks that redoing vector thread architectures would be a good idea - couple a vector + matrix extension with a scalar core and have a distributed scratchpad and a physically aware compiler (and a task graph programming abstraction for streaming compute)

##### Vector Thread Architecture

- taxonomizing data-parallel architectures
- why did VT lose out?
- is there a way forward?
- Prior Work: https://parlab.eecs.berkeley.edu/sites/all/parlab/files/Exploring%20the%20Tradeoffs%20between%20Programmability%20and%20Efficiency.pdf

##### Reexplore Control vs Compute Power Split

- Prior work has established that modern microprocessors spend 80+% of power on decode and control and memory and only a tiny fraction on compute - does this still hold, can we analyze this quantitatively, can we understand how much control power is actually necessary - what is the lower bound?

##### From the ML Compiler Angle, What ISA is best?

- how are microkernels actually written? are they synthesizable?
- benchmarking them on real hardware and simulated hardware
- How do ML compilers actually work? See ml-compilers.md
- What does tinygrad do differently? Can we use that to target RVV + AME?

From slice offsite notes:

> - Title: Language Level Innovation, Simulation Infrastructure, and Chiplet Research
> - Lab agenda as a whole, balance low-level implementation and high-level direction
> - Go thru the history and major projects of each lab (Parlab, ASPIRE, ADEPT, SLICE)
> - Talk about how the pendulum has swung from the infra/fundamental stuff to the application-driven stuff
>     - Has the pendulum swung too far?
>     - We need a better mix and more evolution - there is stagnation on the language front
> - More holistic language level view, multi abstraction, vlsi collateral and capture, verification and modeling and incremental lowering, cosimulation models, ppa fast estimation and design guidance
> - What are academics good at that industry can't do? And vice versa
> - Joonho's accelerator building arguments
> - Then move to concrete verification stuff
> - Comment on chiplets to finish off and say that we can debate in the next session after the opponent has presented his view

### uArch Toolkits

- A quick way to do program level analysis (criticality analysis, embedding, cache/TLB playground)
- Very similar infra to a trace based simulator, but because we are SW engineers, we will do a better job
- And we can extend this basic infra such that the profile can leverage it (to do stack unwinding, arch state querying, batch instruction processing, function counting / interception, etc.)
- This infra should look like:
  - **Trace formats**: raw spike-like trace, RISC-V trace spec, custom trace formats (for memory subsystems / accelerators, etc.), microarchitectural event graph, Google event trace format
  - **Input tools**: spike, RTL sim, TidalSim, FireSim, qemu?
  - **Analysis tools**: cache parameter analysis, see below
- Basic workload characterization from functional simulation
  - working set size analysis
  - mem access pattern predictibility
  - cache modeling
  - instruction mix, criticality, code density, hotspot analysis
  - branch predictability - isolate which branches are predictable and which ones are not, what their penalties are, and the source code they come from
  - SST-like program analysis
  - Look at what DynamioRIO can do: https://dynamorio.org/
    - The cache simulator drcachesim, TLB simulation, Reuse distance, Reuse time, Opcode mix, Function call tracing
    - A bunch of other analysis tools: https://dynamorio.org/API_samples.html
  - See https://github.com/ChampSim/ChampSim too

#### uArch Change Perf Prediction


- How to be able to predict impact of a uArch change on a workload's end-to-end performance?
- Of course, we can just use sampled simulation and rebuild a simulator as we make changes to the RTL / mixed-abstraction model.
- But, let's say we already have traces for a given unit in the pipeline / memory system? Like an L2 memory trace from a long RTL-level simulation (FireSim or regular RTL SW sim).
  - Can we make a RTL change for that unit, replay the trace, and then estimate the end-to-end performance impact?
  - This is quite hard in general since the timings of the trace will change based on the changes made to the unit! So naively running the traces on the modified unit won't suffice.
  - Using some learned prediction model is also unreasonable - it becomes too unit-specific and requires constant re-training as the uArch changes. Also, parameter sweeping is too naive - real optimizations involve changing some fundamental algorithm or doing some nit thing that makes a marginal difference, not sweeping some coarse grained large hammer)

### RTL-Level What-If Analysis

- Related thing is to extend sampled simulation to support what-if analysis
  - play with latencies
  - suppose an unlimited capacity or associativity cache somewhere in the hierarchy
  - suppose a bus has infinite throughput
  - how can we support these types of bottleneck analyses in sampled simulation or RTL sim world firstly?
- See my notes from Intel talk wrt TidalSim + reference my written notes about the uArch/program analysis toolkit
- Do what if analysis at rtl level, what are the true throughout bottlenecks of the web apps now days?
- How do we do this accurately and efficiently in rtl sim and fpga sim? Can we avoid dpi overhead and annoyances

### Post-Silicon Validation

- Event API with automatic tracker logic generation
  - https://vighneshiyer.github.io/2024_02-uarch_event_tracing.html#/2/1/1
- Pruning events and event history to match off-chip bandwidth limits
- Reconstructing full event traces using ML/heuristics from partial traces
- Semantic compression
- See the riscv-trace-spec which provides some basics about how to get an inst/PC trace out, without any uArch info (https://github.com/riscv-non-isa/riscv-trace-spec/releases/tag/v2.0.1)


- open review platform
  - public comments
  - public reviews
  - reputation
  - infra work is rewarded and credited
  - detailed subdomains

- leveraging circuits work
  - power domains, power credits/tokens, chip-embeddable macromodels
  - LDOs and clock generators
  - much other stuff too... let's figure this out

- But it's mostly engineering not research
  - First of all engineering is research
  - Research involves building new abstractions and new tools that do things you couldn't do before, that isn't merely engineering
  - Secondly the goal of academics is to do things a better way, there is a better way, things that others are too myopic to see or have different incentives
- Chisel had a fast c simulator before, we can do that again, in fact it is a must
  - Useful tools have much larger impact than the vast majority of research
  - Tools enable new research, take llvm for example or mlir even or RISC-V or any other things in that realm
  - How much compilers research was only possible after llvm?
  - Same with halide and exo
- Labs aren't linear, they are cyclic
  - It is just like the yuga cycle, the end of a lab should mark destruction and the start of new creation
  - Linear movements are for companies not academics! They enable maturity and products but going down that road is the opposite to the academic strength
- Instead of predicting 5 years into the future, look back 15 years in the past
  - What has stayed the same and is staying the same due to inertia, what are the issues with that? how do we break out of it?

Joonho's notes about research areas:

> ## 2023/12/09
> ### Important things to work on in computer architecture
> - Agile simulation infrastructure (building a palladium)
>   - How do we change the rocket such that it can be mapped to a higher FPGA frequency?
>   - ISA extensions that we can make?
>   - Compiler research
>   - How do we reduce the compile time?
>
> - Datacenter benchmark extraction
>   - How do we extract benchmarks from datacenters? What value do they have?
>   - Simply extracting or reconstructing the applications will not provide semantic information about the applications which means that there is no opportunities for application driven optimizations. However, application driven microarchitecture design is also kind of iffy. What else can you do than just tuning an existing out-of-order core?
>
> - Incremental everything
>   - Incremental compilation, incremental synthesis, incremental pnr, incremental bitstream builds, incremental simulation, incremental profiling
>   - Agile development is crucial
>
> - Language level things
>   - How do we embed power and area estimates into the language level construct?
>   - How do we design an higher level RTL metaprogramming layer that doesn't destroy the RTL semantics and can pass it on to the backend tools
>   - Or how do we reconstruct this semantics?
>
> - Software profiling
>   - How do we obtain full system visibility?
>   - How do we extract important information from all the logs?
>   - How do correlate the events to each other? What kind of statistical analysis do we need to perform to do summarize all the results?
>   - Given this profiler, how do build a automatic code tuner that can utilize this information?
>
> - Microarchitecture
>   - General purpose compute performance scaling has been declining. However, different companies come up with new cores, new microarchitecture which lead to better performance than the previous versions. Although it seems like microarchitecture innovations has come to the end, it really hasn't. There are still unanswered questions like "is using compressed instructions better than having fixed length decoding?". At the same time, answering these questions takes a lot of engineering effort and time which is something that is limited in a research environment. Furthermore, even though there are open source RTL designs of fairly high performance out-of-order cores, they are still missing a lot of features of a server class OoO core like fancy branch predictors, prefetchers, instruction fusion etc. Adding these to the open source cores will have to be done first to make this type of research persuasive.
>   - Using simulators vs writing RTL is a perpetual problem in academia. Writing RTL is hard and takes a lot of time. Especially if you are working on an out-of-order core (it can become an entire PhD). On the other hand, an OoO core has a lot of semi-fixed design points, especially in the middle end of the core. How can we abstract out common parts of an OoO core and provide it as a template to the core designer such that they can write RTL much faster? Would this be just simply providing the middle end of the core to the user? How do we provide a template that is flexible and robust at the same time?
>   - The core's frontend is getting wider and wider. Will the current branch predictors and I-cache design be able to keep up with this scaling? Also, are the compiler optimizations to enable multi-block fetches a done research area?
>
> - Automatic generation of hardware designs that dictate heuristic behavior
>   - In computer architecture, there are a ton of heuristics. Branch prediction, thread scheduling, runtime scheduling, cache eviction policy, prefetching, cache partitioning, memory bandwidth partitioning, throttling, clock gating to save power, dram request scheduling etc. All the research projects targeting come up with a heuristic, and compare it with the oracle decision. However, given a trace of events, area of the chip that you are willing to allocate, and power limitations, can you automatically generate hardware structures that are closest to the oracle? This can remove all the hand-tuning of various microarchitectural structures.
>
> - Silent corruption
>   - Utilizing advanced technology nodes to design server class cores brings a new challenge to datacenters. More and more cores are failing silently and addressing this problem systematically is very difficult. However, this isn't a research area that academics can pursue as the failing points of each vendor's core is entirely secret………
>
> - Aladdin v2
>   - As much as I do not like accelerator research in computer architecture, I do not deny that accelerators are a crucial part of an SoC and different applications may need different accelerators. I think the process of building an accelerator can be nearly automated. What you would need to do is automatically detect parts of the program that require acceleration (automatic profiling), automatically estimate area, power and performance (Aladdin), and compare it with the case where you allocate that much area to caches. Especially for step 2, I think Aladdin falls short as it does not consider certain hardware design primitives such as pipelining. Furthermore, it cannot detect cases where it is better to have certain parts of the kernel be executed by a closely-coupled core while having the accelerator run other parts of the kernel in terms of area and hardware complexity. I think building a single accelerators itself is a trivial enough task that it can be further automated.
>
> - Quick bug discovery using spec-mining
>   - Quickly discovering bugs is crucial for agile hardware development. If you have written RTL before, you know what I'm saying. It takes 1 hour to write the RTL, while it may take days to simulate, find the bug, fix it, simulate it again to see if it introduces other bugs.
>   - Spec mining is a technique to partially solve this problem. Assuming that you have a mature enough design, you can use statistical analysis to kind of assume that certain properties between signals are true. When this condition is violated, if may be a bug.
>   - Another problem that can be solved is how do we pick the correct benchmarks to re-run after fixing the design. You probably don't want to run the entire benchmark suite after changing 2 lines of your RTL. This I have no clue on how to approach this. I should probably think about this after taking the formal class.
>
> -
