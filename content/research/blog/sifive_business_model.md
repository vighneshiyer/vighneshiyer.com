# My View on SiFive's Future (and Past)

The early days of RISC-V. Replace MIPS for CS61C.
Fully academic initially, some test chips, supervisor ISA, fast iteration, Linux port.
Appeared there was some market for getting rid of the ARM royalty and ISA lockdown.
Maybe there is an opportunity? But a new ISA isn't enough for a new company.

Why would a VC invest in a startup IP vendor?
The answer is: they would never.
Brutal market, annoying penny-pinching customers, stiff entrenched competition, extreme human resources are required, capital intensive, risky when dealing with silicon, buyouts are at low multiples.
So... as usual you have to sell something else to a VC. 10x improvement over the current SOTA. A path to a moonshot valuation. Capturing a piece of an extremely hot market trend.
What would that be? I can only speculate what they said to Sutter Hill and other Series A VCs.

- Started off with Yunsup's vision.
  - Try to sell a generator! Highly custom IPs available straight to the customer without any hassle. Customization interface on the web. Super cool.
  - No royalties, only a fixed license fee that was transparent and easily available to the customer.
  - Generator methodology meant that customers could get highly customized IP (even with their own inst extensions),
  - But... no one really wanted this, and it didn't come to fruition either. The siFive SoC builder was cool and existed, but at the end was a "contact us" rather than "buy now"
- Continued to do IP development, since they had a head start and control of the RISC-V ISA initially, they could just be first out the door on RISC-V IP.
  - This isn't the case anymore. Had to exit the low end (Andes, SpaceMiT, Alibaba, Codasip). Had to exit the high end too (Ventana, Rivos, Tenstorrent, Ahead computing, Akeana).
  - What is left? Customers are getting difficult to acquire and retain without also exploding human cost.
- Their own silicon! Try to bootstrap the RISC-V devboard ecosystem
  - Hifive SoC was an Arduino competitior! Is there anything that can compete with a Raspberry-Pi though? Not yet...
  - Still a relative success for SiFive, got lots of usage and excitement for a new entrant in the embedded silicon space.
- The IP catalog idea! Actually a great idea to try to puncture an obscure and opaque market for IPs.
  - SiFive designshare
  - https://www.sifive.com/blog/the-designshare-ecosystem-grows-with-the-addition-of-ultrasocs-embedded-analytics-ip
  - https://www.sifive.com/blog/partnership-with-rambus-and-designshare-economy
  - Original case: open marketplace, list of IPs, explanation of what each IP contains (RTL, constraints, verification collateral, ...) and exact pricing (license + royalty)
    - And ideally: "buy now"
  - But this never panned out - the business model of the existing IP players was too entrenched to disrupt unless SiFive offered their own IPs for sale in this manner (and if they acquired some analog IP vendors and did more digital IP development and sale)
  - Why didn't this work? Can we retry this?
