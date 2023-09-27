+++
title = "Machine Learning for Chip Placement: The Saga"
date = 2023-04-08
aliases = ["misc/ml-for-placement"]
+++

## Background on Chip Placement

Placement is the EDA CAD problem of placing standard cells and hard macros on a rectangular canvas such that the placements are legal (do not violate any DRCs, snap to a grid, no overlaps) and feasible (routing is likely to succeed with no overlapping wires and a DRC clean layout).
Traditionally, hard macro placement is done manually, while standard cell placement is done automatically by the PnR tool.
Hard macros, such as SRAMs and other hard IP blocks (e.g. PLLs, PHYs), need to be placed with knowledge of the pin locations to ensure good routability.
Since the number of hard macros per RTL unit is usually small (under 100) and their placement is critical, manual placement is seen as reasonable.

### Placement Metrics

**Question**: How can we calculate the quality of a proposed macro and standard cell placement?

The most accurate way is to take that placement, run the routing algorithm to connect the macros and standard cells, and compute the metrics related to QoR (quality of results) using the CAD tools.
The most important metrics are:

- Total Area (in µm²)
- Utilization / Density (proportion of stdcells vs filler/tap/cap cells per unit area) (~0.7 is considered an upper limit)
- Number of DRC violations
- Number of LVS violations (such as shorts)
- TNS (total negative slack), WNS (worst negative slack) (both ideally zero)
- Worst case IR drop
- Power draw when running dynamic stimulus
<!--- Worst case clock skew / jitter-->

Computing these metrics is time consuming, often taking 6+ hours for routing to complete on medium-sized RTL blocks, and many more hours to run DRC, LVS, rail analysis, and power simulation.

Therefore, the placement algorithm cannot run routing on every proposed placement.
Instead, it uses a proprietary *proxy metric* that *correlates* to the metrics above.
It is critical that any proxy metric correlates with the final metric since it controls what the placer determines is an optimal placement (with respect to other proposed placements).

There are many proxy metrics including:

- Wirelength (point to point routing, Manhattan distance)
- Utilization
- Congestion (an approximation of the number of overlapping routes)

### Placement Algorithms

Placement algorithms have been studied for many decades and there are many variations; I don't know much about the inner workings of these algorithms.
At a high-level the algorithm is usually split into two parts: coarse placement and detailed placement.

Trying to place each hard macro and stdcell individually is not viable since there are often *millions* of instances to place.
So, as a first step, the placer will group standard cells, based on a min-cut clustering algorithm, into a small number of clusters (usually around ~1k).
These clusters of stdcells are called soft macros.

After stdcell clustering, the hard macros are placed on manually provided coordinates.
*Coarse placement* places the soft macros with some allowances for overlaps between them and the hard macros.
Finally, during *detailed placement*, the clusters of standard cells are exploded, and their placements are legalized (snapped to the placement grid, no overlaps).

#### Modern Algorithms

