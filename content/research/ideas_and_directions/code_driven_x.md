# The Missing Parts of Code-Driven X

## The Technical Elements

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
  -
