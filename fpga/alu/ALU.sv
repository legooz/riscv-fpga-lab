`timescale 1ns / 1ps
// 8-bit signed ALU with button-selected operations and LED output.
// Course/scaffold attribution is recorded in NOTICE.md.


module ALU(   input logic signed  [7:0] a,b,
                        input logic         btnU, btnL, btnC, btnR, btnD,
                        output logic        [7:0] led );

    logic [7:0] ALU_output;

    // Select the first active button in up, left, center, right, down order.
        always_comb
            
            begin
                ALU_output = 8'b0000_0000;
                // Up: add the two operands.
                if (btnU)
                    ALU_output = a + b;
                    
                // Left: bitwise XOR of the operands.
                else if (btnL)
                    ALU_output = a ^ b;
                    
                // Center: return 1 when a < b, otherwise 0.
                else if (btnC)
                    ALU_output = a < b ? 8'b0000_0001 : 8'b0000_0000;
                    
                // Right: arithmetic right shift of a by two bits.
                else if (btnR)  
                    ALU_output = a >>> 2;
                    
                // Down: subtract b from a.
                else if(btnD)
                    ALU_output = a - b;
                    
                  
            end
            
       // Drive the rightmost eight BASYS3 LEDs with the selected result.
    
        assign led = ALU_output;
           // Basys3_Master.xdc defines the LED pin mapping.
   
    
  



 
    
    
 
endmodule
