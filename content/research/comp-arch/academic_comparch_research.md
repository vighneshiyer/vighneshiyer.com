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
The lab's objectives were multifaceted (not purely computer architecture, but a blend of algorithms, PL, compilers, systems, architecture, and simulation), but the lab can be summarized in one tagline:

<p style="font-size: 1.05rem; font-weight: 500; text-align: center;">"Easy to write, correct, programs that run efficiently on manycore"</p>

The effort began with a 2006 whitepaper titled ["The Landscape of Parallel Computing Research: A View from Berkeley](https://people.eecs.berkeley.edu/~krste/papers/BerkeleyView.pdf).
The CS department at Berkeley has a history of writing whitepapers that broadly examine an area of computer science,


Make bets and then get proven wrong, but still come out with interesting and useful research.
Can you be proven wrong? What happens if your vision doesn't work out in the real world?

The Parallel Computing Laboratory at U.C. Berkeley: A Research Agenda Based on the Berkeley View (2008) https://www2.eecs.berkeley.edu/Pubs/TechRpts/2008/EECS-2008-23.pdf



This was the last architecture lab whitepaper. what happened? are we not confident placing bets anymore?

What was the bet? What was the actual outcome? Placing bets that fail isn't a problem - but the bet must be placed in the first place. Working on a hypothetical solution, even if it fails, teaches us a lot.

### ASPIRE (2012-2017)

### ADEPT (2017-2022)

### SLICE (2022-2027 (projected))

## A Reflection on Successful Research Labs

### Whitepapers

Writing forces clarity. Forces an idea to become clear. Makes what you say easy to critize. Allows you to be proven wrong.
Slides on the other hand are vague, hand-wavey, can have meaningless drivel
Cite Simon peyton jones
Cite Bezos on Amazon memos, writing forces clarity

### Making Bets

Placing bets and looking at where the dice land.
The value is in placing the bet to begin with.

trendfollowing is a big risk, trendsetting is even more risky, but it is the right type of risk to assume

### Patterson's Take

Cite his article on research labs
Point to Dave Patersons how to build a research center

### Mission Accomplished?

Never assume the thing that was said is actually done - usually that is not the case.
What has been accomplished and what remains to be done?
Trying to move past objectives that were never completed is like allowing students to graduate while still failing their tests.

Have you really succeeded in your past mission? It's like graduating a grade while still failing all the tests

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
Harrison on first principles thinking rather than iteration

### Teamwork

Are people making conscious decisions?
Should everyone just work on what they want in quotes to work on?
Does that create a lab?

## Industry vs Academia

- Academia is NOT 'industry-lite'
intellectual vs economic risk
is there really a 'spectrum'?

- Palladium, arch sim with palladium cores on chip, rtl sims opt, bridge reuse firesim and palladium and maybe bringup, dse, fpga overlay
- Alladin like stuff
- Integrate with language level stuff and irs
- Ppa estimation, early stage iteration, live flow
- Sampled simulation / evaluation methodology


## Worthwhile Directions

### My Bet

What is my bet?

I bet that SoC development will be bottlenecked by stagnation in the fundamental building blocks of circuit design (language, simulation tools, verification), and industry will struggle to break through this bottleneck due to accumulated cruft - new competitors will emerge that innovate at this level and will crush the dinosaurs who rely on old paradigms and stagnate.
I bet that there is a lot of low hanging fruit in languages, IRs, simulators, design methodology, etc. just waiting to be picked - but no one wants to pick the fruit because of the full-stack boil-the-ocean effort it requires.
This fruit must be picked if we are to make paradigm-shifting advancements in computer architecture - vastly lower effort digital design, much higher first-spin success confidence, must less headache and pain for engineers.


This list *is not* all-encompassing.
PLARCH talks on eDSLs and mixed-abstraction HDLs
live iteration flow - we keep getting asked about PPA
look at past industry feedback from retreats too

- P core and e core unified generator
- Fpga and asic targeted rtl design language, syncreadmem is not a good abstraction for eg multiport rf with different latencies for each design and able to perform perf area tradeoff


### My Vision

If I could lead a lab of 5-10 students and had complete directional control, what areas would I hit, how would I allocate resources, and what paper/research targets would I want to hit?

Avoid using minions under a specific project but make them feel independent and empowered on their own, don't bottleneck them by forcing them to contribute to an existing project with very strict development cycles or for a completely new project with many people working that will stamp on each other.

Instead, everyone should work on something that they lead, but critically, it must integrate into one thing that exemplifies the lab vision and graven prototype. e.g. using agile development as something that everything slots into like an emulation platform which requires vertical innovation across HDL, IR, compiler, simulator infra, RTL designs, and so forth


- FPGA overlay emulation platform
- Coming up with datacenter benchmarks
- New HDL & IR
- Aladdin v2.0

Take stuff from `90/research/planning/idea_archive` too

### Simulation Methodology

### SoC Design Methodology

#### Hardware Design Languages

#### Hardware Intermediate Representations

#### Incrementalism

##### Build Systems

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
