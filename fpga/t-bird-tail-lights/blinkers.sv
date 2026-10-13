module blinkers( input  logic       clk,
                 input  logic       reset,
                 input  logic       turnSignal,
                 output logic [2:0] blinkingLights );
    
	// typedef statements
    typedef enum logic [1:0] {S0, S1, S2, S3} statetype;
    statetype state, nextstate;
    
    always_ff @( posedge clk, posedge reset)
    begin
        if( reset )
            state <= S0;
        else
            state <= nextstate;
    end
    

    always_comb
    begin 
        case(state)
         S0: if(turnSignal) nextstate = S1;
             else           nextstate = S0;
         S1: if(turnSignal) nextstate = S2;
             else           nextstate = S0;
         S2: if(turnSignal) nextstate = S3;
             else           nextstate = S0;
         S3: if(turnSignal) nextstate = S0;
             else           nextstate = S0;
         default:  nextstate = S0;                                      
        endcase;
    end

	// Assign blinkingLights based on the current state
	// the most significant bit of blinkingLights should light first
    assign blinkingLights[2] = state == S1 || state == S2 || state == S3;
    assign blinkingLights[1] = state == S2 || state == S3;
    assign blinkingLights[0] = state == S3;
   
endmodule

