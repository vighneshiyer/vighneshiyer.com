# Academic Engineering Research Needs a Reset

## Chris Re's Article

On May 25, 2025, Prof. Chris Ré of Stanford published an article on his research group's blog titled ["The Great American AI Race"](https://hazyresearch.stanford.edu/blog/2025-03-25-ai-usa).

He made several excellent points about the philosophy of academic engineering research, the role that universities and industry should play in research endeavors, and how ideas should pass from risky and cheap academia into capital-intensive industry.
I take his article as generally about _academic engineering research_, rather than about ML systems research specifically.
I shall roughly paraphrase his points below and offer some commentary (_my opinion, not Chris'_).

<aside>America should lead with open source.</aside>

The Chinese (and Meta) recognized early on that foundation models themselves are not going to be the primary source of value (or margin) in any downstream application of AI.
They postulate that the base models' incremental value is going to zero and they will be commoditized.
Just as foundries, design houses, and semiconductors sit low in the value chain, while the value extraction takes place as those technologies are used in factories, cars, and consumer electronics, the same applies to foundation models.

Chris argues that letting the Chinese go forward with this strategy, while American AI companies continue with a closed model strategy, will lead to general harm for America.
After all, if open models lag behind closed ones by only 3-6 months (and even that is pessimistic), the value chain that sits above these models will eat from and improve the ecosystem of the open models.
Over time, this could lead to Chinese models dominating in real downstream applications of AI, and the loss of American competitiveness (similarly to what has happened throughout manufacturing industries).
Vertical integration is important, and ceding the base models will eventually lead to ceding the entire stack that is built on top of them.

<aside>The Chinese have built on American innovations and extended them. We must keep innovating.</aside>

The Chinese still look to America for fundamental innovations in every sector that they quickly adopt, adapt, and optimize.
Stagnant American innovation can only last so long, for example, in the field of drones where the Chinese took early American hardware and software platforms and quickly overtook them with vertical integration and optimization (i.e. DJI).
The same trend is playing out in humanoid robotics with plenty of innovations from Boston Dynamics (both publicly and privately funded) being optimized and extended by the Chinese humanoid leader Unitree.
This has happened again recently with DeepSeek and the [Six Tigers](https://www.technologyreview.com/2025/02/04/1110942/four-chinese-ai-startups-deepseek/) when it comes to language models.

One way to stay ahead of the Chinese is to not allow domestic fragmentation and extraction only at the upper end of the value stack, but to try pushing on domestic vertical integration.
And as Chris suggests, continuing to innovate instead of optimize, is the best way of making sure America's labs and industry are the world leaders in AI.

<aside>Academia built the first-iteration of many AI innovations that industry has run with. Industry must fund academia strategically.</aside>

Chris notes that attention, the Mamba architecture, FlashAttention, many ML compilers, and so forth came from academic research first before being adopted commercially.
To some degree, industry has been eating a free lunch sponsored by the federal government, when it is perfectly capable of funding its own research efforts.
I believe one point Chris is making is that the current model of university funding, with all its inefficiencies, corruption, and graft, crowds out and inhibits funding that would naturally come from industry.

> We should get rid of the needless complexity of compliance and allow professors to engage more flexibly with industry. We need new models for collaboration, as Stanford no longer benefits as much as it could from brilliant former professors like Daphne Koller, Andrew Ng, Sebastian Thrun, and Bill Dally (CTO NVidia).

If industry is to fund research, then it must be completely divorced from the uselessness of current-day government funding (e.g. NSF, DoD), where knowing the program director is crucial, and the actual project proposal has little value.
The value proposition of the research, even if only realizable in 10+ years, must be clear to the funders, who are placing a hedge on the future.

Finally, the actual amount of funding needed for a professor, a handful of researchers, and some computing resources is incredibly low.
Even if you bundle in all of the other expenses needed to run a research lab, the amount of money required does not exceed $100k / student (a 5x discount vs an industry employee).
The issue is that universities tack on all kinds of _fake expenses_ for research: "tuition", "rent", "indirect costs" which end up in a slush fund for the entire university, armies of administrators and "vice provosts", garbage IT services, and so forth.
The fake expenses are _compounded by bureaucracy_ when it comes to hiring, recruitment, capital expenditure, teaching courses, facilities, and on and on.

All for what?
So students get a piece of paper from an "accredited university", which is a process controlled by yet another cartel.
Without taking a hammer to these wasteful and corrupt institutions, a proper and financially viable relationship between industry, academic research, and PhD students can't be established.
At the same time, industry shouldn't corrupt the intellectual freedom of academia: it is the role of the righteous professor to serve as an intermediary, defending research and securing funding.

<aside>
Academia is not industry-lite.
Academics should take risky long-term bets that are still grounded in eventual value.
</aside>

Aside from the funding issue, is the question of what engineering research belongs in the realm of academia.
Academics should not be doing random nit optimizations of existing ML models that industry researchers are perfectly capable of doing.
Without taking sufficient _engineering_ and _intellectual risk_, academic research is just an inferior version of industry research done by poorly paid students with scarce resources.

My view is that academics should focus on _tools, methodologies, abstractions, and theories_.
Not on products.
Naturally, if academic funding is industry driven, nit research and useless paper pushing will be on its way out, while long time horizon, risky, and high-impact research will flourish.

To make this concrete, I can point to the old [ASPIRE lab](https://aspire.eecs.berkeley.edu/) at UC Berkeley, which ran from 2012 to 2017.
This lab was mostly [funded by](https://aspire.eecs.berkeley.edu/sponsors/) DARPA and the primary industry sponsor: Intel.
The lab's focus was on retrofitting the [agile methodology for hardware design](https://people.eecs.berkeley.edu/~bora/Journals/2016/IEEEMicro16.pdf), and Intel provided both the industry vision and feedback for realizing this goal.
Many innovations and tools came out of ASPIRE, including the [RISC-V ISA (it started a bit before this lab began)](https://people.eecs.berkeley.edu/~krste/papers/EECS-2016-1.pdf), [Chisel (a hardware design language embedded in Scala)](https://www.chisel-lang.org/), [FIRRTL (the first well-defined IR for hardware)](https://ieeexplore.ieee.org/abstract/document/8203780), [Rocket (the first reasonable RISC-V core)](https://aspire.eecs.berkeley.edu/wp/wp-content/uploads/2016/04/Tech-Report-The-Rocket-Chip-Generator-Beamer.pdf), [BOOM (the first out-of-order RISC-V core)](https://github.com/riscv-boom/riscv-boom), [Hwacha (a vector-fetch ISA and microarchitecture)](https://people.eecs.berkeley.edu/~krste/papers/EECS-2015-263.pdf), [DIABLO](https://dl.acm.org/doi/abs/10.1145/2775054.2694362)/[FireBox](https://www.usenix.org/conference/fast14/technical-sessions/presentation/keynote) (FPGA-based simulation platforms), [FireSim (it started at the very tail of this lab)](https://fires.im/), and [GAP (a comprehensive graph algorithm benchmark suite)](http://gap.cs.berkeley.edu/benchmark.html), many of which are still being developed and have industry uptake today.
Another outcome of this lab was the founding of SiFive in 2015, which is a major player in RISC-V IP today.

- Intel's funding of ASPIRE is a great example of the proper role of industry and academic engineering research

<aside>Many academics today don't belong in academia.</aside>

Although Chris does not say this outright, I believe it is implicit in his article.

At the end of the day, an engineering professor is making a pitch.
Unlike a startup pitch, the time horizon is long, the roadmap is vague, and the revenue is zero.
In return, he is providing mentorship to a handful of truly passionate but inexperienced students, the promise of revolutionary tools, and
The essential element of a pitch remains: a clear vision about the future and evidence of extreme technical competence to make progress towards it.

A professorship isn't a status seeking endeavor.
It isn't for people who care about money.
It isn't for people who ask their students for research ideas.


## The Computer Architecture Case

Krste Asanovic is the equivalent person on the computer architecture side (RISC-V, spike, Rocket, Hwacha, Chipyard, FireSim, and on and on). There is an even longer history here that includes David Patterson, and stretching as far back as von Neumann.

The Chinese are experts here in industry/academic collboration

## Yanyan's Letter

It reminds me of [the letter](https://jyywiki.cn/Letter.md) that Prof. Yanyan Jiang of Nanjing University wrote ([ChatGPT translation](https://chatgpt.com/share/67e86a54-2dd8-8004-a376-2c82ece77f03)).
I encourage everyone reading to stop and read his letter now.

- https://jyywiki.cn/Reading_List.md (Hero worship of von Neumann, the benefits of true-belief cults)


The blog post was excellent
1:20
I agree completely
1:20
The hard truth though is that academia is filled with people who don't belong there (edited)
1:22
Chris is very smart, by writing this, he is expelling and dissuading the people who need to go

Well it is my ideology :laughing:
1:31
The thing is everyone else has their own ideology, Chris is one of the few making his explicit
1:32
How can you hesitate joining his group now lol
1:33
https://jyywiki.cn/Letter.md
1:33
Here is another example of honesty

- NSF and other funding is running dry and is frequently allocated to bad and useless things
  - Yanyan's letter makes it clear that running government-funded research in the 'business-as-usual' case, leads to a sustaining feedback loop of nonsense, running in circles, and producing nothing of value other than every party shaking each other's hand and handing over money, status, prestige, papers, in a circle
