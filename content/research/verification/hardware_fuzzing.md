#### Fuzzing / Stimulus Generation

- [ ] FuzzFactory
    - Rohan's oopsla19 paper on domain-specific fuzzing: https://people.eecs.berkeley.edu/~rohanpadhye/files/fuzzfactory-oopsla19.pdf
    - On Rohan's work: very interesting stuff, he has create SOTA software fuzzing libraries, a lot of the same concepts can apply to hardware fuzzing
    - Kevin discussed that his fuzzer should work like JQF - try to generalize the way in which random injections can be inserted into the generator. It should be just a matter of customizing the interface for randomness from Scala.util.random to a fuzzer which can fix a random knob return value.
    - [ ] Waypoint Guided Fuzzing
- [ ] DirectFuzz: https://www.bsg.ai/papers/Hardware_Fuzzing_DAC_2021.pdf See the results using rfuzz DirectFuzz: Automated Test Generation for RTL Designs using Directed Graybox Fuzzing https://58dac.conference-program.com/presentation/?id=RESEARCH1111&sess=sess290
- [ ] Silifuzz (Trippel)
    - Silifuzz: https://arxiv.org/pdf/2110.11519.pdf
- TheHuzz: Instruction Fuzzing of Processors Using Golden-Reference Models for Finding Software-Exploitable Vulnerabilities https://arxiv.org/abs/2201.09941
- DiFuzz-RTL (https://lifeasageek.github.io/papers/jaewon-difuzzrtl.pdf) (Github: https://github.com/compsec-snu/difuzz-rtl)
- LogicFuzzer (MICRO 22) https://dl.acm.org/doi/fullHtml/10.1145/3466752.3480092
- Grammar-based fuzz testing for microprocessor RTL design https://www.sciencedirect.com/science/article/abs/pii/S0167926022000529
- Snipuzz: Black-box Fuzzing of IoT Firmware via Message Snippet Inference https://dl.acm.org/doi/10.1145/3460120.3484543
- Regression Greybox Fuzzing https://dl.acm.org/doi/10.1145/3460120.3484596
- Rohan Padhye Dissertation talk: https://www.youtube.com/watch?v=eiaEdD__BP4
- Fuzztesting Baseband systems (Baseband Sanitized Fuzzing Through Emulation): https://news.ycombinator.com/item?id=23293714
- Blog post on fuzzing the solidity (crypto) compiler: https://blog.trailofbits.com/2020/06/05/breaking-the-solidity-compiler-with-a-fuzzer/
- Google's gofuzz
- Saturation effect in fuzzing: https://blog.regehr.org/archives/1796
- Hybrid Concolic Testing - http://www.cs.toronto.edu/~chechik/courses07/csc410/hybrid.pdf
- RTLCheck: https://github.com/ymanerka/rtlcheck
- Caroline's papers + dissertation: PerfFuzz, FuzzFactory, Zest (Semantic Fuzzing with Zest), JQF
- Fuzzing Hardware Like Software (30/31/verif)
- HW Support for fuzzing: https://gts3.org/assets/papers/2021/ding:snap.pdf (https://dl.acm.org/doi/10.1145/3460120.3484573)
- https://blog.regehr.org/archives/2148 (High Throughput, formal Methods assisted fuzzing for LLVM)
- https://ieeexplore.ieee.org/document/9810421 (SpinalFuzz)
- chiselverify fuzzing (https://woset-workshop.github.io/PDFs/2021/a08.pdf)
- Tianrui's fuzzing lit review: https://docs.google.com/document/d/1vAl2_MZ9r4fQQYiCPqepfMcgiUHNuD3wJa3QnEvlAlw/edit
- REDQUEEN: Fuzzing with Input-to-State Correspondence (https://www.ndss-symposium.org/wp-content/uploads/2019/02/ndss2019_04A-2_Aschermann_paper.pdf)
- SpinalFuzz: Coverage-Guided Fuzzing for SpinalHDL Designs https://ieeexplore.ieee.org/abstract/document/9810421
- GenFuzz: GPU-accelerated Hardware Fuzzing using Genetic Algorithm with Multiple Inputs https://tsung-wei-huang.github.io/papers/2023-dac.pdf
    - Built on top of RTLFLow (From RTL to CUDA: A GPU Acceleration Flow for RTL Simulation with Batch Stimulus https://tsung-wei-huang.github.io/papers/icpp22-rtlflow.pdf)
- IBM Ziv Machine Learning in the Service of Hardware Functional Verification https://link.springer.com/chapter/10.1007/978-3-031-13074-8_14#Sec6

### Fuzzing

- https://github.com/wcventure/FuzzingPaper#difuzzrtl-differential-fuzz-testing-to-find-cpu-bug-sp-2021
- https://github.com/jdnklau/fm-ml
- https://github.com/Gy-Hu/HW-Formal-Paper
- Logic Fuzzer (https://dl.acm.org/doi/abs/10.1145/3466752.3480092)

## GenFuzz Paper

- The basic assumption of this paper and other fuzzing papers is that the fuzzing efficiency / impact is limited by the simulator throughput, but I think the limitation is mostly the instruction generator's controllability and flexbility to explore interesting uArch scenarios. I think improving the generation methodology is more valuable than just improving throughput, which runs into limitations quickly once the design size is large.
- Multi-threaded CPU fuzzing isn't new, but sure GenFuzz is the first to do it for hardware fuzzing
- RTLFlow is capable of more than 80x speedup with a large batch size (should be up to 1024x with 1024 GPU threads). So 80x speedup must be limited by the CPU portion of the fuzzing iteration (selection, mutation, and task orchestration). Is this the case?
- The authors consider random testing (by setting mutation rate = 1) and removing their incremental coverage algorithm for input selection. Can we also consider feedback-free fuzzing? In our observation, feedback is often not that impactful! Which is different compared to software fuzzing.
- GenFuzz's better performance over DiFuzzRTL when looking at number of instructions being fuzzed has nothing to do with the GPU speedup right? This is solely due to the GA and coverage-maximization algorithms?
- Is the length of the simulated time the same regardless of how long (in cycles) the programs take to execute? Do you just take the maximum time until the all the PCs have reached the bottom of the program?
- What are the primitives used by your instruction generator? How is the input population seeded? Can you inject CSR instructions or loops or atomics or other more interesting stuff beyond straight line code?

### Email to Ben

- The assumption made by this paper (and all the prior fuzzing work) is that the efficiency of fuzzing is mainly limited by the simulation throughput. However, I think that the instruction generator is also critical and may be more important than raw throughput. Did you perform any studies where you varied the amount of primitives the generator can use (e.g. limit which opcodes can be used or addresses) to see whether that had an impact on fuzzing performance comparable to simulator throughput?
- The RTLFlow paper reported a speedup of ~40x vs Verilator when using 16384 parallel stimuli. GenFuzz reports a speedup of 80x over DiFuzzRTL (while using a much smaller batch size). Is the GenFuzz speedup mostly due to the throughput improvement from RTLFlow or the other things you changed in the fuzzing loop (the GA and coverage maximization algorithm)?
- GenFuzz reported results using pure random instructions (by setting the mutation rate to 1) and removing the incremental coverage algorithm. Are there also results with feedback-free fuzzing (and pure random mutation)? In our observation, coverage feedback using the two metrics described here (mux toggle / difuzz reg state hash) doesn't make fuzzing much more efficient. Furthermore, do you know how many (the proportion) of the mutated stimuli are saved into the next population? Does the population size grow with the number of iterations?
- Does RTLFlow assume that all the stimuli are the same length (in cycles)? Are there 'dead' cycles being simulated when different stimuli have a different number of instructions?
- GenFuzz reports an advantage over DiFuzzRTL even when the number of instructions being simulated is fixed. This advantage can't come from the multi-CPU/GPU architecture right? So it comes solely from the fuzzing algorithmic improvements?
- What are the primitives used by the instruction generator? Which instructions can be emitted? How is the input population seeded? Can you inject CSR instructions, loops, atomics, or other more exotic things beyond straight line code? Which primitives seem to correlate with better coverage?
- Is there a penalty applied to the reward of an input that's proportional to its length (in instructions committed)? Is there any pressure to keep programs short?

## Fuzzing

- [ ] rtlv
- [ ] Semantic Fuzzing with Zest
- [ ] Silifuzz
    - https://github.com/google/silifuzz
    - https://github.com/google/silifuzz/blob/main/paper/silifuzz.pdf
- [ ] Fuzzing HW like SW
- From SLICE summer 23 retreat
    - Concolic testing for HW (https://ieeexplore.ieee.org/document/9099620) (to augment fuzzing, or to drive fuzzing with formal with a formally analyzable input generator)
    - Semi-formal verification in general
    - Generalized STE
    - IC3 (https://theory.stanford.edu/~arbrad/papers/Understanding_IC3.pdf) for automated abstraction
    - For my new HDL, I need a native formal backend (see AVR https://aman-goel.github.io/publications/goel2020avr_submission_version.pdf which won the latest HW model checking competition)
        - It seems far more advanced than Symbiyosys
- [x] GenFuzz paper [d:8/22]


## Ideas

Prior processor fuzzing works: DiFuzz-RTL, TheHuzz, LogicFuzzer, ProcessorFuzz (https://deepai.org/publication/processorfuzz-guiding-processor-fuzzing-using-control-and-status-registers), Fuzzing Hardware Like Software, BugsBunny: Hopping to RTL Targets with a Directed Hardware-Design Fuzzer
- TheHuzz (https://arxiv.org/abs/2201.09941)
- BugsBunny (https://download.vusec.net/papers/bugsbunny_silm22.pdf)
- ProcessorFuzz (https://arxiv.org/pdf/2209.01789.pdf)
- RFuzz
- DiFuzz-RTL
- DirectFuzz (https://ieeexplore.ieee.org/stamp/stamp.jsp?arnumber=9586289)
- TargetFuzz (https://dl.acm.org/doi/abs/10.1145/3488932.3501276)
- PyH2 (processor inst generator)

- See me and Kevin's notes: https://docs.google.com/document/d/1eNT_bgSnVkjymvXULtAhMia81HmWfJxphnfedc1diX0/edit
- Tianrui's fuzzing review: https://docs.google.com/document/d/1vAl2_MZ9r4fQQYiCPqepfMcgiUHNuD3wJa3QnEvlAlw/edit
- See prior rfuzz citations (incl ones this week): https://scholar.google.com/scholar?start=20&hl=en&as_sdt=2005&sciodt=0,5&as_ylo=2023&cites=10810537520712045465&scipsc=
    - PSOFuzz: https://arxiv.org/abs/2307.14480
    - SoCFuzzer: https://ieeexplore.ieee.org/abstract/document/10137024
    - Hot Fuzz: https://ieeexplore.ieee.org/abstract/document/10192176
    - All in late 2023 - but all seem to be in security conferences

Tianrui is trying to produce a table of what benchmarks are used, what input stim generators, what feedback metrics, what mutation strategy, what runtime, etc. See his Google doc and write a comprehensive review. Also consider PyH2.

- I need to concretely write this and then the qual proposal document right here. As of 9/20/2023 - I need to get serious - schedule quals, get the proposal written, and then get some initial results. I need to graduate on time. If I want to stay longer, then just do postdoc, no need to think about staying longer as a phd student.
- Specify what to compare against
    - What we're trying to do
    - What is your innovation?
    - How you want to evaluate it?
- Come up with the fuzzing article
    - What to show + baselines for our proposed improvement
- Make the qual slides in HTML
    - One option is to continue with the Zest-style fuzzing / structured mutation vs pure random for hardware and to show that it works
- Look thru our past research log notes from May 2023
    - This is when I concreteized our qual ideas and now:
    - Specifically what data can I get for my quals, something that requires little work and gives the most data
    - Maybe I can do an evaluation of what makes fuzzing effective: throughput, generator features, mutation strategy, feedback metric, etc. - this deserves a proper study since the prior work doesn't do it right

## Proposal

Concretely, we're trying to compare parametric generator driven fuzzing vs random generator fuzzing.

- CRV: generator with pure random input, no feedback
- DiFuzz instgen + mutator: initialize seeds with random instructions, point mutations of the seed directly, feedback used to guide corpus growth
- Zest-style instgen + mutator: initialize seeds with generator outputs, mutation of the bytestream, feedback used in similar manner

- Fuzzing HW like SW does something like this (Zest-style fuzzing <-> grammar-style fuzzing)
- Benchmark: start with rocket core
- fb metric: line, mux-toggle
- success metric: time to find known bugs (see ProcessorFuzz, or HyPyFuzz???), coverage vs time (possibly contrived)

- ProcessorFuzz repo - make sure we can replicate their results (it seems like they are just using a DiFuzz fork)
    - They are using an old version of Rocket and BOOM
    - Just hack on their stuff and make sure we can replicate the time to find BOOM bugs
    - Investigate the difuzz instgen and mutation algorithm

- Describe which tool you would design/build based on the findings
    - ??? -
- https://github.com/bu-icsg/SIGFuzz
- https://github.com/bu-icsg
- https://github.com/bu-icsg/ProcessorFuzz/tree/main
- https://github.com/strongcourage/awesome-directed-fuzzing


Our hypothesis is that parametric generators will perform more effective fuzzing over the random generator + point mutation baseline.
And we hypothesize that both will perform better than CRV with no feedback and no stimulus mutation.

The innovation is both the library for and the implementation of parametric generators for hardware fuzzing (for specific target RTL).

- Mutation: is either on the parametric bytestream directly or just pure random via ScalaRandom PRNG
- Is parametric fuzzing effective for hardware? The metrics will be coverage vs time (or cycles or # insts committed)
- Feedback and success metrics: mux-toggle coverage, line coverage
- What is the target design? Can start with something simpler than Rocket to show viability of the approach
