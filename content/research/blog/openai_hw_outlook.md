# The OpenAI Hardware Effort: I'm Pessimistic

Poaching of Googlers
Richard Ho
Chris Leary - the creator of XLA (and XLS) - a very smart guy, and ultra competent programmer. But lost in space without microarchitects to guide. Similar tragedy that befell Jeff Dean and many others. Googlers seem particularly suceptible to "moonshot" hysteria.
XLS
RTL + testbench generation via LLMs (Chipstack)
Bedrock - Creating an OSS SV stdlib (competitior to basejump and PULP IP and many others)
Topstitch - replacement

Building tools as a foundation is a good idea, but this is a company right?
The tools need to enable radically improved productivity or correctness or time-to-market...
What are they doing here?
What is the microarchitectural insight they have to design custom hardware? Otherwise, this is a blood sucking boondoggle.
OpenAI's hotchips talk (https://hc2024.hotchips.org/assets/program/conference/day1/HotChips%20-%202024-08-26.pdf) talked about things that can't be reasonably improved with custom silicon (power sloshing, soft error detection and correction, in-field continuous silicon validation, tightly controlled error propagation, high reliability optical links at scale).

There are a few potential reasons why they would want to build custom hardware:

- Cost savings at scale. Buying silicon from any other vendor implies OpenAI would lose some margin. In-house efforts 
- 
If cost savings at scale for ML training and inference is the most important thing (see Tesla Dojo, Google TPU, Microsoft Brainwave/Maia, AWS Trainium/Inferentia, Meta MTIA, Apple secret-server-chip, Alibaba Hanguang 800, Baidu Kunlun, Huawei Ascend, Tencent Zixiao, IBM AIU), then they are much better off negotiating custom hardware contracts
There are also AI accelerator startups that can simply be acquired (Sambanova, Cerebras, Tenstorrent, FuriosaAI, Graphcore, Groq)
- Buy IP and contract out the integration + PD + post-silicon validation
- What foundry has capacity for you? Apple has bought out the latest nodes for the next 3+ years (probably indefinitely). NVIDIA is fine staying 1 node behind the cutting edge and extracting the best yields with maximum reticle dies.
