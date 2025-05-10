+++
title = "Boiling the Ocean and the Importance of Destruction"
date = 2024-05-06
draft = true
+++

- Need to write something explicit about how to make progress, destruction is necessary. In fact it is just as important as creation and maintenance.
  - Hmm I wonder if there is a basis for this lol? https://en.wikipedia.org/wiki/Trimurti https://en.wikipedia.org/wiki/Moirai
- Software projects constantly go through destructive cycles
  - Version breakage is common and often is done through a complete rewrite
  - Situations where people try to maintain some 'compatibility' and make sure things work incrementally, usually fail if the effort is not completely coordinated. See the major problems with Python 2 to 3 and Scala 2 to 3 (even though Odersky insisted that wouldn't happen). Scala 3 should have just been a completely different language with a new codebase and completely new libraries.
    - Force complete rewrites and don't allow old code to fester. Allowing that leads to accumulation of junk and debt that prevents further progress on abstractions.
  - It actually doesn't take that long to recreate things. Consider the proliferation of new languages today (e.g. Rust, Zig, Nim, Unison) where the language compiler, stdlib, and supporting libraries spring up very quickly (in just a matter of a few years).
  - Consider web frameworks. New frontend JS frameworks appear every 6 months and people do not hesitate to jump from one to the other. Rewriting has even lower friction now with LLM assistance. Of course, the JS example is quite extreme and people hate it, but no doubt it is these constant rewrites which have given us many great frameworks that continue to improve in performance and featureset constantly.
  - We see the same pattern with the Python ecosystem (build systems, type checkers, linters). Astral just rewrote everything and improved the life of everyone. Throw all the old stuff away and come fresh! Build based on our mistakes of the past.
  - Companies do this all the time. They see some problem, some abstraction has broken down, the code gets too messy and they say enough! Large chunks are rewritten and redeployed while using some old tests to keep the specification consistent. In architecture, this happens a lot, Zen was a cleanroom rewrite, Qualcomm did this too, the first M1 SoC involved lots of from scratch RTL, and so forth.
- The need for continuity
  - The important part of rewriting is that it shouldn't be done blindly. Lessons from those who built the earlier system and have seen all its problems (and also strengths) need to be incorporated into the new system.
  - If this continuity is missing, then mistakes will be repeated, and you won't know how to improve. You will shoot randomly into the wild.
- Naturally, no matter what new thing is built it will eventually have issues and rot away, at which point it needs to be done again. That is the law of nature.
