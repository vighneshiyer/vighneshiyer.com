+++
title = "RISC-V Summit 2023"
date = 2023-12-18
draft = true
slug = "riscv-summit-2023-review"
+++

- SiFive had little prescence, Krste's keynote was replaced by some other corporate stooge
- https://events.linuxfoundation.org/riscv-summit/program/schedule/
- Ventana makes quite a splash every time, but they have no silicon
- Rivos is much more low key, no marketing nitwits, just serious people on each ISA committee
- Andes is dominant in the low end - excellent support for IP users
- https://events.linuxfoundation.org/riscv-summit/program/floor-plan/
- XianTui has very interesting dev board and these Chinese vendors aggressively push out new silicon and dev boards much faster than SiFive can do
- Imperas is pushing their RVVI standard (https://github.com/riscv-verification/RVVI/blob/main/RVVI-TRACE/README.md)
    - Some major limitations however
    > The imperas model is quite primitive. It doesn't support retirement groups for out of order and wide retirement pipes so designers have to manually destructive retire groups into multiple single inst retires. Also multi core consistent gecks don't really work, no support for consistency models and instruction interleaving order models
    > This is quite bad lol, but tbf we also don't have a way to verify multicores with spike trace comparison so ok it isn't that big of a deal
    > We can use consistency litmus tests and those give some additional confidence
    > They also expect the core to be isolated without caches for verification harness
    - https://github.com/riscv-ovpsim/imperas-riscv-tests
    - https://github.com/riscv-ovpsim/imperas-riscv-tests/blob/v20231026/riscv-ovpsim-plus/README.md
    - https://github.com/riscv-ovpsim/imperas-riscv-tests/blob/v20231026/riscv-ovpsim-plus/doc/riscvOVPsimPlus_User_Guide.pdf
        - I guess this is better than spike from industry perspective
        - Also might be faster
- MILK-V has interesting dev boards: https://www.hackster.io/news/milk-v-goes-after-llms-on-the-desktop-with-its-powerful-16-core-risc-v-oasis-motherboard-97378066ac79
- Ventana's V2 talk slides: https://www.servethehome.com/ventana-veyron-v2-risc-v-cpu-launched-for-the-dsa-future/
    - Focus on chiplet strategy
- Tenstorrent pushed out new version of Ocelot - BOOM coupled vector unit (https://github.com/tenstorrent/riscv-ocelot/blob/bobcat/README-TT.md)
- SiFive's Intel collab for dev board (Intel Horse Creek) died off, no mention thus far
    - There is this: https://www.sifive.com/boards/hifive-pro-p550 but it isn't released yet
    - Yeah, why is it taking so long to get new boards for the new IPs: https://www.sifive.com/boards ???
    - Not many openings (https://www.sifive.com/careers), most in India or Taiwan
