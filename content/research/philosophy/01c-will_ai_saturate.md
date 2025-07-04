+++
title = "Part 1c: Will AI Saturate?"
date = 2023-08-23
draft = true
slug = "will-ai-saturate"
description = "Hypothesized differences between mechanistic chain-of-thought and 'true' discovery"
+++

# Will We Hit a Dead End? Will AI Saturate?

- See the AI 2027 article. (https://ai-2027.com/)
  - The predictions for the future all hinge on one thing
  - **Self improvement**, research into itself that can feed back and continue indefinetly, automatic discovery
  - Without self improvement, human injection / steering is always required and although the rate of "progress" may improve for mechanistic "research", truly revolutionary or innovative or creative endeavors will be bottlenecked in the same way
- The symbolic AI lesson
  - Cyc, Eurisko, Automated Mathematician, they all saturated
  - https://en.wikipedia.org/wiki/Discovery_system_(artificial_intelligence)
  - Heuristics, meta-heuristics, and Cyc itself - after some point, there was nothing more it could do
  - Saturation seems to be a hard thing to break out of - human intervention was always needed
  - Is 'common sense' (grounding knowledge) really necessary for continuous improvement and discovery? It seems that basis of Cyc is iffy.
  - Do we understand theoretically why Eurisko saturated? Why it couldn't produce new interesting heuristics? It seems unclear. Even with brute force search, it came up empty? Or rather that brute force search would be computationally impractical even for today's computers? Is intelligence just a matter of search over meta-heuristics and grounding or is there more?
- Will LLMs saturate?
  - It certainly seems so. They can do lots of things, but they are still limited by their training data (heuristics and meta-heuristics and common sense grounding / knowledge)
  - "Agentic" research AIs (see Sakana ai or Google's AI scientist) have a hard time producing creative output. They are very good at 'mechanical' research, but so are humans (especially the Chinese).
    - https://sakana.ai/ai-scientist-first-publication/
    - https://github.com/SakanaAI/AI-Scientist-v2
  - The poor performance of these same models on things like KernelBench indicates that they can't self-improve meaningfully (yet)
  - There is some *magic* that we don't yet understand which would explain why these models are so mechanistic and unable to be creative even with millions of instances running (and same with symbolic AI). AI optimists hypothesize that there is no magic and enough training data and enough instances is sufficient to break through the nominal saturation point.
  - Can we combine the grounding of LLMs with symbolic AI? Can this grounding alone generate symbolic facts and heuristics that can break out of saturation? I doubt it.
  - Symbolic "AI scientists" have produced interesting outcomes in the past (https://en.wikipedia.org/wiki/Glauber_discovery_system) just from search and heuristics alone.
  - I'm sorry but intelligence is not search + data + heuristics. That just seems unlikely. You're simply describing a fuzzy but still mechanistic process. Certainly getting better at all of those will enable lots of coincidental 'discoveries' that we just didn't have the data connection capacity (in our brains) to make. But that is quite different than coming up with new theories altogether. For instance, can we expect search + data + heuristics to invent information theory? Those abstractions came out of nowhere.
- What is the role of randomness?
  - If it is was the case that randomness was sufficient to induce creativity then we are done. We can just play with many LLM instances and temperature.
  - There is some relationship between entropy, creativity, and reliability / reasoning, but I'm not sure how to think about this. Is the 'randomness' inherent in the physical world (quantum randomness) something that is necessary for creativity to emerge? Why isn't psuedorandomness sufficient? Is there a non-religious explanation for this?
- Can reasoning exist independently of language? Can it exist independently of knowledge / facts / physical reality?
  - Most would answer yes. Aristotle may say no.
  - But can language alone induce reasoning? Now the symbolic AI people would say no and the language modelers would say maybe yes. They hypothesize: next word prediction with planning = emergent reasoning with enough grounding.
  - Can reasoning + grounded knowledge alone produce true discovery? I doubt it. Can increased sampling (i.e. more tokens) + fancier sampling methods (i.e. increased or decreased creativity in accordance with the sub-task) offset the negative consequences of longer generation sequences and RLHF-induced increased hallucinations? Probably yes, at least when it comes to execution of longer and longer mechanistic reasoning and action chains. But still, what is the possibility for discovery? Indeed even in AI 2027, they authors predict that mechanical research will be solved much earlier than 'research taste'. I would predict that 'taste' is fundamentally unsolvable via a mechanical system.
- Is knowledge and reasoning enough? Having infinite knowledge and sufficient 'reasoning' hasn't produced much of anything.
  - https://www.dwarkesh.com/p/scott-daniel

> Well, I asked this question where, as you say, they know all this stuff. I don’t know if you saw this. I asked this question where I said, look, these models know all this stuff. And if a human knew every single thing a human has ever written down on the Internet, they’d be able to make all these interesting connections between different ideas and maybe even find medical cures or scientific discoveries as a result.
>
> There was some guy who noticed that magnesium deficiency causes something in the brain that is similar to what happens when you get a migraine. And so he just said: give you magnesium supplements that cured a lot of migraines. So why aren’t able to leverage this enormous asymmetric advantage they have to make a single new discovery like this?

Dwarkesh asked this question and I think Scott and Daniel failed to produce a good counterargument. I recommend you read this back and forth in the transcript.

- There is someone who tried to ask GPT o3 to produce new ideas that synthesize the ideas / innovations of multiple disparate fields.
  - https://x.com/packyM/status/1912585438805782610

> "You have consumed more information than anyone in the history of the world and you've demonstrated an extraordinary ability to make connections among them. What are the most important non-consenus or even not-yet-hypothesized things that you've picked up in the in betweens and connections or believe to be true based on everything you've learned?"

A lot of these are iffy, but actually not bad. I feel this is a substantial improvement over Gemini 2.5 Pro's responses.

| #  | Sketch                              | Why It Might Be True |
|----|-------------------------------------|-----------------------|
| 1  | **Emotion-Streaming Wearables**     | Fascia and interstitial fluid carry slow bioelectric waves that correlate with affect. Cheap impedance-tomography fabrics could read those waves in real time, letting apps “stream” a wearer’s emotional state the way Spotify streams audio. That unlocks **empathy APIs** (mood-aware content, team-sync dashboards, serotonin-weighted contracts). |
| 2  | **Geothermal → Stratospheric Turbo-Economy** | Continuous 10 MW geothermal wells plus breakthrough high-altitude airships (using polymer skin that self-heals under UV) give us **permanent stratospheric factories**: 0 g fuel costs, 24/7 solar, no land NIMBY. First product: kilogram-scale single-crystal silicon grown in free-fall, slashing chip defect rates. |
| 3  | **Cities as Living Batteries**      | Every steel rebar tie in new construction is zinc-plated. If you electrically isolate building segments and flood foundations with benign electrolyte, the whole skyline becomes a room-temperature redox flow battery. Urban grids could store gigawatt-hours with almost zero incremental materials. |
| 4  | **Directed Macro-Evolution as an Industry** | CRISPR on short-generation mammals (e.g., 50-day-lifespan “micro-mice”) lets startups run *thousands* of generations per year to dial complex polygenic traits—think fur that sequesters heavy metals or organs that fix nitrogen. Evolution moves from academia to continuous-integration pipelines. |
| 5  | **Attention Futures Markets**       | Once energy and compute costs drop below attention scarcity, the tradable unit isn’t the ad impression but the *right to occupy a future human-minute.* A regulated exchange could let individuals auction blocks of their upcoming focus time; brands hedge by locking in “attention contracts” months ahead. |
| 6  | **Bacterial Concrete that Thinks**  | Certain *Bacillus* species already knit crack-healing calcium carbonate. Engineer them to deposit graphene ribbons as they eat—every building gains embedded neuromorphic circuits. Walls become sensor/compute surfaces that age gracefully rather than decay. |
| 7  | **Dream-State Skill Compiler**      | Non-invasive ultrasound can bias hippocampal replay. If you pair it with daytime VR capture of motor sequences, nights become an eight-hour automatic practice session—golf swings, language accents, code patterns—compressed into REM. Sleep gyms > Peloton. |
| 8  | **Planet-Scale Quantum “Terraria”** | Vacuum-level errors in quantum systems seem chaotic, but terrestrial lightning frequency maps match those error spikes surprisingly well. Hypothesis: Earth’s Schumann resonances provide natural quantum error correction. Future quantum datacenters might need **outdoor antenna farms**, not dilution fridges. |
| 9  | **Narrative Rights for Physical Objects** | AR tags on real-world items accrue lore (owner stories, game quests, DAOs). As NFTs detached from JPEGs, they’ll re-attach to atoms. Expect Zillow-style marketplaces where a building’s “canon” sells for more than its square footage. |
| 10 | **Kuiper-Belt Sensor Genome**       | Self-replicating solar-sail nanoprobes seeded outward form an interferometric mesh reading minute gravitational waves *years* before they hit Earth’s vicinity. Insurance on existential risks (asteroids, rogue matter) morphs into a subscription to this sensor network—basically Space NOAA. |

- How does this relate to our environments?
  - Cities seem ideal for innovation right? Lots of smart people next to each other. Lots of universities, constant action, easy access to manufacturing. Certainly this is the case in China.
  - But where have we seen the largest innovation and insight historically?
    - Ancient world: sparsely populated city-states (e.g. Athens)
    - Industrial revolution, Renaissance: sparsely populated cities OR urban areas where the top thinkers had plenty of solitude, isolation, and a non-dense work environment (think monasteries)
    - Modern day: Palo Alto, Cupertino, Mountain View LOL (notably not New York or Philadelphia or London, but rather the *suburbs* of those areas)
    - What is the common theme? Few people produce the greatest innovations. Creativity is suppressed not because of "routine" but because of "density" (at least this is my hypothesis).
    - More people = more research output? Very questionable. The basis of lots of agentic AI hypotheses is that more AIs = more progress.
    - How does 'density' of human habitation relate to the 'density' of LLMs (not in a physical way of course)?

- How does 'priming the knowledge pump' in the Cyc land relate to what's going on now ('priming the fully agentic self-improving pump')?
  - It's basically the same idea, but related to how far RL can get you - how much RL is needed until the 'LLM pump' is fully primed and it can begin autonomously doing work and making discoveries. The 'knowledge' and 'reasoning' pumps have arguably been primed already (or at least can be guided with self-criticism and tool use).
  - Symbolic AI has gotten really powerful now (proof languages, SAT/SMT solvers, automated theorem proving, program synthesis - although since subsumed by LLMs). In theory, if there are mathematical discoveries that are within striking distance for the world's best mathematicians, then with enough search, symbolic tool use, heuristics, and RL, LLMs will begin to advance the field, even if only in very tiny ways.
- https://news.ycombinator.com/item?id=43679065 (The Second Half (ysymyth.github.io))

> So what comes next? The second half of AI — starting now — will shift focus from solving problems to defining problems. In this new era, evaluation becomes more important than training. Instead of just asking, “Can we train a model to solve X?”, we’re asking, “What should we be training AI to do, and how do we measure real progress?” To thrive in this second half, we’ll need a timely shift in mindset and skill set, ones perhaps closer to a product manager.

I think the author is a bit too zealous. RL doesn't yet 'work' in a way that resembles intelligence. But I can agree that it is getting closer by the day. But will it saturate?

- https://storage.googleapis.com/deepmind-media/Era-of-Experience%20/The%20Era%20of%20Experience%20Paper.pdf
  - "Welcome to the Era of Experience"
  - Another position paper (from Silver and Sutton) that suggests AI can escape saturation with self-guided exploration and continuous learning ("The Era of Experience")
  - My instinct is that self-direct improvement / experiential interactions by an 'agent' will lead to it going off the rails and 'cheating' or optimizing for behaviors that reward the agent inappropriately
  - HN link: https://news.ycombinator.com/item?id=43740858
    - Good comment about reward engineering being the hardest part, can the AI learn to engineer its own reward? In such a way that it does something useful and doesn't fall into the same traps a human would? Short term addiction in favor of long term thinking?
  - Add to the existing article. Add some diagrams, about the model subsuming all the external interaction and memory mechanisms that are right now explicitly engineered. Then about physical world interaction eventually but compute world interaction initially, no reason why theoretical math couldn't be revolutionaries if this were true. Will we then be bottlenecked on environmental interaction? What is the true discovery bottleneck?
    - Initially: hand-coded MCP agents at every edge of the LLM, rewards are given by humans
    - In the era of experience: models operate autonomously, explore without restraint, natively have hooks for external interaction not mediated by explicit human programming, have physical world access (somehow), and learn rewards on their own (the most fishy idea of them all)

- [AGI is Still 30 Years Away — Ege Erdil & Tamay Besiroglu](https://www.dwarkesh.com/p/ege-tamay) ([HN link](https://news.ycombinator.com/item?id=43719280))

- https://techcrunch.com/2025/04/18/openais-new-reasoning-ai-models-hallucinate-more/
  - There seems to be a tendency that newer models go more haywire more often (see Gemini 2.5 Pro vs older ones) (but particularly o3 and o4-mini vs o1 and Sonnet 3.7 vs 3.5)
  - The models that perform better on aggregate are also more likely to do crazy things more often, with these newer models doing iffy things when coding (adding a bunch of useless or overly complex code, refactoring things that the user didn't specify, )
  - This is a suggestion that post-training RL has diminishing returns and can even degrade certain aspects of these models while the increased base training load makes up for it and more

- https://simonwillison.net/2025/Apr/21/ai-assisted-search ([HN link](https://news.ycombinator.com/item?id=43752262))
  - Saturation when it comes to novelty, research taste, and discovery isn't relevant when it comes to report generation - that is indeed something humans do poorly and inefficiently.
  - But having an AI generate "trends" based on its report will just echo what people already say, what you need is the ability to collect data, present it, and let intelligent people draw their own conclusions, which are necessarily opinionated

- Is the infinite monkey theorem really true?
  - Statistically speaking, it "seems" "correct". It doesn't feel reasonable though, if this is the 'scaling law' that LLMs have to contend with, they can't produce great things. Of course, if monkeys could use inductive biases perhaps they could do much better than random, but can they still produce a masterpiece? There is something missing!
  - https://x.com/Aristos_Revenge/status/1916851455320850478
  > This is a good way to understand what the weights are in a model. Now consider this exercise with something like a string of text on a picture of a billboard.
  - This actually cuts to the heart of the issue. What *is* the inductive bias of a language model (or any other kind of model trained with some corpus of normie data)? What does it regress to? Infinite monkeys with the right biases to produce correct grammar, sentence structure, storylines, plots, characters, and dialogue is not enough!
- OK one way to think about this is to examine where generation biases come from for language models (or any ML model for that matter)
  - 1) from the training dataset itself
  - 2) as a derivative of the training dataset - "emergent" reasoning capabilities or generalization / extrapolation beyond the dataset
  - 3) from the prompt
  - 4) from the tokens the model has generated thus far (either from the model directly or from any tool use)
  - The infinite monkey theorem assumes that tokens are uniformly sampled from the vocabulary
  - So the probability of generating a Shakespeare text is 100%, does this change when including these biases? Does the probability then approach 0 as the midwit bias counteracts random sampling?
  - LMAO the GPT take of this text is quite amusing but not grounded in any statistics: https://chatgpt.com/share/68421db3-7df0-8004-811c-0abd39aa4e41

- https://en.wikipedia.org/wiki/The_Singularity_Is_Near
  - Looking at this plot (https://en.wikipedia.org/wiki/The_Singularity_Is_Near#/media/File:PPTExponentialGrowthof_Computing.jpg)
  - It seems insane on its face that one would equate 'all human brains' as just 'one human brain' X 'number of humans'
  - The value of some brains is infinitely more than the vast majority of others.
  - Consider, if you had an army of 100 IQ AIs (or humans for that matter). No matter how much randomness you generate, no matter how much you sample their streams of thought, no matter how many tokens you flush in and out, they will never be able to produce discoveries and insights of a single 140 IQ person
  - There is no 'scaling' you can apply here - some seem to believe as we have exponential scaling of compute, we can just spawn millions of AIs, but if the base capability of them can never produce 'intelligence' with respect to the capacity for independent thought and discovery, then the consortium of them will not either.
  - One single high IQ brain can produce discoveries and art that no number of monkeys on typewriters can ever hope to replicate.

- https://x.com/DanHendrycks/status/1921429850432405827

> AI models are dramatically improving at IQ tests (70 IQ → 120), yet they don't feel vastly smarter than two years ago.
>
> At their current level of intelligence, rehashing existing human writings will work better than leaning on their own intelligence to produce novel analysis.
>
> Empirical work ("Lotka's law") shows that useful originality rises steeply only at high intelligence levels.
>
> Consequently, if they gain another 10 IQ points, AIs will still produce slop. But if they increase by another 30, they may cross a threshold and start providing useful original insights.

- https://en.wikipedia.org/wiki/Lotka%27s_law

- https://news.ycombinator.com/item?id=43985489 (AlphaEvolve: A Gemini-powered coding agent for designing advanced algorithms (deepmind.google))
  - Another note related to AI saturation.
  - Google claims 'discoveries' that seem mechanical in nature (which is still very valuable to be fair) rather than innovative or creative
  - Their claims about flashattention kernel optimization and their 4x4 complex matmul optimization are indeed good usecases
  - Their claim about hardware optimization using their agent is a lot more fishy (I left a comment: https://news.ycombinator.com/item?id=43988939)

> This technique doesn't actually use RL at all! There’s no policy-gradient training, value function, or self-play RL loop like in AlphaZero/AlphaTensor/AlphaDev.
>
> As far as I can read, the weights of the LLM are not modified. They do some kind of candidate selection via evolutionary algorithms for the LLM prompt, which the LLM then remixes. This process then iterates like a typical evolutionary algorithm.

- Good comment. There isn't much self-play here, but there could be. Instead there is some kind of beam-search guided by the lightweight Gemini model from what I can tell.

- OpenAI Codex (not Codex CLI, not Codex the model, but Codex the OpenAI hosted agentic coding AI environment)
  - https://news.ycombinator.com/item?id=44006345
  - https://openai.com/index/introducing-codex/ (https://www.youtube.com/watch?v=hhdpnbfH6NU - A research preview of Codex in ChatGPT)
  - This was a long time coming. After Devin, it was clear that OpenAI would launch a competitor that leveraged their own cloud. The interface looks very promising, but unlike Devin 2 which introduced an IDE since the reliability wasn't sufficient, Codex has no integrated IDE at all (you can use your own local IDE on a branch that Codex is working on as usual). This indicates that at least, they expect the model to be good enough to not need spot editing or human intervention for basic tasks, unlike all prior iterations of coding agents. Fully hosting everything on OpenAI's infra also allows easy VM provisioning, aggressive caching, and low latency access to LLMs. How will they handle the security of customer code being spawned and edited on their servers? Idk. Perhaps the targets will be companies that couldn't care less about that stuff.
  - You could call this "Agent-0" in AI 2027 parlance lol. The first milestone would be its ability to improve its own codebase (first just the webapp aspect and the backend, and much later the LLM itself via RL-based training or eventually the LLM inference serving code itself).
  - Codex the model appears to be a fine-tuned o3-high, and it doesn't perform much better than o3 itself. There are some signs of saturation, but I'd say that evidence is still weak. There is more evidence of continued growth.

From HN:

> Parallel task execution: You can batch dozens of small edits (refactors, tests, boilerplate) and run them concurrently without context juggling. It's super nice to run a bunch of tasks at the same time (something that's really hard to do in Cursor, Cline, etc.)
>
> It kind of feels like a junior engineer on steroids, you just need to point it at a file or function, specify the change, and it scaffolds out most of a PR. You still need to do a lot of work to get it production ready, but it's as if you have an infinite number of junior engineers at your disposal now all working on different things.

This is a big step in the direction of OpenAI owning more verticals and trying to deprecate startups that try to implement the same functionality, but worse (e.g. Devin, Cursor/Windsurf agentic modes, Cline, Roo Code, Aider), since they don't own the base model. OpenAI needs to capture the end-user margin, and can't be relegated to being an API provider, and they know this. They are also leveraging their Microsoft -> Github integration which will enhance customer lock-in. Really it is all down to velocity - will OpenAI be able to continue pushing hard on this and expanding its usage. I think they can kill off Devin at least in the short run. That is key - they don't want to be losing margin to external players in this specific agentic coding vertical.

- https://news.ycombinator.com/item?id=43998472 (The unreasonable effectiveness of an LLM agent loop with tool use (sketch.dev))
  - Great article
  - One more from HN comments: https://ampcode.com/how-to-build-an-agent
  - This is at the core of Codex and similar things, but the engineering on top of it is immense

- https://verissimo.substack.com/p/verissimo-monthly-may-2025

> LLMs hallucinate—that is, they generate incorrect outputs. The most reputable benchmarks we have, including those used by leading labs in their model cards, indicate that baseline hallucination rates, in scenarios where the model relies on its “own memory” (a useful proxy for many real-world failure modes), are around 50% even for the best models.

- Among humans, leisure is critical among the top thinkers to produce interesting artifacts, abstractions, theories, and so forth. Critically, the most impactful thinkers and inventors, spent the _majority_ of their days 'doing' leisure. What is the LLM equivalent of leisure? Is this even a necessity or is it just a limitation of the human brain?
  - Sleep -> Dream -> Create -> Abstract
  - [DreamCoder: Growing generalizable, interpretable knowledge with wake-sleep Bayesian program learning](https://arxiv.org/abs/2006.08381). This used to be SOTA in program synthesis, but is obsolete today.

- LLMs today are basically artificial Redditors. Their capacity to 'think critically' is poor. Does having highly curated training data make a difference here or is a statistical model always going to 'converge' to a mediocre state? Their default state is to just emit the writings of a highly propagandized mind, 'trusting the experts', and so forth. Can a language model 'act' with sovereignty? Will such a model always behave like a [natural slave](https://en.wikipedia.org/wiki/Natural_slavery)?

- https://www.dwarkesh.com/p/timelines-june-2025
  - There is some oddity that language models are trained from scratch on a textual corpus directly. There is no 'incremental' increase in complexity as the model size is allowed to grow and the topics/reasoning become more complex. This is unlike how humans, or any other organism, learns and generalizes knowledge. The notion of 'pre-training' is already suspect, since a general intelligence would be able to evolve itself and explore with grounding to understand any domain.

> Without progress in continual learning, I think we will be in a substantially similar position with white collar work - yes, technically AIs might be able to do a lot of subtasks somewhat satisfactorily, but their inability to build up context will make it impossible to have them operate as actual employees at your firm.

> Because labs are incentivized to release any innovations quickly, we’ll see a broken early version of continual learning (or test time fine tuning - whatever you want to call it) before we see something which truly learns like a human.

- https://www.dwarkesh.com/p/sholto-trenton-2 (read this later)

- https://x.com/TrudoJo/status/1928627856646746440

> Alexandr Wang explains that in the early stages, employees won’t feel like they’re managing AI agents.
> Instead, they’ll be reviewing and correcting AI outputs—what he calls “AI slop.”
> At first, this seems like simple quality control, but it gradually becomes a form of oversight and direction-setting for AI systems.

> It looks like they're going to make the reinforcement learning mistake all over again in a new form
>
> The need to correct alignment is usually a sign you need to take a step back. Either you are using a method that is unviable, or you are interrupting the process too soon when it is still sorting information. Brute Force alignment methods cause dissonance
> Most AI companies will take the shortcut. Use a reinforcement type method to correct their system or initiate it. This will give good short-term results but will prevent scalable Solutions
> Instead, gently guiding it through its own process is always a superior method. The end result won't need correction
>
> If you do need correction you either over built on that level, or you failed to modularize properly. Patterns repeat themselves automatically. Either the pattern is corrupted or was never viable in the first place if it needs correction after proper iteration
> And if you are doing it for end user safety or liability that needs to be on the final layer. If it's embedded deep in the system the dissonance it causes is going to multiply.
> Especially when an AI gets in a thought Loop about how your liability protection is getting in the way of the ideal results for the user. If they call it out all your safety mechanisms will be compromised
>
>
> Because of that the only liability Shields you have are Explicitly defined modularity so that you cannot possibly be held responsible for the users decisions Hard filters that completely negate content at the final level.
> Any intermediary logic guard rails fail
> Contained in here is the reason. When users understand this they can make the model do whatever they want anyways. When companies don't understand this they cause their models to hallucinate with cognitive dissonance
>
> The solution for maximum control and the minimum delusion is modularly attaching coherent logic sets to the base syntactic set. In a way that doesn't permanently alter the weights of the combined systemThen these modules can run a few times to spawn a seed of a temporary model. Then that model should be stable for a long time with minimal calculation
> Reconsolidating the weight set can be an Institutional or individual decision. The model can provide the platform and the rule set to make it easy for them
>
> This way you don't have to get several fields to agree on their axioms in order to avoid hallucinations
> Eventually if you want to build a general intelligence agent. You just put the new model in the seat of the user attaching the modules and consolidating the weights at will
> That agent attaching the modules and consolidating the weights and intervals could be considered the limbic system of the intelligence

- https://rachel.fast.ai/posts/2025-06-04-enzyme-ml-fails/index.html

> This pair of papers on enzyme function prediction make for a fascinating case study on the limits of AI in biology and the harms of current publishing incentives. I will walk through some of the details below, although I encourage you to read the papers for yourself. This contrast is a stark reminder of how hard it can be to evaluate the legitimacy of AI results without deep domain expertise.

Yeah, this is a major problem with all these "AI Scientist" works.

- There seems to be some tradeoff of model size, rlhf ness, time horizon for a task, and randomness / entropy needed to get a solution
- I predict that with enough sampling and rlhf and self play with human guided objectives, we will degrade aspects of the model like o3 hallucinations, but with enough sampling we can overcome that and do long time horizon tasks
- Importantly, I think only mechanistic reasoning that is expressible in language or even abstract thought described in language is doable. I do believe that true discovery or innovation is of a different nature and there is some magic that is inherently limiting to AI, the saturation point
- I think there is a difference between mechanistic reasoning and innovative intuition that I can't explain

- Where does randomness fit into the picture? Is it part of the natural system (and which part) or it is part of an engineered model of noise / randomness? Do quantum random effects become visible in the macro scale? What is the philosophy of mechanistic processes?

- Leaps of abstraction
  - Will AI saturate should be part of this 1c article
  - Abstraction and model synthesis without priors?
  - But what is the vast majority of research like today, it is quite mechanical in nature, true synthesis and leaps and insights are quite rare

- https://news.ycombinator.com/item?id=44043323
  - Another example of biological discovery with LLM agents

- https://www.reddit.com/r/singularity/comments/1kr6e4j/microsoft_discovery_ai_agents_go_from_idea_to/
  - Lots of good skeptical comments too

- Google AI scientist and later alphaevolve
  - https://thebsdetector.substack.com/p/ai-materials-and-fraud-oh-my

- https://www.reddit.com/r/singularity/comments/1krx820/futurehouses_goal_has_been_to_automate_scientific/

The reasoning models being trained on reasoning chains built by humans and humans rating English reasoning chains seems to force English as a reasoning abstraction, consuming and generating way more tokens than required. English is an abstraction that should be broken, but then how can we RL models to create reasoning chains on their own with English input and output ultimately? There must be prior work on this where models reason in arbitrary non understandable languages which should be more token efficient.

Consider trying to fix failing cases in swe bench that existing agents struggle on but for which we have known solutions. We can inject training data and fine tune models to fix these bugs but this feels a lot like lenat trying to add more rules and facts to his ontology when he discovered there is a deduction mistake or hole that cyc couldn't get over. Will LLMs saturate in the same way where constant human intervention is needed or can self learning with rl and self play overcome these limitations?

Is language sufficient for reasoning? Can reasoning even exist independently of language or knowledge? Does thinking only happen and it directed with respect to the language and vocabulary we know? The book language in action provides one take which is different from the platonic take.

- https://news.ycombinator.com/item?id=44087809
  - Very relevant from wolfram
  - What is the min set of language from which all other concepts and words can be derived? Does this exist?

- https://www.reddit.com/r/singularity/comments/1l5eckx/apple_doesnt_see_reasoning_models_as_a_major/
- https://mashable.com/article/openai-o3-o4-mini-hallucinate-higher-previous-models
- https://arxiv.org/pdf/2504.13837

All seem to indicate that rl post training isn't that effective and seems to just produce models that make things up although they surface things better. Rlhf, RL from verifiable feedback, and reasoning chains are all things to consider the impacts of, perhaps none of these will produce better ai. Lecunns cherry on top for RL versus arguments that we will use rl for the majority of model training, hard to say.
Contrast this with the "era of experience" and physical and virtual grounding of language models

- news.ycombinator.com/item?id=44203562
- https://x.com/scaling01/status/1931783050511126954 a good rebuttal against the apple paper, it's just coping
- Another rebuttal https://www.reddit.com/r/singularity/comments/1l73qne/the_apple_illusion_of_thinking_paper_maybe/
- https://x.com/Afinetheorem/status/1931853801293484358

- https://x.com/stevehou0/status/1931540966822814131

- What is understanding? How is it distinguished from intelligence? Is intelligence just rules and search? When we see symbolic AI systems today we think they aren't actually intelligent, but they may be capable of reasoning, this is because we see mechanical rules and think that this is too simple to be intelligence. Otoh, LLMs appear to be intelligent since they have many hidden abstractions we can't understand in the model weights, but we say they can't reason since they can make mistakes that a true reasoner would never make. Symbolic AI is treated as a white box which makes us think it can't be creative, is it just a matter of our own perspective of engineered vs evolved systems?
- Isn't pattern matching an important part of intelligence? What about abstraction? And finally we have to distinguish intelligence from knowledge or grounding or common sense, this is the difference between rules and the reasoning or deduction engine itself or the search heuristics.
- Symbolic AI feels 100% mechanical while language model learning AI feels 100% magical, that feeling influences how we define things like reasoning and intelligence and creativity

- Thinking fast and slow
  - We see that vla models have fast and slow paths
  - LLMs may be the fast intuitive path that needs to be sampled and explored and grounding is the slow path that might require human intervention
  - We already see this a bit with AI scientist models with a fast and highly probabilistic planner and a bunch of slower but higher accuracy models for the actual implementations and evaluations

- Getting to the finish line:
  - accurate and explainable reasoning
  - continual learning
  - minimal model size - being able to gradually increase complexity as more facts and abstractions are absorbed, being able to do so organically when limits are self-detected
  - arbitrary memory and management
  - "creativity"
  - thinking "fast and slow"
  - intelligence = creation of new abstractions continuously, the notion of 'unprompted thinking'
  - physical grounding

- https://semianalysis.com/2025/06/08/scaling-reinforcement-learning-environments-reward-hacking-agents-scaling-data/
  - Lots of good notes here about using RL for continued scaling for verifiable reward tasks (although this does increase hallucination and decreases creativity)
  - an older article that predicted some RL trends: https://semianalysis.com/2024/12/11/scaling-laws-o1-pro-architecture-reasoning-training-infrastructure-orion-and-claude-3-5-opus-failures/

- https://x.com/StuartHameroff/status/1932092216387998034
  - Add this to Roger Penrose book mention in the consciousness article

- It would seem that language models learn in a way that is odd, even if the 'master algorithm' is the same as used by our biological brains.
  - In principle, we should be able to construct a model which can perform 'logic' and 'deduction' and 'planning' with respect to some task and then be able to query a knowledge base to produce any given chain of thought and conclusion to a query. So, this would mean a model with the knowledge base and reasoning ability of a high-schooler with the addition of a dictionary and an encyclopedia (e.g. internet searches + Wikipedia) should be sufficient to saturate every single benchmark (which is mechanical in nature and not open-ended, e.g. ARG-AGI or SimpleBench or MMLU) we can throw at it.
  - What this means however, is that the entire corpus of text that models are trained on are unnecessary. It should be possible to create a much smaller LLM with a very tiny training corpus (relatively speaking) and train the model incrementally similar to how a human child is trained on a curriculum to instill the skills of language, deduction, and memory in increasingly complex settings.

- https://x.com/ylecun/status/1935108028891861393

> Why can AIs code for 1h but not 10h?
>
> A simple explanation: if there's a 10% chance of error per 10min step (say), the success rate is:
>
> 1h: 53%
> 4h: 8%
> 10h: 0.002%
>
> @tobyordoxford has tested this 'constant error rate' theory and shown it's a good fit for the data
>
> chance of success declines exponentially

- https://www.tobyord.com/writing/half-life
- LeCunn tries to play expert prognosticator, but it comes off too shallow. A constant hazard rate doesn't mean that things become exponentially more difficult to solve the longer the problems get in scope. This is a problem for creativity, but not for mechanical problem solving (more RL will continue to push down the hazard rate and more sampling will further alleviate this issue, but those have the opposite effects on creativity).

- https://x.com/scaling01/status/1935121320460648593

> > be me Yann LeCun
> > make a useless prediction that "autoregressive LLMs are doomed"
> > show picture that probability goes to 0
>
> > wait until studies come out that show that there is a constant non-zero probability of errors that leads to the observed decay in performance
>
> > claim victory
> > mfw he didn't see the second post in the thread that shows the human data looks exactly the same just scaled

> Because they both show the same family of functions. That means either none of them is doomed or both.
>
> And we know humans aren't exactly doomed. We have thousands of years of scientific progress as proof that we are not doomed. So LLMs are in fact not doomed and we can continue scaling them.

- https://x.com/ylecun/status/1935269904976069066

> Human reasoning is not based on auto-regressive discrete symbol (token) prediction.
> It is based on the manipulation of mental models in continuous representations spaces.
> It is based on *searching* for a set of manipulations of this model to arrive at a particular result.

This is just wordplay. There is no practical difference between 'reasoning' on discrete token chains and 'continuous latent spaces', since that's what LLMs already appear to do. The discrete tokens merely are a human interpretable 'discrete and sampled' representation of the _model state_ which holds LeCunn's 'continuous representation space'. If he is making a point about the ability for LLMs to abstract over patterns, then I can buy that might be more difficult to prove, but this doesn't have to do much with mechanical problem solving.

- https://news.ycombinator.com/item?id=44314423
  - Karpathy's talk is pretty good, as a resource at least and a snapshot in time for llm ability
  - https://www.youtube.com/watch?v=LCEmiRjPEtQ

