+++
title = "AI for Chip Design Panel @ Baya Systems (w/ Root Ventures)"
date = 2025-01-28
draft = true
+++


- On Monday, Jan 27th, 2025

- Dan: https://www.linkedin.com/feed/update/urn:li:activity:7290155887774646273/

> Awesome panel on AI & chip design, with Sid Dhodhi from NVIDIA, Joji Philip from Baya Systems, Uday Dasari from Google, and Chrissy Meyer from Root Ventures

- https://www.linkedin.com/posts/cphelan_bayasystems-rootventures-activity-7290151769639206912-wN1Y/?utm_source=share&utm_medium=member_desktop

> Thanks to Joji Philip and the team at hashtag#BayaSystems and hashtag#RootVentures for hosting "AI for Chip Design Happy Hour" in Santa Clara yesterday.
>
> Incredible insights from Sid Dhodhi from GEN AI Hardware Engineering at NVIDIA

Honestly, not that interesting panel lol. But Dan did a good job and it was fun! I still have no clue what exactly Baya Systems does - everything is so vague. It seems this EDA CAD startup community is very small and you see the same people every time. The distribution of people in this event was not as hardware heavy as I would have expected. I feel most people don't really have a VLSI / computer architecture background and instead come from the CS, or even ME side of things. I would have appreciated a more curated event with a more aggressive Q&A, but it does seem to be organized by Root Ventures, so they probably wanted to cast a wider net.

## Why has eda cad dominance continued?

- Dan says disruption is needed, hasn't happened before, more startups in this space exist now than ever before
- Nvidia guy, chipnemo guy, we think mimicking human actions with these agentic tools is something that hasn't happened before, build interactive sessions with these tools
- Baya systems guy, more people can utilize these AI tools today due to accessibility, conservative field makes ai hard to integrate, but more faith is present today
- Google Tensor SoC guy, buried knowledge within the eda cad tools, room for error is zero so repeatability is important, can't afford any risk, hard to nudge out current cad flows, mindset has started changing very slowly, use machines / cluster level parallelism in the process (like dso.ai), no short term escape from eda tools, but there will be a wrapper around them like natural language, cost is the most critical factor still

## Have you experimented with LLMs?

- Baya, haven't used formally but everyone in the team uses gpt informally for brainstorming and code, they use vs code and copilot, they have used LLMs to find problems in a huge linting log as a summarization task, use LLMs for helping customers use their tools, still an idea, pre-train with examples of prior problems and solutions, lower learning curve with natural language network specification to tool usage automation
- Nvidia guy, working on this for 2 years, wanted to train a generalist model themselves due to low performance of other models, claims 60-75 percent of the way with models, summaries are excellent with LLMs, (still seems quite marginal ad hoc add-ons to me), want a natural language interface to documentation, they built this, bug summarization and q and a about a system and arch is used a lot by users, engineers benefit from code base specific question asking, avoid bothering people, avoid time multiplexing experts
- Google guy, more log parsing, more spec q and a, design optimization using LLMs is still pending

## Eda landscape, what part of the ic design workflow isn't touched by AI and will transform?

- Dan, least likely is software, work up the org chart, automate the boring stuff, ml-ified cad tools are going to continue but aren't that transformative, foundation models throughout the eda cad stack are possible, Dan likes to start from the small stuff first and not doing something huge and full stack, most painful issues will be fixed first
- Nvidia, most of the process will remain human driven, ai assistance is good enough, just a productivity boost, decisions made by humans and AI does the grunt work
- Baya guy, engineers will focus on the arch and creative process, humans won't write verilog in the future
- Google guy, lots of standard functions are already LLM coded, high level decisions stay with people, system level architecture, everything under the arch document is structured and mechanical, that can be automated

## Where do we get high quality data for these models?

- Nvidia guy, they did their llm model since the other ones couldn't write verilog, training has its own challenges, need to have specs and reasoning about verilog and instruction following, can't have too many engineer hours wasted on labeling, but can beat generalist models on specific tasks, but that won't last as generalist models get better, still a challenge and resort to synthetic data generation, but still iffy

## Is verif a better place to start vs design?

- Baya, verif produces a lot of data, regressions and coverage, finding patterns and guidance is good, but you can't rely on llm decisions for verif design itself, you can go from spec to test plan to making sure it is fully covered, trends in regression data over time, fault localization
- Nvidia guy, verif has a lot more people, easier to target, closer to sw engineering vs rtl writing
- Dan, high risk, recommendation systems are useful, similar systems can be used in verif
- Google guy, reduce test time and higher coverage with lower regression cost is the main way to help, signoff might benefit too, model can predict things that are seen at the tail end
- Baya, use LLMs for simple rtl structures like fifos, testbench is easy at module level too

## Startup advantages of AI powered design tools in this space, vs cadence?

- Google guy, still will use cadence and synopsys, let an llm try various layouts and floorplans and take them all thru pnr and let them play on their own without human input, can find out why a floorplan isn't viable and analyze and replan automatically
- Dan, startups must focus on one particular area in the eda cad stack, just target a single tool, can't make a case you will replace everything, but you can override bad legacy decisions
- Google guy (random remark), they do full chip emulation now days, all the software is ready by the time the chip comes back, money is the limiter not the capacity of emulation platforms

## One Interesting Question

- One guy in the audience asked an interesting question
  - Trying to boost productivity seems like nonsense if you look at how old technologies were developed
  - LLMs deal with data like single factor things
  - At Intel and IBM, the guys had the best tools but still had garbage products
- The world isn't about information but rather about the physical fundamentals of physics and chemistry, sounds reasonable
- If you have a bunch of CS people on an island, would you ask them to make GPT or a boat?
  - This is an analogy about fundamental understanding vs hacking things (building blackboxes around training data for systems that are *engineered* in the first place (e.g. EDA CAD tools))
- The product isn't about the tools, what about the final outcome? Intel and IBM had the best tools

## What resistance from a design team have you faced?

- Nvidia, nothing much, AI mostly provides assistance so there is nothing to argue against
  - The VerifAI guy in the audience (Sandeep Srinivasan): At DAC two years ago he claimed that LLMs and RL would play a major role in DV and people laughed
  - So... what is the case today? People don't laugh openly perhaps, but what are their true beliefs?
- Nvidia, there is more acceptance now to using AI-powered tools than a few years ago

## Asking about AlphaChip paper

- VerifAI guy used his example of people not taking his advice about RL/LLMs for DV seriously to pose a question to the Googler
  - Do you see a similar trend at google where people don't take RL seriously from 'outsiders'? He gave the specific example of the AlphaChip thing.
  - Seems too emotional
  - How is that taken internally in Google?
- Google guy, resistance comes from stagnant people, googlers brainstorm with people outside chip areas (just a bunch of drivel imo), some friction but googlers come to accept it eventually, the paper came from 9 years ago supposedly, deepmind people ask why do we need verilog, why eda tools (they try to break assumptions that VLSI people have baked in from years of doing the same thing)? And they take it seriously (try to build new tools to supercede the existing design / backend process)
- Dan, going hard, doesn't agree with Google, read the story for yourselves, brutal

THE END.
