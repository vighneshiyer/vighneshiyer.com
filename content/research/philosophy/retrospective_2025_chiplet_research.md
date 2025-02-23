# Retrospective

## A Summary of the 2023 Article

Correct the definitions of 2.5D integration itself vs the usage of a silicon interposer.

### My Main Points

- There are many adjacent fields: EDA CAD, physics/thermal/EM/mechanical simulation, analog/mixed-signal circuit design (e.g. SERDES, clocking, receivers), computer architecture, OS, systems (runtimes, schedulers, multi-node systems)
- I am only making a case specifically for one field: computer architecture

### Response to Criticisms

## Goings On

### Standards

- UCIe + CXL is dominant now
- UCIe 3D is drafted, although it is an even harder sell for standardization (but useful as an industry reference)

### Packaging Technology

- CoWoS is quite dominant at the high end
- Cost has improved, yield has improved, cost is still very high
- Design is more standardized, instead of going to TSMC for a custom interposer design, there are now design rule decks, a design kit, parasitic extraction, and so forth (it has become similar to designing a custom package, but still requires a lot more simulation and physical modeling)

### IP Market

- Still immature
- Some RISC-V core vendors are trying to move in this direction (e.g. Ventana)
- https://semiwiki.com/silicon-photonics/350889-scaling-ai-data-centers-the-role-of-chiplets-and-connectivity/
- https://semiwiki.com/eda/cadence/351462-accelerating-automotive-soc-design-with-chiplets/

### Products

- NVIDIA shows off a lot here now
- Broadcom CPO
- 3D Vcache still exists
- Intel is continuing to push
- Furiosa HBM co packaging
- Some showcases from vertical companies

## Academic Works

### High-Level Modeling

- LUCIE
  - Yield and cost modeling is always suspect, but I can appreciate the high-level methodology and modeling even if the numbers aren't accurate. That part isn't taken seriously anyways.
- Chiplet Cloud
  - These guys make very strong claims based on completely fake numbers and napkin math and I don't like that.

### "Scheduling" and "Optimization"

### "Partitioning"

- https://arxiv.org/pdf/2502.01449
- Chiplet Cloud

### Tapeouts and IP

- Look @ ISSCC and VLSI proceedings

### 3D Stacking

https://semiwiki.com/ip/349657-maximizing-3dic-design-productivity-with-3dblox-a-look-at-tsmcs-progress-and-innovations-in-2024/

### How Were My Predictions from 2023?

Overall accurate, I think.

## My View of the Future of Chiplets

### Industry Perspective

Photonics continues to mature (https://docs.google.com/presentation/d/1eIJcQ8V1aiqTd8nctGjqU6x0hSQnbvxGpj50cIHpCWU/edit). Bandwidth will continue to scale. On-package integration will increase further.

What will be the next revolution in integration? Honestly, I have no idea. DRAM certainly. Then SSDs, less likely but probably coming soon (perhaps another attempt at a Optane / 3D Xpoint mid-level cache)?

The chiplet market, will this actually shape up or will the chiplet IP vendors go bust? How are smaller companies getting ready to leverage custom SiP design?

How will this look like for EDA CAD? More money is a certainty. Custom package and interposer design demands will continue to increase.

Node-granularity fine-grained heterogeneity via chiplets? Is there really an application demand for this?

https://semiwiki.com/chiplet/349280-collaboration-required-to-maximize-asic-chiplet-value/
https://semiwiki.com/ip/352531-will-50-of-new-high-performance-computing-hpc-chip-designs-be-multi-die-in-2025/

https://chipletsummit.com/2025-program-at-a-glance/?f=g

### Academic Research Perspective

The chiplet hotness is not even close to being done.
https://microelectronicscommons.org/connect/california-pacific-northwest-ai-hardware-hub-northwest-ai-hub/
Yeah, lots of money will continue to flow; the value to the government is dubious at best.
