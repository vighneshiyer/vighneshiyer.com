+++
title = "EDA CAD Startup Landscape (2025)"
date = 2024-04-18
draft = true
slug = "eda-cad-startup-landscape"
+++

In this article, I will eviscerate (and sometimes praise) startups I've heard about in the area of chip/PCB design, hardware, VLSI, EDA CAD, and AI hardware.

- https://github.com/aolofsson/awesome-semiconductor-startups
- Also See startups from DAC 2024
- https://www.zach.be/p/why-are-so-many-startups-developing-f3c
  - Diode
- https://www.zach.be/p/why-are-so-many-startups-developing-640
  - Quilter PCB autorouter
- https://www.zach.be/p/yc-is-wrong-about-llms-for-chip-design (HN post: https://news.ycombinator.com/item?id=42156516)
- PCB design
  - https://github.com/devbisme/skidl + https://github.com/michaelgale/pcbflow
  - https://github.com/atopile/atopile/
  - https://github.com/boldport/pcbmode
  - AllSpice
  - DeepPCB
  - Flux.ai
  - https://www.celus.io/
- PCB manufacturing / assembly
  - CircuitHub
- DAC expo map for 2025: https://hallerickson.ungerboeck.com/prod/app85.cshtml?aat=5a38394674626477442b3465597050664944574a59456c7673365353335957374f5244577263577a6f31413d
  - Jade Design Automation (Register Manager): https://jade-da.com/register-manager/ (there are tons of these, who buys this stuff?)
  - Baum: https://www.baum-ds.com/ (Korean!, we talked to these guys in 2024, I like their products, basically trying to commercialize Donggyu's PhD projects lol)
  - Silimate (of course): https://github.com/Silimate/silisizer (the usual)
  - https://mooreslab.ai/ (LMAO) (old commercial LMAO: https://www.youtube.com/watch?v=w6p53_D7vMA&t=19s) (new commercial: https://www.youtube.com/watch?time_continue=32&v=PVadAPgUSKA&embeds_referring_euri=https%3A%2F%2Fmooreslab.ai%2F&source_ve_path=MjM4NTE)

## PCBs

### JITX

Very very good, I'm so happy with what they're doing and success is certain with someone like Jonathan Bachrach at the helm.
Actually tackling a relevant problem with a clear path to success and the potential to obsolete huge swaths of the existing industry.

## Hardware Compilers

### BoolSi

- https://boolsi.com/ ("Turn any codebase into chips")

## Verification

### VerifAI

DAC 2022

### Silogy

- https://silogy.io/ (YC 23)

> Meet Viv: the World's First Virtual Verification Engineer
>
> AI agent, deft debugger, code critic, and your new favorite coworker.

I met these two at Hot Chips 2024.

### Agnisys

I met these guys at DAC 2022 and 2024.

### Metrics

I met these guys at DAC 2024.

## Analog

### Generation Alpha (Transistor)

https://github.com/gen-alpha-xtor/GenAlphaSchematicsDemo

Two guys just playing around, but I'm still quite impressed.
Dan is an elite SW engineer and circuit designer - he knows what he's doing.

