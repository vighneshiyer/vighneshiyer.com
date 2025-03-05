+++
title = "Interesting Links"
date = 2024-02-12
+++

Here are a bunch of things from around the internet that I find interesting.

## Programming

- [Signs that you're a good programmer](https://skatgame.net/mburo//courses/350/signs-that-you-re-a-good-programmer.html)
- [Signs that you're a bad programmer](https://web.archive.org/web/20230405060440/http://www.yacoset.com/Home/signs-that-you-re-a-bad-programmer)
- [Jonathan Blow: "Ideas about a new programming language for games."](https://www.youtube.com/watch?v=TH9VCN6UkyQ)
- [Jonathan Blow: "Preventing the Collapse of Civilization"](https://www.youtube.com/watch?v=pW-SOdj4Kkk)
- [Features of a dream programming language: 3rd draft](https://dev.to/redbar0n/features-of-a-dream-programming-language-3rd-draft-5m6)
- ["The Mess We're In" by Joe Armstrong @ Strange Loop 2014](https://www.youtube.com/watch?v=lKXe3HUG2l4)
- [Carbon is not a programming language (sort of)](https://herecomesthemoon.net/2025/02/carbon-is-not-a-language/0) ([HN link](https://news.ycombinator.com/item?id=42983733))

### Functional Programming

- [Algebraic Effects from Scratch by Kit Langton](https://www.youtube.com/watch?v=qPvPdRbTF-E)
  - A great talk introducing algebraic effects from first principles and a sketched implementation of [Kyo](https://github.com/getkyo/kyo)
- ["Unison: a new distributed programming language" by Paul Chiusano @ Strange Loop 2019](https://www.youtube.com/watch?v=gCWtkvDQ2ZI)
  - [Unison: The Big Idea](https://www.unison-lang.org/docs/the-big-idea/)
  - [Abilities for the monadically inclined](https://www.unison-lang.org/docs/fundamentals/abilities/for-monadically-inclined/)

### Concurrent Programming

- [Concurrency Deep Dive: Async File IO in Java](https://concurrencydeepdives.com/asyncfileio.html)
  - This blog is insanely good: every article is filled with detailed information about the low-level concurrency primitives provided by the hardware and OS
  - [Scala's AsynchronousFileChannel is not truly asynchronous.](https://www.reddit.com/r/scala/comments/1b6k0cs/scalas_asynchronousfilechannel_is_not_truly/)

### Distributed Programming

- [Distributed Systems Programming Has Stalled](https://www.shadaj.me/writing/distributed-programming-stalled) ([HN link](https://news.ycombinator.com/item?id=43195702))

### Data Structures

- [The Hunt for the Missing Data Type](https://www.hillelwayne.com/post/graph-types/) ([HN link](https://news.ycombinator.com/item?id=39592444))
  - The author asks why there aren't any graph libraries in a stdlib when graphs are ubiquitous in many applications. One proposed reason is that graphs come in many forms (directed, hypergraphs, ubergraphs, bipartite) and each form usually has a different API and set of optimized algorithms. Since performance is critical, people often write custom graph libraries. In-memory graph representations are also very diverse and have significant impact on the performance and memory requirements of different types of graphs.
  - [A Response: The "missing" graph datatype already exists. It was invented in the '70s](https://tylerhou.com/posts/datalog-go-brrr/). [HN link](https://news.ycombinator.com/item?id=39606885)
    - The answer is Datalog - express graph algorithms declaratively and let the compiler choose the suitable in-memory representation and synthesize concrete imperative code to implement the algorithm.

### Performance Optimization

- [Hazy Research: GPUs Go Brrr](https://hazyresearch.stanford.edu/blog/2024-05-12-tk) ([HN link](https://news.ycombinator.com/item?id=40337936))
- [The LMAX architecture](https://martinfowler.com/articles/lmax.html) in the context of ([HN link: Disruptor-rs: better latency and throughput than crossbeam](https://news.ycombinator.com/item?id=40954104))
- [Parsing Protobuf at 2+GB/s: How I Learned To Love Tail Calls in C](https://blog.reverberate.org/2021/04/21/musttail-efficient-interpreters.html) ([HN link](https://news.ycombinator.com/item?id=41289114))

### Compilers

- [A catalog of ways to generate SSA](https://bernsteinbear.com/blog/ssa/) ([HN link](https://news.ycombinator.com/item?id=43009952))
- [Building a baseline JIT for Lua automatically](https://sillycross.github.io/2023/05/12/2023-05-12/)
  - Same author as [Copy-and-patch compilation: a fast compilation algorithm for high-level languages and bytecode](https://dl.acm.org/doi/abs/10.1145/3485513), highly competent person

### Rust

- [Speeding up the Rust edit-build-run cycle (davidlattimore.github.io)](https://news.ycombinator.com/item?id=42140164)

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

## Computer Architecture

### Talks

- [Tuesday @ 1130 ISA Shootout – a Comparison of RISC V, ARM, and x86 Chris Celio, UC Berkeley V2 (2016)](https://www.youtube.com/watch?v=Ii_pEXKKYUg)
- [Berkeley EECS Annual Research Symposium BEARS 2023 - RISC V at Berkeley and Beyond - Krste Asanovic](https://www.youtube.com/watch?v=uThc5K0fErk)
- [David Patterson - A New Golden Age for Computer Architecture: History, Challenges and Opportunities (2019)](https://www.youtube.com/watch?v=kFT54hO1X8M)
- [View from the Top: Professor David Patterson](https://www.youtube.com/watch?v=TK6EPvrmcBk)

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

## Systems

- [CACM: Meta’s Hyperscale Infrastructure: Overview and Insights](https://cacm.acm.org/research/metas-hyperscale-infrastructure-overview-and-insights/) ([HN link](https://news.ycombinator.com/item?id=43008920))

## Hardware

- [Creating a highly-integrated open-source laptop from scratch. Power in your hands.](https://www.byran.ee/posts/creation/) ([Show HN: I made an open-source laptop from scratch (byran.ee)](https://news.ycombinator.com/item?id=42797260)) (very impressive)
- [IEEE Spectrum: It’s Time To Rethink 6G](https://spectrum.ieee.org/5g-bandwidth) ([HN link](https://news.ycombinator.com/item?id=43027266))

## Machine Learning (AI/ML)

- [Simon Willison: Things we learned about LLMs in 2024 (12/31/2024)](https://simonwillison.net/2024/Dec/31/llms-in-2024/)
- [AI is killing some companies, yet others are thriving - let's look at the data (2/28/2025)](https://www.elenaverna.com/p/ai-is-killing-some-companies-yet) ([HN link](https://news.ycombinator.com/item?id=43206491))

## Research Philosophies

- [Richard Hamming's "You and Your Research"](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html)
  - [Hamming's Reflection on His Time at Bell Labs](https://sameerismail.org/hamming)
- [David Patterson's Last Lecture: How to Be a Bad Professor](https://www.youtube.com/watch?v=TK6EPvrmcBk)
- [David Patterson's How to Build a Bad Research Center](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2013/EECS-2013-123.html)
- [David Patterson's How to Have a Bad Career](https://www.youtube.com/watch?v=Rn1w4MRHIhc)
- [David Patterson: Life Lessons from the First Half-Century of My Career](https://cacm.acm.org/opinion/life-lessons-from-the-first-half-century-of-my-career/) ([HN link](https://news.ycombinator.com/item?id=42795646))
- [Alberto Sangiovanni-Vincentelli: The Tides of EDA](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1246165&tag=1) (The Age of Gods, The Age of Heroes, and The Age of Men)
- [Systems Software Research is Irrelevant by Rob Pike of Bell Labs (2/21/2000)](https://doc.cat-v.org/bell_labs/utah2000/utah2000.pdf)
- [A letter of advice to all the people who have the destiny by Yanyan Jiang](https://jyywiki.cn/Letter.md) ([Translation](https://jyywiki-cn.translate.goog/Letter.md?_x_tr_sl=auto&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp&_x_tr_hist=true))

## Life

- [Seinfeld's Duke 2024 Commencement Speech](https://www.youtube.com/watch?v=76QV2SrSqgo)
- [3b1b's Harvey Mudd 2024 Commencement Speech](https://www.youtube.com/watch?v=W3I3kAg2J7w)

## Business

- [Paul Graham's Essays](https://paulgraham.com/articles.html)
  - [How to Start Google (March 2024)](https://paulgraham.com/google.html) ([HN link](https://news.ycombinator.com/item?id=39756865))
- [Stop Trying To Schedule A Call With Me](https://matduggan.com/stop-trying-to-schedule-a-call-with-me/) ([HN link](https://news.ycombinator.com/item?id=42669754))

## Education

- [How I Taught The Iliad to Chinese Teenagers](https://scholars-stage.org/how-i-taught-the-iliad-to-chinese-teenagers/) ([HN link](https://news.ycombinator.com/item?id=39420769))
- [The First Line(s) of the Iliad](https://philologicalcrocodile.wordpress.com/2019/04/06/the-first-lines-of-the-iliad/)
- [Woodworking as an escape from the absurdity of software](https://alinpanaitiu.com/blog/woodworking-escape-from-software-absurdity/) ([HN link](https://news.ycombinator.com/item?id=40245601))
- [Doing well in your courses: a guide by Andrej Karpathy](https://cs.stanford.edu/people/karpathy/advice.html)
- [MATH 3406M (McCuan) Spring 2022 - Some Administrative Details: John McCuan](https://mccuan.math.gatech.edu/courses/3406/rona.pdf) 😆
- [A Student's Guide to Writing with ChatGPT (openai.com)](https://news.ycombinator.com/item?id=42129064)
- [Why are tech people suddenly so into homeschooling?](https://newsletter.goodtechthings.com/p/why-are-tech-people-suddenly-so-into) ([HN link](https://news.ycombinator.com/item?id=42698737))

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

## Productivity

- [Tim Ferris: You Don’t Need More How-To Advice — You Need a Beautiful and Painful Reckoning](https://tim.blog/2024/02/09/harajuku-moment/)
- [How to improve your WFH lighting to reduce eye strain](https://rustle.ca/posts/articles/work-from-home-lighting) ([HN link](https://news.ycombinator.com/item?id=42796950))
- [Finding Flow: Escaping Digital Distractions Through Deep Work and Slow Living](https://www.ssp.sh/blog/finding-flow/) ([HN link](https://news.ycombinator.com/item?id=43067303))
- [Johnny.Decimal - A system to organise your life](https://johnnydecimal.com/) ([HN link](https://news.ycombinator.com/item?id=43128093))

### Time Management

- [My productivity app is a never-ending .txt file](https://jeffhuang.com/productivity_text_file/) ([HN link](https://news.ycombinator.com/item?id=39432876))

## Health

- [Bryan Johnson – The World’s Most Expensive Eating Disorder](https://desmolysium.com/bryan-johnson-the-worlds-most-expensive-eating-disorder/)

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
