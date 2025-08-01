+++
title = "Part 1a: Engineered vs Natural Systems"
date = 2024-03-23
draft = true
description = "How they differ, 'evolved' systems, and where ML fits into the picture"
+++

## Engineered vs Natural Systems and Engineering vs Science

- Natural systems: observations - models - experiments - refined models
- Engineered systems: models - abstractions - physical reality
- self thinking abstractions can emerge even within an engineered system (emergent intelligence), nested intelligence
- biological abstractions exist on top of nature's primitives

### A Religious Aside

- If you will, the natural world is an engineered system, engineered by the gods
  - https://en.wikipedia.org/wiki/Watchmaker_analogy
- The system produced by the gods has some natural variation and noise, which the components (abstractions), humans, can leverage, leading to free will
  - https://en.wikipedia.org/wiki/Simulation_hypothesis

- Natural systems
  - There is only THE natural system (perhaps?)
  - We can model (i.e. simulate) other natural systems (but those end up engineered)

- In engineered vs natural systems talk about how stream engines and airplanes were created without any underlying theory of aerodynamics or thermodynamics, the theory came later which then made these systems more amenable to engineering

## Engineered Systems

- An engineered system is that which moves from the abstract to the physical, this even applies to software
  - An engineered system can be perfectly simulated with respect to its abstractions by construction while a natural system can not
- Engineered systems vs evolved systems vs natural systems
  - Are evolved systems just engineered natural systems? Neuromorphic approaches could fall in this bucket.
  - Perhaps, evolved systems can be both natural and engineered - they are an outcome of either system in a particular context / perspective
  - Evolved systems are just engineered systems that have been engineered 'naturally' (either by the Gods, random chance, biological abstractions). They don't build explicit models or abstractions however. That is the major difference from an engineered system. They are also not 'natural' systems either though since there are no axioms.
  - Actually when looking closer, evolved systems can emerge from both engineered and natural systems - the main thing is that the abstractions they use are NOT axiomatic! That seems to be the key. Biological (evolved) systems emerge from natural ones. They can be 'reverse engineered'. Artificial intelligence emerges from engineered systems, but they are still evolved, not strictly engineered. The abstractions they use internally are evolved and not axiomatic.

## Engineering vs Science

- https://mitpress.mit.edu/9780262690232/the-sciences-of-the-artificial/
- While doing either science or engineering, often you will have to bleed into the other and there can be grey areas. This doesn't take away from our ability to distinguish between science and engineering in the abstract.
- Engineered systems produce a final manifestation into a natural system. At that point, the various abstractions used during engineering break down and you see the reality. Making the engineered stack match the natural one is the goal of science. Leveraging the abstraction stack to produce systems manifested into the natural world is the goal of engineering.
- Software is of course the best example of an engineered system
  - At the very bottom, the process engineer gives the standard cell designer a SPICE model of a transistor and parasitic models of the process.
  - The stdcell designer treats that as gospel and designs the standard cells and gives the synthesis tool Liberty files that fully describe the cell.
  - The synthesis tool treats Liberty files as golden and provides a blackbox that the RTL designer can rely on to perfectly translate with near optimality (wrt the stdcells given) the RTL into a netlist.
  - The RTL designer hands the architect the RTL blocks with IO ports as golden abstractions. The RTL designer guarantees that his block satisfies the assumption/guarantee specification provided by the architect.
  - The architect treats these RTL blocks as golden and stitches them together into a top level. The architect provides an ISA to the OS / software developer as the model.
  - The OS engineer takes the ISA as gospel and provides abstractions to the userspace programmer.
  - The runtime engineer takes the OS abstractions as bulletproof and designs a JIT runtime + garbage collector that a program can run on top of.
  - The software engineer assumes that memory allocation never fails and the code will run fast enough and provides some library functions (e.g. HTTP server) for the application engineer.
  - The app engineer assumes the core software works and writes the business logic and backend.
  - And on and on until this entire abstraction stack manifests into the natural world and all these abstractions are gradually erased with every deployment (manifestation) up the stack. At that point, we see all the ways in which the various abstractions are wrong / do not accurately model the natural system.

It is hard to appreciate just how much of our engineered computing stack is built on quite robust abstractions. The complexity this enables (and in a similar vein, the insane inefficiency of software) is not seen in other fields.

## Well what is the point of all this?

Two things: motivate what is good engineering research + understand where and how ML is powerful

### Yufeng question followup

> It seems that the nice layers of abstraction in computer architecture has also introduced many inefficiencies? If so, would "breaking the SW-HW contract" the correct way to optimize a system? (i.e. the ultimate optimized system would just be a soup of stuff mixed together without abstraction)
>
> If the abstract is set up for us to better understand the system, it sounds like this should be an AI job to cook this high dimension soup (establish analysis directly between the fundamental blocks and build functionality that way) and give us the most optimal system?

> In theory you're right, it would be a soup that isn't engineered but rather evolved, the complexity is too high to attempt it though
>
> There has been work on direct ml signal modulation for rf where the actual modulation scheme is learned dynamically over any channel, idk whether it is viable in reality though

- Harrison's sam Altman fabs idea
  - Altman was at one point fanatic about opening 100s of fabs in America and investing trillions in doing so
  - What was the point of this? He wanted to bypass an explicitly engineered system! ML is powerful when we can go from spec to implementation, bypassing the human engineered abstractions we use to handle complexity. This has been shown valuable in RF circuits and evolved antenna design.
  - Ideally: one-shot generate geometry from RTL (or even from a refined English specification in the extreme case)
