+++
title = "Synthesizing Hardware Bugs, Assertions, and Coverpoints + Specification Mining for Hardware"
date = 2023-12-18
draft = true
slug = "hardware-bug-coverpoint-synthesis-and-specification-mining"
+++

# Synthesizing RTL Bugs, Assertions, and Coverpoints

In the world of open-source hardware design research, there aren't designs with interesting and reproducable bugs, assertions, and coverpoints.
So, there is a need to synthesize them in a systematic way to: 1) check whether our bug hunting tools work well, 2) localize existing bugs once we've found them, 3) cover interesting states of our design without manually writing functional coverpoints.

## Specification Mining

## RTL Bug Synthesis

https://github.com/YosysHQ/mcy
https://docs.google.com/document/d/1eNT_bgSnVkjymvXULtAhMia81HmWfJxphnfedc1diX0/edit#

https://github.com/hackdac/hackdac_2018_beta

- https://dl.acm.org/doi/pdf/10.1145/3236024.3236084
- https://dl.acm.org/doi/pdf/10.1145/3468264.3468623?casa_token=DQjCGDYIIggAAAAA:YwQUNjYheIqWG6dSb0LwsLn_VbFKDhXK_n6jy8LJw5nrR1HpV-hpFuY-vembPMsmtKgikSNgjv_XqFU
- https://dl.acm.org/doi/10.1145/3287624.3287660
- Bug Synthesis: Challenging Bug-Finding Tools with Deep Faults

- [ ] Differential Coverage Metric on DDR MC

> This is the only reasonable extension to the bug benchmark paper - trying to compare formal and dynamic verification on designs isn't very convincing to reviewers - we shall motivate the differential coverage metric directly by making it evidently useful on a larger and deeper design like the DDR MC and write a paper exclusively on that. In doing so, we might discover a better API for writing input generators that can switch between formal and dynamic without perf overheads on either side.
>
> See notes from 7/18/2022 in verif

## Note I Wrote

> Hello, we would like to solicit feedback on the idea of automatic test vector / assertion generation for Chipyard blocks, ATPG-style. Such a generator would take into account the interface of the given module, traverse the logic within in to generate a set of test vectors, and either present possible assertions to the user or insert them into the block (either through synthesizable chisel tests or not).
>
> - A major question is - how should the desired output be determined? Should the user need to present examples of correct output, or should they have to manually edit the assertions to the output they need (and the default would be to assert that whatever the current FSMs are doing is correct)?
> - Another major question - is this even useful? should chisel tests just die and system tests rule? does automatic test generation only help if there's a separate golden model to reference?
>
> Thank you in advance!

Hi Lucy, I thought I should comment on the note you wrote on #chipyard. It seems like you want to work on coverage-guided stimulus generation / fuzzing and/or assertion/coverpoint synthesis.

The ultimate goal is to find RTL bugs. Ideally we could do the following 'automatically':

1. Define buggy states of arbitrary RTL with some vague specification or 'good' waveform data (i.e. via assertion synthesis)
2. Define what it means for the RTL to be in an "interesting" state so we can get close to the 'buggy' states (i.e. via coverpoint synthesis)
3. A way to generate stimulus / manipulate the target RTL to induce bugs (i.e. via fuzzing)

Which one of these would you like to explore?

For (1), I have done some work here way in the past (https://dl.acm.org/doi/abs/10.1145/3359986.3361202), which was based on (https://ieeexplore.ieee.org/document/5523247), and that paper was based on (https://ieeexplore.ieee.org/abstract/document/5457129). For (1), people have also looked at so-called 'bug synthesis' in the context of software fuzzing (the most famous one being LAVA: https://ieeexplore.ieee.org/abstract/document/7546498). AFAIK, no one has applied a similar technique to hardware, but the value is dubious.

To my knowledge, no one has properly explored (2), but it can be done via 'specification mining' just like assertion synthesis. This might be a good area for you.

From my experience, it is hard to explore (3) since it is often limited to simulating RISC-V cores against functional models (e.g. spike) and using some fuzzing techniques. There is lots of prior work on this such as this classic (https://ieeexplore.ieee.org/abstract/document/9519470) and this one from Flavien (https://www.usenix.org/conference/usenixsecurity24/presentation/solt). Having said that, I think RISC-V program generation is still an underexplored area. This "logic fuzzer" paper does several interesting tricks (https://dl.acm.org/doi/abs/10.1145/3466752.3480092) that you may want to replicate.

Finally, if all of these seem painful, it would be cool just to get fork/join support in the new "ChiselSim" thing (https://www.chisel-lang.org/docs/appendix/migrating-from-chiseltest). You can do it the chiseltest way (`fork` actually spawns a new JVM thread and the runtime parks/unparks threads) or my way (https://github.com/euphoric-hardware/simcommand) (`fork/join` don't spawn threads and instead continuations and a simulation monad are used).


So (1) can be done with specification mining if you have some waveform data of expected behavior (but that does assume you have some stimulus generator to begin with). Today, many are trying to use LLMs for (1), which in theory doesn't need any formal specification or waveform data (although it is a fishy technique).

(3) can be done without any stimulus generator if you wish to use formal methods. For example, you can use bounded model checking to explore the state space that can be hit N cycles after reset and if any assertions are tripped by then. The downside, is you have to declare the input port assumptions in a way the formal solver can understand (it can't be arbitrary software, you are restricted to what you can express in SystemVerilog / SVA).

As you pointed out originally, there might be little utility in unit testing in the first place when you have a small team and a short timeline. Perhaps system-level tests for stimulus generation are the best. In that case, the relevant problem becomes unit-level and interface-level assertion generation (a bit iffy, but doable for specific well-defined interfaces) and coverpoint generation (more reasonable since it can be derived from waveform data). Then you try to hit the coverpoints more aggressively using some stimulus tuning, and you can claim a victory (you can use some ML to craft the stimulus that the DDR controller sees, for example).

I think something useful is to 1) build a parameterized stimulus generator as a regular C program that runs on the SoC, 2) generate a bunch of stimulus and collect waveforms, 3) mine assertions and potential coverpoints using specification mining or LLMs, and 4) use some ML or your own intuition to tune the stimulus generator or craft new types of stimulus to hit coverage more aggressively. This is in the context of some block you're adding to the SoC or some block that is not well tested (it can be a cache, any uncore component, an accelerator, ...)

- https://arxiv.org/pdf/2503.19174
