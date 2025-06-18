+++
title = "My Research Agenda Back in 2023"
date = 2023-10-01
draft = false
description = "For posterity's sake"
+++

I'm not so sure about these research directions in 2025, but I'll leave them here just to preserve what once was.
Don't take these notes too seriously.

## Fall 2023

### Dynamic Verification

- High-performance simulator-agnostic testbench APIs and a productive DV environment
    - Leverage eDSLs to embed testbench APIs in a productive general-purpose language (Scala)
    - Match or exceed the performance of SystemVerilog testbenches with low-level bindings to Verilator-based simulators and a monadic testbench API for efficient simulation threading
    - Deterministic simulation threading by detecting inter-thread dependencies and ensuring reproducible testbenches
    - Functional coverage and temporal sequence APIs using Chisel
- Automated and efficient coverage closure using parametric generators, stimulus embedding, and ML
    - Investigating techniques for predicting RTL-level coverage from stimulus / generator features
    - Evaluating graph-based coverage extrapolation for solving the 'missing data problem' associated with blackbox supervised learning approaches
    - Evaluating coverage model-guided bug hunting / state exploration techniques and constraint tuning approaches for targeting specific coverpoints (e.g. semantic fuzzing using constrained random)
    - Leveraging parametric stimulus generators for finely controllable stimulus generation

### Overall Agenda

<!--
- CS 294 -> semantic compression with application to NoCs -> ISCA 24
- CS 264 -> new HDL investigation / multi-abstraction / better graph IR -> rewriting of RTL / workshop paper
- SimCommand + High perf Sim APIs + other stuff -> ASPLOS 24
- Parametric Fuzzing + ML mutation -> Qual in November
    - rtl2graph + coverage extrapolation -> Qual
- Multi-level simulation -> MICRO/HPCA 24
- Hammer build flow / API redux -> DAC tool paper
- Formal power modeling -> Bump Animesh for publication

- Chris Batten's comments on a verification direction for the lab:
    - Make it easier to actually extract block level modules from a top without doing the whole elaboration (or mock the interfaces as they exist in the top, but this is hard)
        - Limitation of diplomacy,...
        - The complaint isn't really about unit testing - a real selling point would be a methodology to write block level tests and then have it applied with many types of testing strategies (random, fuzzing, unit, directed, property based, etc.)
    - Incentivize people to write tests not just by making it easy - but also making it the default to have statistics to measure how good you're doing - coverage dashboard, coverage in CI by default - people will look at this and then have another motivation to write tests (it is like gamification)
-->

- Continue to explore a new HDL with multi-abstraction support / better graph IR → evaluate by rewriting some RTL
- SimCommand / high-performance RTL simulation APIs
- Parametric fuzzing + ML mutation
    - rtl2graph + coverage extrapolation
- Multi-level simulation? Combine different simulators from different abstractions to produce a higher throughput simulator with enough performance estimation fidelity
- Improve the Hammer VLSI build flow / investigate redoing its API while preserving the TCL generators themselves
- Revisit using formal to generate comprehensive stimulus for power simulation and power macromodel training
- Making RTL verification viable and practical for the lab as a whole (some feedback from Prof. Chris Batten)
    - Make it easier to actually extract block level modules from a top without doing the whole elaboration (or mock the interfaces as they exist in the top, but it is hard to make this trivial, a limitation of diplomacy)
    - A selling point would be a methodology to write block level tests abstractly and then have them applied with many types of testing strategies (random, fuzzing, unit, directed, property based, etc.). This is ill-defined.
    - Incentivize people to write tests not just by making it easy, but also by making it the default to have statistics to measure how good you're doing. Coverage dashboard, coverage in CI by default. People will look at this and then have another motivation to write tests (i.e. gamification)

## Spring 2023

### High performance testbench APIs and a SystemVerilog/UVM parity DV environment

- Use a high-level general-purpose language (Scala) to describe testbench logic, VIPs, scoreboards, and constrained random stimulus generators. Prove that we don't need to be tied down to the crippled and poorly supported SystemVerilog language, and we don't have to sacrifice performance either.
- First-class support for polyglot testbenches (e.g. using Python libraries for linear algebra or ML, C/C++ for driver/kernel code for co-simulation) on a unified runtime (e.g. GraalVM)
- March towards feature parity with the industry standard toolchain (UVM + SystemVerilog + VCS/Xcelium): temporal property specification language and functional coverage APIs in Scala for Chisel
- Particular focus in Spring 2023
    - Extending our prior work in [SimCommand](https://github.com/vighneshiyer/simcommand) to improve the feature set and testbench performance, and make performance optimizations within chiseltest
    - Standardizing interfaces throughout Chisel RTL codebases to enable unified VIPs and test environments
    - Reviving cosimulation infrastructure for accelerators, such as Gemmini, to evaluate large workloads accurately without resorting to FPGA simulation

### Machine learning for coverage closure, bug hunting, constraint tuning, and regression suite construction + intelligent fuzzing

- Investigating techniques for predicting RTL-level coverage from stimulus / random generator features
- Evaluating different methods for solving the 'missing data problem' associated with blackbox supervised learning approaches
- Investigating the utility of fine-grained input features in predicting complex output features such as time-domain coverage metrics
- Evaluating coverage model-guided bug hunting / state exploration techniques and constraint tuning approaches for targeting specific coverpoints (e.g. semantic fuzzing using constrained random)

The first area is about demonstrating that verification can be more ergonomic and performant than the status quo. It is engineering focused, but still has many unanswered research questions.

The second area is research focused: we are working on techniques that may not pan out. ML has been very successful in continuous domain problems and learning fuzzy relationships, but not as successful in discrete domain problems with strict combinatorial relationships.
