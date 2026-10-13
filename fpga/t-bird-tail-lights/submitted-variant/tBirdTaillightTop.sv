module tBirdTaillightTop(
    input logic clk,
    input logic [15:0] sw,
    input logic btnC,
    input logic btnU,
    output logic [15:0] led
    );

    logic clk_1Hz;

    logic [2:0] leftLEDs;
    // declare a three-bit logic bus called rightLEDs (similar to leftLEDs) 
    logic [2:0] rightLEDs;

    slowClock slowClockInstance(.clk(clk), .reset(btnU), .clk_1Hz(clk_1Hz));

    taillight leftTaillight(.clk(clk_1Hz), .reset(btnU), .brake(btnC), .turnSignal(sw[15]), .harzardSignal(sw[7]), .taillights(leftLEDs));
    // instantiate the rightTaillight, similar to the leftTaillight above
    taillight rightTaillight(.clk(clk_1Hz), .reset(btnU), .brake(btnC), .turnSignal(sw[0]),  .harzardSignal(sw[7]), .taillights(rightLEDs));
    
   
    assign led[15:13] = {leftLEDs[0], leftLEDs[1], leftLEDs[2]};
    assign led[12:3] = 10'b00000_00000;
    // assign led[2:0] to rightLEDs, similar to led[15:13] above
    assign led[2:0] = {rightLEDs[2], rightLEDs[1], rightLEDs[0]};
    
endmodule

