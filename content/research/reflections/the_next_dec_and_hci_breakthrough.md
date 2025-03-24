# The Next DEC

- The next way humans will interact with computers (ultimately HCI) thing
- Room-scale computer (DEC), desktop computing, cloud computing, laptop computing, mobile computing, smartwatches, ... what's next?
- Apple people
  - Humane pin is actually good, but it was too early actually
  - Meta glasses form factor seems reasonable
  - Brain implants are the next obvious one, but has a very long trajectory ahead
- Proliferation of random LLM for X things
  - LLM for video editing, slide creation, report generation, general browser navigation, IDEs (of course, the most powerful so far - Cursor, Windsurf, Zed, Claude Code), ads (Icon)
  - An OS + app stack needs to unify all of these. Just dictate what you want the app to do and it does it (navigates the GUI, writes the code, executes things) appropriately
  - An obvious thing: me and Joonho were working on a pitch deck. I was dictating what to do and he did it. Making diagrams, changing colors, reorganizing layout, writing text. Why can't we automate this process - a completely new type of UI to a bunch of programs. I think everyone knows this is coming: but it still seems we are a long way away from a unified platform/model/API for it.
- Missing abilities:
  - Ability to sample camera and audio data, dynamically sample everything I see and hear and do every day and make all my requests context-aware
  - Long term memory, save and recall being built into the model architecture, potentially there is no separate short-term (context length) and long-term (disk) memory, perhaps they can be blended?
  - Need to leverage both local compute, storage, phone compute/storage, and cloud too
  - Voice cues
- So actually we talked about this during lunch on 3/12/2025, and I wish I had this thing. "Can you just summarize what we just talked about? Connect it to the history of consumer computing."
- https://news.ycombinator.com/item?id=43334644 (New tools for building agents (openai.com))

> I feel like all those AI agent attempts are misguided at their core because they don't attempt to create new ways but replace humans on the legacy systems. This is fundamentally shortsighted because the economy, life and everything is about humans interacting with humans.
>
> The current AI agent approach appears to be permutations of the joke about how people will make AI to expand their once sentence to a long nice e-mail and the AI on the receiving end will summarize that long e-mail into single sentence.
>
> I get that there's a use case for automating tasks on legacy systems but IMHO the real opportunity is the opportunity to remove most of the legacy systems.

> Feels like OpenAI really want to compete with its own ecosystem. I guess they are doing this to try to position themselves as the standard web index that everyone uses, and the standard RAG service, etc.
>
> But they could just make great services and live in the infra layer instead of trying to squeeze everyone out at the application layer. Seems unnecessarily ecosystem-hostile

I feel that an OS-level command interface must be the future. Whether that is voice or text/typing driven (or both) remains to be seen, with the direct brain control interface being the holy grail.
In this area, Apple has an absolute advantage - they understand your entire desktop, filesystem and folder structure, as well as having first-class APIs to every piece of software running on your Mac (most of which are first-party too) (includes email, calendar, messaging, and many other things like Keynote, Photoshop/Lightroom, Final Cut, Automator, contacts, facetime, find my, Maps, Music, News, Apple Notes! including voice memos, Photos). And of course the best of them all, the browser.
They also have control over the entire hardware stack and have plenty of opportunity for information cross-pollination. What did I do with my time today? What did I eat today? How did I sleep? What should I do next, based on these principles I'd like to follow?
Why is Apple Intelligence so behind here? They in theory have the most user-specific context + extreme compressibility of the relevant context. I think the issue is that apple intelligence is too narrow in scope and they have developed 'nit' solutions (like notification summaries).

Other players that could compete are Meta and Amazon, but they don't seem to have what it takes vs Apple. Upstarts like OpenAI or Perplexity are even more iffy.

Devin-like task-guided coding and general productivity. Editing photos or videos, doing research, writing things, writing emails, working on any codebase. To what degree can it do something novel? Human intervention may be needed in the early stages like today. Is this too extreme? Perhaps, LLM abilities have stagnated. Longer context lengths seem hard. Token generation speed is also a bottleneck. GPT 4.5 has shown limits to pre-training and RLHF.

We seem to be very far from achieving intelligence with biological-tier power. Power consumption is high. Network architectures have stagnated. SNNs / hyperdimensional computing have been effectively dead for a while. Unsupervised learning without any dataset / simulation is the ideal, learn on the fly like a human or any biological system without having to generate tons of synthetic data or rely on distillation. More fundamental research in model architecture is required.

- https://news.ycombinator.com/item?id=43451742 (Bitter Lesson is about AI agents (ankitmaloo.com))
  - The point made in the blog post here is that AI agents can leverage RL to self-learn effectively. Therefore, don't try to do nit things to base models that keep getting better or can self evolve.
