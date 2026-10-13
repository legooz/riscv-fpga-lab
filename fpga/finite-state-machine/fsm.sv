module fsm(
            input  logic       clk,
            input  logic       btnC,
            input  logic       reset,
            input  logic       up,
            output logic [2:0] grayCode);
    
    typedef enum logic [2:0] {s0, s1, s2, s3, s4, s5, s6, s7} statetype;
    
    statetype state, nextState;
    
    logic prevBtnC = 1'b0; // we will remember was btnC was 1 clk cycle ago
    
    always_ff @ (posedge clk, posedge reset )
        if( reset)  state <= s0;
        else
            begin
                prevBtnC <= btnC;  // register the state of btnC to prevBtnC

		   // if btnC is currently 1 AND used to be 0 in the last clock cycle, then we know the center button was just pressed		
                if( btnC == 1'b1 && prevBtnC == 1'b0 )
                    state <= nextState;    
            end

      
always_comb
    case(state)
    
        s0: if( up ) nextState = s1;
            else nextState = s7;
            
        s1: if( up ) nextState = s2;
            else nextState = s0;
            
        s2: if( up ) nextState = s3;
            else nextState = s1;
            
        s3: if( up ) nextState = s4;
            else nextState = s2;
            
        s4: if( up ) nextState = s5;
            else nextState = s3;
            
        s5: if( up ) nextState = s6;
            else nextState = s4;
            
        s6: if( up ) nextState = s7;
            else nextState = s5;
            
        s7: if( up ) nextState = s0;
            else nextState = s6;
        
        default: nextState = s0;
    endcase


always_comb
    begin
    
    case(state)
    
        s0: grayCode = 3'b000;
        s1: grayCode = 3'b001;      
        s2: grayCode = 3'b011;
        s3: grayCode = 3'b010;            
        s4: grayCode = 3'b110;
        s5: grayCode = 3'b111;
        s6: grayCode = 3'b101;    
        s7: grayCode = 3'b100;
        default: grayCode = 3'b000;
    endcase
    end



endmodule
