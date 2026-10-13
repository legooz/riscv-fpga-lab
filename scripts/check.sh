#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
mkdir -p build
iverilog -g2012 -s recovery_tb -o build/lui-xor.vvp riscv/lui-xor/processor.sv riscv/lui-xor/recovery_tb.sv
(cd riscv/lui-xor && timeout 10 vvp -n ../../build/lui-xor.vvp) > build/lui-xor.log 2>&1
cat build/lui-xor.log
grep -q 'PASS: LUI/XOR' build/lui-xor.log
iverilog -g2012 -s testbench -o build/baseline.vvp riscv/baseline/riscv_single.sv
(cd riscv/baseline && timeout 10 vvp -n ../../build/baseline.vvp) > build/baseline.log 2>&1
cat build/baseline.log
grep -q 'Simulation succeeded' build/baseline.log
iverilog -g2012 -s testbenchALU -o build/alu.vvp fpga/alu/ALU.sv fpga/alu/testbenchALU.sv
(cd fpga/alu && timeout 10 vvp -n ../../build/alu.vvp) > build/alu.log 2>&1
cat build/alu.log
grep -Eq '13 tests completed with +0 errors' build/alu.log
