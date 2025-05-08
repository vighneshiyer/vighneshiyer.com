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
