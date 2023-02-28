+++
title = "Chiplet Research in Academia: Is it Sensible?"
date = 2023-02-25
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
This enables high density die-to-die interconnect and brings the off-die bandwidth and latency closer to on-die communication.

Examples: Xilinx [Virtex-7](https://semiaccurate.com/2012/11/08/a-look-at-how-xilinx-uses-stacking-on-the-virtex-7-ht/) and beyond FPGAs with SLRs (Super Logic Regions), TSMC CoWoS (NVIDIA V100, AMD Vega), Intel [EM](https://spectrum.ieee.org/intels-view-of-the-chiplet-revolution)[IB](https://semiwiki.com/semiconductor-manufacturers/intel/298674-intels-emib-packaging-technology-a-deep-dive/) ([Kaby Lake G](https://en.wikichip.org/wiki/intel/cores/kaby_lake_g)), AMD Fiji GPU, Intel [Sapphire Rapids](https://en.wikipedia.org/wiki/Sapphire_Rapids)

### 3D Integration

For even higher integration density, dies can be [stacked on top of each other](https://en.wikipedia.org/wiki/Three-dimensional_integrated_circuit).
While stacking logic dies has only been shown in research chips, stacking memory dies is common practice nowdays.
The limiting factor in logic die stacking is thermal dissipation.

A key enabling technology is the [through-silicon via](https://en.wikipedia.org/wiki/Through-silicon_via) (TSV), which enables signals (and power/ground) to be tunneled completely or partially through a silicon die.
TSVs increase the [die-to-die connection density](https://semiwiki.com/semiconductor-manufacturers/tsmc/306329-advanced-2-5d-3d-packaging-roadmap/) by avoiding the pitch limitations of microbumps and directly bonding copper pillars.
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

If you *aren't running into a fundamental limitation of monolithic chip design* (reticle limit, multi-process integration), moving to a chiplet architecture isn't a clear advantage, since it does come with downsides:

1. **Worse PPA**
    - Splitting a monolithic chip into multiple chiplets doesn't buy you anything, and in fact performance, power, and area will all suffer
    - Performance will be hindered by the latency and bandwidth overhead of die-to-die communication
    - Extra power will be burned from die-to-die links
    - The area of a chiplet design will be slightly greater than its equivalent monolithic design due to bump pitch limits and halos
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

### What can academics research?

I believe that few of these avenues of research are truly open to academics and nearly all chiplet oriented research belongs in the realm of industry.
There are several reasons:

1. **Mismatch of scale**
    - Academics never work on chips that run into the same constraints as industry silicon. Most critically, chiplet disaggregation of a large silicon die is only desirable when we run up against the reticle limit.
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
        - In terms of what the software sees, chiplets architectures are less visible evolutions than the transition to SSDs, for example
    - While there is a story about how to maintain this illusion in partitioned systems (by distributing work to multiple dies in a way to minimize die-to-die communication), such work is just an extension of multi-socket and multi-node work distribution schemes (albeit with another more fine-grained cost model)

## How Should Chiplet Systems Be Modeled + Designed?

Having said all this, I can be convinced that academics have a role to play in chiplet modeling and design methodology.

Right now, industry seems to have a hard time with the physical design of chiplets - many different foundry-specific standards and design rules, in addition to the designer's own PPA optimization have to be taken into account when deciding IO pad mappings.
Perhaps academics can help with a design methodology that is physically-aware and drives top-level RTL design with physical intent in mind.

On the modeling side, I agree that an architectural simulator with a native understanding of chiplets (just as gem5 has a native understanding of NUMA) might be useful.
Getting hard numbers for all the model parameters (for the PPA overheads of the chiplet IO components) is hard, but even a coarse guess might be sufficient to show how algorithms would perform given a specific chiplet architecture.
However, validating such a model is very difficult, unlike validating CPU and GPU arch simulators, since CAD-based simulation of chip-to-chip communication is difficult and there is little chiplet-based silicon either.
Also, trying to rely on RTL level simulation for chiplet architectures is nonsensical - the scale of a real chiplet-based system is so large that this level of fidelity would yield ultra-slow simulations and for very little purpose (since die-to-die communication has a relatively simple model).

I welcome feedback on research avenues in chiplet architectures that are academically viable for computer architects.
