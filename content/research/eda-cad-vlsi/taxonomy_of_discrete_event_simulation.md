+++
title = "A Taxonomy of Discrete Event Simulators"
date = 2023-08-23
draft = true
slug = "taxonomy-of-discrete-event-simulators"
+++

Taxonomy of Discrete Event Driven Simulation

Modeling primitives and abstraction
  - FRP
  - Streams / Channels
  - Combinational paths (same time fixpoint iteration, delta cycles) allowed?

Language

Runtime algorithm
  - A-port style
  - Global synchronization style for lockstep time advancement
  - https://eecs.ceas.uc.edu/~wilseypa/classes/ece975/pre2010/applications/vlsi/soule-tomacs91.pdf

Runtime hardware platform
- FPGA vs GPU vs CPU vs multicore CPU

- Synthesizable vs testbench verilog
- systemverilog

Ability to fork off process within a processing of an event
Are all updates triggred by an event?
Notion of ports and modules (encapsulation / hierarchy modeling primitives)
Intended usecase

- Examples
  - SystemVerilog
  - SystemC
  - XLS
  - SimPy
  - gem5
  - Ptolemy
  - Simula
  - SST
  - DAM

## Nathan's Talk on DAM

- How do you handle combinational feedback from input to output ports, do you need to do iteration until steady state
- How do you model parallel threads within a modeled component, consider multiple requests in flight in a dma unit with reordering possible
- How do you model peek without pull on a channel when the time of the sending component isn't guaranteed to advance in lock step with the downstream component?
- Oh the calibration thing is quite iffy it's just like gem5 param calibration, can you actually check that the timing params get closer to rtl or is this just curve fitting?
