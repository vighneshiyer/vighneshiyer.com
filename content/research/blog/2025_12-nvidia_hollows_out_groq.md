+++
title = "NVIDIA Hollows Out Groq"
date = 2025-12-25
draft = true
description = "A Christmas surprise, Jensen's financial engineering, and my analysis of the Groq LPU arch + programming model"
+++

On Christmas Eve, [CNBC announced](https://www.cnbc.com/2025/12/24/nvidia-buying-ai-chip-startup-groq-for-about-20-billion-biggest-deal.html) that NVIDIA was licensing IP from [Groq](https://groq.com/) to a tune of $20B, their largest "acquisition" to date.
To say that this was unexpected would be a massive understatement.
I would have expected Cerebras or Tenstorrent to be acquired before Groq.

So, why would NVIDIA do this?
In this piece, I'll cover the history of Groq, the state of their LLM inference service (GroqCloud), the microarchitecture of their chip, their programming model, and speculate on what NVIDIA stands to gain from their peusdo-acquisition of Groq.

## Groq's History

Groq was founded by Jonathan Ross and Douglas Wightman, both of Google TPU heritage.
Their marketing

Insert Chamath's tweet.

They created the TSP (tensor streaming processor). I shall discuss the arch below.
The VC pitch: the pie chart.

## Groq's Numbers

The primary selling point of Groq's custom silicon stack ([their LPU ("Language Processing Unit")](https://groq.com/blog/the-groq-lpu-explained) + their rack-scale integration pulling together tens of thousands of LPU chips) is low-latency, high-throughput LLM inference.
Batch = 1.
Deterministic latency, globally scheduled system and clock across thousands of chips (resembles the setup of Palladium).

Numbers tok/$, throughput, latency

## The Psuedo-Acquisition

The Windsurf and ScaleAI model of psuedo-acquisitions.

- https://enertuition.substack.com/p/nvidia-to-acquire-groq-for-20b-implications
- https://news.ycombinator.com/item?id=46379183 (Nvidia to buy assets from Groq for $20B cash (cnbc.com))
  - https://groq.com/newsroom/groq-and-nvidia-enter-non-exclusive-inference-technology-licensing-agreement-to-accelerate-ai-inference-at-global-scale

- https://x.com/insane_analyst/status/2003942334250340772
  - total shock and bizarro world moment
  - Include the old Irrational Analysis article about Groq

> My opinion of Nvidia/Groq deal.
>
> Its such a bad asic tho. 144-wide sram vliw

The 20B number is fishy - it is probably structured in some way wrt perf targets rather than a bulk payment, but we don't know the details.

The regulatory environment around IPOs and acquisitions of equity have created this new type of "SPAC-like" entity capture that eludes regulatory burdens.
- https://x.com/jukan05/status/2004049839395573772

### Why?

- acquisition of talent (compiler engineers)? very fishy
- acquisition of the Groq LPU IP? also fishy.
- access to LPU v2,v3 IP?
- SRAM machine selling point?
- financial engineering?
- the GroqCloud business (losing money) and the rest of the company (supporting the IP) is just a loss-making shell now. NVIDIA has hollowed it out just like Windsurf, and for Groq, there is likely no Cognition to keep things going.
- Where will the money go? Well it goes into Groq

- https://x.com/BenBajarin/status/2003954730108944726

> My guess is the Groq guys wanted out. It was / is DOA anyway.

## The LPU Architecture

First, I want to acknowledge Groq for their openness and transparency, which is rare in today's hardware startup world. The papers they produced give confidence that their product was at least intentionally designed 

The others who can match them are d-Matrix and Tenstorrent (they are the best), and to a lesser extent Cerebras.

At this point, let me just enumerate all the players I can think of and what their claim-to-fame is:

https://zscc.ai/
Other players like SambaNova, Graphcore, NextSilicon, Etched, Fractile, Hailo, Korean players (Furiosa, Rebellions), MatX, DeepX, HyperAccel, and even new guys (PositronAI, Unconventional AI, Normal Computing, Extropic) are quite secretive.
Dead players like Mythic, Rivos, Blumind, Ventana are even more secretive.

Attach my paper and analysis here
Arch = microarch - practically no distinction

### My Analysis

Batch 1 inference, attach my email here
Deterministic delays don't buy you much and actually end up losing a lot (power savings from DVFS, dynamic throttling during low activity phases, only very coarse-grained host synchronization is feasible).
What about just using B200 or TT hardware with all resident weights + tiny amount of DRAM + regular C2C and cross-rack links. You aren't losing much! But do the math and you'll see this is a loss maker unless the price is jacked up.

### The Programming Model

- The Cerebras model

- The Groq model
  - C++ API
  - migrated to a Python API
  - MLIR layer for model partitioning
