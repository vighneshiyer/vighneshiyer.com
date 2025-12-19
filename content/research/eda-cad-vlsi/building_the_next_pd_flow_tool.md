+++
title = "The Next PD Flow Tool"
date = 2023-03-01
aliases = ["misc/hammer-next"]
draft = true
slug = "the-next-pd-flow-tool"
+++

I've already written about SiliconCompiler and mflowgen in my [DAC 2022 review](@/research/events/2022-06-dac/index.md#open-cad-flow-tools-session) and what I think the good parts of each tool are.
In this document I'll try to integrate those good parts into what the next API iteration for Hammer (or a VLSI CAD build flow tool in general) should look like.
To be clear, Hammer's code base as it exists is valuable and nearly all the core code has to be preserved, however I think the 'wrapper' around that core should incorporate learnings from these other CAD flow tools.

- [Hammer meeting notes](https://docs.google.com/document/d/1nFXj-F26YS9GGl0igWOnuv0uaLlI9wcTRfKYwjU3S4k/edit#)
- [Harrison's SiliconCompiler Review](https://docs.google.com/presentation/d/1TwwHfEv5FyEZyY0Wwj8M4ltuM14dNI93JDCWACtDDA0/edit#slide=id.p)

## Hammer Today

Currently, Hammer has abstractions to split tool, PDK, and design specific concerns.
There is a global key-value store (the Hammer database) which holds data about which tools, PDK, and design is being worked on by the Hammer driver - this store is initialized by a user-provided JSON/yaml file or using the emitted database from a run of a CAD flow step.
The Hammer database has a priority for what value is returned when queried with a key: tool values are overridden by PDK values, which are overridden by design values, which are overridden by runtime values.

Hammer tools are defined by a sequence of steps, where each step corresponds to an action within a CAD tool invocation (e.g. in the case of synthesis: read Verilog, elaborate, techmap, synthesize clock tree, perform power opt, etc.).
Each step emits a TCL fragment, and all the fragments are concatenated to build a complete TCL script which is passed into the CAD tool.
In each step's TCL fragment, it is customary to write out a design database so each step's output can be inspected manually.
The design database can also be used to restart tool execution from a given step, after having modified the TCL produced by the subsequent steps.

The PDK and design specific concerns are allowed to bleed into the tool TCL emission by the use of 'hooks' whereby a PDK or design can register functions that do something (usually emit TCL) between existing tool steps, or replace a tool step entirely.

So the abstractions used by Hammer today are:

- Tool: tool types (synthesis, drc, pnr) are specified explicitly and their input/output schemas
- Technology: each technology (PDK) specifies its libraries and other tech specific metadata
- Database: a global key-value map that is used to represent a state in the CAD flow
- Hooks: a function injection mechanism that a technology or design can use to influence tool TCL emission

A practical note: while tool types are abstract and in theory you could, for instance, swap one synthesis tool for another, practically, this is very difficult and not done during a tapeout.
Furthermore, benchmarking commercial tools against each other is verboten anyways.

## Fundamental Abstractions

Let's start from first principles, build in Hammer's abstractions, and see where we can slot in ideas from the other tools.

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
    timing_log_file: Path
    timing: TimingReport(tns, wns, ...)

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

Ease of memoizing and hashing artifacts
tcl file emission as part of running synthesis / splitting into phases (emission and shell execution)

### What About PDK Setup / Hacks?

### What About Steps?

### What About Hooks?

#### Design to Tool Hooks

#### PDK to Tool Hooks

### What About (Tool -> PDK -> Design) Parameter Overrides?

## Python-First Data Structures

Already done by SiliconCompiler, but wrongly IMO (stringly typed, IDE not usable, schema defined separately from Python code, dependencies of a function are unknown without scouring through source).
Use python to set configurations. Get rid of meta-language inside yaml.

## Non-Monolithic (Modular) Flow Construction

- Get rid of tool types as a meaningful abstraction to be fed into the top-level command line

## Build Tool "Integration"

- mflowgen param space sweeping: https://mflowgen.readthedocs.io/en/latest/ug-param-space.html

## Jerry's Hammer Rant

> List of problems when trying to use hammer
>
>     I don't want to install hammer from pip because that sucks and is wrong
>     Hammer-from-source needs poetry
>     Poetry install script breaks because my env's python3.11 wasn't built with TLS/SSL
>     Have to install poetry using the system python3.9
>     poetry shell command (currently in hammer docs) is deprecated - I will try with the replacement - poetry env activate
>     hammer-vlsi command (why is this in my ~/.local/bin .... I did not give anything permission to install stuff there) breaks with ModuleNotFoundError: hammer
>     Have to modify all the hammer scripts to use /usr/bin/python3 instead of my python3.1
>     ^ apparently that was wrong, I misread what poetry env activate does, it only prints the command to activate the env, it doesn't activate the env for you :exploding_head:
>
> Now trying to use hammer intel22 plugin:
>
>     SRAM compiler fails, why does it fail? Because example-intech22.yml doesn't exist
>     I create example-intech22.yml, which needs  to specify the hammer tech plugin namespace - I do hammer.technology.intech22
>     ^ this was wrong, I try hammer.intech22, because the plugin docs say: "When targeting the tech in the plugin, continue to reference the hammer.intech22 namespace."
>     ^ this was wrong, I delete the plugin namespace key entirely from the example-intech22.yml, which now seems to fix it?
>     I try syn target, but get a list index out of range error somehow... probably need to add the bwrc-env.yml
>     Nope, I probably need to install hammer-intech22-plugin (why is this also a poetry project...) (also this step is not documented anywhere). poetry install doesn't work because the TOML is wrong???
>     Hack around that with a pip3 install -e . in hammer-intech22-plugin  .... which WORKS
>
> Conclusions
>
>     Why do we pretend that projects which are really just scripts deserve to be packaged. Hammer is just a script, same as firesim and firemarshal. "Installing" hammer should just install a symlink to a main.py inside of hammer's repo.
>     YMLs are cancer. How did we fall into this YML-based world... marshal/firesim/hammer all use YMLs, and they all suck. And anyone else building something with a YML/JSON/TOML-based configuration system.
>     This entire flow is inscrutable. I've done this tons of times already, and it still causes me so much pain when I know generally where to go fix things.
