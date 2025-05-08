+++
title = "Building the Next VLSI Tools"
date = 2023-03-01
draft = true
slug = "the-next-vlsi-tools"
+++

- Andrew Khang's Solvers, Engines, Tools and Flows: The Next Wave for AI/ML in Physical Design (ISPD 24): https://dl.acm.org/doi/10.1145/3626184.3635277

- Openroad is dumb working on vanilla flows that they will always lose out on (I know they were paid just to do that though :(, very sad uninspired DARPA people)
- They should work on incrementalism, global fragment cache for generic gate mapping, Boolean opt, and even tech specific mapping with clock constraints and physical awareness
- They can also work on better irs for semantics preservation and better qor vs verilog ingestion
- They can work on egraphs for a generic framework of optimization
- So many interesting things
- Unit testing for physical design iteration
- Apis for library like embedding of cad tools
- Opening up the database format natively, adding type safety for querying and modifying the database
- Vertical integration of synthesis and pnr and every aspect of the flow in a unified framework
- GPU for rtl sim
- Joules vs voltus vs powerpro
- Multiplier ir
- Mixed abstraction design
- Unifying primitives (e.g. tracing / event API) across models and design layers
