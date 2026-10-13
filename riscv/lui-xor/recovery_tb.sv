// Added during the portfolio organization pass in October 2026.
// Checks the stored program's documented result without changing the recovered RTL.
`timescale 1ns/1ps
module recovery_tb;
  logic clk = 0;
  logic reset = 1;
  logic [31:0] address, data, pc;
  integer cycles = 0;
  riscvsingle dut(.clk(clk), .reset(reset), .ALUResult(address), .WriteData(data), .PC(pc));
  always #5 clk = ~clk;
  initial #22 reset = 0;
  always @(negedge clk) begin
    cycles = cycles + 1;
    if (!reset && dut.MemWrite) begin
      if (pc !== 32'h14 || address !== 32'h58 || data !== 32'hBEEEF009)
        $fatal(1, "Unexpected store: PC=%h address=%h data=%h", pc, address, data);
      $display("PASS: LUI/XOR program stores BEEEF009 at address 58 with PC 14");
      $finish;
    end
    if (cycles > 100) $fatal(1, "Timed out waiting for program store");
  end
endmodule
