//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #5 - Traffic Lights
// Student Name: Alexander Rutherford
// Date: 09/06/2020
//
// Description: A testbench module to test Ex5 - Traffic Lights
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
    	reg [2:0] light_prev;
	wire [2:0] light;
	
	//light = red, amber, green

	//create clk
    	initial begin
       	clk = 1'b0;
       		forever
         	#(CLK_PERIOD/2) clk=~clk;
    	end

	//logic
	initial begin
	err = 0;
	//light_prev = 0;
	

	#CLK_PERIOD
	light_prev = light;
	forever begin
		#CLK_PERIOD
		$display("light= %b, light_prev = %b", light, light_prev);

		if ((light == 3'b000)||(light == 3'b101)||(light == 3'b011)||(light == 3'b111)) begin
			err = 1;
			$display("*** Test Failed :( *** light = %b", light);
		end
		
		if (((light == 3'b110)&&(light_prev != 3'b100))||((light == 3'b001)&&(light_prev != 3'b110))||((light == 3'b010)&&(light_prev != 3'b001))) begin
			err = 1;
			$display("*** Test Failed :( *** light = %b and light_prev = %b", light, light_prev);	
		end

		light_prev = light;
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
    	lights top(clk, light[2], light[1], light[0]);

endmodule
