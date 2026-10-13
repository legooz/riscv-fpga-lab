module minority(input logic a, b, c,
                output logic y);
                
      assign y = (~a & ~c) | (~a & ~b) | (~b & ~c);        
            
                
endmodule
