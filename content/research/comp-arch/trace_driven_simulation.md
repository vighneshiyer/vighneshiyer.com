+++
title = "Trace-Driven Simulation and Its Limitations"
date = 2024-03-23
draft = true
slug = "trace-driven-simulation"
+++

## What is a Trace?

## Trace-Driven uArch Models

- Old paper: Can Trace-Driven Simulators Accurately Predict Superscalar Performance? (https://pharm.ece.wisc.edu/mikko/oldpapers/ICCD.96.final+.pdf)
  - They already make the case that the answer is no and things will continue to get worse...
  - This was understood in 1996 lol

- MACSim: https://github.com/gthparch/macsim
- Tao (ML model for trace-driven sim): https://arxiv.org/pdf/2404.10921 (some more examples of trace-driven simulators below)
- ChampSim: https://arxiv.org/pdf/2210.14324
  - Example usage of ChampSim for BP/cache design: https://www.cs.sfu.ca/~ashriram/Courses/CS7ARCH/hw/hw2.html
  - https://arxiv.org/html/2408.05912v1 (Correct Wrong Path - an attempt to make Champsim aware of wrong path execution effects since those are hidden in a trace, unless explicitly instrumented)

## Limitations of Trace-Driven Simulation

- Disprove trace driven sim first
  - Start with a single-threaded baremetal application that has no IO interactions at all except DRAM
  - Consider how to model performance impacts of
  - Then consider interaction with a DMA device
  - Then consider other IO devices e.g. NIC
  - Then consider the impact of an OS (thread multiplexing on a single hart)
  - Then consider time-dependent behavior e.g. with a timer for interrupt scheduling (for an OS)
  - Then consider the multi-threaded case
    - Some people think that multi-threaded trace-driven simulation is viable: https://ieeexplore.ieee.org/abstract/document/5762718 but this is very fishy
  - Finally consider the M:N userspace scheduling case for a IO bound application with very high concurrency. Does the 'trace' mean anything anymore? Do we capture the application-level metrics with IPC? This is what actually matters. Does the change in IPC/mispredict rate/etc actually deliver better end-to-end performance or tail latency effects?
    - See TailBench: https://people.csail.mit.edu/sanchez/papers/2016.tailbench.iiswc.pdf
- IPC doesn't matter if it's spinning the scheduler thread, need app level metrics
- DR traces induce 30x core slowdown and memory bw contention and cache pollution
- Fake results when fed into trace driven sim, io appears faster than reality

## Execution-Driven Simulation: The Only Way

- https://nitish2112.github.io/post/event-driven-simulation/

What is out there? ChampSim, and ... that's it.
