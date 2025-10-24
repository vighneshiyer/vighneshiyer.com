+++
title = "TensorWave: Massive Scale Training & Inference"
date = 2025-10-21
draft = false
description = "How is it looking for AMD in late 2025? ScalarLM, ZLUDA, the CUDA moat, and more!"

[extra]
new = true
+++

On October 21, 2025, [TensorWave](https://tensorwave.com/) (the all-AMD neocloud) held an event titled ["Massive Scale Training & Inference Panel + Networking"](https://luma.com/user/tensorwave?e=evt-uYChiLUtDtmCprG) at the very spacious HockeyStack office in San Francisco.
Featuring a lot of drinks, pizza, a panel, and plenty of opportunity for mixing, I had a fun time.
Let's get into it.

## The Setup

> The panel will explore Massive Scale Training and Inference for the enterprise with ScalarLM.
>
> Panelists: A curated lineup of leaders and community builders from leading tech companies and foundations including:
>
> - Greg Diamos - Architect, ScalarLM
>
> - Molham Aref - Founder & CEO, RelationalAI
>
> - Farbod Tavakkoli - Data Scientist, AT&T
>
> - Jeff Tatarchuk – Moderator, Co-Founder, TensorWave

{{ image(path="room.jpg", class="content", padding=false) }}

I came to this event expecting a deep discussion of the internals of [ScalarLM](https://www.scalarlm.com/), a unified training / inference stack that runs on AMD GPUs.
I wanted to know its low-level internals, performance and profiling details, and the challenges in porting vLLM to run various models on AMD GPUs cleanly and efficiently.
I was expecting a discussion of what has been done so far, what doesn't work, and how things will change in the coming months.

But, none of this happened: the panel was disappointing.
Perhaps I should have gone to the PyTorch or Triton Developers Conference instead.[^1]

[^1]: Turns out that it is ["Open Source AI Week"](https://events.linuxfoundation.org/open-source-ai-week/) in SF

## The Panel

After getting some drinks, we all sat down for the panel at 7pm which lasted around 45 minutes.

{{ gallery(images=[
    "panel.jpg",
    "panel_speakers.jpg",
], popout=false, caption="The panelists. Ilya substituted for Jeff.") }}

### ScalarLM

We began with some pleasantries and then Greg jumped into some slides about ScalarLM.

{{ gallery(images=[
    "scalar_lm_tensorwave.jpg",
    "scalar_lm.jpg",
], popout=false) }}

ScalarLM can run on the TensorWave cloud, and it is a framework that glues together [Megatron-Core](https://developer.nvidia.com/megatron-core) (a PyTorch training building-block library developed by NVIDIA and ported to run on ROCm), [vLLM](https://github.com/vllm-project/vllm) as an inference engine, and can, in principle, be used for inference or fine-tuning of any model available on [HuggingFace](https://huggingface.co/models).

<!--
- The panel discussion didn't have anything to do with ScalarLM! Which I why I came here in the first place. Greg was there, but he only talked about ScalarLM at a very high level. I wanted to know the low-level internals, performance and profiling details (perhaps discussion of inclusion in InferenceMAX and MLPerf), and the challenges in porting vLLM to run random HF models on AMD GPUs cleanly. And what does and doesn't work so far, and how that will change in the coming months.
-->

{{ gallery(images=[
    "scalar_lm_kube.jpg",
    "scalar_lm_overview.jpg",
], popout=false) }}

This was followed by a few slides discussing support for Kubernetes deployments on TensorWave and the high-level APIs provided by ScalarLM.
Sure.
Nice.
But I could have just found this on the [ScalarLM website](https://www.scalarlm.com/architecture/)[^2].
And that was it for ScalarLM 😞.
Switching gears now.

[^2]: ScalarLM is very light on documentation; expected for such a new and understaffed project.

### Time for Enterprise AI

Enterprises are very serious operations.
AI is absolutely required to make critical business decisions.
If you aren't using the model to accelerate the decision making process, what are you even doing?

{{ image(path="ai_for_decision_intelligence.jpg", class="inset", padding=false, caption="Mr. Model, what should I charge for these widgets to maximize profits?") }}

This part was presented by [RelationalAI](https://www.relational.ai/), a company that builds "decision agents" that are "aligned to your business".

{{ image(path="relational_ai.png", class="inset", padding=false, caption="Rel, the decision agent, is here to help you make business decisions.") }}

The [RelationalAI](https://www.relational.ai/) guy stressed that "superalignment" of the foundation model was crucial to its performance in real-world tasks.

{{ image(path="superalignment.jpg", class="inset", padding=false) }}

To be clear, the "superalignment" they're talking about has nothing to do with the "superalignment" of the squealing AI safetyists.
They are talking about fine-tuning, RAG, and context engineering using a business' internal, domain-specific data.[^3]
So what does superalignment enable?

[^3]: I don't mean to mock RelationalAI too much, it is a serious company

{{ gallery(images=[
    "spider_20_benchmark.jpg",
    "bird_benchmark.jpg",
], popout=false, caption="'Superalignment' for accurately writing SQL from English requests") }}

They presented improvements on a few text-to-SQL benchmarks: [Spider 2.0](https://spider2-sql.github.io/) and [BIRD-SQL Mini-Dev](https://github.com/bird-bench/mini_dev).
With RelationalAI, we're one step closer to being able to replace data scientists, thanks to the special sauce of "superalignment".
You may have noticed that this has nothing to do with AMD GPUs, TensorWave, or ScalarLM.

### AT&T 'Telco' Fine-Tuning

And now, for the highlight of the panel.
Behold, the "enterprise" use case for ScalarLM, presented by a data scientist from AT&T.

{{ gallery(images=[
    "ask_att.jpg",
    "telco_ai_asset.jpg",
], popout=false, caption="Just ask the AT&T model") }}

The enterprise needs AI.
And the AI needs to be fine-tuned with the domain-specific knowledge required to answer questions.
In the case of AT&T, that means they need a fine-tuned foundation model with knowledge of 'telco' facts: a *telco-specific LLM*.

So they fine-tuned Gemma 4B using ScalarLM on a TensorWave cluster to do a good job at recalling and reasoning about "telco-specific" facts.

{{ image(path="telelogs.jpg", class="inset", padding=false) }}

This fine-tuned tiny model outperforms GPT-5 by 0.09% on one specific category (TeleLogs) of the [GSMA Open-Telco LLM Benchmark](https://huggingface.co/blog/otellm/gsma-benchmarks) (see the [full leaderboard here](https://huggingface.co/spaces/otellm/leaderboard)).
Very good. Good job guys.
Now AT&T can deploy a tiny model themselves to service telco-specific token generation and save some money.

{{ image(path="money_saved.jpg", class="inset", padding=false, caption="Money saved! Tokens away!") }}

And with that, the panel was over.

### Jensen Always Wins

Looking at what was presented, what does any of it have to do with TensorWave or AMD GPUs specifically?
Why would anyone bother to use AMD GPUs unless they were penny pinching, which hardly anyone does nowadays, considering how well funded these AI companies are.
And using AMD isn't even cheaper once you factor in the opportunity cost of the time spent porting software and getting optimal performance.

In 2024, [Jensen reminded everyone](https://www.youtube.com/watch?v=cEg8cOx7UZk) of this important fact:

> When you see computers these days, it is a datacenter, and you have to operate it.
> So the people who buy and sell chips think about the price of chips, but people who operate datacenters think about the cost of operations.
>
> Our time to deployment, our performance, our utilization, our flexibility across all these different applications, in total, allows our operations cost (TCO), to be so good, that *even when our competitor's chips are free, it's not cheap enough*.

AMD couldn't give their chips away for free; they had to [*give away* their equity too](https://openai.com/index/openai-amd-strategic-partnership/).
In contrast, NVIDIA can [*take equity from* the AI labs](https://nvidianews.nvidia.com/news/openai-and-nvidia-announce-strategic-partnership-to-deploy-10gw-of-nvidia-systems) while selling them their chips.
This lopsided situation isn't an accident.

<!--
- The panel itself was quite laughable. The AT&T guy presented some Telco-specific fine-tuning of Gemma 4B using ScalarLM on a TensorWave cluster, but I think everyone saw this as a joke. Why would anyone bother to use AMD unless they were penny pinching (which no one has to do today considering how well funded all these AI companies are)? And AMD systems aren't even cheaper once you consider the time spent porting software. As Jensen said, even if his competitors give their hardware away for free, it still isn't enough for them to get traction in the market. I would think he is right.
-->

Now that the panel discussion is out the way, I'll pull together some comments from various attendees and my own thoughts.

## TensorWave and AMD Today

OK, first on TensorWave.
Why do these guys continue to host these kind of events that just degrade confidence in AMD and make their GPUs look like a joke?
The events are run so professionally with lots of photographers, event planners, and so forth.
But the content is so lackluster, and honestly laughable, which makes AMD look way worse than what they deserve.[^4]

[^4]: AMD has [come a really long way](https://inferencemax.semianalysis.com/) in driver stability and PyTorch support

TensorWave signed up around 250 people for this event, but there were perhaps 50 people who attended, including the TensorWave employees.
I understand it was a free event held during the busy AI Week with many other overlapping events, but still.
The empty space, with stacks of boxes of uneaten pizza and plenty of wine and White Claw to spare, made the event feel even more lackluster.

It is unclear what the relationship between RelationalAI, TensorWave, and ScalarLM is.
As I understand, TensorWave funds ScalarLM, and RelationalAI uses TensorWave for some fine-tuning.
They are 3 separate entities, but they also seem to have overlapping employees.

From speaking with attendees, it seems that TensorWave is actually *not bad at all* from a technical perspective.
They've improved their rack and cluster-level networking, and things are now quite reliable and stable for long training runs.
The telemetry they offer is decent and their provisioning speed is also acceptable.
It seems they are the *best when it comes to AMD neoclouds*, and their systems can be used just like any other tier-1 GPU cloud.
I haven't tried the TensorWave cloud myself, but my impression is that it has improved substantially over the past 5 months.

However, on AMD's side, things are still not that great.
I heard that the driver stability and the quality of their software stack is in general poor.
They are slow to respond to bug reports and there are still problems in their [cross-GPU communication library](https://github.com/ROCm/rccl).
<!--
- Idk why TensorWave is allowed to host these events anymore. AMD shouldn't allow it. There were 250+ people on the invite but maybe 50 people showed up to the event, counting the TensorWave employees. The space was huge and really could accommodate hundreds of people. Lots of seating was set up. Lots of pizza and poison was ready to go.
- The relationship between RelationalAI, TensorWave, and ScalarLM are still unclear. They are 3 separate entities, but they seem to have overlapping employees.
- TensorWave DC side is not bad actually - the best of the AMD GPU clouds so far. From what we heard, TensorWave has improved their rack and cluster level networking reliability to the point where it can be used like any other tier-1 GPU cloud's systems. They have decent telemetry. They have decent provisioning speed. I haven't tried it myself, but I get the impression that it has improved substantially over the past 6 months.
- AMD software side isn't great. Kernel drivers are still flaky. Lots of random bugs everywhere, especially in the cross-GPU communication libraries (which are just a fork of NCCL).
-->

## The CUDA Moat Today

To understand NVIDIA's continued dominance, I'll go over the big GPU markets and how they are served by NVIDIA's programming model and software.

### GPU Markets

I think there are 4 significant markets for GPUs today:

1. Gaming
2. HPC / workstation applications
3. ML Training
4. ML Inference

- What GPU markets exist? 1. Gaming 2. HPC / Workstation applications 3. Training 4. Inference
  - How does the AMD programming model allow them to capture each one? In the current form, it doesn't.

### Why is CUDA Great?

#### Lessons from Dojo

- Dojo stories. No precise exceptions. No step-by-step debugger. No compiler. No pre-silicon emulator. And all these and more led to the failure of Dojo.
  - The importance of building the entire software stack BEFORE tapeout is so essential. AMD can't do this. Nearly all SW dev only happens after the silicon is back and brought up. The internal uarch is a total mess.
  - NVIDIA does this all the time. They have a robust chip emulator. Firmware and drivers are nailed down before the silicon is back and it's running full workloads on the power up day.

Dojo exposed the hw redundancy directly in the isa, like the cores were fused off per device and the compiler has to reason about that lol, another reason for failure

The importance of cleanly separating architecture and microarchitectute, this makes all the difference to build a robust compiler, ergonomics are so important, Nvidia did this right

But do LLM generated kernels make this obsolyet thinking? If karpathy is right that llms aren't thinking machines but rather human spirits, then I don't think the spirits would be happy with a broken compiler and exposed uarch details everywhere lol.

> If language models can reason from documentation and code analysis and perhaps the PTX spec alone, then why would examples be a limiting factor (all the libraries you mentioned have their code open source)? What to you appears to be the fundamental limiter for how models can write CUDA code? What are the failure modes you see?

> There is something here that is a bit subtle. CUDA kernels are amenable to model autonomous iteration because they manage to separate enough microarchitectural details from the architectural ISA. If this isn't the case, I suspect LLMs would perform much worse - consider the Groq or Dojo ISA.

- https://parallelprogrammer.substack.com/
  - The CUDA Handbook
- NVIDIA does a great job separating parts of their compilation stack (CUDA C++, PTX, SASS, low level machine code) so they can always make changes in the lowest layer and just make all software compatible via the low-level JIT compiler. AMD doesn't seem to know how do to this so kernels just suddenly stop working on future GPU generations - at least NVIDIA kernels always work, albeit with per-architecture performance tuning being necessary.


### ZLUDA

- ZLUDA has a revival! After it was shot down by AMD management (don't want to be stuck with the CUDA APIs and let NVIDIA always make the first move) and legal (what if it is illegal to work on PTX directly?), it seems those very smart guys moved out of AMD and kept working thanks to external funding coming online. (https://github.com/vosen/ZLUDA)
  - This might be the future of anything working on AMD
  - AMD actually tried to go back on their contract with the ZLUDA people (https://zluda.readthedocs.io/latest/faq.html) and take down their open source repo when AMD said they wouldn't move forward with it (even though that was permitted in their contract). Very insane lawyers who went crazy and sabotaged AMD's future.
- AMD has tried to force tier-1 SW companies to HIP-ify their kernels (think Autodesk, Adobe, ...). It has mostly been a failure with billions lost in time alone. A CUDA emulation layer is crucial and the obvious way to get decent software support quickly. Trying to make people rewrite kernels just isn't going to work.
- On the other hand, even though HIP and so forth for HPC / workstation software won't work logistically, since RoCM has decent support in PyTorch / JAX (?), it should be possible to make porting most DNN workloads easy. Still isn't the case due to custom CUDA kernels everywhere, but technically doable. Especially once they have a working Triton/Gluon backend that is as robust as the NVIDIA one.

### Spectral Compute

- The Spectral Compute guys (https://scale-lang.com/) are taking another approach where they target the CUDA frontend directly! But this is mired in difficulty as they need to replicate all the functionality and subtleties of nvcc going down to PTX. And they need to handle the warp size being 64 on AMD but 32 on NVIDIA, which needs hacking at the source level.

- Dedicated address registers (with addressing modes encoded in the opcode and direct memory manipulation ISA) + vs unified load/store architecture for SIMT machines...
  - Hard to say. If you have scalar runahead and a decoupled post-commit vector machine like SiFive does, then this wouldn't buy you much and would make the register space fragmented, making compilation harder
  - But for a SIMT machine where you have in-order vector instruction dispatch and limited opportunity to amortize the cost of multiple RISC instructions, perhaps this would make sense. Allowing physical separation and banking of the RF would be advantageous too from a PD and timing perspective, but it is hard to say what it would buy you for the tradeoff of more spills and compiler complexity.

### NVIDIA's Open Source Strategy

- https://x.com/SemiAnalysis_/status/1980840184905158712

> Meta has open sourced their CTran library that natively works with AMD & NVIDIA GPUs 🚀. Previously, if u want multiple NVIDIA GPUs to work together on an workload, you must used the NVIDIA NCCL library. Although NCCL's source code is public, it does not have an open governance model, does not have open CI, employs an "code dump" update model, is not GitHub first, and rarely accepts external contributions. Previously, If you want multiple GPUs to work together on an workload, you must used the AMD fork called RCCL library, which is a delayed fork of NVIDIA's NCCL.  With CTran, it is 1 unified library and allows for adding new like Bruck's in an way such that the code can be shared between different AI GPU types.
>
> Furthermore, Meta has open sourced NCCLX (NCCL extended) which is their production-tested collective library that powered all Llama training and uses the unified CTran library. Meta is the creator & main maintainer of PyTorch and is well trusted in the open source community.
>
> NVIDIA continues to be the leader in collective libraries but Jensen must not taken it for granted given the heavily increased competition in the open source collective communication space. Just like how TRTLLM moved to an GitHub first development when facing heavy competition from SGLang/vLLM, Jensen should seriously consider moving NCCL to GitHub first open development model due to the competition in the collective front too. To draw parallel comparisons to the inference engine world, Collective Communication Libraries are moving from the 2021 "FasterTransformer" era to the 2025 "SGLang/vLLM/TRTLLM" era.
>
> The main competitors in the collective library space include China's DeepEP library, AMD's new MORI, AMD's upcoming MORI-CCL, Meta's CTran & NCCLX, NVIDIA's NCCL (which has released their new NCCL Device API, NCCL's new GPU-Initiated Networking, etc). Competition breeds innovation! 🚀

## Lunacy on BART

{{ gallery(images=[
    "bubble_2.jpg",
    "bubble_1.jpg",
], popout=false, caption="We are living in an insane asylum") }}
