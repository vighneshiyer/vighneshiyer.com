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

- Copy over the note I wrote lucy in 2025