- [Founding Software Engineer](https://wellfound.com/jobs/3132724-founding-software-engineer?utm_campaign=startup_share&utm_content=startup_share_module&utm_medium=social&utm_term=generation-alpha-transistor)

> Develop AI agents for novel chip design problems. Experience with LLM-based systems & agents, foundation models, ML systems, fine-tuning, RAG, GraphRAG all pluses. Develop automated methods to extract structured data from diverse sources including documents & images. Test & characterize natural language AI systems.
>
> Develop a web & cross-platform GUI environment, using Typescript, Rust, WebGL, WebGPU. Experience with computational geometry, graphics engines, high-performance rendering a plus, especially in the context of other CAD design systems.
>
> Develop novel tactics for existing chip-world problems, commonly known as electronic design automation, EDA. Optimizing placement, routing, extraction, simulation, physical verification (LVS, DRC). Working knowledge of silicon design flow & typical chip data (LEF, DEF, GDS, spice, etc) a plus.
>
> We value software generalists & polyglots who are unafraid to try & learn new & valuable tools, wherever they can be found. Past experience in cloud-native B2B and customer-facing engineering roles is a plus. Desire to grow into engineering leadership is a plus. Desire to work in a rapidly changing, high intensity environment is a must.

This is a very good pitch.

- umich, nc state, ...
- natural language for circuits
- native 'live' + 'remote' GUI environment for code-driven (but natural language-driven from the user perspective) circuit design and layout
- autorouting that understands the circuit intent and can beat humans in qor
  - this is a good idea that doesn't exist in the market for no good reason

- https://natcast.org/nstc-jump-start-anticipated-awardees

## ML for Chips

### VoltAI

https://voltai.com/
Never met, heard about from others, information-free.

### Silimate

- https://www.zach.be/p/why-are-so-many-startups-developing
- https://substack.com/@zachbe/p-148658947
- https://www.zach.be/p/why-are-so-many-startups-developing-f3c

I met these two at DAC 2024.

https://www.ycombinator.com/companies/silimate/jobs

- Founding Chip/Software Engineer
  - Mountain View, CA, US / San Francisco, CA, US
  - $160K - $220K
  - 0.50% - 2.00%
  - 3+ years
- Founding ML Engineer
  - Same terms
- Really just a fast PPA estimation tool

### Motivo.ai

- https://motivo.ai/
- https://techcrunch.com/2021/08/12/motivo-raises-12-5m-series-a-to-speed-up-chip-design-with-ai/

## LLMs for Chip Design

- https://chipagents.ai/#intro
- MooresLab

### Chipstack

- https://www.luxcapital.com/content/the-looming-labor-crisis-in-chip-design

- chipstack.ai
  - Yet another LLM for RTL design / testbench generation / RTL understanding / etc

> We have put 1000x more transistors on our chips in the last two decades. However, the tooling used to design/verify them has not evolved at the same pace. Result? Designing and verifying a modern chip today takes 100+ engineers more than two years!
>
> At ChipStack, we enable organizations to create the most advanced chips faster and more efficiently than ever before. Our product is a medley of Large Language Models and novel methodology built on a modern software stack. Leveraging ChipStack results in high-design productivity, lowered RTL bugs, and faster time to market.

Overall seems to have a good investor pool (Khosla, Clear), sufficient runway, good semicon contacts to get customers, and the right people on the chip design and ML/LLM side.
If you're making the case that winning in this space is mostly a function of talent and money, rather than data, then these guys are positioned well compared other startups in the same area.

Trying to focus mostly on the DV aspect with formal and simulation flows (not on RTL design yet - RTL designs are usually re-used and are much harder to get right wrt optimization, QoR, etc.); I agree with this approach.
Focus on frontend, don't try to replicate what existing CAD tools can do (synthesis and the rest, linting, static checks ala Real Intent); I also agree with this thinking.

Secret sauce claims:

1. model finetuning (for special things like SV syntax and semantics, SVAs - understanding and writing, invariant generation for induction, assertion generation for uArch design invariants, assumption synthesis for interfaces, English spec -> RTL, RTL -> English spec / description, testbench code generation, perhaps UVM-style sequence generation, waveform / testbench log interpretation)
1. the 'flow' - i.e. chain of thought, agentic AIs that can call CAD tools and iterate with feedback, etc.
1. the UI/UX to make it easy to run the flow in a directory with a bunch of RTL strewn around

There is a question as to whether their dataset for finetuning is much better than their competitors (especially Cadence/Synopsys who have a massive proprietary catalog of IP, docs, specs, and DV collateral to pull from).
The dataset and human labeling is what makes finetuning possible and fruitful in the first place.
They claimed that finetuning gives such a large advantage to the base model that improvements to the base model or its reasoning chain (GPT3 -> GPT4 -> GPTo1) can't surpass the benefits from finetuning - this is somewhat believable, but model scaling and a larger training corpus has obsoleted various prompting techniques and finetuning before.
They are hiring 'interns' who likely are curating datasets for them; lots of slave labor is required for training LLMs (see https://github.com/NVlabs/verilog-eval).

They claim they can't exist as a SaaS offering, but instead call themselves "deep tech" which requires hand-holding from the company for the customer (SaaS or just selling licenses requires some confidence in the reliability of your product).
All these "LLM for HW design/verification" startups never seem to have any demo to demonstrate what their tool can do: they are always insistent on secrecy, NDAs, and "contact us" for a demo, unlike SaaS startups which are eager to offer trials of their product (this is suspect!).
Their websites are completely garbage, filled with meaningless text and images.
To what extent are these startups hawking UI and prompting shims on top of a fine-tuned base model?
Honest startups do not make their software secret: rather they want as many users to try it and give feedback!

As usual, they claim to have many "customers" (including hyperscalers and other **very important** semiconductor companies) who are willing to try using their tool and provide feedback.
To people who know anything about this industry, this isn't surprising or impressive at all.
Every single big semiconductor house (Apple, Meta, Amazon, Google, Marvell, Broadcom, ...) have dedicated teams whose sole job is to evaluate new EDA CAD tools (both from the Big 4 vendors and from random startups).
They have these teams so they always stay on top of the latest tools and innovations and leverage them in their internal VLSI flows.
On the other hand, small hardware design companies don't have such dedicated exploration teams, but are always looking for an edge to accelerate their development: therefore they are likely to trial new design methodologies.
The important question is how much revenue is coming from these "customers"? Chances are: zero.

Finally, we come to the question of the startup exit.
In this industry (EDA CAD), startups are most commonly acquired by a giant (Big 4: Synopsys, Cadence, Siemens, Ansys) and get a payday (quite a small payday relatively speaking), or continue as a small 'consultancy-style' company that licenses their product and sustains a decent revenue (e.g. Verific).
VCs who aren't complete morons know that this space is not good for moonshot startup valuations and exits.
So these guys said to the VC that they know they can't exist as a EDA CAD tool company for more than a few years, and then they will have to pivot to sustain as an independent company.
The moonshot pivot is that they will make frontend design and verification so easy and fast and productive, that a team of 10 people can design a big chip in a few months and tape it out for customers (or for their own ideas).
Then, the value proposition is that they will obsolete $100s of millions of NRE cost and make custom chips even more ubiquitous.
If I was a VC, I would say this seems possible but unlikely, but that's good enough to invest.

- https://www.youtube.com/watch?v=c_B5m6Vn9g4 (Why Work Here: Kartik Hegde, ChipStack)

> Interviewer
> Hey everybody, I'm here with Kartik Hegde, the founder and CEO of ChipStack. Thanks for joining us, Kartik.
>
> Kartik Hegde
> Yeah, great to be here. Nice to meet you as well.
>
> Interviewer
> So, tell me about ChipStack. Your site seems really interesting—you guys are at the forefront of AI and chip design. Tell me a little bit about what you do.
>
> Kartik Hegde]
> Yeah, at the highest level, we're building software that helps chip designers work much faster. Chips are incredibly complex—it takes multiple years and hundreds of people to build a functioning, complex chip. Our mission is to reduce the time and effort it takes to do that.
>
> The way we do it differently from the current industry approach is by integrating generative AI into the chip design cycle. Most of the challenges in chip design are in verifying the logic of a chip and designing it optimally. We use generative AI to tackle these difficult problems, ultimately reducing the time and effort needed to build complex chips.
>
> Interviewer]
> Can you paint me a picture of what this looks like? Are you building an environment where people can design chips, or how does this actually work if I'm using your product?
>
> Kartik Hegde]
> We take an assistive approach. You install extensions into your code editors and IDEs, so ChipStack integrates directly into your workflow. We don’t want to force people onto a completely new platform. Instead, we enhance their existing workflows by integrating into key areas such as planning for testing, running simulations, debugging, and writing code. It’s a very interactive experience within your coding environment.
>
> Interviewer]
> Talk to me about the founding story—why did you start the company?
>
> Kartik Hegde]
> I started as a chip designer at Arm, where I was building and verifying chips. I loved working on hardware because it's the foundation of the entire innovation stack—better hardware leads to better software, better applications, and so much more. However, I quickly realized that the process was incredibly inefficient and slow, particularly the verification process. Verifying a chip is difficult because you have to test every possible state the hardware can go into, often in a random, inefficient manner. Writing directed tests is hard.
>
> Frustrated with these inefficiencies, I left the field and pursued research and a PhD in AI. However, I kept coming back to hardware because I loved its potential. After my PhD, I decided to work in an area where I had an unfair advantage—chip design and AI.
>
> I also saw three major trends: (1) Chips are getting more complex every generation, with a thousand times more transistors in the last two decades. (2) More companies are building chips—what used to be dominated by seven major companies has now expanded to include hundreds of startups and tech firms. (3) The rise of generative AI has direct implications for chip design, as many bottlenecks are natural language problems.
>
> With my background, these trends, and my passion for hardware and AI, I saw an opportunity to build a company that could make a significant impact. I met my co-founder Hamid, an experienced chip designer, and we had similar thoughts—so we built ChipStack.
>
> Interviewer]
> Tell me about the vision for the company. You mentioned wanting to build a generational company. What does success look like?
>
> Kartik Hegde]
> Our North Star is enabling chip design in less than a month with fewer than ten people. That’s an ambitious goal, but I believe it’s achievable.
>
> When we reach that point, the value proposition changes entirely. Today, only the largest tech companies build custom chips because the process takes years and hundreds of engineers. But if we can reduce that time significantly, even smaller companies will be able to consider custom silicon. That democratization of chip design is our ultimate vision.
>
> Interviewer]
> Why do you think ChipStack is uniquely positioned to crack this problem when others are also trying?
>
> Kartik Hegde]
> It comes down to the people we bring together. ChipStack is an incredibly complex company to build because it requires expertise in three key areas:
>
> Highly experienced chip designers—this is a rare skill that takes a decade to develop.
>
> Strong ML scientists and engineers—this is an AI company at its core.
>
> Experienced software engineers—we need to integrate with existing automation tools that are decades old and used by every chip design company.
>
> On top of that, having the right investors, connections, and early customers is crucial. We’ve assembled a world-class team, including experts from Google, NVIDIA, and the Allen Institute for AI. We also have strong investors like Khosla Ventures and Clear Ventures. This combination of a strong team, strong backers, and strong early customers gives us confidence in our direction.
>
> Interviewer]
> What milestones do you need to hit in the next year or two?
>
> Kartik Hegde]
> Our immediate focus is verification. If we can deploy software that reduces verification time by an order of magnitude and makes real customers love it, that’s our biggest milestone. In startup terms, that means reaching product-market fit. We already have excited early customers using our product, and we’re collecting data on how much time and effort they save. Successfully demonstrating real-world impact is our next major step.
>
> Interviewer]
> Tell me about your team and work culture.
>
> Kartik Hegde]
> We’re about 15 people right now, with offices in the Bay Area and Seattle. We have an on-site culture because we believe in serendipitous in-person conversations, which spark innovation.
>
> Our culture emphasizes two main things:
>
> Technical depth – We reward people who think deeply and comprehensively about complex problems.
>
> Customer focus – We ensure our solutions align with real user needs, leveraging our in-house chip designers as proxies for end users.
>
> Interviewer]
> How do you attract top talent in such a competitive field?
>
> Kartik Hegde]
> For chip designers, the pitch is simple: Do you want to work at another traditional chip company, or do you want to change the inefficiencies that everyone knows exist? You still use your expertise but also learn about generative AI.
>
> For AI experts, we highlight impact. AI advancements depend on better chips—what if NVIDIA or AMD could release new GPUs in six months instead of years? That’s the kind of impact we’re enabling.
>
> For software engineers, chip design tools haven’t innovated in decades. This is a rare chance to revolutionize developer experience in an industry that needs it.
>
> Interviewer]
> What are you most excited about for the next year?
>
> Kartik Hegde]
> We’ve built the foundation: infrastructure, product, initial customers. Now it’s about iterating and making the product indispensable to customers. That’s the fun part—refining and improving until they can’t live without it.
>
> Interviewer]
> Any final thoughts on startups or building a company?
>
> Kartik Hegde]
> Startups are a unique blend of research, engineering, and business. They challenge you in ways other careers don’t. I believe every engineer should try working at a startup early in their career. The network effect, exposure, and impact potential are unmatched. If you don’t try, you won’t know if it’s for you.
>
> Interviewer]
> Where can people learn more about ChipStack?
>
> Kartik Hegde]
> Visit chipstack.ai. The site is still in an early version, but if you’re interested in chip design, AI, or software, reach out. We’re always hiring and looking for great talent!
>
> Interviewer]
> Awesome! Thanks for your time, Kartik.
>
> Kartik Hegde]
> Thanks so much!

