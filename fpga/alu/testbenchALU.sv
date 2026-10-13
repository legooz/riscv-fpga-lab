`timescale 1ns / 1ps
// ALU simulation: apply the recovered vectors and compare LED results.
// Course/scaffold attribution is recorded in NOTICE.md.


module testbenchALU();
    
    logic clk;
    logic [7:0] a, b;
    logic btnU, btnL, btnC, btnR, btnD;
    logic [7:0] led , ledExpected;
	logic [31:0] vectornum, errors;
	logic [28:0]  testvectors[10000:0];
	
	ALU ALUInstance( .a(a), .b(b), .btnU(btnU), .btnL(btnL), .btnC(btnC), .btnR(btnR), .btnD(btnD), .led(led) );

	always
		begin
			clk=0; #5; clk=1; #5;
		end 
      
	initial
		begin
			$readmemb("ALUtestvector.tv", testvectors);
			vectornum = 0; errors = 0;
		end
     
	//apply test vector inputs on rising edge of clock   
	always @(posedge clk)
		begin
			{btnU, btnL, btnC, btnR, btnD, a, b, ledExpected} = testvectors[vectornum];
		end
	//check results after rising edge of clock
    always @(posedge clk)
        begin
            #1;
            if( led !== ledExpected ) //check result 
            begin 
                $display("Error: inputs=%b", {btnU, btnL, btnC, btnR, btnD, a, b});
                $display("       outputs=%b (%b expected)", led, ledExpected);
                errors = errors + 1;     
            end
            vectornum = vectornum + 1;
            if( testvectors[vectornum] === 29'bx) //check for end of file
            begin
                $display("%d tests completed with %d errors", vectornum, errors);
                $finish;
            end
        end
          
 endmodule
