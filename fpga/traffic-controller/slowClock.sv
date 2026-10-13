module slowClock(   input   logic   clk,
                    input   logic   reset,
                    output  logic   slowClk);
    
    logic [31:0] counter;
    
    always_ff @( posedge clk  )
        if (reset ) begin
            slowClk <= 0;
            counter <= 0;
        end
        else begin
            if( counter == 100_000_000 ) begin
                counter <= 0;
                slowClk <= ~slowClk;
            end
            else begin
                counter <= counter + 1;
            end
        end
endmodule