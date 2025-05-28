+++
title = "Commentary on Recent CompArch Whitepapers"
date = 2024-05-06
draft = true
description = "'Co-design', 'Architecture 2.0', DSA Design Challenges"
+++

# Commentary on Recent Computer Architecture Whitepapers

## "Co-Design" - Get Real

- https://arxiv.org/pdf/2504.06531 (Beyond Moore’s Law: Harnessing the Redshift of Generative AI with Effective Hardware-Software Co-Design - Amir Yazdanbakhsh - Google DeepMind)
  - The historical discussion is good, I appreciate that. However, the conclusion is buzzword-mania and has no insight.
- "co-design". This is a made-up term that is now a standard buzzword you'll find in every paper. The truth is that *ISA design* **is definitionally** hardware-software co-design. All of core computer architecture is co-design. That is the whole point.
  - Sweeping some hardware parameter space along with some software parameter space isn't co-design in any meaningful way - it is just monkey-tier "research".
  - You need to be very specific when you propose some "co-design" project, lest it be some meaningless knob tuning, nit ad-hoc accelerator design, or integration of your favorite pet functional units.
- He also talks about the 'hardware lottery' which is yet another ultra-fishy Googling term
  - Reference the `comp-arch/hw_lottery_rebuttal` article

> We need software-defined hardware that combines the efficiency of custom silicon with the flexibility for post-silicon programmability. For example, designs featuring flexible dataflow architectures or programmable on-chip networks may provide the adaptability required to keep pace with rapid AI innovation.

What does this mean? What is 'software-defined hardware'? That is just programmable hardware, which covers every base. His assertion about dataflow architectures needs supporting data, and isn't really about 'adaptability' but rather the efficiency tradeoff it makes vs strict von-Neumann systems.

> For example, a chip could combine fixed accelerators for critical operations with a flexible engine that adapts to new computing idioms, thereby leveling the playing field for innovative algorithms.

Oh, you mean like a modern GPU? What is the actual proposal here? Buzzwords (e.g. "flexible engine") mean nothing.

> Every proposal for a new model should include a consideration of its hardware requirements, and every hardware innovation should clearly articulate the new algorithms (or computing idioms) it supports.

The reality is that, when prototyping a model architecture idea, you don't have the time to also perform software optimization (and that usually vastly outpaces the performance benefits of any hardware modification itself). There are no more 'computing idioms'; they have all already been discovered, but that doesn't mean computer architecture research has no future. As he points out, the *methodology side* is what needs attention.

- https://web.archive.org/web/20120423063209/http://cacs.usc.edu/education/cs653/Shaw-msMD-SC09.pdf (Anton comes the closest to real HW-SW co-design in a meaningful way, Amir cites this in his paper).

- https://www.sigarch.org/a-computer-architects-guide-to-designing-abstractions-for-intelligent-systems/ (another whitepaper written by Amir)

## Architecture 2.0

- https://www.computer.org/csdl/magazine/co/2025/02/10857820/23VCdDhsEAo
- This is mostly drivel. But I can agree more 'benchmarks' and 'data' can be good. The devil is in the details.
- Is this a good example of a 'benchmark'? (QuArch: A Question-Answering Dataset for AI Agents in Computer Architecture - https://arxiv.org/pdf/2501.01892?).
- Is this? (https://sites.google.com/view/mlarchsys/isca-2025/archreasoning-competition?authuser=0)
  - The goal of this competition is to evaluate the reasoning capabilities of modern large language models (LLMs) in computer architecture and systems. Participants will submit challenging, reasoning-based questions, and the best questions will be tested against top AI reasoning models. The objective is to identify questions where AI fails, revealing the limits of LLM reasoning in computer architecture and systems.
  - Sounds like extreme minionism is being asked for.
- What exactly do ML algorithms need to be superior to classical techniques (in RTL design, verification, and various backend VLSI CAD tasks)?

- https://www.linkedin.com/posts/vijay-janapa-reddi-63a6a173_architecture-20-foundations-of-artificial-activity-7312568491394387968-ElHU?utm_source=share&utm_medium=member_desktop&rcm=ACoAAAVUAnMBjBFeQj_67eMIA1E2610ABsluQic

> 🎉 How can AI transform and enhance human engineering creativity in computer system design? Excited to share our latest article, Foundations for AI Agents in Computer System Design, co-authored with Amir Yazdanbakhsh.
>
> 🔍 Key Insights: We explore how AI agents can transform our workflows—from transistor-level optimizations to high-level system design—while tackling challenges such as data accessibility, verification, and interoperability. But we’re also transparent about AI’s limitations: it’s just another heuristic—a data-driven one—that, like traditional heuristics, can and will most likely sometimes fail. The bigger challenge lies in managing these failures and confronting the ever-present risk of unknown unknowns that could constrain future system designs.
>
> 🔗 To address these challenges, we propose a mental "capability framework" that can help foster secure collaboration, standardize evaluation frameworks, and strengthen industry-academia partnerships. Our vision is that AI-driven design systems can amplify (not replace) human creativity, accelerate innovation, and democratize access to cutting-edge design methodologies.
>
> 📚 Link to article: https://lnkd.in/eqfp9Aar
>
> 🌟 If you are interested in this subject, stay tuned. Next week, we'll share details about an exciting initiative launching for dataset development where the broader community can more easily engage and contribute.
>
> 🙏 Special thanks to Timothy Jones and Robert Mullins, the editors who thoughtfully invited us to articulate our ideas in this forward-looking piece.
>
> hashtag#ComputerArchitecture hashtag#ArtificialIntelligence hashtag#AI hashtag#MachineLearning hashtag#Innovation hashtag#Architecture20 hashtag#EDA hashtag#ComputerSystems hashtag#IEEE

## Domain-Specific Accelerator Design Challenges

- The Magnificent Seven Challenges and Opportunities in Domain-Specific Accelerator Design for Autonomous Systems
- https://arxiv.org/abs/2407.17311
- I actually like this. I agree with mostly everything here. However, the authors themselves don't apply these principles to their own research.
