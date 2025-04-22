- Specialization identification, DSP Saturn extensions being extracted from kernels alone, and then even functional models, perf improvement estimation, automatic new functional units? So much possibility on the methodology side

- Unsolved questions in general purpose computing
- The marginal cost of an rob entry
- True benchmark construction and evaluation
- Variable length isa vs fixed tradeoffs
- Vliw vs packed simd vs cray vs rvv
- The ideal simt programming model and first principles architecture
- First principles programming model for data parallel algorithms
- Per instruction latency attribution and tracing and automatic perf optimization hints, another uarch difficulty

## Yufeng's Question

> "Principled" way to design CPU / SoC?
>
> In class, we've explored a wide range of design decisions involved in developing a new CPU or SoC. During my work on the 252 project, I encountered many similar challenges.
>
> My approach for the 252 project was to start directly at the RTL level—first implementing functionality, and then iteratively optimizing for performance and other metrics. However, I’ve come to realize that some of the design choices I made early on could have been avoided or improved if I had considered higher-level trade-offs earlier in the process.
>
> This experience has made me curious: is there a principled or structured methodology for CPU/SoC design that helps guide early-stage decisions and systematically evaluates their impact? I would really appreciate hearing more about how experienced designers typically approach this.
>
> Thanks.

Before I answer, take a look at what [GPT-4o](https://chatgpt.com/share/6806b480-f4c8-8004-8fb8-8098d642534a) and [Gemini 2.5 Pro](https://aistudio.google.com/app/prompts?state=%7B%22ids%22:%5B%221I1MeEvPkuonsLywFSO-EcedJnjXo8S5I%22%5D,%22action%22:%22open%22,%22userId%22:%22114971513378697512776%22,%22resourceKeys%22:%7B%7D%7D&usp=sharing) say. I think you will find their words truly uninspiring.

This is a good question. Engineering is *supposed* to feel systematic. You start with a model of various primitives at your disposal and a problem domain, and engineer an optimal solution to solve that problem. In the case of designing a CPU, the primitives are "blocks" that can be composed to form a CPU pipeline (fetch units, decoders, renamers, dispatchers, load/store units, functional units, branch prediction, speculation, etc.) and the problem domain is defined by some benchmarks we think are important.

But engineering is rarely systematic in practice. Consider a similar problem in analog circuit design: the design of an op-amp. There indeed exist many 'systematic' approaches to doing this.

Similar to gm id approach for designing an op amp, typically analog will use block design approach and spec out each block and overprovions or margin them to get the full system performance like in a rf receiver chain
Very good question, roofline gets you some of the way, various types of trace analysis helps too, but ultimately the low level design decisions affect the real model greatly. Eg for an rob there are points in the size where the uarch has to make a step change to accommodate a larger size below that size it is too much overhead and above it is necessary to avoid overhead of the naive technique, similar idea for caches, hard to see this at the system level without implementation
