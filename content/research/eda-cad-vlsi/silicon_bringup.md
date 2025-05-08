+++
title = "Academic Silicon Bringup Methodology"
date = 2024-04-18
draft = true
slug = "academic-silicon-bringup-methodology"
+++

## The Objective

## Prior Attempts

- Michael Taylor's attempts
  - https://bjump.org/
- Our attempts
  - https://chipyard.readthedocs.io/en/stable/Advanced-Concepts/Chip-Communication.html
  - https://github.com/ucb-bar/chipyard/issues/1861
    - All the one-off forks of fesvr specific to the bringup of a particular chip are all private; we really should open these up but they are behind a BWRC NDA barrier right now due to potential PDK intermingling

## Desirable Things

- FPGA design
  - High host bandwidth, easy (drivers work out of the box) host connectivity
  - Clean connectors to the chip PCB
  - Voltage compatibility
  - Debug-ability, visibility into all activity going in and out of the chip, visibility of what the FPGA design is doing (or an insanely minimal FPGA design)
  - Small form factor
  - Minimal external connections
  - Visibility into voltages and currents
- What does the RTL design need to support?
  - Clocks / PLL config
  - Voltage config
  - Host to chip communication protocol
  - DRAM
- Silicon
  - Easy swapping of different chips as they inevitably die or have different margins during testing
- Pre-tapeout prototyping
  - Putting a partial design on one large FPGA and the bringup platform on another smaller FPGA is an important use case

## Bringup System Architecture and IOs

### Chip PCB Options

- Mounting: chip on board, package (BGA or otherwise), socketed
- Daughterboard + motherboard vs motherboard-only designs

### FPGA/Host-Chip Communication Options

- Custom scan chain
- JTAG
- Direct UART to chip
- SPI
- TSI / HTIF (serial TileLink) (credited or ready/valid based)
- FTDI FIFO direct - bypassing the FPGA
- LVDS/LVCMOS based link
  - BaseJump LVCMOS link: https://bjump.org/
  - PonyLink: https://github.com/cliffordwolf/PonyLink
  - Slink: https://github.com/waviousllc/wav-slink-hw
- Custom SERDES (GTY/GTZ transceiver)

#### The FPGA Bridge

- Oversampling of the interface is the best

### Host-FPGA Communication Options

- Uart, silabs, ftdi usb-uart
- USB direct
- USB fifo chip ftdi
- Ethernet, ip, udp
- Pcie
- Good summary reddit post with suggestions: https://www.reddit.com/r/FPGA/comments/ez6vdc/high_bandwidth_data_ingress/
    - archive: https://archive.is/B7z9s

### Is the FPGA Even Necessary?

## FPGA Concerns

I/O voltages need to be configurable or match those the chip expects. Modern processes often have low IO voltages (1.2V), so it may be a challenge to find an FPGA that has banks which support such a low voltage and drive the GPIOs of the devboard.

### Dev Boards

#### FPGA-Chip Physical Interface

The main concern is what physical interface should be used between the FPGA and the chip / motherboard.
There are several options:

- Jumper cables (easy, flexible, debuggable), but, slow, potentially flaky, fragile
- FMC (standard, expensive, support for many dev boards) (https://fmchub.github.io/appendix/VITA57_FMC_HPC_LPC_SIGNALS_AND_PINOUT.html)
- Other Samtec connectors
  - Raw header pins, etc.

FMC boards are too expensive and they often come with a huge FPGA. Building bitstreams for such an FPGA is time consuming and completely unnecessary since bringup designs are tiny.

#### Potential Boards

- [Pure FPGA (no Zynq) boards](https://www.fpgadeveloper.com/list-of-pure-fpga-dev-boards/), [FMC FPGA boards](https://www.fpgadeveloper.com/list-of-fpga-dev-boards-with-fmc/)
- AMD (Xilinx)
  - VCU118 (the classic option)
  - ZC706
  - ZCU102
- Opal Kelly
  - https://opalkelly.com/products/xem7350/ (FMC, Kintex 7, USB to host via FrontPanel, $1400)
  - https://opalkelly.com/products/xem7310mt/ (Artix 7, QSE Samtec connector, FrontPanel, $680)
  - https://opalkelly.com/products/xem8310/ (Artix UltraScale+, 3x Samtec connector, FrontPanel, $1200)
- Avnet
  - Zedboard
  - Microzed (discontinued)
  - Picozed (quite nice actually)
- Digilent
  - Arty

Of all of these, I prefer the Opal Kelly options the most. After that, the Arty is decent if jumpers are sufficient. After that, the Picozed is nice. The rest are really to be avoided (especially Intel/Altera FPGAs).

## My Proposed Bringup Methodology

WIP.
