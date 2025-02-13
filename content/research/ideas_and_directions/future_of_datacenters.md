# Random Things

- Distributed scheduling
- The impact of 3D IC integration in the future

- Optimizing near-disk compute and distributed compute / compute-in-network (on-the-wire compute)

- What if we did partha compute hierarchy thing, physically aware allocation of compute wrt data location, expose those apis to the user, remove this abstraction, what about how this changes programming model and OS design

- Disaggregation vs aggregation we currently see on SoCs
  - DC moves to disaggregation while that may not be the best from efficiency perspective, but is more 'flexible' when it comes to composing new types of compute nodes that are specialized for each workload
  - Can we move to a more homogeneous model in very new SoCs as density continues to scale?
  - The current SoC actually looks quite disaggregated (wrt SLC and other large memory components)
  - To what degree does an OS already do this within a single/double socket system? The primitive being processes rather than VMs.

- "Datacenter on a chip" (https://www.ece.cmu.edu/news-and-events/story/2016/09/datacenter-on-chip.html)
  - Silicon cityscapes: https://www.youtube.com/watch?v=vgfFY10RMhw
  - The chips of the future will have extreme integration
  - 2 directions you can go
    - Continue the trend of disaggregation and then discuss what programming models / APIs / OS / PD / ... to enable good scaling of workloads
    - Fluid SoC - aggregation of small clusters

- Move everything to userspace - especially scheduling decisions (JVM ZIO, ...) (what could we accomplish if there was no preemptive multithreading and only cooperative multitasking?) (but that would require full control and to some degree formal guarantees about the entire software stack)
  - You can prefetch the cache contents of the 'next' thread before it has even been scheduled, as this thread is winding down before yielding, it can begin to prefetch such that the next thread it switches into already has a warm cache! some extra data structures attached to a process are required here.
  - Having semantic control of the scheduler gives you lots of power. The ZIO scheduler is a good example of this. It can still outperform JVM virtual threads because of this.

- This bickering is completely irrelevant to the workload
  - "bickering" related to on-package optical die fiber bandwidth and latency
- Ok Vikram said something that could be useful
  - The research should be around distributed compute near data and how the query engine should target such a system
  - Oh finally Sagar came to the right conclusion, but his point was brushed away immediately
  - The conclusion was to work on programming models that enable this kind of distributed compute system
  - This is actually interesting! We should build a baseline of the system as it exists today, and then propose a new system that tears down all the old assumptions and applications! That is the point of academic research!
