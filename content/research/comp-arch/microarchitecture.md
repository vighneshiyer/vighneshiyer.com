+++
title = "Fundamental Works in Microarchitecture"
date = 2024-03-23
draft = true
slug = "fundamental-works-in-microarchitecture"
+++

- CS152/252

## Data-Parallel Architectures

- http://people.eecs.berkeley.edu/~krste/thesis.html (Krste's thesis)
- The SCALE architecture: http://scale.eecs.berkeley.edu/papers/abstracts/scale.pdf
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-117.html (Yunsup's thesis)
- https://www.csl.cornell.edu/~cbatten/pdfs/batten-vt-mitthesis2010.pdf (Chris Batten's thesis)
- https://dspace.mit.edu/handle/1721.1/42330 (Ronny's thesis)
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2021/EECS-2021-186.html (Colin's thesis)
- https://www2.eecs.berkeley.edu/Pubs/TechRpts/2016/EECS-2016-1.html (Andrew's thesis, the RISC-V ISA manual + his notes on instruction density wrt ISAs)
- Exploring the tradeoffs between programmability and efficiency in data-parallel accelerators (https://dl.acm.org/doi/pdf/10.1145/2491464) (such a good paper)

## Heterogeneous Systems

- [Cohmeleon: Learning-Based Orchestration of Accelerator Coherence in Heterogeneous SoCs](https://dl.acm.org/doi/abs/10.1145/3466752.3480065)
  - The ML aspect of this isn't that interesting, the workloads are kind of iffy and adhoc
  - BUT, their taxonomy of accelerator memory coherency integration strategies is good

## Modeling

- ML based uArch models
  - Ithemal: Accurate, Portable and Fast Basic Block Throughput Estimation using Deep Neural Networks (https://arxiv.org/pdf/1808.07412)
  - Tao: Re-Thinking DL-based Microarchitecture Simulation (https://dl.acm.org/doi/pdf/10.1145/3656012)
