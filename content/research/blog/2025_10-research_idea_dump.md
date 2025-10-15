+++
title = "Random Research Ideas"
date = 2025-10-14
draft = true
+++

Research ideas

- What shouldn't you do? Look at joonho accel article.
- What should you do? My points about risk, learning, and fundamental things
- Look at joonho research idea article too


- Mess for Gemmini
- Tt blackhole emulation
- Adl and compilation, taidl, openvadl, pydrofoil
- Yufeng question article / project
- Ai accelerator understanding
- Ml compiler understanding
- Diagramming using gradient descent, maybe first an overview of what exists already in the world of diagramming

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

## Best-Case Oracle Performance Estimation via Workload Analysis

- trace-driven / generic instruction driven high-level performance analysis model - similar to alladdin
- input: LLVM bitcode, RISC-V binary, RISC-V trace, LLVM trace, DRIR trace, etc.
- can use a functional interpreter if you'd like
- discover optimal performance peaks given different hardware configs and oracle analysis. oracle cache of any given size for example allows for rediscovery of tiling in a matmul or any other block-level operation. oracle BP allows determination of branch predictability with different ranges. oracle MLP allows for parallelism analysis. oracle DLP from arbitrary vector code extraction analysis. oracle DLP via systolic or other PE-oriented analysis.
- basically: feed in a program, figure out performance bottlenecks and cliffs. Figure things out from there.
- goal: rediscover compiler optimizations, rediscover Amdahl's Law. Put in something like llama.cpp and get numbers that reflect a real CPU's ability to execute things without explicit kernel writing. point out places for kernel optimization with hardware underutilization.

### Random Note

Yufeng has to run an MLP on an embedded soc
But which one to choose, how much sram is needed, how much off chip bandwidth and storage, how much compute bandwidth?

One idea is to mimic the chip arch and simulate it either using rtl or sampled sim

Another one is the alladin approach where the program trace is turned into an abstract isa which can extract dlp and MLP and estimate performance given a system arch and identify potential bottlenecks, that seems more useful, can identify how much simd is needed and what data formats and whether code can leverage those simd units with enough performance and utlization

In both cases it is essential not to further abstract the program he wants to run into just memory or compute traces or the like and instead be able to make these modeling predictions based on a concrete isa and programming model, this is why timeloop things are bad since they abstract too much and also can't give you confident bottleneck bounds, better to do rtl first design or at least functional model and simulator design. This is why ubiquitous riscv across vector and scalar cores and matmul units and even GPU simt units is so useful.
