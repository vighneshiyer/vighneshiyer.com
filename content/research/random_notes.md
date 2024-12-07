Absolutely random notes about random research things.

## Truly Random Things

These are very high level ideas and scratch notes:

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

- Magic box thinking
  - Benchmark box
  - Orthogonal program box
  - Directly differentiable box
  - Power trace box
  - Workload extraction from silicon box
  - Rtl elaboration speed box
  - Rtl templates box with block diagram
    - E.g. compression c code to boxes in diagram each with functional implementation and clear path to rtl implementation
  - Guided rtl optimization box
    - Identify inefficiencies and propose ways to fix them
    - Which things to put effort into first in what order
  - Incremental synthesis
    - Power and area and critical path id very quickly, only do partial synthesis
    - What are the characteristics of critical paths? Can we do a study?
    - How hard can it be to build an estimating synthesis tool? Just wrap things physically and route between them and analyze a bunch of paths
  - Silicon uarch trace extraction
    - Model correlation, interleaving and dvfs, validation coverage
    - In silicon state injection
  - Coverpoint synthesis
  - Semantic compression
  - Chisel API uarch event marking

- Leverage event graph as a model for the uarch, model extraction, can use unsupervised learning to learn missing timestamps
- Think about attacking the abstraction stack from both sides. Using isa spec to generate simulator and using rtl to generate model, then using sampled simulation to tie them together

- Create a unified diagram of all the things
  - Emulator
  - Post silicon and trace extraction
  - Sampled simulation
  - Full stack profiling
  - New language and ir
  - Consider all the magic boxes too
  - Mixed abstraction simulation and language
  - Benchmark extraction
  - Incremental synthesis and elab and simulation compilation

- Enumerate all slice projects and figure out who is working on them and what companies are funding them
  - Integrate my research philosophy article here too
  - Slice lab enumeration of projects and people, and categorization

- The two axes of multidisciplinary collaboration
  - one axis is cross-discipline (application focused) e.g. working with geneticists to accelerate some algorithm
  - another axis is discipline-integration (integration / tooling / infra focused) e.g. working the PL and systems and compilers people to build a new HDL

- Goals of research
  - Doing something you can't do before
  - Making something more beautiful, in the process doing new paradigms or new primitives and composition and systematic understanding, see stellar, exo, halide, calyx
  - Doing something cool and awe inspiring
  - Elucidating a concept or implementation that is opaque or proprietary

- Teach by story
  - Function implementation over hand written stimulus stuff, implement a cache model rather than hand stuff
  - Unit test student functions and models

- Tinygrad, gemmini isa, backend for rvv, ame extension

- Fundamental exploration of why the ml Arch's have differed into 2 camps
  - Vector fetch model and programmability
  - How predictable are certain branches and source code correspondence and penalties

- Can we apply egraphs to both hw compilers like firrtl as well as synthesis engines?
  - It should enable very incremental flows

- https://lwn.net/SubscriberLink/964735/8b795f23495af1d4/
> The E-graph data structure represents this efficiently, by allowing two copies of the internal representation to share the nodes that they have in common, and to allow nodes in CLIF to refer to equivalency classes of other nodes, instead of referring to specific other nodes. This produces a dense structure in which adding an alternate form of a particular section of the program is cheap.
- Can this be applied for a hw ir that's module free?
- Or supports 'incremental' modules?

- Spec mining is next!
  - Fixed vs mixed width instruction encoding

- Need to read the ramp gold paper, think back to krste's idea about using fpgas to drive sampled simulation running via rtl sw simulation

- Why do higher abstractions lose out vs lower ones on ppa? Why are generators worse than point designs? How can we bridge the gap? Consider designing CPUs using LI design or GAAs or using pipelineC or other techniques, why are they worse?

- We need to rethink pd methodology

- not sure how this MMIO gemmini thing works, seems like we shouldn't be hamstrung by issue bandwidth anymore... why are we still bottlenecked in this way with Vortex cores?
  - it seems like there is a lot of inefficiency to do coalescing when we statically know which cache lines to fetch

