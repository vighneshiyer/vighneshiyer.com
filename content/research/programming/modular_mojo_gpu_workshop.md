- Meta's pytorch to standalone inference binary slides (attach photos here, take 4 photos from joonho, some others in yufeng thread)
  - Very useful functionality
  - How does this compare with IREE's standalone binary generation or even its baremetal binary mode?
  - It seems like this would only support forward passes

- TileIR from Nvidia seems very cool as a compiler target ir. He says there will be a mlir dialect for it as well as a python lightweight DSL for it directly. The maturity of this is quite insane, and they didn't talk about any llm codegen nonsense, just the ability to build clean abstractions and make them interop, allowing people to come into the stack at any abstraction

- Lambda labs GPUs
  - not having access to my env is so painful :(, I need to make this easier to set up
  - But the GPU spinup was quite fast, just a few minutes for an A10, easy to setup SSH keys

- https://github.com/modular/workshops/blob/main/mojo-gpu-programming/slides.md
  - The main entry point for the gpu programming tutorial
  - This is a really great reveal.js template too

## Mojo Setup

- Mojo VScode extension annoyances
  - Cursor remote SSH works just like vscode, simple extension to install and works out of the box
  - Mojo's VSCode extension is only published on the [Visual Studio Marketplace](https://marketplace.visualstudio.com/items?itemName=modular-mojotools.vscode-mojo)
  - It isn't published on [open-vsx](https://open-vsx.org/?search=mojo&sortBy=relevance&sortOrder=desc)
  - Which means it is annoying to install in Cursor. I had to download the VSIX file from vscode and load it into Cursor. Just fix this please.

- https://docs.modular.com/max/coding-assistants/
  - Very cool, there are even Cursor rules
  - But no Mojo extension on open-vsx. Please fix.

- The LSP seems a bit more limited than I would have expected.

For example

```python
from gpu import block_idx, thread_idx
from gpu.host import DeviceContext
```

If I try to 'go to definition' for any of these symbols, it doesn't work.
Aren't these definitions open source somewhere?
At least they have decent hover documentation.

Searching for symbols defined in the Mojo prelude (I think), such as `Dim`, isn't doable either.
Dot completion support is poor (e.g. try typing `Layout.` and there are no suggestions).

Consider the rendered type signature of `enqueue_function`.
The hover docs are pretty good, but still...

```python
(function) fn enqueue_function[func_type: AnyTrivialRegType, //, func: func_type, *Ts: AnyType, *, dump_asm: Variant[Bool, Path, StringSlice[StaticConstantOrigin], fn() capturing -> Path] = __init__[::Copyable & ::Movable](False), dump_llvm: Variant[Bool, Path, StringSlice[StaticConstantOrigin], fn() capturing -> Path] = __init__[::Copyable & ::Movable](False), _dump_sass: Variant[Bool, Path, StringSlice[StaticConstantOrigin], fn() capturing -> Path] = __init__[::Copyable & ::Movable](False), _ptxas_info_verbose: Bool = False](self, *args: *Ts, *, grid_dim: Dim, block_dim: Dim, cluster_dim: OptionalReg[Dim] = OptionalReg[Dim]({:i1 0, 1}), shared_mem_bytes: OptionalReg[Int] = OptionalReg[Int]({:i1 0, 1}), owned attributes: List[LaunchAttribute] = List(, Tuple()), owned constant_memory: List[ConstantMemoryMapping] = List(, Tuple()), func_attribute: OptionalReg[FuncAttribute] = OptionalReg[FuncAttribute]({:i1 0, 1})) raises
```

I get that this needs to be complex, but this reminds me of the [Scala collections "CanBuildFrom" pain](https://www.scala-lang.org/blog/2017/05/30/tribulations-canbuildfrom.html).
The user shouldn't see this, ideally.

The Mojo runtime setup is quite easy.
Just use a `pixi.toml`:

```toml
[workspace]
channels = ["https://conda.modular.com/max-nightly", "conda-forge"]
name = "quickstart"
platforms = ["linux-64"]
version = "0.1.0"

[tasks]

[dependencies]
max = ">=25.5.0.dev2025062705,<26"
```

## First Impressions

### The First Kernel

```python
from gpu import block_idx, thread_idx
from gpu.host import DeviceContext

fn print_threads():
    print("Block index:", block_idx.x, "\t", "Thread index: ", thread_idx.x)

def main():
    # create device context
    ctx = DeviceContext()
    # GPU kernel launches asynchronously - doesn't block Host (CPU)
    ctx.enqueue_function[print_threads](grid_dim=2, block_dim=1024)
    # synchronize Host thread with GPU
    ctx.synchronize()
```

Running this is easy: `pixi run mojo main.mojo`.
It just worked, no problems.

Playing with the `block_dim` is instructive: you can see how threads within a block are launched in warps of 32 contiguous threads.
If you increase the `block_dim` past 1024 however, you get an error.

```text
ubuntu@129-80-173-179:~/quickstart$ pixi run mojo main.mojo
Unhandled exception caught during execution: At open-source/max/mojo/stdlib/stdlib/gpu/host/device_context.mojo:1965:21: CUDA call failed: CUDA_ERROR_INVALID_VALUE (invalid argument)
/home/ubuntu/quickstart/.pixi/envs/default/bin/mojo: error: execution exited with a non-zero result: 1
```

OK, I know this is supposed to fail since the number of threads in a block can't exceed 1024 on NVIDIA GPUs.
But the error isn't what I expected - Mojo should do some basic parameter checking before directly invoking the low-level CUDA API which has bad error messages.

Looking from a higher level however, all that's going on in this tiny example _is impressive_.
There is a per-thread kernel that's defined in this completely custom Mojo language, which supports what seems like arbitrary (non-dynamic) Python logic, including thread-level `print`s!
Getting a fully custom language with a full custom type system and LSP support working is a herculean task.

How does the compiler stack work?
For the GPU kernel function, are we going from Mojo -> MLIR (and which dialect?) -> C CUDA code -> nvcc -> object file (and then this is loaded dynamically by the Mojo runtime).
Or does Mojo / MLIR elide emission of CUDA altogether and instead emits PTX?

The details that would let me understand the limitations and performance implications of the programming model aren't presented up-front, and are quite hidden from sight.
This seems good for kernel engineers until they have to contend with some unsupported or poorly performing construct without the knowledge of the compilation flow and its limitations.

### GPU Programming

- Mojo GPU Puzzles
- https://github.com/modular/mojo-gpu-puzzles

I'm vaguely familiar with CUDA, so working with Mojo feels very much like CUDA in Python.
The LayoutTensor abstraction is nice, albeit a bit verbose.

In general, GPU programming with explicit casting of grids and blocks, seems very unnecessary (to my untrained eye).
How it is possible that these low-level hardware-oriented abstractions haven't been superceded by now?
Why I can't I just describe my per-thread kernel and have the grid/block dimensions chosen by the compiler? Well, these new "tile-oriented" DSLs do indeed go in that direction (Triton, NVIDIA Tile IR).
Why do I have to muck with guards to prevent out of bounds access if I can control the grid/block casting?

My perspective may be skewed by only looking at BLAS2 functions so far and my opinion may change as I play with matmul in Mojo.

I do worry about the future of Mojo considering that NVIDIA is investing so deeply into the Python eDSL ecosystem and CUDA integration.
The CUTLASS Python eDSL + the Python CUDA low-level eDSL are quite hard to beat.
