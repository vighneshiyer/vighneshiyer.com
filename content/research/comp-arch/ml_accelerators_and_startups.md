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
