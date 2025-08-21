+++
title = "A Brief History of Gemmini"
date = 2025-07-01
draft = true
description = "A retrospective on what was once the 'Berkeley Systolic Array Generator'"
+++

## Links

- The first commit
  - 290244d5dc34305d07ff7dfcc5c961b8d9583390
  - https://github.com/ucb-bar/gemmini/commits/master/?since=2019-01-01&until=2020-01-01&after=8f5157868feecc97f6a153481720a727b082208e+244
  - https://github.com/ucb-bar/gemmini/commit/290244d5dc34305d07ff7dfcc5c961b8d9583390#diff-439e5e8f82923a4a61d6b00ae2f29111c13a9456f3f3954474f6813c1b0793f9
- RTML chip recap (Jan 24): https://docs.google.com/presentation/d/1w-WLtpAakNUO5KHDXzejCWPdX58r3cmu/edit?slide=id.p3#slide=id.p3
  - Integer + FP Gemmini with local scratchpad memories, partitioned LLC, ReRoCC
- HW for ML (Aug 19): https://drive.google.com/file/d/11SsnwGm96C50B1ZkzOS-1y0kDhnXWRy3/view
  - Still in the ImageNet era, interest in structured sparsity but ill-defined, small systolic arrays (https://mlforsystems.org/assets/slides/isca2019/MLforSystems2019_HT_Kung.pdf), chiplets, federated learning / differential privacy (but not a hardware focus)
- RTML meetings: https://docs.google.com/document/d/1Yg77SfwJl7-HjURDhCBijtmQEDhHnb3UxsBkkp-OzJM/edit?tab=t.0
  - JRK was at one point quite interested in very flexible, software-driven data injection/exfiltration from the systolic array to support arbitrary sparsity schemes. The Tenstorrent arch today leans much more in this direction compared to the Rocket + Gemmini over RoCC with coherent DMA one.
  - Limitations of host processor issue bandwidth preventing Gemmini from hitting maximum utilization (not present with VTA, which also doesn't require a host core to simulate the execution of a DNN)
  - Energy tradeoffs of scalar cores vs systolic arrays (and different dataflows)
  - JRK: avoid making a loop-processing machine that too closely resembles yet another processor, whatever 'loop' CISCy instruction we have should be generalized however
    - We spent quite a bit of time adding these loop instructions to eliminate issue bandwidth limitations, but this always seemed like the wrong approach
  - im2col unit in hardware rather than having the scalar core do it (back when CNNs were still very common)
  - Making sure the spike model and Gemmini RTL stay in sync is pretty tough
  - Some notes on event-driven programming, but this didn't go anywhere
  - Work on getting onnx runtime working with the gemmini backend, this eventually got relatively mature for an academic compiler
  - Looking at other ML accelerators at the time: Alibaba's NPU, MediaTek DLA, KAIST's GANPU (as GANs were becoming popular)
  - HW optimizations like banking the accumulator and avoiding scratchpad bank conflicts, increasing utilization with maximum overlapping of compute and data movement
  - Communication between Hwacha (since deprecated) and Gemmini was discussed (L2 cache comm with flushing, direct Hwacha access to Gemmini scratchpad, memory map the Gemmini scratchpad)
  - Issues with fencing causing too coarse grained synchronization boundaries and excessive stalls
  - Accelerators often require page pinning, but devs want to avoid this and use Linux without special hacks, should accelerators just be exposed as functional units without their own managed memory space?
  - How do we handle interrupts and saving accelerator context if the accelerator is core-coupled?
  - How should memory be handled? Should acc-to-acc memory streaming be permitted?
  - Quantization and INT4/8 support
- Gemmini CHANNA/RTML (Feb 21): https://docs.google.com/document/d/1OMHfYd0N9a3z9673eBd7QU0WxmrhkZ3olutznEgrSa0/edit?tab=t.0#heading=h.9c8dmbj9iscr
  - Compiling Hardware Neural Net Accelerators
  - TensorFlow, Caffe2, Pytorch -> ONNX -> compiler -> Gemmini target
  - Demonstrate 'flexible' DNN accelerator generator with full stack approach, compiler, OS, runtime, cache-coherent virtual memory system
  - 3 level sw stack: onnx models, C++ API, asm intrinsics
  - NNs: CNN (ResNet50, Googlenet, Mobilenet), NLP (BERT)
- Briefs
  - Jan 2020: https://docs.google.com/presentation/d/1KTR_f396G2QnDG7tx0HuVQevwjwo-3re/edit?slide=id.p1#slide=id.p1
    - Mostly about the feature set, open sourcing, ImageNet models and benchmarking, ONNX runtime hacking, layer fusion and quantization, Chipyard integration
  - Jan 2021: https://docs.google.com/presentation/d/1Wi4pbuhtA9U1_dwB7gAmM3WYxgZSvSBg/edit?slide=id.p1#slide=id.p1
    - FP scaling, mixed fixed-point, DAC paper, PPA optimization, CISC instructions for conv/matmul, double-buffering in HW, 22 FPS on ResNet50
- Accelerator integration slides (April 20): https://docs.google.com/presentation/d/1sRqRnGpJCRmm348kSuKZUse6tvMCGavd/edit?slide=id.p6#slide=id.p6
- More RTML decks
  - June 20: https://docs.google.com/presentation/d/10vfsixbzHFGD257aoGjAcZAzgYG2sA7Y/edit?slide=id.p1#slide=id.p1
  - April 21: https://docs.google.com/presentation/d/1zcubSJzYfmv_4L-wE6DlkHkSd_rx8oO9/edit?slide=id.p7#slide=id.p7
  - Oct 21: https://docs.google.com/presentation/d/1_41AOg6fx_ecrzDu4C1NIJsb6dRhF4qz/edit?slide=id.gf9a11dfffa_0_497#slide=id.gf9a11dfffa_0_497
  - March 22: https://docs.google.com/presentation/d/1nIjaQHb74T3MnsA6ozaTfroBVsVKDVIF/edit?slide=id.gf9a11dfffa_0_497#slide=id.gf9a11dfffa_0_497
  - Dec 22: https://docs.google.com/presentation/d/15xp5XBI-8tmVUj8bjUHGiYzlOnk70BeV/edit?slide=id.gf9a11dfffa_0_497#slide=id.gf9a11dfffa_0_497
    - Exo PLDI paper, better perf vs NVDLA (but still worse)
    - Multi-tenancy (MoCA)
  - July 24: https://docs.google.com/presentation/d/1-wQ4mBUQLGuNB2th-qfE6fIGKXgd6WoY/edit?slide=id.gf9a11dfffa_0_497#slide=id.gf9a11dfffa_0_497
    - Transformer (BERT) support, layernorm/softmax support, WIP sparsity DSL for what would become Stellar, Constellation NoC

## Story

- The alexnet moment, image dataset, yolo for segmentation, resnet era, CNN era
- Eyeriss, diannaonet, TVm vta, nvdla open sourcing
- Dataflow is overrated paper, dataflow was all the rage so we made the dataflow runtime comfortable
- Im2col, convs were all the rage and we wanted to quickly adapt a Gemmini arch into a conv engine
- Used as a perf benchmark and as a dse target just like boom, using some parameters fiddling with Bayesian optimizers or rl, very classic and braindead work
- Hpca submission and then DAC best paper
- Overused in many bad ways just like watch mcpat, timeloop maestro, gem5 sst
- Started around when Sophia came to Berkeley, off the heels of Simba and magnet at nvidia
- The ability to maximize re-use was critical for energy efficiency for the cnn era, but is less important today. differences between inner product machines like nvdla and systolic arrays and today, outer product engines. all designed for different tradeoffs of energy efficiency, throughput, area efficiency, programming model, ISA, scheduling difficulties
- A chance to showcase early chipyard, rocc, rocket chip, firesim, the selling point was full system evaluation
- Rocc integration turned out more complicated than desired. Same with memory integration requiring cache flushed and coarse grained core synchronizarion. Needed out of order execution within Gemmini which was sometimes buggy
- Chisel with scala type parameterization and type classes for new data types was quite cool and unlike what is easy in verilog or other language
- Ht.kung, small systolic arrays
- CRAFT / RTML / CHANNA
- The 3 layer programming stack, at the time this was not common or exposed for an open ml "accelerator"

- Hardware lottery is false. Lessons:
  - The systolic arrays shouldn't be treated as an accelerator in its own right but rather part of a datapath
  - Look at Blackwell, the systolic arrays has its own memory, allocation scheme, and async dispatch and synchronization primitives
  - Look at modern LLMs like deep seek and notice how calling everyrhing "attention" and "transformers" is misleading, there is so much intervening control flow in both the model execution as well as data movement and cross gpu and also on the inference stack optimizations
  - Look at the tenstorrent arch, that is the reference standard imo, combine benefits of streaming data flow as well as host directed kernel launches on the same die, maximum flexibility is needed for maximum performance ironically enough
