`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2018 01:39:25 PM
// Design Name: 
// Module Name: workSheet2ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(   input logic signed  [7:0] a,b,
                        input logic         btnU, btnL, btnC, btnR, btnD,
                        output logic        [7:0] led );

    logic [7:0] ALU_output;

    // write the logic for the ALU here
        always_comb
            
            begin
                ALU_output = 8'b0000_0000;
                //  up button should correspond to a + b
                if (btnU)
                    ALU_output = a + b;
                    
                //  left button should correspond to a XOR b
                else if (btnL)
                    ALU_output = a ^ b;
                    
                //  center button should correspond to 8'b0000_0001 if a < b, 8'b0000_0000 otherwise
                else if (btnC)
                    ALU_output = a < b ? 8'b0000_0001 : 8'b0000_0000;
                    
                //  right button should correspond to arithmetic right shift by 2
                else if (btnR)  
                    ALU_output = a >>> 2;
                    
                //  down button should correspond to a - b
                else if(btnD)
                    ALU_output = a - b;
                    
                  
            end
            
       // the output of the ALU should be assigned to led, which maps to the rightmost 8 leds on your BASYS3
    
        assign led = ALU_output;
           // (this mapping has already been done in Basys3_Master.xdc)
   
    
  



 
    
    
 
endmodule
