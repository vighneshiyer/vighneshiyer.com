+++
title = "OpenAI's Hardware Effort"
date = 2023-08-23
draft = true
slug = "openai-hardware-effort"
description = "XLS, HW design methodology, the supposed imminent tapeout"
+++

Even at the early stage, when OpenAI just came to be in 2015, their goal was the same as it is today: *artificial general intelligence* (AGI).
At that time, the idea that language models could eventually produce human-like text was a stretch.
And even if they believed that language models could get to that point, *general* intelligence would require all kinds of augmentation around it.
As Greg Brockman put it recently, they thought that AGI was a matter of putting the right pieces in place, and then suddenly, it would emerge.


After all, the human brain is remarkably efficient and small.
Disembodied human. 100s of watts, scaling network size and connectivity to produce a normal brain or an Einstein brain. Ability to do human-like work on a computer autonomously - ability to use digital tools just like a human would to augment its ability to reason.

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

## Latest Announcement

- https://x.com/OpenAI/status/1977794196955374000

> We’re designing our own chips — taking what we’ve learned from building frontier models and bringing it directly into the hardware. Building our own hardware, in addition to our other partnerships, will help all of us meet the world’s growing demand for AI.
>
> In Episode 8 of the OpenAI Podcast, @sama and @gdb join Broadcom’s Hock Tan and Charlie Kawwas with host @andrewmayne to discuss how OpenAI-designed chips will power the world’s growing AI demand.

The podcast has many gems

- Sam: etching transistors to the token that comes out
- Kawwas: networking, scale up, scale out, scale across
- Brockman: conceptual pieces in place -> then AGI
- Brockman: massive design space
- Brockman: teams within openai, their output is a direct function of how much compute they get

- https://openai.com/index/openai-and-broadcom-announce-strategic-collaboration/

- https://x.com/theaustinlyons/status/1977795942234353757

> The $AVGO partnership isn't just a custom chip, but entire rack-scale cluster for reasoning inference, per the Broadcom + OpenAI podcast this morning:
>
> "Andrew Mayne: So this is going to entail both compute and chip design and scaling out?
>
> Sam Altman: This is a full system... the vertical integration point is really important... design the whole system, all of the stuff about the chip, the way we design these racks, the networking between them, how the algorithms that we're using fit the inference chip itself, a lot of other stuff all the way to the end product."

- https://x.com/itsclivetime/status/1977772728850817263

> Really happy to be announcing the chips we’ve been cooking the past 18 months! OpenAI kicked off the reasoning wave with o1, but months before that we’d already started designing a chip tuned precisely for reasoning inference of OpenAI models.
>
> In January 2024, I joined OpenAI as a hybrid gpu programmer & custom chip designer, the first IC on an oddly positioned hardware team that hadn’t yet committed to the idea of custom chips. These past 21 months I’m so lucky to have gotten the chance to learn from this incredibly talented and tiny team, accelerated by tight codesign with our ML team, Broadcom, and a few really cool new AI tools ;)
>
> Now we’re 9 months away from what is I think the fastest and largest volume ramp of any first time chip. Looking forward to pushing the cost and latency of intelligence to zero.

- https://x.com/dnystedt/status/1977988409080901873

