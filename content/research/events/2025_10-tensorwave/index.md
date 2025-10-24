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

So ScalarLM does run on the TensorWave cloud, and it's a framework that glues together [Megatron-Core](https://developer.nvidia.com/megatron-core) (a PyTorch training building-block library developed by NVIDIA and ported to run on ROCm), [vLLM](https://github.com/vllm-project/vllm) as an inference engine, and can, in principle, be used for inference or fine-tuning of any model available on [HuggingFace](https://huggingface.co/models).

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



- The panel itself was quite laughable. The AT&T guy presented some Telco-specific fine-tuning of Gemma 4B using ScalarLM on a TensorWave cluster, but I think everyone saw this as a joke. Why would anyone bother to use AMD unless they were penny pinching (which no one has to do today considering how well funded all these AI companies are)? And AMD systems aren't even cheaper once you consider the time spent porting software. As Jensen said, even if his competitors give their hardware away for free, it still isn't enough for them to get traction in the market. I would think he is right.

## TensorWave Today

- Idk why TensorWave is allowed to host these events anymore. AMD shouldn't allow it. There were 250+ people on the invite but maybe 50 people showed up to the event, counting the TensorWave employees. The space was huge and really could accommodate hundreds of people. Lots of seating was set up. Lots of pizza and poison was ready to go.
- The relationship between RelationalAI, TensorWave, and ScalarLM are still unclear. They are 3 separate entities, but they seem to have overlapping employees.
- TensorWave DC side is not bad actually - the best of the AMD GPU clouds so far. From what we heard, TensorWave has improved their rack and cluster level networking reliability to the point where it can be used like any other tier-1 GPU cloud's systems. They have decent telemetry. They have decent provisioning speed. I haven't tried it myself, but I get the impression that it has improved substantially over the past 6 months.

## GPU Markets Today

- What GPU markets exist? 1. Gaming 2. HPC / Workstation applications 3. Training 4. Inference
  - How does the AMD programming model allow them to capture each one? In the current form, it doesn't.

## The CUDA Moat Today


- https://parallelprogrammer.substack.com/
  - The CUDA Handbook
- AMD software side isn't great. Kernel drivers are still flaky. Lots of random bugs everywhere, especially in the cross-GPU communication libraries (which are just a fork of NCCL).
- NVIDIA does a great job separating parts of their compilation stack (CUDA C++, PTX, SASS, low level machine code) so they can always make changes in the lowest layer and just make all software compatible via the low-level JIT compiler. AMD doesn't seem to know how do to this so kernels just suddenly stop working on future GPU generations - at least NVIDIA kernels always work, albeit with per-architecture performance tuning being necessary.
- ZLUDA has a revival! After it was shot down by AMD management (don't want to be stuck with the CUDA APIs and let NVIDIA always make the first move) and legal (what if it is illegal to work on PTX directly?), it seems those very smart guys moved out of AMD and kept working thanks to external funding coming online. (https://github.com/vosen/ZLUDA)
  - This might be the future of anything working on AMD
  - AMD actually tried to go back on their contract with the ZLUDA people (https://zluda.readthedocs.io/latest/faq.html) and take down their open source repo when AMD said they wouldn't move forward with it (even though that was permitted in their contract). Very insane lawyers who went crazy and sabotaged AMD's future.
- AMD has tried to force tier-1 SW companies to HIP-ify their kernels (think Autodesk, Adobe, ...). It has mostly been a failure with billions lost in time alone. A CUDA emulation layer is crucial and the obvious way to get decent software support quickly. Trying to make people rewrite kernels just isn't going to work.
- On the other hand, even though HIP and so forth for HPC / workstation software won't work logistically, since RoCM has decent support in PyTorch / JAX (?), it should be possible to make porting most DNN workloads easy. Still isn't the case due to custom CUDA kernels everywhere, but technically doable. Especially once they have a working Triton/Gluon backend that is as robust as the NVIDIA one.
- The Spectral Compute guys (https://scale-lang.com/) are taking another approach where they target the CUDA frontend directly! But this is mired in difficulty as they need to replicate all the functionality and subtleties of nvcc going down to PTX. And they need to handle the warp size being 64 on AMD but 32 on NVIDIA, which needs hacking at the source level.
- Dedicated address registers (with addressing modes encoded in the opcode and direct memory manipulation ISA) + vs unified load/store architecture for SIMT machines...
  - Hard to say. If you have scalar runahead and a decoupled post-commit vector machine like SiFive does, then this wouldn't buy you much and would make the register space fragmented, making compilation harder
  - But for a SIMT machine where you have in-order vector instruction dispatch and limited opportunity to amortize the cost of multiple RISC instructions, perhaps this would make sense. Allowing physical separation and banking of the RF would be advantageous too from a PD and timing perspective, but it is hard to say what it would buy you for the tradeoff of more spills and compiler complexity.
- Dojo stories. No precise exceptions. No step-by-step debugger. No compiler. No pre-silicon emulator. And all these and more led to the failure of Dojo.
  - The importance of building the entire software stack BEFORE tapeout is so essential. AMD can't do this. Nearly all SW dev only happens after the silicon is back and brought up. The internal uarch is a total mess.
  - NVIDIA does this all the time. They have a robust chip emulator. Firmware and drivers are nailed down before the silicon is back and it's running full workloads on the power up day.

- https://x.com/SemiAnalysis_/status/1980840184905158712

> Meta has open sourced their CTran library that natively works with AMD & NVIDIA GPUs 🚀. Previously, if u want multiple NVIDIA GPUs to work together on an workload, you must used the NVIDIA NCCL library. Although NCCL's source code is public, it does not have an open governance model, does not have open CI, employs an "code dump" update model, is not GitHub first, and rarely accepts external contributions. Previously, If you want multiple GPUs to work together on an workload, you must used the AMD fork called RCCL library, which is a delayed fork of NVIDIA's NCCL.  With CTran, it is 1 unified library and allows for adding new like Bruck's in an way such that the code can be shared between different AI GPU types.
>
> Furthermore, Meta has open sourced NCCLX (NCCL extended) which is their production-tested collective library that powered all Llama training and uses the unified CTran library. Meta is the creator & main maintainer of PyTorch and is well trusted in the open source community.
>
> NVIDIA continues to be the leader in collective libraries but Jensen must not taken it for granted given the heavily increased competition in the open source collective communication space. Just like how TRTLLM moved to an GitHub first development when facing heavy competition from SGLang/vLLM, Jensen should seriously consider moving NCCL to GitHub first open development model due to the competition in the collective front too. To draw parallel comparisons to the inference engine world, Collective Communication Libraries are moving from the 2021 "FasterTransformer" era to the 2025 "SGLang/vLLM/TRTLLM" era.
>
> The main competitors in the collective library space include China's DeepEP library, AMD's new MORI, AMD's upcoming MORI-CCL, Meta's CTran & NCCLX, NVIDIA's NCCL (which has released their new NCCL Device API, NCCL's new GPU-Initiated Networking, etc). Competition breeds innovation! 🚀

Use `gthumb` for cropping
