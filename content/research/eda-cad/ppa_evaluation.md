+++
title = "Overview and Research in PPA Evaluation"
date = 2024-05-24
draft = true
+++

- Fast PPA prediction from RTL / elaborated netlist:
  - SNS
  - MasterRTL
  - [FastPASE](https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=10528750&tag=1)

All these are learning surrogate functions.
What is the right approach here?
Certainly not getting a bunch of 'training data' by running vanilla CAD tools on some randomly generated circuits and trying to build a regression model.

But, what is the model really learning? It's ostensibly learning how to approximate what the CAD tool (synthesis + placement) is doing very abstractly, but not actually learning that process; instead it's learning how to predict the aggregate output metrics of the end result, but without any of its original semantics. But have we really learned a *new representation* of the RTL? Can we break free of the supervised learning box with these techniques? NO!
