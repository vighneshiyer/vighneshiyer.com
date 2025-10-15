+++
title = "Cerebras Supernova"
date = 2025-05-15
draft = true
+++

https://www.cnbc.com/2025/05/15/cerebras-ceo-says-chipmakers-aspiration-is-to-hold-ipo-in-2025.html

https://artificialanalysis.ai/
https://artificialanalysis.ai/models/llama-4-scout/providers
Major caveats to Cerebras performance, very small context window, batching effectiveness unknown, scaling to larger models will be quite painful unlike turn-key GPU scaling

https://lu.ma/21yj9tla

A supernova is a massive stellar explosion—symbolizing rapid transformation. As the AI industry evolves, Cerebras is breaking through traditional limits.

Supernova is Cerebras’ flagship AI event of the year.

Join us as we unveil the next generation of models and cloud infrastructure powering real-time reasoning and intelligent agents. From DeepSeek R1 to Llama 4, Cerebras is the fastest AI inference provider for cutting-edge, open-source models—built for those deploying at scale.

Whether you're building apps, deploying models, or designing infrastructure for the agentic era, Supernova is where AI goes from promise to production.

Learn how:

    Perplexity, Mistral, and AlphaSense accelerated their core apps by 20x and are building real-time reasoning systems

    GSK and Mayo Clinic are training and deploying LLMs for life sciences and hospitals

    The latest AI startups are building agents for customer service, personal tutoring, and knowledge work

    You can run your models 20x faster with no added cost or complexity

Schedule: Follow us on Linkedin and X to stay up to date

Doors open 3PM

3:30–4:00 PM | Luminary Kick-off with Andy Hock
Arrive, check in, and connect with the Supernova community.

4:00–5:30 PM | Enterprise Luminary Workshop
A practical deep dive for enterprise AI leaders on how to go from AI promise to production success.

5:30-6PM | Networking and Transition to Main Keynote

6:00 PM | Keynote
Cerebras CEO Andrew Feldman will kick off the evening with a keynote on the future of AI compute—featuring sub-second reasoning, a Supernova developer showcase, and infrastructure built to scale agentic AI.

8:00–9:00 PM | Supernova Networking
Wrap up the night with drinks, bites, and conversation with AI leaders, builders, and partners.

We only came for the keynote part at 6pm

CEO keynote

Huge retcon, our whole company is about making things faster, impling that llm tok/s was the reason they built the company lol
Typical shiling of speed over Nvidia solutions or even groq or samba Nova, see their comparison chart on their website
Lots of applause when he shows the demo, quite good speaker and shill
Doesn't mention anything about cost or scalability, nor batching effects, nor limitations of shoreline bandwidth or thermal limits
From the year of speed in 2024 to the year of scale 2025

Mayo clinic guy
The audience is quite well behaved compared to beyond cuda, no one was talking during the keynote + other partners
Try to combine genetic info exomes, imaging data and clinic notes to give a classifier result, custom 1B model
Working on longer context genomic embedding and encoder, they want a genetic fingerprint wrt some diagnoses

Sean lie
Chinese Steve jobs time
Mentions ilya saying we only have one internet
Inference time compute and scaling laws lol
But no mention of rl experience for more pre training
More tokens = higher intelligence for all benchmarks, coding, math, diamond
We can all relate to this lol, we also generate better answers if we can think before responding, we like reasoning models that think before answering, all sota models are reasoning
Why do people use 4o still over o3, speed! See my photo lol
Cerebras scaling law lmao, similar to Jensen's law
He is making memory bandwidth argument but he doesn't mention shoreline bandwidth issues of wafer scale integration, nor the cost argument of low density sram, or the redundancy overhead due to yield problems and having to deal with wafer network congestion
Using Jensen's diagram against him lol, we call this GPU impossible lol
Doesn't talk about aggregate throughout though
Tries to draw some connection between single user tok/s and higher intelligence from the cerebras system

Ninjatech AI
They are a customer that are trying to build a model for wse
Claims that 16x cheaper than o3 with similar performance on tasks with fast output
He has some compound ai technology lol, just some python shuffling of text
This is just amdahls law, if llm are in a loop and most of the time is spent in verification or tool use rather than tokens, then speedups will be limited by using a faster inference service
These guys use the worst examples of what an agent could do. Order food, but plane tickets, book a hotel lmao. Worst possible things.

Vp of product
They claim much better than GPU for qwen reasoning, but the cost is wildly different lol
They claims 99.95% uptime, very fishy

Alphasense guy
Seems very boring, just some query platform, very corporate moron report generation
Your AI needs the same tools and data as your human analysts lol

Daniel Kim, growth head
Lmao this guy is just a hype guy, seems like an airhead, but good at what he does
Cerebras coder, their own simple web app creation hack, alternative to cursor lol, vibe coding
Alexcodes, codegen cursor for iOS using cerebras
Opencall, customer service with AI using cerebras inference lol, so crazy
Both of these are YC
Norby, generate stories and text to audio using LLMs, and they use cerebras inference
Tavus, another YC, avatars for video chat lmao, things are getting insane now, YC has a negative reputation for sure
Podium, another YC, instant customer service lol, WTF is this, using cerebras inference
This guy says unicorn a lot lol
Cerebras wait-list is done now, sign up open for all
Open router partnership, they have a slot there now
Lmao startup program, 100 in the first cohort lmao, VC fund time, just like perplexity

Meta guy panel
Why is this some kind of weird interview
Audience attention was immediately lost and they started to get up and leave to the back
Much more murmuring, nothing interesting said by this Meta guy
Llama api by meta is powered by cerebras, 18x faster over GPU
Audience is restless now, much more noise being made
More tavus, Mistral, alphasense, it seems useless, tavus is like a digital twin lmao, YC is so bad, mention the slavery monitoring startup
Ok more noise being made and chairs moving around
I learned a very good lesson, if a panel isn't interesting, far far more than a talk, you can't do it, the audience will just hate you
Mistral chat is just laughable, Europe had something but they lost it so quickly, le chat lmao
See this 'poe' startup, a wrapper on top of a wrapper taking a larger api margin cut lmao, I guess open router is similar

Q&A time with CEO and CTO
This John Werner guy seems like an ameer character, professional bullshitter
Audience has gotten quite annoyed now, more than half of the audience is gone, talking loudly in the back and it's hard to hear the speakers even in the front row
Lmao this Werner guy told the audience to shut up so he can play family feud with these two co founders lmao. The noise was unaffected lol
When the accordion player came in the ceo seemed so upset but the CTO was quite laughing
The CTO is krste's student! Crazy! So he is technically sound
