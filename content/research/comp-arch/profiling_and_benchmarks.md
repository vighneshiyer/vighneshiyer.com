+++
title = "Profiling Tools and Benchmark Suites"
date = 2023-12-18
draft = true
slug = "profiling-tools-and-benchmark-suites"
+++

This is my personal enumeration of:

- Profiling tools, papers, and case studies where they might be useful
    - + Papers and blog posts that discuss bottlenecks or inefficiencies in existing systems (applications, runtimes, and OSes)
- Benchmarks used for microarchitectural and system-level optimization

## Benchmark Suites

Specifically, I'm only interested in benchmark suites suitable for microarchitectural optimization and exploration (for relevant application areas e.g. embedded compute, datacenter workloads, HPC).
Not benchmark suites designed to stress test real, running hardware (e.g. Cinebench, Geekbench, the Phoronix Test Suite).

### Microbenchmarks

- Dhrystone
- Coremark

### Vectors

- [Swan](https://github.com/arkhadem/Swan) (vector benchmarks for mobile processors written with ARM NEON intrinsics)

### Embedded

- Embench
- [MiBench](https://github.com/embecosm/mibench)

### Desktop

- SPEC (supposedly)
- BrowserBench 2, 3.0

### HPC

- [MLPerf](https://mlcommons.org/benchmarks/)
- [NASA Parallel Benchmarks](https://www.nas.nasa.gov/software/npb.html)
- [GAP (Graph) Benchmark Suite](http://gap.cs.berkeley.edu/benchmark.html)

### Datacenters

- [DeathStarBench](https://github.com/delimitrou/DeathStarBench)
    - Synthetic web apps using a microservices architecture
- Cloudsuite
    - https://github.com/parsa-epfl/cloudsuite/blob/main/benchmarks/data-caching/client/Dockerfile
    - Notably, these Dockerfiles provide nice shrinkwrapped build scripts and environments for their benchmarks
    - Their base Docker image (https://hub.docker.com/r/cloudsuite/base-os/tags) is compiled for the riscv64 platform
    - Using multi-platform support in Docker via qemu (https://docs.docker.com/build/building/multi-platform/) you can natively compile the target application to riscv64 (without any cross-compilation complexity)
    - A CS294 class project then took the target program binary and its required shared objects from the Docker filesystem and placed them into the buildroot rootfs
- [Renaissance](https://github.com/renaissance-benchmarks/renaissance/)
    - JVM benchmarks in Big Data, ML, and FP

#### FaaS

- These benchmarks were enumerated in [this MS thesis from ETH: "Exploring the Microarchitectural Implications of Serverless Workloads Using RISC-V"](https://www.research-collection.ethz.ch/bitstream/handle/20.500.11850/610314/Starc_Roberto.pdf?sequence=1&isAllowed=y)
- vSwarm / vSwarm-u (Python, Go, node.js)
- FaaSdom (node.js)
- SeBS (Python, node.js)
- ServerlessBench (Java, node.js, C++)
- FunctionBench (Python)

## Profilers

- [DynamoRIO](https://dynamorio.org) - general framework for runtime code instrumentation
    - Fine-grained ARM profiling: https://xl10.github.io/blog/drcctprof.html
    - Instruction trace extraction: https://github.com/DynamoRIO/dynamorio/blob/master/api/samples/instrace_x86.c
    - Memory/branch trace extraction: https://dynamorio.org/page_drcachesim.html
- Linux Perf
- [Prodfiler](https://prodfiler.com/) a commercial "whole-system" profiler which seems to use eBPF
    - They claim to be able to analyze stack traces of managed runtime languages, but that seems hard or impossible without any instrumentation of the runtime
- [Scalene - CPU/GPU/Memory Python Profiler](https://github.com/plasma-umass/scalene)
    - Their README has plenty of case studies where they fixed some bad behavior / did optimizations using their profiler

### Prior Work in "Vertical" / "Universal" Profiling

In general, there is *some* prior work, but it is limited in scope and old.

- [VIProf: Vertically Integrated Full-System Performance Profiler (2007)](https://sites.cs.ucsb.edu/~rich/publications/viprof-ngs.pdf)
- [Reconfigurable vertical profiling framework for the android runtime system (ECS 14)](https://dl.acm.org/doi/abs/10.1145/2544375.2544379)
- [VrtProf: Vertical Profiling for System Virtualization (Sherwood, 2014)](https://ieeexplore.ieee.org/abstract/document/5428518)

## Identifying Bottlenecks / Inefficiencies

- [The Linux Scheduler: a Decade of Wasted Cores (EuroSys 16)](https://people.ece.ubc.ca/sasha/papers/eurosys16-final29.pdf)
    - Linux scheduler performance bugs discovered with careful profiling of scheduling activity
- [Measuring Mutexes, Spinlocks and how Bad the Linux Scheduler Really is](https://probablydance.com/2019/12/30/measuring-mutexes-spinlocks-and-how-bad-the-linux-scheduler-really-is/)
    - More Linux scheduler oddities and profiling
- [Tracing System CPU on Debian Stretch (Cloudflare)](https://blog.cloudflare.com/tracing-system-cpu-on-debian-stretch/)
- [Pprof++: A Go Profiler with Hardware Performance Monitoring (uber.com)](https://news.ycombinator.com/item?id=27118541)
    - https://www.uber.com/blog/pprof-go-profiler/
    - They made the Go Profiler a bit more 'full-stack', but the use cases were all internal and not discussed
    - The HN link has interesting comments on which metrics would be interesting to extract from a profiler
    - They have some good links to survey/high impact papers on profiling
        - [Hardware Performance Monitoring for the Rest of Us: A Position and Survey](https://inria.hal.science/hal-01593009/document?uclick_id=258370bf-d3db-44ff-8497-8dd57a7cef1c)
        - [A Top-Down method for performance analysis and counters architecture](https://ieeexplore.ieee.org/document/6844459?uclick_id=258370bf-d3db-44ff-8497-8dd57a7cef1c)
- [Virtual Machine Warmup Blows Hot and Cold](https://arxiv.org/pdf/1602.00602.pdf)
    - An interesting paper that suggests that microbenchmarks are inconsistently 'warmed' on VMs with GC and JIT and often don't reach 'steady-state' performance
    - Motivates work in improving VM profiling and determinism
