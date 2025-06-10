+++
title = "The Next DEC and HCI Revolution"
date = 2022-08-30
draft = true
+++

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

- Devin is a good start from the agentic side - interact via Slack, does things for you automatically. For now, it is easier to operate within its own sandbox doing coding tasks, browsing, running shell commands, but there is no reason this approach couldn't be applied to random tasks in random apps
  - See: similar to 'Ace' above

- Meta AR glasses: https://about.fb.com/news/2024/09/introducing-orion-our-first-true-augmented-reality-glasses/
  - The existing rayban glasses are actually quite compelling, they have done a good job on the battery life, weight and balance, form factor, camera quality for photos and video, microphone quality with good directionality, and speaker quality with projecting straight into your ears without any buds. They also have a reasonable cost point ($300) and prescription lens support too

> Presenter: Edith Beigné, Meta
> Date: April 4, 2025
> Open Forum
> 12:00pm
>
> Title: Building the Metaverse: Augmented Reality applications and integrated circuits challenges
>
> Abstract: Augmented reality is a set of technologies that will fundamentally change the way we interact with our environment. It represents a merging of the physical and the digital worlds into a rich, context aware and accessible user interface delivered through a socially acceptable form factor such as eyeglasses. One of the biggest challenges in realizing a comprehensive AR and AI experiences are the performance and form factor requiring new custom silicon. Innovations are mandatory to manage power consumption constraints and ensure both adequate battery life and a physically comfortable thermal envelope. This presentation reviews Augmented Reality applications and Silicon challenges.
>
> Biography: Edith Beigné is the Silicon Research Director at Meta Reality Labs where she leads research projects driving the future of AR and AI devices. Her main research interests are low power digital and mixed-signal circuits and design with emerging technologies, in application to new AI workloads. She is the General chair of ISSCC 2025-2026, was the technical chair of ISSCC 2022 and part of ISSCC TPC since 2014, was part of VLSI symposium TPC and now executive committee. Distinguished Lecturer for the SSCS in 2016/2017, Women-in-Circuits Committee chair and JSSC Associate Editor since 2018. She visited Stanford University in 2018 to research emerging technologies and new architectures.

- The hci revolution is a second brain, not an assistant
  - This misunderstanding is the reason for the failure of rabbit (https://www.rabbit.tech/) and the humane pin (https://humane.com/)
- **The Limitless pendant** (https://www.limitless.ai/) is much more suitable for the second brain idea! Very good product.
  - Daily prompt: remove the need for manual diary writing, just be prompted by this pendant, and you just narrate what you're thinking! Then all the writing and summarization and consolidation takes place later.
- Electromyography, another thing that meta will struggle with for hand gestures while this will be trivial for apple with their watch integration, just having accelerometers will be enough let alone electrical signal extraction
  - Gestures are already quite finicky though, Apple will decide against them unless it has camera view of your hands (like with the Vision Pro)

- What is the next DEC?
  - OpenAI feels too bureaucratic already to make advancements on the consumer electronics or software side.
  - Meta and Google are inherently untrustworthy companies
  - Neuralink is too early right now but they will continue to make technological progress
  - Anthropic is a potential candidate.
  - The Chinese AI competitors are very unlikely to innovate in a breakthrough fashion when it comes to consumer items
  - Apple has the whole ecosystem, plenty of experience and internal secret projects. They are the potential leaders here.
  - Microsoft is too incompetent to do anything new.
  - I really like the Limitless pendant - it finally feels like the right next step, they built a good foundation with Rewind AI on Mac, it is quite Mac focused, so I imagine this is what Apple will either acquire or stomp out once they have their own product

- https://x.com/vitrupo/status/1903614834597662858?t=4xfFNDBvg0Io2p1938xRug
  - Hci article, this is what not to do lol

> Aravind Srinivas explains why Perplexity is building a browser: it's the only way to create AI agents with enough control over multiple apps, especially on iOS.
>
> Their goal? Agents that can book travel, buy things, and act as a personalized assistant for those who can't afford a human EA.
>
> He adds that this is the long-term vision. "Anyone who's saying agents will work in 2025 should be skeptical."

- A browser agent sounds like a good step, but "booking travel" has got to be the worst example of its utility

- Nothing has built quite a few interesting phones with a new HCI focus (https://www.youtube.com/watch?v=pAzJPmsWgKU) (marketing their Phone 3a as "Your Second Memory")
  - Support for several modalities: button presses, text, voice, screenshots, camera
  - The general idea is a fuzzy second brain with all kinds of random notes and events and the ability to recall and organize them at will based on arbitrary user commands
  - Todo lists, idea boards, events / calendar, tasks, emails, ... getting closer to what we want
  - https://us.nothing.tech/pages/phone-3a

- Ljubisa: all cpu innovations came from 50-100 people total, he is right, companies are huge but innovations are few
- Drago: go places where talent is generalist and skilled in many areas, Dec was huge but with the right culture they produced a handful of truly elite people and elite research and legacy
- Ljubisa: publicly traded companies need some stability with respect to projections there isn't an appetite for risk

- AI should be a huge boon for small teams, just looking at Ljubisa and drago I wonder how they can find good people who are truly obsessed with what they do, like in tenstorrent at some point, you have to hire randoms who just want money for job and you end up losing everything important
  - With good enough agentic AI we can keep the company very small and lean and productive on all the mechanical tasks that can be automated and it can all be intelligent and passionate people and all other randoms can be cut out, very good
  - This is one way to produce the next DEC without any massive funding machine supporting a research organization (today this is limited to the top 20 firms by market cap in America, which is greatly limiting since they are all public too)
  - DE Shaw has done a good job here - quite well curated DEC-style lab

- The grand HCI innovation. Glasses see everything you do. Watch tracks your HR, HRV, sleep patterns, activity, exercise, light exposure, and so forth. Track and correlate every health metric to everything that you do, eat, happens to you, the environment you're in. Gives you the right feedback and summarization of your life as it stands (superficially) without any explicit data entry on the user's part. Maybe, this will nudge people into relinquishing instagram and tiktok, or that may be too hopeful.
- allergies, the impact of various foods and meal timing, the impact of sunlight exposure, nighttime light and screen usage, ... - all kinds of things can be analyzed on a long time span + data aggregation among many people to figure out trends with mininal noise influence
