module slowClock( input logic clk, 
                  input logic reset,
                  output logic clk_1Hz);
    
    logic [32:0] counter;
    
    always_ff @ (posedge clk)
      begin
        if (reset == 1'b1)
          begin
            clk_1Hz <= 0;
            counter <= 0;
          end
        else
          begin
            if ( counter == 25_000_000)
              begin
                counter <= 0;
                clk_1Hz <= ~clk_1Hz;
              end
            else
                counter <= counter + 1; 
          end
      end
endmodule  
