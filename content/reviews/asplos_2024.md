+++
title = "ASPLOS 2024"
date = 2024-05-02
draft = true
slug = "asplos-2024"
+++

## Ultra impressive XiangShan tutorial

- https://xiangshan-doc.readthedocs.io/zh-cn/latest/tutorials/asplos24/
- https://github.com/OpenXiangShan/XiangShan-doc/blob/main/tutorial/20240302-HPCA24-2-Microarchitecture.pdf
- https://github.com/OpenXiangShan/XiangShan/tree/master/scripts/top-down#Top-down-Analysis-Tool
- They built tons of infra and tools
  - Of note: their cosimulation infra NEMU and how it coupled with RTL simulation to produce golden expected commits is very impressive - they have figured out the entire set of events to propagate from RTL sim to their functional sim to ensure lockstep synchronization
  - NEMU also supports checkpoints in their special checkpoint format (just a binary containing the DRAM contents + some startup code to set arch state)
    - This does have downsides - polluted DRAM state (from the init routine), some startup time, large binaries instead of using compressible (diff-based) DRAM contents, inability to seed uarch state, inability to specify how the arch state gets set (e.g. which physical register gets mapped to which arch register during init)
    - But it has a big upside - the checkpoint can be **uniformly consumed** by functional and RTL simulation

## Takeaways from LATTE

## Weird Stuff in CompArch "Research"

- HotEthics, YArch weird stuff - the field is going into an odd status-seeking and virtue-signaling hole
- Even elite people like Lieven are doing this kind of weird stuff nowadays
- Consider the broader context - does this work really matter? Who is pushing this stuff? Why? Does it advance our field?

## ASPLOS Best Papers (In My Opinion)
