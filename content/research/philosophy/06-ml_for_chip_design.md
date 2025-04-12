# ML for Chip Design: My Philosophy

## Utility of ML in General

## What I Consider "Fake" ML Research

- Blind sweeping. No reasoning or engineering is done, just "Bayesian" learning. Taking an engineered system someone else has made with a bunch of knobs and just spinning them around to "explore" the "design space". This kind of unconstrained monkey-tier "research" is bad.

## Where Does ML Excel?

Look at the prior article.

## Utility of ML for Chip Design

## Commentary on Sutton's "The Bitter Lesson"

- https://awards.acm.org/about/2024-turing
- Most AI value will come from broad automation, not from R & D (epoch.ai) (https://news.ycombinator.com/item?id=43447616)
- https://news.ycombinator.com/item?id=43451742 (Bitter Lesson is about AI agents (ankitmaloo.com))

> For a blog post of 1,200 words the bitter lesson has done more damage to AI research and funding than blowing up a nuclear bomb at neurips would.

> What do we do with the problems that are too hard to solve with the limited compute that we have? Lie down for 80 years and wait for compute to catch up? Or solve a smaller problem using specialized tricks that don't require a $10B super computer to build?
>
> The bitter lesson is nothing of the sort, there is plenty of space for thinking hard, and there always will be.

## One Shotting

Is one shotting possible? From RTL to GDS? In principle, why not? It can certainly be done, and we have good reason to believe that from computer vision and language models.
But what are the impediments? Firstly, we have to learn from physics onwards to do something revolutionary. Altman's original fab idea leans in this direction.
Otherwise, we require preciseness. No fuzziness is permissible. This is a big difference from CV and language modeling / reasoning. The RTL to GDS process is naturally algorithmic because it governs an engineered abstraction stack. If you wish to break free from this stack, and one shot across from microarchitecture to mask sets, then you need to rethink the training data. You can't train on data provided by CAD tools alone and expect to do any better with respect to QoR (perhaps just runtime), and the opportunities for error abound.

# ML for Chip Design: My Perspective

Before discussing ML specifically in the context of chip design, let me first discuss ML in general, and where it has found success.
After establishing the general philosophy of applying ML to problems, we can discuss how it can be applied to various steps in the chip design process.
Link Synopsys' (Igor Markov's) ML for synthesis / CAD pdf.

- Ml for chip design philosophy
- Learn new representations
- Don't sweep random knobs
- See sns
- See boomexplorer and derivative work
- Don't learn how an engineered tool works via regression, learn the internals and improve them
- Within a tool, ml is useful for guiding search and heuristics

## Background

- Media buzz (see Googling)
- PR from EDA CAD companies
- Startup funding requests (see YC)
- Increasing sessions and panels in comp arch and EDA CAD / VLSI conferences
- Look at ML for CAD session in Hotchips
- MLCAD

## My Instinct

I know I've been very critical of these in the past (see Googling RL for placement and LLMs for X in chip design).
But there is room for good stuff too (and most of it uses very classical ML techniques, not deep nets).

### Good stuff

- Heuristic engineering
- Correlation analysis
- RL for natural games
- Coding assistance / documentation lookup

## A Breakdown Domain-by-Domain

### RTL design

- RTL verification collateral / testbenches
- RTL Simulation
- Analog / mixed-signal simulation
- Physics simulation
- IR drop simulation
- Verification
- Synthesis
- Placement
- Routing
- OPC
- Standard cell design
- ATPG / post-silicon validation
- TCL scripting
- RFIC / photonics design

## Where is the Opportunity?


