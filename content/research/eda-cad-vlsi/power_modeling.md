+++
title = "Next Steps in Power Modeling"
date = 2022-10-17
draft = true
slug = "power-modeling-research"
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

+++
title = "Power Modeling of Microarchitectures"
date = 2023-05-04
draft = true
+++

## Power and Microarchitecture



## The Power Modeling Problems Broadly

### Specification

### Frontend

### Verification

### Macromodeling

### Stimulus Generation

### Design Iteration

### Backend

- Frontend and specification related
- Verification related
- Macromodeling for on-chip power monitors (OPM)
- Macromodeling for RTL iteration or software optimization
- RTL-level power estimation
- Power virus generation
- CAD tools
  - activity propagation
  - modeling physical stuff + clock trees accurately
  - power-aware simulation

## Prior Work

## Research Questions

Let's begin by applying magic box thinking to the problems in power modeling.

## Raw Notes

- RTL -> box -> training data / worst case trace / typical trace / power
- RTL + workload + delta RTL -> box -> power trace + impact of delta
  - Combined with a fix that guides RTL design (e.g. clock gating logic, suggestions on opportunities for coarse-grained gating)
  - Prior work on this Simmani/Strober (change in RTL requires rerunning Joules + retaining the model), there is also ability do hierarchical macromodeling to cope with parameterized RTL
  - GNNs for PPA (usual stuff), prediction either on the RTL netlist or from higher-level like traces from HLS descriptions
  - Cadence Joules (of course).
- Problems
  - long latency of RTL iteration (gathering a power trace for long workloads from basic CAD principles is impossible) - PowerPro tries to address this, but Cadence Joules people are quite critical of its approach
  - power budgeting @ runtime (sticking to a thermal envelope while optimizing user-visible metrics) - see Carloni's paper in recent ISCA about this w/ IBM
    - OPM design (see Simmani, Apollo, DEEP)
  - verification of power gating + ... - Apple claims this is a cause of lots of edge-case bugs which aren't explored in typical block-level RTL simulation (only at SoC level)
  - Pathological / typical workload generation
    - Also relevant wrt building a training set for a macromodel
    - 1) formal methods 2) instruction generation methods 3) extraction from a full workload
  - Identification + fixing of power non-optimialities (similar to PowerPro / Joules)
- Instruction block embeddings enable some interesting stuff
  - Power / perf prediction at instruction block level
  - FireSim for validation of embeddings
  - Exploring clustering / sampling for power
  - How to deal with RTL changes? The strategies are usually different for core uarch deltas vs cache hierarchy deltas (see gem5 O3 CPU model vs the trace-driven memory hierarchy model)

## Ideas