> OpenAI – Broadcom Podcast Interview on custom chip tie-up.
>
> Sam Altman: “To zoom out a little bit, if you simplify what we do in this whole process, you know, melt sand, run energy through it, and get intelligence out the other end…” 1/14 $AVGO $TSM $NVDA $AMD #OpenAI
>
> 2/14 More than a chip:
> Sam: “…as we realized we were going to really need the whole system together to support this – it’s just gotten more and more complex – it turns out Broadcom is also incredible at helping design systems. So we are working together on that entire package…”
>
> 3/14 Co-designers, specific work
> Sam: “We are able to think from etching the transistors all the way up to the token that comes out when you ask ChatGPT a question, and design the whole system – all of the stuff about the chip, the way we design the racks, the networking between them, how the algorithms that we’re using fit the inference chip itself – all the way to the end product.”
>
> 4/14 Importance of computing hardware
>
> OpenAI President Greg Brockman: Years ago... “…we really saw if you scale it by 2x, then suddenly your agent is 2x better and it’s like, okay, we have to push this to the limit.”
>
> 5/14 Semiconductors
>
> Sam: “To zoom out a little bit, if you simplify what we do in this whole process, to, you know, melt sand, run energy through it, and get intelligence out the other end -  you’re not literally melting sand – but it’s a nice visual”
>
> Broadcom CEO Hock Tan (laughing): “That’s a good one. I like that.”
>
> Sam: “What we want is the most amount of intelligence we can get out of each unit of energy, because that will become the gate at some point. I hope what this whole process will show us (is) from the model we design to the chip to the rack, we will be able to wring out so much more intelligence per watt.”
>
> Hock: “And you control your own destiny. You do your own chips, you control your own destiny.”
>
> 6/14 Big Fail for AI accelerator firms
>
> Brockman: “There were all sorts of chip startups, with novel approaches that were very different from GPUs and we started giving them a ton of feedback, saying ‘here’s where we think things are going, it needs to be models of this shape’ and honestly, a lot of them just didn’t listen to us. And so it’s very frustrating to be in this position where you say ‘we see the direction the future should be going (but) we have no ability to really influence it besides just sort of trying to influence other people’s roadmaps.”
>
> 7/14 Building ChatGPT’s chip expertise
>
> Brockman: “…we’ve been able to apply our own models to designing this chip, which has been really cool. We’ve been able to pull in the schedule, we’ve been able to get massive area reductions – you take components that humans have already optimized and just port compute into it and the model comes out with its own optimizations. And it’s very interesting. We’re at the point now where, I don’t think any of the optimizations we have are ones that human designers couldn’t have come up with, like usually our experts take a look at it later, and say yeah, this was on my list, but it was like 20-things that would have taken them another month to get to.” $SNPS $CDNS
>
> 8/14 More ChatGPT
>
> Broadcom chip chief Charlie Kawwas: “…my software engineers now already use that from a software point of view and it’s delivering efficiencies of dozens of engineers. On the hardware side, we’re not there yet. But you know, the good news – we’ll get there (with OpenAI) – yes, we should absolutely leverage this.”
>
> 9/14 OpenAI loves GPUs
>
> Sam: “…the GPUs of today are incredible, incredible things. I’m very grateful, and we will continue to really need a lot of those. The flexibility and the ability to let us do fast research is amazing.
>
> Greg: “…in 2017 when we started looking at all these other accelerators, it was actually very non-obvious about what the landscape would look like in 5-10 years. I think it’s really a testament to companies like Nvidia, AMD for how much the GPU has moved forward and continued to be the dominant accelerator.”
>
> 10/14 Training vs Inference
>
> Hock: “If you want to train, you design chips that are much stronger in computing, capacity – measured in TFLOPS – as well as network, because it’s not just one chip that makes it happen, it’s a cluster. But if you want to do inference, you put in more memory and memory access relative to compute. So you are, actually over time, creating chips optimized for particular workloads, applications, as we go along.”
>
> (TFLOPS: Tera Floating Point Operations Per Second)
>
> 11/14 OpenAI Chip Roadmap
>
> Hock: “…ChatGPT-5, 6, 7, on and on and each of them will require a different chip, a better chip, a more developed chip, advanced chip that we haven’t even begun to figure out how to get there. But we will.”
>
> “…it’s really incumbent on us to keep optimizing, pushing the envelope on leading-edge technology, and there’s still room to grow…as we go to 2-nanometers going forward, as we start doing all kinds of different technology, it is really great, exciting times, especially for hardware and the semiconductor industry.”
>
> OpenAI will begin to deploy the chips in late 2026.
>
> 12/14 Bigger and bigger clusters
>
> Sam: “The first cluster OpenAI had, the first one that I can remember the energy size for, was 2-megawatts (2MW). I don’t remember when we got to 20MW, but I remember when we got to 200MW…and we will finish this year a little bit over 2-gigawatts (2GW). And these recent partnerships will take us close to 30GW.”
>
> 13/14 Broadcom chip expertise / OpenAI workload understanding
>
> Greg: “…building our own chips for our own specific workloads was not something we could get into from a total standstill without working with Hock and Charlie and Broadcom. It’s been incredible to lean on their expertise with our understanding of the workload…to accelerate what’s possible through this project.”
>
> 14/14 End
> Sama: The AI computing infrastructure buildout right now is “…the biggest joint industrial project in human history.”
>
> “This requires a lot of companies, a lot of countries, a lot of industries to come together, and a lot of stuff has to happen at the same time and we’ve all got to invest together… (and given everything we’ve seen) I think the whole industry has decided this is a good bet to take.”

