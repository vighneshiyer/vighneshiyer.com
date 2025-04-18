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
- What is the role of randomness?
  - If it is was the case that randomness was sufficient to induce creativity then we are done. We can just play with many LLM instances and temperature.
  - There is some relationship between entropy, creativity, and reliability / reasoning, but I'm not sure how to think about this. Is the 'randomness' inherent in the physical world (quantum randomness) something that is necessary for creativity to emerge? Why isn't psuedorandomness sufficient? Is there a non-religious explanation for this?
- Can reasoning exist independently of language? Can it exist independently of knowledge / facts / physical reality?
  - Most would answer yes. Aristotle may say no.
  - But can language alone induce reasoning? Now the symbolic AI people would say no and the language modelers would say maybe yes. They hypothesize: next word prediction with planning = emergent reasoning with enough grounding.
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

- [AGI is Still 30 Years Away — Ege Erdil & Tamay Besiroglu](https://www.dwarkesh.com/p/ege-tamay) ([HN link](https://news.ycombinator.com/item?id=43719280))
