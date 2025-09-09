#set document(author: "Vighnesh Iyer")

#set page(
  width: 8.5in,
  height: 11in,
  margin: (left: 1.25in, right: 1.25in, top: 0.75in, bottom: 0.75in),
)

#set text(font: "Source Serif 4", size: 10pt, lang: "en")
#set par(leading: 1em, justify: false)
#set strong(delta: 200)

#let dash = "–"
#let split = text(weight: 700)[|]
#let space = h(0.5em)
#let separator = [#space #split #space]

#show heading.where(level: 1): it => {
  v(1pt)
  text(weight: 600, size: 1.2em)[#it.body]
  v(1pt)
}

//#show link: it => text(fill: blue)[#it]

#show link: it => {
  it
  if type(it.dest) != label {
    sym.wj
    h(1.6pt)
    sym.wj
    super(box(height: 3.8pt, circle(radius: 1.2pt, stroke: 0.7pt + rgb("#993333"))))
  }
}

#let simple-entry(left, right) = {
  grid(
    columns: (0.5fr, 1fr),
    column-gutter: 1em,
    //text(size: 1em, weight: "regular", style: "italic")[#left],
    text(size: 1em)[#smallcaps[#left]],
    text(size: 1em)[#right]
  )
  v(0.5em)
}

#let experience-entry(place, title, start_date, end_date, loc, body) = {
  grid(
    columns: (1fr, 0.5fr),
    column-gutter: 1em,
    [
      #text(size: 1.2em, weight: 600)[#place]
      #linebreak()
      #text(size: 1em)[#smallcaps[#title]]
    ],
    [
      #align(right + horizon)[
        #text(style: "italic")[#start_date] #dash #text(style: "italic")[#end_date]
        #linebreak()
        #text(size: 0.8em)[#loc]
      ]
    ]
  )
  v(0.5em)
  body
  v(1.5em)
}

#let education-entry(place, title, extra, start_date, end_date) = {
  grid(
    columns: (1fr, 0.5fr),
    column-gutter: 1em,
    [
      #text(size: 1.2em, weight: 600)[#place]
      #linebreak()
      #text(size: 1em)[#smallcaps[#title]]
      #linebreak()
      #text(size: 1em)[#extra]
    ],
    [
      #align(right + horizon)[
        #text(style: "italic")[#start_date] #dash #text(style: "italic")[#end_date]
        #linebreak()
      ]
    ]
  )
  v(1.5em)
}

// https://www.youtube.com/watch?v=UP-S9rvAYYo
// Top third = snapshot of you (what type of job are you targeting?, why are you qualified?, no objective, tease the rest of the resume, objective replacement is an executive summary, include areas of expertise as bullets or points)
// for each job: paragraph for roles and responsibilities, then bullets for bragging points
// headers: 13-16 pt, body: 10-12 pt, at least 1/2in border
#align(center)[
  #text(size: 2.2em, weight: 600)[Vighnesh Iyer]

  _Website_: #link("https://vighneshiyer.com")[vighneshiyer.com]
  #separator
  _Github_: #link("https://github.com/vighneshiyer")[vighneshiyer]
  #separator
  #link("https://scholar.google.com/citations?user=0qawpQkAAAAJ&hl=en")[Google Scholar]
  #separator
  #link("https://www.linkedin.com/in/vighneshiyer/")[LinkedIn]

  vighnesh.iyer\@gmail.com
  #separator
  vighnesh.iyer\@berkeley.edu
]

= Overview

I am a graduating EECS PhD student from UC Berkeley, specializing in computer architecture.
I am a generalist with skills spanning hardware engineering (RTL design, verification, architecture, physical design, prototyping, PCB design, silicon bringup) and software engineering (functional programming, hardware modeling, firmware, Linux).
I am looking for opportunities to apply first-principles, full-stack engineering to greenfield custom silicon projects, but I am also capable of working with large, mature, hardware codebases.

= Skills

