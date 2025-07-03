+++
title = "GPU Mode, Beyond CUDA, and the GTC Keynote"
date = 2025-01-28
draft = true
+++

Three days of fun. What did I learn?

## GPU Mode

What an impressive group of people. There is a vision here. Make CUDA programming accessible and easy, and make it easy to write high performance custom kernels for training and inference.
I'm lucky to have an invite to this. Thanks Simon!
Just a group of highly motivated and competent people who just kept pushing collaborations between academic ML systems groups, startups, and industry. Eventually, they put together this showing right before GTC, and even got NVIDIA to sponsor the event! The logistics were fantastic.

- https://christianjmills.com/posts/cuda-mode-notes/lecture-005/
- https://www.youtube.com/channel/UCJgIbYl6C5no72a0NUAPcTA

> This is a casual get together for ML Systems nerds. We'll start off with an hour's worth of inspiring talks discussing some important open problems in ML Systems and end the evening with espressos and cocktails
>
> Schedule
>     5:30 PM: Doors open
>     5:45 PM: Pre-talk snacks
>     6:30 PM: Keynote + Lightning talks
>     8:00 PM: Cocktails and food
>
> Talks
>     6:30 PM | Christos Kozyraki (Stanford) -The State of Hardware — and what it means for you writing software
>     7:00 PM | Mark Saroufim (GPU MODE) - Opening Statement
>     Simon Guo (Stanford) - KernelBench
>     Alex Zhang (Princeton) - KernelBot
>     Sahan Paliskara (PyTorch) - KernelBook
>     Zacharias Fisches (FAIR) - KernelLLM
>     Simran Arora (Stanford) - Thunderkittens
>     7:25 PM | Vijay Thakkar (NVIDIA) - CUTLASS
>     7:30 PM | Super Secret Guest Speaker - How nothing's changed but also everything is different
>
> Our goal for the night is that you find a few important problems you can sink your teeth into this year and smart peers to actually get it done.
>
> Huuuuuge thank you to our sponsor NVIDIA

- Cuda wasn't application driven, it was first principles driven, Jensen needed to be there to make it happen even when product market got didn't exist for many years even decades, the investment was massive when it didn't seem worth it
- https://www.youtube.com/watch?v=FtgXueoQkA0 (full video)

### The Keynote

- Moving from mainframe-style "AI factories" which have reliability problems and scaling inflexibility to a computing model that looks like the modern web (microservices, RPC communication)
- It seems unlikely right now, NVIDIA is 'scaling-up' very aggressively and models are growing more and more monolithic (save for MoE architectures, which are just about efficient inference not the deployment architecture)
- If individual nodes become large enough to hold specialist LLMs and they can communicate in swarms where we can autoscale the number and type of experts in the network, and if the overall task completion isn't bottlenecked on network throughput or latency, this idea might make more sense

- https://x.com/packyM/status/1912585616203870715/photo/1

> 5. Society-of-Minds Architectures Beat Giant Models
>
> Early 2025 demos show that swarms of small, specialist models coordinated via agentic RAG outperform single monoliths on open-ended tasks.
> The unit of progress becomes the network, not the parameter count.

Idk, this hasn't been demonstrated yet.


## GTC

- https://semianalysis.com/2025/03/19/nvidia-gtc-2025-built-for-reasoning-vera-rubin-kyber-cpo-dynamo-inference-jensen-math-feynman/#smart-router
- https://irrationalanalysis.substack.com/p/gtc-2025-co-packaged-optics-switching

- https://www.youtube.com/watch?v=d89mHSeN_QE ( Beyond CUDA: Accelerating GenAI with MAX and Mojo (Chris Lattner's lightning talk at GTC 2025) )
  - Modular was missing during Beyond CUDA, but they are the best positioned to make an impact

- How to Write a CUDA Program - The Parallel Programming Edition | NVIDIA GTC 2025 Session  (https://www.youtube.com/watch?v=GmNkYayuaA4)
  - Where is this kind of high level tutorial from AMD? NVIDIA's materials are top-tier and AMD is nowhere to be found, just a bunch of confusing stuff in the Rocm documentation.
  - Even Tenstorrent's recent developer day had plenty of these in-depth tutorials and overviews of their architecture and software stack: https://www.youtube.com/watch?v=t-k_03JQqww
- CUDA: New Features and Beyond | NVIDIA GTC 2025 (https://www.youtube.com/watch?v=6o_Wme-FdCU)
  - The real "Beyond CUDA"

- https://semianalysis.com/2025/04/23/amd-2-0-new-sense-of-urgency-mi450x-chance-to-beat-nvidia-nvidias-new-moat/
  - Yeah Dylan and friends have laid out all the ways that NVIDIA is way ahead, and is increasing the gap day by day. AMD is falling further behind.
  - It seems like Dylan's bullying and geohotz's bullying was necessary to give AMD employees leverage over management to do important things like ship MI boxes to top devs/labs and allocate funding for pytorch CI. If the management is so incompetent that this requires bullying, it doesn't give confidence about AMD's future. There has to be a massive purge, Musk-style. AMD's management seems to be filled with middle-manager salary-drawing airheads with little engineering background - the exact opposite of NVIDIA.
