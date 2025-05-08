+++
title = "Notes on Build Systems"
date = 2024-04-18
draft = true
slug = "notes-on-build-systems"
+++

## Features of Build Systems

- language-specific vs general purpose
- frontend vs build backend (CMake vs ninja)
- recursive / dynamic depdendencies vs strict DAG dependencies (w/ some restrictive looping operators?)
  - basically are monadic dependencies supported?
- custom language (e.g. Make, ninja) vs embedded in another language (Shake, mill)
- If you can only read one paper:
  - Microsoft's comprehensive survey of build systems and a unified theory for them: [Build Systems à la Carte: Theory and Practice (2020)](https://www.microsoft.com/en-us/research/uploads/prod/2020/04/build-systems-jfp.pdf)

## Build Systems in the Wild

- Be able to describe a build graph either using or outside of hammer itself. Look at siliconcompiler or mflowgen
- Take inspiration from: scons, doit, make, bazel, mill, waf (this seems quite nice compared to SCons, but the same high-level idea)
- **Shake** is a build system that supports recursive dependencies (also see [wake - Sifive](https://github.com/sifive/wake))
    - https://shakebuild.com/manual
    - [Shake Before Building: Replacing Make with Haskell - Slides](https://pdfs.semanticscholar.org/309f/beaa395906cd5c5554f8e3b5742f17656a22.pdf)
    - [Shake Before Building: Replacing Make with Haskell - ICFP 2012](https://ndmitchell.com/downloads/paper-shake_before_building-10_sep_2012.pdf)
    - [Non-recursive Make Considered Harmful - Haskell 16](http://simonmar.github.io/bib/papers/shake.pdf)
- The Tup build system: https://gittup.org/tup/lua_parser.html
- Buck2: https://www.reddit.com/r/cpp/comments/12e352j/buck2_our_open_source_build_system/
- **Calyx FUD** "build system" - really more like a execution manager
  - https://calyxir.org/post/one-year/
  - https://docs.calyxir.org/fud/index.html
- **Buck2** (https://news.ycombinator.com/item?id=35470371) (https://engineering.fb.com/2023/04/06/open-source/buck2-open-source-large-scale-build-system/)
    - "Paper: Implementing Applicative Build Systems Monadically" (https://ndmitchell.com/downloads/paper-implementing_applicative_build_systems_monadically-01_jan_2022.pdf)
    - Buck supports a form of 'dynamic' dependencies where runtime outputs of a task determine future tasks
    - Remote execution with BuildBarn
    - Concepts: https://buck2.build/docs/concepts/concept_map/
- [Zig's build system](https://en.liujiacai.net/2023/04/13/zig-build-system/)
    - Zig's build system is built on `steps`, and is quite like an explicit execution graph
- Nix/Guix as a build system
  - sequencer or someone related seems to like this for RTL simulator building
- Profiling via traces (https://profiler.firefox.com/) (chrome://tracing)
- This article about "Build systems a la carte" https://nikhilism.com/post/2020/type-classes-build-systems/, linked three good resources on monads and applicatives
    - https://books.thoughtbot.com/assets/maybe-haskell.pdf (Maybe Haskell - a simple Haskell intro to monads)
    - What I wish I knew when I was learning haskell (https://web.archive.org/web/20210804002352/http://dev.stephendiehl.com/hask/#eightfold-path-to-monad-satori) - see the chapter on Monads
    - Applicative: Functional Programming with Effects (http://www.staff.city.ac.uk/~ross/papers/Applicative.pdf)
- Also lots of interesting stuff about Buck2 here https://news.ycombinator.com/item?id=35470371

> In plainer language, I'd say the observation/motivation is that not only do compiling and linking benefit from incrementality/caching/parallelism, but so does the build system itself. That is, the parsing of the build config, and the transformation of the high level target graph to the low level action graph.
>
> So you can implement the build system itself on top of an incremental computation engine.

>  Pants v2 supports dependency inference in a manner similar to what you’re hypothesising. It indeed can benefit from the general caching mechanism. https://blog.pantsbuild.org/why-dependency-inference/
    - very cool, similar to wake

>  I feel so lucky that I found waf[1] a few years ago. It just... solves everything. Build systems are notoriously difficult to get right, but waf is about as close to perfect as you can get. Even when it doesn't do something you need, or it does things in a way that doesn't work for you, the amount of work needed to extend/modify/optimize it to your project's needs is tiny (minus the learning curve ofc, but the core is <10k lines of Python with zero dependencies), and doesn't require you to maintain a fork or anything like that.

> The Python -> Starlark change was made because the build scripts need to be completely hermetic and deterministic. Starlark is reusable outside Bazel/Buck precisely because other projects want that same hermeticity and determinism.

- Supporting phony tasks in Buck/Bazel seems a bit iffy - for example we need to spawn a JVM so we can invoke scalac running on the same JVM multiple times - there is necessarily some non-hermeticism here
- Using a limited language for build scripting seems interesting, but adds a bunch of complexity with maintaining an interpreter and type system for a completely new language! I still think that using eDSL approaches is better here, but perhaps a pure functional language (e.g. Haskell) is necessary to ensure hermetic build scripts. I think Scala could work here too.
    - In a similar vein, I think that both John de Goes and Li Haoyi are right. de Goes is right that most people want a declarative build specification that a IDE/tool can read and modify cleanly (similar to Rust's `cargo.toml` or Python's `pyproject.toml` or node's `package.json`). The issue Haoyi brings up is that there is almost some type of customization required in a complex build, and having to do that via brittle and often unmaintained plugins in a limited language is often too difficult and breaks some of the assumptions of declarative builds. Perhaps we can combine them with a declarative Scala-specific front-end to Mill (the issue being that Scala classes can't be programmatically declared, so macros will have to be used). Also, coming to an agreement about the declarative build file format, is a massive bikeshedding exercise, that's probably best to avoid.
    - The why behind starlark: https://blog.bazel.build/2017/03/21/design-of-skylark.html
- Might be useful to see how ccache works: https://ccache.dev/manual/4.8.html#_how_ccache_works
- **SiFive Wake** https://github.com/sifive/wake
    - dependent jobs (monadic builds)
    - dependency analysis - overspecification and underspecification of build inputs/outputs is an ERROR! wake uses Linux mechanisms to observe the files opened and written by the binary being invoked as part of a build step, so it knows when dependencies aren't specified correctly
        - overspecification is OK, but wake will catch it and prune the unused dependencies
    - build database - wake creates a database that tracks what is done very carefully - you can always query a particular file to know how it got there, or to know what depends on it (at least in the first stage before monadic dependencies)
    - automatic parallelism extraction (comes for free almost)
    - shared build cache (similar to cloud shake - all build artifacts are cloud cached with keys), it is unclear what build variables are hashed (e.g. kernel version, OS, dynlibs + versions, scala/python versions, etc.) - it seems like most of these should be part of the build artifact key, but that could cause unnecessary rebuilds! how does bazel handle this?
- https://yzena.com/2024/03/build-system-schism-the-curse-of-meta-build-systems/ (Build System Schism - The Curse of Meta Build Systems)
  - HN link: https://news.ycombinator.com/item?id=39754770
  - Very good article, make the same case I have also made - build systems must be E2E and very intelligent at the first interpreter level (not multi-stage metaprogramming)

> The only E2E build systems that I know of that can do this (monadic dependencies) in a general way are Shake and Buck2.

- https://neilmitchell.blogspot.com/2021/09/reflecting-on-shake-build-system.html

## Remote Execution Systems

- Build systems orchestrate builds locally but can the build steps can potentially use remote resources (including caches or just build farms)
  - Bazel has something built in for this... but not sure how external dependencies are handled (https://bazel.build/remote/rbe)
- Consider using Ray's remote execution model or look to bazel too.
- See the Ray Task / Core API
  - See how to add environment dependencies to Ray's remote execution model: https://docs.ray.io/en/latest/ray-core/handling-dependencies.html
  - https://docs.ray.io/en/latest/ray-overview/index.html
  - https://docs.ray.io/en/latest/ray-core/tasks.html

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

- [Skypilot](https://skypilot.readthedocs.io/en/latest/examples/grid-search.html)
  - Uses ray under the hood, but handles all the VM provisioning stuff and cloud selection for you (cost optimized)
  - https://github.com/skyplane-project/skyplane (Skyplane for fast and optimized inter-cloud and local to cloud data transfers)
- https://taskflow.github.io/taskflow/index.html (See the taskflow API and C++ library)
- https://docs.google.com/presentation/d/10Jyh6np4DO-ummqD2Wgygigby2q3z8RTOwI-fCPaSRo/edit?usp=sharing
    - See prefect, airflow, luigi as python dataflow pipeline orchestration tools
    - How do these fit alongside a build system and caching system?
    - Also how do we support remote execution explicitly via slurm/GCP, etc.

## Thread from a Long Time Ago

Batten: What do people think about wake? https://github.com/sifive/wake Just learned about it ... has anyone tried it? Any cool ideas that can be incorporated into Hammer? It does mention "shared build caching" which seems super cool ... I was chatting with someone that said SiFive uses wake as a flow tool for chip tapeouts ... but maybe not ... not sure ... (edited)

Me:

I like a lot of its features. It seems similar to cloud shake in capabilities. I don't like that they created a new scripting language
Executing binaries using strace to capture the files it opens and then pruning dependencies based on that is very smart
Several things that still need to be addressed: environment setup (i.e. conda, nix, guix), remote execution with environment cloning (i.e. lsf, slurm), dealing with persistent/stateful resources (e.g. programming FPGAs)

Batten:

The strace thing could be very useful in chip design flow tools since each step can often read/write so many different files. It is very hard to capture all of those dependencies precisely which is critical for enable robust caching ...
reminds me of fabricate: https://github.com/brushtechnology/fabricate

Me:

strace thing would also be useful for rtl simulation in chipyard. Dependencies are definitely overspecified in the makefile causing a lot of redundant work in some cases
Fabricate looks cool, the question of which language to embed the build system in is tough to settle on
Or whether it is better to use a shrinkwrapped language like Starlark

Batten: Python

YABSL = yet another build system language
99% sure that for any YABSL, someone will pretty soon need to write some python code to generate build scripts in the YABSL

Me:

I think we can agree that creating a new language for build descriptions is a bad idea - embedding build systems in a general purpose language is the better strategy
But google does make a good case for bazel/buck2 + starlark

Batten:

ha: https://blog.bazel.build/2017/03/21/design-of-skylark.html
"The project Blaze (later open-sourced as Bazel) was started in 2006. It used a simple parser to read the BUILD files (supporting only function calls, list comprehensions and variable assignments). When Blaze could not directly parse a BUILD file, it used a preprocessing step that ran the Python interpreter on the user BUILD file to generate a simplified BUILD file. The output was used by Blaze."

I was chatting with someone at Google today and they said using bazel for chip design was not great

Me: What were the challenges they faced? Was the build cache just ineffective? Was writing build rules in Starlark too annoying?

Batten: I didn't push too hard but it might be worth trying to talk to some chip design folks at Google about their experiences and see what the Hammer team can learn from their experiences

Me: I agree, this would be a great idea. We can benefit from a better build system even outside the vlsi flow context though - the current chipyard makefile/sbt setup can be improved

jz:

+100 for trying to avoid YABSL.
Currently, our world (Chipyard/Firesim/Hammer) is SBT + Makefiles + Python, which I like to think is at least much more approachable to new users compared to the alternatives
IMO past proposals to switch to alternative build/packaging (Mill/Nix/Wake), have all failed because YABSL is a huge barrier to entry.

Kevin:

There is a build system that uses Python for all its build files but is extremely slow in its dependency resolution: SCons
Alos :laughing: @ google hw teams struggling with bazel. I don't remember all the details, but when Google was trying to use Chisel in 2017, I think they ended up forking it - among other reasons - to make it work with Bazel.
Some googlers (and maybe others) are also working on: https://github.com/hdl/bazel_rules_hdl

- Need to write about mill and bazel/buck2 and wake. Is the dependency pruning that wake can do actually useful? Does dependency catching that wake can do actually a problem for mill? Nix based builds seem interesting since they capture the environment as well as the build targets.
