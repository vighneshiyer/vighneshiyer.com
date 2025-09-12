+++
title = "Humans Should Never Have to do Place and Route"
date = 2023-03-01
draft = true
slug = "pnr-should-be-automatic"
+++

- Digital side
  - yeah we already know and everyone agrees
  - multiobjective optimization can only be done algorithmically
- Analog side
  - Ancient days of evolutionary algorithms for both topology synthesis and transistor sizing (but perhaps not for automated layout)
  - ALIGN
  - Stdcell generation from nvidia research
- What is missing?
  - Semantics for everything, formally encode what humans are thinking (matched pair, importance of variation on a particular set of transistors, )
  - Describe layout techniques on different axes and combine them automatically (think: Halide for analog layout techniques, e.g. combine parametric common centroid + dummies + multi-finger)
  - LLM driven code modifications / diffs
- PCB side
  - Cypress: VLSI-Inspired PCB Placement with GPU Acceleration (https://www.csl.cornell.edu/~zhiruz/pdfs/cypress-ispd2025.pdf)
  - Quilter, DeepPCB, JITX

- https://arxiv.org/pdf/2503.22958 (Late Breaking Results: Breaking Symmetry— Unconventional Placement of Analog Circuits using Multi-Level Multi-Agent Reinforcement Learning)
  - This suggests that we shouldn't even bother with formalizing 'layout techniques' and just eagerly move to a fully automated flow with sufficiently fast/parallel/incremental parasitic-aware and variation-aware simulation tools

- https://news.ycombinator.com/item?id=43499992 (Things I would have told myself before building an autorouter (autorouting.com))
  - Some good lessons here, but ultimately the author makes a mistake in dismissing stochastic techniques
- [SO3-Cell: Standard Cell Layout Automation Framework for Simultaneous Optimization of Topology, Placement, and Routing](https://vlsicad.ucsd.edu/Publications/Conferences/418/c418.pdf)
