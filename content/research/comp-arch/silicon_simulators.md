+++
title = "Silicon Simulators and Silicon Bringup Infra"
date = 2023-12-18
draft = true
+++

# Silicon Simulators (Krste's Idea) and Silicon Bringup Infrastructure

- We already have
  - SW RTL simulation (too slow, hard to extract fine-grained parallelism)
  - FPGA-based emulation (e.g. FireSim, Zebu)
    - fast-ish, but not fast enough for rack scale simulations or even multi-FPGA simulations (at best 1MHz, which is just barely feasible for software studies and comes at a great expense wrt HW complexity and cost)
  - ASIC-based emulation (e.g. Palladium)
    - ultra expensive and exotic, low latency startup, but still not fast enough (we're looking for something around 50 MHz to be viable)
  - We can try building custom ASIC-based emulation machines that can go even faster, but we're not likely to succeed
- What we want
  - Higher throughput (50+ MHz)
  - More introspection (ability to pause, inspect all state, inject any state, rewind, trigger on conditions, extract waveforms, and detailed performance tracing)
  - Lower startup latency (this is hard to improve if we have to depend on the FPGA toolchain, but there may be ways out - Tenstorrent Blackhole RTL simulator, Cyclist-style lol)
  - Easy pluggable platform
  - SW optimization platform
- What is becoming available?
  - Tapeouts, lots of them, especially at older technology nodes. The chips from these tapeouts shouldn't be thrown away but used for architectural studies.
  - Package-level integration is becoming cheaper and more feasible for even small teams to design
    - No exotic SERDES required to talk to chips within a package, wide parallel buses become viable (smaller peripheral footprint, simpler integration)
    - Can mix with on-package DRAM too
- So, we want an even faster and higher capacity simulator than we currently have
  - At the same time, the building blocks of the system stay mostly the same
  - We are mostly interested in building a few pieces of novelty that are domain specialized and *scaling software* (to do/enable systems research)
  - Also, we want to enable a new paradigm where people who are thinking about taping out a custom SoC can prototype the entire system as *silicon* but still be timing exact and have unlimited introspection (imagine pulling cards off a shelf for Neoverse cores, generic logic (as FPGAs), huge caches/uncores, vector cores, video codecs, NPUs, peripheral IP, and so forth + putting them in a box and then having a 50 MHz simulator of your proposed system)
  - Ideally those FAME silicon blobs will have plenty of runtime configurability (overprovision resources (e.g. ROB size, L1i cache size) and limit them at runtime). Perhaps those blobs can use external memory to dynamically expand those resources if the RTL is architected to support it.

## The Proposal

- Tapeout a FAME-transformed model of some RTL (an OoO core, a vector machine). In doing so, you can get very high simulation throughput (1 GHz+), while maintaining cycle exact accuracy wrt off-chip devices (DRAM, etc.).
  - Baseline is just FAME1: accurate off-chip DRAM time modeling, full introspectability, detailed tracing, high frequency operation, token channels for host communication, on-board host
  - Next is FAME5: We can't fit many GigaBOOMs on a U250 (or even a VU19P for that matter). FAME5 allows us to fit more (maybe a 4:1 multiplexing ratio is doable without any other memory optimizations). But we can take it one more step and FAME5 the RTL we put in silicon! Since we can design a completely custom uarch for this purpose and pipeline the heck out of the combinational logic, we should be able to get very high multiplexing ratios on the order of 64:1. This will of course reduce the effective simulation throughput, but it is compensated for with the very high host frequency and the ability to hide the latency of the off-chip links.
    - Being able to leverage off-chip either co-packaged or board-level DRAM to further extend the multiplexing ratio is a next step. Getting large caches to work with FAME5 will be tough since we will run out of on-chip SRAM capacity.
  - RTL configurability (runtime limitations): the target RTL is configured with overprovisioned resources (cache sizes, ROB/LSU size, cache organization parameters). At runtime, those resources can be limited to perform sensitivity analysis.
  - RTL configurability (runtime expansion): one step further is to use off-chip DRAM to 'expand' any given resource using memory optimizations (this is quite difficult to do in general, so it will be specialized to caches initially)
  - Connecting multiple models together with timed ports: how can we connect different FAME-ed RTL models together that are taped out separately?
  - Exploring decoupled simulation execution (A-port style) vs central controller: something to look at when scaling up multiple models - it is probably easier to do things in a decoupled way, but it will make introspection/pausing harder.
  - DRAM extra-capacity chips: how can you mix in DRAM-only cards into the emulation system to add capacity to model memory structures or to the modeled SoC DRAM itself.
  - FPGA integration for custom logic: naturally, you don't want to just build a very fast simulator without the ability to add stuff to the SoC, an FPGA-card will be required
  - TT Blackhole integration for custom logic and simulation hosting: if we can get the Blackhole RTL simulator working, it makes emulation of arbitrary logic way easier than using an FPGA, and we can buy the individual chips from TT too
- Build the physical platform
  - In the context of trying to evaluate this idea at a high-level for feasibility, think about board level constraints
  - Lots of board design, SERDES design, LIBDN integration, token transfer, central controller, defining the host of the simulation

### The First Step

- The primary mismatch between FireSim / RTL sim (of an idealized chip in the ideal environment) and the taped-out chip is DRAM (off-chip bandwidth in general)
- What we really need are LVDS links, high bandwidth, fully implemented, no power or area constraints for the first iteration, focus on performance and reliability and debug
  - On the TX side we need to have all the usual stuff, per-lane clock skewing, scrambling, coding, all the self-test machinery that goes with a typical SERDES
  - On the RX side we need lane combining, CDR (very important), and the usual RX stuff (equalization)
- Importantly, we can leverage off-the-shelf FPGA devboards to develop all the digital control and datapath logic (maybe FEC/CRC if needed)
  - Provide a reference for the performance of all the analog components
  - Be able to measure a real channel and manipulate the channel to observe how well our digital schemes work
- Spec out the notion of LIBDN components placed on a common motherboard and how they communicate (both the physical layer and the token-layer)

Just to say this very explicitly: **we need high bandwidth LVDS links**.
That enables everything.

Trying to do other things like proxy PCIe over serial Tilelink, or building a DDR4 PHY + MC, or attaching other peripherals through the FPGA for the custom chip (CAN, SD cards, HDMI, Ethernet) are just not the most crucial things to do.

Trying to do a very wide parallel bus (for Tilelink DRAM traffic) comes with its own problems.
This might be a good way to get started, but long-term, we can't rely on a very wide bus.

## Implementation Notes

<!--
- Tapeout a fame model of rtl along with ways to connect and synchronize it to other blocks
- Connect to fpga for custom blocks or for memory
- Same thing for co simulation and state influence from rtl sim to guide functional sim commit checks
-->

- Establish upper bounds on various simulation techniques, see article Igor sent me about circuit connectivity (Rent's Law)
  - This also came up in a RAMP retreat slide deck from Mike Butts (`RAMP2010_MButts20Aug (Slides, 8-25-2010).pptx`) (links below)
  - https://web.archive.org/web/20230927151250/http://ramp.eecs.berkeley.edu/
  - https://web.archive.org/web/20230305000041/http://ramp.eecs.berkeley.edu/Publications/RAMP2010_MButts20Aug%20(Slides,%208-25-2010).pptx

- https://www.linkedin.com/pulse/chip-bananas-b-n-patrick-madden-1d49c/ (Rent's Law)

> For reasons, I've been thinking about circuit topologies quite a bit lately. It's stuff that probably wouldn't make it through a review cycle for a conference or journal (ask me how I know), but I think it's interesting. I figured I'd write down somewhere, to open up my brain space for other stuff.
>
> First, let me start off with E. F. Rent, who was an engineer at IBM back in the 1960s. He did some analysis of the structure of circuits in the early computers that IBM was building, and noticed a power-law relationship between the number of components on a circuit board, and the number of wired connections. Landman and Russo wrote a nice paper on this in 1971 http://ieeexplore.ieee.org/document/1671752/. The big take-away is that if you have B logic blocks on a circuit board, and P pin connectors, P = KB^r for some constant K (usually around 3 to 5) and the "Rent exponent" r (usually 0.6 to 0.7).
>
> Why should I care? you might ask. Good question!
>
> Rent seems to have captured something fundamental about the structure of complex, interconnected systems. It's an observation, not some sort of law that must always be followed -- but time and again, if you decompose a system into smaller and smaller building blocks (or go the other way, building things up), you'll usually see Rent-like phenomena.
>
> There's a range of potential r values. If you do a completely random arrangement of circuit elements, and then divide this arrangement half -- then roughly half of the wired connections will go from one side to the other. This random jumble has r=1.0, and would be a total dumpster fire of an arrangement. High values of r indicate a poor job of arranging things, and potential for improvement.
>
> Suppose instead you have a circuit that is a perfect rectangular mesh, and you clip out a square subcircuit from the middle. If your square contains n logic blocks, each side of the square is the square-root of n, and you have a Rent exponent r=0.5.
>
> This underlying structure influences how we design complex systems. Given how much circuitry we might want to insert into a circuit board, logic module, chip, whatever, we can guesstimate how many connection points we'll need for it. Things like multi-level hypergraph partitioning work because Rent's Rule is in effect. https://dl.acm.org/doi/10.1145/309847.309954 My bisection based placement approach from a zillion years ago relies on this too. https://doi.org/10.1145/378239.379064 (shout out to Mehmet Can YILDIZ for his work on this).
>
> I view typical circuits with r>0.6 as "apples" -- they're the garden variety sort of problem, the typical case. Anything with r=0.5 is an "orange;" there are a lot of these, but they are definitely not like apples. The random dumpster-fire arrangement, with r=1.0; let's call those raspberries, the kind you find at a second-hand store.
>
> While it wasn't the initial intention, some experiments really highlighted the difference. My advisor Jason Cong put together a set of synthetic benchmark circuits https://doi.org/10.1145/1119772.1119914 These "Placement Examples with Known Optimal" PEKO benchmarks got a ton of well deserved attention. Because the circuits were synthetic, it could be determined what the best possible arrangement of circuit elements was -- and from this, you can determine how far away from an optimal solution a circuit placement tool is. And it turned out, it was pretty far -- interconnect lengths were 1.66 to 2.53 times higher than the best possible case.
>
> The gotcha on the PEKO benchmarks, though? On the surface, they look like apples (where you would anticipate r>0.6), but they're really oranges (r=0.5). And if you've got an orange, you can use a completely different placement strategy, and cheat the system.
>
> Because of the low Rent parameter, it's possible to map net cardinality to length, and then use a shortest path or breadth-first search algorithm to get an ordering of the logic elements. I did a paper on this, with an astoundingly fast and simple approach getting the best published results for the big PEKO benchmarks https://doi.org/10.1145/1120725.1120864 (shout out to Satoshi Ono for his work on this -- and to the great folks at University of Kitakyushu, who hosted me for a sabbatical).
>
> To be very clear -- our "beacon" placement approach was a hack. A cheat. A dirty underhanded trick. It does not work for real circuits, and is a bad idea. We exploited the low Rent parameter values of the PEKO benchmarks to side-step what makes circuit placement difficult. It works for "oranges," but it is a disaster for "apples." Apples are not oranges. The Rent parameter really really matters.
>
> Which brings us to the kerfuffle over placement for machine learning circuits. These circuits are weird. I can't stress enough how weird they are. Absolutely bananas. For ResNet, VCG, and others, you have a linear arrangement of functional blocks. The Rent parameter for these? r=0.0.
>
> Apples are not oranges. How you handle them in placement is different. And bananas are definitely not apples or oranges.
>
> Is there a hack, a cheat, a dirty underhanded trick for bananas? Absolutely! There was a contest at https://ispd.cc in 2020 for mapping machine learning kernel graphs onto the https://Cerebras.ai wafer-scale processor. https://www.ispd.cc/slides/2020/ISPD_Contest_Closing_Session.pdf The best methods to do this looked absolutely nothing like conventional circuit placement approaches. Evangeline Young's group from CUHK won the contest, with a method that arranged the kernels with a breadth-first-search ordering (sort of like our Beacon hack for the PEKO benchmarks). https://doi.org/10.1145/3400302.3415688 My group had a similar approach, with a bit more dynamic programming mixed in. After Evan's awesome student Bentian Jiang helped me fix a bug, we got great results too. https://doi.org/10.1145/3505170.3506730
>
> It's kind of remarkable; Rent's observation from more than fifty years ago keeps popping up again and again. Rent's Rule has been observed in natural systems too -- Lou Scheffer, who had a long and illustrious career in design automation went to HHMI to study brains -- and sure enough, the Drosophilia fruit fly (which I'll assume is fond of apples, oranges, bananas, and raspberries) has a Rent parameter https://doi.org/10.7554/eLife.57443
>
> Here's a figure from Lou's paper.
