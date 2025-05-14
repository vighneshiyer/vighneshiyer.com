+++
title = "Silicon Data Collection and Benchmarking"
date = 2023-02-28
draft = true
description = ""
+++

There are a few random people who do lots of great work today in the realm of benchmarking and data collection of real hardware.
Phoronix, Kurnal, Geekerwan, HighYield, Semianalysis, Linley's microprocessor report, Chips and Cheese, NotebookCheck, TechInsights, iFixit, former Anandtech

https://github.com/karlrupp/microprocessor-trend-data
SemiWiki, WikiChip
What used to be a mainstay of academic groups went to random bloggers and now is completely shrouded in mystery within a few companies.
There is no reason a competent comparch group couldn't be the source of data for all this highly sought after information (yield estimates and cost estimates included, albeit with low confidence).

# Microarchitecture Analysis Media

My instinct is that there is a significant audience of people (people who work in semiconductors, laypeople interested in technology, uarch researchers) who are looking for highly recent microarchitecture analysis of commercial silicon (all kinds of chips intended for datacenter, desktop, mobile, embedded, and devboards).

## The Product

I would expect coverage of these kinds of chips:

I would expect coverage of these venues and relevant technology projections:

I would expect these kinds of analyses
Why isn't anyone doing a good job of this?

## Existing Players

Systematic comparison of commercial silicon running similar benchmarks (both for desktop e.g. Phoronix and datacenter e.g. stuff we will figure out)

- HighYield
- TheChipLetter
- SemiAnalysis
- Chips and Cheese
- https://www.notebookcheck.net/Apple-M4-Pro-analysis-Extremely-fast-but-not-as-efficient.915270.0.html
- https://www.agner.org/optimize/microarchitecture.pdf
- https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html
- https://rajesh-s.gitbook.io/compengg/area_specific/processors
- Kurnal: https://www.reddit.com/r/hardware/comments/1gmfvoi/kurnal_mt6991_dimensity_9400_analysis_report/
  - https://x.com/Kurnalsalts/status/1799097967884083393
- Geekerwan
- https://irrationalanalysis.substack.com/p/a-background-proof-guide-on-communication
- https://www.fabricatedknowledge.com/p/its-high-time-to-look-at-sitime?utm_source=substack&utm_campaign=post_embed&utm_medium=web
- https://epoch.ai/data/machine-learning-hardware
- MLPerf
- https://www.guru3d.com/story/intel-lunar-lake-processor-architecture-die-and-pch-annotated/ (using Kurnal's annotated die shots)

## Opportunities

- Not merely running benchmarks, but analyzing off chip interfaces and their utilization (DDR bandwidth and characterization via mess like things) and doing top-down uarch analysis to determine how each CPU is handling different workloads. And in the case of Intel vs AMD, analyzing instruction mixes and ISA extension usage to determine how much benefit comes from arch dependent SIMD or other exotic instructions vs simply better/larger uarch structures. Comparison of number of retired of instructions and uops, IPC trace using sampling. Lots of data we could extract and analyze that others don't bother to (just report top-line numbers without analysis / reverse engineering). Evaluate impact of turning -march=native optimizations vs using an upstream generic binary (and redo the above analyses).
- Same goes for power analysis, try to build a setup where we can measure core power with detailed current monitors separately from the board power. Currently, most people just report wall power, but we have the modular PSU, which should enable very precise per-pin power measurements + any on-chip power monitors we can access. Be able to analyze static/idle power in multiple sleep states and during OS idling, try to estimate the power consumed by each functional unit and uncore structures depending on activity.
- Getting per-core-type power/performance curves for every generation P/E/embedded core in a given SoC would be quite useful data
- Similar to the Chips and Cheese analyses, getting cache line ping-pong latency data + some basic reverse engineering of the microarchitecture's limitations (amount of reordering capacity, ability to rewrite certain instructions, branch predictor history and recall capacity) are very interesting. See how MESS did this for the outer level memory system.
- Perhaps we can also look at chip variability and characterize it
  - There is no reason this aspect can't be industry funded, everyone benefits, this is just like industry buying the Linley report lol
- There are also lots of process and packaging things presented in IEDM, ISSCC, TSMC symposium, CICC
  - People like me are too dumb to understand this low-level process technology and physics stuff
  - All these packaging technologies and other fundamental technological innovations too need to be surfaced (new cooling technologies, silicon photonics, optical interconnects)
  - As an example, IEDM 2024 proceedings (what is the takeaway?, we can extract all kinds of info wrt stdcell / sram density and efficiency scaling trends): https://static1.squarespace.com/static/67a3eee4385dfb3390804f02/t/67d4b9026674b64dfd6d035b/1741994245226/IEDM+2024+Archive.pdf
