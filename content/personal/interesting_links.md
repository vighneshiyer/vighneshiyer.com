+++
title = "Interesting Links"
date = 2024-02-12
+++

Here are a bunch of things from around the internet that I find interesting.

## Programming

- [Signs that you're a good programmer](https://skatgame.net/mburo//courses/350/signs-that-you-re-a-good-programmer.html)
- [Signs that you're a bad programmer](https://web.archive.org/web/20230405060440/http://www.yacoset.com/Home/signs-that-you-re-a-bad-programmer)

### Concurrent Programming

- [Concurrency Deep Dive: Async File IO in Java](https://concurrencydeepdives.com/asyncfileio.html)
  - This blog is insanely good: every article is filled with detailed information about the low-level concurrency primitives provided by the hardware and OS
  - [Scala's AsynchronousFileChannel is not truly asynchronous.](https://www.reddit.com/r/scala/comments/1b6k0cs/scalas_asynchronousfilechannel_is_not_truly/)

### Data Structures

- [The Hunt for the Missing Data Type](https://www.hillelwayne.com/post/graph-types/)
  - [HN link](https://news.ycombinator.com/item?id=39592444)
  - The author asks why there aren't any graph libraries in a stdlib when graphs are ubiquitous in many applications. One proposed reason is that graphs come in many forms (directed, hypergraphs, ubergraphs, bipartite) and each form usually has a different API and set of optimized algorithms. Since performance is critical, people often write custom graph libraries. In-memory graph representations are also very diverse and have significant impact on the performance and memory requirements of different types of graphs.
  - [A Response: The "missing" graph datatype already exists. It was invented in the '70s](https://tylerhou.com/posts/datalog-go-brrr/)
    - [HN link](https://news.ycombinator.com/item?id=39606885)
    - The answer is Datalog - express graph algorithms declaratively and let the compiler choose the suitable in-memory representation and synthesize concrete imperative code to implement the algortihm.

## Computer Architecture

### RISC-V Mailing List

- [Debate on incorporating RVV into the proposed AME spec](https://lists.riscv.org/g/tech-attached-matrix-extension/topic/shared_ame_presentations/104585223?p=,,,20,0,0,0::recentpostdate/sticky,,,20,2,0,104585223,previd%3D1709667821182778053,nextid%3D1698744627839279315&previd=1709667821182778053&nextid=1698744627839279315)

## Research Philosophies

- [Richard Hamming's "You and Your Research"](https://www.cs.virginia.edu/~robins/YouAndYourResearch.html)
  - [Hamming's Reflection on His Time at Bell Labs](https://sameerismail.org/hamming)
- [David Patterson's Last Lecture: How to Be a Bad Professor](https://www.youtube.com/watch?v=TK6EPvrmcBk)
- [David Patterson's How to Build a Bad Research Center](https://www2.eecs.berkeley.edu/Pubs/TechRpts/2013/EECS-2013-123.html)
- [Alberto Sangiovanni-Vincentelli's The Tides of EDA](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=1246165&tag=1)
  - The Age of Gods, The Age of Heroes, and The Age of Men

## Ventures and Life

- [Paul Graham's Essays](https://paulgraham.com/articles.html)
  - [How to Start Google (March 2024)](https://paulgraham.com/google.html) ([HN link](https://news.ycombinator.com/item?id=39756865))

## Education

- [How I Taught The Iliad to Chinese Teenagers](https://scholars-stage.org/how-i-taught-the-iliad-to-chinese-teenagers/) ([HN link](https://news.ycombinator.com/item?id=39420769))
- [The First Line(s) of the Iliad](https://philologicalcrocodile.wordpress.com/2019/04/06/the-first-lines-of-the-iliad/)

## Productivity

- [Tim Ferris: You Don’t Need More How-To Advice — You Need a Beautiful and Painful Reckoning](https://tim.blog/2024/02/09/harajuku-moment/)

### Time Management

- [My productivity app is a never-ending .txt file](https://jeffhuang.com/productivity_text_file/) ([HN link](https://news.ycombinator.com/item?id=39432876))
