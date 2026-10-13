module binary_to_thermometer(input logic A2, A1, A0,
                            output logic y6, y5, y4, y3, y2, y1, y0);
                           
    assign y0 = A0 | A1 | A2;
    assign y1 = A1 | A2;
    assign y2 = (A1 & A0) | A2;
    assign y3 = A2;
    assign y4 = (A2&A1) | (A2&A0);
    assign y5 = A2 & A1;
    assign y6 = A2 & A1 & A0;                         
endmodule