- RTL simulation as a ML model, just as physics sim as a ml model, both are engineered systems
  - Imagine 'learning' RTL simulation using both supervised training and unsupervised, exploration-driven fine-tuning
  - No doubt such a thing can 'work'
  - But it doesn't make any sense since you're trying to replicate an engineered algorithm from just data, there is no point in doing this. You can't afford any fuzziness. But this is what a lot of ML for CAD things look like.
- An engineered system must be simulate-able precisely based on its primitives, natural systems can't be simulated directly but only through an engineered model of the natural world
  - Natural systems, our system, can't be simulated due to 2 things: uncertainty principle, quantum stochasticness (perhaps there are others)
- Evolved antennas and rf circuits and photonic waveguides and couplers, ml is powerful when it can break engineered abstractions
  - https://news.ycombinator.com/item?id=43772503

## Random Notes During Prelude to Group Meeting

Natural systems, two things, they have unknowable or incomplete axioms, they can't be perfectly simulated, see uncertainty principle or godel incompleteness, quantum randomness
Our physical world and number theory
How do we study natural systems? That is science

Engineered systems, but wait then is the study of biology the study of a natural system? Something is missing.

Evolved systems, they can evolve naturally or by explicit engineering, no clean abstractions but only vague ones, shapeless,

- FSD rule based to fully learned, not like Waymo
- The Altman approach to chip design isn't about mimicing the engineered system with all its abstractions. It is about breaking those abstractions in the first place into an engineered evolved system that can understand and optimize for *the* natural system better than human engineered systems.
- Trying to build engineered evolved systems that mimic natural evolved systems! Not trying to mimic engineered systems!
- Symbolic AI is a form of engineered system - there is no evolution, but it is fully human specified with rules and knowledge / common sense. It has natural limitations. Linguistics is the same way - trying to engineer a system that mimics a naturally evolved system, when the engineered evolved system works even better.

Out of distribution is a major issue for evolved engineered systems - the natural system itself doesn't have this problem - it is axiomatic! The naturally evolved system is also present in the natural world (e.g. drug discovery by trying random compounds on in-vitro cell cultures). However this is a fatal flaw for the evolved engineered system trying to mimic an engineered system - the solution is to use each system when appropriate, but that is hard.

When ml is powerful is when it is used to model or generate the output of an evolved natural system. When it is applied to the right side, an engineered system, it has to be carefully used, in and/or out of the algorithm loop. Going left, we think generative ai is powerful but going right, in the loop or out the loop is better.

Generative can be in terms of the usage of ml being end to end or also in the sense that ml generates the algorithm itself (program synthesis), I guess that is just a constrained version of the ml only approach which is just more interpretable

Evolved engineered systems also need an engineered evolution function that works through a fuzzy abstraction, I'm missing that

Need to talk about aeroplane and how they came before the theories of aerodynamics or even those models, I'm talking about systematic engineering vs ad hoc engineering which is more fuzzy and hypothesis driven, more in the area of science

## Random Notes (post-group meeting)

- Lucy had some thoughts she wrote down - check Slack when updating this article.

Function approximates being chained with some Bayesian error limits should be doable right? Yeah but the abstractions are still fixed. Chaining function approximators should give us at least a time benefit over the engineered solution right? Yeah I agree with that. It can be done, but I would say it doesn't break any abstractions and is thus not a boon for QoR (perhaps for design iteration time). Furthermore, can't we improve those algorithms themselves?

A common issue with traditional CAD algorithms is they always start from scratch with no prior knowledge. It doesn't have to be that way. We can incorporate embeddings, hyperparameter estimates, and so forth from prior runs + generalization. We can use RL. Surely that in-the-loop and around-the-loop approach will be computationally superior to the approximation and chain strategy.

It is certainly not the case that 'replicating' the functionality of an engineered algorithm is useless. Take synthesis for example, certainly we can learn a 'one-shot' model which takes RTL to a gate level netlist. In doing so, let's say with infinite training data (starting with bootstrapping from a CAD tool and then doing self-play and RL evolution with human designed reward functions), I can't imagine a world where this wouldn't outperform the hand-engineered CAD algorithms. Synthesis tools have many internal engineered abstractions and pass ordering, which can be suboptimal in many cases - certainly those could be subsumed by an ML blob. So this is a case where Ken has a good point and my theory needs some refinement.

Engineered systems are hierarchical. That is something I failed to mention. This also applies to naturally evolved systems. If we can break abstractions on some part of that hierarchy while preserving others, that is another case where ML is powerful (e.g. within synthesis for example). It doesn't mean that for ML to be powerful it has to mimic a naturally evolved system - it can also be used in a generative fashion within an algorithmic hierarchy, but only will be valuable if it can break abstractions.

- See old Krste slides
  - Abstractions are used in engineered systems to make it possible to go from application -> physics in steps rather than all at once (but he describes the compass as an example of tunneling straight from application to physics)
  - We pay abstraction costs from app -> algorithm -> PL -> OS -> ISA -> uArch -> RTL/GL -> Circuits -> Devices -> Physics to *manage complexity* as engineers
  - Breaking / tunneling through an engineered abstraction can be valuable if we are able to 'abstract' away that abstraction altogether (we ignore it in the engineering flow and treat it as a black box and we're OK with that)
  - In the ideal case, we can tunnel all the way through via an evolved system. After all, aren't biological organisms composed of evolved abstractions that go from 'application' to physics? It is a metaphysical question as to the 'application' of humans (and other organisms), but many people suggest answers to this lol.
