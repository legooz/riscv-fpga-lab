module mux8(input logic s[2:0],
            input logic d0, d1, d2, d3, d4, d5, d6, d7,
            output logic y);
            
            assign y = s[2] ? (s[1] ? (s[0] ? d1 : d0) : (s[0] ? d3 : d2))
                            : (s[1] ? (s[0] ? d5 : d4) : (s[0] ? d7 : d6));
            
            
endmodule
