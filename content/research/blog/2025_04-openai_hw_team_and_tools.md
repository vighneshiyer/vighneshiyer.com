+++
title = "OpenAI's Hardware Effort"
date = 2023-08-23
draft = true
slug = "openai-hardware-effort"
description = "XLS, HW design methodology, the supposed imminent tapeout"
+++

OpenAI, of course, started off as an AI research lab, but as their userbase has grown and afforded them the ability to raise at insane valuations on expected future profitability, the organization has begun to sprawl out.
In this context, [Stargate](), their effort to build multiple gigawatt datacenters[^1],

[^1]: What Jensen would term "AI factories"
One of the largest sprawl efforts

- Poaching of Googlers
- Richard Ho
  - Going to all the conferences, being intercepted constantly, trying to peek around
  - The very first hire
  - https://www.datacenterdynamics.com/en/news/openai-appoints-former-google-tpu-leader-as-head-of-hardware-hiring-for-experts-in-data-center-facility-design/

- https://www.datacenterdynamics.com/en/news/openai-hiring-team-to-work-with-hardware-vendors-for-co-design-of-future-ai-accelerators/
- https://www.linkedin.com/posts/richard-ho-chips_hwsw-co-design-engineer-openai-activity-7163043897382793217-LfpN
- https://web.archive.org/web/20250607211859/https://openai.com/careers/hardwaresoftware-co-design-engineer/
- https://openai.com/careers/hwsw-co-design-engineer/
- https://web.archive.org/web/20240306205502/https://openai.com/careers/hwsw-co-design-engineer/
- https://openai.com/careers/hardwaresoftware-co-design-engineer/ (active as of 6/18/2025)

