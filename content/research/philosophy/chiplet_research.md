+++
title = "Chiplet (CompArch) Research in Academia: Is it Sensible?"
date = 2023-02-28
aliases = ["misc/chiplet-research"]
+++

## What Are Chiplets?

[Chiplets](https://en.wikichip.org/wiki/chiplet) are modular silicon dies designed to be integrated with other chiplets to form a package-level system.
Chiplet architectures stand in contrast with monolithic chip architectures, where a single silicon die is packaged on its own and is integrated with other chips solely at the PCB-level.
Chiplets are used with the ambiguously defined "2D", "2.5D", and "3D" levels of [package-level integration](https://www.eetimes.com/2d-vs-2-5d-vs-3d-ics-101/).

### 2D Integration

The oldest form of multi-die integration is the [Multi-Chip Module (MCM)](https://en.wikipedia.org/wiki/Multi-chip_module), where multiple chiplets are mounted to a common package substrate and communicate with each other thru wires in the substrate.
The substrate can be made of various materials (organic, silicon) and can be *passive* (only contains wires and vias) or *active* (can also contain digital/analog circuits).

MCMs can be built out of chiplets with different pin pitches, process nodes, and dimensions.
This is an advantage when integrating digital logic, SERDES, memory, data converters, and RFICs on the same package.
The modern incarnation of an MCM is called a System-in-Package (SiP).

Examples: AMD's Ryzen Threadripper with Zen cores, Intel's Xe Ponte Vecchio GPU, and NVIDIA's A100 with HBM

### 2.5D Integration

A big limitation of 2D integration is the low density / large pitch of connections between chiplets.
Clearly, a bridge layer between the logic dies and the package substrate is required to achieve high inter-die bandwidth, while still being able to route top-level signals to the package bumps.

2.5D integration uses a *silicon interposer* on which chiplets connect via microbumps (10 um), while the interposer connects to the package substrate via regular bumps (100 um).
This enables high density die-to-die interconnect and brings the off-die bandwidth and latency closer to that of on-die communication.

Examples: Xilinx [Virtex-7](https://semiaccurate.com/2012/11/08/a-look-at-how-xilinx-uses-stacking-on-the-virtex-7-ht/) and beyond FPGAs with SLRs (Super Logic Regions), TSMC CoWoS (NVIDIA V100, AMD Vega), Intel [EM](https://spectrum.ieee.org/intels-view-of-the-chiplet-revolution)[IB](https://semiwiki.com/semiconductor-manufacturers/intel/298674-intels-emib-packaging-technology-a-deep-dive/) ([Kaby Lake G](https://en.wikichip.org/wiki/intel/cores/kaby_lake_g)), AMD Fiji GPU, Intel [Sapphire Rapids](https://en.wikipedia.org/wiki/Sapphire_Rapids)

### 3D Integration

For even higher integration density, dies can be [stacked on top of each other](https://en.wikipedia.org/wiki/Three-dimensional_integrated_circuit).
While stacking logic dies is still in the realm of in research chips, stacking memory dies (or stacking a memory die on top of a logic die) is common practice nowdays.
The limiting factor in logic die stacking is thermal dissipation, since logic dies consume substantially more power.

A key enabling technology is the [through-silicon via](https://en.wikipedia.org/wiki/Through-silicon_via) (TSV), which enables signals (and power/ground) to be tunneled completely or partially through a silicon die.
TSVs enable vias to cut through the interposer, and can increase the [die-to-die connection density](https://semiwiki.com/semiconductor-manufacturers/tsmc/306329-advanced-2-5d-3d-packaging-roadmap/) by avoiding the pitch limitations of microbumps and directly bonding copper pillars.
Other somewhat related technologies include backside power delivery and package-integrated photonics.

Examples: Intel [Fove](https://www.anandtech.com/show/16823/intel-accelerated-offensive-process-roadmap-updates-to-10nm-7nm-4nm-3nm-20a-18a-packaging-foundry-emib-foveros/4)[ros](https://en.wikichip.org/wiki/intel/foveros) ([Lakefield mobile SoC](https://en.wikichip.org/wiki/intel/microarchitectures/lakefield)), TSMC SoIC - AMD [Zen 3/4 Stacked](https://fuse.wikichip.org/news/5531/amd-3d-stacks-sram-bumplessly/) [3D V-Cache](https://semiaccurate.com/2021/06/01/amds-3d-v-cache-takes-the-advanced-packaging-lead/), [HBM](https://en.wikipedia.org/wiki/High_Bandwidth_Memory), [3D NAND flash](https://en.wikipedia.org/wiki/Flash_memory#Vertical_NAND)

### Chiplet Interconnect Standards

Nearly all chiplet designs today are custom and therefore use custom die-to-die communication protocols, optimized by the system designer.
However, there is [speculation that a market for chiplets may be viable](https://semiengineering.com/chiplets-taking-root-as-silicon-proven-hard-ip/).
In the future, one might be able to buy several chiplets off-the-shelf and only design the interposer to build a custom system-in-package.
For example, Ayar Labs markets their [TeraPHY](https://ayarlabs.com/teraphy/) which enables in-package photonic links via AIB, and LightMatter's [Passage](https://www.techinsights.com/blog/lightmatter-connects-chiplets-optically) photonic interposer.

To enable integration of chiplets from different manufacturers and designers, the interconnect protocol and physical layer must be standardized.
The competing standards are:

- Intel - [AIB](https://www.intel.com/content/dam/www/public/us/en/documents/white-papers/accelerating-innovation-through-aib-whitepaper.pdf) (physical-layer specification)
- Large [industry consortium](https://www.tomshardware.com/news/new-ucie-chiplet-standard-supported-by-intel-amd-and-arm) - [UCIe](https://en.wikipedia.org/wiki/UCIe) (full-stack specification, protocol layer is CXL)
- Open Compute Project - [BoW (Bunch of Wires)](https://opencomputeproject.github.io/ODSA-BoW/bow_specification.html) (physical + link layer specification)
- Open Compute Project - [OpenHBI](https://www.opencompute.org/documents/odsa-openhbi-v1-0-spec-rc-final-1-pdf) (physical-layer specification, interoperable with HBM3)

As of early 2023, it looks like UCIe or AIB (physical-layer) and CXL (protocol-layer) have the most momentum going for them.

However, some designers express concerns that any chiplet standard is going to be too restrictive and will prevent product-specific optimization.
Since nearly all chiplet design today is within a single company, there isn't a strong drive to standardize chiplet interfaces, notwithstanding the potential easing of the verification burden.
Even with standardization, there may be so many one-off deviations within a company that the chiplets will not be reusable in other package-level integrations.

Ultimately will companies be OK with standardizing chiplet interfaces at the cost of PPA, and when the chiplet IP market (photonics and SERDES) is still very immature?

## The Benefits of Chiplets

All of this discussion would be moot if chiplet architectures didn't have benefits over monolithic dies.
I group the benefits into two categories: 1) reducing cost and 2) improving integration.

### Reducing Cost

1. **Better yield** to minimize RE
    - Chiplets are smaller than monolithic dies and therefore have higher yield.
    - Chiplets and stacked dies can be tested independently before integration to avoid building defective products that are thrown away.
2. **Fewer unique tapeouts** to minimize NRE
    - A small collection of chiplets can be integrated in different ways at the package-level, leading to a diverse product portfolio with minimal per-chiplet design effort.
3. **Easier external IP integration** to minimize NRE
    - Integrating chiplet IP versus hard IP might be easier due to standardized interfaces and outsourcing chiplet testing
    - It might also be possible to use cheaper process nodes for certain IPs
4. **Smaller footprint** to minimize RE
    - 3D stacking can reduce the PCB area consumed by the main package
    - Moving PCB components into the package to reduce PCB area / off-package communication

### Improving Integration

1. **Bypassing the reticle limit**
    - The modern reticle limit of 800 mm2 is a limiting factor for large datacenter chips
    - Chiplets enable building package-level systems with 2-3x more silicon area than the reticle limit
2. **Process mixing**
    - Forcing RF, analog, SERDES, photonics, memory, and digital logic on one process can lead to inferior design points
    - By allowing each domain to use the most optimal technology, better system-level performance can be achieved
    - Chiplets also provide some level of electrical and RF isolation between dies
3. **Higher bandwidth / lower power communication**
    - If more components can be moved from the PCB to the package, communication overheads can be reduced
    - 3D stacking in particular enables high bandwidth and low power communication between dies due to shorter wirelengths, tighter pitches, and fewer material transitions
    - A good example is 3D stacking of cache which moves more memory from off-package DRAM to on-package stacked SRAM
4. **Novel integrations**
    - Devices that would normally be at the PCB-level can be moved to the package
        - Electrical-optical interfaces, PHYs for various protocols (e.g. Ethernet), discrete accelerators
    - Enables design points that wouldn't exist in the monolithic die universe

## The Downsides of 2D/2.5D Integration

If you *aren't running into a fundamental limitation of monolithic chip design* (reticle limit, multi-process integration, insufficient yield), moving to a chiplet architecture isn't a clear advantage, since it does come with downsides:

1. **Worse PPA**
    - Splitting a monolithic chip into multiple chiplets doesn't buy you anything, rather performance, power, and area will all suffer
    - Performance will be hindered by the latency and bandwidth overhead of die-to-die communication
    - Extra power will be burned from die-to-die links
    - The area of a chiplet design will be slightly greater than its equivalent monolithic design due to bump pitch limits and interposer design rules
2. **Larger integration burden**
    - On-die signals are easy to handle using the regular VLSI CAD flow
    - Off-die signals require careful physical design and routing. You will also need additional test circuitry.
    - Deciding the boundaries on which to split a large monolithic chip isn't easy. Architectural modeling is required.

## Potential Avenues of Chiplet Research

Given all of the above, what are the pressing research areas in package-level integration and chiplet design from the computer architect's perspective?
The goal is to maximally exploit the advantages of chiplets, while mitigating the overheads and disadvantages.

1. How should a product portfolio be split into a chiplet and package portfolio in such a way as to minimize cost (NRE and RE) and maximize yield?
2. What are the tradeoffs between standardizing chiplet interfaces and using custom interfaces?
3. Can we model the PPA of a chiplet-based system including the impacts of process mixing and die-to-die communication? How does the PPA compare to monolithic architectures?
4. How do we exploit chiplet architectures for existing datacenter applications? How should applications be partitioned and scheduled differently on a chiplet-based system vs a monolithic die + DRAM system?
5. What are the end-to-end PPA benefits we can expect to see as more PCB-level components are brought into the package?

### What Can (CompArch) Academics Research?

I believe that few of these avenues of research are truly open to academics (in computer architecture) and nearly all chiplet oriented research belongs in the realm of industry.
There are several reasons:

1. **Mismatch of scale**
    - Academics never work on chips that run into the same constraints as industry silicon. Most critically, chiplet disaggregation of a large silicon die is only desirable when we run up against the reticle limit or want to improve yield.
    - The scale at which chiplets make sense to use and model is very far away from the scale examined in academic research.
    - A side note is that RTL level evaluation of system-level PPA for architecture exploration of chiplet designs is unreasonable - such an analysis must be undertaken at a higher level of abstraction.
2. **Cost modeling is difficult**
    - The primary motivating factors for chiplet-based architectures are related to yield and minimizing NRE/RE costs.
    - As academics, we have no clue about the true relationship of silicon area and complexity to yield (this is a closely guarded trade secret), and little understanding about the financial constraints of product portfolios.
    - We also have little idea about the PPA costs associated with die-to-die communication in each of the many proposed schemes (AIB, BoW, UCIe)
        - While we may have top-line pJ/bit and latency numbers, if that is all the fidelity required to model chiplet IO, then a high-level algorithm communication analysis (not RTL-level) is sufficient
3. **Understanding feasibility**
    - It is easy to speculate about chiplet architectures and 3D stacking possibilities, but the physical feasibility of any of these is not clear to academics
    - This is in contrast to RTL-level accelerator design within a monolithic chip where the vanilla RTL will give us real PPA numbers and guaranteed feasibility
4. **Chiplets don't change the basic software story**
    - The core compute die is still designed such that software sees a monolithic system (notwithstanding multi-socket NUMA systems). Software will always see the illusion of a big chip no matter how it is partitioned physically.
    - For example, AMD's V-Cache just shows up as a larger LLC to software. Nothing about the software execution changes.
        - In terms of what the software sees, chiplet architectures are less visible evolutions than the transition from HDDs to SSDs, for example
    - While there is a story about how to maintain this illusion in partitioned systems (by distributing work to multiple dies in a way to minimize die-to-die communication), such work is just an extension of multi-socket and multi-node work distribution and communication avoiding schemes (albeit with another, more fine-grained, cost model)

## How Should Chiplet Systems Be Modeled + Designed?

Having said all this, I can be convinced that academics have a role to play in chiplet modeling and design methodology.

Right now, industry seems to have a hard time with the physical design of chiplets - many different foundry-specific standards and design rules, in addition to the designer's own PPA optimization have to be taken into account when deciding IO bump mappings.
Perhaps academics can help with a design methodology that is physically-aware and drives top-level RTL design with physical intent in mind.

On the modeling side, I agree that an architectural simulator with a native understanding of chiplets (just as gem5 has a native understanding of NUMA) might be useful.
Getting hard numbers for all the model parameters (for the PPA overheads of the chiplet IO components) is hard, but even a coarse guess might be sufficient to show how algorithms would perform given a specific chiplet architecture.
However, validating such a model is very difficult since, unlike validating CPU and GPU arch simulators, CAD-based simulation of chip-to-chip communication is difficult and there is little chiplet-based silicon either.
Also, trying to rely on RTL level simulation for modeling chiplet architectures is nonsensical - the scale of a real chiplet-based system is so large that this level of fidelity would yield ultra-slow simulations and for very little gain (since die-to-die communication has a relatively simple model).

I welcome feedback on research avenues in chiplet architectures that are academically viable for computer architects.

## Responses to Objections

Since writing this, I have heard some objections I'd like to address.

### Isn't Chiplet Modeling as Interesting as NUMA Optimization?

During the early multi-socket era, it was recognized that having a pool of DIMMs that could be accessed by every socket could lead to poor performance as the accesses would have to be serialized.
The solution was to split the DIMMs so that each socket could access its own pool separately from the other socket, and add some special hardware to enable data sharing between the pools.
However, software does not want to deal with these implmentation details and would just like to see a big cache-coherent computer with double the memory and cores as a single socket system.

This lead to *a bunch of research* in cache-coherent NUMA (ccNUMA) and OS/software support for colocating processes near their memory, sharing pages across NUMA regions, and so forth.
At a high level, the **asymmetry** in memory access latencies motivated work in adapting algorithms/runtimes/kernels to accomodate this constraint.

The question is: is there *asymmetry* in chiplet architectures that we have to design algorithms/runtimes/kernels around? For example, does having a large LLC implemented as a stacked 3D cache introduce asymmetries in per-core memory latency that our OS should know about?

The reality is that chiplets and package-level integration are *erasing* as many asymmetries as possible.
The illusion of "one big machine" for software will continue to improve because of this trend.

We can already see that package-integrated HBM has reduced asymmetry in memory access times and bandwidth (vs off-chip DRAM), and accessing any HBM stack on the package has pretty much uniform latency for any core.
The next step will be integrating multiple CPU dies on a single interposer instead of multiple sockets on a motherboard.
Moving SSD flash stacks to the package is also coming up.
These asymmetries are actually being *reduced* with the advent of package-level integration.

I concede that in the interim, some API may need to be exposed to partition a chiplet cache such that different compute chiplets can minimize communication to far away compute chiplets through the shared cache.
There might be a bit of research here, but it is mostly system-level and doesn't require RTL-level fidelity.

### Isn't Splitting a Monolithic Chip Trivial?

I mentioned above that automatic splitting of a monolithic chip that's reaching the reticle limit is an open research question.
For academic SoCs this isn't even a question: you would just split the chip on cache boundaries! EZ.

Industry SoCs are not just a bunch of core-coupled accelerators arranged in a multi-core cache hierarchy.
Yes, they contain core complexes, but they also contain *10s of unique accelerators, radio blocks, data converters, and so forth*, many of which are scattered ad-hoc around the SoC.
Many of these components are placed close to the IO bumps that they need (e.g. ISP placed near the camera IOs, radio baseband placed near the antenna IOs, HR unit placed near the accelerometer and HR sensor IOs, etc.).
So splitting an SoC isn't so easy, because real chips are blobs (not trees) and have a bunch of constraints driven by the package, PCB, and product design.

### But Chiplets Are So Cool!

I concede. They are cool.

Taping out a chiplet-based system in academia is worthwhile even if there is no fundamental research agenda.
It could motivate research based on annoyances encountered during the tapeout, and it will be the first academic 2.5D integration of many large RISC-V SoCs.

I was shown that there were only a handful of papers related to chiplets that were published at ASPLOS, MICRO, and ISCA.
This means, there is little prior work to compare new chiplet modeling or tapeout papers to and 'chiplet research' is a *good paper target* (although not an interesting real academic research direction).

### Can We Model Thermal Effects of 3D Die Stacking?

A potentially feasible research avenue is to model the dynamic thermal profile of stacked logic dies.
Such modeling might reveal ways to physically stagger core and cache logic from die to die to mitigate hot spots and make traditional cooling techniques viable.
This is an area that academics have worked on in the past: building thermal models from detailed CAD simulations of a die that is activity-driven.

This area might be suitable for a lab that already has background in thermal modeling, but it is difficult to start from scratch.
Furthermore, modeling the effects of thermal activity between 2 dies requires knowledge of materials and low-level physics simulations, which would require external collaboration.

### Can we Model the Performance Implications of 3D Die Stacking?

Modeling performance benefits of die stacking is reasonable, as long as the hypothesized physical stack is confirmed to be viable, manufacturable, and a good thermal and die-to-die IO model exists.
This is not much different than modeling a multi-socket system, except with lower latencies to communicate between the two sockets.

### Cache Partitioning Strategies Seem Interesting

- [Chips and Cheese: A Peek at Sapphire Rapids](https://chipsandcheese.com/2023/03/12/a-peek-at-sapphire-rapids/)

> On Intel DevCloud, the chip appears to be set up to expose all four chiplets as a monolithic entity, with a single large L3 instance. Interconnect optimization gets harder when you have to connect more nodes, and SPR is a showcase of this. Intel’s mesh has to connect 56 cores with 56 L3 slices. Because L3 accesses are evenly hashed across all slices, there’s a lot of traffic going across that mesh.

> In contrast, AMD has opted to avoid the giant interconnect problem entirely. EPYC and Ryzen split cores into clusters, and each cluster gets its own L3. Cross-cluster cache accesses are avoided except when necessary to ensure cache coherency. That means the L3 interconnect only has to link eight cache slices with eight cores. The result is a very high performance L3, enabled by solving a much simpler interconnect problem than Intel. On standard SKUs, AMD can’t get anywhere near as much capacity. But AMD can employ 3D stacking on “V-Cache” SKUs, which gets a 64 MB cache die on top of the regular core cluster. Obviously this comes at additional cost, but it gives AMD high L3 capacity with much better L3 performance than SPR.

This tradeoff between finely-distributed coherence (Intel) and cluster-level coherence (AMD) seems interesting and worth investigating at the arch modeling level.
It can be investigated at a much smaller scale (in terms of number of cores and cache sizes) and we should be able to come to the same conclusions as with a larger system.

### Some Supporting Data

- https://chipsandcheese.com/p/amds-turin-5th-gen-epyc-launched

> For convenience, the list below are the numbers from the chart because a chart this big can be hard to read.
>
>     Intra-CCD latency: ~45ns
>
>     Inter-CCD latency: ~150ns
>
>     Socket to Socket latency: ~260ns

- https://chipsandcheese.com/p/core-to-core-latency-data-on-large-systems

> Sapphire Rapids (SPR) is Intel’s latest server architecture, developed with the Golden Cove architecture as a foundation. A full SPR chip features four dies connected with EMIB links. Average core to core latency within a socket is 59 ns, while cross socket transfers average 138 ns latency.

> Within a socket, groups of four cores tend to share similar characteristics. Worst case latency within a socket is 81 ns.

- Cost modeling: see LUCIE (paper from MICRO 2024). Basically a bunch of handwaving, and random things. Speculating on yield and other random stuff.
- Also see the sanctions aware hardware paper. Same idea, who are you fooling?

- https://arxiv.org/pdf/2502.01449
  - Figure 1 of this paper is a good overview of SiP methodologies
