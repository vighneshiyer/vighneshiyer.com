+++
title = "A Critical Take on the \"Hardware Lottery\""
date = 2023-02-28
draft = true
slug = "hardware-lottery-rebuttal"
description = ""
+++

# Is There Really a "Hardware Lottery"?

- https://arxiv.org/abs/2009.06489

No.

Exploitation of data parallel algorithms via architecture and programming model is the only thing that matters, and GPUs didn't 'permit' ML to become viable than any other data parallel architecture.

You can't accelerate yourself out of an intrinsically serial algorithm.

Custom functional units - one important outlier (see crypto accelerators, ZKP/AES/FHE, see SHA256 accelerators for Bitcoin, others for other cryptocurrencies).

It's easier than ever to prove your algorithm would be very good on custom hardware. Even more, you can get that custom hardware built more easily than ever nowadays if it is really justified - prototyping is cheap, and money for commercialization is plentiful.

The "hardware lottery", as portrayed by Sarah Hooker, is a myth.

- https://www.youtube.com/watch?v=8n2HLp2gtYs&t=2116s ( SiFive Tech Talk on Accelerating AI: Past, Present, and Future by Krste Asanovic ) (very very good talk, but I think Hooker draws the wrong conclusions from it) (Krste's lecture)
  - Watch this before writing this article. Just make the point that everything is about extracting DLP in various ways and amortizing instruction dispatch costs - Krste / PARLAB is able to boil down all parallel compute patterns into just a handful of motifs (the seven dwarves). This is sufficient for everything - there is no lottery.

- There can be a limitation of programming models or compilers or hardware itself that prevent sufficient parallelism from being extracted, see cgra data flow or streaming archs for dsp or asic emulators for rtl simulation

- There is more of a compiler lottery than a hardware one, if Nvidia hadn't invested in general dlp programming, nothing would have been possible even with the hardware, although games would continue to improve

- If it is the case that hw that doesn't and can't exist is limiting a research direction then it may be true but altogether vacuous, it says nothing
- Consider a research idea that requires a space elevator, is dismissing that today a case of the space technology lottery? Where is the randomness or chance?

- why do GPUs win, especially from nvidia, general purpose gpu programming! it is all about the programming model and the microarchitecture to make it fast while preserving the programmability

- On the hw lottery, discuss spiking neural nets or neuromorohic compute, similar to Anton
  - Is there a hw lottery at play here that prevents this idea from traction? Have they even showed a theoretical benefit or will that only appear when dedicated training hw at sufficient scale appears?

- https://en.wikipedia.org/wiki/Von_Neumann_programming_languages

> John Backus asserted that assignment statements in von Neumann languages split programming into two worlds. The first world consists of expressions, an orderly mathematical space with potentially useful algebraic properties: most computation takes place here. The second world consists of statements, a disorderly mathematical space with few useful mathematical properties (structured programming can be seen as a limited heuristic that does apply in this space, though).
>
> Backus claimed that by 1978 there existed in computer science a vicious cycle where the long-standing emphasis on von Neumann languages has continued the primacy of the von Neumann computer architecture, and dependency on it has made non-von Neumann languages uneconomical and thus limited their further development: the lack of widely available and effective non-von Neumann languages has deprived computer designers of the motivation and the intellectual foundation needed to develop new computer architectures.[2]

The points made here do seem to point towards a PL/arch 'vicious cycle' (i.e. hardware/software lottery) at play, but I feel that would be a misinterpretation.

- https://ieeexplore.ieee.org/document/10207712 (Beyond Von Neumann in the Computing Continuum: Architectures, Applications, and Future Directions)

- https://chatgpt.com/share/68225928-1de8-8004-a9a6-1ad6a507a97c (I had to nudge it a bit to make it emit the correct argument)
  - https://chatgpt.com/c/68225616-559c-8004-bf78-491f9d9e82ad