Modern EDA CAD placement algorithms have some additional features.
For one, they constantly track the proxy metrics as they make placement decisions to avoid exploring bad placements.
Modern synthesis is placement-aware and will come up with a standard cell floorplan as its deciding what PDK cells to use considering the timing constraints (see [Synopsys' overview of "Physical Synthesis"](https://www.synopsys.com/glossary/what-is-physical-synthesis.html), see Cadence Genus iSpatial).
This floorplan from physical synthesis is fed into the PnR algorithm to seed its initial coarse placements.

Also, placement isn't part of a linear (synthesis → placement → routing) flow, rather every algorithm in the flow is aware of the others, and they constantly call back to each other.
For instance, if placement determines that a timing constraint will be violated based on the proposed hardened placement of a few standard cells, it may call back to synthesis to see if those cells can be upsized (or use a different Vt flavor) or if a logic path can be further optimized.
The most modern tools do not even have clean distinctions between the steps of the flow, but rather do RTL → GDS in a big algorithm blob (see [Synopsys Fusion Compiler](https://www.synopsys.com/implementation-and-signoff/physical-implementation/fusion-compiler.html)).

#### Mixed Placement Algorithms

Manual macro placement is a bottleneck when iterating on physical design.
Most engineers manually calculate macro (x, y) coordinates by hand, using knowledge about the connections between macros, logic, and pins.
Macro placement is resistant to automation because physical design engineers are quite stubborn and superstitious, notwithstanding the algorithmic complexity.

However, as the number of memory macros per RTL block continues to grow (into the 100s), there is interest in automating macro placement.
As of 2020, mixed placers, such as [Cadence's GigaPlace XL (in Innovus)](https://community.cadence.com/cadence_blogs_8/b/breakfast-bytes/posts/innovus-mixed-placer) became mature, and are able to [concurrently place hard macros and standard cells](https://semiwiki.com/eda/cadence/293055-cadence-is-making-floorplanning-easier-by-changing-the-rules/) with no designer input.

> The mixed placement technology, GigaPlace XL within the Innovus Implementation System, is an extension of the powerful multi-objective standard cell placement GigaPlace engine. The GigaPlace XL engine can handle the placement of these macros together with the standard cells and I/Os in the same step, concurrently. In reality, macro placement is a combinatorial problem, while standard cell placement is a numerical one. The breakthrough achieved by the GigaPlace XL engine inside Innovus Implementation is that, with its solver-based placement technology, it can solve continuous optimization and combinatorial optimization simultaneously.

## Google's Claimed Breakthrough

As commercial concurrent macro placers (CMPs) were becoming mature, Google was internally working on solving the macro placement problem via reinforcement learning.
Although they couldn't compare their RL-based macro placer to Innovus' GigaPlace XL, they claimed to achieve faster runtime and better final QoR than academic macro placers, commercial auto-floorplanning tools, and, of course, manual macro placement.

Their work was initially posted in April 2020 as an [arXiv preprint titled "Chip Placement with Deep Reinforcement Learning"](https://arxiv.org/abs/2004.10746).
It was later published in June 2021 in a [Nature article titled "A graph placement methodology for fast chip design"](https://www.nature.com/articles/s41586-021-03544-w).
The [Nature article's peer review file](https://static-content.springer.com/esm/art%3A10.1038%2Fs41586-021-03544-w/MediaObjects/41586_2021_3544_MOESM1_ESM.pdf) was also made open in April 2022.
The authors also [open sourced their code](https://github.com/google-research/circuit_training), although there may be gaps when it comes to full reproduction.

### The Proposed RL Placer

They cast the macro placement problem as a Markov decision process (rather than the typical optimization approach).

> (1) States encode information about the partial placement, including the netlist (adjacency matrix), node features (width, height, type), edge features (number of connections), current node (macro) to be placed, and metadata of the netlist graph (routing allocations, total number of wires, macros and standard cell clusters).
>
> (2) Actions are all possible locations (grid cells of the chip canvas) onto which the current macro can be placed without violating any hard constraints on density or blockages.
>
> (3) State transitions define the probability distribution over next states, given a state and an action.
>
> (4) Rewards are 0 for all actions except the last action, where the reward is a negative weighted sum of proxy wirelength, congestion and density, as described below.

{{ image(path="misc/ml-for-placement/rl_placement.webp", width="80%") }}

The RL agent receives an embedding of a particular placement and the current macro that the agent should act upon.
The details of the embedding aren't that clear, but the rough idea is that a GNN can capture relationships between macros and stdcell clusters with regards to connectivity and overlaps, and is able to estimate a proxy metric for the agent to use.
The encoder network is trained on 10000 generated floorplans to predict the proxy metric based on the netlist and placement embedding.
The encoder is replaced with the policy network once it is trained.

The RL agent places macros one by one, and once all are placed, a force-directed method is used to place the standard cell clusters.
A commercial CAD tool seems to take care of the detailed placement and the rest of the flow (including routing and post-place optimization).

{{ image(path="misc/ml-for-placement/embedding_and_policy_network.webp", width="100%") }}

For a given target block they are evaluating, they train the policy network on all the other blocks in their dataset, and then evaluate the policy on the unseen block.
They demonstrate that pre-training on blocks before doing fine-tuning for the unseen block gives better and faster results than training a policy from scratch (indicating that transfer learning is a viable approach for macro placement).
They claim that with a trained policy network, they can place all the macros for a new block in under one second, with decent results.

{{ image(path="misc/ml-for-placement/transfer_learning.webp", width="50%") }}

They compare their technique against manual macro placement and the academic RePLAce tool and show superior QoR for their placer.

> Once each method finishes placing the netlist, the macro locations are frozen and snapped to the power grid. Next, the EDA tool performs standard cell placement. The settings for the EDA tool are drawn directly from our production flow and thus we cannot share all details. The final metrics in Table 1 are reported after PlaceOpt, meaning that global routing has been performed by the EDA tool.

> Our method was used in the product tapeout of a recent Google TPU. We fully automated the placement process through PlaceOpt, at which point the design was sent to a third party for post-placement optimization, including detailed routing, clock tree synthesis and post-clock optimization.

Note that they aren't using the final output from PnR to compute the design metrics, rather only looking at post-place optimization metrics (no detailed routing has been performed).
But overall, this was a very promising result that could supplement the upcoming mixed placement algorithms.

## Something's Off

At the time (mid-2021), this paper caused a stir in the EDA CAD community.
Jeff Dean went around broadcasting the good news: the tagline was "using ML to design ML accelerators".
The authors also went on speaking circuits, delivering seminars at companies, universities, and conferences showcasing their work and the promise of using ML for other difficult combinational optimization problems.

There was a lot of skepticism about the reported results.
At the time, the code was closed source, and the only evaluation of RL for placement was on secret TPU blocks.
Furthermore, Nature is a very odd venue to publish such a work - a CAD conference would have been appropriate, but I suspect the reviewers would have grilled the authors too much for their liking.

Even inside Google, there was a rebuttal to this work on RL for placement that was floating around.
The rebuttal was [eventually leaked](http://47.190.89.225/pub/education/MLcontra.pdf) and is titled "Stronger Baselines for Evaluating Deep Reinforcement Learning in Chip Placement".
The author of the rebuttal was fired by Google, but that's irrelevant - let's examine its claims.

### The Rebuttal

Since the proliferation of ML in various problem domains, ML practioners have often claimed a benefit using their approach, while not
RL papers haven't evaluated themselves against reasonable baselines, and when properly compared against a good baseline, the RL method usually comes out much worse in terms of compute efficiency.
This rebuttal claims that when more traditional mixed placement algorithms are unconstrained and compared to the RL method - they come out ahead in terms of QoR, runtime, and required compute.

The rebuttal starts off by clarifying the methodology used in the RL paper, pointing out 3 important facts:

1. The standard cells are grouped by a clustering algorithm to shrink the graph the GNN has to embed, rather than working with the full netlist directly
2. The macro placement grid is as fine as 128 X 128, which is rather coarse; a larger grid would make RL harder to train
3. The macros are placed first, and then the standard cell clusters are placed after the macro placement is fully hardened (the placement of macros and standard cells is not simultaneous)

{{ image(path="misc/ml-for-placement/reconstructed_flow.png", width="90%") }}

Note these implementation details from the Nature paper:

> Given the dimensions of the chip canvas, there are many choices to discretize the two-dimensional canvas into grid cells. This decision affects the difficulty of optimization and the quality of the final placement. We limit the maximum number of rows and columns to 128. We treat choosing the optimal number of rows and columns as a bin-packing problem and rank different combinations of rows and columns by the amount of wasted space that they incur. We use an average of 30 rows and columns in our experiments.

> To prepare the placements for evaluation by a commercial EDA tool, we perform a simple legalization step to snap macros to the nearest power grid. We then fix the macro placements and use an EDA tool to place the standard cells and evaluate the placement.

#### Two Questions Asked by the Rebuttal

In response to only evaluating on Ariane and proprietary TPU blocks no one else has access to:

> How does the novel RL method perform on circuit benchmarks commonly used in academic research to evaluate new placement algorithms?

In response to using a limited "place macros, then stdcell clusters" technique in constrast to simultaneous mixed placement:

> How does the two-step methodology proposed in the Nature paper compare to a modern mixed-size methodology in terms of an established objective that (1) the corresponding tools can model and optimize explicitly, and (2) is commonly reported in the literature?

#### Results

The results are interesting.

{{ image(path="misc/ml-for-placement/rebuttal_results.png", width="80%") }}

They suggest that RePLAce was handicapped in the original evaluation, by forcing it to place standard cells only after macro placements were hardened.
The rebuttal also contains evidence that the coarse placement grid used by RL fares poorly when a netlist contains many small macros, while RePLAce still performs appreciably.
Finally, the difference in compute requirements of SA/RePLAce vs RL are staggering, with RL using 4-5 orders of magnitude more compute resources.

The proxy metrics (wirelength and congestion) in the results table may not match those reported by a commercial tool (since they were generated with open source tools), but they should correlate directionally.

The rebuttal concludes stating that there is no reason to believe that humans can outperform algorithms in macro placement, so not only are the RL placer results not surprising, but the rebuttal has shown that SOTA academic placers are even better.

## A Lull

After the Nature paper and rebuttal were published, there was some minor debate, but no resolution, since Google's benchmarks and RL agent code were closed source.
There were a few spinoff papers, but nothing substantial.
Since then, the Nature authors published their code on Github, and a team at UCSD began to reproduce the results.

## Another Examination of RL for Placement

The UCSD reproduction is [completely open source](https://github.com/TILOS-AI-Institute/MacroPlacement) and is hosted by the TILOS AI Institute.
They have published writeups of many of the implementation details, so I recommend reading through their READMEs detailing the [preprocessing steps for the RL agent](https://github.com/TILOS-AI-Institute/MacroPlacement/blob/main/Docs/CodeElements/README.md), [proxy cost computation](https://github.com/TILOS-AI-Institute/MacroPlacement/blob/main/Docs/ProxyCost/README.md), [progress log](https://github.com/TILOS-AI-Institute/MacroPlacement/blob/main/Docs/OurProgress/README.md), and [simulated annealing details](https://github.com/TILOS-AI-Institute/MacroPlacement/blob/main/CodeElements/SimulatedAnnealing/README.md).
Overall, this reproduction is of very high quality and probably the best documented EDA CAD evaluation I have ever seen.

The algorithms being compared:

- **Circuit Training (CT)**: the RL agent described in the Nature paper, based on Google's open-source implementation
- [**RePLAce**](https://github.com/The-OpenROAD-Project/RePlAce): a CPU-based mixed-placer
- **Simulated annealing (SA)**: for macro placement with a similar implementation as the rebuttal paper
- [**AutoDMP**](https://github.com/NVlabs/AutoDMP): a GPU-accelerated mixed placer based on [DREAMPlace](https://github.com/limbo018/DREAMPlace)
- **Concurrent Macro Placement (CMP)**: a proprietary mixed-placer used within a commercial RTL → GDS flow (Cadence Genus iSpatial + Innovus GigaPlace / Synopsys DC Topographical physical synthesis)

The PDKs being evaluated:

- **Sky130HD** with a fake 9 metal stack and fake SRAMs from bsg_fakeram
- **Nangate45** with fake SRAMs from bsg_fakeram
- **ASAP7** with fake SRAMs from FakeRAM 2.0
- **GF12** with PDK SRAMs

The benchmark circuits were Ariane (small RISC-V core), BlackParrot (quad-core RISC-V SoC), MemPool (256 RISC-V core mesh with large shared L1), a partition of NVDLA, and the IBM placement benchmarks (ICCAD04).

### The ISPD Paper

After more than one year of hammering on this reproduction, the UCSD group submitted an [invited paper at ISPD 2023](https://vlsicad.ucsd.edu/Publications/Conferences/396/c396.pdf) and also released the [paper on arXiv](https://arxiv.org/abs/2302.11014) titled "Assessment of Reinforcement Learning for Macro Placement".
It was met with praise for its systematic review of the prior work, but also received criticism from the original Nature paper authors, calling out deficiencies in their evaluation of Circuit Training.
But first, let's examine the key findings from the ISPD paper.

#### The Critical Findings

1. The proxy cost computed after placement of macros and standard cell clusters has a very poor correlation to **both** the post-place (postPlaceOpt) metrics as well as the golden post-route (postRouteOpt) metrics from the CAD tools.

See the [detailed results here for Ariane133](https://github.com/TILOS-AI-Institute/MacroPlacement/blob/main/Docs/OurProgress/README.md#Question10).
While wirelength and worst slack have slightly positive correlations to the proxy cost, standard cell area, power, and TNS are not correlated at all.
This calls into question the construction of the proxy metric, and whether a better one (similar to the one presumably used internally by CMP) could make SA/CT stronger.
This also calls into question the comparison of placement algorithms using postPlaceOpt proxy cost by prior works (the Nature paper, its rebuttal, and many placement algorithm papers).

2. The data from the rebuttal paper is accurate. SA/RePLAce *does* consistenly outperform CT on the IBM benchmarks with significantly less compute cost. However, the results on the modern benchmarks are more mixed, with different algorithms being more optimal on particular metrics for a particular design (but CT is still worse than the best alternative in nearly all cases).

> Comparison of CT with SA and RePlAce. Table 6 presents re-sults for CT, SA and RePlAce on ICCAD04 testcases. We observe the following. (i) In terms of proxy cost, RePlAce is always better than SA, and SA is always better than CT. (ii) In terms of HPWL, RePlAce is better than SA for 15 of 17 testcases, and SA is better than CT in 16 of 17 testcases.

3. The choice of PDK doesn't affect the performance of placement algorithms as much as the design type.

Looking at the results table, for Nangate45, CMP is the clear winner for most designs and metrics, but for GF12, CMP and AutoDMP are both competitive.
However, looking at the big picture, it is clear that the *complexity* of the design (in terms of number of macros, macro variety, and number of stdcells) affects the runtime and QoR for the algorithm rather than the choice of PDK.

4. AutoDMP and CMP consistently outperform Circuit Training.

Again, look at the results table, and it is clear that these algorithms perform better.
It can be argued that CMP and AutoDMP have 3 years of development ahead of CT, but the large differences in compute cost and runtime would make it hard to argue that CT could ever catch up in efficiency, let alone QoR.
Also, the results in this paper are reasonable - in aggregate, there is no clear winner; humans can beat algorithms in particular cases; and it does make sense that CMP would perform the best (being the SOTA in commercial fully-integrated CAD tools).
The Nature paper was suspect since it claimed an absolute advantage in all cases for CT over humans, SA, or RePLAce.

{{ image(path="misc/ml-for-placement/placement_comparison.png", width="100%") }}

This image is very telling: notice how the results from CT and SA are quite similar, but are distinct from the CMP and AutoDMP placements?
This seems to suggest that CT is refining an initial placement in a similar manner to SA, rather than truly exploring the entire placement space like the other two algorithms.

5. The initial placement of stdcells/macros makes a big difference in CT's performance. CT seems to be bootstrapped by physical synthesis, rather than learning placement strategies based on the stdcell/macro graph embedding.

> CT is helped by placement from physical synthesis. As noted in Sec. 3.1, CT relies on placement locations in its input, though this is not mentioned in Nature. To test the effect of initial placement on the CT outcome, we generate three “vacuous” input placements for the Ariane-NG45 design. Cases (1), (2) and (3) respectively have all standard cells and macros located at (600, 600), at the lower-left corner (0, 0), and at the upper-right corner (1347.1, 1346.8). For each case, we generate the clustered netlist, run CT and collect Ta- ble 1 metrics, following the evaluation flow of Sec. 4.2. We find that placement information in the input provides significant benefit to CT: given locations from Cadence CMP and Genus iSpatial (Steps 2 and 3 of Figure 2), CT’s solution has rWL that is 10.32%, 7.24% and 8.17% less than in Cases (1), (2) and (3), respectively

This is a substantial point.
In the original Nature paper, the authors commented:

> We use a commercial tool to synthesize the netlist from RTL. Synthesis is physical-aware, in the sense that it has access to the floorplan size and the locations of the input/output pins, which were informed by inter- and intra-block-level information.

But they never said that the preprocessing steps of CT used the rough placement information from physical synthesis.

6. Google didn't really open source everything needed for a full reproduction. The UCSD team had to reverse engineer several pieces of the flow and confirm with Google that their implementation was consistent with theirs.

> We now explain two key “blackbox” elements of CT: force-directed placement and proxy cost calculation. Neither is clearly documented in Nature, nor visible in CT. These examples are representative of the reverse-engineering needed to understand and reimplement methods that to date are visible only through APIs in the plc_client of [23].

## One More Rebuttal

The original Nature authors weren't too happy with the ISPD paper.
A spate of articles describing the debate were published.

- [More Details, but Not Enough - Communications of the ACM](https://cacm.acm.org/news/271439-more-details-but-not-enough/fulltext)
- [Google's claims of super-human AI chip layout back under the microscope - The Register](https://www.theregister.com/2023/03/27/google_ai_chip_paper_nature/)
- [Ending an Ugly Chapter in Chip Design - IEEE Spectrum](https://spectrum.ieee.org/chip-design-controversy)

The Nature authors published their own rebuttal of the ISPD paper titled ["Statement on Reinforcement Learning for Chip Design"](https://drive.google.com/file/d/1jWUw6rUDcc7fuHu_iGeVDUkBxNJjhHdd/view).
These are the key points and the [responses from the UCSD group](https://github.com/TILOS-AI-Institute/MacroPlacement#new-faqs-after-the-release-of-our-ispd-2023-paper-here-and-on-arxiv):

1. "The ISPD paper performed no pre-training for our method, Circuit Training (CT), meaning that the RL agent was reset each time it saw a new chip."

> We did not use pre-trained models in our study. Note that it is impossible to replicate the pre-training described in the Nature paper, for two reasons: (1) the data set used for pre-training consists of 20 TPU blocks which are not open-sourced, and (2) the code for pre-training is not released either.

> In the Circuit Training repo, Google engineers write: “Our results training from scratch are comparable or better than the reported results in the paper (on page 22) which used fine-tuning from a pre-trained model. We are training from scratch because we cannot publish the pre-trained model at this time and the released code can provide comparable results.” (link)

In my opinion, this complaint has been properly refuted by the UCSD team.

2. "Far fewer compute resources were applied to training CT than described in our Nature paper (half the number of GPUs and an order of magnitude fewer RL environments)."

> We use two collect servers each running 13 collect jobs, i.e., a total of 26 collect jobs are used for data collection. By contrast, the Nature authors run 512 collect jobs for data collection. The number of collect servers used to run 512 collect jobs is not clear from the description given in the Nature paper. We expect our runtimes to be higher than what Nature reports – and we account for this in our experiments.

Again, the UCSD team provides sufficient justification for their evaluation, substituting more compute time for fewer resources.
A case can be made that the RL model wasn't given enough time to converge, but this is just pendantic at this point: RL is already way more cost intensive than the other algorithms and performs worse.

Even if there is a runtime benefit when fine-tuning a pre-trained model, the Nature authors still claim 6 hours of fine-tuning is required before the proxy cost is comparable to a from-scratch trained model for 24 hours.
The runtime of CT without pre-training already reaches 30-80 hours on 8 GPUs, while CMP and AutoDMP take less than 2 hours in the largest benchmark with far fewer compute resources.

3. "The ISPD paper focuses on the use of the initial placement from physical synthesis to cluster standard cells, but this is of no practical concern."

The UCSD team clearly showed that initial placement of standard cell clusters provides a big benefit to CT, but that same benefit is afforded to the other placement algorithms.
Perhaps, this isn't as big a deal as the UCSD team makes it out to be.

4. "Although the study is entitled “Assessment of Reinforcement Learning for Macro Placement”, it does not compare against or even acknowledge any of the recent RL methods building on our work (link). Instead, the ISPD paper compares CT against AutoDMP (ISPD 2023) and (presumably) the latest version of CMP, a black-box, closed-source commercial autoplacer. Neither of these methods were available when we released our paper in 2020."

This is fair point, however, SA and RePLAce do still beat CT on certain metrics and benchmarks.
The results are a wash, rather than a clear win for CT like the Nature authors suggest.

## What's Next

This debate is probably over for now.
The Nature authors have abandoned EDA CAD research, and the UCSD team seems to be taking a victory lap (even though both parties are gracious in "victory" and "defeat").
I would say that Alberto Sangiovanni-Vincentelli (a father of EDA CAD) and Anirudh Devgan (CEO of Cadence) have been vindicated to some extent, in relying on fundamental algorithmic and constrained solver-based approaches to CAD problems rather than magic ML blackboxes.

Another interesting tidbit is that the man who wrote the original rebuttal to the Nature paper claims that Google tried to woo Synopsys with the RL placer work to secure a cloud contract.

> In his complaint against Google, which was amended [PDF] last month, Chatterjee's lawyers claimed the web giant was thinking about commercializing its AI-based floorplan-generating software with "Company S" while it was negotiating a Google Cloud deal reportedly worth $120 million with S at the time. Chatterjee claimed Google championed the floorplan paper to help convince Company S to get onboard with this significant commercial pact.
>
> "The study was done in part as a first step toward potential commercialization with [Company S] (and conducted with resources from [Company S]). Since it was done in the context of a large potential Cloud deal, it would have been unethical to imply that we had revolutionary technology when our tests showed otherwise," Chatterjee wrote in an email to Google's CEO Sundar Pichai, Vice President and Engineering Fellow Jay Yagnik, and VP of Google Research Rahul Sukthankar, which was disclosed as part of the lawsuit.
>
> His court filings accused Google of "overstating" its study's results, and "deliberately withholding material information from Company S to induce it to sign a cloud computing deal," effectively wooing the other business using what he saw as questionable technology.

The moral of the story is to always be skeptical of magical results in CAD, and to learn the fundamental algorithms at work rather than generating tons of data to train some model.

## P.S.

One more article was published in August 2023 which runs through the ML for placement saga and provides an accurate critique of the RL placement algorithm: [The False Dawn: Reevaluating Google's Reinforcement Learning for Chip Macro Placement](https://arxiv.org/abs/2306.09633).

## P.P.S.

As of September 2023, an editor's note was placed on the [original Nature paper](https://www.nature.com/articles/s41586-021-03544-w).

> 20 September 2023 Editor’s Note: Readers are alerted that the performance claims in this article have been called into question. The Editors are investigating these concerns, and, if appropriate, editorial action will be taken once this investigation is complete.

Hmm, an investigation?

Also Andrew Kahng's article in Nature's "News and Views" ([AI system outperforms humans in designing floorplans for microchips](https://www.nature.com/articles/d41586-021-01515-9)) on the original Nature paper was retracted on September 21, 2023.

> Retraction 21 September 2023: The author has retracted this article because new information about the methods used in the reported paper (A. Mirhoseini et al. Nature 594, 207–212; 2021) has become available since publication, and that has changed the author’s assessment of, and conclusions about, the paper’s contributions. Nature is also doing an independent investigation of the performance claims in the paper.

Igor Markov, the author of one of the rebuttal papers, presented a talk to the [Fall 2023 CS 294 class at UC Berkeley (ML for Hardware Design)](https://ucb-cs294-256.github.io/).
See his [review of the original Nature paper](https://drive.google.com/file/d/1bhz0LfBvzwA7UaALZxCcNk3d5bFxmimc/view) and [his rebuttal](https://drive.google.com/file/d/1krf1w-pNV5BfO9S2OrlVy6Dcr6cPzOzC/view).
TODO TODO TODO: attach local static links
