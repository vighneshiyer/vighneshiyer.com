# "Co-Design" - Get Real

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