- Tailwinds due to ARM getting desperate. Multiple lawsuits by ARM against Nuvia and Qualcomm, Apple can continue to strongarm ARM, but others are now more wary about acquiring an ARM startup or getting their own architectural license.
- ARM dominance is pushed through primarily by Apple. Hyperscalers try to follow and there are positive trends, but still a long way to go on the server side. But ARM IPs are now becoming competitive on performance, and have already been competitive on TCO vs x86 vendors. Some ARM shops like Ampere Computing are getting deprecated. ARM IP is growing in strength, and very few can produce IPs better than ARM themselves (Qualcomm through Nuvia, and Apple are the only exceptions). NVIDIA is working hard here too, but are still not at Apple's level.
- Delays, delays, delays - turns out building a traditional CPU IP house is very hard and requires a lot of capital expenditure.
- The customer customization and verification problem. IP vendors can only succeed financially if they can keep human costs down - that is the biggest expense by far.
  - Verification is a huge issue. Chisel may make creating new custom cores easier, but the coverage model gets erased every time, more / different coverpoints are needed, regression runs need to run again, pain :(
- Is Chisel / FIRRTL an albatross when you have to pivot from the pie-in-the-sky business model sold to VCs to a more traditional IP shop?
  - Expenditure in the circt toolchain to replace Scala FIRRTL. Hiring LLVM experts... (Chris Lattner)
  - Was this worth it? Does Chisel buy any advantage over SystemVerilog with some shim metaprogramming layer (as everyone else does) at this point?
- Turning down Intel acquisition.
  - https://www.reddit.com/r/RISCV/comments/nwwry1/intel_trying_to_buy_sifive/
- Western Digital gets involved briefly (Swerve). NVIDIA shows face.
- Failure of Intel Horse Creek SoC.
  - https://community.intel.com/t5/Blogs/Tech-Innovation/open-intel/What-s-in-store-for-the-latest-RISC-V-development-board/post/1448348
  - https://www.sifive.com/press/sifive-leadership-in-risc-v-powers-2.5b-company-valuation

> “Intel believes in enabling a multi-ISA strategy, including RISC-V as the open compute base for future platforms,” said Bob Brennan, VP & GM, Customer Solutions Engineering, Intel Foundry Services. “Our IFS investment in RISC-V includes partnering with RISC-V leader SiFive to build the Horse Creek developer platform that will be broadly available in late 2022, based on Intel 4 process technology.”

- SiFive CEO switcheroo to Patrick Little. Outster of the original engineering team from leadership as VCs want to push profit. Deeply unprofitable so far.
  - Engineering team comes back slightly after the 2024 layoffs.
    - https://www.reddit.com/r/hardware/comments/17fpzpv/sifive_lays_off_hundreds_of_riscv_developers/
  - Significant restructing.
  - Move from licensing model to a license fee + royalty model - basically the same take as ARM (but we're cheaper!).
  - Somehow, some siFive people move to MIPS!!!?? Weird.
- Series F pushes valuation even higher, but funds are not turning profits easily. Valuation isn't exploding...
  - Extreme capital dumping. Tender offer to allow early people to escape.
  - Verification burden is intense.
- China takes the lead. Xiangshan. Alibaba T-Head. SpaceMiT. ESWIN.
  - Even SiFive depends on China.
  - Krste is a rockstar. The auditorium explodes as he walks into the RISC-V Summit China.
- Esperanto is basically done.
- Cringy SiFive P550 video
- Qualcomm wants to reuse Nuvia IP for RISC-V. Compressed extension debates.
- Sifive intelligence core complex. Quite good. Customers seem happy internally. Lots of proliferation that was unexpected. RVV matures. RVA profiles mature.
- P670
- P870

I'm sure I got so many things wrong in my recollection of history. SiFive people, please correct me.

- https://www.reddit.com/r/RISCV/comments/txgzfg/can_sifive_thrive_chip_designer_needs_a_strong/
  - Some good comments here
  - Why is Bruce Hoult such a shill for SiFive when he doesn't even work there? He seems to be a smart guy.

- https://www.reddit.com/r/RISCV/comments/18xvy8p/mips_picks_up_former_sifive_execs_in_riscv_drive/

> It's sad that SiFive's original business model didn't make sense
>
> > They thought there would be a whole new market of small companies that had always wanted to make specialised chips, but didn't have the know-how, and SiFive could help them with that. SiFive bought a chip design company, Open Silicon, in June 2018, for this reason.
> >
> > But it turns out that the market is companies that were already making chips, and they just want to license better/cheaper cores, not have someone design chips for them. So SiFive already sold Open Silicon (as OpenFive) off again (at a very large profit!) in March 2022.
> >
> > What I believe the October layoffs mean is that SiFive decided not to try to compete with Ventana, Tenstorrent, Rivos for the desktop and server markets, but to stick in an Arm-like market segment with a portfolio of cores ranging from smaller than Cortex-M0 to approximately Cortex-X3.
> >
> > That's a huge and rapidly-growing market and they have (in the RISC-V world) the part of that above U74 pretty much to themselves.
> >
> > If they're not designing as many new cores as in the past then they don't need as many core designers, verification teams etc. If they're not making chips such as the FU740 themselves, but leaving even the dev demo chips to Intel and/or SOPHGO then they also don't need the chip layout and validation teams.

P550 doesn't live up to the SiFive marketing hype, although it seems decent (it can somewhat outperform the C910, but that is a low bar) (it implements an old ISA without RVV support, Spacemit k1 and kendryte k230 already have support). The EWSIN SoC itself is quite complex and has lots of IPs (https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases).

- https://news.ycombinator.com/item?id=42839501 (SiFive's P550 Microarchitecture (chipsandcheese.com))
- https://chipsandcheese.com/p/a-risc-v-progress-check-benchmarking