- Redo Mark Horowitz's power-per-X diagram
  - https://gwern.net/doc/cs/hardware/2014-horowitz-2.pdf (Computing’s Energy Problem (and what we can do about it))
  - Area/power efficiency vs performance vs variability and so forth are not properly characterized. The actual design space and energy/area/performance tradeoffs are quite broad.
  - Accelergy (https://github.com/Accelergy-Project/accelergy) has some 'power' and 'area' numbers defined in csv files (https://github.com/Accelergy-Project/accelergy-table-based-plug-ins/blob/master/set_of_table_templates/data/intadder.csv) and people actually write papers that report these numbers!

# Notes from Joonho: Power Modeling

#Research/Notes/Power-Modeling

---

# Previous work on power modeling and their limitations

## Previous work
- So most of the power modeling work in academia looks like this.
  1. Run RTL simulation to obtain traces.
  2. Train a macro-model (a linear model or a ML model) based on the activity factors of each wire. This step requires running Joules with the RTL waveforms to obtain training data for the model.
  3. Evaluate the macro-model on a new workload.
- So, their work is basically a derivative of Simmani. Simmani selects a couple of wires to train their power model and uses VCD dumps to obtain training data from Joules. It obtains RTL level activity factors from FireSim by adding special annotations.
- All the variants of Simmani just have different ways of selecting the wires or use different modeling techniques.

## Limitations
- These work mostly focus on reducing the Joules simulation time by replacing it with a model. However, the problem is that this part is embarrassingly parallel : assuming that you have a long waveform, you cut it up into pieces and feed each part into Joules and execute them in parallel. Easy peasy. Another limitation is that most of the time, you don’t even want cycle level power traces anyways. You only care about the system level power consumption and whether or not each big RTL chunk is acting within its power envelope.

---

# What we actually want
- The main bottleneck of performing early power estimation is the synthesis step that maps your RTL into gates. Hence, to perform fast power estimation, what we really want is a very quick synthesis tool. This can be achieved by performing incremental synthesis on your design. So the overall steps will look like this.
  1. Run synthesis to obtain the netlist of your initial design.
  2. Make changes to your RTL.
  3. Use incremental synthesis to update your netlist. Normally, updating your RTL will affect the nearby gates as well, but this isn’t a big issue here. As we mentioned above, we only care about the big trends when performing runtime power estimation and supposedly, these small patches to your RTL won’t affect this big trend anyways (i.e., it is okay to have some error). This step can be achieved by something similar to LiveSim. You can add patches during link time by compiling your new design as a shared library.
- So the initial steps of this process would be to obtain a gate level netlist using ABC which is a open-source synthesis tool, and applying the technology specific power-draw information of each gate to obtain a power draw estimation.
  - [ABC: A System for Sequential Synthesis and Verification](https://people.eecs.berkeley.edu/~alanmi/abc/)
  - [berkeley-abc/abc: ABC: System for Sequential Logic Synthesis and Formal Verification](https://github.com/berkeley-abc/abc)

# Area estimation
- I think this applies to area estimation as well. The reason why we can’t perform early stage area estimation is because synthesis and PNR takes forever to finish. Throwing training data to ML models is just a workaround to these problems which isn’t all that interesting nor provides a fundamental solution. What we really need is to have a vertically integrated flow starting from the language frontend, to the CAD tools which enables us to perform incremental elaboration, simulation, synthesis and PNR. This would be the key to obtaining early PPA estimation.

---

# Nayiri's power modeling
- Measure per instruction power consumption and add it up to get the total energy
- Breaks down for OoO cores
    - Can be solved by running instruction intervals and measuring the power consumed by the interval. Then we can train a model that can extrapolate the power for a given program.
    - Doesn't work when you change the RTL

---

# What are the big problems when it comes to power eval
- Long iteration latency (long time to synthesize and long time to run simulations)
- Verification (power gating can introduce bugs : e.g., missing cachelines)
- Power budgetting during runtime (distributing power tokens to different power domains, what is the optimal solution here?). Making sure that each power domain is within the thermal envelope.
- Workload generation (how to come up with workloads that induce pathological scenarios or even just representative regions)
- Identifying the power non-optimalities within the design is also slow. PowerPro can do this to a certain degree, but would be slow.

## Existing approaches
- RTL trace -> Power model (Strober)
    - Limitations is that once you change your RTL, you have to retrain the model.
    - There has been work that tried to address the above issue by performing power estimation hierarchically.
- GNN based approach : input to the model is the RTL graph and the workload. Limited by the layers of the GNN when the circuit gets too complex. This is because the RTL graph is more of a dataflow like structure and if the number of forwarding paths is larger than the number of layers, there is so much you can do.
- Joules : too slow.

## Magic box thinking
- Inputs  : RTL, workload (maybe some changes to your RTL)
- Outputs : Power traces
- Need to be able to make patches to the power traces given RTL changes without having to redo synthesis and gate level simulation.
- The simulation has to run very fast so that we can obtain traces of long running workloads.
- Using the Tidal sim flow...
    - The simulation time can be achieved by sampled simulation. We can inject the arch state into Joules and run gate level sim in parallel.
    - One thing is injecting state into a gate level netlist. This seems much more difficult than injecting state in RTL sim. You basically have to know which gate maps to which **bit** in your RTL. Hence, we need a API in the netlist that exposes a set of gates in their RTL level formin their RTL level form.
- The biggest problem here with the above approach is obtaining the netlist on RTL updates.
    - We need incremental synthesis for this.
    - Is there a workaround where we can elide the synthesis process completely?
    - If we want to perform fine-grained optimizations by inserting power gating circuits, synthesis would be a requirement. Cadence tools can simulate very detailed & nuanced tradeoffs of inserting power gate circuits.
    - What about when we just want to obtain coarse-grained power traces?
        - Would the RTL change even matter in this case?
        - Lets say that you changed your branch predictor so that you have 1% more IPC. In this case, the main power consumption difference would come from the branch predictor structure (number/size of SRAMs and how they are accessed) rather than how the branch predictor affects the core itself.
        - The above argument can be applied to cache structure changes as well.
        - The first thing to do would be to quantify the delta in the power traces from a golden model and check if actually is similar or not.

## Comments
- At the end of the day, the biggest problem seems to be that the compilation + simulation of these designs to obtain power numbers takes a long time.
- Strober for example, you have to recompile your bitstream whenever you change your RTL.

## Possible directions?
- NoC power modeling?
    - Doesn't consider wire length or the clock frequency. The clock frequency can obviously affect the power consumption. Only models the power consumed by the router nodes.
    - Constellation has a standalone NoC generator mode and they are feeding in traffic over DPI calls
    - I think one clean cut project would be to perform a tradeoff analysis of different NoC topologies by comming up with a model that can estimate the NoC power consumption. It will have to be able to take into account the wire length, topology, and clock frequency. It probably won't lead to any interesting insights though. The high level tradeoffs between NoC topologies are well understood.

## Prior work
- Krste's power aware ISA
    - Motivation was that the compiler isn't aware of the power consumption of each instruction.
    - Criticism is that within your system, most of the power is consumed by DRAM or caches. Furthermore, my gut feeling is that more performant code will results in less energy consumption (even though it might consume more power).

