//////////////////////////////////////////////////////////////////////////////////
// Exercise #2 
// Student Name: Alexander Rutherford
// Date: 08/06/2020
//
//  Description: In this exercise, you need to design a multiplexer, where the  
//  output acts according to the following truth table:
//
//  sel | out
// -----------------
//   0  | a
//   1  | b
//
//  inputs:
//           a, b, sel
//
//  outputs:
//           out
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module mux(
    input clk,
    input [2:0] a,
    input [2:0] b,
    input sel,
    output reg [2:0] out
    );
    
    //Todo: define registers and wires here

    //Todo: define your logic here   
    always @(posedge clk)
	out = (sel) ? b : a; 
      
endmodule