#simple-entry("RTL Design", "Chisel, SystemVerilog, RISC-V, Accelerator Design (ML arithmetic, GEMM, wide-datapaths, systolic arrays)")
#simple-entry("RTL Verification", "Verilator / VCS / Xcelium, UVM, cocotb, PyVerilator, SVA, Transaction-Level Modeling, Constrained Random, RISC-V Program Generators, Property-Based Testing")
#simple-entry("FPGA Engineering", "Xilinx 7-Series/UltraScale+ FPGAs, Xilinx GTH/GTY Transceivers, Multi-SLR Design, AWS F1, FPGA-based ASIC Prototyping, Vivado, AMBA / AXI-4, PCIe")
#simple-entry("ASIC Engineering", "Cadence VLSI Flow (Genus, Innovus), Power Modeling (Joules / Voltus), Floorplanning, STA (Tempus, PT)")
#simple-entry("SW Languages","Scala, Python, Rust, C / C++, Java, Shell, TCL, OCaml")

= Education

#education-entry(
  "UC Berkeley",
  [PhD EECS],

  [
    #link("https://adept.eecs.berkeley.edu/")[ADEPT] / #link("https://slice.eecs.berkeley.edu/")[SLICE] Lab
    #linebreak()
    #link("https://bwrc.berkeley.edu/")[Berkeley Wireless Research Center]
  ],
  "2018",
  "2025",
)
#education-entry(
  "UC Berkeley",
  "BS EECS",
  "",
  "2014",
  "2018",
)

= Experience

#experience-entry(
  "Taalas",
  "Hardware Engineer (Contract)",
  "June 2025",
  "August 2025",
  "Remote",
  [
    - RTL design (SystemVerilog), verification (Verilator + Python), and architectural modeling for a dedicated #link("https://taalas.com/")[LLM inference ASIC]
  ],
)

#experience-entry(
  "Google",
  "Student Researcher",
  "May 2024",
  "November 2024",
  "Sunnyvale, CA",
  [
    - Trace-driven sampled simulation for multi-threaded workloads
    - Trace analysis and scheduling toolkit for trace embedding of DynamoRIO traces and Berkeley (FireSim, RTL simulation, spike) traces
  ]
)

#experience-entry(
  "Jane Street",
  "FPGA Engineering Intern",
  "May 2023",
  "August 2023",
  "New York City, NY",
  [
    - FPGA infrastructure work
  ]
)

#experience-entry(
  "UC Berkeley",
  "Graduate Student Researcher",
  "August 2023",
  "May 2025",
  "Berkeley, CA",
  [
    - High throughput, low latency, high accuracy microarchitecure simulation.
      - Combine functional (ISA-level), uArch trace-driven models, and RTL simulation to exploit the best traits of each simulation methodology
      - Demonstrate that ``multi-level simulation'' enables fast microarchitecture iteration cycles with evaluation on realistic workloads
      - #link("https://github.com/euphoric-hardware/tidalsim")[Github: TidalSim]
    - Applying software parametric fuzzing techniques to RTL verification.
      - Development of a parametric stimulus generator for RISC-V programs that also emits instrumentation to identify the influence of each byte of the parametric bytestream that serves as generator input
      - Leverage bytestream instrumentation to perform guided mutation
      - Applying hardware fuzzing to stimulus generation for microarchitectural metric targeting
    - Methodologies for RTL coverpoint / bug synthesis using specification mining infrastructure.
      - Break the limitations of using open-source RTL for verification research by synthesizing microarchitecturally-interesting temporal properties
      - Demonstrate the usage of synthesized properties to evaluate different dynamic verification techniques
    - Applying machine learning to RTL-level dynamic verification.
      - Investigating coverage extrapolation via GNNs to overcome the limitations of supervised learning for coverage prediction
      - Leveraging generator instrumentation for stimulus embedding
    - Leveraging RTL-level formal-driven trace generation for power macromodel construction.
      - Mitigate the issue of low training dataset diversity by using formal tools to generate short and diverse traces that cover microarchitecturally-relevant (and power-relevant) design states and trajectories
  ]
)

