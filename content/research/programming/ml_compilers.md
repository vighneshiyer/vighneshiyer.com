+++
title = "ML Compilers"
slug = "ml-compilers"
date = 2025-04-05
draft = true
description = ""
+++

The space is moving so fast, no one has had time to survey it properly.
There are no systematic, fair comparisons between any two frameworks/libraries/APIs design to do the same thing.
Kernel design languages are also evolving too quickly (Triton, then cuTile, Python CUTLASS emerging at GTC 25)

- Cutlass vs thunderkittens vs triton
- Given a gemm, survey this!
- Also lower level too like raw cuda and ptx
- Also rocm
- Use a simpler kernel like saxpy

## Microkernel vs Direct Emission / Optimization Investigation

Hypothesis: The performance of both library-level kernels (e.g. BLAS operations) and operator graphs (e.g. ONNX models of ML networks) will be higher using compilers that optimize and directly emit code for the target architecture (e.g. x86, AVX, SVE, RVV) vs compilers that implement operators in terms of hand-written microkernels.

Motivation: Jerry's debate with Qualcomm people on the RISC-V mailing list about the AME ISA extension. One party argued that since existing compilers (seem) to use vendor-provided microkernels during code generation, there was no need to worry about encoding new 1D ops in AME, since all the microkernels would be rewritten anyways. Jerry argued that it's better to reuse RVV for 1D ops within the AME since compilers will generate code directly for that target. Who is right?

Preliminary investigation: Investigate how each of LA/ML compilers work internally: are hand-written microkernels used (BLIS), are they synthesized (Exo/Halide), or is optimized code emitted directly without lowering to microkernels (IREE? maybe).

Tools to evaluate:

- Autovectorized naive code (via LLVM autovectorizer)
- BLAS implementations (MKL, OpenBLAS, BLIS)
- cuDNN, cuBLAS, TensorRT
- Intel DNNL
- OpenXLA/IREE (from JAX jit/aot)
- TACO
- Halide/Exo
- TVM
- ONNX Runtime (with/without MLIR optimizer backend)
- Pytorch Glow
- TensorRT (not really suitable for evaluation since it is quite opaque)
- XNNPack
- https://onnxruntime.ai/docs/execution-providers/TensorRT-ExecutionProvider.html
- IREE
- Tinygrad
- https://onnxruntime.ai/docs/execution-providers/QNN-ExecutionProvider.html
- Runtimes
  - https://github.com/vllm-project/vllm
  - llama.cpp
- RoCm / HIP / other AMD stuff: https://rocm.docs.amd.com/projects/HIP/en/docs-develop/how-to/hip_runtime_api/hipgraph.html
- https://developer.apple.com/documentation/accelerate
- Stuff on top like ALPA and other model partitioning libraries for multi-GPU
- Stuff produced by Tenstorrent for their silicon (TT Metalium)
- How do MLIR / HLO / JAX / OpenXLA / IREE relate to each other? Very confusing.
  - https://github.com/iree-org/iree-comparative-benchmark (performance comparisons are interesting, but odd since there is so much fragmentation)
