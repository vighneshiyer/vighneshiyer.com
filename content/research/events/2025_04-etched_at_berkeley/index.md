- https://www.etched.com/announcing-etched
- https://www.theregister.com/2024/06/26/etched_asic_ai/
- https://www.chipstrat.com/p/etched-silicon-valleys-speedrun

- https://lu.ma/eovd2e40

> Come meet the Etched team at 151T! Berkeley alum Mark Hill (EECS ‘19) will brief us on Sohu – the world’s first transformer inference ASIC – and share his insider’s perspective on what it takes to build frontier-class firmware. Mark was one of the first firmware engineers at Etched and previously the first firmware engineer at Astranis (a unicorn making high-orbit satellites).
>
> Etched is building a transformer-specific AI chip that's >10x faster than NVIDIA GPUs. Founded by Harvard dropouts turned Thiel Fellows, Etched has raised hundreds of millions from leading investors, including Peter Thiel, Jane Street, Two Sigma, and Primary Ventures. Engineering is led by Mark Ross (ex-CTO of Cypress Semiconductor [acq. 9.4B]);  Brian Loiler (ex-NVIDA for 23 years, built the HGX/DGX servers, responsible for >80% of NVIDIA’s revenue); and David Munday (built the TPU v1-v5 software/firmware teams).
>
> Undergrads, grad students, and researchers are all welcome to join for the agenda below. Please RSVP as space is limited.
>
> 4:30-5pm: Open discussion with the 151T class (anyone else on the guest list is welcome to join for Q&A)
>
> 5-6pm: Talk from Mark on designing and testing RTL+FW features for an ASIC
>
> 6-7pm: Food & Mingling with the Etched team, building the world's first transformer ASIC.

- The host is Carter Wilcox (https://www.linkedin.com/in/carter-wilcox-16458713b/)

Experience:

> Etched
> Head of Special Projects
> Mar 2025 - Present
> Working closely with founders to enable the inference singularity
>
> Character.AI
>
> Chief of Staff / BD Lead
> Jan 2024 - Apr 2025
>
> Growth
> Nov 2022 - Jan 2024
> Employee 15 and first business hire. Adventure of a lifetime starting with Series A fundraise ($1B) and then ops function buildouts.
>
> Boston Consulting Group (BCG)
> Associate
> Jan 2021 - Sep 2022
> Logistics cases, with capstones in hardware product development (BCG Digital Ventures) and software product development (BCG Gamma).

Yeah, I don't want to judge too early, but come on. This will be fun.

## Talk Notes

- The 3 guys: Carter Wilcox (ex character.ai), Mark Hill, Robert Wachen (opened the talk)
- No photos allowed
- Mark Hill about firmware engineering at Etched - first FW engineer there
- Talk title: Firmware for ASICs
- AI HW is the fastest growing market, growing need for specialized AI chips, we're about to make the first one
- All Harvard undergrads, they claim that AI model spend grows exponentially while cost of custom chips scales linearly at best
- They assert all major AI models are all transformers, so we must accelerate them
- Sohu is 10x faster than nvidia GPUs
- they claim 3 servers with 8x sohu can deliver 1M tokens/sec on Deepseek Llama distill 70B
  - 10x cheaper
- 150+ engineers, peter thiel, jane street, two sigma
- sold out first production run
- the team: Gavin, Mark, Brian, Robert, Ajat, Saptadeep
- Mark Hill was at berkeley from 2017-2019, liked 151 lol
  - Worked at Astranis, learned about firmware, now he is qualified to lead a custom datacenter asic firmware team
- Filling a floor of the San Jose office, huge fancy office building
- Learned about AXI in the first few weeks at Etched LMAO
- He works on the Pcie communications stack
- they are recruiting for every element of the ASIC and card and stack: RTL, DV, firmware, PD, timing, validation, emulation, devops
  - all inference sw, ML SW, system SW, RDMA, emulation, chip modeling, architecture
  - they also make the chassic, power EE, si EE, mechE + make the racks, liquid cooled - literally everything LMAO this is impossible to believe, what a bad strategy
- he shows the 151 chip design CAD flow, ahh but see there is 'design iteration' - "co-design" LMAO
  - then he shows a xdot graph of all the flows in the VLSI flow, rtl dev, simulation, arch, DV, software, compilers, lmao arrows going all over the place
  - "super iterative effort", "the flow requires lots of circles", "you get to PD and realize you have an issue", "lots of things going on here at etched"
- 11 people on FW team, 20+ by the end of the year
- they make firmware that runs on the asic, spec out rtl, asic control path, perpherals, freertos port for their cpu, device drivers, host-asic comm, ai inference runtime, device drivers for custom IP blocks
  - the firmware that runs on the power/reset sequencing microcontroller - device drivers for external power and telemetry ICs, state machines for ASIC power, reset, and exceptional conditions
  - linux kernel driver that talks to the asic, host-asic comm stack, userspace API to perform data transfer / commands
  - "we have to spec out how many AXI buses we need"
- they claim to have a rack prototype with a bunch of high bandwidth switches, but it looks like all off-the-shelf stuff
- how to design a high throughput, low latency comm stack
  - they have something called "Kayak" which is the userspace inference runtime
  - very vanilla 3 segment diagram: kayak (kv cache, HTTP API, PCIe programming, kernel generation) -> kernel driver (io_uring, MSI-X, PCIe interrupts, ring buffers) -> sohu runtime (pcie dma, pcie interrupt registers, host/device comms thread)
  - now he's just talking about pcie in general (TLP, link initialization, device memory allocation, pcie enumeration, interrupts to the host core)
  - pcie to axi within the ASIC, MSI is just a memory write, it seems very vanilla
  - mmap a BAR, access it on the host, showed some GTX 4090 throughput numbers lol, the firmware can issue DMA requests for the PCIe card to do, yeah of course lol
  - "the host system usually doesn't have any DMAs", we have to rely on the plugin card's DMA
  - interrupts from host to ASIC happen with doorbell registers (yeah naturally), they have a 256-byte doorbell (with set + ack to send head/tail pointers) - they have a small HW accelerated ring buffer doorbell mechanism, seems vanilla
  - command descriptors on the host side, send to the driver, it will asynchronously do it, yeah we know
- to put this in context, this is a 151 / tapeout class talk, so they probably just want to recruit and aren't going to tell us anything
- this guy is just putting up screenshots from various PCIe communication webpages (e.g. for NVMe io_uring usage) and saying that it works
- they have single request/completion queue for kernel dispatch, but will manage everything in userspace eventually
- perf opt: PCIe roundtrip is 100-1000ns (minimize), don't do MMIO read (too slow), initiate transfers from devices via DMAs, batch commanding and prefetch can hide setup and PCIe RTT latency
- now he's talking about IOMMU, so you need to split transactions into multiple descriptors to handle page crossings
- how his advice for students
  - develop an arch sw model early, don't iterate with RTL, run software on RTL early and often, make a comprehensive CI
  - "develop an architectural sw model of the chip early", "don't underestimate the benefits of free, limitless cloud-scaling", "licences and hw constraints are hard and expensive to scale" - WOW what an insight! very smart people here.
  - lessons they've learned - can't be serious
- learn every part of the stack, cross-team movement is good, make projects that get into the 'customer' early and get feedback, avoid projects that lack this feedback loop, you need to be passionate and be with passionate people
