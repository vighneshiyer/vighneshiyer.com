+++
title = "Post-Silicon Validation"
date = 2023-12-18
draft = true
slug = "post-silicon-validation"
+++

## Static DFT with ATPG

## Dynamic DFT

## BIST

## Validation Coverage

### State Vector Prediction

- Post-Silicon Validation Coverage
- We really don't need to predict the exact state vector, we just need to predict coverage as a function of state vector changes (can happen over a bunch of cycles)
    - We can't sample the entire state vector, and we also can't sample every cycle
    - We can validate this work using synthesizable Firesim covers and Firesim snapshotting for longer workloads (as the golden reference)
    - Ideally this can be used to guess coverage in silicon with minimal instrumentation and be able to correlate certain state vectors with certain silicon bugs

- [ ] Set up simple example circuit
    - Empty repo, chisel + Firrtl, one FIFO or several parallel shift registers. Elaborate. Use verif repo to generate stimulus and drive w/ VIPs
- [ ] Generate test data (design a stimgen)
- [ ] Extract control signals using FIRRTL pass
    - https://github.com/compsec-snu/difuzz-rtl/blob/sim/firrtl/src/main/scala/coverage/graphLedger.scala
    - State vector extraction - done by this difuzz pass which creates a register-register connection graph and figures out which ones are state regs
    - Control signal extraction - Kevin has a rfuzz pass that does this by naming the mux control signal and punching it out to the top (but I can just print the names out alternatively).
- [ ] Instrument control signals and state vector for simulation
- [ ] Set up an ML model to predict SV from signal traces
    - [ ] Parse the VCD to fetch all signal values at cycle granularity and match up with state vector on every cycle (can be embedded in the VCD)
    - [ ] Try a simple linear model at first to see the typical error and sources of error (assuming we can use every signal value)
    - [ ] Try pruning signal values based on some cone heuristic
- [ ] Set up riscv-mini example
    - riscv-mini as submodule, use FIRRTL pass to fetch control signals and instrument with a $display as the state vector.
- [ ] Use approximate counting to reduce size of uarch counters
    - See Jingyi's exploration

### Readings

- [ ] Papers to Read

> Keywords: observability rtl machine learning
> Look for partial DFT observability papers (the issue is that most of these only concern circuit function visibility, not full state visibility across time)
>
> See other papers in 30/31/verification/statevec_pred
> Lots of good stuff to review before trying anything myself

- See the SVDTC Whitepaper (https://docs.google.com/viewer?a=v&pid=sites&srcid=aWVlZS1jZWRhLmNvbXxzdmR0Y3xneDo1Njg4YTExNDcwNGZlN2E2) (https://sites.google.com/a/ieee-ceda.com/svdtc/)
- https://ieeexplore.ieee.org/abstract/document/528919?casa_token=lrR465oLPe8AAAAA:2Zj-q1V_pL_2F2ie5ZldDCL2K_cZ4SFHtHLc_wTEp3c94KrwKR3FNdZ7mf4vkrYVaNbZ5mjbkw
- https://ieeexplore.ieee.org/abstract/document/7059105?casa_token=lYopJAmqdnQAAAAA:v-HXAMEbnKNAS4jHxxdiq1ZCt8jXMBiematRmhT2fpVBbxI5hlQthGFtBycAdzpMXmShmB-aGA
- https://ieeexplore.ieee.org/abstract/document/6657069?casa_token=RzUjRx5HdLEAAAAA:9iM9EJaFA237MVpblGPIh3TvC17V9yEeXdBkSBPNxr3-mr7VWjlp0mVAxk3mls_hNtju0K3L8A
- https://link.springer.com/article/10.1007/s10836-018-5716-y
- https://ieeexplore.ieee.org/abstract/document/8240690?casa_token=pj50O_tBWsAAAAAA:28DSFXwEG979nu3miL8MCJ58DxqOA24je-mMOTbx9uX4xFTxmMhbdfHU5Oe47ViYC67F6UpA9w
- https://repositories.lib.utexas.edu/handle/2152/28391

- [ ] Look into opendcdiag
    - Rathish wants me to be able to look inside some internal intel stuff - internship
    - We will talk a bit about SDCs and https://github.com/opendcdiag/opendcdiag
