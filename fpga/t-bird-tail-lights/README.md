# T-Bird Tail Lights Project

A Basys 3 FPGA implementation of sequential left/right tail lights, with turn-signal and brake inputs.

| Start here | What it contains |
|---|---|
| [Top-level board module](tBirdTaillightTop.sv) | Clock, switches, buttons and LED connections |
| [Tail-light controller](taillight.sv) | Signal sequencing and braking logic |
| [Clock divider](slowClock.sv) | Slower clock for visible board behavior |
| [Blinker logic](blinkers.sv) and [testbench](blinkersTestbench.sv) | Separate blinker implementation and simulation source |
| [Submitted variant](submitted-variant/) | Alternate recovered source and input vectors |

[Watch the tail-light sequence](https://github.com/legooz/riscv-fpga-lab/releases/download/portfolio-media-2026-10/taillight-sequence.mp4) · [Watch the alternate sequence](https://github.com/legooz/riscv-fpga-lab/releases/download/portfolio-media-2026-10/taillight-extra-credit.mp4)

These recordings document the original 2024 board demonstrations. This naming cleanup does not establish new synthesis, timing, or board validation. See [validation](../../VALIDATION.md) and [course/scaffold attribution](../../NOTICE.md).

[All FPGA projects](../README.md)