- ASPLOS 2024
- Doing a serious study of cgra vs gpu simt architecture wrt ppa and flexibility and programmability tradeoff analysis would be valuable, to what degree are you recreating a generic cPU core grid with cgra when you have to support slightly more dynamic applications. Consider the area efficiency too, consider compute kernels which don't have statically abalyxavle access patterns, so then we have to basically have a multicore or vector based predication..... So yeah, there is a strict tradeoff that we have to evaluate, the static schedule saves lots of power and area, but has hard limits that may make it area unviable on a real soc
  - All of these talks in this session about compilers are so similar, they must be unifyable to some extent
  - April 27, 2024
  - Taylor series based co induction streams of transcendental functions for deriving rewrite rules
    - Layer in between cas and compiler
  - Xiangshan uses 20M inst simpoint and they run in full parallel, 10 checkpoints per spec benchmark, and with enough servers we can run in 5.5 hours, but normally 2 days
  - A case against accelerators, consider the concrete robotics thing slam case and then talk about area efficiency of real socs

- First principles thinking
  - Ml principles don't build surrogate models

- Things to look for
  - Natural curiosity, hacker mentality, desire to write
  - Broad scope of interests, generalist
  - Strong programmer

- Recent Trends in soc design and semiconductors, the hullabaloo about multicore and parallel shift hasnt happened, single core perf primacy, accelerator rich ecosystem, but mostly dark silicon, specialized datapaths. But single core is still the most critical! Show benchmark suites, and continued perf improvements, like wider cores, less bp mispredict penalty, better memory subsystems, better memory be and latency, better prefecthers, no signs of stopping any time soon, continued process scaling with better density
  - The vast majority of stuff run on cloud or mobile or desktop is single threaded at most exploiting task level parallelism, not parallelism within one algorithm or application although concurrency is better exploited nowadays for task level parallalism
  - This is the first motivation, micro optimization and workload specialization of cores
  - Second motivation is the industry take on the next paradigm, no need to build and correlate models for models
  - Final motivation is rtl first methodology which academics are the leaders in and can exploit to do meaningful research that can be trusted

- Why do things break? Don't create fake benchmarks
- Macros are critical for high perf design
- Mobile vs server benchmark suites and core optimization or specialization

- Need some background on prior work in comparing vliw vs scalable vector isaa or even packed simd
- What are the tradeoffs that motivated the wide range of dlp implementations that you've covered? Why did that happen that way?
- Scaling up the Saturn arch to data center
- Need to show full stack for the final thing, need to show saturation of cores and rate matching via other scheduling

- paper on having multiple orderings of code within a basic blocks, pldi paper maybe, reordering in memory, got a lot faster for specific uarch, this could reveal issues in BBV embedding

- Simulate and capture time spent in critical paths that we can see vs other paths

- The role of ml for simulation, don't learn surrogate functions, learn new representations
  - But really we need to go back to first principles

- DFI: Design for injection, a rtl design methodology to leverage sampled simulation

- How does security fold into the slice lab if we don't even care about verification?
- What is the value of building a full stack? What leverage does it give us?

- Egraphs based compiler passes with global equivalence class opt and unified passes, global DB of area and power est

SLICE Summer retreat 2024

- Palladium asic
- Sim in Intel, perf models are too slow in design timeframe
- Should investigate post silicon validation but in our case there should be no mismatch and we don't have perf model, how do academics like us get involved in this area? Event trace from silicon
- Design of a pristine thing from first principles and rethinking abstractions and even seemingly unimportant details in the pursuit of beauty and aesthetics is intrinsically valuable and the domain of academic research which is completely infeasible in industry even in research labs

Things I would ask a good architect:

