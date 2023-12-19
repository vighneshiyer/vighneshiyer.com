+++
title = "Semantic Compression Algorithms"
date = 2023-12-18
draft = true
slug = 'semantic-compression-algorithms'
+++

Most compression algorithms today operate on a stream of bytes.
However, if the input has a schema and structure, can we design a framework for describing *semantic* compression algorithms that are lightweight enough to implement in hardware, while retaining the compressibility of heavyweight input-schema-agnostic algorithms?

## NoC / Transaction-Level Compression

- If we have a schema of transactions, and many traces of real traffic, can we find an optimal encoding/decoding scheme to minimize bus/NoC traffic?
    - e.g. in TL, we have several message types: Get(addr), Put(addr, data), ...
    - Can we design hardware to go from these messages to raw packet bits that can later be decoded?
    - Can we also design a more optimal physical encoding rather than just putting each transaction field on a seperate wire? Can the hardware then operate on this more efficient encoding directly?
    - We will have to trade-off the PPA complexity of the decoder/encoder and the savings we get in bandwidth and network traffic
    - We can't use an online compression scheme since it will take too much area; also we know what type of traffic to expect, so we can use offline profiling and the design of a custom compression network-wide scheme for a given transaction schema
    - e.g. we can use delta compression for addresses and/or we can use entropy encoding for opcodes, and/or magic constants for common values such as all ones or all zeros, or turning one-hot signals into multi-bit signals (e.g. byte-wise mask into an uinteger), we can elide fields that are unused in certain message types. We can have different codecs for master->slave traffic vs slave->master traffic. Encodings may be stateful and reuse addresses/offsets of previous transactions.
    - This type of context-aware (protocol/transaction schema aware) technique should work better than raw packet compression techniques simply because we can take advantage of the user-defined semantics of the protocol
- Prior work: https://ieeexplore.ieee.org/abstract/document/9459512
    - FlitZip: Effective Packet Compression for NoC in MultiProcessor System-on-Chip
    - We want to compare on aggregate PPA cost and benefit and on real RTL evaluation unlike their simulator based eval
    - https://github.com/xingyuli9961/CS262AProject-FlitReduce-NoC_Compression
    - https://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6742954 (NoΔ: Leveraging Delta Compression for End-to-End Memory Access in NoC Based Multicores)
    - These are quite low-level and naive compression algorithms that do not take advantage of the known schema of protocol messages

- (Optimal Protocol NoC Packetization): NoC protocol to packet packing (profile based) automatic RTL generation including optimal compression scheme

- Generating Compact Physical Encodings of Transaction-Level Messages
- Can we discover a memory protocol that is more compressible than TileLink / AXI4+ACE / CHI?
    - Discover a common set of primitives that can express the same logical operations as an existing memory protocol, but is more compressible
    - Major problem: how can we prove equivalance and discover rewrite rules to unify 2 sets of primitives
    - Automatic generation of protocol adapters via program synthesis and rewriting
        - Can we automatically synthesize a TL to CXL protocol adapter?
        - Can we formally make sure a protocol never deadlocks and holes in a mapping.

```scala
Get(addr, nBytes)

Read(addr, `nBytes < 8`, beats: Int)

def translate(g: Get): Seq[Read] = {
    ???
}
```

- network packet compression techniques via greedy / random search
