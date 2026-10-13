
module blinkersTestbench();
    
logic clk, reset, turnSignal;
logic [2:0] blinkingLights , blinkingLightsExpected;
logic [31:0] vectornum, errors;
logic [4:0]  testvectors[10000:0];
	
    	blinkers blinkersInstance( .clk(clk), .reset(reset), .turnSignal(turnSignal), .blinkingLights(blinkingLights) );
 
	always
		begin
			clk=0; #5; clk=1; #5;
		end 
      
	initial
		begin
			$readmemb("blinkers.tv", testvectors);
			vectornum = 0; errors = 0;
		end
     
	//apply test vector inputs on falling edge of clock   
	always @(negedge clk)
		begin
			#4;
			{reset,turnSignal,blinkingLightsExpected} = testvectors[vectornum];
		end

	//check results after rising edge of clock
    always @(posedge clk)
        begin
            #1; //wait slight after rising edge
            if( blinkingLights !== blinkingLightsExpected ) //check result 
            begin 
                $display("Error: inputs=%b", {reset,turnSignal});
                $display("       outputs=%b%b%b (%b%b%b expected)", blinkingLights[2], blinkingLights[1], blinkingLights[0], blinkingLightsExpected[2], blinkingLightsExpected[1], blinkingLightsExpected[0]);
                errors = errors + 1;     
            end
            vectornum = vectornum + 1;
            if( testvectors[vectornum] === 5'bx) //check for end of file
            begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
          
 endmodule