- The next gen cuda, what's the next programming paradigm for parallel compute? Is there something on the horizon?
- How specialized should architectures be? It seems that most ml accels are converging to a very similar arch
- Can we generalize the mind the gap work a bit? The holy Grail is knowing the reuse and compute and communication limits of any given algorithm given a specific implementation but not the general class of algorithms eg sorting or some data structure
- Hardware design languages, what is the future, what are the limits to adoption, why have hw languages failed to evolve like sw ones?
- What is the opportunity for a startup with a radically different design methodology to overturn the cost issues of the big players?
- What would you work if you were a pi in Berkeley with our students and infra and plenty of money to isolate you from other things
- Power management on gpus, how will you deal with higher static power on gpus, how do you deal with data dependent power management
- What is your true belief about llm for code gen for rtl design, arch, transpiration, and compiler gen
- What if could redesign the kernel and app such that the app was the init process, there is no other processes, everything in user space, all threads are cooperative, how do interrupts work, what about kernel services, no process isolation
- What if we did partha compute hierarchy thing, physically aware allocation of compute wrt data location, expose those apis to the user, remove this abstraction, what about how this changes programming model and OS design

- Vortex verilog rtl to chisel via llm lifting
- Also use formal equiv for checking

- Starting from scratch
- Rather than building on existing codebase
- Reinventing the wheel

- Modify spike like rivet with trace based mode, similar to gem5, just trying to make a point about these simulators in general not a specific implementation
- Maintain some basic core state, bp, cache, rob ilp state, and that's it basically, hook with dramsim2
- Chance to implement the ramp style functional and timing split

- Another academic value: opening up or making transparent industry things like emulators

- Benchmark duplication using oss
- Why do things explode
- Why is there tail latency
- Can we mitigate with hw or os things
- Microkernel vs monolithic kernel

- Disprove trace driven sim first
  - Then talk about exe sim
  - Then about design for injection
  - And then the full flow from dbt sim to ice emulation
  - Ipc doesn't matter if it's spinning the scheduler thread, need app level metrics
  - Dr traces induce 30x core slowdown and memory bw contention and cache pollution
  - Fake results when fed into trace driven sim, io appears faster than reality

- The new paradigm of profiling, simulation driven profiling, unlimited fidelity and zero perturbation, provide the ground truth
- Design for injection, new paradigm of methodology across dbt simulators, isa simulators perf sim, and rtl sim with sw or emulation
- More than just design for injection
  - Consider ideal case molding for infinite bw or perfect branch prediction or prefetching. Can model these with a model acting ahead of the core or another rtl sim (oraclebp from xiangshan) that guides decisions of the slower instance. So this is basically decision injection and influence at runtime, not merely state injection at some point in time

## Googling

- Why is there ipc in the gem5 embedding? How do we handle dvfs of the trace itself?
- Time based sampling vs inst based, embedding aggregation for soc, trace scheduler
- Trace driven time sync error, scheduler error, inst based interval error, trace model mismatch

- Culture of blameless criticism vs fake niceness
- Driving others to do better always
- Brutal focus on the outcome
- Secrecy that actually matters, being proud of your team, team morale vs apple
- Playing around, abusing the company benefits, unfocused work environment
- People give support on 'moonshot proposals' even if they have no idea what they're talking about. Just having a bunch of people with good titles saying nice things about your proposal is sufficient. Smart voices are rare and are easily drowned out.

- Google isn't (that) special. Analyze Google workload traces against our open source workloads and compare, they are quite similar

- Foreign languages
- Google couples
- Money focus of new people, pure exploitation
- Segregation at apple, others not allowed at engineering cafes, serves a purpose beyond secrecy of projects, segregation doesn't exist here
- I was wrong, it serves a valuable purpose, please forgive me jobs
- The guest policy is another thing, compare Google and apple, guests degrade the environment doesn't feel cohesive anymore, makes you worry about others, moves focus outside of the workplace
- Many bfs bring their gfs here to eat dinner, why don't the girls break up with them lmao, just absolutely insane
- I thought there was intrinsic value in transparency, that is still true but only if there is nothing to protect
- Mountain view vs Sunnyvale, white workers vs everyone else
- Highly politicized company, many activist groups fighting for political influence over c suite and funding poured into their pet projects and human pets too
- Musk is badly needed, vast swaths of this company can be eradicated and nothing would be worse off, but as long as human costs are small vs hardware and other costs, this is unlikely to happen
- Search monopoly will surely be broken, ads on youtube will continue dominance, everything else is iffy, waymo was actually a good job
- See the value of acquisitions when the internal company culture is so degraded and degenerate
- Badge stupidity, temp for no reason, no access controls, renewal without notice of deactivation, same with bus schedule thing
- At least the buses run frequently and stop in the right places, but they couldn't bother to capture who is using the buses and notify them when a change is in place
- Google bikes are interesting, how are they not stolen more often? A relic of a past time
- The perks are not what they used to be, abuse is rampant, apple has a point, free has no value at the point of use, paying even a nominal amount makes a massive difference in human behavior even with people of high integrity already

