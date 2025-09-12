+++
title = "61st Design Automation Conference (DAC 2024)"
date = 2024-07-05
draft = true
description = "The Cooley panel, fun on the exhibition floor with X-Epic, OSS EDA CAD, and much much more!"

[extra]
new = true
+++

I went to [DAC in 2022](@/research/events/2022-06-dac/index.md) and it quickly became my favorite conference.
So after missing it in 2023, I signed up with the free "I Love DAC" registration for DAC in 2024.
Since I realized that the academic / engineering tracks in 2022 were basically worthless, I was very happy to use the free registration to attend the most important part of DAC: _the exhibition floor_.
Here is what I saw.

## Cooley Troublemakers Panel

To kick off the 61st DAC, we had the classic panel of EDA CAD executives put together by John Cooley of [deepchip.com](https://deepchip.com/).
This panel was way more fun than the one I saw in 2022.
You can watch [the recording here](https://www.youtube.com/watch?v=r0vWASJYbFY).

{{ image(path="cooley_panel.jpg", width="50%") }}

Sitting on the panel were: Prakash Narain of [Real Intent](https://www.realintent.com/), Paul Cunningham of Cadence, Dean Drako of [IC Manage](https://www.icmanage.com/) (and [Drako Motors](https://www.drakomotors.com/)), Tony Hemmelgarn of Siemens, Shankar Krishnamoorthy of Synopsys, and Joe Costello of [Metrics](https://altair.com/newsroom/news-releases/altair-signs-agreement-to-acquire-metrics-design-automation-inc).

### Digital Twins

The panel got started with Cooley asking the execs about the recent EDA CAD hype around "digital twins".

Tony began by talking about one of his customers: Sony.
They wanted to build some kind of noise suppression headphones that would be used in a factory, so it goes.
So naturally, they had to model the factory itself for "end-to-end simulation" where they designed the model of the environment along with the chip that goes into the headphones.
They wanted to simulate things up front to design the specs in the first place, and this extends to package design and so forth.

The question is at what fidelity we need to model that external environment along with the chip, so it's not just the IC, but the full product, and the factory where it will be produced and used.
For instance, how do you determine how to bin dies?
Well, you need to bin dies based on their end-to-end performance in the full + real system.

There's a good chance I'm getting what Tony said wrong, but this seems quite far-fetched to me 😆.

Shankar stepped in and said that the concept of digital twins goes back to SPICE.
We often need to build a virtual product in its environment where you can evaluate it.
For instance, silicon companies like NVIDIA are becoming systems companies.
Consider the DGX box: one needs to evaluate package stress and thermals, the motherboard, the chassis, the pod, and cluster all at once with thermal and cooling models.
We need multi-physics analysis and EDA tools that can interplay with them.

<!--
Digital twin from tony
Sony wants to know about how noise suppression works in a factory that is noisy, need a factory model for full end to end simulation, need to design the model of the environment along with the chip specs too, this is a good point, be able to simulate things up front yo design the specs in the first place, this extends to package design and so forth, the question is at what fidelity we need to model that external environment along with the chip, it's not just the ic but the full product and the factory where it will be produced and used, how do you bin die? Need to bin dies based on their end to end performance on the real system
Shankar, digital twin goes back to spice, need to build a virtual product in its entirely where you can evaluate it
Silicon systems like nvidia are becoming systems companies, like the dgx, need to eval package stress and thermals, the motherboard, the chassis, the pod and cluster and thermals and cooling, need multi physics analysis, and eda tools that can interplay with them
-->

Now it's Dean's turn.
He says that we've been doing this (building digital twins) for a long time and we are simply extending the scope of this task.
Shankar says that the entire product development process is based on all-encompassing virtual simulation.
Paul suggests that there is move overlap as we move from package to system; we need to do more co-design for system-level optimization and better simulation scaling techniques as abstractions overlap.

Shankar dives in and says that originally people would first build a chip, and then write software.
But the new way is to write software simultaneously as the chip is being developed.
This is the "digital twin" in action: software has to know how the chip interacts with the product and environment.

Paul says that we can leverage knowledge from EDA CAD to multi-physics simulation - we are already good at building digital twins for ICs, but we need to extend this upwards.
For example, can we simulate the airplane mechanics and aerodynamics along with the silicon hardware?
This is Paul's call to action: make this happen!
Digital twins are mechanical now - it has gone way beyond purely digital-domain modeling, and also includes stress, thermals, and 3DIC modeling too.

<!--
Dean says we have been doing this for long time and we are just extending the scope of them. Shankar is saying that the entire product dev process is the entire virtual simulation, all encompassing
Paul, more overlap as we move from package to system, need to do more codesign for opt, need better physical scaling due to abstractions overlap
Shankar, first build chip then write software, but new way is to write software directly as the chip is being developed, digital twin in action, software has to know how the chip interacts with the product and environment
Paul, can we leverage knowledge from eda cad to the multi physics simulation, we are good at a chip digital twin, but need to extend this upwards
Paul, can we simulate the airplane along with the hardware, let's do call to action, let's deliver that
Digital twin stuff is mechanical now, it has gone beyond digital stuff, stress, thermals, 3dic things too
-->

### Synopsys + Ansys

Cooley asks Shankar, "how are you going to build 3DICs without a good PCB tool?" (too much mocking 😆)
If Synopsys doesn't even have good package design software, and there's no unified cockpit for signoff from 2D to 3D, this seems hard.
There must be deep integration between IC, packaging, and PCB design tools along with multi-physics analysis for stress and thermals.

Without much hesitation Cooley then discusses the news that [Synopsys will acquire Ansys](https://news.synopsys.com/2024-01-16-Synopsys-to-Acquire-Ansys,-Creating-a-Leader-in-Silicon-to-Systems-Design-Solutions).
Paul, "how does Cadence cope"?

Paul said he's OK, they are still competing, Cadence can also do multi-physics simulation, [Clarity](https://www.cadence.com/en_US/home/tools/system-analysis/em-solver/clarity-3d-solver.html) is good vs [HFSS](https://www.ansys.com/products/electronics/ansys-hfss), [Celsius](https://www.cadence.com/en_US/home/tools/system-analysis/thermal-solutions/celsius-thermal-solver.html) is good vs [Icepak](https://www.ansys.com/products/electronics/ansys-icepak), we also have [Fidelity CFD](https://www.cadence.com/en_US/home/tools/system-analysis/computational-fluid-dynamics/fidelity.html) from our [acquisition of Cascade](https://community.cadence.com/cadence_blogs_8/b/cfd/posts/cadence-welcomes-cascade-technologies-1221740980).
Lots of good stuff.
And Anirudh is working on large numerical solvers at Cadence.
We feel confident, but we acknowledge that Ansys has a good position too.

Then Cooley turns to Shankar, "did you just buy old software"?
Shankar says that Ansys is the gold standard for signal integrity, and they still have a dominant position.

Cooley says, "But HFSS seems old, and Cadence has modern algorithms in Clarity, are you still OK with this acquisition"?
Shankar says he is still better off, since for complex designs, people still trust Ansys HFSS the most.
Paul keeps the hype going by noting that tool coupling between digital and multi-physics simulations is good.

<!--
Shankar is going to build 3dic without a PCB tool lol, they think packaging people don't have good software yet, no unified cockpit for signoff from 2d to 3d, deep integration between chip and PCB and package tools, and multiphysics abalysis
Synopsis acquire Ansys, how does cadence cope? Paul is ok lol, they are still competing, we can also do multiphysics, clarity is good vs hfss, Celsius vs icepack, fidelity cfd, Cascade, lots of good stuff of course lol, anirudh is doing large numerical solvers at cadence, feels confidence but acknowledge Ansys has a good position
Shankar, did you buy old sw lol, but Ansys is gold standard for si, Ansys has dominant position,
Hfss seems old lol, cadence has modern algos in clarity, are you still ok lol?
Shankar says he is still better, we are still good lol, complex design people use Ansys for hfss, he will keep driving
Paul says coupling between multiphysics and digital is good
-->

### Digital Twin Hype

Suddenly Joe jumps in, and says that all this "digital twin" stuff is just a hype cycle!
There is indeed an intersection between IC stuff and CAE stuff, but this is overblown.
Digital twins are ultimately about building simplifying models - we shouldn't need to use "digital twins" a lot, but only at the fringes where we can't model things too abstractly.
He asserts that the intersection between IC design and multi-physics simulation of the environment the chip operates in is quite narrow.
We shouldn't overengineer simulations.

{{ gallery(images=[
    "cadence_celsius.png",
    "cadence_celsius2.png",
    "cadence_celsius3.png",
], popout=false) }}

Cadence still insists there are good use cases, such as modeling the datacenter physically along with the silicon that's running on each rack to simulate datacenter thermals.
And Synopsys concurs: it's a good opportunity to sell more tools to people who don't need them.
After all, this is one justification for the acquisition of Ansys' tools for multi-physics simulation.
<!--
Joe says digital twin is hype cycle, cae, intersection between ic stuff and cae stuff, digital twin is ideally about simplifying models, Joe believes that we shouldn't need digital twin a lot, only at the fringes where we can't model things too abstractly, the intersection is actually quite narrow, don't solve excess problems, only at leading edge
-->

<!--
- A “Digital Twin” is so important!
  - Cadence claims it is so important to model the datacenter physically along with the silicon that’s running on each rack
  - Synopsys agrees! Of course, more tools to sell to people who don’t need them
  - Justification for acquisition of Ansys’s tools for non-VLSI-CAD areas
- Joe refutes them!
  - Digital twins of physical environments for co-simulation with digital architectures only needed in very niche scenarios
  - High-level modeling is sufficient. Not physics simulation!
-->

### A Free RTL Simulator: Metrics

<!--
Joe is giving away rtl simulators lol, where is the upside lol? Is this just a joke
Joe says it makes industry sense, rtl sim is the most important, why for free? The model in this business has to change, everyone wants a good digital simulator, use it for code, debug, no money on small things, nearly all simulator cycles happen in the data center for regression, make the creative system free to do work and create, just play with it for free, but we charge for data center cloud for regression, don't use half assed DC for regression, use a commercial inexpensive cloud for the rest, you can't build stuff for free anymore by yourself as an engineer but we want to enable that, free tool do your design and then if you want to do big then you can use cloud
Synopsis has pay per minutes on the cloud since 2022, Paul says me too
Metrics make this easy, no need for license random stuff, unlike cadence or synopsys, Paul is encouraging joe
-->

After talking about the folly of highly detailed "digital twins" for simulation, Joe moved onto his own company.
We're giving away RTL simulators!

And Cooley asked him, "where is the upside? Is this just a joke?".
Joe says that it makes industry sense. Everyone uses RTL simulation and it's very important.

And why should we give it away for free?
He says the model in this business has to change.
Everyone wants a good digital simulator: and you should be able to use it for free for RTL design and debug for small things for free.
But nearly all simulation cycles happen in the datacenter for regressions.
So let's make the simulator free so you can be creative and design RTL and play around.
But we will charge you for the datacenter cloud for regression runs.

{{ gallery(images=[
    "altair_metrics.jpg",
    "altair_metrics_2.jpg",
    "metrics_card.jpg",
    "metrics_card_2.jpg",
], popout=true) }}

Shankar came in and said that Synopsys has had pay-per-minute VCS cloud since 2022, and Paul says Cadence too!
But Joe claims that Metrics makes this easy with no need for getting licences ahead of time, unlike Cadence or Synopsys.

Later, I looked into [Metrics DSim](https://altair.com/dsim).
And it turns out, it is a huge pain to use.
You need to use it within VSCode with their plugin, but there is no DSim binary you can just download and run.
Not good...

<!--
- Joe used to run Metrics
  - DSim: a free, cloud-native RTL simulator with full SV/UVM support
  - Sounds cool right?
- But it is a huge pain to actually use
  - Depends on some VSCode plugin, there is no binary you can download and run
- Now Metrics is acquired by Altair
- Someone should look into this, eventually…
-->

### "IP Management" Tools

<!--
- What are these “IP Management” Tools?
- IC Manage
  - Design data management is a system that provides secure access to all design and IP data for system and semiconductor designs for purposes of team collaboration, revision tracking & control, IP sharing & reuse, and design & verification progress analytics.
  - What?
- [Perforce Helix IPLM](https://www.perforce.com/products/helix-iplm)
  - You need to be able to track IPs and their projects from conception through implementation. End-to-end traceability of those IPs is a requirement in the enterprise, especially for those with functional safety requirements.
  - What?
- Cooley made fun of them as “folder zipping services”
- Dean and Paul threw a fit
-->

Cooley asks Dean, "everyone has these IP management things, so is your product (IC Manage) dead"?
Well, says Dean, IC Manage has this Holodeck product that "can manage cloud data transfers easily with large data files", can do deduplication, EDA cloud bursting, and so forth.
And, we're moving to a SaaS model.

You see, AMD is a user of IC Manage, and they claim they can 'accelerate' development using cloud EDA tools (Synopsys / Cadence).
The problem is that data is often spread out over many datacenters, there are many competing data management systems, and organizations can't reuse their IP across new acquisitions and cross-teams.
We can integrate with arbitrary VCS tools, create an IP catalog, and handle versioning and traceability.

{{ gallery(images=[
    "ic_manage.jpg",
    "perforce.jpg",
], popout=false) }}

The reader should look at [Holodeck](https://www.icmanage.com/io-scale-out-high-speed-holodeck/) and [Perforce Helix IPLM](https://www.perforce.com/products/helix-iplm).
It is very very hard to understand what these tools actually do.
Cooley mocked them as "folder zipping services" 😆.


<!--
Dean, everyone has ip management things, is your product dead? Ic manage has design and IP and holodeck product, we can manage cloud data transfers easily with large data files, dedup and random stuff, components the eda cloud bursting solutions, we are moving to sass model, need to specify what data to run which simulation, holodeck seems kind of stupid lol, seems like a adhoc build system and spec system and cloud system, but seems ugly, multi cloud thing, holodeck claims to be complementary, AMD is a user of this, claim they can accelerate synopsys, cadence stuff using cloud magic, basically orchestration tool
Data is spread out over data centers, many data management systems, orgs cant reuse their things across new acquisitions and other cross team stuff, can integrate with random vcs tools, creates catalog, can handle ip objects and versioning and traceability, seems similar to perforce IP thing
Tony, team center, apply to semi lifecycle management, supply chain management, program schedule, timing, need bom tool, cadence is growing in this area, gf micron Samsung is using it
Plm tool
Dean says it isn't about grouping files lol, idk this is just semantics, he is taking about IP not full chips and revs
-->

### Real Intent Sentry

Moving on, Cooley asked Prakash of Real Intent about his [Sentry](https://www.realintent.com/hardware-security-sign-off-verification-sentry/) hardware security tool.
"It claims to be static, but the competition is formal. Why is that important?"

Prakash says that Real Intent is a _static signoff_ company.
This tool is about security for on-chip data transfer / integrity / leakage avoidance.
The user specifies security architecture rules and the product finds failures.
The competition is [JasperGold](https://www.cadence.com/en_US/home/tools/system-design-and-verification/formal-and-static-verification.html) and [VC Formal](https://www.synopsys.com/verification/static-and-formal-verification/vc-formal.html).

The main issue with formal tools is their capacity is limited to 2-3M gates, but Real Intent tools can process 5M gates in minutes, and 100M gates in an hour.
The drawback, is that Real Intent's static tools have false failures, which need to be waived or refined by hand.

Paul suggested that static tools can't guarantee fully correct designs, so formal tools must also exist, and he sees them as complementary.
However, Prakash disagreed and asserted that we don't need formal to check if a key can be leaked.
In the same way that static timing can't miss a problem, but it can have false failures, Real Intent's tools can't miss real bugs, but they may require user intervention to reduce pessimism.
<!--
Real intent sentry, security signoff tool lol, it is static but the competition is formal, why is that important
We are a static signoff company, shift left for security for data transfer and integrity and leakage avoidance, security arch defines rules and the product analyze failures, competition is jasper and vc formal and formal tools
But capacity is limited to 2-3M gates, we can process 5M gate in minutes, 100m gate in an hour, but we have false failures, but we can just waive them by hand lol
Paul says if it checks clean it doesn't guarantee fully correct, can only do that with formal, I see them as complementary
Prakash disagrees, we don't need formal to check if a key can be leaked, static signoff cannot miss a problem, but they can have false positives, we have secret sauce
-->

### The New Era of RTL → GDS Tools

Cooley interrogated Shankar about why [Synopsys IC2](https://www.synopsys.com/implementation-and-signoff/physical-implementation/ic-compiler.html) was a disaster, which allowed Cadence to dominate the digital PD market with [Genus](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/synthesis/genus-synthesis-solution.html) and [Innovus](https://www.cadence.com/en_US/home/tools/digital-design-and-signoff/soc-implementation-and-floorplanning/innovus-implementation-system.html), and how Synopsys recovered from that.

Shankar said that in modern nodes, PnR results need to correlate well with signoff as well as early synthesis, and if that wasn't the case, excess pessimistic margin needs to be added at every step of the VLSI flow.
IC2 had to add margin everywhere due to its step-by-step VLSI flow.

For [Fusion Compiler](https://www.synopsys.com/implementation-and-signoff/physical-implementation/fusion-compiler.html), Synopsys did a full rewrite of the data model that the VLSI algorithms operate on.
They used a _unified data model_ across all synthesis and PnR algorithms, with a unified timing engine, to avoid the pessimistic margining problems of IC2.

Shankar emphasized that _software engineering matters_.
Synopsys took a risk to _rewrite their entire stack_ with the bet that using the same algorithms (timing estimation, congestion estimation, cell sizing, and so forth) on a unified data model would allow them to create a fully fused VLSI flow with no unnecessary margining between steps.
It is embarrassing to see how huge enterprises with billions at stake are willing to rewrite massive software projects from scratch, while academics are afraid to rewrite and improve tiny pieces of evaluation infrastructure.

<!--
- Synopsys IC2 was a disaster
- Cadence jumped in with Innovus and was winning all Synopsys’ customers
- Now Fusion Compiler is overtaking Innovus
  - Step-by-step PD flow just doesn’t give good QoR
  - Too much margining required at every PD step
  - Fusion compiler was a full rewrite of the data model algorithms operate on
- Software engineering matters
  - Unified data model across all synthesis / PnR algorithms
  - Single cockpit, no miscorrelations / bad estimates
- Destruction enables new creation
  - If huge companies can do it, why are academics so hesitant? Quite cowardly!

Shankar, ic 2 was a disaster and let cadence into the market, how did you clean?
Signoff gets complex at latest nodes, need pnr to correlate with signoff, and synthesis too, and if not then add lots of margin lol but that didn't work
We rewrote all the imenenyation, built a common data model, no miscoreelation, common engines, same router as used in synthesis and pnr, now we have single cockpit tool, this was fusion compiler, all 20 top customers use it, everyone literally, 20 percent power improvement for nothing
Dso.ai thing for parameter searching, big productitivy gain, but idk what this is, we have no competition, no one else has unified synthesis, pnr, signoff unified data model
Paul feels good about his flow lol, but not so sure lol, cadence is still working on full integration of engines, use AI to explore knobs and settings, I think that's good
Paul says they are unified from post gate map from then on
Shankar says fused is not integrated, same data model not kist integration and what

Getting the arch right is leaving things on the table
Paul says must keep focusing on improving the engines too, need to reduce margining still
Shankar says no margins are needed lol, but he doesn't force margins through the flow
Prakash believes that integration isn't the way to deliver the best product, he says that he has data models for each product that are specialized for each product, unified models are nice in theory but he has different experience, maybe from the frontend side
-->

<!-- ### Multi-Physics CAD -->

<!--
Tony Siemens acquired mentor a long time ago, was this a disaster? They claim doubled revenue from 7 years ago, out side ic space they did well, PCB with expedition, they do well on cfd similar to Ansys with Airbus, Boeing uses mentor stuff too, combining electrical system modeling with ic stuff
Paul don't you have cfd stuff, synopsys is paying for cfd stuff, are you in trouble? Fidelity, combining core solvers and pre and post process mesh they feel well about it, they claim to displace Ansys in some customers
Tony, Joe sawiki is gone, is calibre dying, they have been doing succession planning already, people are rising to the occasion, there are lots of people behind calibre too, feel good,
Shankar is respecting calibre team, he will compete on rule complexity at latest nodes, with synopsys tool, drc runtime is too long, we have the best arch, same-day runsets for many founders, Intel nvidia Cisco AMD mediatek all using synopsys phys verification signoff
Paul we used Pegasus to tapeout palladium chip, they used their own signoff, we are going to compete with calibre

Paul, synopsys is coming after virtuoso, in custom analog and rf, they are doing AI things lol, pulsic acquisition, they think human in loop interaction is always going to be there,
Custom compiler is wowing but not virtuoso, Paul is dodging
Shankar, virtuoso is being used a lot, no one uses custom compiler, all Intel custom datapaths, Samsung IP dev, Toshiba, Panasonic all use CC, synopsys solutions group use CC to deliver interface IP
Aso.ai for analog automation, migration and optimization done automatically, general approach that goes beyond circuit type, getting good traction
cAe is mostly bs for ic engineers, Joe says, not the same business doesn't interact design engineers,maybe only at edge like 3dic, need to make it fun for the engineers, tools suck lol
They think analog migration and auto opt saves lots of effort, Shankar says he can do it and not cadence lol
-->

## Exhibition Floor

And now time for the best part of DAC, walking around the exhibition hall and talking to whoever seems interesting.

{{ gallery(images=[
    "exhibition_hall.jpg",
    "exhibition_hall_3.jpg",
    "exhibition_hall_4.jpg",
    "exhibition_hall_5.jpg",
], popout=true) }}

### GenAI Startups

This was the first DAC in which we saw a bunch of "GenAI" (i.e. _LLM for X_) startups come onto the scene.
EETimes wrote an article about it: ["Wider Context For Systems Design, Plus GenAI EDA Startups"](https://www.eetimes.com/dac-2024-day-2-wider-context-for-systems-design-plus-genai-eda-startups/).

<!--
- https://www.eetimes.com/dac-2024-day-2-wider-context-for-systems-design-plus-genai-eda-startups/
  - Where is JITX?
  - Silimate discussion
  - LLM for X
-->

#### PrimisAI

[PrimisAI](https://primis.ai/) was one of the first LLM for X startups to the EDA CAD scene.
They built some LLM integration for RTL generation.
They had a demo of an LLM generating trivial Verilog modules.
Here's a flyer.

<!-- (looking back from 2025, this was quite early, along with Agnisys) -->

{{ image(path="primis_ai.jpg", width="50%") }}

In 2025, undoubtedly, one could use Cursor or Windsurf out-of-the-box to do the same things.

#### Silimate

Another early entrant was [Silimate](https://www.silimate.com/) (YC S23).
They were quite unwilling to share any specifics about their tool.
All they would say were just variations of the quote on their website:

> “Silimate is the co-pilot for chip designers; it finds functional bugs, predicts PPA issues, and recommends fixes in real-time alongside RTL development.”

It seems there are 2 tools they are building.

1. A early stage [PPA prediction tool](https://marketplace.visualstudio.com/items?itemName=Silimate.preqorsor)
2. Some kind of LLM-based agent for DV, RTL generation, and bug fixing

If you look at their [Github organization](https://github.com/silimate), you can see a [fork of yosys](https://github.com/Silimate/yosys) with some optimizations, a fork of slang-yosys with some fixes, a [fork of OpenSTA](https://github.com/Silimate/OpenSTA), a [fork of Synopsys' Liberty parser](https://github.com/Silimate/liberty-parser), and a [fork of verilog-eval](https://github.com/Silimate/verilog-eval), among other repos.
It seems they are trying to leverage open source VLSI tools for synthesis, timing estimation, and power simulation, and build a fast PPA estimator on top of them.

And to get YC to invest, they probably had to throw in some random LLM thing.

<!--
Very standoffish founder, but still insistent on hiring
“Silimate is the co-pilot for chip designers; it finds functional bugs, predicts PPA issues, and recommends fixes in real-time alongside RTL development.”
What does this mean?
Look at their Github
Fork of yosys with some optimizations
Fork of slang-yosys with some fixes
Fork of OpenSTA
Fork of Synopsys’ liberty parser
Fork of VerilogEval
Seems to be
Leverage open source VLSI tools, build a PPA estimator on top
Do some random LLM thing to entice VCs
-->

### X-Epic

This company, [X-Epic](https://www.x-epic.com/), came out of the blue with a bunch of EDA CAD tools.
This is a Chinese EDA CAD company that started in 2020, but has already produced many useful tools and has acquired significant market share within China.

#### Emulation Machines

You may be familiar with [Synopsys' HAPS prototyping platform](https://www.synopsys.com/verification/emulation-prototyping/prototyping/haps-100.html) and their [ZeBu emulator](https://www.synopsys.com/verification/emulation-prototyping/emulation/zebu-200.html).
These are both big boxes with many FPGAs that are used for pre-silicon verification.
To build such a platform requires an enormous investment in research and engineering and typically takes 5-10 years to gain adoption in the market.

<!--
- Synopsys HAPS vs X-Epic HuaPro P2E
  - Can you spot the difference?
-->

{{ gallery(images=[
    "synopsys_zebu.jpg",
    "synopsys_zebu_2.jpg",
], popout=false, caption="Synopsys ZeBu boxes being demoed at the Synopsys booth") }}


And now we turn to the X-Epic _Hua-Pro P2E_ prototyping box.

{{ gallery(images=[
    "x_epic_box.jpg",
    "x_epic_box_2.jpg",
    "x_epic_huapro.jpg",
    "x_epic_huapro_2.jpg",
], popout=false, caption="X-Epic Hua-Pro P2E being demoed at their booth") }}

Can you spot the differences?
Besides the logo on the front of the box, they are very similar!
X-Epic has managed to develop this system in just a few years and it is at near feature-parity with Synopsys' offerings (at least for the single blade form-factor).
The Hua-Pro P2E supports waveform dumping, switching between prototyping and emulation modes, speed bridges for hardware-in-the-loop testing,

<!--
- X-Epic is nearly at feature parity with Zebu
  - Supports waveforms, prototype + emulation mode, speed bridges to real hardware, …
-->

#### X-Epic GalaxSim

- Fully Chinese, from scratch, Xcelium equivalent RTL simulator
- Does the waveform viewer look familiar?
- They poached off many Verdi engineers and built it again
- But it looks even nicer than Verdi! Equivalent functionality

{{ gallery(images=[
    "x_epic_waves.jpg",
    "x_epic_waves_2.jpg",
    "x_epic_fusion_debug.jpg",
], popout=false) }}

### X-Epic Fun Time

- Nothing changes, there is no difference in 3 months vs Shanghai, look at airport, streets, transit
- Can't you ship homeless to Nevada? It's too comfortable here it seems
- IC = indians and Chinese lmao
- My hat was stolen 3 times! It's not because of consequences or morality or honestly but rather they have 10s of cctv cameras lmao, they make emulation systems used for the camera custom socs lmao
- No crime in Chinese cities, no loss of property
- If you can buy any ic in Shenzhen you can always also buy any software lmao, including Chinese eda and American pirated eda
- China was forced into self reliance, and domestic eda operations due to American lockout
- But now many American companies are interested in buying Chinese eda and trying it out
- The products are the exact same lmao, even have the same engineers
- Back to China movement and also many young Chinese choose to stay in China, less the case in india
- There are local Chinese eda trade shows, much bigger than dac, lots of local Chinese chip dev buys domestic tools and use domestic fabs
- Look at Chinese dominance in PCB now, just insane achievement
- Xiangshan uses x epic simulators and prototyping and emulation systems given to them at cost
- Chinese companies try to get Chinese back to China, like Huawei, x epic also services Huawei a lot lol

- He didn't expect PhD student to know so much about industry tools and emulation
- Think outside the bay! Not just the regular companies
- Everyone knows Berkeley and many people are grads from Berkeley, people talk to us about great China, Cory and soda hall, and more lol
- X epic paid a bimbo to advertise at the desk, she was just the desk girl lmao
- Crime in Berkeley vs China, below a certain line watch out lmao
- Quality of life keeps increasing in China, Chinese manufacturing keeps lowering cost and improving automation, just saw the Oakland port, they have constraints wrt dockworkers while Chinese automated the entire thing, what about pollution? Yes indeed China drops rockets with toxic waste onto villages but for the average person just look at the clean cities, factories are also quite industrialized and waste is sequestered in most cases
- It has been just 4 years of work and look how far they've gotten, very impressive


### FPGA-Based Prototyping Systems

- S2C, Huins, Corigine - specialized FPGA proto vendors (VU19P is the king)

#### S2C

<!-- "s2c_huge_board.jpg", -->
{{ gallery(images=[
    "s2c_4x_board.jpg",
    "s2c_prodigy.jpg",
    "s2c_prodigy_system.jpg",
], popout=false) }}

#### Huins

{{ gallery(images=[
    "huins.jpg",
    "huins_2.jpg",
    "huins_3.jpg",
], popout=false) }}

#### Corigine

{{ gallery(images=[
    "corigine_booth.jpg",
    "corigine_prototyping_system.jpg",
    "corigine_prototyping_system2.jpg",
], popout=false) }}

### Quick Takes

#### Agnisys

{{ gallery(images=[
    "agnisys.jpg",
    "agnisys_2.jpg",
], popout=false) }}

#### AlphaWave

- UCIe IP is popular, AlphaWave among many others showcasing it

{{ image(path="alphawave_ucie_d2d.jpg", width="50%") }}

#### Exostiv

{{ gallery(images=[
    "exostiv.jpg",
    "exostiv_2.jpg",
    "exostiv_3.jpg",
    "exostiv_4.jpg",
], popout=false) }}

#### allspice.io

- visual PCB diffs

#### Scientific Analog

{{ image(path="scientific_analog.jpg", width="50%") }}

#### Siemens

- Try to email Siemens, they have had students try to get rtl running in emulation and report how it goes to them lol
- Veloce

{{ image(path="siemens_veloce.jpg", width="50%") }}

#### Sigasi

{{ image(path="sigasi.jpg", width="50%") }}

#### Intel Foundry

- 18A image from synopsys

{{ image(path="synopsys_intel_18a.jpg", width="50%") }}

### NoC Startups

#### Arteris

#### Baya Systems

## OSS EDA CAD Birds-of-a-Feather

- https://open-source-eda-birds-of-a-feather.github.io/README_2024.html
- iEDA: https://open-source-eda-birds-of-a-feather.github.io/doc/slides_2024/DAC-BoF_iEDA.pdf
Your tool is not the top level! It is a library! Stop using TCL and other garbage and expose actual apis
- Zero asic missing, precision innovations lmao
- OpenROAD is oversold
  - Luca Benini gave a talk on 10/31/24 at Berkeley - OpenROAD has advanced significantly from 2022
- iEDA (Chinese) is undersold
  - Lots of LLM talk, mostly useless and nonproductive
- OSS CAD vision is weak and uninspiring

{{ gallery(images=[
    "birds_of_a_feather.jpg",
    "birds_of_a_feather_2.jpg",
], popout=false) }}

### Precision Innovations

{{ gallery(images=[
    "precision_innovations.jpg",
    "precision_innovations_2.jpg",
], popout=false) }}

### Chinese (iEDA)

{{ gallery(images=[
    "i_eda.jpg",
    "i_eda_2.jpg",
    "i_eda_3.jpg",
    "i_eda_4.jpg",
], popout=true) }}

### Germans / Europeans (still writing proposals)

{{ gallery(images=[
    "germans.jpg",
    "germans_2.jpg",
    "germans_3.jpg",
    "germans_4.jpg",
], popout=true) }}

### ChipFlow

{{ gallery(images=[
    "chipflow.jpg",
    "chipflow_2.jpg",
], popout=false) }}

## Other Takeaways

- Main theme of dac, Chinese emergence and early dominance
- What about those who aren't there? Cedar eda, verifai, and look at others from dac 22
- Dac vs other academic conferences, drinks and fun, would academics even know what's going on lol?
- No sifive presence, less riscv mention than last time but still quite a bit
- X-Epic was founded in 2020, they are already so far!
- Rapid Chinese progress is a hallmark of DAC

<!--- Random tilelink ip lol-->
<!-- - Ansys powerartist-->
