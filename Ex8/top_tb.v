//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #8 - Times Table using AXI interface
// Student Name: Alexander Rutherford
// Date: 11/06/2020
//
// Description: A testbench module to test Ex8 - Times Table using AXI4-Lite
// You need to write the whole file
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    	);

	//parameters
	parameter CLK_PERIOD = 10;

	reg clk;
	reg read;
	reg rst;
	reg err;
	reg [2:0] a, b, a_prev, b_prev;
	wire[5:0] result;
	wire [31:0] rdata;
	wire [31:0] araddr;

	//create CLK
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	initial begin
	err = 0;
	a = 0;
	b = 0;
	a_prev = a;
	b_prev = b;
	read = 1;
	rst = 0;
	#CLK_PERIOD
	rst = 1;
	#CLK_PERIOD
		
	if ((a==0&&b==0)&&(result!=0))begin
		err = 1;
		$display("*** Test Failed *** result = %b, when a=%b and b=%b", result, a, b);
		end

	a = 1;
	b = 7;

	forever begin
		#CLK_PERIOD
		
		if (result != (a_prev*b_prev)) begin
			$display("*** Test Failed ***");
			err = 1;
		end
		//$display("result = %b, when a=%b, and b=%b, a_prev = %b, b_prev=%b", result, a, b, a_prev, b_prev);
		a_prev = a;
		b_prev = b;		
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
    	top seven_multiplication(clk, rst, a, b, read, result, rdata, araddr);


endmodule