#experience-entry(
  "UC Berkeley",
  "Graduate Student Researcher",
  "August 2018",
  "May 2023",
  "Berkeley, CA",
  [
    - Worked on a functional API for random stimulus generation that decouples the description of constraints from the interpreter that generates legal stimulus. In doing so, we enable automatic extraction of the randomization graph for stimulus embedding and coverage for the generator itself as well as the generated stimulus.
    - Worked on a monadic simulation API for high-performance testbench fork/join threading.
    - Worked on power modeling techniques that use selective signal sampling and event traces to estimate energy. Leveraged formal methods for trace generation for power model training.
    - Worked on verification libraries for Chisel circuits with 2 MS students to create an API for constrained random stimulus generation, assertion based verification, transaction-level testing with VIPs, and cosimulation coupling a functional simulator with the RTL simulation of an accelerator written in Chisel
    - Investigated the usage of specification mining for RTL bug localization by mining LTL properties from simulation waveforms and checking properties on failing simulations
    - Worked on a systolic array based, dataflow configurable, GEMM accelerator generator (Gemmini) tightly coupled to a RISC-V core, designed for ML inference workloads
    - Worked on the physical design and verification of a multicore RISC-V chip taped out in TSMC16
    - TA'ing EECS 151/251A (Digital Design and ICs); led students through FPGA labs and the design of a pipelined RISC-V processor; teach discussion sections
  ]
)

#experience-entry(
  "Apple",
  "CPU Verification Intern",
  "May 2021",
  "August 2021",
  "Cupertino, CA",
  [
    - Investigated the usage of machine learning to guide random stimulus generation for coverage targetting
    - Designed a framework to evaluate various predictive models from data collected during stimulus generation to impact in RTL simulation
  ]
)

#experience-entry(
  "NVIDIA",
  "Research Intern (ASIC and VLSI Research Group)",
  "May 2020",
  "August 2020",
  "Remote",
  [
    - Developed models to predict RTL-level structural coverage from functional simulation features with the intention to accelerate coverage closure and guide stimulus generation
  ]
)

#experience-entry(
  "NVIDIA",
  "Research Intern (ASIC and VLSI Research Group)",
  "Jan 2018",
  "August 2018",
  "Santa Clara, CA",
  [
    - Emulated a ML inference accelerator testchip with a RISC-V controller on a VCU118 board; found bugs and workarounds pre and post silicon
    - Developed a Microzed-based stimulus board for driving a testchip during radiation beamtesting
    - Developed an FPGA-accelerated deterministic fault injection framework for simulating transient fault effects in single-clock RTL
  ]
)

// Brought up and calibrated SERDES links designed to drive memory traffic between an ASIC and FPGA
// Created a comprehensive UVM testbench to verify an NVM IP controller's functionality prior to tapeout
// Designed and implemented a pipelined RISC-V processor on a Xilinx Virtex-5 FPGA; wrote a DDR DRAM controller, and developed graphics accelerators
#experience-entry(
  "Berkeley Wireless Research Center",
  "Undergraduate Researcher",
  "Jan 2017",
  "Jan 2018",
  "Berkeley, CA",
  [
    - Developed FPGA RTL and simulation framework to interface between an ASIC and a host machine.
    - Debugged and tested SERDES links connecting a RISC-V core's memory backend to an FPGA's DDR backing store.
  ]
)

#experience-entry(
  "Analog Devices",
  "Digital Verification Intern",
  "June 2016",
  "August 2016",
  "San Jose, CA",
  [
    - Developed a UVM testbench using SystemVerilog from scratch to stress test a NVM controller to be integrated into the digital portion of a mixed-signal chip
    - Designed 2 verification IP blocks to be used in block-level and system/chip-level testbenches
    - Wrote suite of coverpoints and ran simulations to find bugs and achieve full coverage on basic NVM operations
  ]
)