- MLPerf - probably the only attempted benchmark suite
- Triton (kernel library) + Triton (NVIDIA's inference server)
- Langchain (basically LLM wrappers and agents)
- https://arxiv.org/pdf/2502.10517
  - CuDNN, CUTLASS, Apple MLX, ThunderKittens, Triton, torch.compile, JAX JIT, FlexAttention, CuBLAS
- CUDA / OpenCL / OMP / oneAPI / Vulkan compute / SPIR-V / GLSL

> Can you search for an image that summarizes the "ML stack". I mean ML libraries like pytorch and jax and tensorflow, and then ML compilers like iree, and then low level ML routines like TensorRT and then lower level stuff like CUDA, and so forth? And sitting above the ML libraries are runtimes like onxx runtime or custom implementations of models like llama.cpp

> High-Level Frameworks and Libraries: These include libraries like PyTorch, TensorFlow, and JAX, which provide user-friendly APIs for building and training ML models.
>
> ML Compilers and Optimization Tools: Tools such as IREE and XLA optimize models for efficient execution on various hardware platforms.
>
> Low-Level Libraries and Runtimes: This layer comprises components like ONNX Runtime and custom implementations such as llama.cpp, which facilitate model execution across different environments.
>
> Hardware Acceleration Libraries: Libraries like TensorRT and cuDNN offer optimized routines for deep learning operations, enhancing performance on specific hardware.
>
> Hardware Interfaces: Technologies such as CUDA provide the necessary interfaces to leverage GPU capabilities for computational tasks.

Workloads and Benchmarks: TBD - start with specific kernels (e.g. GEMM, CONV) and move to full networks.

Platforms: x86 (+ AVX), ARM (+ SVE/SME), RISC-V (+ RVV) (I think we should exclude GPUs for now)

More generally: No one has really done a comprehensive survey and benchmark of all these random tools floating out there. It isn't clear why some perform better than others and the limitations of each framework are also hidden. Furthermore, it is not at all clear how these compilers work internally - what is the actual complexity in integrating a new piece of hardware or a new ISA extension? What optimizations can be generally applied, and which ones require hand-holding?

We want such an investigation to motivate the correct ISA-level design of RVV and AME, and eventually build an implementation and tape it out.

Prior work:

- [The Deep Learning Compiler: A Comprehensive Survey (Aug 2020, out of date)](https://arxiv.org/pdf/2002.03794.pdf)
- [Enumeration of various tensor compilers](https://github.com/merrymercy/awesome-tensor-compilers)
- [RVV support in IREE](https://medium.com/@rednoahhsu/ml-compiler-for-risc-v-vector-1960abd1626b)
  - [IREE RVV Docs](https://iree.dev/building-from-source/riscv/#optional-configuration)

Questions from Joonho:

- I'm not sure how this will result in ISA level insights though.
- For matrix operations, wouldn’t we be exposing a set of primitive operations and regardless of the compiler framework, wouldn’t it have to target these primitives?

> Another question is whether existing compilers can efficiently discover optimal blocking/unrolling strategies for mapping high level operators to low-level ISA instructions? I feel we don't really know the answer to this. And yes it also motivates new instructions based on our findings - if things are too control heavy we can move those into hardware

- I guess the question becomes: what are the correct primitives to embed as instructions.
  - Should we be using macro instructions (the hardware has fixed logic to support macro operations, kind of like the Amazon thing)
  - Should the instruction semantics be more fine-grained? If we expose fine-grained semantics, how would that affect the design of these frameworks? Would they be able to perform more aggressive optimizations via better operation interleaving?
  - Would this benefit (more freedom for compilers + simple HW implementation) surpass the benefit of macro-instructions (less instructions executed + simple compiler frameworks + compilers can be agnostic of the hardware which eliminates the need for certain optimizations such as software pipelining)?

- My gut feeling is that for linear algebra operations, the compiler should be able to generate efficient kernels by targeting fine-grained primitive operations (scalar, vector, 2D ops) as the number of operations are fairly limited, and techniques such as tiling and software pipelining are well understood.

> We need to validate that gut feeling - I'm not sure whether those kernels can be generated or if, in the end, some manual tuning is required (or outright explicit microkernels)

- Wouldn’t the higher level execution graph level optimization have a higher impact on performance than the lower level micro-kernel performance? So again, will this lead to ISA/hardware level insights? Am I missing something here? Still, I think it will lead to compiler level insights and guide us on what the current compiler frameworks are missing and how we can do better.

> High level graph optimization often will involve multicore and multi-accelerator stuff - likely there are hardware bottlenecks to resolve here. But furthermore, we don't even understand the breakdown of what optimizations contribute what to overall performance uplift - a thorough understanding will be valuable on its own

- Still a good idea to taxonomize and compare all these frameworks
  - Just for NEON, AVX, RVV, no need to even think about GPU just yet
  - Consider other NPUs / mobile DSP cores (e.g. Hexagon) too
- There are too many layers in this ML compiler stack - need to write a clean survey and comparison

baremetal ML compilers:

- Convert your model into ONNX, cross compile onnxruntime (https://onnxruntime.ai/docs/build/inferencing.html) to riscv, and run that with your model ONNX file on buildroot Linux
- One additional benefit is you can use the XNNPACK (https://github.com/google/XNNPACK) provider which has some kernels implemented for RVV
- Try to hack LiteRT (https://ai.google.dev/edge/litert) (this used to be TensorFlow lite) (https://github.com/tensorflow/tflite-micro) to run in a baremetal RISC-V setup, use spike / qemu to try this out
- You can try Yufeng's Baremetal-NN setup (https://github.com/ucb-bar/Baremetal-NN) which should be the easiest way to get model inference on RISC-V working assuming all the kernels your model uses have implemented
- You can hack microTVM (https://tvm.apache.org/docs/v0.9.0/topic/microtvm/index.html), but I have no idea how easy this will be
- You can try IREE's RISC-V baremetal backend (https://iree.dev/guides/deployment-configurations/bare-metal/), which I think Dima or Miles have played with before
