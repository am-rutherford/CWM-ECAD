//////////////////////////////////////////////////////////////////////////////////
// Exercise #5 
// Student Name: Alexander Rutherford
// Date: 09/06/2020
//
//  Description: In this exercise, you need to implement a UK traffic lights 
//  sequencing system. 
//
//  inputs:
//           clk
//
//  outputs:
//           red, amber, green
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module lights(
	input clk,
	output red,
	output amber,
	output green
	);

	// define wires and registers
	reg [2:0] light
	

	// logic
	assign red = light[2];
	assign amber = light[1];
	assign green = light[0];

	always @(posedge clk) begin
		case (light)
		3'b100 : light <= 3'b110;
		3'b110 : light <= 3'b001;
		3'b001 : light <= 3'b001;
		default : light <= 3'b100
		endcase

	end

endmodule
