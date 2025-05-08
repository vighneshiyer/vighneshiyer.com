+++
title = "LLMs for Chip Design"
date = 2023-02-28
draft = true
slug = "llms-for-chip-design"
description = ""
+++

- Use cases
  - Rtl design
  - Verif collateral
  - Assertion synthesis, coverage synthesis from verification plan
  - TCL script generation
  - Log parsing
  - Automatic bug fixing
- Players
  - Chipnemo Nvidia
  - 3 startups: ChipStack, ChipAgents, MooresLab
  - Cadence and Synopsys
- Things academics did
  - Lots of benchmarks
  - Verilog eval
  - Chisel llm thing (https://ieeexplore.ieee.org/abstract/document/10618053?casa_token=qUwmk-vV0uIAAAAA:0Z2tyVFLk7WGRtrh-LGd3mynCo5UBaSbIPfYTtA69d4z5stHAFbKZv-gsxH8ruDtHT5tVlZDPw) (https://arxiv.org/pdf/2504.19144)
- Leaders
  - Chipstack most prominent
  - See the openai commits
- Useful usecases
  - LLM for analyIng English spec, discover any inconsistencies or ambiguities
  - Spec to sva possibilities, show where they differ, allow user to pick and refine spec

# LLMs for Chip Design

- https://www.zach.be/p/yc-is-wrong-about-llms-for-chip-design

## The Sales Pitch

- Fully autonomous English high-level 'spec' to GDS (or at least RTL + testbenches + regression tests + a partial formal spec for a large subsystem)

## Model Scaling Trends

- fine tuning is often outstripped very quickly

## The Training Data Problem

Can unsupervised learning be helpful here?

## Agentic AI Frameworks

- where the value truly is

## Generic > Specific

- "domain-specific" LLM startups have a very short runway
- generic agentic AI tools will outstrip specialized ones with model scaling and vast queryable datasets
- startups are the wrong place to build specialized tools that depend on rich training data

- https://news.ycombinator.com/item?id=42672790 (AI founders will learn the bitter lesson (lukaspetersson.com))

https://ahmedheakl.github.io/asm2asm/
ahmedheakl.github.io
From CISC to RISC: Language-Model Guided Assembly Transpilation
From CISC to RISC: Language-Model Guided Assembly Transpilation

Very insane idea lol, applied llm research is becoming such a joke
22 replies
  Today at 1:00 PM
do u think this is solid or not solid work
  Today at 1:07 PM
I mean it is a joke, you can't have less than 100% translation accuracy
  Today at 1:34 PM
is there existing 1:1 100% translation accruacies?
  Today at 1:39 PM
See Apple's Rosetta
  Today at 1:50 PM
oh true
1:50
hmmm as a path finding paper it is fine
1:50
if the new method does not beat baseline
1:50
as long as they don’t claim it is better
  Today at 1:53 PM
yeah i'm ok with the claims they make in the paper, nothing dishonest
1:53
but really this is monkey-tier research
  Today at 1:58 PM
you know what, i bet that if you used an llm to write code + verification collateral for x86 to arm translation, it would perform better than using the llm itself to do translation
  Today at 2:18 PM
yes llm generate the transform rather than writing the code
  Today at 2:22 PM
it seems most of their benefits come from tokenizer tuning, which makes sense, but is this really interesting research lol?
2:22
llm for X can lead to nonsense directions
  Today at 2:46 PM
well isn’t my thing also llm for X lol
2:46
tehcnically
  Today at 2:48 PM
yes indeed, llm for X has very high risk tolerance nowadays, it doesn't seem to be a reasonable thing to do in academia, which is a place for high risk / uncertain reward bets
2:49
furthermore, llm for X domain-specialization will be superseded by more general approaches, at least this seems to be the trend
  Today at 3:27 PM
yeah i wanan develop more domain specific techniques from investigating LLM for X settings
  Today at 3:35 PM
domain specific techniques might be useful in the short term, but i suspect they will be increasingly obsoleted as more general versions of those techniques (perhaps as plugins) will be integrated into general purpose llm-based development platforms (e.g. replit)
New
  4 minutes ago
well i think we need general purpose technique and reasoning is generally good to develop from code as a setting
5:16
chatgpt was developed with a lot of coding tasks too which significnat incraesed is reasoning skill

- You cannot call saas apps as angular or react wrappers in the same way you can call chipstack or another llm for x tool a gpt wrapper, in the llm case, the base tool will evolve to subsume the wrapper while that isn't the case for saas webapps

- For the saas vs llm serving companies, consider both axes, folding in custom stuff into the general model using rag, fine tuning, agents and so forth and also the custom data aspect, chipagents can get good perf on verilog eval, see their LinkedIn page

- https://x.com/Suhail/status/1903812003757736086?t=lVX9_QMBaJXvQnC6COCrTA

> Playbook to defeat frontier ai labs without billions of dollars initially:
> - build an app on top of their models
> - solve an important, large problem for humanity
> - resume training on top OSS models to reduce dependency, lower costs for certain tasks, increase performance
> - accumulate users + revenue for that category rapidly
> - make your UX sharp and focused around the use-case, something they cannot do cuz chatbot UX / too many products to market then
> - hire great researchers who care about that one problem you work on
> - work backwards: start with improving post-training then head to pre-training if necessary
> - market only solving that one problem vs general problems so you stand for something in the market/people’s minds
> - defeat frontier general ai lab  with your user feedback / focus advantage
> - ignore the funding cycle hype / never compare
