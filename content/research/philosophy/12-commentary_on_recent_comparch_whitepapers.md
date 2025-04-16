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

## Architecture 2.0

- https://www.computer.org/csdl/magazine/co/2025/02/10857820/23VCdDhsEAo
- This is mostly drivel. But I can agree more 'benchmarks' and 'data' can be good. The devil is in the details.
- Is this a good example of a 'benchmark'? (QuArch: A Question-Answering Dataset for AI Agents in Computer Architecture - https://arxiv.org/pdf/2501.01892?).
- Is this? (https://sites.google.com/view/mlarchsys/isca-2025/archreasoning-competition?authuser=0)
  - The goal of this competition is to evaluate the reasoning capabilities of modern large language models (LLMs) in computer architecture and systems. Participants will submit challenging, reasoning-based questions, and the best questions will be tested against top AI reasoning models. The objective is to identify questions where AI fails, revealing the limits of LLM reasoning in computer architecture and systems.
  - Sounds like extreme minionism is being asked for.
- What exactly do ML algorithms need to be superior to classical techniques (in RTL design, verification, and various backend VLSI CAD tasks)?

## Domain-Specific Accelerator Design Challenges

- The Magnificent Seven Challenges and Opportunities in Domain-Specific Accelerator Design for Autonomous Systems
- https://arxiv.org/abs/2407.17311
- I actually like this. I agree with mostly everything here. However, the authors themselves don't apply these principles to their own research.
