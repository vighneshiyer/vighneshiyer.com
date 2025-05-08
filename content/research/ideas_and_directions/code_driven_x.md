+++
title = "Code-Driven X"
date = 2022-08-30
draft = true
+++

# The Missing Parts of Code-Driven X

- Code-specified abstractions
- Building abstractions on top of abstractions - apply the EDA CAD methodology to other domains
- But focus on the visual aspect of what you're describing to avoid getting bogged down in code when design is actually visual-first. Let the code work for you wrt metaprogramming, generation, and constraints.
- This essentially is about digital twins for everything (https://en.wikipedia.org/wiki/Digital_twin)

## The Technical Elements

- Crdt, git with collaboration, two way sync

1. Two-way synchronization between code and visualization / 'compiled form'
  - Some constraint language on the code side and the generation of new/modified constraints from user manipulation of the visualization
  - I still believe the visualization generation should be 1-way (code to visual). And deterministic / reproducible across machines.
1. CRDT (or Unison-like content hashing)
  - This is about collaborative live editing.
  - Code-aware (language-AST-aware) semantic CRDT for mixed language codebases (for Markdown or English, this is well understood, for code, not so much)
1. eDSL with host language support for instrumentation wrt what code goes into what elements in the visualization
1. A new VCS with collaboration in mind.

- Generic library that can combine all of the above + a visualization GUI + a constraint language

## Other Notes

- Applications
  - visualizations / graphs
  - schematic design
  - analog layout / package design
  - diagramming
  - 3D CAD
  - PCBs
    - Skidl, JITX, https://news.ycombinator.com/item?id=43798832 (tscircuit), atopile
  - process engineering / factory floor organization
  - blueprints + building / civil engineering
  - procedural architecture and city design
  - chemical and molecular design
  - slides (presentations)
  - Electrical System Design (Wiring, Schematics, Routing)
  - Scientific Data Visualization (Graphs, Plots, Charts)
- Dan's thesis chapter about diagram (schematic) to code
  - BAG, Layout21, Substrate
- Substrate constraint-based pcell generation: https://docs.google.com/presentation/d/1j4JUvgg2DLOeBrQIcAwB0DhurXiOmv6OqGOrCxC9REc/edit#slide=id.g331fb444408_0_45
  - Many good observations were made in this talk. I will summarize them below.
  - Knowing which line of code -> which polygon in the layout is crucial. With a general purpose language, the best you can do is inject a source annotation macro at the point where the `Rect` is instantiated, but that doesn't tell you how (the trajectory of function calls) that `Rect` got created! There is no good support for this in host languages, which motivates the need for a custom DSL. Although I still think this is the wrong strategy - it would be better to thoroughly instrument the frontend language code via a compiler plugin or otherwise.
    - Inevitably, you will create programming features in your custom DSL and it will become a pain. Constraining the custom DSL to pcells will feel limiting in the near future.
  - Constraint-based layout is the right move. Imperative placement and routing (even with 'automatic' via drops) isn't good enough from the ergonomic perspective (and it makes two-way sync even harder).
  - Solving linear and non-linear constraints simultaneously can be done using z3 (it will basically do this constraint ordering and iterative solving for you). Gurobi can do this too.
  - OpenSCAD and SolveSpace are good inspirations, SolveSpace seems to be constraint driven while OpenSCAD seems to be imperative placement-based
  - Trying to use constraint solvers is always a bit iffy. They have various limitations although they have some ability to get optimal solutions.
    - Rather, formulate things with an arbitrary objective function and use either genetic algorithms, simulated annealing, or gradient descent techniques. Leverage parallelism.
- Programmatic architecture seems interesting
  - OK I must first admit the SOTA here is very hard to beat: https://en.wikipedia.org/wiki/Building_information_modeling#4D (see Autodesk Rivit)
  - Let's say I want to build a home and I have a floor plan in mind - can I describe that with a combination of code and natural language modified-visualization?
  - Then I want to programmatically fill that home with stuff and ideas - ideally synthesized for me with some vision and 3d generative models with some constraints I specify in code
  - Consider city planning games - e.g. cities skylines - all of the stuff drawn visually should have a 1-1 correspondence with constraint-oriented code along with duplicated abstractions w/ parameterization. e.g. Drawing a line of trees to line a block with a given spacing can be represented abstractly right? OK but this has nothing to do with a home, which is an abstraction boundary of city planning by the way.
  - And then you can run simulations for the particular plot of land wrt foundations, flood and earthquake resistance, sunlight analysis, temperature hotspots and performance of the HVAC system, wind analysis, temperature gradients, humidity, I can imagine there are a bunch more algorithmic analyses that can be done that provide a rigorous automatic checklist for architects (there should be CI for architecture). Foliage and trees, garden, flowers.
  - Ideally you can explore many building materials, regular wood framing, steel reinforced framing, rammed earth, brick. Explore their performance wrt the aspects above via simulation.
