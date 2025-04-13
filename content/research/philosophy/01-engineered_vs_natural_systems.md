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

## Notes About Intelligence

- How do you measure self-awareness? What is consciousness?
- What is intelligence?
- Can knowledge and reason exist and be acquired independently?
  - Aristotle would say no
  - Is number theory a counterexample? No physical reality appears to be needed.
- Can we build an engineered 'intelligent' system? https://yuxi-liu-wired.github.io/essays/posts/cyc/ (prior experience suggests no.)
  - Intelligence cannot be fuzzy, so I think? It must evolve from axioms and evolved iteration, but only end up in new axioms? Is this true?

- https://x.com/Devon_Eriksen_/status/1910314718998192537

> Don't get upset. I'm not saying SpaceX plans to fail. I'm pointing out that SpaceX has taken an ultraimportant principle from software engineering, and realized it applies to all engineering.
>
> Feedback beats planning.
>
> And that, you see, is why SpaceX doesn't do things the NASA way. The NASA way was to gold-plate everything, plan and test and plan and test, and generate mountains of paper detailing every contingency, with every scenario prepared for.
>
> SpaceX just shrugs, says "it's unmanned", and sends it.
>
>  Half the time it blows up. That's the whole point. They don't actually want it to blow up, of course, but they're anticipating that it might.
>
> That possibility is part of the plan. Because one rocket blowing up, or crashing, in an actual end-to-end test, beats many, many man-years of planning and plotting.
>
> The key realization here is that knowledge only comes from empirical observation. Everything else is just speculative.
>
> The sooner you get into a feedback loop, and the faster you run it, the more iterations you can do in less time. This means, while others are planning and speculating, you actually learn something.
>
> Relevant data is the most precious thing in the universe. And it's worth blowing up any number of rockets to get it.

This is kind of irrelevant, but is it true that knowledge can only emerge from observation?

- What is intelligence? Abstraction, generalization, connection making, synthesis of ideas into a new whole, anything else?
- What is consciousness? Let's say we build a mechanistic system that has intelligence and we put it in a human form, you can't see the machinery, does it possess consciousness? At its core consciousness isn't really about responsiveness to the environment, since that can be mechanistic, but rather it is about autonomy, if a mechanistic system can be precisely simulated knowing its initial state then it can't be autonomous. This is just the same argument about human free will, it can't exist in a mechanistic world.
- What about ensoulment, it seems to be related to consciousness, perhaps I'm just getting the definition of consciousness messed up
