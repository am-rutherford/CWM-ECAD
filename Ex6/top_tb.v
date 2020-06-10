//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #6 - Dice or Traffic Lights?
// Student Name: Alexander Rutherford
// Date: 10/06/2020
//
// Description: A testbench module to test Ex6 - Dice or Traffic Lights?
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
	reg sel;
	reg [2:0] result_prev;
	wire [2:0] result;


	//create CLK
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	//logic
	initial begin
	err = 0;
	rst = 1;
	sel = 1;
	button = 1;
	
	#CLK_PERIOD
	rst = 0;
	result_prev = result;
	forever begin
		#CLK_PERIOD
		$display("Result = %b, sel = %b, rst = %b", result, sel, rst);
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
    	top dice_or_light(clk, rst, button, sel, result);

endmodule
