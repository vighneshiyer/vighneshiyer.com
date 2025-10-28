+++
title = "What is Good Engineering Research?"
date = 2024-03-23
draft = true
+++

# What is research?

The term itself is polluted. Is "engineering" "research"? Does the field you are in determine what research is? Is implementation necessarily just 'infrastructure' that doesn't rise to the level of 'research'?

I argue that instead of talking about research, we should simply talk about good, irrelevant, mediocre, and bad work. And furthermore, we must understand what work should be done where. We also talk about what motivates the work to begin with. What work has good impact?
Finally, from the academic engineering research perspective, we discuss what broad categories of research would fall into good and bad buckets (and in the middle), and provide examples of each.

What is _good_ _engineering_ research?

As we have seen, the core of engineering is abstraction. Therefore good engineering research must be abstraction-oriented.

Application-driven vs application-oriented research.
  - Driven is often too direct
  - Oriented makes us see the abstractions that are common to applications

- "It works" is the worst argument
- If it ain't broke don't fix it
- Does it work well
- Is it optimal?
- Is it beautiful?
- Is it euphoric? Euphoric apis and where to find them
- Create a philosophy section of website, as a subfield of research
- I will place this article and comp arch article there

- What would you like to show, investigate, elucidate, quantify? Is there something to build in a unique way?

- What risks to take? Implementation risk vs intellectual risk, this is key
- there is also future looking risk (prediction risk)

- generalize something specific: (build new abstractions) -> e.g. building halide to generalize common kernel optimizations and systematically and correctly apply them and then use it to explore shape specialized kernel generation. e.g. building a tool that can analyze the DSP RVV extensions Daniel added and find a way to automatically extract those instructions and ways to use them given some piece of code (aladdin seems similar in some ways).
- Don't sweep the design space but build the design space!

- x.com/_jasonwei/status/1929621539881996607

> There are traditionally two types of research: problem-driven research and method-driven research. As we’ve seen with large language models and now AlphaEvolve, it should be very clear now that total method-driven research is a huge opportunity.
>
> Problem-driven research is nice because you have a consistent and specific goal. The goal is usually virtuous, so it feels good to have a mission and identity. However, it just doesn’t work due to The Bitter Lesson. Basically everything in classical NLP (machine translation, summarization, chatbots) lost to simple scaling. ChatGPT is a prime example—it used nothing from chatbot research and certainly wasn’t the intended end goal of OpenAI’s 2022 research program, but was a huge hit because someone (John Schulman et al) figured out the right way to package large language models as a product.
>
> Method-driven research feels less stable because you’re constantly searching for problems and you have to be opportunistic. But I believe AI will allow method-driven research to dominate progress in most fields of science, one-by-one. The latest method (or “hammer”), as we’ve seen in AlphaEvolve, is ruthless search and optimization against a reward function (whether this requires RL or not is a separate discussion). Things that problem-driven researchers have been trying to solve for a long time like the kissing number problem will become nails hit by the hammer. Eventually the hammer will become bigger, stronger, and more general and will hit more and more nails.
>
> So a very important meta-skill for the next decade will be knowing how to create the right environments to use The Hammer. Ironically, the problem-driven researchers, who by definition are experts in a specific problem, are well-positioned to create these environments. If, that is, they can put down their egos and pick up the hammer.

## Research

### Engineering

## Purity

## Academic vs Industrial Engineering Research

Isn't product development research itself?

## What Makes Research Good vs Bad vs Irrelevant vs Mediocre

## Other Perspectives

- https://x.com/pmddomingos/status/1897407091406684633?t=a8MSULvgbvsqJbZB3KCvLQ

> If your research consists of doing the same hacks that people in industry can do at any time, then it’s not research. Research is solving problems that are too deep, difficult, long-term, diffusely beneficial for industry to focus on.

Hamming

Patterson

## A Bit More Philosophical

### What is value?

What is valuable in this world? Only material things and things (theories, engineering) that can produce material things?

Is beauty intrinsically valuable?

### What is worth doing?

Is extrinsic value the only thing that makes research meaningful? Can research derive value independent of external value?

### What is meant by "impact"?

- Is novelty important? Does it correlate with value and impact? Not really especially in engineering disciplines
- Who is qualified to judge novelty?
- What is purity? Is it important? Is there a spectrum? How much is only due to the discipline and not the research itself?
- Mention some hazy research blog posts as having more value than thousands of useless papers

- A great analogy to the uselessness of novelty is to look at patents, every new thing must be novel but what does that really mean?
- Patents measure novelty but are those the measures of impact or value? Think about how this applies to commercial products too, not just academic research

- https://gwern.net/doc/science/1986-hamming
- https://www.mccurley.org/advice/hamming_advice.html
