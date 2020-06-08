//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name:
// Date: 
//
// Description: A testbench module to test Ex3 - counter
// Guidance: start with simple tests of the module (how should it react to each 
// control signal?). Don't try to test everything at once - validate one part of 
// the functionality at a time.
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top_tb(
    );
    
//Todo: Parameters
    parameter CLK_PERIOD = 10;

//Todo: Regitsers and wires
    reg clk;
    reg direction;
    reg rst;
    reg enable;
    reg [7:0] counter_out;
    reg err;

//Todo: Clock generation
    initial
    begin
       clk = 1'b0;
       forever
         #(CLK_PERIOD/2) clk=~clk;
    end

//Todo: User logic
    initial begin
    err = 0;
    rst = 0;
    direction = 1;
    
//Todo: Finish test, check for success

//Todo: Instantiate counter module
count counter(clk, rst, enable, direction, counter_out);


endmodule 
