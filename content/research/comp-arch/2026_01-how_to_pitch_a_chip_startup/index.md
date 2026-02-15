+++
title = "How to Pitch a Chip Startup + My Opinions of Specific Startups"
date = 2026-02-10
draft = true
description = "The ritual of new chip startups and my analysis of the landscape"

[extra]
new = true
+++

## Pitching a Chip Startup

<!--
The VC pitch for a hw startup resembles a Roman religious ritual. There is a series of incantations required before you present your proposed solution.
You must make the vow of sacrifice before the Gods.
"I will spend 10 years of my life suffering in the hopes of outcompeting NVIDIA"
-->

When pitching VCs on a new chip startup, the process is akin to a Roman religious ritual.
The founders begin by making a standard set of pronouncements to set the scene for the Gods, and invite them to settle down and listen from above.
Once the Gods have been invoked, the founders make their vow and/or sacrifice, and ask for something in return (money, time, and luck).[^do_ut_des]
If the Gods are pleased, the founders will get what they asked for &mdash; otherwise, they will receive a mere: "Let's keep in touch".

[^do_ut_des]: 'do ut des' = I give so that you may give. The model produces [an excellent analysis](https://chatgpt.com/s/t_6952246e0260819194e8a956020c5c84) 😆

Every single computer architecture paper, presentation, and yes, pitch deck, begins with the same set of proclamations: it's part of the ritual.
Let's examine each one.

## The End of Moore's Law

I challenge you to find a computer architecture paper that doesn't begin with the (now meaningless) platitude: "Due to the end of Moore's Law...".
Consider this language from a whitepaper by Groq: ["What is a Language Processing Unit?"](https://groq.sa/wp-content/uploads/2024/07/GroqThoughts_WhatIsALPU-vF.pdf).

> For decades computer software was the beneficiary of Moore’s law, Gordon Moore’s self-fulfilling 1965 prophecy that the processing power of a chip would double roughly every two years while keeping costs steady.
> The law held for several decades, aided by the growing use of multi-core processors (CPUs and GPUs).

The end of "The Law" has many consequences, but we ought to examine what exactly is meant by "the end of Moore's Law".
There are three, closely-related angles to Moore's Law (as it is used colloquially):

1. *Total integration complexity scaling*: the total number of transistors that can act as a single system with system-level latencies and bandwidths on par with an arbitrarily sized silicon die

{{ image(path="integration_complexity_over_time.svg", class="popout", caption="A strong historical trend of exponentially increasing integration complexity. (Source: ['Transistor Count' Wikipedia article](https://en.wikipedia.org/wiki/Transistor_count) + manually scraped transistor counts for recently released chips in 2024&ndash;2025)", width=1407, height=687, padding=true) }}

As the plot shows, this trend is strong, and will continue for the foreseeable future, driven mostly by packaging innovations (e.g. CoWoS), but also by transistor scaling.
The outliers (Cerebras WSE and Tesla Dojo) demonstrate that the most extreme forms of integration (panel-level packaging / wafer-scale integration) are feasible, but are still in their early stages of deployment.

{{ image(path="tsmc_iedm_2023.png", class="content", caption="Monolithic and packaging/stacking scaling trends are expected to continue (Source: [TSMC at IEDM 2023](https://www.tomshardware.com/tech-industry/manufacturing/tsmc-charts-a-course-to-trillion-transistor-chips-eyes-monolithic-chips-with-200-billion-transistors-built-on-1nm-node))") }}

It is reasonable to conclude that *this aspect* of Moore's Law is still alive, although it is increasingly expensive to move further up in integration complexity.

2. *Transistor density scaling*: the number of transistors per mm<sup>2</sup> of silicon area

*Logic* density scaling continues to improve *slowly* from continued transistor scaling (enabled by new transistor device architectures: GAAFETs, forksheet FETs, CFETs) and [new process features](https://en.wikipedia.org/wiki/2_nm_process#Beyond_2_nm) (e.g. backside power delivery, TSVs, finer wire pitch, denser standard cells with track heights of 3&ndash;4).

{{ gallery(images=[
    "imec_logic_scaling1.webp",
    "imec_logic_scaling2.webp",
], popout=false, caption="Left: Logic scaling from device, interconnect, and power delivery improvements. Right: Predictions for device evolution into the next decade. (Source: [ITF World 2023 - imec](https://spectrum.ieee.org/stco-system-technology-cooptimization))") }}

*SRAM* density scaling has been tepid in the past few nodes, and has few signs of improving without revolutionary process changes.

{{ gallery(images=[
    "irds.png",
], popout=false, caption="Density scaling projections for logic and SRAM. (Source: [IRDS 2024 Update - 'More Moore'](https://irds.ieee.org/images/files/pdf/2024/2024IRDS_MM.pdf))") }}

In the projection above, the sudden jump in SRAM density from 2029 to 2031 is attributed to the transition from GAAFETs to CFETs and the fabrication of active devices on the backside; whether this will actually happen, on time, with high-volume manufacturing, is *very suspect*.
3D die stacking will continue to push densities up (transistors per mm<sup>3</sup>) so long as power density issues can be mitigated.
Alternative memory technologies (ReRAM, PCRAM, eDRAM) that promise higher density / lower energy vs SRAM are still immature or have unfavorable cost / process steps tradeoffs, but may play a role in the next decade.

3. *Density scaling at lowest cost per transistor*

The original formulation of Moore's Law was that the maximum transistor count at the minimum cost point ($/transistor) would double every year.
That doubling slowed down from every year to every two years, and now, perhaps every 3&ndash;4 years.

This specific formulation of Moore's Law *has been dead* for at least 5 years now (around when processes shifted to EUV and sub-5nm nodes).
To get the greatest integration complexity (both monolithically and from packaging / stacking), one must invest in increasingly expensive manufacturing processes.
<!--
All the features described above are - latest nodes are increasingly expensive - wafers get more and more expensive.
-->

### So What?

Exploiting cutting-edge CMOS scaling and packaging innovations requires massive up-front capital investment.
Any ML accelerator pitch that requires outbidding NVIDIA, AMD, Apple, Google (and other megacap corps) to leverage process and packaging innovations is inherently suspect.
<!--
ML hardware startups often misrepresent how 'dire' the 'end' of process scaling actually is.
If they propose something exotic, they will have to cope with the continued 
-->

## The End of Dennard Scaling

Following "due to the end of Moore's Law...", the next most common platitude you'll hear is: "Due to the end of Dennard scaling...".
In short, [Dennard scaling](https://en.wikipedia.org/wiki/Dennard_scaling): transistors shrink → supply voltage can be lowered → propagation delay also goes down → per-transistor power consumption falls → power density (W/mm<sup>2</sup>) stays constant.
But Dennard scaling died even before Moore's Law did.

{{ image(path="50_years_of_microprocessor_trend_data.png", class="inset", caption="The classic plot of stagnating microprocessor frequency. The inability to push down threshold voltage while keeping leakage current controlled in deep submicron nodes, led to the failure of continued voltage scaling (Source: [Karl Rupp](https://github.com/karlrupp/microprocessor-trend-data))") }}

### So What?

Practically, this means you can't run a modern chip at its peak frequency, with all its components active, without running into thermal density limits.
Startups that pitch chips with higher arithmetic density vs GPUs or 3D logic die stacking (i.e. going beyond the limits of current cooling technologies) are suspect.[^rubin]

[^rubin]: Consider that Rubin Ultra has a package TDP in the range 2.5&ndash;3.5 kW. A newcomer promising even higher thermal density is suspect.

<!-- Dark silicon -->

## The Memory Wall and Von Neumann Bottleneck

As LLMs grew in size to the point where multi-GPU setups were required for inference, another talking point became popular: "the memory wall".

{{ gallery(images=[
    "memory_wall1.png",
], popout=false, caption="asdf") }}

- [AI and Memory Wall](https://arxiv.org/pdf/2403.14123)

- [Von Neumann bottleneck](https://en.wikipedia.org/wiki/Von_Neumann_architecture#Von_Neumann_bottleneck)

The proposed solution: Streaming dataflow architectures. CIM / PIM / near-memory compute. Exotic memory technologies (e.g. Optane). SRAM-only architectures (wafer-scale or otherwise).

## The Overhead of General Purpose Computing

[EECS Colloquium: Bill Dally - Trends in Deep Learning Hardware](https://www.youtube.com/watch?v=4u8iMr3iXR4)

[NVIDIA: Hardware for Deep Learning (Hot Chips 2023)](https://hc2023.hotchips.org/assets/program/conference/day2/Keynote%202/Keynote-NVIDIA_Hardware-for-Deep-Learning.pdf)

And then the energy overhead of general compute 
The VC pitch: the pie chart.

- https://old.hotchips.org/hc31/HC31_T3_Cloud_TPU_Codesign.pdf?referrer=grok.com

- https://gwern.net/doc/cs/hardware/2014-horowitz-2.pdf
  - Computing’s Energy Problem (and what we can do about it) - Horowitz ISSCC 2014

- https://gemini.google.com/app/8fa52e3a2f72b890

> energy used in a cpu by function to execute one instruction i know there are some pie charts and relative energy comparisons of various things (memory fetch vs actually doing an add) can you find some sources?
> Sure can you get some PDF links / images from the internet. Also consider things from NVIDIA and Groq's marketing / technical materials
> Can you dig through more hotchips slides that could be making the same point about energy usage being disproportionately in control logic and memory vs compute? A pie chart is what I'm looking for from one of these sources. I'm trying to show examples of the arguments that these exotic ml arch companies bring up such as groq or cerebras to show an advantage over GPUs 

- https://grok.com/c/ae4be3dd-4828-479e-a856-d5905dafbd3f?rid=265703b4-c63f-4248-8642-05a88cf618b0

> energy used in a cpu by function to execute one instruction i know there are some pie charts and relative energy comparisons of various things (memory fetch vs actually doing an add) can you find some sources?
> Sure can you get some PDF links / images from the internet. Also consider things from NVIDIA and Groq's marketing / technical materials
> Can you dig through more hotchips slides that could be making the same point about energy usage being disproportionately in control logic and memory vs compute? A pie chart is what I'm looking for from one of these sources. I'm trying to show examples of the arguments that these exotic ml arch companies bring up such as groq or cerebras to show an advantage over GPUs
> Can you find other marketing / pitch / keynote talk / technical talk materials that quantify how much energy usage comes from various parts of performing a computation on a regular cpu (ifetch, decode, execute (the actual work), commit, dcache write, etc....) or area usage is split between control logic, memory, and the actual arithmetic execution units? I want some more sources regardless of whether they come from papers, presentations, or pitched

- https://chatgpt.com/c/694dc6c4-a048-8333-9720-875dd4e68de2

## The Golden Age of Architecture

Specialization, ASICs, whatever

They created the TSP (tensor streaming processor). I shall discuss the arch below.

Groq was early though. At the time they were still discussing CNNs. Even BERT was early. Early TPU days were like this too.

## Chip Startup Shootout

- Refer to Openai article: Nothing new under the sun
- Refer to ml accelerator article: enumeration of companies
- Scour this again: https://github.com/aolofsson/awesome-semiconductor-startups?tab=readme-ov-file

- HBM machines
  - MatX?
- Manycore machines
  - TT
- Exotic compute / PIM
  - d-Matrix
- Packaging innovations
  - Openova (now DensityAI)
- Dataflow-oriented
  - Efficient Computer
  - NextSilicon
- Neuromorphic computing
  - Extropic
  - Normal Computing
  - Unconventional AI
