+++
title = "Datacenter Modeling at uArch Scale"
date = 2022-08-30
draft = true
+++

Solve the long-standing problem in computer architecture: how do we perform microarchitecture simulation at rack-scale? No abstract models of the software - run the real thing! No abstract models of the hardware - develop initial IP and iterate it (even if some modeling is required here and there)!

See Joonho's article: https://joonho3020.github.io/articles/me-commons.html

I have more thoughts. Basically we know RTL simulation isn't feasible here, how do we pick the correct abstraction automatically? I argue sampling is the right approach, still backing the performance estimates with RTL. Extending the methodology to work for an entire SoC and SiP will be crucial. Switch models have to be validated against real things (in a MESS-style fashion).


The last attempt academically was RAMP and the related line of work. FireSim is the latest incarnation, but it is well short of the goal. Commercially, emulation machines exist, but their cost is too high for what can be simulated on them (and the throughput is also capped too much). FPGA prototyping machines also exist, but suffer from the same problems. We need to think cross stack - we can't rely on raw translation of RTL to a simulation platform alone.

What is the point of this? There is *still* a problem where rack-scale systems (even SoC-scale systems) can't be simulated before they are constructed (3+ year timeline minimum). Why can't we add a new datatype to a ML accelerator, model it in a cluster, write the modifications for the compiler, and witness the impact (wrt performance, and perhaps power) instantly? To make this work, many pieces have to come together: architecture functional modeling, sampling, RTL state injection, JIT-based fast forwarding, generated compiler stack, instant startup RTL simulation. We are nowhere close, but there is no intrinsic reason this isn't possible.

There is a constant problem with people using high-level models of a workload rather than the concrete workload itself (e.g. using some notion of a GEMM with some parameters or a Pytorch graph vs the actual code that gets run on the system). In doing so, you can't actually work on making the compiler optimal! You can't evaluate the hardware performance truthfully!

At the same time, getting the system balance right requires careful pre-silicon evaluation of the full software and compiler stack with the microarchitecture. You need to balance memory, compute, and IO properly and most systems (e.g. the typical GPU architectures) are scalable enough to allow arbitrary ratios of each at elaboration time. But choosing the right ratio is mostly just guessing based on the previous generation silicon and some heuristics (i.e. the instincts of the spreadsheet architects). Unfortunately, high level models don't give you the microarchitectural insights necessary when actually designing the RTL and ISA and doing performance bottleneck analysis. Guiding system balance from running full rack-scale simulation of the entire software and OS stack + networking stack/model in addition to having the ability to modify the ISA (mostly control and synchronization primitives) is not possible today.
