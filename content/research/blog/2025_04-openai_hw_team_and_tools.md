+++
title = "OpenAI's Hardware Effort"
date = 2023-08-23
draft = true
slug = "openai-hardware-effort"
description = "XLS, HW design methodology, the supposed imminent tapeout"
+++

# The OpenAI Hardware Effort: I'm Pessimistic

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
