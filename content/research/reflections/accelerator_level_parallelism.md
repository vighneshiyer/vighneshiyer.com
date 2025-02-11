# A Critical Look at the Notion of "Accelerator Level Parallelism"

- https://arxiv.org/pdf/1907.02064

- custom functional units
- parallelism of units
- memory access parallelism
- avoiding von neuman bottleneck
- pipelining
- segmentation and utilization optimization

Improving the performance of any given algorithm comes from only a few sources:

- Exploiting intrinsic data-level parallelism or rewriting the algorithm to make it more amenable to parallelism
  - At the end of the day, intrinsically, this is the only way to improve performance of a given algorithm via hardware acceleration
  - I will call this exploiting *intrinsic parallelism*
- Exploiting features in the hardware that *relate to the programming model* (the ISA, memory system and outstanding requests, Von Neumann architecture, multicore, 'accelerators', specialized functional units) that unlock hardware-level parallelism
  - I would say these implement hardware-level parallelism that are unlocked by the right software-hardware interface
  - They do not improve the intrinsic accelerate-ability of the algorithm
  - They allow the algorithm to reach closer to the theoretical peak of its performance given a particular hardware system

- Consider that there is a theoretical peak performance of any given code running on a von Neumann architecture (this is our base assumption).
  - I concede that non-von Neumann architectures can achieve even higher peaks, although not higher than peaks of the algorithm itself.
  - non-von Neumann architectures come with their own scaling challenges and costs that are often not considered when evaluating such architectures
- We can make wild assumptions - memory access latency is 1 cycle no matter what, maximum ILP will be extracted, we have no limit on functional units, memory bandwidth is unlimited (or something very large), branches are always perfectly predicted even speculatively, there are no pipeline stalls or flushes incurred, nearly unlimited reorder window, prefetches are perfect (which gives us that perfect memory access latency) ...
- Then given these assumptions, there is a theoretical limit, wouldn't you agree?
  - This already assumes acceleration and specialization to the max (save for specialized functional units)
  - Same with memory bandwidth, parallelism, and so forth
- Now, we can find the derating factors on a real architecture. Which ones can you practically improve? What are the limits? How far is each factor from its theoretically max utilization peak?

I want to differentiate between