- Dojo stories. No precise exceptions. No step-by-step debugger. No compiler. No pre-silicon emulator. And all these and more led to the failure of Dojo.
  - The importance of building the entire software stack BEFORE tapeout is so essential. AMD can't do this. Nearly all SW dev only happens after the silicon is back and brought up. The internal uarch is a total mess.
  - NVIDIA does this all the time. They have a robust chip emulator. Firmware and drivers are nailed down before the silicon is back and it's running full workloads on the power up day.

Dojo exposed the hw redundancy directly in the isa, like the cores were fused off per device and the compiler has to reason about that lol, another reason for failure

The importance of cleanly separating architecture and microarchitectute, this makes all the difference to build a robust compiler, ergonomics are so important, Nvidia did this right

But do LLM generated kernels make this obsolyet thinking? If karpathy is right that llms aren't thinking machines but rather human spirits, then I don't think the spirits would be happy with a broken compiler and exposed uarch details everywhere lol.

> If language models can reason from documentation and code analysis and perhaps the PTX spec alone, then why would examples be a limiting factor (all the libraries you mentioned have their code open source)? What to you appears to be the fundamental limiter for how models can write CUDA code? What are the failure modes you see?

> There is something here that is a bit subtle. CUDA kernels are amenable to model autonomous iteration because they manage to separate enough microarchitectural details from the architectural ISA. If this isn't the case, I suspect LLMs would perform much worse - consider the Groq or Dojo ISA.

- https://x.com/AlphaSenseInc/status/1983895917637079310

> A former $AMD employee cautions that OpenAI's financial structure could disrupt the entire AI hardware supply chain ( $NVDA, $AVGO, $AMZN, $GOOGL ):
>
> - The expert explained that custom silicon carries a significantly higher risk than GPUs because such chips are typically built for a single customer and cannot be repurposed. While contracts include prepayments for non-recoverable engineering costs, clients can often opt out before manufacturing, leaving the vendor unable to reuse the silicon, as seen with the $AVGO –OpenAI deal, which is exclusive to OpenAI.
>
> - According to the expert, OpenAI may choose not to proceed with $AVGO's custom silicon deal if the performance and power-efficiency gains fail to justify the complexity and cost. He noted that companies typically pursue custom ASICs only when they deliver a 10-100x improvement over general-purpose hardware. However, GPUs are evolving so rapidly that they could narrow the performance gap to within 20%–50%, making them an acceptable solution, without requiring entirely new software stacks or operating environments.
>
> - The expert explained that $GOOGL's TPUs are primarily optimized for its own applications, such as YouTube and other in-house services, meaning its hardware and software ecosystem is largely self-contained. Unlike $AMZN, whose cloud business relies heavily on third-party developers, roughly 60% of AWS workloads come from external users, while $GOOGL's ecosystem is about 60% internally driven. This distinction affects switching costs and stickiness: $GOOGL's AI hardware is deeply integrated into its own software stack, giving it control but limiting flexibility and third-party adoption. In contrast, $AMZN's custom chips like Inferentia and Trainium benefit from broader applicability across different clients and workloads.
>
> - The expert emphasized that the risks surrounding AI chip investments and custom silicon are largely being overlooked, as few outside the semiconductor industry fully grasp how fragile the ecosystem is. He said most investors don't realize that hardware commitments in AI lack the stability seen in traditional semiconductors, where standards are established years in advance. Instead, investors are chasing wherever OpenAI signals it plans to spend, without considering whether those designs will hold value if OpenAI's demand slows.
>
> - According to the expert, the main problem in this system lies on the demand side: OpenAI's end customers. Since OpenAI frequently shifts its business model, he warned that without a clear and sustained source of third-party revenue beyond its hardware suppliers and cloud partners, the entire ecosystem risks being propped up by circular investments rather than real, organic demand.
