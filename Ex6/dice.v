//////////////////////////////////////////////////////////////////////////////////
// Exercise #4 
// Student Name: Alexander Rutherford
// Date: 09/06/2020
//
//  Description: In this exercise, you need to design an electronic dice, following
//  the diagram provided in the exercises documentation. The dice rolls as long as
//  a button is pressed, and stops when it is released. 
//
//  inputs:
//           clk, rst, button
//
//  outputs:
//           throw [2:0]
//
//  You need to write the whole file.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module dice(
  	input clk,
    	input rst,
    	input button,
    	output reg [2:0] throw
    	);

	
	always @(posedge clk) begin
		if (rst)
			throw <= 3'b000;
		else begin
		if (throw < 3'b110)
			throw <= throw + button;
		else 
		if ((throw == 3'b000)||(throw == 3'b111)||((throw == 3'b110)&&button))
			throw <= 3'b001;
		end
	end


endmodule
