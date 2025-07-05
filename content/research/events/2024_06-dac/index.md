+++
title = "61st Design Automation Conference (DAC 2024)"
date = 2024-07-05
draft = false
description = "The Cooley panel, fun on the exhibition floor with X-Epic, OSS EDA CAD, and much much more!"

[extra]
new = true
+++

## Cooley Troublemakers Panel

### Digital Twins

- A “Digital Twin” is so important!
  - Cadence claims it is so important to model the datacenter physically along with the silicon that’s running on each rack
  - Synopsys agrees! Of course, more tools to sell to people who don’t need them
  - Justification for acquisition of Ansys’s tools for non-VLSI-CAD areas
- Joe refutes them!
  - Digital twins of physical environments for co-simulation with digital architectures only needed in very niche scenarios
  - High-level modeling is sufficient. Not physics simulation!


Digital twin from tony
Sony wants to know about how noise suppression works in a factory that is noisy, need a factory model for full end to end simulation, need to design the model of the environment along with the chip specs too, this is a good point, be able to simulate things up front yo design the specs in the first place, this extends to package design and so forth, the question is at what fidelity we need to model that external environment along with the chip, it's not just the ic but the full product and the factory where it will be produced and used, how do you bin die? Need to bin dies based on their end to end performance on the real system
Shankar, digital twin goes back to spice, need to build a virtual product in its entirely where you can evaluate it

Silicon systems like nvidia are becoming systems companies, like the dgx, need to eval package stress and thermals, the motherboard, the chassis, the pod and cluster and thermals and cooling, need multi physics analysis, and eda tools that can interplay with them
Dean says we have been doing this for long time and we are just extending the scope of them. Shankar is saying that the entire product dev process is the entire virtual simulation, all encompassing
Paul, more overlap as we move from package to system, need to do more codesign for opt, need better physical scaling due to abstractions overlap
Shankar, first build chip then write software, but new way is to write software directly as the chip is being developed, digital twin in action, software has to know how the chip interacts with the product and environment
Paul, can we leverage knowledge from eda cad to the multi physics simulation, we are good at a chip digital twin, but need to extend this upwards
Paul, can we simulate the airplane along with the hardware, let's do call to action, let's deliver that
Digital twin stuff is mechanical now, it has gone beyond digital stuff, stress, thermals, 3dic things too

Shankar is going to build 3dic without a PCB tool lol, they think packaging people don't have good software yet, no unified cockpit for signoff from 2d to 3d, deep integration between chip and PCB and package tools, and multiphysics abalysis
Synopsis acquire Ansys, how does cadence cope? Paul is ok lol, they are still competing, we can also do multiphysics, clarity is good vs hfss, Celsius vs icepack, fidelity cfd, Cascade, lots of good stuff of course lol, anirudh is doing large numerical solvers at cadence, feels confidence but acknowledge Ansys has a good position
Shankar, did you buy old sw lol, but Ansys is gold standard for si, Ansys has dominant position,
Hfss seems old lol, cadence has modern algos in clarity, are you still ok lol?
Shankar says he is still better, we are still good lol, complex design people use Ansys for hfss, he will keep driving
Paul says coupling between multiphysics and digital is good

Joe says digital twin is hype cycle, cae, intersection between ic stuff and cae stuff, digital twin is ideally about simplifying models, Joe believes that we shouldn't need digital twin a lot, only at the fringes where we can't model things too abstractly, the intersection is actually quite narrow, don't solve excess problems, only at leading edge
Joe is giving away rtl simulators lol, where is the upside lol? Is this just a joke
Joe says it makes industry sense, rtl sim is the most important, why for free? The model in this business has to change, everyone wants a good digital simulator, use it for code, debug, no money on small things, nearly all simulator cycles happen in the data center for regression, make the creative system free to do work and create, just play with it for free, but we charge for data center cloud for regression, don't use half assed DC for regression, use a commercial inexpensive cloud for the rest, you can't build stuff for free anymore by yourself as an engineer but we want to enable that, free tool do your design and then if you want to do big then you can use cloud
Synopsis has pay per minutes on the cloud since 2022, Paul says me too
Metrics make this easy, no need for license random stuff, unlike cadence or synopsys, Paul is encouraging joe

### A Free RTL Simulator: Metrics

- Joe used to run Metrics
  - DSim: a free, cloud-native RTL simulator with full SV/UVM support
  - Sounds cool right?
- But it is a huge pain to actually use
  - Depends on some VSCode plugin, there is no binary you can download and run
