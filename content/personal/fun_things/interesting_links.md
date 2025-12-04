+++
title = "Interesting Links"
date = 2024-02-12
draft = true
slug = "interesting-pages-on-the-web"
description = ""
+++

Here are a bunch of things from around the internet that I find interesting.

{{ badge(text="Video",class="red") }}
{{ badge(text="Paper",class="blue") }}
{{ badge(text="Book",class="amber") }}
{{ badge(text="Blog Post",class="green") }}

## Programming

- [Signs that you're a good programmer](https://skatgame.net/mburo//courses/350/signs-that-you-re-a-good-programmer.html)
- [Signs that you're a bad programmer](https://web.archive.org/web/20230405060440/http://www.yacoset.com/Home/signs-that-you-re-a-bad-programmer)
- [Jonathan Blow: "Ideas about a new programming language for games."](https://www.youtube.com/watch?v=TH9VCN6UkyQ)
- [Jonathan Blow: "Preventing the Collapse of Civilization"](https://www.youtube.com/watch?v=pW-SOdj4Kkk)
- [Features of a dream programming language: 3rd draft](https://dev.to/redbar0n/features-of-a-dream-programming-language-3rd-draft-5m6)
- ["The Mess We're In" by Joe Armstrong @ Strange Loop 2014](https://www.youtube.com/watch?v=lKXe3HUG2l4)
- [Carbon is not a programming language (sort of)](https://herecomesthemoon.net/2025/02/carbon-is-not-a-language/0) ([HN link](https://news.ycombinator.com/item?id=42983733))
- [c2: Sufficiently Smart Compiler](https://wiki.c2.com/?CeeLanguage)
  - [c2 wiki](https://wiki.c2.com/) (Lots of excellent articles)
  - [c2: Can Programming Be Liberated From The Von Neumann Style](https://wiki.c2.com/?CanProgrammingBeLiberatedFromTheVonNeumannStyle)
  - [John Backus: Can Programming Be Liberated from the von Neumann Style? A Functional Style and Its Algebra of Programs](https://dl.acm.org/doi/pdf/10.1145/359576.359579)
  - [Daniel Hillis and Guy Steele: DATA PARALLEL ALGORITHMS](https://rsim.cs.illinois.edu/arch/qual_papers/systems/3.pdf)
  - [c2: Connection Machine](https://wiki.c2.com/?ConnectionMachine)
- [Protobuffers Are Wrong](https://reasonablypolymorphic.com/blog/protos-are-wrong/) ([HN link](https://news.ycombinator.com/item?id=45139656)) (a classic)
  - [typical: Data interchange with algebraic data types.](https://github.com/stepchowfun/typical)
- [Rating 26 years of Java changes](https://neilmadden.blog/2025/09/12/rating-26-years-of-java-changes/) ([HN link](https://news.ycombinator.com/item?id=45551450))

### Functional Programming

- [Algebraic Effects from Scratch by Kit Langton](https://www.youtube.com/watch?v=qPvPdRbTF-E)
  - A great talk introducing algebraic effects from first principles and a sketched implementation of [Kyo](https://github.com/getkyo/kyo)
- ["Unison: a new distributed programming language" by Paul Chiusano @ Strange Loop 2019](https://www.youtube.com/watch?v=gCWtkvDQ2ZI)
  - [Unison: The Big Idea](https://www.unison-lang.org/docs/the-big-idea/)
  - [Abilities for the monadically inclined](https://www.unison-lang.org/docs/fundamentals/abilities/for-monadically-inclined/)
- [Algebraic Effects in Practice with Flix](https://www.relax.software/blog/flix-effects-intro/) ([HN link](https://news.ycombinator.com/item?id=45157466))

### Concurrent Programming

- [Concurrency Deep Dive: Async File IO in Java](https://concurrencydeepdives.com/asyncfileio.html)
  - This blog is insanely good: every article is filled with detailed information about the low-level concurrency primitives provided by the hardware and OS
  - [Scala's AsynchronousFileChannel is not truly asynchronous.](https://www.reddit.com/r/scala/comments/1b6k0cs/scalas_asynchronousfilechannel_is_not_truly/)

### Parallel Programming

- [I want a good parallel computer](https://raphlinus.github.io/gpu/2025/03/21/good-parallel-computer.html) ([HN link](https://news.ycombinator.com/item?id=43440174))
- [Halmstad Colloquium: Mike Butts on Kahn Process Networks in Silicon for Real-Time Embedded Systems](https://www.youtube.com/watch?v=sDuuvyUaIAc)
- [LBNL: Introduction to Parallel Computing Tutorial](https://hpc.llnl.gov/documentation/tutorials/introduction-parallel-computing-tutorial)

### Distributed Programming

- [Distributed Systems Programming Has Stalled](https://www.shadaj.me/writing/distributed-programming-stalled) ([HN link](https://news.ycombinator.com/item?id=43195702))

### Data Structures

- [The Hunt for the Missing Data Type](https://www.hillelwayne.com/post/graph-types/) ([HN link](https://news.ycombinator.com/item?id=39592444))
  - The author asks why there aren't any graph libraries in a stdlib when graphs are ubiquitous in many applications. One proposed reason is that graphs come in many forms (directed, hypergraphs, ubergraphs, bipartite) and each form usually has a different API and set of optimized algorithms. Since performance is critical, people often write custom graph libraries. In-memory graph representations are also very diverse and have significant impact on the performance and memory requirements of different types of graphs.
  - [A Response: The "missing" graph datatype already exists. It was invented in the '70s](https://tylerhou.com/posts/datalog-go-brrr/). [HN link](https://news.ycombinator.com/item?id=39606885)
    - The answer is Datalog - express graph algorithms declaratively and let the compiler choose the suitable in-memory representation and synthesize concrete imperative code to implement the algorithm.

### Performance Optimization

- [The LMAX architecture](https://martinfowler.com/articles/lmax.html) in the context of ([HN link: Disruptor-rs: better latency and throughput than crossbeam](https://news.ycombinator.com/item?id=40954104))
- [Parsing Protobuf at 2+GB/s: How I Learned To Love Tail Calls in C](https://blog.reverberate.org/2021/04/21/musttail-efficient-interpreters.html) ([HN link](https://news.ycombinator.com/item?id=41289114))
- [Continuous Profiling: Where Have All the Cycles Gone?](https://www.cs.cmu.edu/afs/cs/academic/class/15745-s05/www/papers/p357-anderson.pdf)
- [Dick Sites: Datacenter Computers - modern challenges in CPU design](https://www.pdl.cmu.edu/SDI/2015/slides/DatacenterComputers.pdf) (see his references too at the end of the talk) ([Talk video](https://www.youtube.com/watch?v=QBu2Ae8-8LM))
- [Dick Sites Youtube channel](https://www.youtube.com/@dicksites/videos)
  - [Stanford Seminar - KUtrace 2020](https://www.youtube.com/watch?v=2HE7tSZGna0)
- [Dick Sites: Understanding Software Dynamics](https://www.oreilly.com/library/view/understanding-software-dynamics/9780137589692/) ([HN link](https://news.ycombinator.com/item?id=40906112))
- [Dick Sites: Benchmarking "Hello, World!"](https://queue.acm.org/detail.cfm?id=3291278)
- [My Top 7 Performance Books for Engineers](https://www.jabperf.com/my-top-7-performance-books-for-engineers/)
  - 1. The Every Computer Performance Book, 3. Understanding Software Dynamics, 4. Systems Performance: Enterprise and the Cloud, 6. The Art of Writing Efficient Programs
- [Brendan Gregg: Performance Analysis Methodology](https://www.brendangregg.com/methodology.html)

### Compilers

- [A catalog of ways to generate SSA](https://bernsteinbear.com/blog/ssa/) ([HN link](https://news.ycombinator.com/item?id=43009952))
- [Building a baseline JIT for Lua automatically](https://sillycross.github.io/2023/05/12/2023-05-12/)
  - Same author as [Copy-and-patch compilation: a fast compilation algorithm for high-level languages and bytecode](https://dl.acm.org/doi/abs/10.1145/3485513), highly competent person
- [2023 EuroLLVM - Tutorial: A whirlwind tour of the LLVM optimizer](https://www.youtube.com/watch?v=7GHXDEIMGIY)

### Rust

- [Speeding up the Rust edit-build-run cycle (davidlattimore.github.io)](https://news.ycombinator.com/item?id=42140164)
- [Crabtime: Zig’s Comptime in Rust (crates.io)](https://news.ycombinator.com/item?id=43415820)
- [Blog Series on "Writing an OS in Rust"](https://os.phil-opp.com/) ([HN link](https://news.ycombinator.com/item?id=44733094))

### Scala

- [Scala 3 Migration: Report from the Field](https://blog.pierre-ricadat.com/scala-3-migration-report-from-the-field) ([HN link](https://news.ycombinator.com/item?id=42964773))
- [Rust from a Scala Perspective: Advent of Code 2024](https://medium.com/@w.pitula/rust-from-a-scala-perspective-advent-of-code-2024-a5060f8beda3)

### Data Processing

- [Modern Polars: A side-by-side comparison of the Polars and Pandas libraries.](https://kevinheavey.github.io/modern-polars/)

### Build Systems

- [The Mill Build Tool Blog](https://mill-build.org/blog/)
  - [Why does Mill use Scala?](https://mill-build.org/mill/depth/why-scala.html)

### Typesetting

- [TeX and Typst: Layout Models](https://laurmaedje.github.io/posts/layout-models/) ([HN link](https://news.ycombinator.com/item?id=43032697))

### Operating Systems

- [The little book about OS development](https://littleosbook.github.io/) ([HN link](https://news.ycombinator.com/item?id=43440473))

## Computer Architecture

### Talks

- [Tuesday @ 1130 ISA Shootout – a Comparison of RISC V, ARM, and x86 Chris Celio, UC Berkeley V2 (2016)](https://www.youtube.com/watch?v=Ii_pEXKKYUg)
- [Berkeley EECS Annual Research Symposium BEARS 2023 - RISC V at Berkeley and Beyond - Krste Asanovic](https://www.youtube.com/watch?v=uThc5K0fErk)
- [David Patterson - A New Golden Age for Computer Architecture: History, Challenges and Opportunities (2019)](https://www.youtube.com/watch?v=kFT54hO1X8M)
- [View from the Top: Professor David Patterson](https://www.youtube.com/watch?v=TK6EPvrmcBk)
- [SiFive Tech Talk on Accelerating AI: Past, Present, and Future by Krste Asanovic](https://www.youtube.com/watch?v=8n2HLp2gtYs) (one of the best talks I've ever seen)
- [Youtube: Yifan&GPU](https://www.youtube.com/@yifangpu/videos)
  - The channel of [Prof. Yifan Sun](https://sarchlab.org/syifan/teaching). Lectures on GPU programming (AMD HIP), computer architecture (introductory class).
- [Has Machine Learning for Systems Reached an Inflection Point? - Martin Maas - ASPLOS 2025 Keynote](https://www.asplos-conference.org/asplos2025/wp-content/uploads/2025/05/maas-asplos25-keynote.pdf)

### Articles / Posts

- [SIMD Instructions Considered Harmful - Dave Patterson and Andrew Waterman](https://www.sigarch.org/simd-instructions-considered-harmful/)
- [RISC-V mailing list: Debate on incorporating RVV into the proposed AME spec](https://lists.riscv.org/g/tech-attached-matrix-extension/topic/shared_ame_presentations/104585223)
- [/r/riscv post on the design of a large multiported register file](https://www.reddit.com/r/RISCV/comments/1c273nk/riscv_large_multiported_register_file_challenge/)
- [Agner Fog: The microarchitecture of Intel, AMD, and VIA CPUs](https://www.agner.org/optimize/microarchitecture.pdf)
- [Agner Fog: Software optimization resources](https://www.agner.org/optimize/)
- [Apple Silicon CPU Optimization Guide](https://developer.apple.com/documentation/apple-silicon/cpu-optimization-guide)
- [Nanjing University Department of Computer Science and Technology Computer System Basic Course Experiment 2024](https://nju--projectn-github-io.translate.goog/ics-pa-gitbook/ics2024/?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp)
  - [Github: Nanjing University Computer System Project Series - Build a computer system from scratch!](https://github.com/NJU-ProjectN)
  - [Stop-Ask-Questions-The-Stupid-Ways](https://github-com.translate.goog/tangx/Stop-Ask-Questions-The-Stupid-Ways/blob/master/README.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp0)
- [An ex-ARM engineer critiques RISC-V (2019)](https://gist.github.com/erincandescent/8a10eeeea1918ee4f9d9982f7618ef68) ([HN link](https://news.ycombinator.com/item?id=24958423)) ([more comments](https://news.ycombinator.com/item?id=42928482))
- [How to improve the RISC-V specification - Alastair Reid](https://alastairreid.github.io/riscv-spec-issues/)
- [Smol GPU: An rv32i inspired ISA, SIMT GPU implementation in system-verilog.](https://github.com/Grubre/smol-gpu) (great `README` about GPU architectures and programming models)
- [ARM’s Scalable Vector Extensions: A Critical Look at SVE2 For Integer Workloads](https://gist.github.com/zingaburga/805669eb891c820bd220418ee3f0d6bd)
- [Taxonomy of RISC-V Vector Extensions](https://fprox.substack.com/p/taxonomy-of-risc-v-vector-extensions)
- [Three fundamental flaws of SIMD ISAs](https://www.bitsnbites.eu/three-fundamental-flaws-of-simd/) ([HN link](https://news.ycombinator.com/item?id=43783416))
- [How to Keep Pushing ML Accelerator Performance? Know Your Rooflines!](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10970753)
- The Pentium Chronicles by Robert Colwell
  - Good overview of the DFA (Dataflow Analyzer) simulator in the Appendix
- [Intel - P6 Family of Processors Hardware Developer’s Manual](https://download.intel.com/design/PentiumII/manuals/24400101.pdf)
- [/r/riscv: What is the worst ratified RISC-V instruction?](https://www.reddit.com/r/RISCV/comments/1n6hvqr/what_is_the_worst_ratified_riscv_instruction/)
- [Inside Nvidia GPU: Discussing Blackwell's Limitations and Predicting Rubin's Microarchitecture](https://github.com/zartbot/blog/issues/3)
- [Nicholas Wilt - Perennial Technical Reads: Books, articles, and blogs I keep returning to](https://parallelprogrammer.substack.com/p/a-reading-list-for-metalheads)
- [CUDA ontology](https://jamesakl.com/posts/cuda-ontology/) ([HN link](https://news.ycombinator.com/item?id=45947437))
- [The CUDA Handbook](https://www.cudahandbook.com/) (it is not 'up to date' but that's irrelevant since the concepts covered are mostly universal, a must read)
- [Discussing Blackwell’s drawbacks and dissecting its architecture - Translation](x.com/Jukanlosreve/status/1992531045485531164) ([Original Chinese thread](https://mp.weixin.qq.com/s?__biz=MzUxNzQ5MTExNw==&mid=2247496740&idx=1&sn=c9403138fa59d126fe6cfda19d9b2f76&scene=21&poc_token=HJFzI2mjybYKIv_tSNu4PiMciSREnpOIo4UavqiH)) ([archive](archive.is/ztwGl))

### Formal Verification

- [Daniel E. Gisselquist: An Introduction to Formal Methods](https://zipcpu.com/tutorial/class-verilog.pdf) (slides)
- [ZipCpu: My first experience with Formal Methods](https://zipcpu.com/blog/2017/10/19/formal-intro.html)
- [ZipCpu: Swapping assumptions and assertions doesn't work](https://zipcpu.com/formal/2018/12/18/skynet.html)
- [ZipCpu: An Exercise in using Formal Induction](https://zipcpu.com/blog/2018/03/10/induction-exercise.html)

## Systems

- [CACM: Meta’s Hyperscale Infrastructure: Overview and Insights](https://cacm.acm.org/research/metas-hyperscale-infrastructure-overview-and-insights/) ([HN link](https://news.ycombinator.com/item?id=43008920))

## Misc Engineering / Self-Hosting

- [Google Search has lost my trust, and I'm not sure where to head next](https://www.androidpolice.com/google-search-engine-lost-my-trust/) ([HN link](https://news.ycombinator.com/item?id=43517828))
  - [The Man Who Killed Google Search](https://www.wheresyoured.at/the-men-who-killed-google/), [In Response To Google](https://www.wheresyoured.at/in-response-to-google/), [Requiem for Raghavan](https://www.wheresyoured.at/requiem-for-raghavan/)
- [Another Periodic Suggestion to Try, Just Try, Switching to Kagi for Search](https://daringfireball.net/2025/04/try_switching_to_kagi) ([HN link](https://news.ycombinator.com/item?id=43829490))
- [Why I Ditched Spotify, and How I Set Up My Own Music Stack](https://leshicodes.github.io/blog/spotify-migration/) ([HN link](https://news.ycombinator.com/item?id=45133109))
- [Alibaba cloud FPGA: the 200$ Kintex UltraScale+](https://essenceia.github.io/projects/alibaba_cloud_fpga/) ([HN link](https://news.ycombinator.com/item?id=45471136))
- [On becoming competitive when joining a new company](https://ludwigabap.com/posts/on-becoming-competitive-when-joining-a-new-company/)

## Hardware

- [Creating a highly-integrated open-source laptop from scratch. Power in your hands.](https://www.byran.ee/posts/creation/) ([Show HN: I made an open-source laptop from scratch (byran.ee)](https://news.ycombinator.com/item?id=42797260)) (very impressive)
- [IEEE Spectrum: It’s Time To Rethink 6G](https://spectrum.ieee.org/5g-bandwidth) ([HN link](https://news.ycombinator.com/item?id=43027266))

## Machine Learning / Artificial Intelligence

### Model Architectures

- [Full Stack Optimization of Transformer Inference: a Survey (Feb 2023)](https://arxiv.org/abs/2302.14017)
- [A Review on Edge Large Language Models: Design, Execution, and Applications (Feb 2025)](https://arxiv.org/pdf/2410.11845v20)

### Reflections

- [Simon Willison: Things we learned about LLMs in 2024 (12/31/2024)](https://simonwillison.net/2024/Dec/31/llms-in-2024/)
- [AI is killing some companies, yet others are thriving - let's look at the data (2/28/2025)](https://www.elenaverna.com/p/ai-is-killing-some-companies-yet) ([HN link](https://news.ycombinator.com/item?id=43206491))
- [Andrej: Power to the people: How LLMs flip the script on technology diffusion](https://karpathy.bearblog.dev/power-to-the-people/) ([HN link](https://news.ycombinator.com/item?id=43619367))
- [Anthropic: Tracing the thoughts of a large language model](https://www.anthropic.com/research/tracing-thoughts-language-model) ([HN link](https://news.ycombinator.com/item?id=43495617))
- [Frequently Asked Questions (And Answers) About AI Evals](https://hamel.dev/blog/posts/evals-faq/) ([HN link](https://news.ycombinator.com/item?id=44430117))
- [Sergey Levine: Sporks of AGI](https://sergeylevine.substack.com/p/sporks-of-agi)

### Applications

- [No elephants: Breakthroughs in image generation](https://www.oneusefulthing.org/p/no-elephants-breakthroughs-in-image) ([HN link](https://news.ycombinator.com/item?id=43590569)) (March 2025)
- [Jon Barron (Deepmind) - Radiance Fields and the Future of Generative Media](https://www.youtube.com/watch?v=hFlF33JZbA0)
- [The Physical Turing Test: Jim Fan on Nvidia's Roadmap for Embodied AI](https://www.youtube.com/watch?v=_2NijXqBESI)
- [Cognition: Don’t Build Multi-Agents](https://cognition.ai/blog/dont-build-multi-agents#applying-the-principles)

### Predictions

- [Dijkstra: On the foolishness of "natural language programming".](https://www.cs.utexas.edu/~EWD/transcriptions/EWD06xx/EWD667.html) ([HN link](https://news.ycombinator.com/item?id=43564386))
- [AI 2027](https://ai-2027.com/) ([HN link](https://news.ycombinator.com/item?id=43571851)) (written in April 2025)
  - [What 2026 looks like](https://www.alignmentforum.org/posts/6Xgy6CAf2jqHhynHL/what-2026-looks-like) (written in August 2021)
  - [Dwarkesh: 2027 Intelligence Explosion: Month-by-Month Model — Scott Alexander & Daniel Kokotajlo](https://www.dwarkesh.com/p/scott-daniel) (some good counterpoints)
  - [AI 2027 Prediction Tracker](https://spicylemonade.github.io/AI-2027-tracker/)
- [SITUATIONAL AWARENESS: The Decade Ahead](https://situational-awareness.ai/) (another AI hype story)
- [Human](https://quarter--mile.com/Human)

### Symbolic AI

- [Yuxi Liu: Obituary for Cyc](https://yuxi-liu-wired.github.io/essays/posts/cyc/) ([HN link](https://news.ycombinator.com/item?id=43625474)) (the death of rule-based symbolic AI)
  - [Applications of Ontology - John F. Sowa](https://www.jfsowa.com/talks/ontology.htm)
  - [Upper Ontology - Wikipedia](https://en.wikipedia.org/wiki/Upper_ontology)
  - [SUMO - Github](https://github.com/ontologyportal/sumo)
  - [Ontologies in the era of large language models by Fabian Neuhaus - Youtube](https://www.youtube.com/watch?v=rLOmAzkqIts)
- [Pedro Domingos on the Symbolist Approach to AI](https://www.youtube.com/watch?v=ogaCzVoRpZs) (Pedro defends symbolic AI approaches)
- [On the foolishness of "natural language programming".](https://www.cs.utexas.edu/~EWD/transcriptions/EWD06xx/EWD667.html)

### Neuromorphic Algorithms and HW Architectures

- [A Foundational Theory for Decentralized Sensory Learning](https://arxiv.org/pdf/2503.15130) (Neuromorphic computing, Mar 2025)
  - [Introducing IntuiCell](https://www.youtube.com/watch?v=CBqBTEYSEmA) (company based on this paper)
- [Sandia turns on brain-like storage-free supercomputer](https://blocksandfiles.com/2025/06/06/sandia-turns-on-brain-like-storage-free-supercomputer/) ([HN link](https://news.ycombinator.com/item?id=44201812))
  - [Thermodynamic Computing with Memristor Discovery](https://knowm.org/thermodynamic-computing/)
  - [SpiNNaker2: A Large-Scale Neuromorphic System for Event-Based and Asynchronous Machine Learning](https://arxiv.org/html/2401.04491v1)

### ML Compilers

- [The Deep Learning Compiler: A Comprehensive Survey (Mar 2021)](https://ieeexplore.ieee.org/abstract/document/9222299)
- [Modular: Democratizing AI Compute, Part 7: What about Triton and Python eDSLs?](https://www.modular.com/blog/democratizing-ai-compute-part-7-what-about-triton-and-python-edsls)
  - This entire series by Chris Lattner is excellent
- [Max Slater: Differentiable Programming from Scratch](https://thenumb.at/Autodiff/) ([HN link](https://news.ycombinator.com/item?id=43713140))
- [PyTorch and LLVM in 2025 — Keeping up With AI Innovation](https://www.modular.com/blog/pytorch-and-llvm-in-2025-keeping-up-with-ai-innovation)
- [2023 EuroLLVM - MLIR Dialect Design and Composition for Front-End Compilers](https://www.youtube.com/watch?v=hIt6J1_E21c)

### NN Performance Optimization

- [Hazy Research: GPUs Go Brrr](https://hazyresearch.stanford.edu/blog/2024-05-12-tk) ([HN link](https://news.ycombinator.com/item?id=40337936))
- [Deep Dive into Matrix Optimization on AMD GPUs (RDNA3)](https://seb-v.github.io/optimization/update/2025/01/20/Fast-GPU-Matrix-multiplication.html) ([HN link](https://news.ycombinator.com/item?id=43469535))
  - [Overview of HIP C++](https://rocm.docs.amd.com/projects/HIP/en/docs-develop/how-to/hip_cpp_language_extensions.html) (designed to look like CUDA C with (mostly) the same APIs)
- [How To Write A Fast Matrix Multiplication From Scratch With Tensor Cores](https://alexarmbr.github.io/2024/08/10/How-To-Write-A-Fast-Matrix-Multiplication-From-Scratch-With-Tensor-Cores.html) (August 2024) ([HN link](news.ycombinator.com/item?id=43736739))
- [Dynomight: I don't like NumPy](https://dynomight.net/numpy/) ([HN link](https://news.ycombinator.com/item?id=43996431))
- [AdapTive-LeArning Speculator System (ATLAS): A New Paradigm in LLM Inference via Runtime-Learning Accelerators](https://www.together.ai/blog/adaptive-learning-speculator-system-atlas) ([HN link](https://news.ycombinator.com/item?id=45556474))
- [Scaling Elections with GPUs and Mojo 🔥](https://ashvardanian.com/posts/scaling-elections/)

### ML Hardware

- [Irrational Analysis: Tenstorrent and the State of AI Hardware Startups](https://irrationalanalysis.substack.com/p/tenstorrent-and-the-state-of-ai-hardware)
- [Corsix: Tenstorrent Wormhole Series Part 1: Physicalities](https://www.corsix.org/content/tt-wh-part1) (A highly detailed 7-part series on the Wormhole architecture and programming model)
- [How to map SIMT model onto tenstorrent device?](https://asplos.dev/wordpress/2025/05/31/how-to-map-simt-model-onto-tenstorrent-device/?utm_source=linkedin&utm_medium=jetpack_social)
- [Programming Tenstorrent processors](https://clehaxze.tw/gemlog/2025/04-21-programming-tensotrrent-processors.gmi)
- [tinytpu](https://www.tinytpu.com/)
- [From silicon to softmax: Inside the Ironwood AI stack](https://cloud.google.com/blog/products/compute/inside-the-ironwood-tpu-codesigned-ai-stack?e=48754805)

## Mathematics

- [Scott Aaronson | How Much Math Is Knowable?](https://www.youtube.com/watch?v=VplMHWSZf5c)
- [3B1B - But what is quantum computing? (Grover's Algorithm)](https://www.youtube.com/watch?v=RQWpF2Gb-gU)
- [Computational Phenomena in Physics | Scott Aaronson](https://www.youtube.com/watch?v=boZyu6NhAcI)
- [Introduction to Information Theory - Edward Witten](https://www.youtube.com/watch?v=XYugyhoohhY)
- [Edward Frenkel - Where Does Mathematics Come From?](https://www.youtube.com/watch?v=cLV2S8zsLdw&list=PLplZlMKmYMNFUDJny5w1ocKitK2aEI76h&index=24)
- [Edward Frenkel - Math is the Source Code of Human Mind](https://www.youtube.com/watch?v=glQEM7hjdus&list=PLplZlMKmYMNFUDJny5w1ocKitK2aEI76h&index=25)
- [Fumiharu Kato - Why is Number Theory So Difficult?](https://www.youtube.com/watch?v=4QRk-deWkRo&list=PLplZlMKmYMNFUDJny5w1ocKitK2aEI76h&index=26)
- Simons Foundation
  - [Terence Tao - Machine-Assisted Proofs (February 19, 2025)](https://www.youtube.com/watch?v=5ZIIGLiQWNM)
  - [Leonardo de Moura - Verified Collaboration: How Lean is Transforming Math...(March 12, 2025)](https://www.youtube.com/watch?v=rmMYFmlUbJ8&list=PLWAzLum_3a18G4fSykHHaFoPKVgrGrchK&index=2)
  - [Shirley Ho - The First AI Simulation of the Universe is Fast and Accurate (February 26, 2020)](https://www.youtube.com/watch?v=fXhgMRZjDuM)
  - [Miles Cranmer - The Next Great Scientific Theory is Hiding Inside a Neural Network (April 3, 2024)](https://www.youtube.com/watch?v=fk2r8y5TfNY)
  - [Lenka Zdeborová - Statistical Physics of Machine Learning (May 1, 2024)](https://www.youtube.com/watch?v=TLHYwbrhGJc)
  - [Yann LeCun - Could Machines Learn Like Humans? (February 6, 2019)](https://www.youtube.com/watch?v=A8Ry_fhTk_s)
  - [Stéphane Mallat - Learning Physics with Deep Neural Networks (October 17, 2018)](https://www.youtube.com/watch?v=0DEJ4QL5bcs)
  - [Matthew Botvinick - AI as a Window on Human Intelligence (December 7, 2022)](https://www.youtube.com/watch?v=BJMVHNj-X6Q)
  - [Michele Parrinello - Machine learning and molecular dynamics (April 10, 2019)](https://www.youtube.com/watch?v=vnlwE_Sb9ds)

## Simulation

- [A primer on molecular dynamics](https://www.owlposting.com/p/a-primer-on-molecular-dynamics) ([HN link](https://news.ycombinator.com/item?id=44204249))

## Design

- [Our Interfaces Have Lost Their Senses](https://wattenberger.com/thoughts/our-interfaces-have-lost-their-senses) ([HN link](https://news.ycombinator.com/item?id=43380930))
- [Coding Font Tournament](https://www.codingfont.com/)
- [But what if I really want a faster horse?](https://rakhim.exotext.com/but-what-if-i-really-want-a-faster-horse) ([HN link](https://news.ycombinator.com/item?id=43652723))

## Life

- [Seinfeld's Duke 2024 Commencement Speech](https://www.youtube.com/watch?v=76QV2SrSqgo)
- [3b1b's Harvey Mudd 2024 Commencement Speech](https://www.youtube.com/watch?v=W3I3kAg2J7w)
- [Paul Graham: What to Do](https://paulgraham.com/do.html) ([HN link](https://news.ycombinator.com/item?id=43514969))

## Business

- [Paul Graham's Essays](https://paulgraham.com/articles.html)
  - [How to Start Google (March 2024)](https://paulgraham.com/google.html) ([HN link](https://news.ycombinator.com/item?id=39756865))
- [Stop Trying To Schedule A Call With Me](https://matduggan.com/stop-trying-to-schedule-a-call-with-me/) ([HN link](https://news.ycombinator.com/item?id=42669754))
- [The Open Guide to Equity Compensation](https://github.com/jlevy/og-equity-compensation) ([HN link](https://news.ycombinator.com/item?id=43675126))

## Education

- [How I Taught The Iliad to Chinese Teenagers](https://scholars-stage.org/how-i-taught-the-iliad-to-chinese-teenagers/) ([HN link](https://news.ycombinator.com/item?id=39420769))
- [The First Line(s) of the Iliad](https://philologicalcrocodile.wordpress.com/2019/04/06/the-first-lines-of-the-iliad/)
- [Woodworking as an escape from the absurdity of software](https://alinpanaitiu.com/blog/woodworking-escape-from-software-absurdity/) ([HN link](https://news.ycombinator.com/item?id=40245601))
- [Doing well in your courses: a guide by Andrej Karpathy](https://cs.stanford.edu/people/karpathy/advice.html)
- [MATH 3406M (McCuan) Spring 2022 - Some Administrative Details: John McCuan](https://mccuan.math.gatech.edu/courses/3406/rona.pdf) 😆
- [A Student's Guide to Writing with ChatGPT (openai.com)](https://news.ycombinator.com/item?id=42129064)
- [Why are tech people suddenly so into homeschooling?](https://newsletter.goodtechthings.com/p/why-are-tech-people-suddenly-so-into) ([HN link](https://news.ycombinator.com/item?id=42698737))
- [Aporia: Asian immigration and the signaling model of education](https://www.aporiamagazine.com/p/asian-immigration-and-the-signaling)
- [‘Soul-Crushing’: Students Slam Harvard’s Grade Inflation Report](https://www.thecrimson.com/article/2025/10/30/students-react-grading-report/)
  - In response to: [Harvard College’s Grading System Is ‘Failing,’ Report on Grade Inflation Says](https://www.thecrimson.com/article/2025/10/27/grading-workload-report/)
- [Do I Need to Go to University? - Instead of asking “Is university good?”, ask “Do I have something more compelling to do?”](https://colah.github.io/posts/2020-05-University/)
- [When grades stop meaning anything: The UC San Diego math scandal is a warning](https://www.theargumentmag.com/p/when-grades-stop-meaning-anything)

## Writing

- [Ask HN: Is maintaining a personal blog still worth it?](https://news.ycombinator.com/item?id=42685534)
- [Why Blog If Nobody Reads It?](https://andysblog.uk/why-blog-if-nobody-reads-it/) ([HN link](https://news.ycombinator.com/item?id=42992159))

## Philosophy / Religion

- [The American Sun: Old And New Paganism by BAP](https://theamericansun.com/2019/03/25/old-and-new-paganism-by-bap/)
- [@Peter_Nimitz's thread with excerpts from Edward Watts' "The Final Pagan Generation"](https://twitter.com/Peter_Nimitz/status/1784248781900480913)
  - The thread can be seen in the context of "The Final Christian Generation" that may be the Millennials of the modern day
  - [The American Conservative: Learning From ‘The Final Pagan Generation’](https://www.theamericanconservative.com/learning-from-the-final-pagan-generation/). A Christian view of the book and its lessons for modern-day Christians.
- [Wirathu speaking on Muslims](https://twitter.com/bronzeagemantis/status/1784134586366103879)
  - See: [Time: The Face of Buddhist Terror](https://time.com/archive/6643742/the-face-of-buddhist-terror/)
- [The American Sun: Ideologies of Delayed Informatization](https://theamericansun.com/2019/08/27/ideologies-of-delayed-informatization/)
- [The Buddha's Teachings on Women's 84 Manners](https://thedailyenlightenment.com/2022/10/the-buddhas-teachings-on-womens-84-manners/)
- [Jacobin: Christianity Was Always for the Poor](https://jacobin.com/2024/03/christianity-poor-debt-jesus-moses-wealth) ([HN link - flagged](https://news.ycombinator.com/item?id=43745088))
  - I agree with the leftist. Good article about the truth of Christianity, Catholic "adaptations" are not grounded in the Bible but rather ancient pagan principles
- [21 observations from people watching](https://skincontact.substack.com/p/21-observations-from-people-watching?)

### Research Philosophies

- [Richard Hamming's "You and Your Research"](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html)
  - [Hamming's Reflection on His Time at Bell Labs](https://sameerismail.org/hamming)
- [David Patterson's Last Lecture: How to Be a Bad Professor](https://www.youtube.com/watch?v=TK6EPvrmcBk)
- [David Patterson's How to Build a Bad Research Center](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2013/EECS-2013-123.html)
- [David Patterson's How to Have a Bad Career](https://www.youtube.com/watch?v=Rn1w4MRHIhc)
- [David Patterson: Life Lessons from the First Half-Century of My Career](https://cacm.acm.org/opinion/life-lessons-from-the-first-half-century-of-my-career/) ([HN link](https://news.ycombinator.com/item?id=42795646))
- [Alberto Sangiovanni-Vincentelli: The Tides of EDA](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1246165&tag=1) (The Age of Gods, The Age of Heroes, and The Age of Men)
- [Systems Software Research is Irrelevant by Rob Pike of Bell Labs (2/21/2000)](https://doc.cat-v.org/bell_labs/utah2000/utah2000.pdf)
- [A letter of advice to all the people who have the destiny by Yanyan Jiang](https://jyywiki.cn/Letter.md) ([Translation](https://jyywiki-cn.translate.goog/Letter.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp&_x_tr_hist=true))


## Politics

- [First Things: What is the Longhouse?](https://archive.ph/BSEPn)
- [Our Generation's War](https://archive.ph/RPVVm)
- [The American Mind: The Death of Midwit Expertise](https://archive.ph/ytGCH)
- [The 28 Theses of the German Christians](https://coreyjmahler.com/the-28-theses-of-the-german-christians/#fnr1-18150)
- [Race in America and the Dork Right: Against an Authoritarianism of Clerks](https://bronzeagepervert.substack.com/p/race-in-america-and-the-dork-right)
- [J'Accuse: An Open Letter to an Open Minded Tech Rightist by Torbert Fahey (12/26/2024)](https://www.jaccusepaper.co.uk/p/an-open-letter-to-an-open-minded)
  - This is a real story (12/3/2024) (Chinese committing fraud): [6 former Apple employees charged in $150,000 charitable donations scheme](https://www.nbclosangeles.com/news/national-international/former-apple-employees-charged/3573568/)
  - [Apple fires some Indians over donation fraud; TANA under scrutiny](https://timesofindia.indiatimes.com/city/hyderabad/apple-fires-some-indians-over-donation-fraud-tana-under-scrutiny/articleshow/117034457.cms)
- [Debate Club by Lomez (12/29/2024)](https://www.lomez.press/p/debate-club)
- [Moral Foundations Theory (Wikipedia)](https://en.wikipedia.org/wiki/Moral_foundations_theory)
- [Wikipedia: History of eugenics](https://en.wikipedia.org/w/index.php?title=History_of_eugenics&oldid=1234497124) (archived version of 'Ancient eugenics')
- [Riding The Tiger: Why The Anglosphere Should Be Wary of India](https://knightsofthegreenshield.substack.com/p/riding-the-tiger-why-the-anglosphere) (accurate)
- [The Case Against Indian Immigration: A Misaligned Elite in the Making](https://arctotherium.substack.com/p/the-case-against-indian-immigration/comments)
- [Overpopulation FAQs: Understanding Population Dynamics, Overpopulation, and Population Control](https://zerocontradictions.net/faqs/overpopulation)
- [Sapir-Whorf Theory: How Language And Semantics Influence Thought](https://zerocontradictions.net/language/sapir-whorf-theory)
- [The Great Feminization](https://www.compactmag.com/article/the-great-feminization/) ([X](https://x.com/herandrews/status/1978793394978603116))
- [The Patel Cartel: Inside the Quiet Motel Monopoly](https://mythosnoir.substack.com/p/the-patel-cartel)
- [Women's Tears Win in the Marketplace of Ideas](https://www.richardhanania.com/p/womens-tears-win-in-the-marketplace)
- [Free Trade](https://baazaa.github.io/2024/10/22/trade.html)
- [H-1Bs](https://baazaa.github.io/2024/12/27/labour.html)
- [Factories of Ideas? Big Business and the Golden Age of American Innovation](https://pierpaolocreanza.github.io/website/creanza_jmp.pdf) ([X](https://x.com/Ersatz_Solus/status/1985386868356112888), [X](https://x.com/Spergapises/status/1985388782598955111), [X](https://x.com/arpitrage/status/1985345719968874930))
- [Open Letter To Indians and Liberals Regarding Immigration and Outsourcing](https://www.bronzeagepervert.yoga/p/open-letter-to-indians-and-liberals)
- [Non-linear Ethnic Niches - The emerging Western caste system](https://www.aporiamagazine.com/p/non-linear-ethnic-niches)
- [Brain Drain as Geopolitical Strategy - The foreign experts model versus the status quo](https://www.aporiamagazine.com/p/brain-drain-as-geopolitical-strategy)
- [The Shame of Our Cities: How Minneapolis-Saint Paul became the Medicaid fraud capital of the USA](https://www.countyhighway.com/archive/volume-3/issue-3/the-shame-of-our-cities-rosen)
- [The riddle of the niggardly billionaires](https://graymirror.substack.com/p/the-riddle-of-the-niggardly-billionaires)
- [The India Menace - Discussion on Izzat](https://archive.is/5EROu#selection-11877.103-11877.108)
- [Part 1: My Life Is a Lie: How a Broken Benchmark Quietly Broke America](https://www.yesigiveafig.com/p/part-1-my-life-is-a-lie)

### China

- [Dwarkesh: Notes on China](https://www.dwarkesh.com/p/notes-on-china)
- [Molson Hart: America Underestimates the Difficulty of Bringing Manufacturing Back](https://www.molsonhart.com/blog/america-underestimates-the-difficulty-of-bringing-manufacturing-back) ([HN link](https://news.ycombinator.com/item?id=43692677))
- [In the new Beijing](https://www.lrb.co.uk/the-paper/v47/n06/long-ling/diary) (an interesting look at Xiong’an)
- [Structure and Interpretation of the Chinese Economy](https://yuxi-liu-wired.github.io/essays/posts/structure-interpretation-chinese-economy/)
- [What role does technology play for China's transition from a "low-trust" society to a potentially high-trust one?](https://www.china-translated.com/p/what-role-does-technology-play-for)
- [Youthology on China's Vulnerable Generation](https://www.readingthechinadream.com/youthology-on-chinas-vulnerable-generation.html) ([thread](https://x.com/favelaoverlord/status/1976328970246451641))
- [Exams are everything in China](https://andrewbatson.com/2025/10/18/exams-are-everything-in-china/)
- [On Tourism in China](https://anglology.substack.com/p/dont-go-to-beijing)

## Productivity

- [Tim Ferris: You Don’t Need More How-To Advice — You Need a Beautiful and Painful Reckoning](https://tim.blog/2024/02/09/harajuku-moment/)
- [How to improve your WFH lighting to reduce eye strain](https://rustle.ca/posts/articles/work-from-home-lighting) ([HN link](https://news.ycombinator.com/item?id=42796950))
- [Finding Flow: Escaping Digital Distractions Through Deep Work and Slow Living](https://www.ssp.sh/blog/finding-flow/) ([HN link](https://news.ycombinator.com/item?id=43067303))
- [Johnny.Decimal - A system to organise your life](https://johnnydecimal.com/) ([HN link](https://news.ycombinator.com/item?id=43128093))

### Time Management

- [My productivity app is a never-ending .txt file](https://jeffhuang.com/productivity_text_file/) ([HN link](https://news.ycombinator.com/item?id=39432876))

## Health

- [Bryan Johnson – The World’s Most Expensive Eating Disorder](https://desmolysium.com/bryan-johnson-the-worlds-most-expensive-eating-disorder/)
- [What I learned gathering thousands of nootropic ratings](https://troof.blog/posts/nootropics/)
- [Matthew Walker's "Why We Sleep" Is Riddled with Scientific and Factual Errors](https://guzey.com/books/why-we-sleep/)
- [Wine and (my) Sleep](https://ja3k.com/blog/wine) (drink up to 1 glass per day in the afternoon, common sense)

## History

- [On the Origin of the Pork Taboo](https://archaeology.org/issues/march-april-2025/letters-from/on-the-origin-of-the-pork-taboo/) ([HN link](https://news.ycombinator.com/item?id=43410885))
- [Second Sophistic - Greek cultural movement of the second and third century CE](https://www.livius.org/articles/concept/second-sophistic/)
  - [Synesius, Eulogy of Baldness](https://www.livius.org/sources/content/synesius/synesius-eulogy-of-baldness/)
- [The Highly Probable Future: 83 Assumptions About the Year 2025 (written in 1994 by Joseph F. Coates)](https://www.uscg.mil/Portals/0/Strategy/Article%20Highly%20Probable%20Future%202025%201994.pdf?ver=2018-10-18-145610-687&ref=newslttrs.com)

## Music

- [KLANGPHONICS](https://www.youtube.com/watch?v=bixtQAq2LzE) - these guys are pretty good
- [Fred again's tiny desk concert](https://www.youtube.com/watch?v=4iQmPv_dTI0)
  - [Fred again's boiler room set](https://www.youtube.com/watch?v=c0-hvjV2A5Y)
- [Danish String Quartet's tiny desk concert](https://www.youtube.com/watch?v=cfuEIHEZobc)
- [An interesting HÖR set](https://www.youtube.com/watch?v=7CXp2EaRaIU)
  - [Liwando - LPH](https://www.youtube.com/watch?v=-RLTwe-0MlY)
- [Midnight Sun - Baltic Sea Philharmonic and Kristjan Järvi](https://www.youtube.com/watch?v=ytS_9SQmGBo)
- [A good rendition of Dunkelheit](https://www.youtube.com/watch?v=znV_BYjx5T0)
- [An interesting set by moumou: House Music You Can't Find On Spotify](https://www.youtube.com/watch?v=_P2ilGmSXDk)
  - [Fidde - I Only See Things I Dont Have](https://www.youtube.com/watch?v=vwHx0BPj3vM)

## Art

- [Profilo Continuo (Testa di Mussolini)](https://www.iwm.org.uk/collections/item/object/2247)
- [When Futurism Led to Fascism](https://voidnetwork.gr/2021/03/25/when-futurism-led-to-fascism-and-why-it-could-happen-again/)
- [Aeropittura](https://en.m.wikipedia.org/wiki/Aeropittura)