- https://grok.com/share/c2hhcmQtMg%3D%3D_18e4bd3c-364f-4d30-b01a-2ef4e6a208de (Grok does worse in this regard)
- Modern (late 2025) GPT and Grok do much better now. Although my prompt was way too biased lol.
  - https://chatgpt.com/share/68e7453b-689c-8004-b50a-33399ebff449
  - https://grok.com/share/c2hhcmQtMg%3D%3D_957e2e29-aa45-40b3-b331-0d4858c6bb8d

- https://www.sigarch.org/dont-put-all-your-tensors-in-one-basket-hardware-lottery/
  - More misunderstanding...
  - https://hardwarelottery.github.io/

- There is one concession I can make which is that if you can coax a problem to look like a Pytorch graph, you can benefit from existing good compilers and hardware targets. But notably, that has nothing *in particular* to do with matmul engines! It has to do with the intrinsic properties of the algorithm you can cast as such.

> What if the next breakthrough doesn’t look anything like a giant MatMul? The field of neurobiology points to sparse and event-driven primitives in our brain, but definitely not training a deep Transformer model

This is completely besides the point. What does what biology looks like have anything to do with what is the most efficient and easy to get working? Dense > sparse in all cases. Notwithstanding thermal constraints and physical hardware density limits.
Sparse and event driven primitives can be easily emulated on existing MIMD / SIMT von-Neumann architectures (albeit with less efficiency than biological systems).
It's about the algorithm!

> partly because the entire ecosystem (funding, talent, compilers, access) orbits around the incumbent tech: no one uses a different hardware paradigm because it’s not supported, and it’s not supported because no one’s using it

This is not true at all. The space of AI is so huge and there is more money than ever going to very exotic things for ML. Just look at Extropic and Normal Computing for some exotic examples (there are plenty of others too). Not to mention all the exotic edge ML things (even Tenstorrent started out like this) and the research with IBM and Intel on neuromorphic computing. There is so much slushy money everywhere, this benefits even those who take risks on exotic hw architectures for exotic AI architectures.

CIM / PIM / analog computing / time-domain computing / current-domain MACs and so forth have been done to death over and over again. What exactly do you want? What is your argument? It is just vague fluff.

> One path to break the deadlock is to use today’s ML and algorithm discovery tools to search the co-design space, letting models propose microarchitectures and algorithms that are jointly efficient. This isn’t just about optimizing the current paradigm; it is about asking AI to help us discover the “winning” hardware primitives for the next one

So have you done this? Asked the model? I guess not, so I will on your behalf. Also the last sentence here is clearly written by Mr. Model. Try to use your brain next time.

https://chatgpt.com/share/68e749b2-605c-8004-a7e6-fa58572558ba

Oh wow! It's the exact same nonsense that has been repeated ad nauseam forever (configurable dataflow fabrics - CGRA architectures, well you know SambaNova has hundreds of millions in VC funding right, so much for ignored?, CIM, structured sparsity, mixed-precision, chiplets, analog compute, sparse 'accelerators', async / event-driven architectures, on-chip NAS LMAO). Let's do more of that so we can "win" the "hardware lottery".

> This offers a simple litmus test: if hardware cannot adapt to run new approaches as they emerge, it has already become too specialized.

Any algorithm that can efficiently exploit DLP/MLP can be accelerated using GPGPUs or multicores or FPGAs or ....
The onus is on the algorithm designer to show that a specific circuit can enhance things even further.

> By building accelerators with broader generality, we don’t discard our winning ticket, we hedge our bets by adding new numbers. The true jackpot isn’t raw speed, but the hardware-and-algorithm duo that unlocks the next computing era. Stop spinning the wheel and start redesigning the machine.

The words sound nice, but what do they mean? What is your proposal? What is your complaint about the existing hardware platforms? I can think of many, but you should at least try to articulate one.

> Portions of this post were edited with the assistance of AI models. Some references and notes were also compiled using AI tools.

This is embarrassing. Sigarch has become laughable.
