module prioritycircuit(input logic [7:0] a,
                       output logic [7:0] q
                        );
                        
                        
                        
                        always_comb
                        begin
                            case( a )
                            8'b00000000 : q = 8'b00000000;
                            8'b00000001 : q = 8'b00000001;
                            8'b0000001x : q = 8'b00000010;
                            8'b000001xx : q = 8'b00000100;
                            8'b00001xxx : q = 8'b00001000;
                            8'b0001xxxx : q = 8'b00010000;
                            8'b001xxxxx : q = 8'b00100000;
                            8'b01xxxxxx : q = 8'b01000000;
                            8'b1xxxxxxx : q = 8'b10000000;      
                            default : q = 8'b00000000;
                            endcase
                        end         
                        
                        
                        
endmodule
