+++
title = "Discussion with Eric Quinnell from Tesla"
date = 2022-09-29
+++

**Disclaimer**: these are my words, not Eric's. I have used some creative license.

Eric Quinnell from Tesla came to speak to the SLICE lab on 9/28/2022. [Download his slides here.](misc/tesla-talk/Eric_Quinnell_Tesla_Talk.pdf)

> Title: Industrial Ranting about Current Computer Micro-Architectures
>
> Abstract:
>
> Industrial Silicon design provides incredible opportunities, including designing gaming consoles that elevate you as a veritable demi-god to your nephews, while later handing you a severance package as your machine is out-designed. This talk covers an analysis of current CPU micro-architectures, showing what works, what does not, and why OP Caches and SMT designs are The Worst™.
>
> Be your ISA x86, ARM, or RISC-V – any bad micro-architecture can equally ruin them all! Come learn how to see the big picture in CPU micro-architecture so that you too can one day work on completely unrelated AI Silicon for self-driving cars and robots.
>
> Bio:
>
> Dr. Eric Quinnell received his BSEE/MSEE and in 2006 his Ph.D. from the University of Texas at Austin in the topic of Floating-Point Fused Multiply-Adders. He began his industrial career at AMD designing floating-point and cryptography units on the Bobcat x86 and Jaguar x86 CPUs, the latter being the CPU core in the XboxOne and PS4.
>
> Eric spent nearly a decade at Samsung on the (now retired) Exynos/Mongoose ARMv8 CPUs on the floating-point, L2/L3 caches, and branch predictor units before joining ARM as the Cortex-A CPU micro-architecture performance research lead. Currently, Eric works at Tesla building the hardware and silicon for the Dojo AI Supercomputer.
>
> Dr. Quinnell has many patents, papers, and all the necessary qualifiers required to come talk to grad-student engineers about all the things. He lives in Austin, TX with his wife Leslie, and three children.

## Notes

### Criticism of Variable Length ISAs

What you're saying is that the relatively small code density improvements from the RISC-V compressed extension are dwarfed by the overhead of variable length instruction fetch and therefore limited decoder width? So we're ok with sacrificing cache area consumed by full fixed-width instructions to increase fetch/decode width? Are there no uArch tricks to still have wide decode with variable length ISAs?