- Trace driven sim is almost an oxymoron
- Trace implies execution

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

- Combining repcut and essent
- Profiling verilator on our cores and analyze coherency traffic versus Intel cores
- Multi threaded verilator

- Fame 5 simd, repcut, essent, khronos, unified compile to emulator
  - Doing x prop correctly

- Generating a simulator from semantics translation from rtl to x86, automated pass derivation

- Direct asm emissions for rtl simulators and a c top level orchestrating them
- Aggressive caching of tiny circuits using content addressed irs
- Shared build cache for simulators
- Why is vcs compile so much faster than verilator? We want direct bit code emission but how will we support platform agnostic simd?

- Do what if analysis at rtl level, what are the true throughout bottlenecks of the web apps now days?
- How do we do this accurately and efficiently in rtl sim and fpga sim? Can we avoid dpi overhead and annoyances

## HDLs

- Rosetta code for hdls, Systolic arrays

- What are the overhead of li interfaces vs this (filament)? Real examples?
- Coping with dynamic input dependent delays or throughputs, maybe based on backpressure on output interface?
- How can you verify that the time annotations are accurate wrt the real rtl?

- Unify host language for hdl and testbench and system software language, it would be ideal or just find a way to make ffi or mixed language stuff easy

- Pitch to PLARCH audience
  - You're good at defining semantics and making them clear
  - We're good at knowing what matters and would help us
  - Nested multi abstraction
  - Hls top vs rtl top and nested tops

- Ability to introspect on subtrees of the design that are already elaborated to guide elaboration and transformation at the higher level
- Ability for subtrees to introspect the higher level model during generation
- Ability to change or transform a subtree generation process without changing the original source code, guided by the higher level model
- The paper is too vague wrt how their meta model isn't just something described as another edsl on top of their rtl level abstraction edsl
- Having a behavioral layer of chisel is interesting, there are inferred hw structures like width inference or ram port inference or especially mux inference, having a purely structural layer that is translated into in the frontend itself is interesting (from the parts of the design written in the behavioral layer)
- Need to read the PhD thesis to figure out what exactly they are talking about, it seems the authors have invented a convoluted system and no longer know how to describe it
- The paper does point out that design semantics are lost during "lowering" which is why we need to have many more primitives in the frontend that are understood natively by the backend

- Can we use content hashed ir for capturing sub circuits in a hdl for loop such that we can identify the duplicate components right from the frontend and not have to extract in the backend and also not have to encode loop semantics in the IR or pass those semantics as annotations from the frontend

## Optimization

- Talk about teramalloc, casting optimization as a rl game and comparisons to analog sizing optimization

## VLSI CAD

- Also ask if khangs team tried to inject bad initial placements into the other algorithms and what the impact was

- Openroad is so dumb working on vanilla flows that they will always lose out on
  - They should work on incremental ism, global fragment cache for generic gate mapping, Boolean opt, and even tech specific mapping with clock constraints and physical awareness
  - They can also work on better irs for semantics preservation and better qor vs verilog ingestion
  - They can work on egraphs for a generic framework of optimization
  - So many interesting things
  - Unit testing for physical design iteration
  - Apis for library like embedding of cad tools
  - Opening up the database format natively, adding type safety for querying and modifying the database
  - Vertical integration of synthesis and pnr and every aspect of the flow in a unified framework

- GPU for rtl sim
- Joules vs voltus vs powerpro

- Mixed models in rtl somulation
- Multiplier ir
- Mixed abstractions design
- Unifying primitives across models and design layers

## Quals / Thesis