- Another Chipstack interview: https://www.youtube.com/watch?v=lPc5ovcEDv0

Formatted and relevant parts of the transcript below:

> Q: How does it work under the hood? Is it primarily LLM-based?
>
> A: I look at our value proposition in four layers:
>
>     Task-Specific Fine-Tuned LLMs: We fine-tune large language models to be better at specific chip design tasks. We recently collaborated with OpenAI to fine-tune their latest models and showed over 10-15% improvement on many chip design tasks compared to their frontier models.
>
>     Flow Engineering: How do you take a complex problem (like formal verification), break it into smaller, manageable pieces, and compose them so that LLMs can reliably solve those sub-components? We call this flow engineering.
>
>     Integrations & Infrastructure: Building an environment where these LLM-based agents have access to all the necessary tools (EDA tools, parsers, compilers) via APIs that the models know how to call and read results from.
>
>     User Experience: Agents aren't 100% autonomous today, so humans need to interact, give feedback, and use them in their real workflow. We focused on building a high-quality UX, unlike traditional EDA tools which are notorious for poor UX. Our team has software engineers using modern web frameworks (TypeScript, React) and backend technologies (Docker, Kubernetes) – no one has prior EDA tool building experience, which was intentional to avoid bringing in old DNA.
>
> So, it's the combination of customized LLMs, flow engineering, integrations/infrastructure, and user experience.
>
> Q: And currently, it supports both formal verification and simulation-based UVM/SystemVerilog testbenches? Are you planning to extend it to RTL design too?
>
> A: Correct. Design (RTL) is our next step. We consciously started with verification because it's the inner loop of design. When you create or modify a design (for PPA), you have to check functional correctness. Once verification agents mature, a design agent can internally call them to iterate quickly. Also, people trust LLMs more for testing something first, before trusting them to design RTL for tape-out, where the trust threshold is higher. Verification is also often the bigger bottleneck.
>
> Q: Do you have any user success stories, like finding corner-case bugs?
>
> A: It's always awesome when users share experiences. For example, on a complex design, we did an experiment: one engineer with ChipStack, one without, both doing formal verification. Without ChipStack, it took 104 hours. With ChipStack, it came down to 20-30 hours, finding the same bugs. On another design, ChipStack found a unique bug as well. Seeing someone actually use what you've built is always a very satisfying feeling.
>
> As a company, we are around 15 people and growing. We're always looking for smart engineers with backgrounds in chip design, software, or ML who want to change the way chips are designed. It's a fun place because these three verticals come together, which is rare. We have awesome people, great investors like Khosla Ventures backing us, and the product is deployed at multiple companies, from AI chip startups to Fortune 100 companies building CPUs and networking chips. We're still in the early stages and consciously limiting the number of customers to ensure each one is successful. We want to be sure we've built something reliable, lasting, and easy to use before scaling, probably in a year or so.

### PrimisAI

I saw their booth somewhere.
