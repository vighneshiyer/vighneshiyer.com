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

- https://www.youtube.com/watch?v=8n2HLp2gtYs&t=2116s ( SiFive Tech Talk on Accelerating AI: Past, Present, and Future by Krste Asanovic )
  - Krste has a slide at the very beginning about his take on what is computer architecture

- https://www.youtube.com/watch?v=gzgyksS5pX8
  - Jim Keller: Tenstorrent talk
  - At 25:30: what made computers fast? Transistor count, pipelining, frequency, parallelism, OoO execution, vector units, multi processors, data prefetch, branch prediction, ...
  - The point is computer architecture is about the tradeoffs therein. Furthermore, parallelism extraction is the major thing from the architecture perspective, with the other 'fast' things coming from other areas.

- Background on what is comp arch
- Isca hpca micro have drifted away
  - The multiple tracks
  - No one knows what the papers are about, best papers have nothing in common, prevalence if the hallway track, compare with isca of 10 years ago
  - Also many people are publishing in comp arch because they can't publish in their field, conferences have become a big tent and in doing so there are huge silos everywhere
  - Also some people have began to claim that computer architecture is everything or the vice versa, I want to put a stake in the ground and defend a principled notion of computer architecture
  - Call out fhe, quantum, as particularly egregious, instead of putting the algorithms first they try to shoehorn in the architecture
  - Papers with code methodology has become prevalent exacerbating the situation
  - Abuse of asplos as a dumping ground for random things all over the place, going very far away from the purpose of the conference which was pl and os research that is architecture related
  - Security opportunists, propagandists, call them out, activists, also not related to architecture (but much better than others), enclaves and PMP are relevant
  - Modeling monkeys, calibration quibbling, no true understanding
- What is computer architecture?
  - The essence of hardware acceleration
  - Some discussion of non von Neumann architecture is good but this extreme PIM track stuff has got to go, what are people learning here? What is the point of an academic conference in the first place?
- Look at the ALP article for things I need to pull into this article
