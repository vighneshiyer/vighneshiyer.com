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

All of this discussion would be moot if chiplet architectures didn't have benefits.
I group the benefits into two categories: 

### Improving Cost

- Better yield, cost savings
- Modularity of chiplets within a company (different products with the same base chiplets)
- Modularity as in using chiplet IP (buying chiplets from other companies and assembling a package-level SoC)
    - Potential cost and integration savings
- Easier test

### Mitigating Integration Limiters

- Process mixing, can enable typically non-viable integrations
- Reticle limit
- Greater integration (at package level vs PCB level) (e.g. on-package photonics) (and cache stacking)
    - Enables higher performance with e.g. cache stacking (preventing DRAM access) (problem: physical feasibility is not clear vs plain vanilla RTL in monolithic chip integration)

## Potential Avenues of Chiplet Research

Downsides of chiplets (compared to monolithic):

- Worse PPA (over a monolithic design)
- Complicates integration burden
- Splitting a large design means you have to decide the boundaries - not easy to architect

- What topics here can academics research?
    - None of them
    - We never operate at their scale to see benefits on any of these axes

## How Should Chiplet Systems Be Modeled?

The scale at which chiplets make sense (reticle limit, cache stacking) is so large that RTL level evaluation of system-level PPA for architecture exploration is unreasonable.
