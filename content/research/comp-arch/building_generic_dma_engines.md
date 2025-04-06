Generic DMA generator

- Encode memory iteration patterns / iteration space (maybe as some symbolic polyhedral expression) to parameterize the DMA's address generation and coalescing logic
- Some way to encode SRAM banking strategies for out-of-order responses / transposes / transformations
- Hooks for intermediate computation between the memory system and local scratchpads / caches (for quantization, compression, shuffling, permutation, etc.)
- If descriptors can be processed out of order or if the memory system returns responses out of order, reordering queues and depth need to be parameterized and the uarch optimized for each range
- Often there is a need to tightly tie the DMA into compute unit (or banked scratchpad) that is consuming/producing data 
  - This seems tough to generalize without looking at many examples (e.g. the scratchpad-tied DMA in gemmini)
- Generate the DMA ISA / descriptor table struct definitions from the parameter set

It would be useful to study existing DMAs and document how much they hardcode.
Analyze which uarch and which features are hardcoded vs parameterized and what special features can be hard to add to a generic DMA.
It seems the Saturn memory unit or Hasan's Stellar DMA should support some of the features above.
