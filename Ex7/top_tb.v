//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #7 - Times Table
// Student Name: Alexander Rutherford
// Date: 11/06/2020
//
// Description: A testbench module to test Ex7 - Times Table
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    	);

	//parameters
	parameter CLK_PERIOD = 10;

	reg clk;
	reg read;
	reg err;
	reg [2:0] a, b;
	wire[5:0] result;

	//create CLK
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	initial begin
	err = 0;
	a = 1;
	b = 3;
	read = 1;
	#CLK_PERIOD
		forever begin
		#CLK_PERIOD
		$display("result = %b, when a=%b, and b=%b", result, a, b);
		if ((a==0&&b==0)&&(result!=0))begin
			err = 1;
			$display("*** Test Failed *** result = %b, when a=%b and b=%b", result, a, b);
		end

		a = a + 1;
		
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
    	top seven_multiplication(clk, a, b, read, result);


endmodule

