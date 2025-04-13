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