- End of Moore's law end of dennard scaling so we have heterogeneous socs with accelerators and critically specialized Microarchitectures even multiple uarch on the same chip for different application and workload characteristics
- See new apple chips with pcore encore, but also other Qualcomm chip with 3 different cpu variants
- So there are two questions: what specializization uarch is possible and how to pick it which is the benchmark and presilicon evaluation problem
- But also consider other axes, Verif and power is getting harder, we want to ease these efforts
- Motivate why we need this smarts and simpoints hybrid sampling. Talk about io devices and why this matters for industry given performance modeling teams. Also perf models are often done in industry for correlation to make sure the rtl matches, written by two different teams. Brucek suggests using GPU large batch perf simulation for using many many parallel simulations
- Write papers and qual talk and presentations as a designer working on a problem and solving each piece of it
- I made rtl change, how do I see impact? I can do this.... But it has this problem. Let's try this (embedding) based on this observation (phase behavior). Then let's try rtl injection. Then we see these results. Why are the results bad? Let's analyze mkpi between full rtl and TidalSim. Oh we see that the caches aren't being warmed! How does warming change with different warming intervals? Can we also simulate intervals around those that are far from centroid? Then how can we do warming? What data structure do we need? Basically don't talk about implementation dumb stuff, just talk about a story about developing a tool and tell story through experiments and plots

- Tell a story! Start with concrete example and motivate accordingly.
- I have idea, do impl in chipyard, eval is hard! Then uarch sims, but show inaccuracy, then show sampled simulation idea for rtl sim, then how does that work, then let's try a prototype, then where does error come from? Look at perf metrics, then generalize the injection harness, then make checkpointing robust, then how about streaming,...

- Begin to write my thesis
  - Very detailed and personally driven with examples on arch simulation, analyze all the papers in the area
  - Use latex book template then migrate to usual dept template
  - Synthesizing fn simulators, see slides
  - Pre compile basic blocks from riscv into C or llvm bitcode and then add instrumentation, or do this dynamically, this seems ideal! And still maintains all the fidelity we want
  - Look at other people's thesis who did this work related to simulation

- Can we learn a performance model by getting a sunset of events from fn sim and synthesizing a new graph and then doing that iteratively to get the full graph

- For asplos the event graph stuff would be nice, after the TidalSim paper planned for isca

- I should talk about how the verification work inspired me to work on actually problems, bad benchmark, not a real issue

### Feedback on other qual

- Your vision has to be clear in the first few slides, what is your vision?
- Make the big pitch before getting into the weeds
- It's easy to say that these things are taxes (system and data center) but to what degree are these essential elements of the workload?
- If memory bandwidth is the bottleneck here then how can chaining improve aggregate performance? Can the CPUs do things while the acc are doing their thing?
- You start off taking about database operators and accelerating them but then you talk about random stuff unrelated to databases
- It appears that your taxonomy of chain accelerators doesn't include the most classic DSP pipelines, also they seem to move from most flexible to least flexible, how do each of these differ, write a concrete comparison table
- The proposal comes way too late, no clue what he's talking about until then
- What are the CPUs doing while they have dispatches a fully async task graph to the acc complex? Can they do useful work or is the work they accept bounded by soc memory bandwidth anyways?
- How can we get a number for the size of a database scan operation? The size is unknown at compile time?
  - Consider the case when you segment memory into a cached and uncached region where a scratchpad can act as a dram cache bypassing coherency, how does it compare?
- The specialize core as acc is insane, consider how that would change the programming model! You have to migrate state!
  - Even if you have interstitial code and you have a core on the task graph to run that computation wont that bottleneck the entire graph execution?

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

## Parallel Programming Projects

- Optimizing nic and core interface
- Linear algebra with many gemmini
- Chisel parallel elaboration
- Livehd parallel compilation to verilog, ir pass parallelism
- Coarsifying rtl to higher levels models to use to build large data centers simulations with these coarse models but using rtl as the source of truth
- Extend exo for multicore
- Parallel algorithm mapping on het for system
  - Use existing Qualcomm chipset
- Sat or smt sampling parallelization
  - Using many cores for sampling for hypercompressbench

