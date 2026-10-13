module upDownCounter(input	logic		clk,
                     input 	logic		reset,
					 input 	logic 		up,
					 output logic [31:0] q);


always_ff @ (posedge clk)
    begin
        if(reset)
            q <= 32'b0;
        else
            if(up)
                q <= q + 1;
            else 
                q <= q - 1;  

    end

endmodule