#experience-entry(
  "UC Berkeley",
  "TA for EECS 151 (Digital Design and Circuits)",
  "Jan 2016",
  "Dec 2017",
  "Berkeley, CA",
  [
    - Designed six FPGA labs to introduce students to fundamental concepts of digital design encompassing FSMs, serial I/O, and chip-to-chip communication
    - Expanded the class FPGA project consisting of a RISC-V core to include AC97 audio and DVI link video components
  ]
)

#experience-entry(
  "Guidewire Software",
  "Software Engineering Intern",
  "June 2015",
  "May 2016",
  "Foster City, CA",
  [
    - Developed a SPA using AngularJS on the front end and Spring + Jersey on the backend, that enabled users to perform administrative tasks; deployed to internal admins and Guidewire customers
    - Wrote comprehensive unit and integration tests using Protractor and Karma/Jasmine; standardized CSS across all admin apps
  ]
)

#experience-entry(
  "Zurich North America",
  "iOS/Web Application Developer",
  "June 2014",
  "April 2015",
  "Los Angeles, CA",
  [
    - Created an iOS mobile app and REST API service to disseminate information regarding Zurich’s IT Security Standards throughout the entire organization
    - Deployed the mobile app to hundreds of IT architects throughout the enterprise
    - Created a SPA and API for the internal distribution of security research
  ]
)

= Research Interests

//#entry("Design", "Domain-specific accelerators")
#simple-entry("Design Methodology", "DSLs for hardware design, hardware-specific IRs, architectural description languages")
#simple-entry("Simulation", "Microarchitecture simulation and modeling, sampled simulation, FPGA-accelerated emulation")
#simple-entry("Verification", "RTL verification and debugging methodologies / tools, stimulus generation techniques, specification mining, machine learning for DV, RTL fuzzing")
#simple-entry("CAD", "FPGA-accelerated RTL-level power/performance estimation, RTL power modeling")

= Publications