## Luca Carloni's Talk

- Luca claims that we want to integrate others components in other languages or spec platforms, I'm not sure this is valuable from industry perspective or academia in fact
- Not having things in common language forces awkward interface boundaries and not able to use common tools that depend on language level features, or can cause stripping of semantics
- The chip appears to have very regularly sized tiles, is that the actual physical tile?
- The programming model is interesting, it does seem to nicely integrate with the user space software stack, the esp primitives seem simple and sufficient
- Of course there is some overhead due to io plane based programming and lack of core coupling
- The "services" provided to an accelerator tile are interesting, we also would like similar things, when it comes to dma at least and maybe a llc coherent acc local cache
- Their dvfs controller as a service is pretty cool, I like the general idea of placing hard abstractions on module or tile boundaries
- The clean integration of a tlb and the os technique to program it when the acc is dispatched is copl
- They did need to do some kernel modifications, but that seems reasonable enough
- They have a very wide parallel off chip bus for dram fpga bridge
- 64 bit bus! And they have 4 of them
- Token based power management scheme, tokens are basically credits for power consumption, they are used by each tile and the pm controller to throttle
- They can dynamically activate more llc and io tiles on the fly at runtime, pretty cool
- Scratchpad tiles can be dynamically used as llc storage! At runtime they can activate and deactivate these as they measure the noc traffic
- They can support shared memory cross acc access as well as acc to acc direct dma, the dispatch is via some kind of descriptor that is kicked off by the host cote

## Other Groups

- Talk about Priyanka and her groups unified vision going towards common project, compilers, pl, rtl, arch, applications
- https://stanfordaha.github.io/aha_tutorial/
- Oh wow their tutorial is quite impressive at least on paper
- You can see Priyanka's coherent vision
- even still, it is fred + kunle + priyanka and they have a clear vision and coherent execution combining the strengths of their students
- it is so far ahead of what we have
- yeah it doesn't interest me as a domain, but that's besides the point right, it shows very clear vision and ability to compose a bunch of 'random' projects
- they picked a very specific domain, and built all the right tools and integrated them tightly
  - the chipyard + gemmini view of this is not so strong
- yeah perhaps, but there are other groups working on sparse LA acceleration too - it's actually a popular domain
  - when they build such a system, they are creating a baseline others will be forced to compare against
  - it's actually similar to gemmini in that sense
  - their thing is more fair than that - the custard compiler can target AVX and GPUs too
- their methodology is actually more general than sparse LA to be fair - it is about the general process of creating a CGRA arch + generic mappers / compilers, there are other groups working on other domains that could adapt their flows
  - all to say, i have much greater respect for this group of PIs than i did before

## Amazon Trainium Talk

- They use heavily cisc vliw arch, instructions take hundreds of cycles, they don't do multicore RISC-V, very specialized hardware
- The control flow has a lot of flexibility without using classical control cpu, instead there is some microcoded compiler programmed control engine
- Ability to add new instructions over time that chains things or does some complex control stuff, programmed during chip boot or per network
- Custom operator and activation functions or data types can be supported by the vector unit, nearly arbitrary pytorch or jax can be targeted to this unit
- They have insane amount of flexibility wrt data types, they have support for things like 3-bit precision using their vector engine, not sure how granular it actually is

## PLARCH Talk Notes

- Never say "we want"
- Instead we are making an argument about what's important to work on
- It's not a demand, just something worth motivating

- Don't say that these synthesis algorithms take up too much time lol, that's just wrong
- Don't talk about these things as if they are done
- These are proposals for things that should be enabled by future research
- Image size and number mapping to the slides
- Firrtl, talk about circt, core part of circt
- Then add another circt slide
- Remove chipyard detail slides
- Highlight results of chipyard tutorials, highlight the impact, lots of people, lots of citations, take from sagar's job talk, talk about the massive soc that people build and simulate during the tutorial
- Make the claim that the rest of the talk is not related to chipyard
- The claims in the demo are applicable to all soc design frameworks
- What is the takeaway from the demo, present it up front before going into the demo, it's cool to integrate all this ip, but there is lots of friction involved
- Make it clear that with a better example, changing a tiny thing forces entire recompilation, use a diagram
- For the incremental stuff make the diagram clearer
- For mixed abstractions mention prior work, systemc virtual platform, cocotb, switchboard zeroasic, say that they are all clunky, we need first class support
- Firesim also does this, quite clunky, mixed model simulation
- Ending is abrupt
- Spec first vs design first people need to meet in the middle
- We have more need to build things vs working at the spec level and being limited by the refinement strategies

