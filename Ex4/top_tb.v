//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #4 - Electronic Dice
// Student Name: Alexander Rutherford
// Date: 09/06/2020
//
// Description: A testbench module to test Ex4 - Electronic Dice
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    	);

	//parameters
    	parameter CLK_PERIOD = 10;

	//registers and wires
    	reg clk;
	reg err;
    	reg rst;
	reg button;
	wire [2:0] throw;
	reg [2:0] throw_prev;
	
	//clock generation
    	initial
    	begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	//Logic
	initial begin
		err = 0;
		button = 1;
		rst = 1;
		throw_prev = 0;


		#CLK_PERIOD
		rst = 0;
		forever begin
			#CLK_PERIOD
			$display("throw = %d and throw_prev = %d", throw, throw_prev);
						
			if (rst&(throw!=0)) begin
				err = 1;
				$display("*** Test Failed :( *** reset error");
			end
			
			if (((throw == 0)&(rst!=0))|(throw == 3'b111)) begin
				err = 1;
				$display("*** Test Failed :( *** out of bounds, throw = %d", throw);
			end

			if ((button&&(throw==throw_prev)) || (!button&&(throw!=throw_prev))) begin
				err = 1;
				$display("*** Test Failed :( *** button error, button = %d", button);
			end

			throw_prev = throw;
			button =!button;
		end		

	end
	

	//Determine success
      	initial begin
        	#500
        	if (err==0)
          		$display("***TEST PASSED! :) ***");
        	$finish;
      	end
	
	//instance dice module
    	dice top(clk, rst, button, throw);

endmodule