- Yes, variable length encoding has marginal code density improvements and icache fetches can be easily prefetched anyways using the branch predictor to guide prefetching.
- The overhead shows up in latency of fetch and decode as well as the maximum width of both of them (and area density) - keep it simple, stupid.
- When we're dealing with large programs with 100 Mb of instructions, we will anyways have to make roundtrips from L1 to system cache all the time - so trying to keep just a few insts resident in L1 via compression is a bad tradeoff.
- The simple RISC CPU always wins ([P6](https://en.wikipedia.org/wiki/P6_(microarchitecture)) is the golden uArch) - more complication leads to bloat and misleading benchmarks. Eventually you will get fat and stupid and lazy and a stronger, younger competitior will come along that starts from scratch and destroys you. This is why the Mongols kept engaging in war and conquering lands - if they settled down, they would get soft and be conquered themselves - this plays out in 10 year cycles in semiconductors esp in CPU uarch.
- He is bullish on Rivos - those Apple engineers know what they're doing and they will replicate the M1 uArch with RISC-V. They will scratch variable length instructions and variable vector length (RVV / SVE) and will produce a very wide fixed width powerhouse, and will destroy SiFive and others competing in the RISC-V high-end market (HPC and servers).
    - Criticism of RVV: most vector units are used as memcpy accelerators (in the majority of general workloads, specialized ML workloads use dedicated ML accelerators). The FP pipes are used to perform the copies while the int pipes are used to predicate partial copies (at byte-level) on the FP pipe. Variable length vector ISAs need this kind of predication frequently for small data length operations (smaller than the maximum vector length), which show up often. NEON is successful due to its fixed width SIMD model, SVE probably will never catch on (or will be niche).
- What are the actual workloads you are designing for? For phones it is JIT'ed VMs (Javascript) and for servers it is *also* JIT'ed VMs (JVM). Indirect threading -> branch prediction needs to speculate often -> variable length fetch complicates matters.
- He mentioned that he came around to this view after being laid off from Samsung after A76 killed their custom CPU efforts. He spent 6 months in thought and experimentation and came to this conclusion (among others).

### Performance Modeling

Why was this phenonema (overall bad tradeoff of code density vs decoder width) not caught in performance modeling? Are the benchmarks just wrong?

- The performance models indeed caught this problem as well as the area overhead, however people just didn't pay attention
- This is due to siloing within each company and across companies. People who bring up the right benchmarks and simple arch are ignored in favor of doing 'the next thing' in ISA evolution.
- *My note*: It is hard to believe that this is a good explanation - but maybe it is true that once variable length instructions are in, they are impossible to get out of an ISA.

### Benchmarks

How do you extact meaningful benchmarks from emulation or real silicon?

- This is a big problem. Most benchmarks are meaningless - see GeekBench (he claims their GEMM benchmark was just 3 nested loops). MLPerf gets us some of the way there, but things like ResNet50 are already out of date and Tesla will strongly critique this during AI Day this week.
- Just looking at what threads are 'consuming time' is often misleading. See a Javascript runtime where the main thread consumes a large fraction the CPU time, but is actually just polling a timer, while the worker threads are actually doing something, but for short CPU time durations. A naive allocator will pin the main thread to the high-perf core and put the workers on the efficiency cores. We actually want the opposite.
    - When extracting benchmarks from long applications, you need to not only ask what is consuming time, but also "*what is it doing?*"
- Getting adoption of any new benchmark is tough. Marketing is critical. At the end of the day, people (Dilbert-tier managers) compare uArch based on benchmarks, even if they are bad.
- Someone just has to push new benchmarks and show they are meaningful. We see this happen in software (in cycles) - one set of benchmarks are used for a while and causes research stagnation (dhrystone, SPEC), and suddenly one group releases a new benchmark set (MLPerf, ???) and innovation spikes. But people still feel obligated to collect numbers using the old benchmarks. Why? Just toss them aside.

### Full Self Driving

When will FSD work?

- Understand the actual point of FSD. Musk wants to set up a Mars colony filled with Tesla robots who build a civilization blueprint that allows Musk to go there in his 60s.
- So, how does Musk find the funding to build the tech for these robots? Well, vision AI is critical, and how better to monetize vision AI than self driving cars?
- Understand that FSD will never be as good as a human driver *paying attention*, however it is *already way better* than human drivers in general, who rarely pay attention. It already prevents way more crashes than it causes.
- 100% FSD may be a dream for a while, but regardless it is a great way to get camera data to train models for (eventually) the Mars robots.

### Tesla Engineering Culture

Proper engineering culture is what makes or breaks a team / company and its innovation

- The person at the top (and all the way down) has to let the engineers do what is necessary (break things and make a mess and screw over people who are lagging behind (low IQ and low agency individuals and teams))
    - Jensen and Jobs and Musk are good examples of this, in contrast Intel leadership and Tim Cook nowadays is the opposite of this
- Musk is willing to fund any insane idea and doesn't hold back the engineering talent. The top performers bubble to the top and no effort is made to 'raise' normie engineers up - they are just tossed aside. Excellence in engineering is how you are judged - no upper management arbitrary goals and meaningless benchmarks.
- Being controlled by outside forces leads to death. Intel still has to support the A20 bit (https://en.wikipedia.org/wiki/A20_line) only because of external pressure and a culture of not breaking obviously bad mistakes. Of course, if their leadership was sufficiently visionary, they could tell their customers that they are doing a clean design and deleting things and they will just have to recompile - but they can't - that's their whole business model. Apple is different - they can make these sweeping changes and force compliance to move forward.


### On the Importance of Deletion / Deprecation

Destruction is just as, if not more, important than creation.

- Deletion of primitives should be built into an ISA spec
- What we see happen is often the opposite: ISAs get bloated over time (Power, x86), more things are added to the base ISA, uArchs get more complicated and people feel external pressure to support legacy features
    - Then someone comes up with a new clean room ISA (RISC-V) and it gets traction and a jump in uArch innovation
- ARM is doing a good job with deleting stuff from new specs and forcing compliance by just scrapping the notion that all software must run on all iterations of a processor
    - We may hear something about this soon ;)
- Break things that are bad decisions and let people downstream suffer or adapt
    - Coddling creates weakness - APIs (and ISAs) should get rid of bad decisions quickly and force others to use the better approach. Backwards compatability is only a concern if you make it so.
- Obsession with "backwards compatability" is a codeword for stagnation and rot

### Precise Exceptions in DOJO

So DOJO doesn't have precise exceptions. Why?

- We ran out of time and the software people wanted silicon now instead of 6 months from now.
- Anyways we control all the software so debugging may be painful, but it's all internal. If there is an illegal instruction or any other trap we can resolve it with silicon debugging and maybe emulation. But it would have been more painful to hire more people to implement precise exceptions.
- Same thing with virtual memory - just punt it to software. The tradeoff is all about iteration speed - NVIDIA can't supply us with enough GPUs for training on millions of hours of video, we have to take drastic action quickly.

### Academic and Industry uArch Collaboration

Academic and industry uarch collaboration fell through due to a [UW-Intel patent dispute](https://www.manufacturing.net/industry40/news/13073644/intel-uwmadison-settle-patent-lawsuit) that lead to industry paying settlements - now everyone keeps arch features within each company and away from academia.

- We're trying to overcome that blemish and resume collaboration
- Tesla is committed to putting more things in the open and the DOJO fabric will be open sourced at some point

### Ethernet Superiority

Ethernet's physical layer has been progressing faster than PCIe. We prefer to use Ethernet for chip-to-chip and board-to-board communication. DOJO fabric is all Ethernet - no PCIe used, even for host-accelerator communication (which is all on chip anyways). PCIe requires retimers for long traces unlike Ethernet too. They use a combination of copper and optical physical channels.

### On Publish or Perish

Eric also mentioned his disdain for the publication mania in academia. He is supportive of efforts like ArXiV that have changed the model of info dissemmination from conferences and journals to just a website on which nearly anyone can publish things. He mentions that nearly all cutting edge ML research is just published in the open, completely independent from any academic venue.

This conference / journal / peer review culture supports some very bad things. Constant use of the same stale and meaningless benchmarks trying to one up each other. Inability to work on long term vision problems. Politics on review committees preventing good papers from being published. Peer review doesn't address any real concerns about a paper - it is just a formality at best and a citation farm at worst. Elevation of frequently published people who may not have any real innovation but rather just constant iteration of a basic block (*my note*: see KAIST's papers at any circuits conference).

## More Notes (from Charles Hong)

### Variable length instructions

- We discussed a bunch of cpu arch/uarch stuff
- General idea: fixed length instructions allow for wide decoders that stay simple and save power/area

### Why don’t people just accept Apple's uArch as the superior CPU uArch?

- Actually it's not just Apple - CPU architectures descending from Intel P6 (and before) all have the same structure
    - NetBurst implemented extra stuff (SMT, etc), but it didn’t work
    - An example of people always adding and never removing
- Apple is the best now, but their engineers are leaving and tech companies never stay at the top for too long
    - need to be like mongols and keep expanding, don’t get soft (lol)

### Tesla Internals

- Fire and floods are common in the lab because Elon wants to move fast - chemicals strewn about
- FSD not likely to "work", but it actually already drives better than most people because people are bad at paying attention
- The actual goal of computer vision advancements is to send stuff to Mars with Elon for his Mars base
- Ethernet is the best physical link standard

### Benchmarking and Modeling

- People really want benchmarks - e.g. GeekBench guy came in and made lots of money
- Performance is accurately captured by industry models, but designs target the wrong metrics
- On using emulation to generate new benchmarks from traces of long running real applications
    - I don’t think Eric had any particular insights on how to extract new benchmark suites
    - How do you know the things you run in emulation are the right benchmarks in the first place?

## My Perspective

### We Need to Settle Arguments

Well clearly someone is right: it is either Krste (RISC-V compressed instructions aren't a big overhead, we can still do wide decode and retain high code density) or Eric (you can't do wide decode easily and it will be harder to hit optimal uArch to run HPC/server workloads). Who is it? How can we do the experiment in the open?

- Question: Does a variable length ISA overall harm IPC and critical path on HPC workloads?
- Platforms: (1) A 4-wide RV64GC BOOM (and all the usual variable length perf optimizations). (2) A 8/10-wide RV64G BOOM (stamped out parallel decoders).
- Benchmark: Some typical phone-user JITed workload (e.g. Javascript) and some server workload (e.g. JVM-based webserver) + physical design evaluation.

### Working at Tesla

From my impression, Tesla is a great place to work. The hierarchy doesn't just exist for its own benefit / governance, but actually enables downstream engineers to do what needs to be done. No annoying or incompetent managers. Musk hand-selects the best people to lead each team. Only recently have they been opening up their silicon team to new hires vs poaching. Tesla doesn't seem to be interested in 'maintenance' of software - people are expected to adapt to new APIs, remove deprecated ones, and rewrite often.

A few days later, I saw this conversation [from here](https://twitter.com/TechEmails/status/1575598387335901190):

> Parag Agrawal texts Elon Musk
>
> April 9, 2022

{{ image(path="misc/tesla-talk/musk_parag_convo.jpg", width="50%") }}

This just confirms to me that Tesla is the place to be.

## Un-Asked Questions

- What is the SOTA of industry-tier perf and power models? Do they also consider floorplans / have congestion models?
    - How do these models compare with academic perf models e.g. gem5 - just how bad are the academic models?
    - Is co-simulation actually used to evaluate new arch features?
- What metrics do academics fail to focus on?

