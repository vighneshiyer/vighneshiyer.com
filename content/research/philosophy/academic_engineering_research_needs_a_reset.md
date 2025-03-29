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

The Chinese still look to America for fundamental innovations in every sector that they quickly adopt and adapt.
That is the case, until it isn't, for example, in the field of drones where the Chinese took early American innovations and quickly overtook them with vertical integration and optimization (i.e. DJI).
The same trend is playing out in humanoid robotics with plenty of innovations from Boston Dynamics (both publicly and privately funded) being optimized and extended by the Chinese humanoid leader Unitree.

One way to stay ahead of the Chinese is to not allow domestic fragmentation and extraction only at the upper end of the value stack, but to try pushing on domestic vertical integration.


<aside>Academia built the first-iteration of many AI innovations that industry has run with. Industry must fund academia strategically.</aside>

Chris notes that attention, the Mamba architecture, FlashAttention, many ML compilers, and so forth came from academic research first before being adopted commercially.
To some degree, industry has been eating a free lunch sponsored by the federal government, when it is perfectly capable of funding its own research efforts.
I believe one point Chris is making is that the current model of university funding, with all its inefficiencies, corruption, and graft, crowds out funding that would naturally come from industry.

> We should get rid of the needless complexity of compliance and allow professors to engage more flexibly with industry. We need new models for collaboration, as Stanford no longer benefits as much as it could from brilliant former professors like Daphne Koller, Andrew Ng, Sebastian Thrun, and Bill Dally (CTO NVidia).

If industry is to fund research, then it must be completely divorced from the uselessness of current-day government funding (e.g. NSF, DoD), where knowing the program director is crucial, and the actual project proposal has little value.
The value proposition of the research, even if only realizable in 10+ years, must be clear to the funders, who are placing a hedge on the future.

<aside>
Academia is not industry-lite.
Academics should take risky long-term bets that are still grounded in eventual value.
</aside>

Aside from the funding issue, is the question of what engineering research belongs in the realm of academia.
Academics should not be doing random nit optimizations of existing ML models that industry researchers are perfectly capable of doing.
Without taking sufficient _engineering_ and _intellectual risk_, academic research is just an inferior version of industry research done by poorly paid students with scarce resources.

My view is that academics should focus on _tools, methodologies, abstractions, and theories_.
Not on products.
Naturally, if academic funding is industry driven, nit research and useless paper pushing will be on its way out, while long time-horizon, risky, and high-impact research will flourish.

To make this concrete, I
- Intel's funding of ASPIRE is a great example of the proper role of industry and academic engineering research

<aside>Many academics today don't belong in academia.</aside>

Although Chris does not say this outright, I believe it is implicit in his article.


## The Computer Architecture Case

Krste Asanovic is the equivalent person on the computer architecture side (RISC-V, spike, Rocket, Hwacha, Chipyard, FireSim, and on and on). There is an even longer history here that includes David Patterson, and stretching as far back as von Neumann.

The Chinese are experts here in industry/academic collboration

## Yanyan's Letter

It reminds me of [the letter](https://jyywiki.cn/Letter.md) that Prof. Yanyan Jiang of Nanjing University wrote ([ChatGPT translation](https://chatgpt.com/share/67e86a54-2dd8-8004-a376-2c82ece77f03)).
I encourage everyone to stop and read his letter now.

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
