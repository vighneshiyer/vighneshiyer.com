# Academic Engineering Research Needs a Reset

Disclaimers: I am writing specifically about academic _engineering_ research, so my opinions below shouldn't be misconstrued as relating to the natural sciences. My perspective is geared towards computer architecture, so that is where my positions come from. I do not see the Chinese as a rival to be 'beaten', but rather I believe we should admire what they've accomplished and learn from them.

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

If industry is to fund research, then it must be completely divorced from the uselessness of current-day government funding (e.g. NSF, DoD), where knowing the program director is crucial, and the actual project proposal has little meaning.
The value proposition of the research, even if only realizable in 10+ years, must be clear to the funders, who are making a hedge on the future.

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
Naturally, if academic funding is industry driven, nit research and useless paper pushing will be on its way out, while long time horizon, risky, and high-impact research will flourish (albeit with a much smaller pool of professors and graduate students).

To make this concrete, I can point to the old [ASPIRE lab](https://aspire.eecs.berkeley.edu/) at UC Berkeley, which ran from 2012 to 2017.
This lab was mostly [funded by](https://aspire.eecs.berkeley.edu/sponsors/) DARPA and the primary industry sponsor: Intel.
The lab's focus was on retrofitting the [agile methodology for hardware design](https://people.eecs.berkeley.edu/~bora/Journals/2016/IEEEMicro16.pdf), and Intel provided both the industry vision and feedback for realizing this goal.
Many innovations and tools came out of ASPIRE, including the [RISC-V ISA (it started a bit before this lab began)](https://people.eecs.berkeley.edu/~krste/papers/EECS-2016-1.pdf), [spike (the RISC-V golden model)](https://github.com/riscv-software-src/riscv-isa-sim), [Chisel (a hardware design language embedded in Scala)](https://www.chisel-lang.org/), [FIRRTL (the first well-defined IR and front-end compiler for hardware)](https://ieeexplore.ieee.org/abstract/document/8203780), [Rocket (the first reasonable RISC-V core)](https://aspire.eecs.berkeley.edu/wp/wp-content/uploads/2016/04/Tech-Report-The-Rocket-Chip-Generator-Beamer.pdf), [BOOM (the first out-of-order RISC-V core)](https://github.com/riscv-boom/riscv-boom), [Hwacha (a vector-fetch ISA and microarchitecture)](https://people.eecs.berkeley.edu/~krste/papers/EECS-2015-263.pdf), [DIABLO](https://dl.acm.org/doi/abs/10.1145/2775054.2694362)/[FireBox](https://www.usenix.org/conference/fast14/technical-sessions/presentation/keynote) (FPGA-based datacenter simulation platforms), [FireSim (it started at the very tail of this lab)](https://fires.im/), and [GAP (a comprehensive graph algorithm benchmark suite)](http://gap.cs.berkeley.edu/benchmark.html), many of which are still being developed and have industry uptake today.
Another outcome of ASPIRE was the founding of SiFive in 2015, originally a play on agile hardware design, which has become a major player in RISC-V IP today.
It doesn't get any better than this: ASPIRE defined a golden age of academic computer architecture research.

<aside>Many academics today don't belong in academia.</aside>

Although Chris does not say this outright, I believe it is implicit in his article.

At the end of the day, an engineering professor is making a pitch.
Unlike a startup pitch, the time horizon is long, the roadmap is vague, and the revenue is zero.
In return, he is providing mentorship and a future to a handful of truly passionate but inexperienced students, the promise of revolutionary innovations, and eventually a path to recoup all the investment in him and much more.
The essential element of a pitch remains: a clear vision about the future and evidence of extreme technical competence and mentorship skills to make progress towards it.

A professorship isn't a status seeking endeavor.
It isn't for people who care about money.
It isn't for people who have no vision of or care for the future.
It isn't for people who depend on their students for research output.

Some professors and graduate students will admit in private that a large chunk of academic engineering research is ill-motivated, isn't going anywhere, reflects a desire to simply push papers, and has little real-world value, but I will just state it outright.
Our goal should be to use open source and industry / academic collaboration to restore academic engineering research to a state of excellence and admiration.

## Analogies

This is the historical pattern described by Chris for language models (specifically for transformers and FlashAttention):

1. American academic innovation funded largely by industry takes a long-term view of a problem
2. Industry investment amplifies / incorporates the academic work
3. Creation of a startup from the originating academic lab to capitalize on their innovation
4. Chinese upstarts begin leveraging and optimizing these innovations which were open source to begin with
5. And, if American innovation begins to stagnate or is moved into closed source, Chinese dominance ensues

There is an equivalent story in the field of computer architecture.

### The RISC-V Innovation Followed by Chinese Innovation

<!-- Krste Asanovic is the equivalent person on the computer architecture side (RISC-V, spike, Rocket, Hwacha, Chipyard, FireSim, and on and on). -->

RISC microprocessor design goes back a long way (before the 80s), but it had a modern revival with the creation of RISC-V at UC Berkeley around 2010 (originally intended for pedagogical purposes).
Led by Prof. Krste Asanovic, many tools and implementations for RISC-V came out of the ASPIRE lab, which I enumerated above.
The story played out the same way (I admit I'm simplifying the history and outlook a bit).

1. Industry (Intel) provided funding, resources, and industrial feedback for work on fundamental computer architecture methodology research, which was performed at UC Berkeley
2. Many useful tools (Chisel, RISC-V, FireSim, agile design methodology) came out of the research and were subsequently adopted by American industry
3. The original creators of RISC-V started SiFive to capitalize on being first to market for a brand new ISA, which was rapidly gaining traction
4. China recognized the value of a new royalty-free ISA with a software ecosystem and began to contribute from all angles (microarchitecture, ISA specification, SoC tapeouts, compiler extensions)
5. American startups moved core IP development (SiFive's RISC-V cores) and language tooling (Chisel) away from academia and open source into the corporate environment. American academia failed to continue innovating. The Chinese didn't hold back and open sourced their cores and tools (e.g. Alibaba C910, Xiangshan) and are poised to dominate the RISC-V ecosystem.

There is an entire article to write on just what happened to RISC-V from the Chinese perspective, but suffice it to say, nearly all the new academic / low-mid end work is being done in China.
China is trying to create a maximally accessible RISC-V IP environment, which will have long-term knock on effects in continuing Chinese control.
Furthermore, there is far more collaboration between government, industry, and academia in China than there is in the US, with a clear national plan to dominate the industry.
While it is the case that all the high-performance "high-margin" RISC-V IP startups are based in the US, it isn't a threat to China at all: they understand they must capture the broad market first and then specialize as they build the domestic talent pipeline.

One more note: all of the innovation coming from the Xiangshan team was seeded in Krste's group over the past 10 years.
Xiangshan is a fork of BOOM, their cache is a fork of the LLC that SiFive open sourced, and they [continue to innovate in the hardware design language space](https://capra.cs.cornell.edu/latte25/paper/12.pdf) after fully adopting Chisel.
Another note is that the Chinese effort, like all efforts, is _hero-driven_: there are a handful of heroes that contribute the majority of the engineering work, and they are quickly "promoted" to leadership roles where their impact is magnified.

<!--
This is different from what happened to krste though, Chinese forces took innovation and ran with it and the Americans are caught flatfooted, save for all the riscv ip startups, which may soon be overrun by xiangshan
The Chinese are experts here in industry/academic collboration
-->

### Big Data Innovations Continue to be Dominated by America

There is one more historical example from Berkeley to look at.
Led by Profs. Matei Zaharia and Ion Stoica, many tools for "big data" came out of the AMPLab (Spark, Mesos, Alluxio), and tools for "ML systems" from the RISELab (Ray).
These projects came out of academic research funded by many industrial sponsors, and they led to several startups, with Databricks and Anyscale being the most prominent.

Because these tools were open source, stayed that way (for the most part), and innovation in the open continued (more data analytics tools such as Pandas and Polars, more databases such as MongoDB and DuckDB), there was no ability for the Chinese to dominate this market.
The tools were _maximally accessible_ and therefore continued to evolve and improve over time as industry funds flowed into them, and seeded the academic lab that spawned it to do *the next thing*.

<!--
Instead, these projects enabled billions in value creation, and spawned the era of LLMs
Consider matei and stoica, also doing the same thing with data bricks, spark, any scale, and more in the future, but they didn't have the final part, the Chinese takeover happen, instead the Chinese still use their data analysis platforms and innovations because they both continue to innovate and also open source, making something accessible and innovative ensures continued market dominance and leadership
-->

### PCB Prototyping

The same story played out in manufacturing generally over the past 50 years.
If we take the particular case of PCB prototyping and manufacturing, we see one thread of Chinese manufacturing dominance.
An industry that started in America, began to lose ground to the Chinese as they started manufacturing very simple boards in prototype quantities.

In the early stages, no one would suspect that China could overtake the US manufacturers.
After all, the US had a huge head start, all the PCB _design_ happened in America, the manufacturing process was not so sensitive to labor costs, and it seemed doubtful if the Chinese could keep evolving with tighter PCB tolerances and features (i.e. HDI).
Things began to change as the Chinese first targeted the hobby and low-volume prototype market, offering English services, and making their web platform _maximally accessible_ with instant quotes (something American manufacturers still can't do today).

Operate all the baseline services as commodities and make them accessible and integrated, cheap and fast, and usable by all. Value creation happens further up the chain! Trying to control and close off what should be a commodity doesn't work in the long run and leads to ruin / loss of innovation.

More automation, specialized machinery, and now innovation

<!--
We can see the same pattern in manufacturing, let's take PCB prototyping and large volume manufacturing for example, Chinese built their own pipeline, tools like easyeda, things like lcsc, and then began to dominate everything, very open and accessible, low price and vertical integration, now they are the ones innovating and more importantly enabling American innovation

Consider what happens when China dumps solar panels, all of a sudden it eats up all the domestic market and it dies
-->

## Chris Re's Position

Chris Re is in the same position that Krste was in shortly after his founding of SiFive.
Founded together.ai, trying to cultivate this university / industry player position. But recognizes the state he is in: inventor of lots of ML systems things (thunderkittens, flashattention, mamba, etc.) and realizes what needs to happen next.

## Yanyan Jiang's Letter

All this discussion reminds me of [the letter](https://jyywiki.cn/Letter.md) that Prof. Yanyan Jiang of Nanjing University wrote ([GPT-4o translation](https://chatgpt.com/share/67e86a54-2dd8-8004-a376-2c82ece77f03)) ([Grok 3 translation](https://grok.com/share/c2hhcmQtMg%3D%3D_58ec05dc-dfd8-45d7-bea9-76089c4c4f09)).
I encourage everyone reading to stop and read his letter now.

<aside>
Sidenote: The Grok translation is more true to the original Chinese and preserves the harsh language and Chinese proverbs Yanyan used, while the GPT version is sanitized and strips out several paragraphs from the original text.
Only after seeing these two translations side-by-side did I realize just how much GPT has been censored by OpenAI's "safety" morons.
We're saved by Musk yet again.
</aside>

- https://jyywiki.cn/Reading_List.md (Hero worship of von Neumann, the benefits of true-belief cults)


- NSF and other funding is running dry and is frequently allocated to bad and useless things
  - Yanyan's letter makes it clear that running government-funded research in the 'business-as-usual' case, leads to a sustaining feedback loop of nonsense, running in circles, and producing nothing of value other than every party shaking each other's hand and handing over money, status, prestige, papers, in a circle
