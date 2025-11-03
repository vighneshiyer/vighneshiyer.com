+++
title = "Thoughts on Extropic"
date = 2025-10-30
draft = true
description = "'Thermodynamic computing' from Extropic and Normal Computing is a cool idea, but flawed."
+++

- https://github.com/extropic-ai/thrml
- https://docs.thrml.ai/en/latest/api/models/ising/
- WIP understanding EBMs and Ising Machines: https://chatgpt.com/c/6906c0f3-3f04-8329-8ffa-dbcc87a8ae72
  - Try to understand how to map a real discrete optimization problem like SAT onto this network architecture
  - So far, they have just trained models that just converge to some desired 1/0 configuration from noise - there is no notion of 'programming' the model (e.g. programming an image classification model by providing it with image patches)
- https://www.nature.com/articles/s41598-019-49699-5 (Analog Coupled Oscillator Based Weighted Ising Machine) - old idea from Berkeley, coupled analog oscillators naturally converging to a solution
  - https://jaijeet.github.io/jrpages/research.html (Jaijeet has done lots of this work)
- There are also plenty of Japanese CMOS Ising machine simulators out there (many presented in ISSCC). This is more of a 'simulation-oriented' solution rather than trying to embed the problem in a physical phenomena directly.
- Why have people traditionally used various cryogenic devices to extract noise from physical phenomena? Probably for speed and precision reasons.
- CMOS subthreshold shot noise - have to keep temperature constant, how many effective control bits after considering the variation per control word and squeezing off things at the ends with low precision (due to the sigmoidal shape). Can run everything in subthreshold, which is good from efficiency perspective, but will be low performance, and have to compensate for Pelgrom variation with upsizing (or else every die will have different per-noise generator characteristics).
  - Can we model this same phenomena using traditional digital CMOS? Certainly yes. And without losing much efficiency (esp area efficiency). Stop reporting total energy or even EDP - this obscures the actual tradeoff which is this thing can only run at 10s of MHz and requires lots of sampling to overcome the time-domain noise correlation
- Attach Zimmer's slides
