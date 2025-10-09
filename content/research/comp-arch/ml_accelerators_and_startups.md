+++
title = "The Landscape of AI Accelerator Offerings"
date = 2024-03-23
draft = true
slug = "landscape-of-ai-accelerator-offerings-and-startups"
+++

Axes to consider:

- Tokens / second
  - Tokens / second / user
  - Batch size vs throughput vs latency tradeoff curves
- Power usage
  - Power density (important, greatly affects cooling cost/reliability and physical feasibility)
- Cooling requirements
- Form factor
  - Area density at a system-scale (very important, but underappreciated)
- Model size constraints
- Reliability
- Software support and optimization
- Networking / multi-node capabilities
  - Physical hardware used for networking (PHYs and switches / supported network topologies)
  - Power and perf of networking hardware + form factor considerations
- Flexibility / programmability / compiler availability and flexibility

- https://www.zach.be/p/most-ai-chips-arent-cost-effective (on d-matrix corsair)
- https://fleetwood.dev/posts/domain-specific-architectures (good general overview for transformer oriented hardware)

> Groq, TT, TPU, Blackwell and more
> Get clear die shots, categorize sram and compute area and capacity and performance
> How much area is consumed in each process by the MAC units. Is the tpu density way below what one would expect?
>
> I think trying to give a detailed overview of the physical design as well as the arch characteristics would be crucial to understand the landscape. Such as, how much instruction amortization is actually required. Or also to contrast the tpu model with the TT one. How much benefit can be derived from timing determinism and only SRAM usage vs variable memory traffic and hbm? I think both of these are negligible. Does groq do a lot better than a TT style arch in the same process wrt compute and memory density? Are their claims of inst dispatch amortization actually relevant?

The TPU architecture looks very different than the others. Groq is very VLIW, cycle-by-cycle static scheduling. Cerebras is a bunch of tiny cores. TT is the only sensible one that resembles a SIMT machine. SambaNova is going to fail.

- https://irrationalanalysis.substack.com/p/tenstorrent-and-the-state-of-ai-hardware
- https://irrationalanalysis.substack.com/p/very-long-incoherent-writeup

Some of these points are good.

## Discrete Chips/Cards You can Buy

NVIDIA (of course) (you can buy boxes and racks too)
Intel
AMD
FuriosaAI
Tenstorrent Wormhole / Blackhole
  - https://www.anandtech.com/show/21482/tenstorrent-launches-wormhole-ai-processors-466-fp8-tflops-at-300w
  - https://semianalysis.com/2021/06/25/tenstorrent-wormhole-analysis-a-scale/#
MatX
Untether.ai
Mythic (deprecated)

## Boxes You can Buy

- Already setup boxes
  - See tinybox

## Racks You can Buy

Cerebras
  - https://x.com/Tim_Dettmers/status/1858977311569440955
SambaNova (looking good)
- Groq
  - https://x.com/JordanNanos/status/1949883300576928202
  - Good SemiAnalysis guy analyzes Groq from a cost perspective for large model inference vs NVIDIA alternatives
Graphcore???

## Hosted Chips

- TPU
  - https://thechipletter.substack.com/p/googles-first-tensor-processing-unit
Trainium
https://www.etched.com/announcing-etched

NVIDIA’s GPUs
Google’s TPUs
Amazon’s Trainium
AMD’s accelerators
Graphcore’s IPUs
SambaNova SN Series

Cerebras’s CS-2
Groq’s GroqNode
Tenstorrent’s Grayskull
D-Matrix’s Corsair
Cambricon’s Siyuan
Intel’s Gaudi

TaalasAI
MatX
NextSilicon
Neuchips
Blaize

## Hosted Services

- Fireworks
- Together
- GCP / Azure / AWS

## Startups without Commercial Silicon Yet

Taalas AI
Positron AI
