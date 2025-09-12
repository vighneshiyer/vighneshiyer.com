+++
title = "59th Design Automation Conference (DAC 2022)"
date = 2022-08-20
aliases = ["conference_reviews/dac-2022"]
description = "Random workshops and papers, exhibition floor, Siemens PowerPro vs Cadence Joules, XLS, ML for verification, FOSS VLSI EDA, mflowgen and Hammer, analog layout automation"
+++

This was my first DAC at Moscone West.
It was a good experience — lots of vendors at the exhibition halls to talk to, several decent research paper sessions (but relatively poor engineering track sessions), and interesting panels (where every panelist brought a short set of slides to discuss their perspective on the question posed).

{{ gallery(images=[
    "10-registration.jpg",
    "kaufman_award.jpg",
], popout=true) }}

## Random Workshops

On Sunday (7/10/2022), I attended some workshops hoping they would be interesting.

### Autonomous Systems

I attended the [Workshop on Design Automation for the Certification of Autonomous Systems (DAC-AS)](https://sites.google.com/view/dac-as2022/home?authuser=0).
Most of the talks were not interesting or too topic specific.

One talk, _"Runtime monitoring for safe robot autonomy"_ by Macro Pavone of Stanford seemed cool.
He covered some prior work on runtime monitoring of neural networks to identify out-of-range inputs and his proposal outperforms basic techniques like activation range checks.
See his paper: _[Sketching curvature for efficient out-of-distribution detection for deep neural networks](https://proceedings.mlr.press/v161/sharma21a.html)_ ([Github repo](https://github.com/StanfordASL/SCOD)).

> This repository provides a framework for wrapping a pre-trained neural network with uncertainty estimates.
> It is designed to work with any pytorch model.
> We implement several such wrappers in a general framework.
> Given a pretrained DNN model `torch.nn.Module`, the distribution that the network parameterizes `dist_fam : nn_ood.distributions.DistFam`, and a PyTorch dataset containing the training data `dataset : torch.utils.data.Dataset`, we can construct a uncertainty-equipped version of the network.

### CAD for Neural Networks

I then stepped over to the [3rd ROAD4NN Workshop: Research Open Automatic Design for Neural Networks](https://sites.google.com/view/road4nn).
I just peeked this session for a few minutes.
It was mostly exotic domain-specific NN implementations (e.g. diffractive optic based neural networks), HLS frameworks, DNN graph to FPGA compilers, and the like.
Nothing too interesting.

### CAD for Cyber-Physical Systems

We walked to the [The Fifth International Workshop on Design Automation for Cyber-Physical Systems (DACPS)](https://59dac.conference-program.com/presentation/?id=WKSHP101&sess=sess190).
Yet again, nothing interesting, with most examples of 'verifiable' ML being too simplistic and even still required complex formal modeling.
There was one talk by Yasser Shoukry on _"Formal Verification of End-to-End Deep Reinforcement Learning"_ ([old slides](https://www.ls.cs.cmu.edu/CPSVVIF-2019/slides/slides_19_Shoukry.pdf)).

### CAD for HW Security

Finally, I went to the [CAD for Hardware Security Workshop (CAD4Sec)](http://cad4security.org/index.php/workshop/cad4sec-workshop-2022/program/).
This was by far the most interesting workshop of the day: "security" mostly means checking various safety properties, so it can be thought of as the "CAD for verification" workshop (practically speaking).
There was some work on logic locking and obfuscation, as usual.

#### Fault Injection

There was a talk from Nicole Fern of Riscure on _"Hardware Shift-Left: Pre-silicon Fault Injection Evaluation and Power Side Channel Testing"_.
They have build a tool for netlist fault injection (similar to [Synopsys Z01X](https://www.synopsys.com/verification/simulation/z01x-functional-safety.html)) and FIT analysis, and have done some hardware validation with EMFI (electromagnetic fault injection) on a Cortex-M0 devboard.
They've also looked at power side channel identification (gate-level power traces → CPA/TVLA (correlation power attack / test vector leakage assessment)) and constrained synthesis with dummies to mitigate these attacks.
<!--- Looks mostly like a security consulting firm-->

{{ gallery(images=[
    "10-riscure1.png",
    "10-riscure2.png",
    "10-riscure3.png",
    "10-riscure4.png"
], num_cols=4, popout=true) }}

#### JasperGold

There was a Cadence formal verification presentation, which was just a sales pitch for JasperGold.
"Use formal! And mitigate these security concerns!"

> - State Machine Deadlock -> Denial of Service
> - Buffer Overflow -> Data Corruption, Unexpected Control Flow
> - Incorrect Register Access -> Secure Data Leakage or Corruption
> - Unexpected X-propagation -> Data Corruption, Unexpected Control Flow
> - Bus Protocol Violation -> Data Corruption
> - Improper ECO Implementation -> Vulnerability Insertion

JasperGold has many 'apps' including FPV (formal property verification) for regular BMC / k-induction, linting, and "security path verification" (which does some kind of information flow tracking).
FV can be better than DV for catching these bugs since it is counter-example oriented, makes negative testing easy, can model taint propagation, and has semi-formal support for using DV to seed uArch state.

#### Crypto Asset Tracking

Jason Oberg of Cycuity presented his _"Radix"_ tool for crypto asset tracking.
This guy and his OpenTitan partner, Andres Meza, also presented at ISCA ([OSCAR workshop](https://oscar-workshop.github.io/Home_2022.html)) this year — they are very secretive, their slides are not published.

They have built a tool that can do information flow tracking at RTL runtime and detect secret asset leakage.
See their blog post: [Security Verification of an Open Source Hardware Root of Trust](https://cycuity.com/type/blog/security-verification-of-an-open-source-hardware-root-of-trust/).

> A critical component of the security verification process is security analysis.
> This is crucial to ensure that the security requirements are concisely specified, as well as to assist in identifying unknown design weaknesses.
> By using Radix’s security analysis capabilities, we were able to validate that the random constant key never makes it to the output of the OTP controller in an unscrambled form, which is a good thing.

{{ image(path="10-radix.png", class="inset") }}

> While applying Radix to the OTP controller, we also identified intermediate values of the random constant key appearing on the output of the scrambler. This is interesting and surprising, but was determined to be a low risk since the intermediate values are protected at the boundary of the OTP output. Even so, this information enabled OpenTitan to push a fix mitigating this leakage out of an abundance of caution to potential future threats.

His article ["CAD for Hardware Security-Automation is Key to Adoption of Solutions"](https://scholar.google.com/citations?view_op=view_citation&hl=en&user=FNQjt4oAAAAJ&sortby=pubdate&citation_for_view=FNQjt4oAAAAJ:j3f4tGmQtD8C)) goes into detail about the tool inputs and what it can do.

- Mark a secret asset in RTL + when it becomes active / inactive
- Add input pin assumptions to the top-level DUT to define the bus interface timings and restrictions
- Specify the hierarchy boundary outside which the secret asset must not flow
- The tool will use formal symbolic execution to determine if there is a way the secret asset (even partially / influentially) can leak past the boundary

## Analyst Presentation

Charles Shi of Needham presented his financial analyst view on the state of the semiconductor industry and the financial future of EDA companies ([EDA to Power Through Semiconductor Cycles](https://59dac.conference-program.com/session/?sess=sess270)).

_His perspective_: there will soon be a glut of semiconductors and foundries/systems vendors will suffer revenue loss, but EDA companies seem better positioned to weather the upcoming down cycle in semiconductors.

> Historically the semiconductor industry goes through a boom-bust cycle every 3-4 years. Despite the chip shortage headlines, Wall Street is increasingly skeptical about the longevity of the current semiconductor boom cycle. The outlook is still bright, but there are dark clouds on the horizon. If the chip shortage turns into a glut, will a downturn affect the EDA industry? Our answer is no. In this presentation, I will walk you through reasons why EDA industry will power through semiconductor cycles and emerge on the other side stronger.

{{ gallery(images=[
    "10-needham_ecosystem.jpg",
    "10-needham_trends.jpg",
    "10-needham_final.jpg",
    "10-needham_summary.jpg",
], popout=true, num_cols=4) }}

And now onto the official start of the conference on Monday 7/11/22!

## Monday Keynote

The title of the keynote was _"Advancing EDA Through the Power of AI and High-performance Computing"_ presented by Mark Papermaster of AMD.
It was probably the worst keynote I've ever seen, composed entirely of marketing drivel.

## Siemens PowerPro

We made our way onto the exhibition floor and stopped by the Siemens booth.
Siemens had a presentation on PowerPro for about 30 minutes (the slides are below).

PowerPro is designed for early stage RTL-level power estimates, especially for power driven feedback into the RTL design process (e.g. for adding logic gating, zero skipping, and analyzing inferable clock gates).

{{ gallery(images=[
    "11-powerpro1.jpg",
    "11-powerpro2.jpg",
    "11-powerpro3.jpg",
    "11-powerpro4.jpg",
    "11-powerpro5.jpg",
    "11-powerpro6.jpg",
    "11-powerpro7.jpg",
    "11-powerpro8.jpg",
    "11-powerpro9.jpg",
    "11-powerpro10.jpg",
    "11-powerpro11.jpg",
], num_cols=4, popout=true) }}

We talked to the reps afterwards and found out:

- They have an educational license now - so we should be able to play with PowerPro
- They do a few static RTL checks (make sure that every large register assignment block has a enable for automatic CG insertion later)
- They do a 'quick synthesis' which uses the PDK .libs and does a generic gate mapping followed by a tech specific binding - they can use the .spef from an older full synthesis of the same block for parasitic estimation when making RTL changes
- You can dump state from Veloce, reconstruct the GL waveform offline, and feed that data into PowerPro's RTL power model in a streaming fashion (constant memory requirements)
- They claim that their fast synthesis takes into account details like logic minimization, CG insertion, multi-Vt, sizing, clock tree, but it is hard to believe

## Joules Discussion with Cadence Engineers

After this talk, we made our way over to the Cadence booth.
The Cadence booth people were very nice and accommodated an admittedly ridiculous request from us lowly grad students to talk to a Joules AE to ask some questions about their tool.

They went even further than that though and actually let us meet 1:1 with two of the original Joules developers who were very open and spent 20 minutes with us.
The discussion was quite long winded, so open the notes below if you're really interested in the details.

<details>
<summary role="button" class="secondary">Discussion about the capabilities of Joules and comparison with PowerPro</summary>

- Window size can be arbitrary and *so can frame count* - number of frames is just an attribute - it can be set to any value before running analysis
    - Daniel: doesn't seem that way in the documentation - frame count is specified as max 1000
    - Cadence: there is a way to do this, all of our customers use it to get arbitrary length cycle-by-cycle power traces
    - Later: we found out that there is indeed a secret batch flow that isn't described in any of Cadence's documents but was sent to us by an AE
- Only Joules has a full featured synthesis flow baked in (all analysis is done at post-synthesis gate-level)
    - Genus is invoked: multi-Vt, logic rewriting / reduction, timing-aware synthesis, circuit selection, retiming, clock gate insertion, etc. are all captured
    - Genus is run with the default settings, *except* optimization of the most critical timing paths (this is what accounts for most of the full Genus synthesis time supposedly). All synthesis optimizations are performed as usual in the default Joules flow.
- Joules has a "what-if" mode + clock gating suggestions
    - Unlike other tools, Joules actually synthesizes the proposed enable logic for a clock gate and determines if the power saved by gating actually exceeds the power drawn by the gating logic - they can also capture gating logic reuse and evaluate the need for logic duplication
    - They claim PowerPro often suggests gating logic that actually increases power on net - only caught after PnR power sims are performed and ends up wasting design time
- Joules can take RTL waveforms and can rapidly replay them on GL netlists internally (no external GL sim tool required - we already knew this)
- Joules has a fully-featured timer, unlike PowerPro
    - The timer considers clock constraints and performs timing-driven synthesis as usual
    - This means if clock constraints are updated, the underlying synthesized netlist will reflect that (more LVT/ULVT cell usage)
        - Supposedly PowerPro will give garbage power numbers if the clock constraints are updated since it uses an old GL netlist as the starting point and never re-performs synthesis
    - This also means that the power numbers from Joules are meaningful since they account for the actual clock period achievable - Joules' estimate will be much closer than PowerPro which just assumes you're running at the clock frequency specified in the constraints
- PowerPro comparison (they were a little agitated about the claims the PowerPro people make and seem to understand what PowerPro actually does behind the scenes)
    - PowerPro: expects a GL netlist as the 'training' data from the get-go - I'm not sure about this
    - 3% power error from post-GL power sim to signoff isn't reasonable (only for average power maybe), peak and per-cycle will be very wrong (according to the Joules guys)
    - The way PowerPro and PowerArtist work is completely different from Joules
        - Joules: use Genus engine to perform quick synthesis -> actual mapped GL netlist -> accurate cap estimate (using CCS cap model) -> power estimate
        - PowerPro: map RTL to generic gates -> map generic gates to PDK -> sprinkle estimates about multi-Vt usage, CG insertion, sizing -> use NLDM model from .lib -> power estimate
    - Joules will take longer than PowerPro, but it comes with much more accuracy - there is no synthesis 'estimation' - it is actually performing synthesis
    - PowerPro uses statistical switching factor models to compute toggle rates at combinational nodes from register toggle rates - Joules performs actually trace-level analysis at sub-cycle-level granularity
- Cadence admits that HW DSE isn't something that Joules is suitable for
    - Incremental synthesis within Joules is still not a feature (but will be soon when it lands in Genus) - they synthesize from scratch every time since accurate power recommendations are required
    - They talked about a one-off customer design they worked on to build a power model that was parameterized on a bus width but this is not some generic functionality
    - In general, tools like Joules are too slow for HW DSE - customers usually build architectural models (based on (linear) regression against Joules golden power numbers) that use Joules to get subsystem-level power (manually parameterized) that are used for this purpose during architectural exploration
</details>

## Verification Session

We walked into an Engineering Track session titled _"Taming the Validation Dragon with Formal and Static Verification"_.
All the DAC sessions have these silly titles.

- The presentations were:
    - Novel Approach to Early detection of Metastability related issues
    - Verifying Register Maps with JasperGold: How Formal compares to UVM
    - Efficient Functional Sign off by Automatic Assertion Generation for RTL Building Blocks
    - RDC(Reset Domain Crossing) Sign-off Methodology on Designs with Complex Reset Structures
    - Formal verification contract based micro architectural analysis of Server SoC's
    - A Novel Analog Centric Automated Verification Methodology Driven by State Diagram Approach

I *thought* these were going to be interesting, but they all ended up being some verbose description of a commercial tool capability, and a vague recitation of the results the commercial engineers achieved.
There is very little research applicability.

## Another Verification Session

I went to another Engineering Track session titled _"Automating the Front End and Facing the Big Picture_".
There were a few interesting presentations here.

### ML Based Abnormal Simulation Detector in SoC Verification (Samsung)

{{ image(path="11-abnormal_sim_predictor.jpg", class="inset") }}

At first, I thought this was going to be a predictor based on test generator parameters or runtime test behavior.
Instead, they describe an "ML approach" to detect tests that execute too long and will eventually time out and terminate them early to save compute and debug overhead.
They didn't give any details about what model they used, or even the input features they selected.

<!--
- Questions:
    - Did they compare against hardcoded time limits?
    - Did they consider coverage improvement or other metrics to decide if a test is hung?
-->

### Automatic Debug Knowledge Sharing Platform in SoC Verification (Samsung)

If you encounter an error message, they use a BERT language model to search a database of errors that have been seen in the past and find a 'similar' error using some similarity metric.
This is intended to help engineers find error message histories and debug guides in a very complex codebase.
The model is trained on a manually classified error database and from text in each error's debug guide.

Obviously this only makes sense if you've collected and curated a bunch of this type of data — only applicable to industry.

{{ gallery(images=[
    "11-debug1.jpg",
    "11-debug2.jpg",
    "11-debug3.jpg",
], popout=true) }}

### SMART Adaptive Regression Using Nearest Neighbors Algorithm

This was the only good presentation of the day.

The idea is to embed each test with the coverage it achieves on every functional unit of your design.
Then when you check in an RTL change, look for the functional unit that was touched, and then find the closest tests to that functional unit and only run those for qualification.

<!--
- Questions:
    - How do you validate the embedding of a test?
    - What is the dimensionality of each test embedding in practice?
-->

{{ gallery(images=[
    "11-smart1.jpg",
    "11-smart2.jpg",
    "11-smart3.jpg",
    "11-smart4.jpg",
    "11-smart5.jpg",
    "11-smart6.jpg",
    "11-smart7.jpg",
    "11-smart8.jpg",
    "11-smart_poster.jpg",
], num_cols=3, popout=true) }}

## The Cooley Panel

We attended [John Cooley's DAC Panel](https://59dac.conference-program.com/session/?sess=sess296).

> Abstract: Come watch the EDA troublemakers answer the edgy, user-submitted questions about this year's most controversial issues! It's an old-style open Q&A from the days before corporate marketing took over every aspect of EDA company images.

{{ image(path="11-cooley.jpg", class="content") }}

This is a DAC tradition from John Cooley of [deepchip.com](https://deepchip.com/) where he assembles a panel of EDA bigwigs, throws random and offensive questions at them, and tries to get them to fight each other.

The only thing I learned is that it's impossible to get any clear answers about what any EDA tool actually does.

## Updates from NVIDIA

I talked to some engineers from NVIDIA ASIC & VLSI Research and discussed what they were working on, had recently published, and ideas for future research.

- GPU-acclerated GL simulation using VCD replay with SDFs: [GATSPI: GPU Accelerated Gate-Level Simulation for Power Improvement](https://research.nvidia.com/publication/2022-03_gatspi-gpu-accelerated-gate-level-simulation-power-improvement)
    - Proposed as an ICCAD contest topic in 2019, published in DAC this year (detailed notes later)
- Large batch size RTL simulation on GPUs: [RTLflow](https://github.com/dian-lun-lin/RTLflow)
    - For large batch sizes of 1000s of concurrent simulations, RTLflow is ~1000x faster than Verilator
    - Ideal for fuzzing multiple DUT instances in parallel using only one GPU vs hundreds of CPU cores
    - [Opportunities for RTL and Gate Level Simulation using GPUs](https://research.nvidia.com/publication/2020-11_opportunities-rtl-and-gate-level-simulation-using-gpus)

> RTLflow is a GPU acceleration flow for RTL simulation with batch stimulus. RTLflow first transpiles RTL into CUDA kernels that each simulate a partition of the RTL simultaneously across multiple stimulus. It also leverages CUDA Graph for efficient runtime execution. We build RTLflow atop Verilator to inherit its existing optimization facilities, such as variable reduction and partitioning algorithms, that have been rigorously tested for over 25 years in the Verilator community.

- They have a dedicated ML for EDA now with 6 people and growing fast to over 10 this year
    - This is going to become a thing for all semi research houses soon
- Ongoing work on using Intel PIN to instrument an architectural simulator (SystemC), capture dynamic dataflow graphs of execution (as CDFGs), perform some kind of graph embedding, and eventually target RTL coverage prediction
- Report from the DV people: we don't really care about coverage closure, we always get it done eventually. However, the *RTL bug localization problem* is still the biggest bottleneck in verification throughput. Fix that!

## ML for Synthesis Session

I attended a Research Track session titled _"Machine Learning for Synthesis and Synthesis for Machine Learning"_.

### High-Level Synthesis Performance Prediction using GNNs: Benchmarking, Modeling, and Advancing


{{ gallery(images=[
    "12-hls_gnn1.png",
    "12-hls_gnn2.png",
    "12-hls_gnn3.png",
], popout=true) }}

- Here is the [paper PDF](https://arxiv.org/pdf/2201.06848.pdf)
- Represent SystemC programs as CDFGs with each node annotated with its function (read/write/compute operation)
- Use GNN architectures to perform either:
    - Node classification: where each node is marked as using LUTs, DSPs, or FFs
    - Graph regression: where the graph is reduced to predict the total number of LUTs/DSPs/FFs and the critical path latency
- Results
    - About 7% critical path MAPE (surprisingly good, but knowing the predicted CP is more important than just having the number in hand)
    - About 12-25% resource utilization MAPE (FF/LUT errors are larger than DSP estimates)
    - Node classification accuracy fares poorly IMO (70% accuracy on synthetic HLS programs, 90% on real ones for FF prediction) - Why? Isn't FF prediction almost certain from static analysis?
- A good overview on SOTA GNN architectures used for program analysis (including proper handling of branches and loops) and how additional input features can increase the accuracy of the prediction
- In a matter of 2-3 years, GNNs have gone from exotic, to mainstream as people begin to understand the generalizability and ubiquity of the graph input representation
    - PyTorch geometric is winning out as the preferred GNN architecture and training framework

### Functionality Matters in Netlist Representation Learning

- Here is the [paper PDF](https://www.cse.cuhk.edu.hk/~byu/papers/C142-DAC2022-GCL.pdf)
- More and more people are looking for netlist representations / embeddings to feed as input features to an ML model for various RTL metric prediction problems
- These authors have identified that existing netlist -> graph transforms usually only embed facts related to the graph topology rather than the gate logic function - this is very valuable foundational work.
    - e.g. understanding this work is critical to build a generic-gate-level coverage extrapolation model that can generalize to multiple unrelated designs

{{ image(path="12-netlist_learning1.png", class="inset") }}

- The solution is to use 'contrastive learning' to learn a graph embedding kernel that maps graphs with identical functionality to similar vectors by taking a seed graph, mutating it while exactly preserving its boolean function, and forcing the network to learn a kernel such that the seed and mutated graphs have a similar embedding.

{{ gallery(images=[
    "12-netlist_learning2.png",
    "12-netlist_learning3.png",
    "12-netlist_learning4.png",
], popout=true) }}

- The authors, then propose a new GNN architecture called FGNN (functional GNN) which is designed specifically for GL netlists to incorporate gate-level logic functionality into the reduction kernels. This is in contrast to typical GNNs which mostly consider graph topology and connectivity when embedding a node or performing graph-level regression.
    - Independent aggregator functions (kernels) for each gate type (AND, OR, INV, MAJ, MUX, NAND, NOR and XOR)
- They train a classifier that can detect the output boundary (ports) of an adder circuit using very simple training examples. Then they synthesize Rocket and BOOM with 6 different adder architectures, extract the GL netlists, and run their classifier to see if the adder boundaries are properly identified.

- In practice, we need to know if this training process is scalable with large netlists with generic gates for fine-tuning. Training on the arithmetic circuit classification problem is fine, but is the node embedding effectiveness maintained for large netlists?
- Here is another closely related paper in this DAC which was a best paper candidiate: [DeepGate: Learning Neural Representations of Logic Gates](https://arxiv.org/abs/2111.14616)

### Enabling Automated FPGA Accelerator Optimization Using Graph Neural Networks

- Here is the [paper PDF](https://arxiv.org/pdf/2111.08848.pdf) from [Jason Cong's group](https://vast.cs.ucla.edu/)
- This is similar to the first paper, HLS code is transformed into a CDFG, along with pragma embeddings, use a GNN to predict performance, and then wrap that in a DSE that varies HLS-level hardware parameters

{{ image(path="12-hls_dse.png", class="inset") }}

## Embedded Systems

The next session was _"Iterate and Scale: Designing Stronger and Safer Embedded Systems"_.

### SCAIE-V: An Open-Source SCAlable Interface for ISA Extensions for RISC-V Processors

> We present SCAIE-V, a highly portable and feature-rich ISAX interface that supports custom control flow, decoupled execution, multi-cycle-instructions, and memory transactions. The cost of the interface itself scales with the complexity of the ISAXes actually used.

- [Github: esa-tu-darmstadr/SCAIE-V](https://github.com/esa-tu-darmstadt/SCAIE-V)
- Seems to be an alternative to RoCC, implemented for PicoRV32 and VexRiscv

## SoC DSE and Modeling

The next session was _"Fantastic SoCs and What to Learn!"_.

### Chiplet Actuary: A Quantitative Cost Model and Multi-Chiplet Architecture Exploration

- [Paper PDF](https://arxiv.org/abs/2203.12268), [Github: Yinxiao-Feng/DAC2022](https://github.com/Yinxiao-Feng/DAC2022)
- They build a model for estimating when MCMs may be a good architecture, incorporating a yield and fabrication cost model, and an NRE + RE cost model.
- This is a good paper if you're looking for numbers related to chip defects, engineering costs, and fabrication / packaging overhead costs

### A Fast Parameter Tuning Framework via Transfer Learning and Multi-objective Bayesian Optimization

- The paper link is unavailable, no Github repo either
- More of the same, but just worth restating the trend of "building PPA prediction models and running Bayesian optimization to perform DSE"
    - This is becoming a mainstay at design conferences accounting for 5-10% of the papers
    - There are no consistent benchmarks so evaluating these DSE techniques is very ad-hoc at the moment

## Panel on ML for Verification

Things finally got interesting again with a panel discussion: _ML for Verification:Does it Work or Doesn’t It?_.
Here are my notes from the session.

- The panelists were:
  - Clark Barrett — Stanford University (*the ML skeptic* on the panel, formal advocate)
  - Erik Berg — Microsoft
  - Sandeep Srinivasan — VerifAI (*the ML enthusiast* on the panel)
  - Avi Ziv — IBM
  - Shoba Vasudevan — Google Brain (*she wasn't present*)

- The ML skeptic on the panel: the long tail of verification is the final few bugs. Even if ML speeds up coverage closure, it still struggles in hitting what it doesn't know about / target. The long tail here refers to events *beyond coverage closure* that aren't defined in a test specification or in the RTL, but are nontheless critical to hit to uncover hidden bugs. These are the rare events DV doesn't think about
    - He also mentioned that verification by its very nature is a 'precise' problem. Using fuzzy techniques may yield benefit in image processing but isn't well suited for discrete models in the way formal methods are.
    - The skeptic suggests QED and A-QED as approaches that can mitigate the need to write formal properties (e.g. using self-consistency as A-QED does).
- Using ML for an efficient regression flow (regression / qualification test selection) is very important -> this results in direct cost and time savings which is big for industry. More work should be done in this domain.
- Debug speedup is a big deal, and there isn't much work using ML to that end. This topic is mentioned frequently by industry engineers, but most of the ML for verification work seems focused on coverage closure, which is comparatively (in terms of time) less of an issue.
    - We want techniques to pinpoint RTL bugs and/or perform waveform discrepancy analysis
    - More generally, we want a tool to teach DV engineers "how to debug" a particular architecture they're seeing for the first time - how can we automatically transfer inherent/internal RTL engineer knowledge to DV?
- Microsoft guy claims that RL + trajectory tuning of parameters has mostly solved the coverage closure problem, but long tail bugs persist
    - Input features for bug localization they've tried include transaction logs on DUT internal interfaces and log files + some trace data
    - From these features they try to extract relevant info for bug localization
- IBM guy talks about how everything in the testbench environment is dumped (test names, parameter settings, an infinite stream of debug prints) as a time-series
    - Can we learn anything from that? The issue is that this is proprietary information and academics have no hope of recreating a similar environment
    - Can we standardize our log file schemas? Standardized outputs for different tools, architectures, trace/log files - something that is machine readable by construction.
- Microsoft guy talks about bug benchmarks and what is out in the open. For now, basically nothing that is similar to the RTL bug, test, and waveform databases that industry players have internally.
    - I talked to him afterwards about what bug localization work can academics do if the bug databases are hidden?
    - He said, basically *there is no hope here*.
    - Synthetic bugs are very poor analogs to real bugs. At best you can create a tool a compnay can validate internally but the precise results will likely not be sharable. Maybe look at open source repos that have bug reports and fixes? You only need to validate a few bug localizations to show the tool effectiveness and utility.
- RL still hasn't been applied rigorously to perform incremental state exploration with state snappshotting and restoration - this area needs to be explored more and contrasted with concolic execution methods
    - Coverage closure with hybrid ML/DV/FV methods is still underutilized in industry - the vast majority of verification is very manual with directed UVM testbenches or some minor random generator tuning
    - Can we make these hybrid / bughunting / state exploration techniques easier to use? Can this be a language level feature (e.g. in Chisel)?
- Clark suggested we have a common platform (benchmark test suite, RTL, bugs) for all verification tools (DV/FV) that academics can collaborate on, and actually drive SOTA forward. Industry needs to help contribute to this effort.
    - Nice suggestion, but implementing this is very tough due to the collaboration and consensus needed - the only way to get it done is to do it solo and hope it catches on
- SemiEngineering wrote up an article on this panel: [Can ML Help Verification? Maybe](https://semiengineering.com/can-ml-help-verification-maybe/)

## Exhibition Floor

This is _by far_ the best part of DAC.
Everyone should come and talk to companies on the exhibition floors.

{{ gallery(images=[
    "exhibition_floor.jpg",
    "exhibition_floor2.jpg",
]) }}

### X-Epic

This is a Chinese EDA company (see this article [EE News Analog: China backs X-Epic in EDA](https://www.eenewsanalog.com/en/china-keeps-backing-x-epic-in-eda/)).
Keep a lookout for how they're doing and how much they can displace American EDA within China.

> X-Epic was established in March 2020 and has obtained six rounds of financing according to reports, all of which are worth hundreds of millions of yuan (see Chinese EDA hopeful raises $30 million).
>
> In November 2020 X-Epic released simulation technology supporting domestic computing architectures and in November 2021 launched four products: HuaPro-P1, a FPGA prototype verification system; GalaxSim-1.0, a digital simulator, GalaxPSS, a verification system, and GalaxFV, a formal verification tool based on word-level modelling.

### Sigasi

They develop a [SystemVerilog IDE](https://insights.sigasi.com/manual/editions/#sigasi-studio-xprt), which is also offered as a VSCode extension (based on a SystemVerilog LSP).
They offered educational licenses for EECS 151.
And I think it could help get rid of TA time wastage on simple Verilog syntax / convention issues.

Later when I got home, I trialed their VSCode extension, and it isn't as useful as I expected.
The autocomplete is pretty weak.
There are brittle warnings or none at all for basic problems like multiple drivers on one net, multiple drivers from different always blocks, mixing blocking and nonblocking in one always block or using the wrong type of assignment in a clocked vs combinational always block, or incomplete cases / defaults.

For now, I think it's best for students to continue using VSCode as a normal text editor when combined with Verilator's lint-only mode.

### VerifAI

[VerifAI](http://verifai.ai/) is a startup that offers "ML for verification" tools.
Their technique is much simpler than I expected, upon talking to their engineers.

- They receive a CSV from their customer (simplified example below) containing test generator parameters and an aggregate coverage metric they're trying to maximize
- Their tool parses this file and determines which parameters to try next in the test environment using an RL agent
- Later, they will support multiple coverage metrics and some kind of netlist embedding that customers can provide, but the functionality as of now looks like a very cripped version of Xcelium-ML

{% code(language="plaintext") %}
param0, param1, param2, cov_metric
0.5, 0.2, 0.4, 4
0.6, 0.1, 0.3, 5
0.2, 0.9, 0.2 2
{% end %}

### Scientific Analog

{{ image(path="12-xmodel.jpg", class="inset") }}

Scientific Analog offers [XMODEL](https://www.scianalog.com/xmodel/), which is a framework to perform SPICE-ish simulations in pure SystemVerilog without invoking a SPICE simulator.
They also have a way to convert an AMS model into their library primitives that use the SystemVerilog event-driven simulation model to trigger state updates.
They have _by far_ the most aesthetic marketing material on the floor.

### Cedar EDA

[Cedar EDA](https://cedar-eda.com/) developed the first "Fully Differentiable SPICE Simulator", written in Julia, with a Julia API.

Does this mean you can compute an empirical derivative of say the gain of an op-amp with respect to each of the transistor widths?
Or something even more complex like the noise figure with respect to transistor widths/lengths and passives?
This could enable intelligent circuit parameter search algorithms vs shooting in the dark and trying to train a regression model or an RL agent.

### Cadence

There were lots of raffle giveaways at their booth for which we sat through their presentations, but we never won anything :(.

The booth people were really helpful — someone gave me details on Xcelium-ML and offered more help offline.
_In contrast_, the Synopsys reps were not helpful.
Seriously, they claimed to not have any verification reps on Tuesday or Wednesday.
That is pretty much their core business (VCS) — I think they're just not interested in talking to lowly grad students.

## Open-Source EDA

Prof. Andrew Kahng has been organizing a [_"Open-Source EDA Birds-of-a-Feather Meeting"_](https://open-source-eda-birds-of-a-feather.github.io/README_2022.html) at DAC for the past few years.
Here are my notes from this session.

- [Andrew Kahng's intro slides and discussion notes](https://open-source-eda-birds-of-a-feather.github.io/doc/slides/LIVE-NOTES-Open-Source%20EDA%20and%20Benchmarking%20Summit%202022.pdf)
    - People talked about foundry support for OpenROAD tools - the tools are much more mature than 2 years ago so it might be in the cards to get foundries to publish collateral for them.
    - Replace pay-to-play standards bodies (e.g. Accelera) with open standards for tool interop and CAD database formats. Common complaint about OpenAccess not actually having open specs or APIs. OpenROAD has its own EDA database format shared across all the tools.
    - Everyone should push designs through OpenROAD frequently and report bugs - people are actively working on all the tools
    - Uniform benchmarks are critical, industry should contribute designs
        - Can companies release old designs that aren't used anymore?
        - Can we retire poor / old benchmarks? (e.g. iscas85 circuits)
    - Should EDA research be reproducible? YES. Conferences should encourage authors to submit collateral to increase reviewer confidence in the work (e.g. notebooks, artifacts)
- [TILOS AI Institute - MacroPlacement benchmarks](https://github.com/TILOS-AI-Institute/MacroPlacement#testcases)
    - Open source benchmarks used by Google in their RL placer paper
    - Complete with Makefile for RTL → GDS flows using Cadence / OpenROAD backend with nangate45, asap7, sky130
    - [Google's public release of their RL placer](https://github.com/google-research/circuit_training)
- Also see Princeton's [OpenPiton Design Benchmarks](https://github.com/PrincetonUniversity/OPDB) (these are intended to benchmark synthesis and backend flows on QoR)
- [DFiant cloud solution that offers access to OSS EDA flows](https://open-source-eda-birds-of-a-feather.github.io/doc/slides/Oron_DFiant%20Remote.pdf)
    - Remote OSS CAD tool execution that can be run from your local computer with file sync, virtual desktop, etc. This is pretty cool, but they didn't do a demo and the slides seemed a bit primitive.
- [OpenROAD Rosetta Stone](https://github.com/ABKGroup/RosettaStone)

> This repository contains RosettaStone, which leverages a standard physical design data model (LEF/DEF 5.8) and open-source database implementation (OpenDB in OpenROAD) to effectively connect the academic physical design field's past, present and future. RosettaStone's shared data model enables richer integrations, flow contexts, and assessments for research.

### Cadence Scripts Can be Public Now!

Cadence delivers a boon to academic researchers (we should migrate to Xcelium and get rid of all Synopsys dependencies in our VLSI flow).
Thanks to this, [hammer-cadence-plugins](https://github.com/ucb-bar/hammer-cadence-plugins/) is now public!

{{ image(path="12-cadence_statement.jpg", class="inset") }}

### Metrics4ML

The Github repo: [ieee-ceda-datc/Metrics4ML](https://github.com/ieee-ceda-datc/datc-rdf-Metrics4ML).

> In this repository, you will also find an overview of METRICS2.1, an open-source format for collecting design and tool metrics for an RTL-to-GDS flow.

- They define a schema for metrics (area, timing, power, etc.) emitted by each each tool used in the VLSI CAD flow
    - Does SiliconCompiler use their metrics schema? I don't think so.
    - This project is inactive, but it seems like a good place to start with metric schema integration in Hammer.

## Open CAD Flow Tools Session

Onto the next day of DAC, Wednesday!
The first session was _Breaking Down Physical Design Barriers with Open and Agile Flow Tools_.

### SiliconCompiler Presentation and Demo

- [Slides PDF](https://raw.githubusercontent.com/siliconcompiler/sc-education/main/presentations/sc_2022_07_dac.pdf), [Paper PDF](https://raw.githubusercontent.com/siliconcompiler/sc-education/main/papers/sc_2022_07_dac.pdf)
- There are definitely some things to like about SiliconCompiler:
    - Built in library for defining flow graphs (Make-like) using a Python API
        - Use of arbitrary Python to define each flow step
    - Flow graph model is serialized as a manifest and is then executed (like meson / ninja) (execution can take place remotely due to static dependency specification allowing for clean-ish file synchronization)
        - Standardized manifest schema
    - Setup of configuration is done in pure Python (no yaml / json inputs). Users write Python to set up each flow step by specifying their inputs (tool directories, envvars, PDK definitions) and outputs (temp dirs, log file outputs, database output path).
    - Built in SLURM dispatch or *remote execution* with SiliconCompiler's server-side daemon (can launch jobs from your laptop to a cluster / cloud and sync job results whenever they're ready)
    - Consistent metrics schema used to standardize (and systematically manipulate) tool-specific log files
- And some things to not like:
    - Python configuration object is just a key/value store with some stringly-typed keys defined in the standardized manifest schema (this may be useful in some circumstances when ad-hoc properties are used from the configuration DB to a specific tool)
    - Ad-hoc configuration schema for different tools / PDKs, difficult to decipher where things come from
    - Awkward DSL for flow graph construction
- See this: [OpenROAD makefile reimplemented using the SiliconCompiler flow graph API](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/pull/501/files)
- Overall, a good entry in this space and forces us to rethink some design decisions in Hammer and motivates some feature additions
- Andreas' list of open source HW projects: [Github: aolofson/awesome-opensource-hardware](https://github.com/aolofsson/awesome-opensource-hardware)

### mflowgen

- [Paper PDF](https://ctorng.com/pdfs/carsello-mflowgen-dac2022.pdf)

{{ gallery(images=[
    "13-mflowgen1.png",
    "13-mflowgen2.png",
]) }}

- Things to like:
    - They have a flow graph API built into the tool just like SiliconCompiler (it emits a Makefile)
    - Extensive use of static property checking to catch TCL config bugs early (e.g. referring to a non-existent net in your constraints file)
    - Ability to snapshot the state of a node (the filesystem) after partial execution of a flow graph and store it in an artifact repository
    - Ability to restore these states (even from different tool users) and restart the flow after a point (e.g. one person runs synthesis and others can use their results from an artifact repo for floorplanning runs)
    - Design / VLSI CAD tool parameter space sweeping using the `param-sweep` function [documented here](https://mflowgen.readthedocs.io/en/latest/ug-param-space.html)
        - Something like this would be very awkward with Hammer since the Makefile orchestrating the sweep would have to emit yaml/json fragments for each concrete parameter set

### HAMMER Talk

Where are the paper and slides?
I could find the other ones by searching "dac 2022 mflowgen" or looking at their Github repo.
We need to do a better job with marketing.
But regardless, great presentation Bora!

{{ image(path="13-bora.jpg", class="inset") }}

## Power Session

The next session was _Designing and Verifying for Power at the Front End_.
This session didn't have many interesting talks and it overlapped with the OSS EDA flows session, but this one stood out.

### Learning-based Power Modeling for Versal AI Engine

{{ gallery(images=[
    "13-versal_power1.jpg",
    "13-versal_power2.jpg",
    "13-versal_power3.jpg",
    "13-versal_power4.jpg",
    "13-versal_power5.jpg",
    "13-versal_power6.jpg",
], popout=true, num_cols=3) }}

- Cycle-level granularity on-chip power monitor used for [peak draw and IR drop analysis](https://59dac.conference-program.com/presentation/?id=FEDES116&sess=sess163)
    - Feeds back to PDN controllers and P-state tuning logic
    - Close correlation between SystemC events + IPM vs actual drawn power as measured in silicon
    - Nothing novel or special in their approach, but just a reiteration that on-chip power monitors are very common in industry silicon and they seem to have low-ish error even though they're only looking at a few signals and using a very simple linear model

## ML for EDA Panel

We went to a panel called _[Machine Learning for Electronic Design Automation: Irrational Exuberance or the Dawn of a Golden Age?](https://59dac.conference-program.com/presentation/?id=PANEL107&sess=sess211)_.

- Panelists
    - Andrew Kahng — University of California, San Diego
    - Alberto Sangiovanni Vincentelli — University of California, Berkeley
    - Giovanni De Micheli — École Polytechnique Fédérale de Lausanne
    - Gary Marcus — Robust.AI

- There was never any consensus about whether ML will revolutionize EDA CAD algorithms, but ASV basically said something to the effect of:
    - Traditional algorithms exploit the problem structure and when developed properly can outcompete generic algorithms like ML.
    - This includes things like simulated annealing and genetic algorithms for optimization when tuned to the problem domain.
- However, the other panelists pointed out that just having enough data can be sufficient to make generic algorithms and heuristics much more performant / accurate than domain-specific ones
    - ASV attributes this to the inherent fuzziness of the domains in which ML is being applied e.g. generative art, image classification, text completion. He argues that EDA is different, where the algorithm space is discrete (not continuous) and preciseness is required (inaccuracies aren't tolerated).

## Posters

{{ gallery(images=[
  "13-coq_dram_model.jpg",
  "13-deep_rl_placer.jpg",
  "13-pulp_pmc.jpg",
  "13-xls_poster.jpg",
]) }}

There were a few interesting posters:

- Coq Based DRAM Timing Model and Property Verifier
  - This is a DRAM model, with timing invariants and a proof. The SystemVerilog lowering is being worked on.
- Deep RL placer similar to what Google published in Nature
- Pulp-Based PMU FPGA prototype

<!--
    - flisboa@telecom-paris.fr
    - See: Matthias Jung - Petri nets - DRAM timing formal models
-->

### XLS (Google's HLS IR)

- HLS has traditionally meant C or SystemC to structural-ish Verilog
    - Algorithms expressed in C are usually feedforward ones with a bit of state, expressed as pure functions - these can be transformed into FSMs with HLS
    - SystemC bolts on module hierarchies, a systematic hierarchy of ports and blocking/non-blocking operators on them, TLM, threads within a module to capture HW concurrency, and designer-specified 'hints' to the HLS engine (places to look for parallelism, loop unrolling/blocking factors, desired pipeline depth).
- The baggage of C/SystemC has motivated people to design new HLS frontend languages as well as IRs that can capture all the primitives needed to express HLS-able algorithms as well as designer instrumented implementation hooks / suggestions (e.g. equivalent of pragmas in SystemC)
    - e.g. I have been thinking about unifying software VIPs and RTL transactors in front-end description language - enabling lowering of VIPs to transactors automatically for FPGA simulation as well as using synthesizable VIPs within regular software RTL simulation to improve performance when the testbench host language isn't SystemVerilog.
- XLS (Google's HLS IR) very recently added "threading" support (which is critical to describe VIPs)
    - [Experimental "procs" feature](https://google.github.io/xls/tutorials/intro_to_procs/)
    - Procs support a form of "communicating sequential processes" which describe hardware-level parallelism
- [Calyx IR](https://calyxir.org/) (an HLS IR, built by Cornell) supports parallelism constructs and is used by Dahlia and TVM
    - [MLIR Calyx dialect docs](https://circt.llvm.org/docs/Dialects/Calyx/)
    - [Calyx experimental thread synchronization primitives](https://docs.calyxir.org/lang/sync.html)
- [Github: Intel/systemc-compiler](https://github.com/intel/systemc-compiler)

### RVVI (RISC-V Verification Interface)

- There was a talk about this on the exhibition floor that I missed
- [Github: riscv-verification/RVVI](https://github.com/riscv-verification/RVVI)
    - The complaint is that each RISC-V core (Rocket / Chipyard cores, CVA6, Shakti, etc.) has a different testharness that's written specifically for it
    - They propose a standardized Verilog / C++ interface for processor trace, reference model comparison, and peripherals (e.g. UART, interrupts)
    - This is definetely a good idea and we should keep abreast of these developments - ideally they would publish a Verilog and C++ (Verilator) testbench that can just slot in any RISC-V SoC if it has the conforming ports

## Teardown

The final day of DAC, Thursday, has arrived.
The exhibition floor wasn't open today.
It's nice to see how they packed everything into a relatively small area.

{{ gallery(images=[
    "14-done1.jpg",
    "14-done2.jpg",
])}}

## SemiCon West

SemiCon West was going on in the other Moscone buildings.
It was much larger than DAC — way more attendees and way more exhibitors.

The focus was on vendors for everything related to semiconductor manufacturing.
Lots of robots, gantries, testing rigs, special chemical suppliers, lithography machines, and clean room equipment.
There was a probe tester that was running on the floor — it is incredibly fast!

{{ image(path="14-semicon_prober.jpg", class="inset") }}
{{ video(path="14-semicon_prober.mp4", height="500px") }}

## Automating Analog Layout - Has The Time Finally Come?

The panel we've all been waiting for on the last day of DAC.

- The panelists:
    - Steven Burns — Intel
    - Elad Alon — Blue Cheetah Analog Design
    - Ting-Sheng Ku — NVIDIA
    - Weikai Sun — Synopsys

{{ gallery(images=[
    "14-analog_panel.jpg",
    "14-analog_panel2.jpg",
    "14-analog_panel3.jpg",
], popout=true) }}

- Analog *was* being dragged into FF nodes
    - 5-10 years ago this was because of the integration trend
    - Now, with chiplet disaggregation analog is allowed to lag behind in some cases
- A big issue with analog automation is nice and aesthetic layouts are actually good in ways that can't be easily measured or simulated
    - Variability and resiliency simulations don't capture full silicon effects
    - Unexpected variation introduced by manufacting process isn't modeled in simulation, but can usually be dealt with by symmetric and aesthetic layout

### Synopsys' Take

{{ gallery(images=[
    "14-analog_panel_1_1.jpg",
    "14-analog_panel_1_2.jpg",
    "14-analog_panel_1_3.jpg",
    "14-analog_panel_1_4.jpg",
    "14-analog_panel_1_5.jpg",
], popout=true, num_cols=3) }}

- Custom layout is painful due to parasitic-induced layout iteration
    - The focus should be layout automation assistance with guidance around parasitics - not a fully automated flow.
- Avoid red button flows, you want instant constraint to layout feedback, mixed-signal timing is still a big issue that we're not tackling

### Elad Alon's Take

{{ gallery(images=[
    "14-analog_panel_2_1.jpg",
    "14-analog_panel_2_2.jpg",
    "14-analog_panel_2_3.jpg",
    "14-analog_panel_2_4.jpg",
    "14-analog_panel_2_5.jpg",
    "14-analog_panel_2_6.jpg",
], popout=true, num_cols=4) }}

### Steve Burns' Take

{{ gallery(images=[
    "14-analog_panel_3_1.jpg",
    "14-analog_panel_3_2.jpg",
    "14-analog_panel_3_3.jpg",
    "14-analog_panel_3_4.jpg",
    "14-analog_panel_3_5.jpg",
    "14-analog_panel_3_6.jpg",
    "14-analog_panel_3_7.jpg",
    "14-analog_panel_3_8.jpg",
], popout=true, num_cols=4) }}

### NVIDIA's Take

{{ gallery(images=[
    "14-analog_panel_4_1.jpg",
    "14-analog_panel_4_2.jpg",
    "14-analog_panel_4_3.jpg",
    "14-analog_panel_4_4.jpg",
    "14-analog_panel_4_5.jpg",
    "14-analog_panel_4_6.jpg",
    "14-analog_panel_4_7.jpg",
], popout=true, num_cols=4) }}

- Layout changes are by their nature *visual*, only one thing is touched at a time (and you do it by hand so you feel in full control)
    - In contrast to code changes which are *non-visual* and many layout attributes can change with one code change (this is the cause of frustration around layout automation)
- Trusting a layout algorithm comes from *reliability*, NOT formal proof / simulation
    - If proven in silicon, everyone likes it. If it *appears to work* in simulation, no one trusts it, especially if the layout is ugly / not symmetric
- Designers always agree with themselves - whatever ML layout engine we use must mimic a specific designer (and his own personal style)!
    - This is the way to win trust
    - The other panelists thought this was a bit extreme, but it does make sense
- The panelists often refered to analog designers as a 'sub-species' of humanity, one that needs a lot of coaxing and is prone to sticking with behavior patterns for life and resisting change.
    - The analog designer is a fickle thing: very good at what they do and they possess great intuition, but they suffer from low productivity and superstition, making analog automation difficult when they have to be convinced to adopt it.


## GPU Accelerated Gate-Level Simulation

This excellent paper from NVIDIA, [GATSPI: GPU Accelerated Gate-Level Simulation for Power Improvement](https://research.nvidia.com/publication/2022-03_gatspi-gpu-accelerated-gate-level-simulation-power-improvement), was presented in the _So You Want a Better Design? Go with Faster Timing and Lower Power Please!_ session.

{{ gallery(images=[
    "14-gatspi.jpg",
    "14-gatspi1.png",
    "14-gatspi2.png",
], popout=true) }}

- Transform gate-level netlists to DGL graphs, extract subgraphs and compile them to CUDA kernels that accurately model delays with SDF input
- Specialzed kernel code to avoid thread divergence and remove need for conditionals. Gates are simulated in parallel across many waveforms.
- Turns 1 day of GL simulation runtime to just 10 seconds with 4 A100 GPUs
- Potentially the same technique can be used to accelerate the actual signoff power analysis which ingests the spef and uses data in the .spef/.lib files to extract per-toggle energy

## Source-Level Debugging for New HDLs

{{ image(path="14-hgdb.jpg", class="inset") }}

Another excellent paper and talk about _hgdb_: ["Bringing Source-Level Debugging Frameworks to Hardware Generators"](https://arxiv.org/pdf/2203.05742).
Step through debugging is a bit of a hard sell to RTL designers who are used to waveforms, but Verilog ⇔ Scala sourcemaps would be insanely useful especially for temporary / generated nodes.

## Conclusion

The conference was much larger than I expected and there were many interesting sessions.
But there are some hangups.

Most slides _aren't published anywhere_.
At least the _Research Track_ has papers published in the conference proceedings.
Panel and engineering track slides just vanish after the conference — people were taking slide photos constantly in every session because of this.

Also, most exhibition hall information isn't posted online — it would be nice to know in advance what demo / presentation sessions are taking place in each company's booth on every day.
