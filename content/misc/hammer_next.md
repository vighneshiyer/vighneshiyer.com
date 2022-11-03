+++
title = "Ideas for HAMMER's Next API"
date = 2022-09-05
+++

I've already written about SiliconCompiler and mflowgen in my [DAC 2022 review](@/conference_reviews/dac_2022.md#cad-flow-tools) and what I think the good parts of each tool are.
In this document I'll try to integrate those good parts into what the next-generation API for HAMMER should look like.
To be clear, HAMMER's code base as it exists is valuable and nearly all the core code has to be preserved, however I think the 'wrapper' around that core should incorporate learnings from these other CAD flow tools.

- [Hammer meeting notes](https://docs.google.com/document/d/1nFXj-F26YS9GGl0igWOnuv0uaLlI9wcTRfKYwjU3S4k/edit#)
- [Harrison's SiliconCompiler Review](https://docs.google.com/presentation/d/1TwwHfEv5FyEZyY0Wwj8M4ltuM14dNI93JDCWACtDDA0/edit#slide=id.p)

## HAMMER Today

Currently, HAMMER has abstractions to split tool, PDK, and design specific concerns.
There is a global key-value store (the HAMMER database) which holds data about which tools, PDK, and design is being worked on by the HAMMER driver - this store is initialized by a user-provided JSON/yaml file or using the emitted database from a run of a CAD flow step.

HAMMER tools are defined by a sequence of steps, where each step represents some major step within a CAD tool invocation (e.g. read Verilog, synthesize clock tree, perform power opt, etc.).
Each step usually emits some TCL that operates with the tool's context.
After each step, it is customary to write out a design database so each intermediary step can be inspected manually.
The design database can also be used to restart tool execution from a given step, after having modified the subsequent steps.

The PDK and design specific concerns are allowed to bleed into the tool TCL emission by the use of 'hooks' whereby a PDK or design can register functions that do something (usually emit TCL) between existing tool steps, or replace a tool step entirely.

So the abstractions used by HAMMER today are:

- Tool: tool types (synthesis, drc, pnr) are specified explicitly and their schemas
- Technology: each technology (PDK) specifies its libraries and other tech specific metadata
- Database: a global key-value map that is used to represent a state of execution
- Hooks: a function injection mechanism that a technology or design can use to influence tool TCL emission

A practical note: while tool types are abstracted away and in theory you could, for instance, swap one synthesis tool for another, practically this is very difficult and not done during a tapeout.
Furthermore, benchmarking commercial tools against each other is verboten anyways.

## Fundamental Abstractions

Let's start from first principles, build in HAMMER's abstractions, and see where we can slot in ideas from the other tools.

At its core, a CAD flow tool is a set of data schemas and functions to transform one schema to another by invoking a CAD tool, script, or Python function.
For example, we can define a naive flat synthesis operation like this (details are left out):

```python
class SynInputs():
    rtl_files: List[Path]
    constraint_files: List[Path]
    top_module: str
    cg_mode: Enum{Auto, Empty}
    ext_libraries: List[Library]
class SynOutputs():
    mapped_netlist: Path
    output_constraints: Path

class PDK(abc):
    libraries: List[Library]
class ASAP7(PDK):
    pdk_root: str
    libraries = # existing logic

class Env():
    envvars: Dict[str, str]
    submit_option: Union[LSFConfig, LocalConfig]

class SynthesisTool(abc):
    def run(i: SynInputs, p: PDK, env: Env) -> SynOutputs:
        raise NotImplementedError
class GenusTool(Synthesis):
    tool_home: Path
    genus_special_option: str

def run_synthesis(i: SynInputs, p: PDK, env: Env, s: SynthesisTool) -> SynOutputs:
    os.call(s.tool_home) # ...
```

We can use this by just instanting the data schemas we need to call `run` and then call `run`.

```python
env = Env(envvars={"CDS_LIC_FILE": "asdf@flexlm.thing.com"}, submit_option=LocalConfig)
pdk = ASAP7(
```

### What About PDK Setup / Hacks?

### What About Steps?

### What About Hooks?

#### Design to Tool Hooks

#### PDK to Tool Hooks

## Python-First Data Structures

Already done by SiliconCompiler, but wrongly IMO (stringly typed, IDE not usable, schema defined separately from Python code, dependencies of a function are unknown without scouring through source).
Use python to set configurations. Get rid of meta-language inside yaml.

## Non-Monolithic (Modular) Flow Construction

- Get rid of tool types as a meaningful abstraction to be fed into the top-level command line

## Build Tool "Integration"

- mflowgen param space sweeping: https://mflowgen.readthedocs.io/en/latest/ug-param-space.html

- language-specific vs general purpose
- frontend vs build backend (ninja)
- recursive / dynamic depdendencies vs strict DAG dependencies (w/ some restrictive looping operators?)
- custom language vs embedded in another language

Be able to describe a build graph either using or outside of hammer itself. We should consider: doit, scons, siliconcompiler, ...
Take inspiration from: make, bazel, mill, waf

- Shake is a build system that supports recursive dependencies (also see [wake - Sifive](https://github.com/sifive/wake))
    - https://shakebuild.com/manual
    - [Shake Before Building: Replacing Make with Haskell - Slides](https://pdfs.semanticscholar.org/309f/beaa395906cd5c5554f8e3b5742f17656a22.pdf)
    - [Shake Before Building: Replacing Make with Haskell - ICFP 2012](https://ndmitchell.com/downloads/paper-shake_before_building-10_sep_2012.pdf)
    - [Non-recursive Make Considered Harmful - Haskell 16](http://simonmar.github.io/bib/papers/shake.pdf)
- Microsoft's comprehensive survey of build systems and a unified theory for them: [Build Systems à la Carte: Theory and Practice (2020)](https://www.microsoft.com/en-us/research/uploads/prod/2020/04/build-systems-jfp.pdf)

https://calyxir.org/post/one-year/
https://docs.calyxir.org/fud/index.html

## Remote Execution

Consider using Ray's remote execution model or look to bazel too.
- See the Ray Task / Core API
    - See how to add environment dependencies to Ray's remote execution model: https://docs.ray.io/en/latest/ray-core/handling-dependencies.html


<details>

<summary role="button" class="secondary">Ray for VLSI CAD Flow Remote Execution and Parameter Sweeps (IBM)</summary>

- https://www.anyscale.com/events/2022/06/23/ray-community-talks-june-22-2022 (+ youtube link to the talk)
    - Slides: https://speakerdeck.com/anyscale/ml-infused-digital-ic-design-workflows-on-the-hybrid-cloud

> Abstract: As the complexity of modern hardware systems explodes, fast and effective design space explorations for better integrated circuit (IC) implementations is becoming more and more difficult to achieve due to higher demands of computational resources. Recent years have seen increasing use of decision intelligence in IC design flows to navigate the design solution space in a more systematic and intelligent manner. To address these problems, we have been working on AI/ML-infused IC design orchestration in order 1) to enable the IC design environment on hybrid cloud platform so that we can easily scale up/down the workloads according to the computation demands; and 2) to produce higher quality of results (QoRs) in shorter total turnaround time (TAT). In this work, we will illustrate how we provide a scalable IC design workload execution that produces higher performance designs by utilizing AI/ML-driven automatic parameter tuning capability. We first demonstrate that we can build a cloud-based IC design environment including containerized digital design flow on Kubernetes clusters. Then, we extend the containerized design flow with the automatic parameter tuning capability using AI/ML techniques. Finally, we demonstrate that the automatic parameter tuning can be executed in a more scalable and distributable manner using the Ray platform. We will use the actual design environment setups, the code snippets, and results from the product IC designs as evidence that the proposed method can produce a higher quality of IC designs using the Ray-based automatic parameter tuning methodologies.

- They want to run a single block through CAD tools with different flow parameters (e.g. where to route clock grid, effort levels, various tool tweak options) and they want this done in parallel, automatically distributed throughout their cluster
- They have custom Docker images that contain their toolchains, networked filesystems for local workspaces/PDKs, and Ray to manage execution of jobs on their Kubernetes cluster
- CI/CD pipeline using containerized flow: Jenkins pod to launch jobs on checkins, Centos worker pods, MongoDB metrics collection pod, Flask dashboard pod
- They have an ML-based "FlowTuner" which receives the design space of flow parameters, has a search algorithm, and tries to find the best tool config by executing a bunch of jobs
- EXAMPLE: floorplan dimension sweeping - for a new design checkin, sweep floorplans from large to small to see the critical point where density is optimized and critical path is reasonable and PnR tool terminates successfully
    - See slide 20: for example Ray remote usage - the remote function just invokes a Makefile
    - They don't use Ray to partition out build steps, but rather just for invoking a full RTL->GDS flow on a many nodes (with different flow parameters) with remote function invocations

- Blog post writeup of the same content: [Infusing AI and ML into integrated circuit design for faster chip delivery, better chip performance (IBM)](https://www.anyscale.com/blog/infusing-ai-and-ml-into-integrated-circuit-design-for-faster-chip-delivery)

</details>
