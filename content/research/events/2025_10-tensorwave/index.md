+++
title = "TensorWave: Massive Scale Training & Inference"
date = 2025-10-21
draft = true
description = ""
+++

- Nice and fun event held at the HockeyStack office in SF.
- Small panel discussion from 7pm for around 45 minutes
- Idk why TensorWave is allowed to host these events anymore. AMD shouldn't allow it. There were 250+ people on the invite but maybe 50 people showed up to the event, counting the TensorWave employees. The space was huge and really could accommodate hundreds of people. Lots of seating was set up. Lots of pizza and poison was ready to go.
- The panel discussion didn't have anything to do with ScalarLM! Which I why I came here in the first place. Greg was there, but he only talked about ScalarLM at a very high level. I wanted to know the low-level internals, performance and profiling details (perhaps discussion of inclusion in InferenceMAX and MLPerf), and the challenges in porting vLLM to run random HF models on AMD GPUs cleanly. And what does and doesn't work so far, and how that will change in the coming months.
- The relationship between RelationalAI, TensorWave, and ScalarLM are still unclear. They are 3 separate entities, but they seem to have overlapping employees.
- https://parallelprogrammer.substack.com/
  - The CUDA Handbook
- TensorWave DC side is not bad actually - the best of the AMD GPU clouds so far. From what we heard, TensorWave has improved their rack and cluster level networking reliability to the point where it can be used like any other tier-1 GPU cloud's systems. They have decent telemetry. They have decent provisioning speed. I haven't tried it myself, but I get the impression that it has improved substantially over the past 6 months.
- The panel itself was quite laughable. The AT&T guy presented some Telco-specific fine-tuning of Gemma 4B using ScalarLM on a TensorWave cluster, but I think everyone saw this as a joke. Why would anyone bother to use AMD unless they were penny pinching (which no one has to do today considering how well funded all these AI companies are)? And AMD systems aren't even cheaper once you consider the time spent porting software. As Jensen said, even if his competitors give their hardware away for free, it still isn't enough for them to get traction in the market. I would think he is right.
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
- What GPU markets exist? 1. Gaming 2. HPC / Workstation applications 3. Training 4. Inference
  - How does the AMD programming model allow them to capture each one? In the current form, it doesn't.

- https://x.com/SemiAnalysis_/status/1980840184905158712

> Meta has open sourced their CTran library that natively works with AMD & NVIDIA GPUs 🚀. Previously, if u want multiple NVIDIA GPUs to work together on an workload, you must used the NVIDIA NCCL library. Although NCCL's source code is public, it does not have an open governance model, does not have open CI, employs an "code dump" update model, is not GitHub first, and rarely accepts external contributions. Previously, If you want multiple GPUs to work together on an workload, you must used the AMD fork called RCCL library, which is a delayed fork of NVIDIA's NCCL.  With CTran, it is 1 unified library and allows for adding new like Bruck's in an way such that the code can be shared between different AI GPU types.
>
> Furthermore, Meta has open sourced NCCLX (NCCL extended) which is their production-tested collective library that powered all Llama training and uses the unified CTran library. Meta is the creator & main maintainer of PyTorch and is well trusted in the open source community.
>
> NVIDIA continues to be the leader in collective libraries but Jensen must not taken it for granted given the heavily increased competition in the open source collective communication space. Just like how TRTLLM moved to an GitHub first development when facing heavy competition from SGLang/vLLM, Jensen should seriously consider moving NCCL to GitHub first open development model due to the competition in the collective front too. To draw parallel comparisons to the inference engine world, Collective Communication Libraries are moving from the 2021 "FasterTransformer" era to the 2025 "SGLang/vLLM/TRTLLM" era.
>
> The main competitors in the collective library space include China's DeepEP library, AMD's new MORI, AMD's upcoming MORI-CCL, Meta's CTran & NCCLX, NVIDIA's NCCL (which has released their new NCCL Device API, NCCL's new GPU-Initiated Networking, etc). Competition breeds innovation! 🚀

The "superalignment" they're talking about has nothing to do with the "superalignment" of the squealing AI safetyists.

Use `gthumb` for cropping