## Google Simulation Summit

April 26, 2024

- Baris and kan are going first
  - A quite vague thing...
  - Google traces, memory and inst traces, branch info, dynamiorio format, per thread data
  - They reconstruct per core traces from to study thread switch behaviors, 1m inst context switches, so quite a small quanta, so prefecthers aren't warm
  - They do reg dependency analysis, they perform limit studies with ideal caches, figure out how good the traces could be
  - They analyze the working set size and compare against cache capacities
  - They also have prefecthers models and determine that they aren't that effective
  - They do pca on the traces to only look at a subset of traces, embedding unknown
  - Google traces gives branch info to simulate branch predictor, and inst cache via instructions, but no microop info so the decoder state is hard to model, micro-ops cache makes 10 percent change in ipc, register dependency are not known, we don't know
    - We need microop cache simulation, num of uops per induction, and execution cycle of each uop
  - Also add instruction dependencies, add reg info in the trace, at least give a dep graph, current form doesn't know anything about scheduling decisions
  - Also need accurate simulation of the LLC, hard to simulate, hard to simulate coherency, can we partition the simulation? Use a coarse LLC model maybe
  - Simulation throughout is an issue since each core can't run on a host core for parallelism, partitioning the LLC could help but need to compensate for coherency and sharing overheads
  - Currently the traces don't have info about what is running, kernel code and idle time arent captured, don't know exact start and end of each thread execution
  - Some physical cores have different ipc and then the traces come out of alignment
    - Dont know what this means, maybe related to LLC modeling, of course cores run at different ipcs
  - Need to record inter thread dependencies, mutex and barriers
  - Need to record dependencies of a thread when it is unloaded, like disk or network io, hard to optimize scheduling policies, why was a thread swapped out?
  - Number of uops, inst dependency graph, high accuracy timestamp, inter thread dep, reason to swap thread
  - Simulator need to support modern uop frontend, multi core LLC sim, implement dependency and synchronization from traces
- Gem5 talk time!!!!
  - Gem5 is slow, they know
  - Gem5 is frontend bound, much faster on m1 vs xeon lol
  - 1.3x speedup doing 2 threads running 4 core sim, doing parallel dispatch of multiple events seen on the same tick
- Ok now the Google simulation needs and challenges talk, this should be good hopefully
  - 3 netinfra people, 1 chip, 1 deep mind
  - Alon Bernstein, netinfra
  - Simulator results must be believed, what if scenarios, codev of sw before hw is ready, sim for regressions, tco simulation is also important
  - Simulator needs to be integrated into the sw validation lifecycle... But why? Don't we just have staging hardware?
  - Isekai packet level network simulator, rdma falcon architecture
  - Built on OMnest, OMNet++, built traffic gen, nic ,switch model, qos, can simulate 1 Jupiter super block, integrated into artra-sim to model ml workloads communication
    - They needed to correlate their simulator vs rtl, they traded off accuracy for time, they neglected caching effects on the host, retransmission, congestion were modeled
    - Hard to scale simulator for larger networks, maybe we can parallelize the event queue, not sure, they can only simulate 1-2k machines at reasonable speeds, at packet level
    - For workloads, they simulated network traffic patterns and representative workloads
  - Simulator is in critical path to time to market, can't build bespoke sims, need a pluggable simulator infra to evaluate end to end app acceleration potential
  - Can we go low to high, ultra detailed and then coarsen based on what we care about, rather than the opposite, where we make things fine where we see errors vs reallty
  - Accuracy on absolute vs relative, the sensitivity must be right! The gradient! Not just relative
  - Making sure simpoint samples and representative is critical
