+++
title = "Power Modeling"
date = 2022-10-17
draft = true
+++

## Infrastructure

- Average power extraction using Hammer with Cadence Joules (for RTL → power flow) with Intel 16 nominally works
- Per-cycle power extraction using Joules batch mode with Intel 16 on Chipyard designs nominally works, but isn't integrated in Hammer yet (hand-written TCL only)
    - ASAP7 / Sky130 not rigorously tested
- hammer-example repo for quick iteration of CAD tool options and flows

## Prior Work

- 2 categories of papers
    - Architectural power models (suitable for HW DSE): Wattch, Mc-PAT, CACTI, Mc-PAT-Calib (TCAD 22)
    - RTL-level monolithic power models (also used for OPMs): Simmani, Strober, PRIMAL, APOLLO (MICRO 21), DEEP (OPM) (ICCAD 22)
- Major issue: comparisons between papers are nearly impossible - different CAD tools, technologies, benchmark circuits, stimuli, etc.
    - Some papers report `<1%` cycle-by-cycle error, while others claim `5%` error on average power is good enough
    - There is no way to reconcile these discrepancies without testing each technique on the same base benchmark

## Current State

### What are we good at

- Writing RTL
- Simulating it using firesim / Chipyard RTL sim ecosystem
- Extracting uArch event traces (from RTL sim or from firesim)
    - Ability to sidestep gem5 (arch sim in general) by extracting events straight from RTL

### What we don’t have / are bad at?

- uArch structure power models (cap estimation)
- Perf simulator 🡘 thermal/power sim 2-way interaction
- uArch-level cycle-level granularity perf model

### What do we want? / What to Work on?

- Power estimation tool that enables HW parameter DSE
    - Can’t use monolithic models (retraining, etc. makes it prohibitive)
- Cycle-level granularity, real uArch events
    - Avoid using gem5, can’t adapt gem5 to new accelerators without a lot of work

## What to Work On?

- Driving application is critical - just trying to follow up on previous marcomodeling work is not fruitful

## Notes from 10/17/2022 ATHLETE internal meeting

- bsg_fakeram - look at this - is it any good?
- look into DRAMSim2-based power modeling, also must consider controller/PHY (and channel) energy which isn't captured in current Chipyard sims
- runtime power modeling - model throttling, fixed power envelope
    - is this just OPM design?
        - Bora: this must be a predictive power model that can throttle things ahead of time
    - corner calibration of existing OPMs?
    - use a software thermal model based on uarch counters, feed that back to a RTL visible register, ...
        - what can the PMU control on the arch side? (power on/off what exactly?, what can be throttled?)
        - see all the complexity in Intel ThreadDirector
- Concretely:
    - select uArch counters and calibrate them - get this accurate first then work on thermal model...
        - add more uArch counters as you see fit
        - compare against automatic power proxy selection approach
        - look at Intel and ARM's uArch counters for reference
    - fix the HW parameters, train a power model for each design point (evaluate time granularity and accuracy possible with each set of uArch counters)
- Bora: we need to work towards a silicon power measurement technique (digital LDO)

## Old Plan

- FIRRTL → uArch structure analysis → automatic extraction of uArch events
    - register files, FUs, Queues, memories, complex combinational logic, FSMs
    - memory structure writes/reads, queue pops/pushes, input data density to FUs, FSM state transitions, etc. (take into account clock gating just like Wattch)
- uArch power models for each structure (parameterized on process and uArch parameters and timing) (events → energy)
    - Purely analytical models (CACTI)
    - Purely ML based
        - Split model into distinct feature sets (process/.libs, logic opt, sizing, uArch parameters, timing constraints/clocking)
        - Allow swapping out .lib part of model without having to retrain the other parts? Or is naive fine-tuning sufficient?
        - Transformer model: NLP, variable length ‘sentences’ → embedding
            - Train an ensemble of models for uArch parameters (and combine their results) OR train a generic model that takes uArch parameters as input features?
- RTL simulation → uArch event traces (tools like SNS [ISCA 2022] can give quick area/timing estimates from FIRRTL)
- How to capture the interaction of all these models?
    - Is it acceptable to consider them independent?
    - We can capture that interaction as a graph → edges represents data or control flow?
    - Can we use a graph embedding to add a correction term to the independent models (or intelligently aggregate their results?)
- Frequency constraint is going to affect the uArch structure power models
    - Multi-Vt, sizing, logic opt (different adder arch for different freq, area/power/freq tradeoffs), clock tree power

### Does this solve our problems?

- Automatic signal selection (Simmani, Apollo), which signals are important, useful for on-chip power monitor, bad for HW DSE
    - design-agnostic, minimal
- Architectural model (McPAT, Wattch), good for HW DSE, but doesn’t capture everything
    - design-specific
- Data-dependent power
