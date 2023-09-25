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

- Sea-of-nodes in-memory representation ([lgraph](https://woset-workshop.github.io/PDFs/2019/a7.pdf), [lnast](http://masc.soe.ucsc.edu/docs/woset19b.pdf)) of a hardware circuit vs statement-oriented [three-address code](https://en.wikipedia.org/wiki/Three-address_code) representation (FIRRTL, Circt IR, LLHD)
    - https://darksi.de/d.sea-of-nodes/ (very nice practical intro to sea-of-nodes in the context of JS)
    - https://stackoverflow.com/questions/69061268/is-llvm-ir-a-graph - LLVM IR isn't a graph, but the compiler passes might use analysis passes that construct graphs that correspond to the IR (CFG, DFG)
        - SelectionDAG is a true graph IR used for instruction selection within LLVM's pipeline (https://llvm.org/docs/CodeGenerator.html#introduction-to-selectiondags)
    - Semantic Reasoning about the Sea of Nodes (https://inria.hal.science/hal-01723236/file/sea-of-nodes-hal.pdf)
    - Original paper by Click [A Simple Graph-Based Intermediate Representation](https://www.oracle.com/technetwork/java/javase/tech/c2-ir95-150110.pdf)
    - GraalVM JIT optimizer (https://medium.com/graalvm/under-the-hood-of-graalvm-jit-optimizations-d6e931394797) - uses sea-of-nodes representation under the hood
        - [Graal IR: An Extensible Declarative Intermediate Representation](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.726.5496&rep=rep1&type=pdf)
