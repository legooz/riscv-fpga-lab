module scannableCounter(input logic 	clk, 
                        input logic 	reset, test, 
                        input logic 	sin,
                        output logic 	[7:0] q, 
                        output logic 	sout,
                        output logic    clk_1Hz);

    
    logic [32:0] counter;


    always_ff @ (posedge clk_1Hz or posedge reset) 
        if 	(reset) 		q <= 8'b0; 
        else if (test==0)	q <= q+1; 
        else 				q <= {q[6:0], sin};
    
    assign sout = q[7]; 
    
    
    // create 1 Hz clock signal
    always_ff @ (posedge reset or posedge clk)
    begin
        if (reset == 1'b1) begin
            clk_1Hz <= 0;
            counter <= 0;
        end else begin
            if ( counter == 100_000_000) begin
                counter <= 0;
                clk_1Hz <= ~clk_1Hz;
            end else
                counter <= counter + 1; 
        end
    end

endmodule

