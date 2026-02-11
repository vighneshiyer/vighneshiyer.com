+++
title = "NVIDIA Hollows Out Groq"
date = 2025-12-25
draft = true
description = "A Christmas surprise, Jensen's financial engineering, and my analysis of the Groq LPU arch + programming model"

[extra]
new = true
+++

On Christmas Eve, [CNBC announced](https://www.cnbc.com/2025/12/24/nvidia-buying-ai-chip-startup-groq-for-about-20-billion-biggest-deal.html) that NVIDIA was licensing IP from [Groq](https://groq.com/) to the tune of $20B: their largest "acquisition" to date.
To say that this was unexpected would be a massive understatement.
I expected that Cerebras, d-Matrix, or Tenstorrent would be acquired before Groq.

So, why would NVIDIA do this?
In this piece, I'll cover the classic pitch for "exotic" non-GPU "ML accelerator" startups, the history of Groq, the state of their LLM inference service ([GroqCloud](https://console.groq.com/home)), the microarchitecture of their chip (the "Language Processing Unit"), its programming model, and finally, speculate on what NVIDIA stands to gain from their psuedo-acquisition.

## Groq's Pitch

Let's go all the way back to 2016, when Jonathan Ross and Douglas Wightman, both of Google heritage[^tpu], decided to create a company based on their extreme vision of the end-game of ML specialized hardware.

[^tpu]: Ross was one of the lead engineers for the first TPU

- https://groq.sa/wp-content/uploads/2024/07/GroqThoughts_WhatIsALPU-vF.pdf?utm_source=chatgpt.com
- LPU design principles

- https://x.com/chamath/status/2003946644531040740/photo/4

> Taken Sep 1, 2016 when @JonathanRoss321 convinced me we could take on the giants, build new silicon and that AI was coming. In typical SV fashion, we didn’t even have a company yet - just a term sheet from me to invest and the three of us. I spent the next month recruiting as many of the TPU team from Google Wisconsin as I could. “Welcome to chips”, I thought. 
> 
> The company, as with all important companies, went through its own trials and tribulations including promoting Jonathan from CTO to CEO and the inevitable falling out and repair of his and my relationship.  Anyways, it all happened for a reason. 
> 
> Today we close this almost decade chapter and Jonathan starts a new one with nVidia. 
> 
> I can’t thank him enough. 
> 
> Sometimes it’s simply better to be lucky than good and be fortunate enough to work with great people and follow them into battle. That is me here.
> 
> Jonathan was not only the father of TPU when he was at Google but he is a technical genius of biblical proportions. He also assembled a great team with folks like @sundeep and @GavinSherry to back him up. They will also do incredible things at nvidia. 
> 
> Separately, whenever something I’m involved in either crashes or wins, I reread my thoughts when I first did it. Was it luck? Was it skill? What did I learn? What do I do now?
> 
> YMMV, but I am attaching the original investment memo I wrote a decade ago.
> 
> I’ll do a more substantive view on why this deal matters and what my guess is about the future of AI silicon from here on an upcoming episode of the pod.

{{ gallery(images=[
    "groq_investment_memo1.jpg",
    "groq_investment_memo2.jpg",
    "groq_investment_memo3.jpg",
], popout=false) }}

- https://x.com/aakashg0/status/2004105278627963168

> Social Capital put $10M into Groq’s seed round in April 2017 when the company was worth roughly $30M post-money. That single check bought about 33% of the company. Then they doubled down with $52.3M in a 2018 convertible note.
> 
> Total deployed: $62.3M.
> 
> Here’s where it gets interesting. Groq raised $300M at $1.1B in 2021, then $640M at $2.8B in 2024, then $750M at $6.9B in September 2025. Each round diluted early investors. But Social Capital had board seats and likely maintained some pro-rata through the convertible.
> 
> Conservative math: They own somewhere between 15-20% of Groq today. At $20B, that’s $3B to $4B in value.
> 
> $62M in. $3-4B out. That’s a 50-65x return in 8 years.
> 
> For context, this single investment is worth more than Social Capital’s entire fund size in 2015 ($1.1B). One bet. Eight years. 50x.

## Groq's Numbers

The primary selling point of Groq's custom silicon stack ([their LPU ("Language Processing Unit")](https://groq.com/blog/the-groq-lpu-explained) + their rack-scale integration pulling together tens of thousands of LPU chips) is low-latency, high-throughput LLM inference.
Batch = 1.
Deterministic latency, globally scheduled system and clock across thousands of chips (resembles the setup of Palladium).

Numbers tok/$, throughput, latency
OpenRouter numbers, ArtificialAnalysis numbers

Include Bill Dally's slides about the GPU instruction control overhead vs compute / memory movement overheads
  - His EECS Colloquium may be available

## Groq's Competitors

At this point, let me just enumerate all the players I can think of and what their claim-to-fame is:

https://zscc.ai/
Other players like SambaNova, Graphcore, NextSilicon, Etched, Fractile, Hailo, Korean players (Furiosa, Rebellions), MatX, DeepX, HyperAccel, and even new guys (PositronAI, Unconventional AI, Normal Computing, Extropic) are quite secretive.
Dead players like Mythic, Rivos, Blumind, Ventana are even more secretive.
The others who can match them are d-Matrix and Tenstorrent (they are the best), and to a lesser extent Cerebras.

## The LPU Architecture

First, I want to acknowledge Groq for their openness and transparency, which is rare in today's hardware startup world. The papers they produced give confidence that their product was at least intentionally designed 

Their 2 papers:
  - [A Software-defined Tensor Streaming Multiprocessor for Large-scale Machine Learning](cdn.sanity.io/files/chol0sk5/production/81d0c45ed70a10f1804bbd82f2d0076af1186ff0.pdf)

### Floorplan-Driven Architecture

Common among TPU googlers
See richard ho at reddi's class (lmao)
Traditionally arch drives the microarch which drives the floorplan
Googlers in TPU world designed the ISA around the floorplan 'viability'
The Groq-ers went all the way and designed even the uarch around the floorplan, throwing away all software / compiler / ISA concerns
https://old.hotchips.org/hc31/HC31_T3_Cloud_TPU_Codesign.pdf?referrer=grok.com

Attach the evolution of TPU paper. While they tried to go all the way with dataflow, they eventually moved back to a more programmable model with a VRF and matrix RF and accumulator SRAM and so forth. Single core. VLIW dispatch just to make sure instruction issue doesn't become a bottleneck, but otherwise no reason not to do traditional large frontend with assumption of easily predictable branches and regular ROB OoO dynamic dispatch.

Compare the TPU with the LPU. Remove the HBM. Make the datapaths even more fixed. Scale things up (vector length = 320 elements). Make all latencies deterministic. Add C2C links which are also deterministic. Go all the way with floorplan-driven archiccture. As I said, extreme vision of floorplan-driven arch.

In the traditional architecture view, you start with a principled architecture that is designed to bridge applications via a compiler to the arch. Then the uArch and floorplan / physical design makes the human-engineered arch feasible.
In the Brave New World of "co-designed" architectures, you ideally go backwards: first the floorplan and feasibility checks and then the uArch and then the arch only supports what is physically feasible and the compiler handles the rest.

### The Superlane

Attach my paper and analysis here
Arch = microarch - practically no distinction


### Pleisochronious Global Virtual Clock

Also implemented in Palladium emulators.
Actually an albatross for Groq.
They are building a throughput machine (even though they say otherwise, ML is a throughput bound workload if you aren't memory bound due to on-chip memory and aggressive model sharding and batch size 1 and if you aren't communication-bound if you're running with low-latency links and no dynamic switching).
In contrast, RTL emulation is truly a latency bound workload where shaving off even a few host cycles using fully synchronous rack-scale integration is worth it.

## The Groq Programming Model

- The Cerebras model (actually quite reasonable for HPC)
  - attach their paper where they discussed mapping for the 7 dwarfs
- The Groq model
  - C++ API
  - migrated to a Python API
  - MLIR layer for model partitioning

## The Psuedo-Acquisition

The Windsurf and ScaleAI model of psuedo-acquisitions.

- https://enertuition.substack.com/p/nvidia-to-acquire-groq-for-20b-implications
- https://news.ycombinator.com/item?id=46379183 (Nvidia to buy assets from Groq for $20B cash (cnbc.com))
  - https://groq.com/newsroom/groq-and-nvidia-enter-non-exclusive-inference-technology-licensing-agreement-to-accelerate-ai-inference-at-global-scale
- https://x.com/tanayj/status/2004363030943993990

> “License & Acquihire“ style deals over past 2 years:
> 
> Windsurf → Google (\$2.4B)
> Groq → Nvidia (~\$20B)
> Scale AI → Meta (~\$14.3B for 49%)
> Character AI → Google (~\$2.7B)
> Inflection AI → Microsoft (~\$650M)
> Covariant → Amazon (~\$400M)
> Adept → Amazon (undisclosed)

## My Analysis

- Batch 1 inference, attach my email here
- Deterministic delays don't buy you much and actually end up losing a lot (power savings from DVFS, dynamic throttling during low activity phases, only very coarse-grained host synchronization is feasible).
- What about just using B200 or TT hardware with all resident weights + tiny amount of DRAM + regular C2C and cross-rack links. You aren't losing much! But do the math and you'll see this is a loss maker unless the price is jacked up.
- The idea that NVIDIA will exhaust their TSMC and HBM allocations and will want to put their name on Groq chips since they use excess volume available from Samsung foundry doesn't make sense - NVIDIA will never want to put their name on a chip with the Groq ISA and/or programming model - they do not want to create a bifurcated software ecosystem.
- The 20B number is fishy - it is probably structured in some way wrt perf targets rather than a bulk payment, but we don't know the details.
- The regulatory environment around IPOs and acquisitions of equity have created this new type of "SPAC-like" entity capture that eludes regulatory burdens.

### Why?

- acquisition of talent (compiler engineers)? very fishy
- acquisition of the Groq LPU IP? also fishy.
- access to LPU v2,v3 IP?
- SRAM machine selling point?
- financial engineering?
- the GroqCloud business (losing money) and the rest of the company (supporting the IP) is just a loss-making shell now. NVIDIA has hollowed it out just like Windsurf, and for Groq, there is likely no Cognition to keep things going.
- Where will the money go? Well it goes into Groq

### Other Takes

- https://x.com/BenBajarin/status/2003954730108944726

> My guess is the Groq guys wanted out. It was / is DOA anyway.

- https://x.com/insane_analyst/status/2003942334250340772
  - total shock and bizarro world moment
  - Include the old Irrational Analysis article about Groq

> My opinion of Nvidia/Groq deal.
>
> Its such a bad asic tho. 144-wide sram vliw

- https://x.com/jukan05/status/2004049839395573772
- https://x.com/zephyr_z9/status/2004564245741260800

- https://x.com/chamath/status/2004583873322086508

- https://benitoz.substack.com/p/twas-the-night-before-groq-nvidias
- https://substack.com/inbox/post/182587737?utm_source=share&utm_medium=android&r=4dqzit&triedRedirect=true
- https://www.zach.be/p/why-did-nvidia-acqui-hire-groq

- Main HN thread: https://news.ycombinator.com/item?id=46379183
- Other HN thread: https://news.ycombinator.com/item?id=46403559 (Nvidia's $20B antitrust loophole (ossa-ma.github.io))

- https://x.com/IanCutress/status/2003967322160070893
- https://x.com/IanCutress/status/2004270173126382077
- https://x.com/IanCutress/status/2005392582814130646

- https://x.com/GavinSBaker/status/2004562536918598000
  - https://x.com/PatrickMoorhead/status/2004619749817520638
- https://x.com/zephyr_z9/status/2004649996587860066

- https://www.linkedin.com/posts/gillesbackhus_groq-our-highest-valued-startup-competitor-activity-7410964634964238336-5WUX?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAVUAnMBjBFeQj_67eMIA1E2610ABsluQic

> Groq, our highest-valued startup competitor, got "sold" for 20B to Nvidia.
> Everyone is wondering (and asking me) - why.
> 
> The high-level answer looks simple, and shown below in the picture.
> 
> It's a "speed vs cost" graph comparing Groq's own paid API vs. all other Nvidia-based TaaS (Token as a Service) companies for the common model Llama70B.
> 
> Y-Axis: Per-User Speed (what you feel)
> vs.
> X-Axis: $ per Token.
> 
> Now - Groq is not profitable at that Price point. That's almost common knowledge by now in our space. It's been mostly VC-subsidized (to 90%).
> Their actual price point to be profitable should be beyond the scale of this chart to the right (~10x higher).
> 
> What you can't take away from them is their Per-User-Speed.
> 
> Now why are they so much faster than a 4T-valued company that started this whole AI-chip thing?
> 
> First thing to understand: the speed at which an AI model processes inputs is bound by compute (the Flops). But(!): the speed at which an AI model is either outputting tokens OR (because it's technically the same) thinking/reasoning is not bound by compute but by memory bandwidth!
> 
> Now, most AI-chip companies use so called HBM memory. 
> You get ~100 GigaBytes per chip at ~4 TB/sec bandwidth. But it's very expensive. It's great though because this means you can hold a model like Llama-70B (70 GigaBytes) on a single chip. 
> 
> 
> Groq ONLY uses on-chip memory ("SRAM"). Everyone also uses SRAM, but not as the primary mem where models are stored. 
> 
> Big Pro: Groq's effective bandwidth is >10x higher (40 TB/sec).
> Big Con: The capacity per chip? Literally ~1000x smaller.
> 
> In other words: Groq needs at least ~500 chips to get Llama70B running in a datacenter. Nvidia/AMD/Intel/Etched/Tensordyne needs 1 chip.
> But: Groq is also very fast with a single chip. Fyi: Others can be very fast too, it's just a matter of chip-to-chip communication and then parallelizing the workload among 8/16/32/64 chips.
> 
> Even with their chip being much smaller and cheaper (older node) - you will never get to the economics of the others with that approach. And Nvidia knows this. And has known this for a very long time. Otherwise they totally would have done it.
> Btw: Groq's chip was not developed for genai, but for old vision AI. "back then" there were many SRAM-only AI chips. It's not new at all.
> 
> Also: If Nvidia parallelized the heck out of Llama70B on an NVL72, they'd smoke Groq. At unreasonable cost, which is why they won't do it.
> 
> So then why does Nvidia pay 20B for a technology that is fast, but for an economically infeasible cost?
> 
> 1. They get a well-oiled team that has brought a chip-to-API inference platform to market. They can still put them to work on something else. Which I am sure is what is going to happen.
> 2. They can now claim "Look DOJ - we're far from being a monopoly.. we had to pay 20(!)B for a comparably small competitor."
> 3. Plus all the other theories floating around that I won't get into now :)
> 
> If that was worth 20B - what would actual innovation be worth?
