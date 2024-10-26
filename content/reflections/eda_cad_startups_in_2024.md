
In this article, I will eviscerate (and sometimes praise) startups I've heard about in the area of chip/PCB design, hardware, VLSI, EDA CAD, and AI hardware.

- https://github.com/aolofsson/awesome-semiconductor-startups
- Also See startups from DAC 2024

## Some General Notes

## VerifAI

DAC 2022

## Silogy

- https://silogy.io/ (YC 23)

> Meet Viv: the World's First Virtual Verification Engineer
>
> AI agent, deft debugger, code critic, and your new favorite coworker.

I met these two at Hot Chips 2024.

## Agnisys

I met these guys at DAC 2022 and 2024.

## Metrics

I met these guys at DAC 2024.

## PrimisAI

I saw their booth somewhere.

## VoltAI

https://voltai.com/
Never met, heard about from others, information-free.

## Silimate

- https://www.zach.be/p/why-are-so-many-startups-developing
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

## Etched.ai

Have heard of the founders second-hand.

## Chipstack

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

## Generation Alpha (Transistor)

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

## JITX

Very very good, I'm so happy with what they're doing and success is certain with someone like Jonathan Bachrach at the helm.
Actually tackling a relevant problem with a clear path to success and the potential to obsolete huge swaths of the existing industry.
