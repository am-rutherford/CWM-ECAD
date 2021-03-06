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
	output reg red,
	output reg amber,
	output reg green
	);
	

	// logic
	always @(posedge clk) begin
		case ({red, amber, green})
		3'b100 : begin 
			red = 1;
			amber = 1;
			green = 0;
			end
		3'b110 : begin 
			red = 0;
			amber = 0;
			green = 1;
			end
		3'b001 : begin 
			red = 0;
			amber = 1;
			green = 0;
			end
		default : begin 
			red = 1;
			amber = 0;
			green = 0;
			end
		endcase

	end

endmodule
