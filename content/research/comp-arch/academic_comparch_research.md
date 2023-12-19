+++
title = "Worthwhile Directions in Academic Computer Architecture Research"
date = 2023-12-18
draft = true
slug = "worthwhile-directions-in-academic-computer-architecture-research"
+++

## Background

This article is a full-form version of a [talk I presented to the SLICE Lab](https://docs.google.com/presentation/d/1K9ljkV5xASLpvs-hxx1Hruop512EWR6atFtepTYHKT0/edit?usp=sharing) in September 2023.
In the talk, I discussed the recent history of computer architecture research at Berkeley, fundamental vs domain-specific research, infrastructure vs application-driven work, different types of project risk, and gave an overview of areas of computer architecture that academic researchers were in a good position to attack.

### Mission Accomplished?

Slides from SLICE offsite here.
What has the lab done in the past?

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

This list *is not* all-encompassing.
PLARCH talks on eDSLs and mixed-abstraction HDLs
live iteration flow - we keep getting asked about PPA
look at past industry feedback from retreats too

- P corr and e core unified generator
- Fpga and asic targeted rtl design language, syncreadmem is not a good abstraction for eg multiport rf with different latencies for each design and able to perform perf area tradeoff

### On Publications



## My Vision

If I could lead a lab of 5-10 students and had complete directional control, what areas would I hit, how would I allocate resources, and what paper/research targets would I want to hit?


- FPGA overlay emulation platform
- Coming up with datacenter benchmarks
- New HDL & IR
- Aladdin v2.0

From slice offsite notes:
>     - Title: Language Level Innovation, Simulation Infrastructure, and Chiplet Research
>     - Lab agenda as a whole, balance low-level implementation and high-level direction
>     - Go thru the history and major projects of each lab (Parlab, ASPIRE, ADEPT, SLICE)
>     - Talk about how the pendulum has swung from the infra/fundamental stuff to the application-driven stuff
>         - Has the pendulum swung too far?
>         - We need a better mix and more evolution - there is stagnation on the language front
>     - More holistic language level view, multi abstraction, vlsi collateral and capture, verification and modeling and incremental lowering, cosimulation models, ppa fast estimation and design guidance
>     - What are academics good at that industry can't do? And vice versa
>     - Joonho's accelerator building arguments
>     - Then move to concrete verification stuff
>     - Comment on chiplets to finish off and say that we can debate in the next session after the opponent has presented his view


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
