+++
title = "Computer Architecture Simulation"
date = 2023-08-23
draft = true
+++

## Simulation

### Multi-Level, Incrementally Refined and Sampled, Simulation

- [An Integrated Multi-Level Simulation Infrastructure for Fast and Accurate Evaluation of Complex Workloads](https://docs.google.com/document/d/1ZIl1rExD4e5BkUvhTFgKjWBVJPtYICGU_o3SSJVmypI/edit)

### ???

- We can probably completely change the paradigm of building RTL simulators
    - If we have a content addressed HDL, then we can maintain a global cache of build artifacts
    - Then incremental simulator recompilation becomes a lot easier and much faster
    - There is no reason why building a RTL simulator must be done from scratch for every new piece of RTL that's just parameterized a bit differently but is 99% the exact same
    - The new LiveSim paper might have something to say about this / same with the new LiveHD paper for Verilog lowering
    - Trying to hack this into Verilog or Verilator is unreasonable - a new HDL and IR with well defined semantics and clean separation between testbench functionality and core simulation constructs is the key
    - Aggressive fine-grained caching and global caching (across machines using a network attached cache) is the solution
    - Once someone builds a base Chipyard SoC RTL simulator, no one should ever have to do that again
        - Small nits / changes should cause just a small recompilation cost
        - One issue is dealing with cross-module (cross-hash reference in our case) optimizations
        - As usual, there should be a 'fast' mode which doesn't do much optimization, but there should also be a mode that does more aggressive opt
