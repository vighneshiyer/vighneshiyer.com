+++
title = "A Complete Guide to RTL Simulation"
date = 2023-08-23
draft = true
slug = "complete-guide-to-rtl-simulation"
+++

## Simulation

- Try to present the problem via Python code, keep it simple and implement a basic single cycle simulator only supporting some simple operators with 2-stage memory element updates and SRAMs
  - Joonho's attempt: https://joonho3020.github.io/articles/rtl-simulation.html
- Discuss what the methods are to improve the performance of this process
  - Preprocessing / optimizing the netlist with boolean optimizations
  - Scheduling the operations for maximum host cache locality and minimize instruction footprint
  - Preserve modules and deduplication
  - Update rule skipping with partial event driven simulation semantics
  - Use specialized hardware: ASIC-based boolean processor grid, FPGAs (direct and decoupled mappings), manycore architectures (Cyclist, TT Blackhole)

### Multi-Level, Incrementally Refined and Sampled, Simulation

- [An Integrated Multi-Level Simulation Infrastructure for Fast and Accurate Evaluation of Complex Workloads](https://docs.google.com/document/d/1ZIl1rExD4e5BkUvhTFgKjWBVJPtYICGU_o3SSJVmypI/edit)

### Prior works in RTL Simulation

- State of the art Verilog simulators
  - Synopsys VCS, Cadence Xcelium
  - Verilator
- Other ones
  - Arcilator (still a WIP)
  - CXXRTL (based on yosys)
  - Vivado XSim (proprietary, but freeware)
  - Icarus Verilog
- Emulation style systems
  - Palladium (of course)
  - [RTLFlow: From RTL to CUDA: A GPU Acceleration Flow for RTL Simulation with Batch Stimulus (ICPP 22)](https://dl.acm.org/doi/abs/10.1145/3545008.3545091)
  - [Manticore: Hardware-Accelerated RTL Simulation with Static Bulk-Synchronous Parallelism (ASPLOS 23)](https://dl.acm.org/doi/abs/10.1145/3623278.3624750)
  - [Accelerating RTL Simulation with Hardware-Software Co-Design (MICRO 23)](https://dl.acm.org/doi/10.1145/3613424.3614257)
  - [Parendi: Thousand-Way Parallel RTL Simulation (Arxiv Preprint 24)](https://arxiv.org/abs/2403.04714)
  - [GEM: GPU-Accelerated Emulator-Inspired RTL Simulation](https://guozz.cn/publication/gemdac-25/gemdac-25.pdf) (DAC 2025, NVIDIA Research)
- SW simulator improvements
  - [A Case for Accelerating Software RTL Simulation by Scott Beamer (IEEE Micro 20)](https://ieeexplore.ieee.org/abstract/document/9099598)
  - [ESSENT: Efficiently Exploiting Low Activity Factors to Accelerate RTL Simulation (DAC 20)](https://ieeexplore.ieee.org/abstract/document/9218632)
  - [Fast behavioural rtl simulation of 10b transistor soc designs with metro-mpi (DATE 23)](https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=10137080)
  - [RepCut: Superlinear Parallel RTL Simulation with Replication-Aided Partitioning (ASPLOS 23)](https://dl.acm.org/doi/abs/10.1145/3582016.3582034)
  - [On Accelerating PyRTL Simulation with Essential Signal Simulation Techniques (ISEDA 23)](https://ieeexplore.ieee.org/abstract/document/10218453)
  - [Khronos: Fusing Memory Access for Improved Hardware RTL Simulation (MICRO 23)](https://dl.acm.org/doi/abs/10.1145/3613424.3614301)
  - [TaroRTL: Accelerating RTL Simulation using Coroutine-based Heterogeneous Task Graph Scheduling (Euro-Par 24)](https://jsm.ece.wisc.edu/docs/lin-europar2024.pdf)
  - [GSIM: Accelerating RTL Simulation for Large-Scale Designs](https://arxiv.org/pdf/2508.02236) (2025, Xiangshan team)

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

### FPGA Accelerated Simulation / RAMP Project

- https://github.com/palmer-dabbelt/flo-llvm
- https://github.com/palmer-dabbelt/libflo
- Chisel DREAMER emulation platform: https://wiki.eecs.berkeley.edu/dreamer/Main/20141203Notes
- https://web.archive.org/web/20230927151250/http://ramp.eecs.berkeley.edu/
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2005/CSD-05-1412.pdf (RAMP: Research Accelerator for Multiple Processors - A Community Vision for a Shared Experimental Parallel HW/SW Platform)
- RAMP gold: https://ieeexplore.ieee.org/document/5523116

### Emulation

- https://onlinelibrary.wiley.com/doi/epdf/10.1002/ecjc.20193 (Sahara: Massively Parallel Dedicated Hardware for Cycle-Based Logic Simulations, Fujitsu)
- https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1585480&tag=1&tag=1
- https://patents.google.com/?q=(emulation)&inventor=William+F.+Beausoleil&oq=inventor:(William+F.+Beausoleil)+emulation&sort=new

### Parallel RTL Simulation Models

- BSP: https://en.wikipedia.org/wiki/Bulk_synchronous_parallel (used in Parendi, Verilator parallel partitioning mode, RepCut, and I think also Manticore)
- Bulk batch parallelism: RTLFlow (via SIMT)
- MIMD: Palladium ASIC, Cyclist, Yorktown simulation engine
- IPC / cross-machine distributed compute: Metro-MPI based RTL simulation on timing-insensitive boundaries

### Simulation Models

- A-port networks
- Theory of latency insensitive design
- See lots of random stuff from the RAMP days

### RTL Simulation Traversal Modes

- Level-by-level
- Cone-by-cone (duplication of nodes and re-computation as needed)

### Notes From Joonho

# RTL Simulation

#Research/notes/RTL-Simulation



# Things to read more carefully

- LightningSim: Fast and Accurate Trace-Based Simulation for High-Level Synthesis





---

# Accelerating RTL Simulation

RTL simulation is a unique workload in that it has a lot of control instructions (branches & jumps), large I-cache pressure, and fine-grained parallelism opportunities.

Accelerating RTL simulation is crucial for design productivity.

---

# Ongoing/recent work on RTL simulation

## Archilator (from SiFive)

- Although a lot of the things that the CIRCT people are doing are stupid, they have one new interesting thing. They are building ArcSim, which is a RTL simulator emitted directly from CIRCT (w/o going to system verilog and then verilator). By directly going from the IR to RTL sim, they can preserve/exploit the circuit semantics much better, thus achieving a much higher simulation performance.

  - https://www.youtube.com/watch?v=iwJBlRUz6Vw&ab_channel=LLVM

- The following list presents the tricks that they play to improve the simulation performance

  1. Dedup : If there are multiple copies of the same module, we can deduplicate these modules and reduce the instruction footprint (which alleviates I-cache pressure).

     - This is basically kind of like FAME-5 on software RTL simulation

     - It resulted in nearly a 2x smaller binary size for LargeBOOM

  2. LUT : Instead of simulating combinational logic, we can replace that with lookup tables. So the main benefit is that this is essentially converting a branch instruction (imagine that you are simulating a Mux), to load and store instructions. This reduces the core frontend stalls which are prevalent in RTL simulations.

  3. Register/latency retiming : by removing the register values around from one arch to another, we can change the latency of each arch. So I guess this is about searching for a good balance between the arcs?

  4. Loop re-rolling : We can reduce the binary footprint by re-rolling the loop.

- They also can play tricks during the compile time to reduce the compile time. They basically have a way of emitting separate files for each arch such that the LLVM backend can consume them in parallel, thereby reducing the compile time.

- Simulation performance improvement is impressive.

  - Large Rocket : 100 KHz (2.6x vs verilator)

  - Large BOOM : 10(?) KHz (1.9x vs verilator)

- Overall impression is

  - Reducing the binary footprint & alleviating the branch predictor pressure seems to the most important factor when it comes to RTL simulation

- QnA

  - Fake comb loops makes verilator slow (the register as a whole seems to have a comb loop, but if you break down the register bit by bit, there isn’t a comb loop). However, Archilator doesn’t consider this, or try to blast out the registers to prevent this problem (they are using rocket & boom which doesn’t have these fake loops anyways).

  - Have you used PGO to compile verilator? Also, when using verilator, you have to use `-Oz` or `-Os` to reduce the binary footprint size. (The CIRCT people used the `-O3` flag which isn’t the best flag for verilator)

- HW-IR : Remember that FIRRTL used to have something similar like this?



## Essent

### Dynamically scheduled vs statically scheduled RTL simulation

- Dynamically scheduled (a.k.a event driven) : The RTL circuit is broken up into a graph. Every cycle, the simulator performs a BFS and if a node is active in that cycle, the nodes is simulated.

- Statically scheduled : The RTL circuit is statically scheduled during compile time. You can think of a gigantic C++ code that represents the entire designs per cycle behavior. Unlike the dynamically scheduled simulation, it can’t skip parts of the design.

### Problem that it is trying to solve & the solution

- Modern RTL designs are big. Hence, the overhead of dynamic scheduling is larger then the benefit of being able to skip parts of your simulation.

- To get the best of both worlds, instead of having fine-grained partitions of the design and a dynamic scheduler, ESSENT partitions the design into a coarse grained acyclic graph. Since the partitions are coarse grained, the scheduling overhead is small, and we can skip large parts of the design.

### QnA

- How close is the partitioning to the theoretical maximal?

- How would the designer provide “hints” to the compiler such that it can guide the partitioning decisions? Or would this be irrelevant, and would you just want to perform a min-cut recursively to generate acyclic graph partitions?

- Also how would we leverage the correlation between the partition activities to improve simulation performance?

- Value prediction??? Would need to do some profiling, or are there interfaces where this is a bit more easy??? If there is data signals going through this interface, it wouldn’t make a lot of sense. Control signals are a bit easier to predict, but it is also difficult to find boundaries that are only control signals.



## Repcut

- Repcut duplicates a small amount of RTL nodes to remove the intra-cycle dependencies between the partitions.

- Also, it has a method to better predict the execution time of each thread, thereby achieving a good balance between the cores.

- May not have clear backdoor access (`readmemb`, `readmemh`), can only simulate synchronous circuits (cycle level simulation granularity)



---



## Random things that might be interesting to try out

- Comparing the performance of FAME-5 vs Repcut. In theory,  we can use FAME-5 infinitely for software RTL simulations as the main limiting factor on FPGAs are critical paths. Given a multicore SoC, how much performance boost can we get by using FAME-5? If we do, where is the performance boost coming from: can we come up with detailed performance breakdowns? Also, is there a way of not using LI-BDNs to perform FAME-5? The first step of this would be to quantify the difference between FAME-5 metasims vs non-FAME-5 metasims using FireSim for a multicore system.

- Another interesting direction would be to understand the microarchitectural implications of RTL simulation. That is, where is the core stalling, what are the critical instructions, how does the memory access pattern look like, how does scaling to multicore systems affect simulation? We don’t have a good understanding of this workload, and I have a feeling that there may be interesting microarchitectural optimization opportunities. We are in a very good position to investigate this. The first step would be to port verilator into RISC-V and run RTL simulations on BOOM. Then, we can use the event-tracking API (or just some hardware counters) and TIP/TEA to understand where the core is getting stalled.

- Another option would be to directly emit LLVM bitcode to avoid compiling C++ code which takes up a lot of time for verilator, archilator, and ESSENT. Also, if we had a content addressed language that can cache certain parts of the design, we can skip executing the passes for that part of the circuit to further reduce the compile time.
