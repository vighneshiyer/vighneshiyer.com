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
- ["Unison: a new distributed programming language" by Paul Chiusano @ Strange Loop 2019](https://www.youtube.com/watch?v=gCWtkvDQ2ZI)
  - [Unison: The Big Idea](https://www.unison-lang.org/docs/the-big-idea/)
- ["The Mess We're In" by Joe Armstrong @ Strange Loop 2014](https://www.youtube.com/watch?v=lKXe3HUG2l4)

### Functional Programming

- [Algebraic Effects from Scratch by Kit Langton](https://www.youtube.com/watch?v=qPvPdRbTF-E)
  - A great talk introducing algebraic effects from first principles and a sketched implementation of [Kyo](https://github.com/getkyo/kyo)

### Concurrent Programming

- [Concurrency Deep Dive: Async File IO in Java](https://concurrencydeepdives.com/asyncfileio.html)
  - This blog is insanely good: every article is filled with detailed information about the low-level concurrency primitives provided by the hardware and OS
  - [Scala's AsynchronousFileChannel is not truly asynchronous.](https://www.reddit.com/r/scala/comments/1b6k0cs/scalas_asynchronousfilechannel_is_not_truly/)

### Data Structures

- [The Hunt for the Missing Data Type](https://www.hillelwayne.com/post/graph-types/) ([HN link](https://news.ycombinator.com/item?id=39592444))
  - The author asks why there aren't any graph libraries in a stdlib when graphs are ubiquitous in many applications. One proposed reason is that graphs come in many forms (directed, hypergraphs, ubergraphs, bipartite) and each form usually has a different API and set of optimized algorithms. Since performance is critical, people often write custom graph libraries. In-memory graph representations are also very diverse and have significant impact on the performance and memory requirements of different types of graphs.
  - [A Response: The "missing" graph datatype already exists. It was invented in the '70s](https://tylerhou.com/posts/datalog-go-brrr/). [HN link](https://news.ycombinator.com/item?id=39606885)
    - The answer is Datalog - express graph algorithms declaratively and let the compiler choose the suitable in-memory representation and synthesize concrete imperative code to implement the algortihm.

### Performance Optimization

- [Hazy Research: GPUs Go Brrr](https://hazyresearch.stanford.edu/blog/2024-05-12-tk) ([HN link](https://news.ycombinator.com/item?id=40337936))
- [The LMAX architecture](https://martinfowler.com/articles/lmax.html) in the context of ([HN link: Disruptor-rs: better latency and throughput than crossbeam](https://news.ycombinator.com/item?id=40954104))
- [Parsing Protobuf at 2+GB/s: How I Learned To Love Tail Calls in C](https://blog.reverberate.org/2021/04/21/musttail-efficient-interpreters.html) ([HN link](https://news.ycombinator.com/item?id=41289114))

## Computer Architecture

### Talks

- [Tuesday @ 1130 ISA Shootout – a Comparison of RISC V, ARM, and x86 Chris Celio, UC Berkeley V2 (2016)](https://www.youtube.com/watch?v=Ii_pEXKKYUg)
- [Berkeley EECS Annual Research Symposium BEARS 2023 - RISC V at Berkeley and Beyond - Krste Asanovic](https://www.youtube.com/watch?v=uThc5K0fErk)
- [David Patterson - A New Golden Age for Computer Architecture: History, Challenges and Opportunities (2019)](https://www.youtube.com/watch?v=kFT54hO1X8M)

### Articles / Posts

- [SIMD Instructions Considered Harmful - Dave Patterson and Andrew Waterman](https://www.sigarch.org/simd-instructions-considered-harmful/)
- [RISC-V mailing list: Debate on incorporating RVV into the proposed AME spec](https://lists.riscv.org/g/tech-attached-matrix-extension/topic/shared_ame_presentations/104585223)
- [/r/riscv post on the design of a large multiported register file](https://www.reddit.com/r/RISCV/comments/1c273nk/riscv_large_multiported_register_file_challenge/)
- [Agner Fog: The microarchitecture of Intel, AMD, and VIA CPUs](https://www.agner.org/optimize/microarchitecture.pdf)
- [Agner Fog: Software optimization resources](https://www.agner.org/optimize/)
- [Apple Silicon CPU Optimization Guide](https://developer.apple.com/documentation/apple-silicon/cpu-optimization-guide)

## Research Philosophies

- [Richard Hamming's "You and Your Research"](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html)
  - [Hamming's Reflection on His Time at Bell Labs](https://sameerismail.org/hamming)
- [David Patterson's Last Lecture: How to Be a Bad Professor](https://www.youtube.com/watch?v=TK6EPvrmcBk)
- [David Patterson's How to Build a Bad Research Center](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2013/EECS-2013-123.html)
- [David Patterson's How to Have a Bad Career](https://www.youtube.com/watch?v=Rn1w4MRHIhc)
- [Alberto Sangiovanni-Vincentelli's The Tides of EDA](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1246165&tag=1) (The Age of Gods, The Age of Heroes, and The Age of Men)

## Ventures and Life

- [Paul Graham's Essays](https://paulgraham.com/articles.html)
  - [How to Start Google (March 2024)](https://paulgraham.com/google.html) ([HN link](https://news.ycombinator.com/item?id=39756865))
- [Seinfeld's Duke 2024 Commencement Speech](https://www.youtube.com/watch?v=76QV2SrSqgo)
- [3b1b's Harvey Mudd 2024 Commencement Speech](https://www.youtube.com/watch?v=W3I3kAg2J7w)

## Education

- [How I Taught The Iliad to Chinese Teenagers](https://scholars-stage.org/how-i-taught-the-iliad-to-chinese-teenagers/) ([HN link](https://news.ycombinator.com/item?id=39420769))
- [The First Line(s) of the Iliad](https://philologicalcrocodile.wordpress.com/2019/04/06/the-first-lines-of-the-iliad/)
- [Woodworking as an escape from the absurdity of software](https://alinpanaitiu.com/blog/woodworking-escape-from-software-absurdity/) ([HN link](https://news.ycombinator.com/item?id=40245601))
- [Doing well in your courses: a guide by Andrej Karpathy](https://cs.stanford.edu/people/karpathy/advice.html)

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

- L0m3z
  - [First Things: What is the Longhouse?](https://archive.ph/BSEPn)
  - [Our Generation's War](https://archive.ph/RPVVm)
  - [The American Mind: The Death of Midwit Expertise](https://archive.ph/ytGCH)

## Productivity

- [Tim Ferris: You Don’t Need More How-To Advice — You Need a Beautiful and Painful Reckoning](https://tim.blog/2024/02/09/harajuku-moment/)

### Time Management

- [My productivity app is a never-ending .txt file](https://jeffhuang.com/productivity_text_file/) ([HN link](https://news.ycombinator.com/item?id=39432876))

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
