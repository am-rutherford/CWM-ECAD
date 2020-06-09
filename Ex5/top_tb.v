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
    	reg [2:0] light;
	wire [2:0] throw;
	reg [2:0] throw_prev;
	
