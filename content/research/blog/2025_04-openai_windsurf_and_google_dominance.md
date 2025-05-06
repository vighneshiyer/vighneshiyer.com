+++
title = "OpenAI's Windsurf Acquisition"
date = 2023-08-23
draft = true
slug = "openai-windsurf-and-google-gemini"
description = "Owning the user layer, Google's catchup efforts, and TPUs"
+++

- https://news.ycombinator.com/item?id=43743993 (Why is OpenAI buying Windsurf? (theahura.substack.com))
  - The author is a bit pessimistic, but I like this attempt by OpenAI to own the application layer, at all cost
  - Owning the data produced by this software is also crucial when it comes to RL tuning (if the "environment interaction" hypothesis comes to fruition)
- https://news.ycombinator.com/item?id=43661235 (Google is winning on every AI front (thealgorithmicbridge.com))
  - With Gemma and Gemini 2.5 Pro, everyone is hyping up Google again after they have been behind for years on LLMs. But Google (and in particular Deepmind) has always been way ahead of the game theoretically - their researchers are responsible for so many breakthroughs over the past decade and more.
- https://news.ycombinator.com/item?id=43437028 (Google’s two-year frenzy to catch up with OpenAI (wired.com))
  - Lots of people feel the winds shifting
  - But even while Google may have good technology, they are so bad at execution compared to Meta, Microsoft, Amazon, and others (especially Apple)
- https://news.ycombinator.com/item?id=43631274 (Ironwood: The first Google TPU for the age of inference (blog.google))
  - The new TPU announcement is quite solid, but fishy at the same time. How much money is this costing vs saving? It is quite unclear how much fanciness in the model architecture is possible with TPUs and their compiler stack (JAX, XLA and the rest) vs the GPU flow (PTX, CUDA, Triton, TorchInductor) - stiff competition

- I should comment on this, Google can't compete with social networks and consumer electronics or produce the next hci innovation like Apple can, but they can own the model architecture side, deepmind has always produced top tier research and breakthroughs
