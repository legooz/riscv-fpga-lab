module jkFlop(input logic clk,
              input logic j,
              input logic k,
              output logic q);
              
             
             
             
             //always ff_
             
             
// Structural modeling             
             logic muxOut;
             
             mux4 thisMux(q, 'b0, 'b1, ~q, {j,k} ,muxOut);  
             dFlop thisFlop( clk, muxOut, q);
              
endmodule
