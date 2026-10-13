module taillight(
    input logic clk,
    input logic reset,
    input logic brake,
    input logic turnSignal,
    input logic harzardSignal,
    output logic [2:0] taillights
    );
    
    logic [2:0] blinkingLights;
 
    blinkers blinkersInstance( .clk(clk), .reset(reset), .turnSignal(turnSignal), .blinkingLights(blinkingLights));

    always_comb
    begin
    // if turn signal is on, then use blinking lights for taillights
    if (harzardSignal)
    begin
        taillights = clk ? 3'b111 : 3'b000;
    end
    else if (turnSignal) 
    begin
        taillights = blinkingLights;
    end    
    // otherwise
    //    if the brakes are on, light up the taillights
    else if (brake) 
    begin
        taillights = 3'b111;
    end
    //    otherwise, the taillights should be off
    else 
    begin
        taillights = 3'b000;
    end


    end
endmodule