- https://mlcommons.org/working-groups/research/chakra/
  - Sophia asked about industry perf models and how academics can engage?
- Now for the mlsim talk
  - They want to do perf prediction model that's faster than a regular uarch model
  - They want to train on a few Arch's and then generize... Somehow
  - They assume a perfect front end, no bp or icache, learn dynamics about the backend of the pipeline
  - It's kind of stupid
  - Too simplistic, doesn't allow you to make tradeoff decisions
  - They do what if analysis by taking oracles of all components except the one under sweep
  - Pretty good idea to use these oracle models to identify per interval throughout constraints
  - Need to use time series into compact features that don't grow with the size of problem, turn time series into distributions and use those as the embedding for a program
  - So they don't consider the frontend, so this does seem off, like what is their reference number? Is it gem5 sim of a Google traces? How is the cache state warmed up? This is very odd they are using a custom m trace based cycle exact simulator
  - Their diversity of training data is quite suspect, most behaviors across 100k insts is quite averaged, not hard to predict
- Time for Trevor's talk
  - Excited
  - He has had many highly cited papers
  - See his ispass papers
  - Time based sampling is too generic, we can do workload specific methodologies
  - Looppoint and barrier point are quite interesting, use something higher abstractions vs BB, like loops
  - Pacsim contains logic for power modeling on soc and dynamic hw and sw, don't want any up front analysis like simpoint
  - Simulation regions transition between functional and detailed simulation
  - Also integrates the impact of dvfs
  - Very good insight, streaming sampled simulation, integration of power
  - We can't do O(1) simulation, because dependencies of power on previous region
- Ok time for micro services talk
  - They want to build a rpc benchmark suite basically, just want to model rpc request response characteristics
  - Tanvir has quite an annoying speaking cadence
- So the main issue with ml things is that they aren't learning any new representations. It is like training a ml model on a classical cv algorithm, it doesn't make sense

## Professors

- Daniel Jimenez
- Daniel Sanchez
- Krste
- Scott beamer
- Heiner Litz
- Jose renau
- Nam Sung Kim
- Lieven
- Trevor
- Bora
- Priyanka
- Fred
- Rachit
- Onur mutlu
- Partha, industry pi
- Brucek and Mark ren
- Martin maas
- Kurt
- Chris fletcher
- Luca carloni
- Luca Benini
- Vlad elad krste ion stoica as startup PIs
- Gilbert bernstein
- Chris batten
- Adrian Sampson
- Jrk
- Patterson
- jason lowe-power
- james larus (manticore PI)
- Christina D from CMU
  - Actually from MIT
- Andrew Kahng

- Compare and contrast the different prof types and associated research philosophy
  - Paper Pushers
  - Hyperscaler Pets
    - or Industry Oriented
  - Fallen from Grace
  - Incompetent / Highly Competent
  - Highly Competent But Uninspired
  - Highly Competent But Easily Propagandized
  - Highly Competent and Inspired
  - Gods and the Truly Exceptional
- Create a taxonomy and terms
  - Effective boss: the paper God, Hyperscalers, niche industry, ego
  - Competence: Incompetent, Moderately Competent, Highly Competent
  - Time horizon: long, short, ultrashort
  - Source of interest: ego, 'just' work, personal curiosity, in the blood passion
  - Research inspiration: uninspired, general field propaganda, truly inspired

## Leveraging coeffs of a PMU-based regression model

Motivated from the CAMS presentation about using ML for transferring benchmark scores across different microarchitectures with just PMU counter data.
That original presentation was poorly motivated since you already have hardware for both microarchitectures, but the real value lies in the coefficients of the trained model.

Can we understand the impact of various uarch features on speedometer.
A simple regression study of PMU counters while running speedometer and doing a simple regression while sweeping the runtime availability of uarch resources would be insightful.
Perhaps there is some way to inhibit the cache capacity (by pinging it from other cores) or the BP capacity or the ROB capacity or otherwise.
This is something that would be very hard to investigate using simulation.

Similar idea for the Geekbench OSS Rusty baremetal reconstruction project.
