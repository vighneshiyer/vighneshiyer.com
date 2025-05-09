+++
title = "Tracing and Profiling Discussion with Dick Sites"
date = 2024-03-23
draft = true
slug = "tracing-and-profiling-discussion-with-dick-sites"
+++

- Perf debugging and optimization is so one-off, that any interesting cases have to be considered uniquely. You can't generally extract anomalies via some kind of ML model
  - Common techniques are obvious so there is no need to use any models to show them. People would have already applied them - low-hanging fruit.
- Core-level bottlenecks are revealed via 5 perf counters that have very low latency and can be sampled frequently by software
  - instruction fetch utilization, issue slot (resident, issued, retired) counters
  - these form a uarch 'basis' for all other perf events in a given core uarch. you don't need anything else.
- "learn 2 predict" is too ridic
- Per-instruction latency / bottleneck attribution is mostly useless
  - Could have usefulness for small computer kernels
- System-level bottlenecks are crucial, you need to trace with a consistent timebase across the entire system
- Driving app. Make everything concrete. What exactly are you trying to optimize?
  - Can't just randomly explore the space of things that could be wrong.
  - https://danluu.com/perf-tracing/
- kutrace (https://github.com/dicksites/KUtrace) is good about instrumenting all the parts of the kernel that are crucial to performance tracing
  - Upstreaming this is impossible unless a big company lends its support. Kernel devs already feel there are enough tracepoints and they don't want to maintain new ones.
  - tracepoints are in the wrong places - need to carefully examine the kernel/user space boundary when tracing
    - primarily used for kernel developers, not for software engineers
- security people are full of shit. making counters not visible to userspace is worthless. just give them a CSR to turn off access and let them feel happy.
- why do we need microarchitecture detail in order to do our tracing / software optimization work? are there really new uarch features or nits that could help, or it is just a matter of system-level optimization?

- https://github.com/dicksites/KUtrace
- Author of "Understanding Software Dynamics", an excellent book on performance optimization and profiling
- https://www.youtube.com/@dicksites/playlists (his videos are excellent)
- https://www.youtube.com/watch?v=QBu2Ae8-8LM ( Dick Sites - "Data Center Computers: Modern Challenges in CPU Design" )
  - Slides: https://www.pdl.cmu.edu/SDI/2015/slides/DatacenterComputers.pdf
- Continuous Profiling: Where Have All the Cycles Gone? (https://www.cs.cmu.edu/afs/cs/academic/class/15745-s05/www/papers/p357-anderson.pdf) (a good paper from the DEC era)
- https://chatgpt.com/share/680ea221-56d0-8001-a1d3-3df9ab157f74
- https://www.sigarch.org/performance-counters-id-like-to-see-part-ii/