- Now Metrics is acquired by Altair
- Someone should look into this, eventually…

### "IP Management" Tools

- What are these “IP Management” Tools?
- IC Manage
  - Design data management is a system that provides secure access to all design and IP data for system and semiconductor designs for purposes of team collaboration, revision tracking & control, IP sharing & reuse, and design & verification progress analytics.
  - What?
- [Perforce Helix IPLM](https://www.perforce.com/products/helix-iplm)
  - You need to be able to track IPs and their projects from conception through implementation. End-to-end traceability of those IPs is a requirement in the enterprise, especially for those with functional safety requirements.
  - What?
- Cooley made fun of them as “folder zipping services”
- Dean and Paul threw a fit



Dean, everyone has ip management things, is your product dead? Ic manage has design and IP and holodeck product, we can manage cloud data transfers easily with large data files, dedup and random stuff, components the eda cloud bursting solutions, we are moving to sass model, need to specify what data to run which simulation, holodeck seems kind of stupid lol, seems like a adhoc build system and spec system and cloud system, but seems ugly, multi cloud thing, holodeck claims to be complementary, AMD is a user of this, claim they can accelerate synopsys, cadence stuff using cloud magic, basically orchestration tool
Data is spread out over data centers, many data management systems, orgs cant reuse their things across new acquisitions and other cross team stuff, can integrate with random vcs tools, creates catalog, can handle ip objects and versioning and traceability, seems similar to perforce IP thing
Tony, team center, apply to semi lifecycle management, supply chain management, program schedule, timing, need bom tool, cadence is growing in this area, gf micron Samsung is using it
Plm tool
Dean says it isn't about grouping files lol, idk this is just semantics, he is taking about IP not full chips and revs

Real intent sentry, security signoff tool lol, it is static but the competition is formal, why is that important
We are a static signoff company, shift left for security for data transfer and integrity and leakage avoidance, security arch defines rules and the product analyze failures, competition is jasper and vc formal and formal tools
But capacity is limited to 2-3M gates, we can process 5M gate in minutes, 100m gate in an hour, but we have false failures, but we can just waive them by hand lol
Paul says if it checks clean it doesn't guarantee fully correct, can only do that with formal, I see them as complementary
Prakash disagrees, we don't need formal to check if a key can be leaked, static signoff cannot miss a problem, but they can have false positives, we have secret sauce

### The New Era of RTL -> GDS Tools

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

## Exhibition Floor

### GenAI Startups

- https://www.eetimes.com/dac-2024-day-2-wider-context-for-systems-design-plus-genai-eda-startups/
  - Where is JITX?
  - Silimate discussion
  - LLM for X


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

#### X-Epic Emulation Machines

- Synopsys HAPS vs X-Epic HuaPro P2E
  - Can you spot the difference?
- X-Epic is nearly at feature parity with Zebu
  - Supports waveforms, prototype + emulation mode, speed bridges to real hardware, …

- X-Epic was founded in 2020, they are already so far!
- Rapid Chinese progress is a hallmark of DAC
- Add Synopsys Zebu images

#### X-Epic GalaxSim

- Fully Chinese, from scratch, Xcelium equivalent RTL simulator
- Does the waveform viewer look familiar?
- They poached off many Verdi engineers and built it again
- But it looks even nicer than Verdi! Equivalent functionality


### FPGA-Based Prototyping Systems

- S2C, Huins, Corigine - specialized FPGA proto vendors (VU19P is the king)

#### S2C

#### Huins

#### Corigine

### Quick Takes

#### Agnisys

#### AlphaWave

- UCIe IP is popular, AlphaWave among many others showcasing it

#### Exostiv

#### allspice.io

- visual PCB diffs

#### Scientific Analog

#### Siemens

- Try to email Siemens, they have had students try to get rtl running in emulation and report how it goes to them lol
- Veloce

#### Sigasi

#### Intel Foundry

- 18A image from synopsys

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

### Precision Innovations

### Chinese (iEDA)

### Germans / Europeans (still writing proposals)

### ChipFlow

## Other Takeaways

- Main theme of dac, Chinese emergence and early dominance
- What about those who aren't there? Cedar eda, verifai, and look at others from dac 22
- Dac vs other academic conferences, drinks and fun, would academics even know what's going on lol?
- No sifive presence, less riscv mention than last time but still quite a bit

<!--- Random tilelink ip lol-->
<!-- - Ansys powerartist-->
