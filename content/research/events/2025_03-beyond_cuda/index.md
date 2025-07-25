+++
title = "Beyond CUDA Summit"
date = 2025-03-17
draft = false
description = "Team Green is dominant. Can Team Red go _beyond_?"

[extra]
new = true
+++

It is a dark, dark world.
Mr. Leather-Jacket isn't relenting.
With his 10x (and growing) profit margin on the hottest commodity known to man, people are screaming for relief.
But no one has stepped up to the plate.

Billions of precious VC capital is lit on fire every month as each AGI optimist tries to outcompete the others.
But no matter your model architecture, training data or post-training, token sampling, or slop generation strategy, you are always at _his_ mercy.

He insists: "The more you _buy_, the more you _save_".
And now he has gone even further: "The more you _buy_, the more you _earn_."
Indeed, we have no choice but to accept his words and buy his overpriced racks.

Still, some arrogant fools think they can build their own hardware and undercut his fat margin.
But after Microsoft [delayed their custom AI chip](https://www.techspot.com/news/108489-microsoft-custom-ai-chip-hits-delays-giving-nvidia.html?utm_source=tldrai) once again, he didn't hesitate to remind the world who's boss:
<!-- But faith is running out.-->

> "What's the point of building an ASIC if it's not going to be better than the one you can buy?"
>
> – Mr. Leather-Jacket

Foiled again!
Is there truly no escape?

But what if, someone went _beyond_?
Beyond what, you might ask?
Why, of course, to defeat Team Green, we must go beyond _CUDA_.
Ah yes, the impenetrable moat of Team Green: the CUDA language, programming model, compiler, a vast set of optimized libraries, and a rock solid runtime (among many other fortifications).

No one has gone _beyond_, but many fools continue to dare to try.
Today, I had a first-row seat to see a showcase of Team Red's latest attempt.
Hosted by their own neocloud, [TensorWave](https://tensorwave.com/), they put together a show with many users and contributors to Team Red's CUDA killer.

So, how did it go?
Is Mr. Leather-Jacket shaking in his leathers?
Read on to find out.

## What Did I Expect?

Before the event started, I looked through the [list of speakers and talks](https://lu.ma/beyondcuda25?tk=oFYSJs).
My expectation was for a highly technical event that would give developers the confidence and knowhow to write cross-platform kernels and make sure ML models and inference servers had first-class support for AMD hardware.

In particular, I was expecting a discussion on these topics:

- An overview of deficiencies and legacy cruft of the CUDA programming model
- New abstractions over GPU programming primitives provided by [HIP](https://rocm.docs.amd.com/projects/HIP/en/docs-develop/what_is_hip.html)
- A detailed overview and examples of the ROCm API and programming model and how it differs from CUDA
- _From the Triton speaker_: how Triton enables easy portability to AMD GPUs by virtue of their tile abstraction while maintaining peak GPU utilization
- _From Jim Keller and Raja Koduri_: rethinking the ideal architecture and microarchitecture for the SIMT programming model from first principles, eliminating the graphics-oriented specializations that exist in consumer NVIDIA GPUs
- _From AMD_: ubiquitous support for ROCm across the product lineup, elimination of kernel driver crashes and misbehaviors, demonstration of end-to-end training of large scale models using upstream ML libraries
- Live demos, coding walkthroughs, demonstration of push-button [llama.cpp](https://github.com/ggml-org/llama.cpp) / [ollama](https://github.com/ollama/ollama) / [vLLM](https://github.com/vllm-project/vllm) inference engines running with zero issues on easily available AMD hardware (no Docker, no VMs, no pre-prepared machine, show a setup from scratch)

If my expectations had been met, this would have been a watershed moment in the development of ROCm and AMD GPUs as a first-class hardware target, worthy of billions of external investment.
So what actually happened?

{{ gallery(images=[
    "beyond_cuda_stage.jpg",
    "beyond_cuda_stage_2.jpg",
    "mi210_giveaway.jpg",
    "tech_roast_coming.jpg"
], popout=true) }}

Let's dive into each session.
<!--
Chris lattner, modular people, no talk though... Claim good functionality on AMD, but no demo or numbers
-->

## Past and Future of Compute

{{ gallery(images=[
    "past_and_future_of_compute.jpg",
    "past_and_future_of_compute_2.jpg",
]) }}

This panel was originally slated to have Jim Keller and Raja Koduri.
Hearing from them was highly anticipated by the crowd.
But Jim claimed he had some personal affairs to attend to and Raja was sick (or vice versa) and neither of them showed up!

Instead, we had Greg from TensorWave (built [GPUOcelot](https://github.com/gpuocelot/gpuocelot), has worked on DL deployment at Baidu), Davor from [Tenstorrent](https://tenstorrent.com/en), Micah from [Mihira AI](https://mihira.ai/) (worked at NVIDIA/AIT in the past), and Nicholas (the author of ["The CUDA Handbook"](https://www.cudahandbook.com/)) (see the [recording here](https://tensorwave.com/blog/past-present-future-of-ai-compute)).
<!--
, seemed like lots of parallel programming models, fpga, etc, but didn't turn out that way lol
- Micah, worked at Nvidia and ati, working with raja on his startup
- Nicholas, worked on cuda drivers at nvidia, wrote the cuda handbook
-->

### Why is CUDA NVIDIA's Moat?

Greg started by stating that the SW stack is the most important thing to get right; CUTLASS enables 90+% HW utilization for many kernels, and they achieved that through NVIDIA's investment of engineer hours in intense cache blocking + other optimizations.

Micah followed by saying it's not just the SW, but keeping the SW in sync with the HW.
You can't stick CUDA on another HW platform and get the same performance; AMD had its own programming model, but it wasn't mature and in sync/ubiquitous across its HW platforms.

Nicholas pointed out that NVIDIA took a risk to build CUDA in the first place, sacrificing die area for general purpose programmable logic.
CUDA is also highly portable: taking speculative risks in HW (such as power tradeoffs in Pascal and Volta) is enabled by portability.

Davor said that NVIDIA puts lots of effort into benchmarks: MLPerf, HPC applications, showing that CUDA works for many domains.
HW vendors should not try to reinvent the stack - reuse host and device APIs, programming models, device integration (as PCIe cards), just as Tenstorrent does.

<!--
- Greg, multicore to simd compilers is important, sw stack is the most important, look at how Cutlass enables 90 percent utilization for many kernels, labor intensive cache blocking and optimizations, Nvidia invested so much labor into this
- Micah, not just the sw, sw in sync with the hw, can't stick cuda on another hw platform and get same performance, amd had its own programming model, but it wasn't mature and in sync
- Nicholas, Nvidia took die area risk to build cuda in the first place, in volta needed small risc core too, SW is portable to so many contexts, reason for cuda pervasiveness, Nvidia explored pascal and volta power tradeoffs, hW speculative risks are enabled by portability
- Davor, Nvidia puts effort into benchmarks, ml perf, general purpose hpc technique, showed that it works for many domains, no need to reinvent the stack, reuse host apis, device apis, the concepts, pcie card! Reuse them, tenstorrent does. Good benchnarks, he sw, good general programming model
-->

### The CUDA Language

Micah said that CUDA C++ can't live for much longer; we need new languages as we can't rely on undergrads knowing C++.
Davor noted that by the end of his grad school life, all parallel programming became CUDA, and you increasingly need the knowledge and ability to inject code across the full stack (raw PTX, CUDA, CUTLASS, cuDNN, Pytorch).
Customers for new HW platforms can't be expected to rewrite lots of primitives on their own.

Greg mentioned that CUDA is a huge ecosystem including Tensor cores with massive local parallelism, NVLink massive scale out, and structured sparsity / MoE support.
NVIDIA has optimized for these applications and features, but there could be an opportunity to optimize for a different application target.
All these pillars of NVIDIA's architecture are at their limits (supposedly).

Nicholas said that the SOTA is advancing very quickly, and NVIDIA is the _best platform_ for them to evaluate their new operators / training techniques.
Davor pointed out that SIMT was the original CUDA programming model - there were no Tensor Cores, no Tensor Memory Accelerators.
NVIDIA is throwing in more stuff and it isn't even CUDA as it was when Nicholas wrote the book.

<!--
- Micah, Need new languages, can't rely on undergrads knowing C++
- Davor, by the end of grad school, all parallel programming became CUDA (not pthreads, ...), need performance and usability, need the full stack (raw CUDA/PTX, CUTLASS / cuDNN, Pytorch frontend), can't make customers rewrite lots of primitives (indeed this is the tenstorrent story)
- Greg, need to have applications beyond CUDA, tensor cores within CUDA - massive local parallelism (1), NVlink massive scale out (2), structured sparsity / MoE (3), nvidia has optimized for these apps, but opportunity to optimize for a different application target? all these pillars of nvidia architecture are at their limits. (but this seems wrongheaded lol)
- Nichols, SOTA is advancing so quickly, and NVIDIA is the best platform for them to evaluate their new operators / training techniques,
- Davor, SIMT was the original CUDA model, no tensorcores, no ..., no tensor memory accelerators, nvidia is throwing in more stuff, it isn't even CUDA as it was when you wrote the book lol
- Greg, CUDA is always adding more stuff
-->

### Accelerator Programming Models

Someone from the audience asked a question.
There are many companies building AI hardware, but CUDA is tuned to NVIDIA's HW.
If you try to build another accelerator, it won't be ideal to compile CUDA to that target.
What are your thoughts on building consensus for the software stack?

Micah said that the AI world likes numpy-based Python, and if we can compile that to your accelerator, there isn't a CUDA problem anymore.
Old CUDA code has CUDA assumptions and features in it, so we should throw it away and rewrite it (like Tenstorrent has done).
But there is no solution for porting existing CUDA to your accelerator, and he doesn't know what the bridge is - he can't imagine someone can develop a robust and performant version of a CUDA bridge.

Davor concurred that if you have Pytorch as input, then we can use vertically stovepiped compilers (from the user's perspective).
However, if you're talking about porting cuDNN / cuBLAS, that is much harder and will require manual effort.

Greg hoped that PTX would be performance portable, but it actually is not.
Today, PTX is tuned for every device architecture (it would be hard to go from PTX to your accelerator).
Davor concurred that we can't rely on PTX as the lowest level, and we need to educate developers / go back to first principles for a parallel programming model.
He even suggested that we can use Cursor to translate PTX to another low-level IR and this wouldn't be an issue in the future.

<!--
- Audience Q: many companies building aI hardware, CUDA is tuned to nvidia HW, if you try to build another accel, it will never be good to compile Cuda to that target, what are your thoughts for consensus to the software stack?
  - Mocah, AI world likes numpy based python, then compile to your accelerator, no CUDA problem anymore (lol i doubt this), old CUDA code has CUDA assumptions and features in it, so throw it away and rewrite it (tenstorrent), but no solution for porting existing CUDA to your accelerator, don't know what the bridge is - can't believe anyone can develop this well
  - Davor, if you have pytorch, you're all good, vertically stovepiped compilers exist, then you're talking about CUdnn / CUTLASS porting, and that is much harder
  - Greg, hope that PTX would have been perf portable, but actually not, today, PTX is tuned for every device architecture (can't go from PTX to your accelerator)
  - Davor, can't rely on PTX as the lowest level, need to educate developers and go back to first principles on a parallel programming model (i doubt it), leverage cursor to translate ptx into another low level code lol, this won't be an issue in the future lol (doubt it)
-->

### Commentary

OK after reading all this, you may be wondering, doesn't all this discussion imply that CUDA can't be easily beaten?
My feeling was that this panel just reinforced CUDA's dominance and why it was here to stay.
Some of the suggestions by the panelists, such as using LLMs for writing kernels for new hardware targets, seem too far-fetched.

## Crossing the CUDA Moat

Onto the next set of presentations.

### Mako

The first talk was by Waleed Atallah of [Mako](https://mako.dev/) ([see the recording](https://tensorwave.com/blog/gpu-kernel-optimization-makos-plan-to-outrun-cuda)).
His company builds AI-powered (_read_: LLM-in-a-loop) GPU kernel generation and optimization tools.

His main claim is that with new DNN operators, more GPU kernels need to be written and tuned.
It took 5 years from the original attention paper to get FlashAttention, so there is clearly lots of inefficiency and hard manual work required to produce optimized / fused GPU kernels.
They've built some kind of "auto-tuned" AI stack where they sweep over the space of `torch.compile` options and kernel implementations, with a global cache of all optimizations they've tried and compiler artifacts.

He mentions that they're working on LLM powered kernel generation and pointed to [KernelBench](https://github.com/ScalingIntelligence/KernelBench) as a good starting point.
There is work to be done on teaching an LLM how to optimally use the hardware, add the right documentation in the context, and use profiling data as feedback for optimization.

This guy and Mako aren't _incompetent_ per se, but the talk had nothing to do with ROCm or HIP.
The techniques described were also very vague.

<!--
- build AI powered GPU kernel optimization
- they claim more GPU kernels need to be written (new operators...), need to select and tune proper kernel implementations for a given logical kernel
  - Pytorch code -> operator graph -> library call dispatch (kernel fusion is crucial, cuBLAS, custom kernels like flashattention, compiler generated - TorchInductor, AI-generated kernels)
  - Lots of missed opportunity for fusion (RMSNorm, QKV, Attention, Projection, GateUp) (they have an image of profile from together.ai)
    - FlashAttention (came 5 years after original attention paper). this was huge! indeed, chris re is a king.
  - each type of custom quantization algorithm requires their own kernels to use! need kernel engineers! RaZeR is a quantization technique, needs custom kernel to exploit it properly
  - Deepseek MLA (low-rank factorization, Palu), had to write custom kernel for this too
- auto-tuned AI stack
  - so many hyperparameters and kernel selection that torch.compile has to do
  - Dynamo -> AOT autograd -> inductor (typically)
  - FX graph to multiple backends beyond inductor, search over backends and kernel implementations
  - Global cache of all optimizations and compiler artifacts
- automatic kernel generation
  - AI powered coding assistance
  - KernelBench is the first benchmark for LLM for CUDA generation (LMAO, congrats simon!)
  - NVIDIA also did blog post on LLM agent to generate GPU kernels (who did this, Mark ren?)
  - need to teach the language model on how to use the hardware, need to add documentation in context to the LLM lmao
  - need to use profiling feedback from the hardware profiler back to the prompting engine
-->

### Lemurian Labs

Up next was Jay Dawani from [Lemurian Labs](https://www.lemurianlabs.com/).
Now this guy was a little weird: he said lots of words with very little meaning ([see the recording](https://tensorwave.com/blog/shoulda-woulda-cuda-breaking-the-gpu-mold-with-jay-dawani-from-lemurian-labs-2)).
He blathered on about how they built some [compiler](https://www.lemurianlabs.com/technology) and "dynamic runtime" that can "solve heterogeneity" (Pytorch to CPU, GPU, NPU, … and so forth).
And of course, his magic compiler is able to do _something_ 30-40% faster than CUDA (the something was never specified).

My initial impression from this conversation is that this guy is a smooth talking scam artist.
In the past, he pushed for the design of a custom chip to execute math using a [logarithmic number system](https://www.eetimes.com/can-dsp-math-help-beat-the-gpu-for-ai/) over INT8 or the like.
It seems this idea, and the custom silicon, has been abandoned or at least relegated to second priority.

<!--
- used to do robotics and was an early person at openai
- trying to do a chip early in Lemerian's history
- he believes we have to do 'accelerated software' and hw perf scaling will end
- he wants a billion agents deployed, every company builds on their soverign data, exaflop per agent
- don't want to break nvidia's moat, just want to enable more competitiors in the same market
- need to throw away the notion of kernels in a heterogeneous world, generates kernels for every hardware system, everything else is a scheduling problem, memory access scheduling is important, write from minimizing data movement POV
- we built a dynamic runtime that can solve heterogeneity wtf lol, claim 2x perf benefit over rocm, 30-40% faster than CUDA
- he likes robotics, nvidia's chip wasn't good enough, designed an o3 like model, can't do low latency inference on the edge, GPU not build for dynamicitiy and batch size 1 on the edge. threw out the nvidia stack since nvidia didn't want to change, so he wanted to build his own chip
- this guy seems like a scam artist, lots of words, zero meaning
- https://www.lemurianlabs.com/technology
- https://www.eetimes.com/can-dsp-math-help-beat-the-gpu-for-ai/
  - This does seem more promising compared to the talk he gave. But no details on this hardware were provided - perhaps they have tabled the idea of custom silicon.
-->

### Spectral Compute

Up next was Michael from [Spectral Compute](https://spectralcompute.co.uk/) ([see the recording](https://tensorwave.com/blog/scale-by-spectral-compute-run-your-cuda-workloads-faster-on-affordable-amd-gpus)).
Now, this guy and his team are _highly competent_.
They built a [compiler called SCALE](https://docs.scale-lang.com/stable/) which can compile unmodified CUDA programs for AMD GPU targets.
The work that must have gone into this is insane.

Their compiler is fully compatible with `nvcc` semantics and quirks, and they actually duplicate the `nvcc` oddities precisely.
They claim to have 90+% compatibility for math APIs and 70% for runtime APIs, so far.
Another caveat is that CUDA code is often written with the assumption of a warp size of 32, and their compiler will detect if your code is written this way and warn you to make your code generic to accommodate AMD's 64-thread warp size.
They even support inline PTX in CUDA kernels by translating it to another IR and then re-targeting it for the AMD APIs.

What's even more impressive is they can outperform HIP (by 2x on average on MI300X) on the [Rodinia benchmark](https://github.com/yuhc/gpu-rodinia) by compiling the CUDA code there out-of-the-box.
This company has done lots of GPU work, including building a [GPU-accelerated regex engine](https://spectralcompute.co.uk/regex)!
This was by far the most compelling talk given in this summit, and I hope they have the strength to continue their work.

<!--
- Competent CUDA compiler/translator team
- opencl, hip, ... didn't  oneapi, triton, mojo, didn't work, no uptake from others
- SCALE: compile a superset of CUDA to AMDGPU machine instructions, no emulation, no overhead
- no need to maintain versions of code for different vendors, support any hardware, write once recompile for any target
- interesting... seems like a hard problem
- fully compatible with nvcc semantics and quirks, can't just use clang out of the box (it is too strict vs nvcc)
  - focus is on pragmatism
- 90% core cuda compat of math APIs and 70% of runtime APIs compat
- Wave64: CUDA code implicitly assumes warp size = 32. SCALE detects this and warns about it. AMD has warp size of 64. But this just seems like a hack. They try to emulate 2 32 warps with a 1 64 warp. seems like very fragile. natively exploit warp 64
- inline PTX in CUDA. SCALE can convert to an IR sequence that is generally targetable.
- Extensions: __builtin_provable, address space annotations, constexpr controlled loop_unroll, exceptions
  - eventually will add nvidia support to their compiler
- they do much better than HIP!!! on rodinia benchmarks, outperform HIP with CUDA versions. 2x faster over HIP on average. on Instinct MI300X
- will focus on performance after finishing core compat APIs.
- they have a discord QR code on the final slide lol, join our discord lol
- https://docs.scale-lang.com/
- https://spectralcompute.co.uk/regex
-->

## Pre-training Beyond CUDA

OK so far, you may have noticed that the speakers have only barely mentioned AMD GPUs in their talks.
This trend shall continue.

### Zyphra

The next talk is from Quentin Anthony, a Model Training Lead at [Zyphra](https://www.zyphra.com/) ([see the recording](https://tensorwave.com/blog/maximizing-gpu-efficiency-model-sizing-insights-from-zyphras-quentin-anthony)).
All I could gather from this talk is that making sure layer dimensions are powers of 2 is quite important for performance.
They wrote a blog post "[The Zyphra Training Cookbook](https://www.zyphra.com/post/the-zyphra-training-cookbook)", which I think is pretty good.

<!--
- Trying to match model architecture with hardware, trying to target snapdragon, gpu, ..., need tuned model architecture for each hw arch
- massive slowdowns when you don't use powers of two, efficient sizes are important, small tweaks of existing sizes gives lots of perf improvement for free! (accuracy not affected by such small nudges)
- they have a paper online
- MLPs are the most expensive, we can just make them powers of two lol
- there are throughput cliffs and spikes whenever the layer dimension hits an ideal blocking factor, quite interesting plot
  - need to make sure every size of every matrix is optimal for performance and clean blocking, as many powers of two as possible
- make sure MLPs are large enough to saturate your roofline lol
- nothing beyond cuda about this, i am still very bullish on nvidia
- their paper has some conclusions about "sizing". vocab size divisible by 64. ... lots of cute rules that are quite simple lol.
- cute plot about inference latency vs model size - there is an anomaly where a larger model infers faster, sizing related. when training a mobile model, need to design it for the mobile SoC.
- treat llms as an hpc problem, small changes in size = throughput benefits, more dtypes/model block types paper coming soon
- https://www.zyphra.com/post/the-zyphra-training-cookbook
  - This is great actually!!! Should add to my ML links document
- this guy was super nervous, not a good presenter lol
-->

### UCLA VAST Lab

The next speaker was Neha Prakriya from UCLA ([see the recording](https://tensorwave.com/blog/data-efficient-training-on-amd-gpus)), from Jason Cong's lab.
They looked into techniques to minimize the corpus of pretraining text you need using embedding and sampling: sounds sensible.
And then they did some fine-tuning and distillation using their sampling approach with a small 7B Llama and showed it worked well.
They used this technique to develop a HLS coding assistant (it just injects `#pragma`s in the right places).

OK fine, but what does this have to do with AMD?
Turns out, there are lots of people doing this exact same research, but AMD gave her lab a MI300X, so she did this experiment with one AMD GPU.
All the others use NVIDIA, and I'm sure she wanted to too.
<!--
- Working with Jason Cong, VAST
- AMD GPU training lab, typical memory wall plots, they focus on dataset selection
- humans use spaced repetition, focus on hard topics, so they apply this to pretraining
  - learn: present all the dataset
  - focus: cluster embeddings, and only do a few texts
  - review: try some points you haven't focused to make sure there is no forgetting
- they claim they can pretrain a very small llama (less than 7B) with good results vs the provided weights (quite marginal improvement, but about 5-10x less FLOPS needed)
- they claim they used AMD GPUs, interning at AMD this summer
- finetuning using their sampling approach, they do some distillation
- they got a MI300X GPU, thank you AMD lol
  - HLS coding assistant for FPGAs: MVT kernel from Polybench. the LLM injects the correct pragmas lol.
- very poor minion, AMD minion at UCLA, this is just a random academic PhD talk, nothing AMD related. seems like this is a huge field, but she is the only one doing this with AMD GPUs
-->

### RWKV

Next was Eugene Cheah from [featherless.ai](https://featherless.ai/).
I'll admit my knowledge of his [RWKV](https://www.rwkv.com/) is very weak, so I can't judge, but he claims this model architecture achieves linear attention scaling and no quadratic KV cache growth.
Again, hardly any mention of AMD GPUs, but near the end he rambled on about building a "personal AGI" that can tune its memory in the night and extract your experiences during the day.

<!--
- RWKV OSS project, AI model under the Linux foundation, running on all windows devices today lmao
- transformer context length limitations, larger length slows down generation...
- https://featherless.ai/ (serverless LLM hosting service)
- RWKV, linear attention scaling, no quadratic KV cache growth,... idk how
- the guy is reading a script... no good, off the rails, people in the crowd are just talking over him now, crowd has gotten out of their seats
- They converted Qwen 2.5 32B, 72B to the RWKV thing, idk he didn't really explain what's going on, he claims attention isn't good and we need recurrent networks again
- they claim model is trained on 60 GPUs (72B model). convert transformer model is converted
  - but it seems like this is using the existing checkpoint
- https://www.rwkv.com/
- "we are the only team that knows how to do this"
- there are so many finetunes on hugging face, we want to support them all on featherless
- lots of words, personal AGI, memory tune in the night, extract your experiences during the day
- https://www.convex.dev/ai-town
-->

### Are You Bored Yet?

So was everyone here.
All the speakers were so dull that the majority of the audience got up and started gabbing at the back near the bar.
The background noise was so loud, the organizers had to keep shutting them up, since you could hardly hear the speakers.

{{ image(path="dead_crowd.jpg", width="80%") }}

## Post-Training Beyond CUDA

Undeterred, we move onto the next session.

### Higgsfield AI

We heard from a former GenAI engineer at Snapchat, Alex, who now runs [Higgsfield AI](https://higgsfield.ai/).
This is a video generation tool that pulls from open source video generation models (e.g. [Wan](https://www.wan-ai.org/)) and stitches together an entire pipeline: your product images or ideas, storyboarding, dialogue generation, camera angle and action scripting, and final video generation.

> The world's first multi-agent AI video creation platform that turns story ideas into ready-to-watch, long-form content.

Alex showed us a plot of 'pixels generated over time' and noted that models can generate more and more pixels today, to the point where soon they can generate TV shows and movies.
He says that AI generated videos outperform human-generated videos on social media, and in the future all pixels will be model generated.
"AI generated videos are outperforming 'conventional' video on social media" (he actually said this).
What an inspiring future!

{{ image(path="higgsfield.png", width="80%") }}

He showed us an ad they generated for Monster Energy, where a Viking climbs a mountain, reaches the top, and drinks a can of Monster.
No cameras, actors, directors, or editors required! So cool!
Of course, it looked absolutely ridiculous.

The next step is of course AI-generated music videos.
He then showed us an example of a rap music video - made in under a day by one person with "studio level quality and camera control and visual elements that typically require teams of 10 people + weeks of work", "Hollywood level quality", "you can make the final scene of Game of Thrones yourself" (he actually said this).
TensorWave didn't share the recording of this talk on Youtube (I wonder why), and I was too busy laughing to take a video, but to get an idea of what the rap video was like, you can [ask the Mavericks](https://www.chron.com/sports/article/dallas-mavericks-ai-generated-video-anthony-davis-20228149.php).

OK but what does this have to do with AMD?
Turns out, he claims, MI300X are 25% faster than "NVIDIA" for some video generation model.
OK fine. Real convincing.
<!--
- Former genAI at snapchat
- This guy is showing pixels generated over time (models can generate more and more pixels lol), this is about generating TV shows and movies
- https://higgsfield.ai/
> The world's first multi-agent AI video creation platform that turns story ideas into ready-to-watch, long-form content.
- AI generated videos outperform human generated videos on social media, all pixels will be model generated
  - What an inspiring future
- NVIDIA says all pixels will be generated, not renders
- Brand model training -> video idea fed into their platform -> generate a script -> scenes laid out on a storyboard -> scenes refined in AI video editor
  - This is like Icon lol
- LMAO I can't stop laughing, this guy is showing a generated ad for Monster energy, a viking climbs a mountain and drinks Monster LMAO too much
- AMD GPUs outperform nvidia GPUs for video generation (they claim) - MI300X are 25% faster than NVIDIA
- The next step: AI for music videos and commercials LMAO LMAO this is crazy, so inspiring
  - He showed an example of an AI music video, it looked so bad, some rap something
  - Can't stop laughing, demo was made in under a day by one person, 'studio level quality and camera control and visual elements that typically require teams of 10 people + weeks of work'
- Prompt -> MoE architecture -> OSS video model stack (Wan, deepseek) -> final video
- Better than Veo2, Minimax for video generation, better camera control that professionals want to have
- "Hollywood level quality", "make the final scene of game of thrones yourself"
- "AI generated videos are outperforming 'conventional' video on social media", ok this sounds great lmao
- This reminds me of the Mavs AI generated jumbotron video - it was *that* tier of garbage
-->

### OpenBabylon

The insanity continues with Anton and Yurii from [OpenBabylon](https://www.openbabylon.com/).

{{ gallery(images=[
    "open_babylon.jpg",
    "openbabylon2.jpeg",
], popout=false) }}

They've built some infrastructure for [adapting LLMs for underrepresented languages](https://arxiv.org/abs/2404.09138).
That on its own is pretty useful.

But this talk was about the aftermath of the Ukraine War, specifically LLM-based test generation for students in Ukraine for teachers.
It's quite simple really: there is a war, so let's fine tune an LLM.
But Ukraine may not have many servers to host a large model, so they chose a small one.

They noticed that models have worse instruction following, and emit more harmful content when using non-English languages, and models encode "Silicon Valley centric biases".
They fine-tuned Llama 3.1 8B with "domain-specific knowledge" (i.e. Ukrainian history) and Ukrainian optimized tokenization.
And guess what, the teachers accepted 55% of the test questions that came from their model.

But what about AMD?
Well, they used the TensorWave cloud to fine-tune this Llama model.
Nice.

<!--
- infra for model adaptation, AI performance in any language and any domain
- LMAO ukraine war, LLM test generation for students in ukraine, gap in domain knowledge and ukrainian language
- history of ukraine domain specific knowledge lol
- English vs ukrainian tokenization, many more tokens (2x) generated for ukrainian, so double the price for the same message
- Ukrainian use case lol, reduction in prompt/instruction following, more harmful content when you use non-English languages lol, silicon valley centric biases LMAO
- Llama 3.1 8B as base, education specific custom metrics focused on factural correctness, cirruculum, cultural relevance, human-in-the-loop evaluation
  - Creating training datasets (multi turn, formal specific instructions), then training
- Does ukraine have enough servers to deploy this model? We chose a small one LMAO
- the audience has completely lost it, just not paying attention, talking over
- tensorwave AMD cloud used for training
  - MI300X has larger context window - 8k base context window as starting point, larger batch sizes, they claim less OOM errors for misc tasks during experimentation
- claim GPT 4o performance at 175x lower cost, made test creation time very fast for teachers, 55% accepted questions from their model 8B size (vs similar on 4o), but 8B base gave 5% and 70B base gave 53%

- this is a parody, there is a war so let's fine tune an llm
- roast will be so brutal
-->

### Inference Beyond CUDA

{{ gallery(images=[
    "inference_beyond_cuda.jpg",
    "inference_beyond_cuda_2.jpg",
], popout=true) }}

At this point, the audience is completely restless and is making lots of noise.
The panels have gone on for too long and the event is way behind schedule.
But the most important talk is coming.

Introducing, the panel of Will Beauchamp of [Chai Research](https://www.chai-research.com/), Kyle Bell of Tensorwave, and Paul Merolla of [MK1](https://mk1.ai/) ([see the recording](https://tensorwave.com/blog/scaling-ai-inference-on-amd-insights-from-chai-tensorwave-and-mk1)).

Kyle didn't say much, and Paul focused on his optimized inference service MK1.
He claimed that MI300X + MK1 > H100 and that that MI300X outperforms H100 by 2x in request throughput.
MK1 handles the inference service for Chai, which used to use NVIDIA, but now has supposedly moved to AMD.
MK1 can handle [CAG](https://arxiv.org/html/2412.15605v1) (cache augmented generation) with MI300X where the higher memory capacity makes this easier.
Paul showed his inference setup has 2.25x faster all-reduce on 2x/4x MI300X vs RCCL ([quickreduce](https://github.com/mk1-project/quickreduce)).

<!--, Kyle: precompute system prompt, in-context learning to avoid finetuning
  - With MI300X high memory capacity, we can do this easier: https://arxiv.org/html/2412.15605v1
-->

And then we have to talk about Will, the founder of Chai Research.

{{ image(path="chai_ai_staff.png", width="80%") }}

You see, Chai is a very serious company, with very skilled ex-quant researchers, all from highly ranked universities.
They are paid a [hefty sum](https://x.com/chai_research/status/1902127443605156198?t=UHr8YzdwGgWPllkjIuTgGA) of $500-750k in cash + equity.
Their product, as Will puts it, is a "consumer platform for AI".
Now, what does that mean?

His company builds an app: [Chai AI](https://play.google.com/store/apps/details?id=com.Beauchamp.Messenger.external&hl=en_US&pli=1)

> Our app revolutionizes the way we interact with AI chatbots. With our advanced technology, our chatbots think and reply like real characters, complete with authentic voices. You can choose from a massive selection of characters, each with their own unique voice and personality. Whether you're chatting with your favorite celebrity, a beloved character from a movie or TV show, or a historical figure, you'll feel like you're talking to a real person.

{{ image(path="chai_ai.jpg", width="50%", caption="Prompt extraction from Chai AI. Yes, it's just an LLM wrapper.") }}

So Will, why did you start Chai AI?
You see, "all of AI has been shaped by a small group of people (old men, the West)", but maybe teenage girls need access too.
He notes, "teenage girls can create better makeup advice vs our AI" and we can incorporate that into the chat generation.
"Teenagers are spending 1.5 hrs a day interacting with AI. This is a monumental shift".

{{ gallery(images=[
    "chai_ai_flywheel.png",
    "chai_ai_retention.png",
], popout=true) }}

As you can see from the [Chai Research 2025 Roadmap](https://www.chai-research.com/chai_roadmap_2025.pdf) they're doing quite a good job with teenager 'retention'.
These very honorable ex-quants have been spending their days [optimizing LLM tokens](https://arxiv.org/abs/2303.06135) based on "real-world engagement".
And what kind of engagement exactly are we talking about here?

{{ gallery(images=[
    "chai_ai_sob.png",
    "cai_characters.png",
], popout=false, caption="A typical [post](https://web.archive.org/web/20250320210143/https://www.reddit.com/r/ChaiApp/comments/1jfsqii/i_didnt_think_i_would_start_sobbing_over_an_ai/) on [/r/ChaiApp](https://www.reddit.com/r/ChaiApp/) (left) and popular chatbots on [c.ai](https://character.ai/profile/PlayfulDamsel) (right)") }}

Business is booming of course.
They are very good at using a blend of low-cost LLMs and aggressive sampling with their engagement estimators to shoot 10s of trillions of tokens every month straight into the brains of rotting youth.

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">Very dark opinion: AI is going to enable a lot of morally questionable people to develop products and services that are very profitable but bad for the customers <a href="https://t.co/uZIgOprlsU">https://t.co/uZIgOprlsU</a></p>&mdash; PoIiMath (@politicalmath) <a href="https://twitter.com/politicalmath/status/1903243984769577220?ref_src=twsrc%5Etfw">March 22, 2025</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

"Morally questionable people"?
Who could that be?
All right, that's enough of Chai.

<!--
- https://www.chai-research.com/ (look at their people chart, they put everyone's college or prior workplace there, Cambridge is seen as elite, huge red flag)
- Panel: Will Beauchamp, Chai Research. Kyle Bell, TensorWave, Paul Merolla, MK1
- We are running very late
- Will: Chai, consumer platform for AI, similar to chatGPT
- Kyle: VP of AI, work on MLops
- Paul: MK1, was on the founding team of Neuralink, same building as OpenAI, they build great infra and on top of that build great research, high performance inference platform, logic trace framework for understanding why AI makes some decision

- Jeff (host): Chai? Why did you start it?
- Chai (user facing service) <> AMD <> MK1 (inference service)
- Will Chai: all of AI has been shaped by a small group of people (old men, the West), but maybe teenage girls need access too LMAO
  - Oh I see Chai is an app. "social AI platform". they have AI 'creators' LMAO too much comedy material
  - this guy is insane, we need more teenagers using AI

- Beyond parody

- https://x.com/politicalmath/status/1903243984769577220?t=NHaZQg-NdnZFOI2xIISmzQ

> Very dark opinion: AI is going to enable a lot of morally questionable people to develop products and services that are very profitable but bad for the customers

- https://x.com/romanhelmetguy/status/1917656951174947075

> Zuckerberg explaining how Meta is creating personalized AI friends to supplement your real ones: “The average American has 3 friends, but has demand for 15.”

- https://x.com/chai_research/status/1902127443605156198?t=UHr8YzdwGgWPllkjIuTgGA
- https://www.reddit.com/r/ChaiApp/comments/1jfsqii/i_didnt_think_i_would_start_sobbing_over_an_ai/
- https://www.youtube.com/watch?v=oGouyCCY3Do (the Chai guy) (5:51 "teenage girls" can create better makeup advice vs our AI lmao, 7:30 "teenager are spending 1.5 hrs a day interacting with AI. this is a monumental shift") (teenagers are going to talk more to AI than humans)
- https://character.ai/profile/PlayfulDamsel (LMAO just look at these "characters")
-->

## Pre-training Beyond CUDA

There was only one talk from Koosh Azimian of [310 AI](https://310.ai/).
They do some kind of GenAI for biology.
It's not clear if they develop and train their own models or if they just provide an interface to open-source models.
It seems interesting, but I can't comment much on their models or service.

The AMD angle is they did some training on 6 nodes of 8x MI250 for 70 days.
They made a claim that their Pytorch models were ported to run on ROCm in one engineer day without any code modifications.

<!--
- https://310.ai/
- They do genAI for biology
  - Features a Class II Histidinyl-tRNA synthetase HisRS-like catalytic core domain and a histodine metabolic process
  - Turns it into an image / some organic protein. It can design a protein for you. 300+ amino acids, 6000 atoms
- Their model is at early GAN-tier levels (wrt image generation, analogy), lots of work to do to get to protein synthesis quality needed for drug development
- This is a generative version of AlphaFold. Prompt is natural language. Gives a result in animo acid chains.
- Training was done on AMD. 6 nodes of 8x MI250, 70 days training time, 200 sequences / second
- Pretty good docs actually: https://310.ai/docs/folding
- It seems they don't build many models themselves, they use existing models from others (and few of their own) and try to mash them together (with a 'copilot' protein design cockpit)
- They claim that their Pytorch models can work on Rocm in one engineer day, same code no modifications from CUDA to Rocm
-->

## Open Source beyond CUDA

{{ image(path="open_source_beyond_cuda.jpg", width="80%") }}

This was a panel / presentation with Philippe Tillet (OpenAI / Triton), Liz Li (AMD), Greg (TensorWave), and Andrey Cheptsov (dstack).
Philippe says that OpenAI uses Triton for all of their kernels and they kind of work with AMD's hardware team.
AMD themselves has a Triton team which tries to keep the ROCm backend up to date, optimized, and upstream with good performance on MI300X.
Philippe then says that there are still cases with MI300 is slower than H100, but he's hoping that within a year or two, they will reach parity.

Liz from AMD says that they've been moving their Pytorch CI/CD pipeline in-house, continuing to work on OSS models, making sure huggingface models run out of the box on AMD hardware, and trying to get DeepSeek to run reliably on an AMD cluster.
<!--
- Liz works on perf opt
- Phil openai, joined as intern working on triton, full time by 2020 to work on kernels, wrote kernels for gpt4, triton is used for all of their kernels, managing kernels team at openai, write all training kernels and some inference ones, managing compilers group working on triton, working with hardware partners like AMD
- Talk about triton and work with AMD: create a language and compiler for perf portable kernels, write once run anywhere, tricky to find right abstractions, don't know how hw will evolve and get all the features in one abstraction that isn't device specific, AMD has a triton team that was able to upstream their backend, claims good perf on MI300X
- Phil: there are still cases when MI300 is slower than H100, hoping in a year or two we will get there LMAO
- Liz: what are you seeing inside AMD wrt customers and open source? pytorch ci/cd pipeline in house, autotuning libraries, working on OSS models too (dataset + weights open source), trying to make sure huggingface things run cleanly on AMD, trying to get Deepseek to run on AMD
-->

Andrey from [dstack](https://dstack.ai/) gave a talk on his container orchestration platform.
Some Kubernetes-based thing that takes care of storage, data, models, training launches, and so forth.
Overall, nothing that interesting.
<!--
- Andrey dstack: container orchestration for AI teams
- kubernetes something something, their thing takes care of storage, data, models, tries to abstract away kubernetes for container deployment and scaling, wow so useful lmao
- https://dstack.ai/
  - their website is much better, why doesn't he show this
- similar to skypilot

- you know, disaggregation is interesting. can we make dynamic server provisioning so fast + making the OS boot so fast that we can provision, launch, and get thing running in under a few hundred milliseconds.
-->

Finally, we heard from Gregory of [ScalarLM](https://www.scalarlm.com/) ([see recording here](https://tensorwave.com/blog/scalarlm-open-source-llm-training-inference-on-amd-rocm)).
This appears to be an LLM training and inference software stack that runs out-of-the-box on MI300X.

{{ image(path="scalar_lm.jpg", width="80%") }}

<!--
### Scalar LM - ML stack on TensorWave

- "super alignment". this is a braindead talk.
- ScalarLLM, ML framework for training and inference, Megatron Core training stack ported to AMD, model library from HugglingFace, and vLLM.
- Single framework that runs out of the box on MI300X
- http://scalarlm.com/
-->

## Hot Takes Panel

{{ image(path="hot_takes_panel.jpg", width="80%") }}

The panelists were Dylan (Semianalysis), Anush (AMD, VP of AI), Darrick (TensorWave), Mark (Meta/ GPU mode), and Eugene (RWKV guy).
Now, this was interesting.

### SemiAnalysis' Article

Dylan began by talking about his [article benchmarking MI300X against H100](https://semianalysis.com/2024/12/22/mi300x-vs-h100-vs-h200-benchmark-part-1-training/), which was quite unfavorable towards AMD.
He said that when AMD saw this, they got scared.
Lisa called him in a panic.

His team had spent 5 months working with MI300X GPUs on TensorWave to compare against H100.
Getting started with AMD was very rough, scaled dot product attention wouldn't even compute proper numbers, and there were memory leaks, among many other problems.
AMD's Anush worked hard to fix all the issues, but there were still many lingering issues, and performance was still bad.
By the end of the 5 month period, performance was still bad, but things kind of "worked".
Out of the box Pytorch performance was still bad, while NVIDIA gives you near peak performance right away.
NVIDIA has 50k GPUs for internal purposes that they use to keep up library software standards, while AMD has much less pay, custom driver builds for customers, and no unified driver.

Lisa talked to SemiAnalysis the next day for 1.5hrs.
She was very receptive to feedback, and the ROCm user group said AMD engineers were happier that they finally got a Pytorch CI/CD pipeline from management.

AMD's Anush took the brunt of this brutalization.
He's very active on Twitter, indeed he's the face of AMD on Twitter.
On stage, Anush was asked what AMD can do to improve.

Anush said that he acknowledges all the problems, that AMD was working on things that weren't visible to the benchmarker, they had been too focused on hyperscalers, and were just slowly coming down to the long tail of customers.
He knows the custom driver builds were bad, and that AMD is catching up now.
He urged the audience to contact him directly if they encounter any issues.
He says they are trying a first principles approach to everything (supposedly).
After all, the Pytorch CI is up and running, GPU Mode has some AMD GPUs now, and we're trying to get quantizers to work cleanly (with Mark).
We're trying hard, stop bullying so much OK?

This part of the panel was just so brutal.
You get the impression that AMD has no chance of being competitive versus NVIDIA.

### TensorWave

The moderator asked why TensorWave went all in on AMD. Customers ask them for NVIDIA, but they said no. Why?

Darrick said that it was about "alignment of ethos".
TensorWave started in 2023 during compute shortages, all that existed was NVIDIA's locked closed ecosystem with minimal open source.
We wanted to solve that problem and provide a viable alternative to the market, so naturally they must use AMD.
AMD was the only HW provider that could check all the boxes: the resources to threaten NVIDIA's dominance, and public support of open source.

Yeah I'm sure TensorWave is AMD-only because of "ethos".
Surely it has nothing to do with AMD funding their company.

### Open Source

The moderator asks for hot takes on open source.
What is the right way to do this?

Mark of GPU Mode says that NVIDIA leverages open source (e.g. Pytorch).
You need the right leverage.
Pytorch makes it easy to safely depend on it for the long term, which encourages contributions.
GPU Mode is just a reading group, and it quickly evolved to host parties, hackathons, sponsorships.
Open source attracts high agency people.

Dylan claimed that NVIDIA only released the Blackwell ISA just a month ago, just to prevent AMD from copying it.
Anush remarked that AMD was a fast follower.
But Mark doesn't buy Dylan's argument: after all, people could just fork Pytorch, but they don't.

### Rapid Fire Questions

- What if Taiwan is invaded?
  - Dylan: everyone is affected.
- What about non-GPU custom hardware?
  - Anush: AMD has a big footprint from embedded up to cluster, but we don't have a uniform software stack yet, we are trying. We're trying to make it possible to run a model on your laptop and port it to Instinct in the cloud without software hacking.
  - Dylan: all hardware needs a dev ecosystem. Google can dogfood their own ecosystem including OpenXLA. There is no code in Pytorch to run any other accelerator. There are teams of people doing assembly programming per kernel. It's not going to work for any hardware company that can't make massive investments.
  - Darrick: alternative accelerators are not worth offering, and are not good for customers. Only GPUs are flexible enough for new model architectures. Software is also the most mature on GPUs, nothing else.
- What will happen in next 2 years for TensorWave, which customers?
  - Darrick: past year was mostly about inference, software support, but we still need to solve training. This year is about training and scale
- Is there anything beyond backprop with respect to scaling?
  - Anush: at nod.ai we tried a few things. Keep an eye out. We just need to be ready for it.
  - Eugene: distributed training and optimizers are still a pipe dream, but could happen eventually.
- NVIDIA created a mixed CPU and GPU product. What about AMD?
  - Anush: AMD had silos of hardware excellence (Xilinx for FPGAs, datacnter CPUs). We're moving up the stack, and AMD has done well at backwards compatibility before, so we will persist that.
- Rank the top 5 AI hardware vendors today and in 2030 if you think non-GPU architectures will become dominant
  - Dylan: 1 is NVIDIA, 2 is TPU, 3 is AMD, 4 is Trainium, and 5 is nothing else. Unfortunately Trainium is even below AMD.

<!--
- MI300X was bad on Semianalysis, please share. AMD were very scared when they saw that. Lisa called Dylan with panic.
  - 5 months working on MI300X on TensorWave GPUs. Beginning was very rough, scaled product attention wouldn't even compute proper numbers, memory leaks, Anush worked hard to fix all the issues, still many lingering issues, performance was still bad
  - By the end perf was still bad, but things kind of worked, out of the box Pytorch was bad, nvidia gives you near peak perf lmao
  - nvidia has 50k nvidia gpu for internal purposes, amd has less pay, amd has custom builds for customers, no unified driver
  - Lisa talked to us the next day, 1.5hrs, very receptive to feedback, Rocm user group said AMD engineers were happier that they got a pytorch CI/CD pipeline
- Anush took the brunt of this. Brutalization. Very active on Twitter. The face of AMD on twitter lol. What can AMD to improve?
  - Feedback was ok - things we were working on that weren't top of line, focus had been hyperscalers, slowly coming down to long tail
  - Custom builds were bad, we acknowledge where we are, step 1 to progress, they are catching up now, contact Anush if you have an issue
  - Taking a first principles approach to everything (supposedly). Pytorch CI is up. GPU mode has some amd GPUs, trying to get quantizers working cleanly (with Mark)
  - Trying hard, stop bullying ok
- Jeff: why did we go all in on AMD? customers ask us for nvidia. We said no.
  - Darrick why did we say no? Alignment of ethos. We started in 2023 during compute shortages, nvidia locked closed ecosystem, no open source, wanted to solve that problem, viable alternative to the market is needed, so they have to work on amd compute
  - AMD was the only hw provider that could check all the boxes. The resources to threaten nvidia's dominance. AMD has been publicaly supportive of open source.
- Jeff: hot takes on open source. what is the right way to do this?
  - Mark: nvidia leverages open source (e.g. pytorch). you need the right leverage. Pytorch makes it easy to take long term dependency, contributions, safety. gpu mode is just a reading group, and it quickly evolves to host parties, hackathons, sponsorships. open source attracts high agency people.
  - Dylan: Mark should open source software and then change the nvidia to an amd. NVIDIA only released blackwell isa just a month ago. just to prevent AMD to copy it.
  - Anush: AMD was a fast follower.
  - Mark: don't buy dylan's argument, people could just fork pytorch, but they don't.
- Q: what if taiwan is invaded? Dylan: everyone is affected.
- Q: what about non-GPU custom hardware? Anush: AMD has a big footprint from embedded up to cluster, don't have a uniform software stack yet, we are trying. Trying to make it possible to run model on your laptop and port it to instinct in cloud without software hacking.
  - Dylan: need a dev ecosystem. Google can dogfood their own ecosystem and openxla. No code in pytorch to run any other accelerator. Teams of people doing asm per kernel. Not going to work for any hardwre company.
  - Darrick: alt accels, not worth offering, not good for customers. only gpus are flexible enough for new model architectures. software is also most mature on GPUs, nothing else.
- Q: what will happen in next 2 years for tensorwave, which customers?
  - Darrick: past year was mostly about inference, software support, need to solve training still, this year is about training and scale
- Q: anything beyond backprop wrt scaling?
  - Anush; at nod.ai we tried a few things. keep an eye out. we just need to be ready for it.
  - Eugene: distirbuted training and optimizers are still a pipe dream, but could happen eventually.
- Q: nvidia mixed cpu and gpu. what about amd?
  - Anush: amd had silos of hardware excellence (xilinx, cpu), moving up the stack, amd has done well at backwards compat before, we will persist that
- Q: rank top 5 ai hardware vendors today and in 2030 if you think non-gpu AI architectures that become dominant
  - Dylan: 1 is nvidia, 2 is tpu, 3 is amd, 4 is trainium, 5 is nothing else. crazy that trainium is below amd.
- Q: what will change in HPC?
  - Darrick: gpu cloud ~=~ HPC, for training. inference cloud is much easier to start.
-->

## Final Talk by Anush - What's Next

And with that, we're onto our final talk of the day by AMD's Anush ([see the recording](https://tensorwave.com/blog/the-future-of-rocm-amds-developer-first-bet-for-the-ai-era)).

{{ gallery(images=[
    "anush1.jpg",
    "anush2.jpg",
    "anush3.jpg",
], popout=true) }}

He began with the chant of "developers, developers, developers!".
Anush pledges to help you get started on ROCm.
Lots of people complain about it, but it will get better!
We added a Pytorch CI just recently; see, we're trying to improve performance and driver stability.

<!--
- What are we going to do about Rocm? More developers lmao, focus on devs
- Lots of people complain about rocm
- CI lmao
- Rocm performance is improving, improving over H200 lol
-->

{{ image(path="raffle.jpg", width="50%", caption="Dylan and Jeff picking raffle tickets for the MI200 giveaway") }}

### Epilogue

After this event concluded, I saw this [Ask HN: Why hasn’t AMD made a viable CUDA alternative?](https://news.ycombinator.com/item?id=43547309).
I recommend you read that thread.

> [This ticket](https://github.com/ROCm/ROCm/issues/1714), finally closed after being open for 2 years, is a pretty good micocosm of this problem:
>
> Users complaining that the docs don't even specify which cards work.
>
> But it goes deeper - a valid complaint is that "this only supports one or two consumer cards!" A common rebuttal is that it works fine on lots of AMD cards if you set some environment flag to force the GPU architecture selection. The fact that this is so close to working on a wide variety of hardware, and yet doesn't, is exactly the vibe you get with the whole ecosystem.

About a week after _Beyond CUDA_, SemiAnalysis released an article ["The GPU Cloud ClusterMAX™ Rating System"](https://semianalysis.com/2025/03/26/the-gpu-cloud-clustermax-rating-system-how-to-rent-gpus/).

{{ image(path="semianalysis_ranking.png", width="50%") }}

Sitting as undisputed #1 is NVIDIA's golden child, CoreWeave, while TensorWave (and any other AMD neocloud) is just a Bronze-tier GPU cloud.
Certainly, we can expect the AMD neoclouds to move up the list, but it will take time.

There have been some more favorable articles from SemiAnalysis recently: ["AMD 2.0 – New Sense of Urgency"](https://semianalysis.com/2025/04/23/amd-2-0-new-sense-of-urgency-mi450x-chance-to-beat-nvidia-nvidias-new-moat/) and [AMD vs NVIDIA Inference Benchmark: Who Wins?](https://semianalysis.com/2025/05/23/amd-vs-nvidia-inference-benchmark-who-wins-performance-cost-per-million-tokens/).
But just as AMD is starting to ramp MI350X, NVIDIA is ramping B200, and there is no comparison - B200 wipes the floor.

<!--
- https://tensorwave.com/blog/the-future-of-rocm-amds-developer-first-bet-for-the-ai-era
- https://www.youtube.com/watch?v=3sG1_ARTa04
- https://semianalysis.com/2025/03/26/the-gpu-cloud-clustermax-rating-system-how-to-rent-gpus/
  - CoreWeave (NVIDIA backed) is #1, TensorWave (AMD backed) (and all AMD backed clouds for that matter) are way behind (close to underperform territory).
-->

## Comedy Show

But wait, _Beyond CUDA_ isn't done yet.
You may have thought the comedy show was the actual event, but no, there was an actual comedy show by the 3 [Tech Roast](https://sociallyinept.io/) guys!
You should checkout their [Youtube channel](https://www.youtube.com/c/TechRoastShow).

{{ gallery(images=[
    "comedy1.jpg",
    "comedy2.jpg",
    "comedy3.jpg",
], popout=true) }}

There were too many good moments.
Their very first roast was aimed at the entire audience who "were rejected from or were too poor to afford to attend GTC" 😆.
Well I have to admit, I am too poor to attend GTC.

The comedians moved from 'founder' to 'founder', and it was hard to believe that these 'founders' weren't audience plants.
From [Tixfix.ai](https://tixfix.ai/) which has nothing to do with AI and who's entire dev team is located in Nepal, to the founder of [Fillers AI](https://fillers.ai/) who's a plastic surgeon who uses "AI" to model the impact of lip and cheek fillers.
These are real people!
Reality is beyond any Silicon Valley parody.

In the final segment, the comedians pulled people from the crowd and had them make fools of themselves.
In one act, they forced everyone to line up from least to greatest TC.
Dylan, who was made part of this routine, very slyly walked over to the greatest TC corner 😆.

{{ image(path="the_girl.jpg", width="50%") }}

At the very end, Dylan and this girl needed to act in a skit to prove they weren't an AI.
The skit asked for the girl to console a man (played by a comic) who didn't have enough money to buy NVIDIA GPUs.

Comic: "NVIDIA GPUs aren't in stock 😭 and I can't afford them either 😭, is there any alternative? What should I do!? I need some GPUs".
This poor girl had no clue what GPUs even were, she just went "I'm so sorry, hope you feel better, it's ok".
And someone from the audience yelled out "Intel" and she became quite enthusiastic to the sad comic: "OHHH! You can buy Intel GPUs!" 😆

What a fitting end to the night.
<!--This was too good; what a good sport!-->

<!--
- The comedians roasted AMD so badly. These were the people rejected or too poor to afford GTC lmao. True true.
- TixFix.ai, I am a founder, entire team is in Nepal lmao
- Fillers.ai, the girl is responding to clients, recommending doctors, and is herself a plastic surgeon it seems. Her face looked plastic and stiff, she does talk the talk and walk the walk.
- Dylan is a rich boy!
- Random girl who is a "CEO" of a "security company". Most security problems come from "misconfiguration" and our software solves it! lol
- Girl at the end not being able to say AMD, saying Intel instead
- This isn't a parody, these aren't audience plants, these are real people! Reality is actually beyond any Silicon Valley parody.
- The audience is filled with ignorant random people who have no clue what's going on. But the event was sold as this 'exclusive' event.
  - I would bet that at least 50% of the people there couldn't explain any CUDA code. Lots of people who 'want to be in the scene'. LMAO what a joke
-->

## Conclusion

I would like to thank TensorWave for being good sports, not giving up, making the event professional with pro videographers and photographers, and for inviting a bunch of us to this event.
But honestly, I wouldn't be surprised if this event was shadow funded by NVIDIA.
It just reinforced that AMD is way _behind_ NVIDIA, and that if there is anyone can go _beyond CUDA_, it is NVIDIA (and indeed, just the next day at GTC, [NVIDIA's Tile IR](https://x.com/JokerEph/status/1902758983116657112) was announced).

<!--- this entire event is a circuitous ad for nvidia, completely backfired-->

<!-- Lisa su didn't show up, supposed secret speaker-->

<!--
Lots of technical problems, talks running way over 5 minutes
Organizers did the best they could, given this was their first time
Panels got broken into talks as presenters wanted the ability to present their own marketing slides instead of talking out loud during the panel. Not many useful takeaways from the panels.
-->

<!--- lots of videographers and photographers, lots of event staff, lots of AV people-->
