+++
title = "Hardware Intermediate Representations (Hardware IRs)"
date = 2023-08-23
draft = true
+++

## Ideas about HW IRs

Views that allow flat (no module hierarchy), low-level (no behavioral constructs), and semantically meaningful (no aggregates) passes to be written that end up operating on a high-level netlist that has all these features to preserve semantics. Critically, there needs to be a netlist mutation schema that can be translated from low-level to high-level unlike most passes that work the other way.

- Type-level encoding of which primitives exist in a given netlist.
    - https://news.ycombinator.com/item?id=37251385

> The "Trees That Grow" paper, on the other hand, is about reusing the same AST but gradually adding more information to the nodes as you progress through the compiler

- Natively represent RTL netlists as graphs
    1. Per-language internal (in-memory) representation. This can be adjacancy list + node attribute table and a regular graph manipulation library (e.g. Rust petgraph) or something like FGL (https://stackoverflow.com/questions/9732084/how-do-you-represent-a-graph-in-haskell)
        - An Applicative Control-Flow Graph based on Huet's Zipper (http://www.cs.tufts.edu/~nr/pubs/zipcfg.pdf)
    2. Language-independent on-disk representation. Ideally we want both 1 and 2 to be the same, but that might be impossible. Instead the focus should be on a format that is easy to parse into the appropriate data structure for each language. Maybe just a messagepack of JSON that NetworkX can parse too.

- Incremental elaboration of the front-end HDL needs to be coupled with incremental emission of the graph format as well as incremental IR compiler passes too (how can we decide the minimal things to run when the netlist changes?)
- Direct serialization of in-memory objects is a very nice-to-have feature in a host language (Unison), but it does make polyglot difficult, which is a real requirement
