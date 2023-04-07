+++
title = "Machine Learning for Chip Placement: The Ongoing Saga"
date = 2023-04-04
+++

## Background on Chip Placement

Placement is the EDA CAD problem of placing standard cells and hard macros on a rectangular canvas such that the placements are legal (do not violate any DRCs, snap to a grid, no overlaps) and feasible (routing is likely to succeed with no overlapping wires and a DRC clean layout).
Traditionally, hard macro placement is done manually, while standard cell placement is done automatically by the PnR tool.
This is considered reasonable since hard macros include SRAMs and other hard IP blocks (e.g. PLLs, PHYs) whose placement is critical to achieving good routability, and the number of such macros is usually small (under 100) for a unit of RTL that is PnRed flat.

### Placement Metrics

**Question**: How can we calculate the quality of a proposed macro and standard cell placement?

The most accurate way is to take that placement, run the routing algorithm to connect the macros and standard cells, and compute the relevant metrics using the CAD tools.
The most important metrics are:

- Total Area (in µm²)
- Cell Density (proportion of stdcells vs filler/tap/cap cells per unit area) (~0.8 is considered an upper limit for density)
- Number of DRC violations
- Number of LVS violations (including shorts)
- TNS (total negative slack), WNS (worst negative slack) (both ideally zero)
- Worst case clock skew / jitter
- Worst case IR drop
- Power when running dynamic stimulus

Generating these metrics is very time consuming, often taking 6+ hours for routing to complete on medium-sized RTL blocks, and many more hours to run DRC, LVS, rail analysis, and power simulation.

Therefore, the CAD placer cannot run routing on every proposed placement, so it uses a proprietary *proxy metric* that correlates to the metrics above.
It is critical that these proxy metrics correlate with the actual final metrics since they control what the placer determines is an optimal placement (with respect to other proposed placements).

There are many proxy metrics including:

- Wirelength (assuming point to point, Manhattan distance, potentially overlapping connections)
- Cell density
- Congestion (an approximation of the number of overlapping routes)

### Placement Algorithms

Placement algorithms have been studied for many decades and there are many variations; I don't know much about the inner workings of these algorithms.
At a high-level the algorithm is usually split into two parts: coarse placement and detailed placement.

Trying to place each hard macro and stdcell by individually placing each instance is not viable since there are often *millions* of instances to place.
So, as a first step, the placer will cluster standard cells, based on a min-cut clustering algorithm, into a total of ~1k clusters.
These clusters of stdcells are called soft macros.

After clustering, the hard macros are placed according to a manual floorplan.
Then, the soft macros are placed with some allowances for overlaps between them and the hard macros (this is coarse placement).
Finally, the clusters of standard cells are exploded, and their placements are legalized (snapped to the placement grid, no overlaps) (this is detailed placement).

#### Modern Algorithms

Modern EDA CAD placement algorithms have some additional features.
For one, they constantly track the proxy metrics as they make placement decisions to avoid exploring bad placements.
Modern synthesis is placement-aware and will come up with a standard cell floorplan as its deciding what PDK cells to use considering the timing constraints (see [Synopsys' overview of "Physical Synthesis"](https://www.synopsys.com/glossary/what-is-physical-synthesis.html)).

Also, placement isn't part of a linear (synthesis → placement → routing) flow, rather every algorithm in the flow is aware of the others, and they constantly call back to each other.
For instance, if placement determines that a timing constraint will be violated based on the proposed hardened placement of a few standard cells, it may call back to synthesis to see if those cells can be upsized (or use a different Vt flavor) or if a logic path can be further optimized.
The most modern tools do not even have clean distinctions between the steps of the flow, but rather do RTL → GDS in a big algorithm blob (see [Synopsys Fusion Compiler](https://www.synopsys.com/implementation-and-signoff/physical-implementation/fusion-compiler.html)).

#### Mixed Placement Algorithms

It has been recognized that manual macro placement is a bottleneck when iterating on RTL in the early stages.
Most engineers manually calculate macro (x, y) coordinates using a spreadsheet or by hand, using knowledge about the connections between macros and logic.
This is still how things are done in most semiconductor design houses, since physical design engineers are quite stubborn and superstitious.

However, people are beginning to recognize the value of automating macro placement too (just like standard cell placement is fully automatic).


## The Magical Story from Google



## Something's Off

## A New Rebuttal

## What's Next
