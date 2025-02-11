What is computer architecture?

Computer architecture is the systematic study of the tradeoffs between programmability and efficiency of hardware. This includes programming models, ISA design,microarchitecture, and the *methodology itself* that enables the study of the aforementioned topics. This includes the systematic design of architectures for a particular domain or set of domains.

So what does this definition include? What is on its periphery versus what is at its core?

What does this definition exclude? Starting from the most stark to the subjects on the edge.

What skills must a computer architect possess and be confident in?

- Hardware acceleration through the ages
  - Start with the most basic von nuemman machine designed to run turing complete programs, as simple as possible
  - Then add more word level insts
  - So the questions are, what kind of specialization did we do, what parallelism did we unlock, and what prior architecture feature was necessary to exploit that parallelism?
- Use this to motivate and taxonomize the types of parallelism we can exploit and how it is done and what motivates it.
- Finally this leads into both the hardware lottery and alp critique articles, this methodology lays bare what actually matters and how there is no real lottery per se and that alp isn't real but just another version of multicore with restricted isa
- Michael pellaure slides during slice all last semester are actually quite good in this direction with their own taxonomy


- A taxonomy of X-level parallelism is a decent idea
- BLP via several functional units (??? BLP seems like an odd anachronism)
- TLP via multicore systems
- ILP via out-of-order instruction scheduling
- DLP via SIMD/SIMT
- MLP (memory level parallelism) via out-of-order / speculative memory dispatch
- Ultimately, everything is DLP. You are bound by how amenable a kernel is
- Exploring the Tradeoffs between Programmability and Efficiency in Data-Parallel Accelerators (https://dl.acm.org/doi/pdf/10.1145/2000064.2000080)
- https://en.wikipedia.org/wiki/Parallel_computing
- There were some 151 slides from Rabaey on the basic techniques used for low power design / parallelism vs pipelining
- https://www.cise.ufl.edu/research/ParallelPatterns/PatternLanguage/Background/ParallelHardware.htm
