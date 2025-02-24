# Humans Should Never Have to do Place and Route

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
