module lightTrafficControllerTop(input logic TA,
                                 input logic TB,
                                 input logic btnC,
                                 input logic clk,
                                 output logic [2:0] LA,
                                 output logic [2:0] LB,
                                 output logic ledSlowClk);
    logic slowClk;
    lightTrafficController lightTrafficControllerInstance(.clk(slowClk), .reset(btnC), .TA(TA), .TB(TB), .LA(LA), .LB(LB));
    slowClock slowClockInstance(clk, btnC, slowClk);
    assign ledSlowClk = slowClk;           

endmodule