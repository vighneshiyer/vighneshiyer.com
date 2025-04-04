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

- https://news.ycombinator.com/item?id=43559370 (Ace: Realtime Computer Autopilot (generalagents.com))
  - Pretty cool, they run as an app on OSX which can hijack the keyboard and mouse and execute all kinds of user commands in natural language
  - Getting closer to what I envision, but they don't have many APIs to work with - Apple can do a much better job internally just due to their vertical integration
  - Still, this integration is quite finicky. The perplexity browser agent thing might be a better hooking point. (https://www.zdnet.com/article/perplexity-ai-teases-a-new-browser-for-agentic-search/)

- The meta glasses are just not positioned correctly! There is too much emphasis on AR and having a screen on those glasses, which is technologically painful. It also introduces the complexity of 'apps' running locally on the glasses, and then there must be an OS (probably android), and then another SDK specialized for it... very painful
  - The focus should be on the continuous capturing of your life, incorporating visual and audio cues
  - e.g. after seeing ASV's Haas talk, I just want a transcript and summary, just give it to me! some photos too perhaps
  - The glasses should sample the camera every now and then and then give me a report on how I spent my day. No need for all this random metrics software, just tell me based on what you see! How much time do I spend reading? What things am I reading about? What route did I walk today and is it special in any way?

- All the past HCI innovations have been 'active' on the part of the user. There was a new screen added for each one, or a new input modality.
  - The keyboard, the analog and then laser mouse, multi-monitor setups, iPod (compact storage and scroll wheel), iPhone (usable touchscreen), Apple Watch (wearables, Oura / Garmin / Whoop are also here, but don't target the same audience as the Apple watch), iPad (desktop/mobile converged compute, actually iPad doesn't accomplish this lol but Samsung DEX does), M-series laptops (lol basically everything that matters in its final engineered and perfected form comes from Apple), Apple vision pro (the best AR headset in the market), LLM-based agents / chatbots, Neuralink implants
  - Some people are talking about new modalities (e.g. gestures or voice or brain waves) or new screens (via AR glasses or contacts or via the Humane Pin's laser projector). But none of these make sense to me. They are all 'active' modalities or add new distractions to your life.
  - https://chatgpt.com/share/67f0239d-7d3c-8004-a095-5c2a8ffa830f (seems reasonable about the future actually, language-driven interfaces for normies)
- The next revolution will be 'passive' and 'anti-technological' to some degree
  - The daylight computer is an example of this. New wave of proliferation of eInk devices (e.g. boox palma) are another example.
  - It could have a new form factor (e.g. the humane pin or 'smart' contacts) but more likely it will be an enhanced version of an existing form factor.
  - It will enable global observation of your life and all your experiences throughout the day, learn your routine and what you're up to, and help you improve your own life!
- OS and app control revolution
  - I discussed this above, this can occur simultaneously
- Then the glasses / passive observer revolution
  - Watching over your shoulder already has very good effects, imagine a God watching you constantly! But critically, privacy will never be more important. No one will trust Meta or Google with this kind of product, only Apple can be spared possibly due to their insistence on on-device compute (for your device cluster, which includes your phone, airpods, iPad, and Macbook, the actual compute can be distributed across this cluster of devices, not performed on the glasses).
  - When I see it this way, only Apple has all the pieces to make this vision a reality. Others will have to rely on 3rd party integrations and it will be flaky and non-comprehensive.
