module thermostat_comb(input logic [2:0] a,
                       output logic [6:0] y);

        always_comb                       
            case(a)
                3'b000: y = 8'b0000000;
                3'b001: y = 8'b0000001;
                3'b010: y = 8'b0000011;
                3'b011: y = 8'b0000111;
                3'b100: y = 8'b0001111;
                3'b101: y = 8'b0011111;
                3'b110: y = 8'b0111111;
                3'b111: y = 8'b1111111;
            endcase

endmodule
