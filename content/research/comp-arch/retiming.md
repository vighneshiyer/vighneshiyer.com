You are probably already familiar with retiming support in synthesis tools (e.g. Vivado, Genus, yosys via abc) where you put a chain of registers after a blob of purely combinational logic and it duplicates/pushes back those registers to balance the stage delays.
There is a [FIRRTL annotation](https://circt.llvm.org/docs/Dialects/FIRRTL/FIRRTLAnnotations/#retimemoduleannotation) to mark modules that need retiming, which just makes `firtool` dump JSON with paths to those modules.
You can ingest that JSON and generate tcl for the target synthesis tool to enable retiming for just those modules ([example from Hammer for Genus](https://github.com/ucb-bar/hammer/blob/master/hammer/synthesis/genus/__init__.py#L293)).
This aspect of retiming (figuring out where to put the registers in the combinational blob) is best done by synthesis tools for optimal QoR. As Joonho points out, trying to use a surrogate synthesis model (as XLS does) in the frontend to perform this register moving preemptively is a bad idea.

This is the typical flow, and as you point out, it requires that the designer specify the number of stages *in the RTL*.
This means all the other control logic in the RTL must be aware of the exact latency of the block being retimed and consume/provide data accordingly.
As you point out, this (i.e. latency-sensitive design) can be a source of logic bugs.
There is prior work (see: [Filament](https://filamenthdl.com/)) which moves the specification of latencies to the frontend type system and formally checks that latency-sensitive pipelines are composed correctly. You should examine whether this approach would be a good fit for Chisel.

The first half of what you're describing (being able to mark a blob of combinational logic as taking N cycles + some verification collateral that checks that data from that blob only flows out when it's valid) is akin to adding Filament-like annotations to Chisel + an information flow tracking pass in FIRRTL.
The second half (automatically 'adjusting' delays of other operators based on the marked delay of a particular combinational circuit) is akin to Calyx/HLS and it seems contradictory to the design philosophy of Chisel (maintaining the same abstraction as RTL).
I would suggest it is better to build verification libraries/annotations/passes for checking latency-sensitive circuits produced from a Chisel generator rather than circuit manipulation APIs / metaprogramming for automatically latency-matching paths.

Of course the other option is to use latency-insensitive design for everything at the slight cost of area/timing, similar to AXI-Stream pipelines in DSPTools.
There was also some API in dsptools that added [retiming stages for adds/muls within a DSPContext](https://github.com/ucb-bar/dsptools/blob/master/doc/DspContext.md); I'm not sure if this still works.
