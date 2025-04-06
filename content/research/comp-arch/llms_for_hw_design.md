# LLMs for HW Design

- https://www.zach.be/p/yc-is-wrong-about-llms-for-chip-design

## The Sales Pitch

- Fully autonomous English high-level 'spec' to GDS (or at least RTL + testbenches + regression tests + a partial formal spec for a large subsystem)

## Model Scaling Trends

- fine tuning is often outstripped very quickly

## The Training Data Problem

Can unsupervised learning be helpful here?

## Agentic AI Frameworks

- where the value truly is

## Generic > Specific

- "domain-specific" LLM startups have a very short runway
- generic agentic AI tools will outstrip specialized ones with model scaling and vast queryable datasets
- startups are the wrong place to build specialized tools that depend on rich training data

- https://news.ycombinator.com/item?id=42672790 (AI founders will learn the bitter lesson (lukaspetersson.com))

https://ahmedheakl.github.io/asm2asm/
ahmedheakl.github.io
From CISC to RISC: Language-Model Guided Assembly Transpilation
From CISC to RISC: Language-Model Guided Assembly Transpilation

Very insane idea lol, applied llm research is becoming such a joke
22 replies
  Today at 1:00 PM
do u think this is solid or not solid work
  Today at 1:07 PM
I mean it is a joke, you can't have less than 100% translation accuracy
  Today at 1:34 PM
is there existing 1:1 100% translation accruacies?
  Today at 1:39 PM
See Apple's Rosetta
  Today at 1:50 PM
oh true
1:50
hmmm as a path finding paper it is fine
1:50
if the new method does not beat baseline
1:50
as long as they don’t claim it is better
  Today at 1:53 PM
yeah i'm ok with the claims they make in the paper, nothing dishonest
1:53
but really this is monkey-tier research
  Today at 1:58 PM
you know what, i bet that if you used an llm to write code + verification collateral for x86 to arm translation, it would perform better than using the llm itself to do translation
  Today at 2:18 PM
yes llm generate the transform rather than writing the code
  Today at 2:22 PM
it seems most of their benefits come from tokenizer tuning, which makes sense, but is this really interesting research lol?
2:22
llm for X can lead to nonsense directions
  Today at 2:46 PM
well isn’t my thing also llm for X lol
2:46
tehcnically
  Today at 2:48 PM
yes indeed, llm for X has very high risk tolerance nowadays, it doesn't seem to be a reasonable thing to do in academia, which is a place for high risk / uncertain reward bets
2:49
furthermore, llm for X domain-specialization will be superseded by more general approaches, at least this seems to be the trend
  Today at 3:27 PM
yeah i wanan develop more domain specific techniques from investigating LLM for X settings
  Today at 3:35 PM
domain specific techniques might be useful in the short term, but i suspect they will be increasingly obsoleted as more general versions of those techniques (perhaps as plugins) will be integrated into general purpose llm-based development platforms (e.g. replit)
New
  4 minutes ago
well i think we need general purpose technique and reasoning is generally good to develop from code as a setting
5:16
chatgpt was developed with a lot of coding tasks too which significnat incraesed is reasoning skill