- Chris Leary - the creator of XLA (and XLS) - a very smart guy, and ultra competent programmer. But lost in space without microarchitects to guide. Similar tragedy that befell Jeff Dean and many others. Googlers seem particularly suceptible to "moonshot" hysteria.
- XLS
  - I wrote about XLS in my DAC 2022 review, link to that! Link to Joonho's article. Link to the zstd example.
  - Very insane
  - Two input arbiter vs Chisel or SystemVerilog
    - Not even close in complexity
    - Very classic "software" approach to hardware with all its usual failings
    - The "simple" RISC-V core isn't even a core. How can you express bypass? If you wanted X stages, they would all be their own procs and you would have a fully "decoupled" core pipeline. This gives you some notion of "correct by construction" but it is never worth it - lots of people have tried this in the past.
  - Custom language comes with all its problems: system APIs, data structures, custom compiler, custom type system and checker, infinite bugs, macros don't work properly
  - No separation of hardware and software datatypes - common issue with software people trying to build a hardware design language. Metaprogramming is actually the best strategy here, not 'imperative code to Verilog'.
  - The wrong abstraction: none of the benefits of either HLS or RTL. Don't get the low-level cycle-level and bit-by-bit control of RTL at the same time don't get the control flow synthesis and litany of optimizations with HLS (instead all the hardware has to be squeezed into this Kahn Process architecture, which isn't actually natural)
  - Frontend timing prediction is a horrible idea. There is nothing synthesis can't do that this tool can. Furthermore, since it isn't HLS-like, it can't actually modify the uArch to improve timing behavior by trading off less throughput for increased parallelism or vice versa. It can't do anything except retime combinational paths.
  - Look at the complexity, show the zstd example. Antmicro shilling and payoffs.
  - Now this Googling idea has come into OpenAI with some political capital behind it. Will they be willing to throw this away? Very unlikely, but certainly an albatross.
- Bedrock - Creating an OSS SV stdlib (competitior to basejump and PULP IP and many others)
  - Rebuilding a SystemVerilog library that existed at Google.
  - Testbench generation via LLMs (Chipstack) (and maybe RTL too in the future)
  - Bazel-first for everything, including regressions and even FPGA builds I'm sure - Googlers at work
- Topstitch - replacement for custom Verilog stitching tools that are internal in every semiconductor company (usually built on top of Verific: the only company which is guaranteed to continue making lots of money)
  - A medley of Rust, Python, DSLX, Bazel, C++, and other randomness. Is this really any better?

Building tools as a foundation is a good idea, but this is a company right?
The tools need to enable radically improved productivity or correctness or time-to-market...
What are they doing here?
What is the microarchitectural insight they have to design custom hardware? Otherwise, this is a blood sucking boondoggle.
OpenAI's hotchips talk (https://hc2024.hotchips.org/assets/program/conference/day1/HotChips%20-%202024-08-26.pdf) talked about things that can't be reasonably improved with custom silicon (power sloshing, soft error detection and correction, in-field continuous silicon validation, tightly controlled error propagation, high reliability optical links at scale).

There are a few potential reasons why they would want to build custom hardware:

- Cost savings at scale. Buying silicon from any other vendor implies OpenAI would lose some margin. In-house efforts
If cost savings at scale for ML training and inference is the most important thing (see Tesla Dojo, Google TPU, Microsoft Brainwave/Maia, AWS Trainium/Inferentia, Meta MTIA, Apple secret-server-chip, Alibaba Hanguang 800, Baidu Kunlun, Huawei Ascend, Tencent Zixiao, IBM AIU), then they are much better off negotiating custom hardware contracts
There are also AI accelerator startups that can simply be acquired (Sambanova, Cerebras, Tenstorrent, FuriosaAI, Graphcore, Groq)
- Buy IP and contract out the integration + PD + post-silicon validation
- What foundry has capacity for you? Apple has bought out the latest nodes for the next 3+ years (probably indefinitely). NVIDIA is fine staying 1 node behind the cutting edge and extracting the best yields with maximum reticle dies.
- Potential for vertical integration. Only a handful of models to support, can't they do better than off the shelf and generic hardware? Perhaps, but this ball has been dropped a lot more than it has been used successfully. The only successful usage is from Apple to be frank. Others, like Google and Amazon, have failed so hard.
- Trying to gain leverage against NVIDIA, at least for the inference pipeline. But this can only work if NVIDIA believes they have any shot of decoupling - NVIDIA has much better engineers and can easily snuff out real from fake.

- Recent Broadcom tapeout. What could it be? The team seems under 50 people. They try to hide as "technical staff" on LinkedIn, probably to avoid competitiors piecing together the OpenAI org chart. Look at their hardware job postings. Likely there is just a blob of Synopsys/Cadence/ARM IP and all the integration is contracted out. The effort needed to build datacenter-scale systems, let alone a single blade, is enormous - what is their advantage?
- https://www.reuters.com/technology/openai-set-finalize-first-custom-chip-design-this-year-2025-02-10/

- https://www.youtube.com/watch?v=qqAbVTFnfk8 (openai broadcom partnership announcement via podcast) - way too funny
  - If you control your own chips, you control your own destiny - Broadcom
  - LMAO way too much considering that he is the one extracting money from openai and has no stake in the success of the first gen lol. They will never admit fault and work with broadcom for the second gen.

> OpenAI President Greg Brockman said the company used its own models to accelerate chip design and improve efficiency.“We’ve been able to get massive area reductions,” he said in the podcast. “You take components that humans have already optimized and just pour compute into it, and the model comes out with its own optimizations.”

> learn2xls being announced publicly

> “Our collaboration with Broadcom will power breakthroughs in AI and bring the technology’s full potential closer to reality,” said OpenAI co-founder and President, Greg Brockman. “By building our own chip, we can embed what we’ve learned from creating frontier models and products directly into the hardware, unlocking new levels of capability and intelligence.”

- Sam: more intelligence per watt. These other chip startups don't know what the future models look like and openai can only nudge them but can't influence the direction. So we decided to build our own chip.

## There is Nothing New Under the Sun

- The architectures that you can choose broadly speaking:
  - large systolic array - single instruction stream + dispatch: TPU, Etched, MatX (my guess)
  - many core MIMD machine with vector/matrix engines: Dojo, TT, Cerebras, GPUs (to some degree), Furiosa (check), Rebellions (check), Trainium/Inferentia (check), d-matrix
  - streaming dataflow with kernel dispatch / instruction decode/dispatch amorization: SambaNova, Groq, Blaize
  - exotic physics-inspired / Neuromorphic architectures: IBM truenorth, Intel Loihi, whatever Normal computing and extropic are doing
- The storage mechanics you can choose:
  - all SRAM + inter-chip link heavy communication
  - hardcoded weight ROMs (mixed with a mostly SRAM architecture)
  - GDDR6/7 for prefill optimized chips / large memory capacity / workloads with high arithmetic intensity (TT made this bet)
  - HBM for general purpose everything + decode optimized chips / workloads with low arithmetic intensity that are memory bandwidth bound

So what will it be? My guess is a many core MIMD machine with local per-core scratchpads, a large system-level scratchpad, and each core having a scalar dispatch unit that directs instructions to the vector lanes / matrix unit and can perform DMAs to and from the per-core scratchpad from the global chip one + external HBM
- Why? This is the most logical architecture.
- So where can they innovate?
  - Off-chip links from broadcom might be better than everything on the market except NVLink (beating NVLink 5/6 by the time of Rubin rollout seems very very unlikely)
  - Highly specialized datatypes and minimal ALUs may give higher compute density and maybe lower leakage power over NVIDIA
  - And that's it... the software will be a far cry from the maturity of the CUDA stack
  - Oh, and of course TCO. That's all that matters for them perhaps. But in the larger context, TCO includes SW optimization costs and silicon underutilization opportunity costs too. Hard to believe you can beat GB300 NVL72 (see Semianalysis InferenceMAX).
