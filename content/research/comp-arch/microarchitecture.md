+++
title = "Fundamental Works in Microarchitecture"
date = 2024-03-23
draft = true
slug = "fundamental-works-in-microarchitecture"
+++

- CS152/252

## Data-Parallel Architectures

- http://people.eecs.berkeley.edu/~krste/thesis.html (Krste's thesis)
- The SCALE architecture: http://scale.eecs.berkeley.edu/papers/abstracts/scale.pdf
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-117.html (Yunsup's thesis)
- https://www.csl.cornell.edu/~cbatten/pdfs/batten-vt-mitthesis2010.pdf (Chris Batten's thesis)
- https://dspace.mit.edu/handle/1721.1/42330 (Ronny's thesis)
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2021/EECS-2021-186.html (Colin's thesis)
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-1.html (Andrew's thesis, the RISC-V ISA manual + his notes on instruction density wrt ISAs)
- Exploring the tradeoffs between programmability and efficiency in data-parallel accelerators (https://dl.acm.org/doi/pdf/10.1145/2491464) (such a good paper)

## Heterogeneous Systems

- [Cohmeleon: Learning-Based Orchestration of Accelerator Coherence in Heterogeneous SoCs](https://dl.acm.org/doi/abs/10.1145/3466752.3480065)
  - The ML aspect of this isn't that interesting, the workloads are kind of iffy and adhoc
  - BUT, their taxonomy of accelerator memory coherency integration strategies is good

## Modeling

- ML based uArch models
  - Ithemal: Accurate, Portable and Fast Basic Block Throughput Estimation using Deep Neural Networks (https://arxiv.org/pdf/1808.07412)
  - Tao: Re-Thinking DL-based Microarchitecture Simulation (https://dl.acm.org/doi/pdf/10.1145/3656012)

+++
title = "Open Questions in Core Microarchitecture"
slug = "open-questions-in-core-uarch"
date = 2025-04-05
draft = true
description = ""
+++

- Specialization identification, DSP Saturn extensions being extracted from kernels alone, and then even functional models, perf improvement estimation, automatic new functional units? So much possibility on the methodology side

- Unsolved questions in general purpose computing
- The marginal cost of an rob entry
- True benchmark construction and evaluation
- Variable length isa vs fixed tradeoffs
- Vliw vs packed simd vs cray vs rvv
- The ideal simt programming model and first principles architecture
- First principles programming model for data parallel algorithms
- Per instruction latency attribution and tracing and automatic perf optimization hints, another uarch difficulty

## Yufeng's Question

> "Principled" way to design CPU / SoC?
>
> In class, we've explored a wide range of design decisions involved in developing a new CPU or SoC. During my work on the 252 project, I encountered many similar challenges.
>
> My approach for the 252 project was to start directly at the RTL level—first implementing functionality, and then iteratively optimizing for performance and other metrics. However, I’ve come to realize that some of the design choices I made early on could have been avoided or improved if I had considered higher-level trade-offs earlier in the process.
>
> This experience has made me curious: is there a principled or structured methodology for CPU/SoC design that helps guide early-stage decisions and systematically evaluates their impact? I would really appreciate hearing more about how experienced designers typically approach this.
>
> Thanks.

Before I answer, take a look at what [GPT-4o](https://chatgpt.com/share/6806b480-f4c8-8004-8fb8-8098d642534a) and [Gemini 2.5 Pro](https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%221I1MeEvPkuonsLywFSO-EcedJnjXo8S5I%22%5D,%22action%22:%22open%22,%22userId%22:%22114971513378697512776%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing) say.
I think you will find their words truly uninspiring.

This is a good question.
Engineering is *supposed* to feel systematic.
You start with a model of various primitives at your disposal and a problem domain, and engineer an optimal solution to solve that problem.

In the case of designing a CPU, the primitives are "blocks" that can be composed to form a CPU pipeline (fetch units, decoders, renamers, dispatchers, load/store units, functional units, branch prediction, speculation schemes, etc.) and the problem domain is defined by some benchmarks we think are important.

But engineering is rarely systematic in practice.
To give a taste of this problem, let's consider the domain of analog circuit design.
Generally, there are 2 *types* of design flows that we use.

1. Block-level. Given some desired specs (e.g. amplification, noise figure, phase margin, power budget) we engineer an implementation using the low-level primitives (transistors, passives). The types of specs are specific to the block being designed.
2. System-level. Given some *workload* (i.e. ultimate thing we wish to accomplish) we select the blocks we need and the specs they must have. Naturally, we overprovision each block's specs to make the workload viable.

<!--
- Workload to specs
- Specs to implementation
-->

Take the case of an RF receive chain.
The workload is being able to recover a signal that has some modulation scheme, carrier frequency, and signal to noise ratio, among other traits.
There is a *systematic* system-level design flow to take this workload and lower it into the required specs for each block of the signal chain (antenna -> LNA -> mixer -> LO generation -> LPF -> VGA -> ADC).
Of course, there is actually a *design space* and many tradeoffs can be made to accomplish the same task but with different blocks, speced differently.

<!--
Similar to gm id approach for designing an op amp, typically analog will use block design approach and spec out each block and overprovions or margin them to get the full system performance like in a rf receiver chain
-->

If we take any particular block, for example the LNA, there is also a *systematic* block-level design flow.
For instance, note the famous [gm-Id design methodology](https://github.com/bmurmann/Book-on-gm-ID-design), which is based on lookup tables generated from transistor-level SPICE simulation followed by a transistor sizing and biasing technique for a specific amplifier topology.

OK so it seems like analog design is so principled indeed!
Now we must answer 1) is it really so principled? and 2) why are microprocessors different?

On the first question, the truth is that this principled methodology begins to break down right away.
At the block-level, parasitic estimation prior to layout is basically impossible in modern nodes, and frequently once you begin layout, you have to resort to painful iteration using bias and transistor sizing sweeps.
All this nice theory breaks down quickly and you often realize that the topology you started with can't possible meet the spec you want, and you have to redo the schematic design too.
At the system-level, when we start connecting all the blocks together, it can be hard to avoid any interactions between them that affect performance, and there are so many different decisions one could make when lowering, that you inevitably have to pick one, design the whole chain, and backtrack if you realize something can't be done.

But all that being said, analog design is indeed more amenable to a systematic top-down design methodology than digital circuits.
Why?
Practically, analog circuits have far fewer levels of abstraction than digital ones, and are thus far simpler.
Leaving that aside, how could we do systematic design for a CPU?

Just to sketch things out, here is what that process looks like for an "industry" architect:

- A trace-driven system which can capture various characteristics about the workloads you want to run fast
  - Try to estimate how much parallelism (DLP, ILP, MLP) can be extracted from the trace. Same with cache locality. Same with branch predictability.
  - You are effectively modeling all the various CPU blocks I discussed above. But you aren't assigning some 'timestamp' for each instruction commit. You are effectively doing a CPU-pipeline-specific "roofline" analysis. How much parallelism can we extract as we grow the size of various CPU structures?
- Consider the cost model
  - This is where things get hard. Each block has a PPA cost associated with its parameterization (or special features we're adding). How do you estimate that in a way that you never have to backtrack on a decision? This is complicated because as you sweep a parameter, the optimal uarch for the block might change (e.g. for a small LSU the uarch might look very different than for a large LSU - it is not just a matter of increasing the size of an SRAM). There are 'cliffs' where you must completely redesign the uarch since the overhead of some structure now can't be effectively amortized.
- Play with features to extract more parallelism
  - Most industry architects spend a lot of time here. Add some uarch feature to our trace-driven model based on some workload pattern they've identified. Model it and estimate the cost. Ask RTL to implement it. See if it helps in aggregate or hurts and iteratively refine the model.

This methodology is just a very sophisticated implementation of the ideas in the [McPAT paper](https://ieeexplore.ieee.org/document/5375438).
After all this, it is clear that we haven't actually solved the original problem of systematic CPU design.
I think there is more research to be done here, thinking systematically with continuous RTL feedback, but ultimately it is hard to know what implementation details end up derailing the nice abstractions you assumed.

<!--
Very good question, roofline gets you some of the way, various types of trace analysis helps too, but ultimately the low level design decisions affect the real model greatly. Eg for an rob there are points in the size where the uarch has to make a step change to accommodate a larger size below that size it is too much overhead and above it is necessary to avoid overhead of the naive technique, similar idea for caches, hard to see this at the system level without implementation

bottleneck analysis is basically McPAT-style uarch modeling. Undoubtedly, we can do better than this, and I think we should build something, but no matter what, it has limits.

So what is the equivalent of this on the digital side? We can start with a roofline model. Bottleneck analysis gets us more of the way there. But at the very end, we need implementation to drive the abstraction modeling itself.
-->
