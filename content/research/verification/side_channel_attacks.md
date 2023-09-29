# VLSI-Level (Pre-Silicon) Side Channel Attacks

## Use of simulators for side channel analysis (Veshchikov, 2016)
- Input: Compiled AVR binaries (elf), Output: evaluation of DPA resistance, leakage traces
- Uses SimulAVR (cycle accurate ISA simulator)
- reading/writing to SRAMs or regfiles causes recording of a leakage value
    - HW(value) for reading (hamming weight)
    - HD(value_old, value_new) for writing (hamming distance)
- Evaluation
    - DPA contest v4.1 (AES-RSM implementation in C and assembly, runs in constant time regardless of key value)
    - Noticed differences in register usage with different keys even with same runtime
        - Found specific instruction sequence responsible by diffing execution traces
    - Used difference of means attack to find MSB of key
- Conclusion
    - Exploited difference in number of register accesses in DPA v4.1 -> secure algorithm must be constant time AND constant flow
    - DPA v4.2 fixed this algorithm and the simulator no longer could perform a DoM attack
- *My analysis*
    - This is quite primitive; it is still not obvious if the DoM attack would be feasible on real hardware (you would have current resolution ~ 1uS rather than per-cycle)
    - We can replicate this environment with a more realistic system
        - use gem5's riscv isa frontend and a built-in power model
        - compile tinycrypt to riscv and run AES with a fixed key and varying ciphertext (fix one bit)
        - try to perform an attack like DoM to distinguish one bit of the ciphertext

## Verification of Power-Based Side-Channel Leakage through Simulation (Yao, 2020)
- Goal: test for presence of leakage from design files, modeling of leakage through simulation
- They make the point that low-level simulation (gate and transistor level) (glitching power, layout based power - cross coupling) can cause subtle information leakage that RTL-level sim can't capture
- Interesting graph on when a power correlation attack is viable at different abstraction levels including the real chip (TSMC 180nm processor + AES accelerator)
    - looks like transistor level is too detailed to the point where there are many false positives that are masked in the real chip
- Their clock frequency was much lower than the sampling scope (25 MHz vs 5 GHz) whereas in a modern chip they are of the same order (so glitching power matters a lot less)
- Overall
    - Interesting study, but old technology and overly detailed analysis means it cannot be extrapolated to a modern RTL design
    - Would be useful to replicate the RTL-level power analysis and compare to a real chip we have in the lab

## Towards Efficient and Automated Side Channel Evaluations at Design Time (Sijacic, 2018)
- The best written paper with good background information
- Measurements of leakage
    - Measurement to Disclosure (how many traces are required for an attack method to succeed at some task?)
    - Test Vector Leakage Assessment (generic method that only relies on statistical analysis of traces) (uses T-test, applied sample-wise)
        - this is used on specific samples within power traces (e.g. S-Box computations)
- Implementation
    - CASCADE (their tool) is similar to HAMMER (generates TCL for cad tools)
    - Perform logic simulation at RTL, generic gates, mapped gates, and PnR stages (uses DC for synth, Innovus for PnR)
        - Generic gate sim uses a generated delta delay SDF (delta = base_delay(1 + (F-1)theta), F = fanout, base_delay when fanout = 1, scaling factor in [0.05, 0.20]
        - Also generate a CCS-like model based on hamming distances (Marching-Sticks Model) to estimate power from generic gates (not using power tables in .lib)
        - Post-syn and pnr sim uses extracted SDFs with CCS models
    - Also perform timing annotated simulation (Primetime PX) and spice sim with HSPICE
    - Using freepdk45 with nangate stdcell set
- Evaluation was on a few circuits showing how TVLA with different simulation techniques leads to side channel leakage. There was an interesting final example where the gate-level netlist power sim didn't lead to an increasing tscore with more samples, while the PnR netlist did.
    - CASCADE should be open source, but no link posted in paper

## Architecture Correlation Analysis (ACA): Identifying the Source of Side-channel Leakage at Gate Level (Yao, 2020)
- Best paper of them all; tries to identify the leaking gate by comparing a specific gate's toggles against the toggles of a design-specific leakage model
- Useful insights from block-level analysis of an AES block and from analysis of a full SoC revealing unexpected correlated activity in various bus components
