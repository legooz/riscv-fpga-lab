# Validation

Checked on 12 October 2026 with Icarus Verilog 12.0. The original sources were normalized to UTF-8/LF; no datapath, controller or ALU behavior was repaired during organization.

The same three checks passed again on 13 October 2026 after descriptive file and folder renaming. The processors now load the renamed instruction fixtures; instruction and RTL behavior are unchanged.

| Check | Result |
|---|---|
| Extended processor + `lui-xor-program.hex` | Pass: store data `0xBEEEF009`, address `0x58`, PC `0x14` |
| Baseline processor + `baseline-program.hex` | Original testbench reports `Simulation succeeded` |
| FPGA ALU + recovered vectors | 13 tests completed, zero errors |

The extended processor's embedded original testbench still expects the baseline program. `recovery_tb.sv` selects a separate top module and checks the documented LUI/XOR program store, with a 100-cycle failure limit. This small harness is new; the processor is the recovered submission.

Icarus warns that the instruction/vector files contain fewer words than the declared memory arrays and reports a legacy memory-range convention. These diagnostics were observed with the original fixtures. The checked paths complete successfully; uninitialized unused locations remain outside these tests.

The remaining FPGA exercises, alternate RTL versions, board pin mappings, timing closure and synthesis have not been revalidated in this pass. Historical board recordings are included separately. Passing these checks is not a complete RISC-V ISA conformance result.