+ #link("https://dl.acm.org/citation.cfm?id=3361202")[RTL Bug Localization Through LTL Specification Mining]. _Proceedings of the 17th ACM-IEEE International Conference on Formal Methods and Models for System Design._ No. 5, 2019. *Vighnesh Iyer*, Donggyu Kim, Borivoje Nikolic, Sanjit A. Seshia
+ #link("https://ieeexplore.ieee.org/document/9241430")[A Dual-Core RISC-V Vector Processor With On-Chip Fine-Grain Power Management in 28-nm FD-SOI]. _IEEE Transactions on Very Large Scale Integration (VLSI) Systems_ Volume: 28, Issue: 12, Dec. 2020. John Wright, Colin Schmidt, Ben Keller, Daniel Palmer Dabbelt, Jaehwa Kwak, *Vighnesh Iyer*, Nandish Metha, Pi-Feng Chiu, Stevo Bailey, Krste Asanovic, Borivoje Nikolic
+ #link("https://people.eecs.berkeley.edu/~ysshao/assets/papers/genc2021-dac.pdf")[Gemmini: Enabling Systematic Deep-Learning Architecture Evaluation via Full-Stack Integration]. _DAC 2021_. Hasan Genc, Seah Kim, Alon Amid, Ameer Haj-Ali, *Vighnesh Iyer*, Pranav Prakash, Jerry Zhao, Daniel Grubb, Harrison Liew, Howard Mao, Albert Ou, Colin Schmidt, Samuel Steffl, John Wright, Ion Stoica, Jonathan Ragan-Kelley, Krste Asanovic, Borivoje Nikolic, Yakun Sophia Shao
+ #link("https://oscar-workshop.github.io/files/SimCommand_A_High_Performance_RTL_Testbench_API-OSCAR22.pdf")[SimCommand: A High-Performance RTL Testbench API]. _Open-Source Computer Architecture Research (OSCAR) Workshop at ISCA 2022_. *Vighnesh Iyer*, Kevin Laeufer, Koushik Sen, Borivoje Nikolic
+ #link("https://dl.acm.org/doi/10.1145/3582016.3582019")[Simulator Independent Coverage for RTL Hardware Languages]. _ASPLOS 2023_. Kevin Laeufer, *Vighnesh Iyer*, David Biancolin, Jonathan Bachrach, Borivoje Nikolic, Koushik Sen
+ #link("https://pldi23.sigplan.org/details/plarch-2023-papers/16/Mixed-Abstraction-HDLs-and-A-Discussion-on-Other-Aspects-of-HDL-Design")[Mixed-Abstraction HDLs and A Discussion on Other Aspects of HDL Design]. _Programming Languages for Architecture (PLARCH) Workshop at ISCA 2023_. *Vighnesh Iyer*, Borivoje Nikolic
+ #link("https://pldi23.sigplan.org/details/plarch-2023-papers/15/New-Embedded-DSLs-for-Hardware-Design-and-Verification")[New Embedded DSLs for Hardware Design and Verification]. _Programming Languages for Architecture (PLARCH) Workshop at ISCA 2023_. *Vighnesh Iyer*, Kevin Laeufer, Young-Jin Park, Rohit Agarwal, Lixiang Yin, Bryan Ngo, Oliver Yu, Koushik Sen, Borivoje Nikolic
+ #link("https://dl.acm.org/doi/abs/10.1145/3620666.3651346")[RTL-Repair: Fast Symbolic Repair of Hardware Design Code]. _ASPLOS 2024_. Kevin Laeufer, Brandon Fajardo, Abhik Ahuja, *Vighnesh Iyer*, Borivoje Nikolić, Koushik Sen
+ #link("https://dl.acm.org/doi/abs/10.1145/3658617.3697760")[DEMOTIC: A differentiable sampler for multi-level digital circuits]. _ASPDAC 2025_. Arash Ardakani, Minwoo Kang, Kevin He, Qijing Huang, *Vighnesh Iyer*, Suhong Moon, John Wawrzynek
+ #link("https://ieeexplore.ieee.org/abstract/document/11075163/")[MAVERIC: A 16nm 72 FPS, 10 mJ/Frame Heterogeneous Robotics SoC with 4 Cores and 13 INT8/FP32 Accelerators]. _VLSI 2025_. Seah Kim, Jerry Zhao, Roger Hsiao, Yufeng Chi, *Vighnesh Iyer*, Vikram Jain, Borivoje Nikolić, Yakun Sophia Shao

= Coursework

- CS 61A/B/C (Data Structures, Computer Architecture)
- CS 152 (Computer Architecture and Engineering)
- CS 162 (Operating Systems and Systems Programming)
- CS 188 (AI)
- CS 294 (Recent Topics on Program Synthesis, Compilation, and Debugging)
- CS 294 (Architectures and Systems for Warehouse-Scale Computers)
- EE 16A/B (Designing Information Devices and Systems)
- EE 105 (Microelectronic Devices and Circuits)
- EE 120 (Signals and Systems)
- EE 123 (DSP)
- EE 128 (Feedback Control Systems)
- EE 140 (Analog ICs)
- EE 142 (RF Circuits)
- EE 219C (Formal Methods)
- EE 227 (Convex Optimization)
- EE 240C (VLSI Analog-Digital Interface ICs)
- EE 241B (Advanced Digital ICs)
- EE 290C (DSP Circuits)
- EE 290 (Hardware for Machine Learning)
- EECS 149 (Embedded Systems)
- EECS 151 (Digital Design, Digital ICs)
- Math 53/54 (Multivariable Calculus, Linear Algebra, Differential Equations)
- Math 128A (Numerical Analysis)
- Math 221 (Advanced Matrix Computations)
- Stat 133 (Concepts in Computing with Data)
- Stat 134 (Concepts of Probability)
- Stat 135 (Concepts of Statistics)
- Stat 150 (Stochastic Processes)

= Awards

- _2018_ - Outstanding Graduate Student Instructor Award (UC Berkeley)
- _2024_ - Demetri Angelakos Memorial Achievement Award (UC Berkeley)
