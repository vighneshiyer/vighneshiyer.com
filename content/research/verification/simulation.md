+++
title = "Computer Architecture Simulation"
date = 2023-08-23
draft = true
+++

## Simulation

### Multi-Level, Incrementally Refined and Sampled, Simulation

- [An Integrated Multi-Level Simulation Infrastructure for Fast and Accurate Evaluation of Complex Workloads](https://docs.google.com/document/d/1ZIl1rExD4e5BkUvhTFgKjWBVJPtYICGU_o3SSJVmypI/edit)


### Prior works in RTL Simulation

- State of the art Verilog simulators
  - Synopsys VCS, Cadence Xcelium
  - Verilator
- Emulation style systems
  - Palladium (of course)
  - [RTLFlow: From RTL to CUDA: A GPU Acceleration Flow for RTL Simulation with Batch Stimulus (ICPP 22)](https://dl.acm.org/doi/abs/10.1145/3545008.3545091)
  - [Manticore: Hardware-Accelerated RTL Simulation with Static Bulk-Synchronous Parallelism (ASPLOS 23)](https://dl.acm.org/doi/abs/10.1145/3623278.3624750)
  - [Accelerating RTL Simulation with Hardware-Software Co-Design (MICRO 23)](https://dl.acm.org/doi/10.1145/3613424.3614257)
  - [Parendi: Thousand-Way Parallel RTL Simulation (Arxiv Preprint 24)](https://arxiv.org/abs/2403.04714)
- SW simulator improvements
  - [A Case for Accelerating Software RTL Simulation by Scott Beamer (IEEE Micro 20)](https://ieeexplore.ieee.org/abstract/document/9099598)
  - [ESSENT: Efficiently Exploiting Low Activity Factors to Accelerate RTL Simulation (DAC 20)](https://ieeexplore.ieee.org/abstract/document/9218632)
  - [Fast behavioural rtl simulation of 10b transistor soc designs with metro-mpi (DATE 23)](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10137080)
  - [RepCut: Superlinear Parallel RTL Simulation with Replication-Aided Partitioning (ASPLOS 23)](https://dl.acm.org/doi/abs/10.1145/3582016.3582034)
  - [On Accelerating PyRTL Simulation with Essential Signal Simulation Techniques (ISEDA 23)](https://ieeexplore.ieee.org/abstract/document/10218453)
  - [Khronos: Fusing Memory Access for Improved Hardware RTL Simulation (MICRO 23)](https://dl.acm.org/doi/abs/10.1145/3613424.3614301)

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
