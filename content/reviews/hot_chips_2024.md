+++
title = "Hot Chips 2024 and Dr. Eric Quinnell's Talk @ Berkeley"
date = 2024-08-28
+++

## Conference

- See chipsandcheese articles
  - https://chipsandcheese.com/2024/08/27/teslas-ttpoe-at-hot-chips-2024-replacing-tcp-for-low-latency-applications/
  - https://chipsandcheese.com/2024/08/26/hot-chips-2024-qualcomms-oryon-core/
- Xiangshan: https://www.servethehome.com/xiangshan-high-performance-risc-v-processors-at-hot-chips-2024/
- See other blogs too

## Eric Quinnell's Talk

Attach the slides
file:///home/vighnesh/Downloads/QuinnellBerkeleyLecture_2024_final.pdf

- https://x.com/ChipsandCheese9/status/1828584468741005685

- Benchmarking is still a problem
  - specjbb is still relevant for AWS (https://www.anandtech.com/show/16315/the-ampere-altra-review/7)
  - in particular, presilicon
  - how to reproduce effects of JS runtimes without having to spawn those runtimes?
  - how do we simulate a browser (with all its graphical components and effects) pre-silicon?
  - ipc in isolation isn't enough right? if we are spinning the scheduler thread fast, it doesn't actually matter right? IO bound DC workloads won't benefit from more core power senselessly.
      - Is x86 still better in cloud when we're using compiled workloads (C++)? How is Amazon's case?
      - Are cloud workloads bursty enough that wide superscalar with very high frequency is important? Many core ARM seems better in that case. What is the benefit of custom ARM cores vs ARM IP?
  - How does ARM evaluate their cores? Perf model (trace vs execution driven)? Do they do 'multi-level' injection oriented simulation? Is emulation ever used in perf validation / modeling / research? Do they tune performance on RTL directly in some cases? How do they perform limit studies (what-if analysis)?
- trace-driven simulation
  - explain google thing
  - does it make sense
  - how to deal with time-dependent effects?

- WD riscv nvme over fabric - pretty interesting and sleeper agent

- cars and weight security
- quake 3 trick for activation functions vs explicit fpu transcendental functions
- tenstorrent weird arch / tpu vs manycore arch
- CPU uarch research in academia: difficult to compare without lots of engineering effort
- is the beefy core uarch better for cloud or not? it seems hard to figure out. seems dependent on whether using JVM/VMs vs compiled code, icache footprint, and how bursty ipc actually is. clearly the wimpy core strategy failed, but why exactly? there is a difference still between the neoverse/ampere cores that AWS loves vs big x86 AMD/Intel cores still. SMT vs no SMT.
  - there is different things I keep hearing - x86 being king due to high frequency and boost and memory/compute balance vs ARM being king due to high core count and high IPC

### Joonho's Notes

# Mojo latency optimization?

- Latency isn't a first order problem, but you want it to be low enough to keep the machines
    - Especially during trainging when performing the backprop, need to send out deltas quickly to other machines quickly enough

# Will Tesla stay in the CNN world? Why optimizing so much for CNNs?

- Will try using LLMs in the future, but HW just not there yet in Tesla
- Also, vision based inference is their first order concern after all...
- Some stuff about how real brain works and importance of network connections vs actual compute

# 30% utilization for these devices?

- 30% is optimisitic
- Why not just throttle the compute?
    - You can, but leads to other inefficiencies?
- Missed in the middle...

# Cerebras

- The BW of these machines are limited by shoreline BW, making it unsuitable for training
- For inference, it will have higher performance as you don't go off chip. Everything is in SRAMs
- However, too expensive to use for inference. Sure, it will have high performance but per/watt will be low
- Also, chips having defects is a huge pain in the ass
    - If a chip is broken, they turn off the entire column as if you route around a chip, the BW is tanked and the performance hit isn't worth maintaining that column
- Nobody has the money to buy these things rip

# Using Speedometer as benchmarks

- Speedometer is most representative of mobile stuff
    - Downloads all sorts of Javascript and executes them
- For datacenters, Spec JVM 11(?) is pretty good
    - Supermarket website
    - Representative of Amanzon workloads
    - The language (runtime behavior) actually doesn't matter all that much
    - It is the highly concurrent nature of these applications that they care about
    - A lot of request level parallelism for these apps and they measure both tail latency & throughput

# X86 vs ARM

- X86 is losing on database stuff because of SMT & variable length decode
- Storage demands for dabase is going up. Need small controller cores for NVMe control -> RISC-V & ARM can do well there too (wester digitial is doing stuff here)


