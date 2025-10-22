+++
title = "Best CompArch Papers of 2025"
date = 2024-03-23
draft = true
slug = "best-computer-architecture-papers-of-2025"
+++

## ASPLOS 2025

The Chinese presence has intensified. In the same way that Yanyan pointed out that SWE conferences have become "ChinaSoft", these "architecture" conferences have gone that way too.
One will note that for the papers I picked out, there are way fewer Chinese authors than the conference average.
Maybe this says something...

As usual, perhaps only 5% of papers are worth reading, with the rest being the usual "papers with code" nit optimizations or about things that are way off-topic for this conference.
Most papers are very tenuously related to the intersection of architecture, operating systems, and programming languages, which was the original point of this conference.
I will point out the ones I like.

- Rethinking Java Performance Analysis
  - https://dl.acm.org/doi/10.1145/3669940.3707217
  - My pick for best paper of ASPLOS 2025
  - A good mix of philosophy, benchmark evaluation and construction, and the search for truth
- Control Logic Synthesis: Drawing the Rest of the OWL
  - https://dl.acm.org/doi/pdf/10.1145/3622781.3674170
  - Another good paper with a good idea
- Don't Repeat Yourself! Coarse-Grained Circuit Deduplication to Accelerate RTL Simulation
  - Beamer and his student do a good job, but are still just recovering the performance lost by Chisel/FIRRTL's abstraction blasting
- Parendi: Thousand-Way Parallel RTL Simulation
  - I am very happy to see his paper finally accepted to a conference after, I'm sure, many rounds of 'novelty' argumentation and bickering over performance improvements over multicore SW RTL simulation
  - I don't care about any of that nonsense - this is a worthy idea to explore and the authors did a good job with real engineering. That's all that matters.
- SmoothE: Differentiable E-Graph Extraction
  - https://dl.acm.org/doi/10.1145/3669940.3707262
- Exo 2: Growing a Scheduling Language
  - https://dl.acm.org/doi/10.1145/3669940.3707218
- Virgo: Cluster-level Matrix Unit Integration in GPUs for Scalability and Energy Efficiency
  - https://dl.acm.org/doi/10.1145/3676641.3716281
  - Yes I'm biased, but this is good. Please read! Real engineering.

## ISCA 2025

- [Assassyn: A Unified Abstraction for Architectural Simulation and Implementation](https://dl.acm.org/doi/pdf/10.1145/3695053.3731004)
- Concorde: Fast and Accurate CPU Performance Modeling with Compositional Analytical-ML Fusion
- Evaluating Ruche Networks: Physically Scalable, Cost-Effective, Bandwidth-Flexible NoCs
- DX100: Programmable Data Access Accelerator for Indirection
- Industry session
  - DCPerf: An Open-Source, Battle-Tested Performance Benchmark Suite for Datacenter Workloads
  - Meta's Second Generation AI Chip: Model-Chip Co-Design and Productionization Experiences
  - Insights into DeepSeek-V3: Scaling Challenges and Reflections on Hardware for AI Architectures

## DAC 2025

- GEM (nvidia)
- INSTA (also nvidia)

## Hot Chips 2025

## MICRO 2025

- Titan-I: An Open-Source, High Performance RISC-V Vector Core (https://dl.acm.org/doi/full/10.1145/3725843.3756059)
- OASIS: A Commercial High Performance Terminal AI Processor Supporting RISC-V Tensor Extension Instructions (https://dl.acm.org/doi/pdf/10.1145/3725843.3756054)
  - Haven't read this too closely, but it seems interesting and it is about a real SoC from SOPHGO
- TAIDL: Tensor Accelerator ISA Definition Language with Auto-generation of Scalable Test Oracles (https://dl.acm.org/doi/pdf/10.1145/3725843.3756075)
  - Read: "scalable test oracle" -> "functional simulator"
  - This is about an architectural description language (ADL) and generating functional simulators from it, but the title completely obfuscates what they're doing, as is usual among academics
  - Gemmini comparison is fishy, but I'll let it slide.
  - The TAIDL codebase is a mess, v2 (https://github.com/act-compiler/taidl), v1 - for the paper(https://github.com/act-compiler/taidl/tree/v1.1.1)
  - But I like the idea generally. Why are academics so bad at software engineering
- PyTorchSim: A Comprehensive, Fast, and Accurate NPU Simulation Framework (https://dl.acm.org/doi/pdf/10.1145/3725843.3756045)
  - I have to look at this carefully as it is another simulation framework paper, and those are often fishy
  - But again, I like the high level idea

## Others

- Icicle: Open-Source Hardware Support for Top-Down Microarchitectural Analysis on RISC-V (https://www.cs.columbia.edu/~sedwards/papers/weingarten2025icicle.pdf)
  - Very good work, good job
- Bridging Simulation and Silicon: A Study of RISC-V Hardware and FireSim Simulation (https://arxiv.org/abs/2509.18472)
  - The methodology isn't great, but at least this is something worth exploring. Much more than I can say about other work.
- The Saturn Microarchitecture Manual (https://www2.eecs.berkeley.edu/Pubs/TechRpts/2024/EECS-2024-215.pdf)
- Instruction Set Migration at Warehouse Scale (https://arxiv.org/pdf/2510.14928)
  - A great practical paper from Google
