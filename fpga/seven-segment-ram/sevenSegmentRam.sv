// Button-controlled RAM interface with a seven-segment display.
// Course/scaffold attribution is recorded in NOTICE.md.

module sevenSegmentRamAssignment(   input   logic           storeButton,     // when initially pressed, should increment LED counter
                                    input   logic           upButton,
                                    input   logic           downButton,
                                    input   logic           leftButton,
                                    input   logic           rightButton,          
                                    input   logic           clk,             // clock
                                    input   logic   [15:0]  sw,             // clock
                                    output  logic   [3:0]   led,
                                    output  logic   [6:0]   SSD_LED_out,
                                    output  logic   [3:0]   Anode_Activate    );            // leds showing the current number

       logic prevupButton;
       logic conditionedupButton;
       
       logic prevdownButton;
       logic conditioneddownButton;
       
       logic prevleftButton;
       logic conditionedleftButton;
       
       logic prevrightButton;
       logic conditionedrightButton;
       
       logic prevstoreButton;
       logic conditionedstoreButton;
       
       logic [3:0] address;
       logic we;
       logic [15:0] ram_data_out;
       logic [15:0] ram_data_in;
       
       
        // synchronize and debounce storeButton, upButton, and downButton
        conditioner up_btn (.clk(clk), .buttonPress(upButton), .conditionedSignal(conditionedupButton));
        conditioner down_btn (.clk(clk), .buttonPress(downButton), .conditionedSignal(conditioneddownButton));
        conditioner store_btn (.clk(clk), .buttonPress(storeButton), .conditionedSignal(conditionedstoreButton));
        conditioner right_btn (.clk(clk), .buttonPress(rightButton), .conditionedSignal(conditionedrightButton));
        conditioner left_btn (.clk(clk), .buttonPress(leftButton), .conditionedSignal(conditionedleftButton));
        
        ram #(.N(4), .M(16)) big_ram (.clk(clk), .we(we), .adr(address), .din(ram_data_in), .dout(ram_data_out));
        
        sevenseg ssd ( .clk(clk), .displayed_number(ram_data_out), .Anode_Activate(Anode_Activate), .LED_out(SSD_LED_out));

        // the up and down buttons are used to select a 4-bit address from ram
        
        
        
        // the current address is displayed using the 4 rightmost leds
        always_ff @ (posedge clk)
        begin
        prevupButton <= conditionedupButton;
        prevdownButton <= conditioneddownButton;
            if({prevupButton, conditionedupButton} == 2'b01)
                begin
                if (address < 4'b1111)
                    address <= address + 1;
                end

        
        
        if({prevdownButton, conditioneddownButton} == 2'b01)
            begin
            if(address > 4'b0000)
                address <= address - 1;
            end    
        end
        // the value currently stored at that address in ram is displayed on the 7 segment display
 
        // the value to be written to ram is given by the switches
        // when the center button is pressed (corresponding to the debounced storeButton), the value corresponding to switches should be written into ram 
          
     
     
        always_ff @ (posedge clk)
        begin
        prevstoreButton <= conditionedstoreButton;
        //prevrightButton <= conditionedrightButton;
        //prevleftButton <= conditionedleftButton;
        
        we <= 0;
        if({prevstoreButton, conditionedstoreButton} == 2'b01) 
            begin
                we <= 1;
                ram_data_in <= sw;
            end     
       

        end
        
//        if({prevrightButton, conditionedrightButton} == 2'b01) 
//            begin
//                we <= 1;
//                ram_data_in <= ram_data_out + 1;
//            end     
        
//          we <= 0;
         
//         if({prevleftButton, conditionedleftButton} == 2'b01) 
//            begin
//                we <= 1;
//                ram_data_in <= ram_data_out - 1;
//            end     
//        end
        
        assign led = address;
        
          
endmodule
