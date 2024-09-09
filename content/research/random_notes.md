Absolutely random notes about random research things.

- Fundamental papers on speeds and feeds? Anything? Besides roofline stuff
- More holistic language level view, multi abstraction, vlsi collateral and capture, verification and modeling and incremental lowering, cosimulation models, ppa fast estimation and design guidance
- Palladium, arch sim with palladium cores on chip, rtl sims opt, bridge reuse firesim and palladium and maybe bringup, dse, fpga overlay
- Alladin like stuff
- Integrate with language level stuff and irs
- Ppa estimation
- Early stage iteration
- Live flow
- P core and e core unified generator
- Fpga and asic targeted rtl design language, syncreadmem is not a good abstraction for eg multiport rf with different latencies for each design and able to perform perf area tradeoff

- Citations for motivation are unfounded, you need to make short motivation with reasoned arguments or else you propagate stupid motivations. You don't always need a citation to identify a problem or describe how a problem is typically solved. This is in the context of profiling

## Hardware Modeling

- An ir for event driven description of models that can be composed with a hardware primitive ir
- Something like llhd actually but allow a mix in the final output rather than reducing everything to hw primitives
- Notion of time in event driven language, only notion of ticks in the other language

## Verification

- Beyond coverage, state trajectory based coverage and cross coverage
- Using driller like techniques for fuzzing hardware
- Multi event bugs, reaching complex covers with combination of formal and fuzzing with breaking down a temporal property to prediction to using formal to discover partial traces
- Unifying formal and dynamic input generators such that formal uses the generation strategy of dynamic, basically formal gets control of the parametric byte stream

- Trigger edge case bugs faster than workloads and also explore non typical compiler output
- Inversion of control, knobs just become queries and are externalized from the generator parameterization
- Precise control, knobs can vary and be controlled in detail from query to query
- Embedding for free, the byte stream is the embedding
- Learning sequences, see dream coder
- First - why are current random generators not good? They claim to be good because they collapse a large stimulus space into a small one, but that is worthless unless the small space actually can describe the stimulus good enough to generate models

- Run large multi thread rtl sims on big multicore arm systems vs x86, target sve vectors for simd
- Rocket riscv-dv experiment
- Riscv benchmarks, torture, riscv-dv, coremark, embench

- Feedback is useless if the generator can't use it properly
- Or if the metrics are too easy to hit
- Or if it causes the stimulus evolution to actually slow down or go down the wrong path

- Using parametric generators to produce validation stimulus for multi level sim like cache state reconstruction
- Leveraging verification infra for validating uarch simulation
- Leveraging simulatior independent coverage for feedback

- Formal specification of specs, generated English specs, for isa, for protocol, for ucie, ... We want formalization of specs not just for verification but for ease of implementation. Also consider how we can use formal specs of isa to generate a qemu like emulator

- Trying to take sail model and generate spike or a very fast interpreter or even a dbt jit! Why is this not done already? We should generate models. Maybe have some way to specify undefined behavior specific to some target too. This would allow us to safely break away from spike and is good direction maybe for ansa to investigate

## HDLs

- Rosetta code for hdls, Systolic arrays

- What are the overhead of li interfaces vs this (filament)? Real examples?
- Coping with dynamic input dependent delays or throughputs, maybe based on backpressure on output interface?
- How can you verify that the time annotations are accurate wrt the real rtl?

- Unify host language for hdl and testbench and system software language, it would be ideal or just find a way to make ffi or mixed language stuff easy

## Optimization

- Talk about teramalloc, casting optimization as a rl game and comparisons to analog sizing optimization

## VLSI CAD

- Also ask if khangs team tried to inject bad initial placements into the other algorithms and what the impact was

## Quals

- End of Moore's law end of dennard scaling so we have heterogeneous socs with accelerators and critically specialized Microarchitectures even multiple uarch on the same chip for different application and workload characteristics
- See new apple chips with pcore encore, but also other Qualcomm chip with 3 different cpu variants
- So there are two questions: what specializization uarch is possible and how to pick it which is the benchmark and presilicon evaluation problem
- But also consider other axes, Verif and power is getting harder, we want to ease these efforts
- Motivate why we need this smarts and simpoints hybrid sampling. Talk about io devices and why this matters for industry given performance modeling teams. Also perf models are often done in industry for correlation to make sure the rtl matches, written by two different teams. Brucek suggests using GPU large batch perf simulation for using many many parallel simulations
- Write papers and qual talk and presentations as a designer working on a problem and solving each piece of it
- I made rtl change, how do I see impact? I can do this.... But it has this problem. Let's try this (embedding) based on this observation (phase behavior). Then let's try rtl injection. Then we see these results. Why are the results bad? Let's analyze mkpi between full rtl and TidalSim. Oh we see that the caches aren't being warmed! How does warming change with different warming intervals? Can we also simulate intervals around those that are far from centroid? Then how can we do warming? What data structure do we need? Basically don't talk about implementation dumb stuff, just talk about a story about developing a tool and tell story through experiments and plots

- Tell a story! Start with concrete example and motivate accordingly.
- I have idea, do impl in chipyard, eval is hard! Then uarch sims, but show inaccuracy, then show sampled simulation idea for rtl sim, then how does that work, then let's try a prototype, then where does error come from? Look at perf metrics, then generalize the injection harness, then make checkpointing robust, then how about streaming,...

## Cache Design

- Ppa eval vs models
- Agnostic to protocol, abstract that away
- Or the coherency protocol too
- Building a dram cache behind the root of coherency
- Evaluate custom isa extensions for fine grained cache behavior
- Cache partitioning strategies like address hashing or striping

- Abstracting away the bus protocol or message hierarchy from a more baseline set of adts, can we unify tilelink axi4+ace and chi?
- Can we design caches using hls or other high level methodology for it's state machines? Can we do verification and design more efficiently?
- Generating caches based on formalization of a coherency spec, also generating litmus tests
