//////////////////////////////////////////////////////////////////////////////////
// Test bench for Exercise #3 - Up/Down counter
// Student Name: Alexander Rutherford
// Date: 08/06/2020
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
    wire [7:0] counter_out;
    reg [7:0] counter_prev;
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

    counter_prev = 0;
    err = 0;
    rst = 0;
    direction = 1;
    enable = 1;

      forever begin
	#CLK_PERIOD
      	//Test whether counter = 0 when reset = 1
	if (rst&(counter_out != 0)) begin
	  err = 1;
          $display("***TEST FAILED! counter==%d when reset==%d, enable==%d ***",counter_out,rst,enable);
	end
	//Test if counter goes in the correct direction
	if (direction&(counter_out != (counter_prev+1)) | !direction&(counter_out != (counter_prev-1))) begin
	  err = 1;
	  $display("***TEST FAILED! counter==%d and counter_prev=%d when direction=%d ***",counter_out,counter_prev,direction);
	end
	//Test if enable works correctly
	if (((!enable)&(counter_out != counter_prev)) | (enable&(counter_out == counter_prev))) begin
	  err = 1;
	  $display("***TEST FAILED! counter==%d and counter_prev=%d when enable=%d ***",counter_out,counter_prev,enable);
	end
      	counter_prev = counter_out;
      	if (counter_out == 0)
	  direction = ~direction;
      	
      end

    end
    
//Todo: Finish test, check for success
      initial begin
        #100 
        if (err==0)
          $display("***TEST PASSED! :) ***");
        $finish;
      end


//Todo: Instantiate counter module
    //counter top(clk, rst, enable, direction, counter_out);
    counter top(
    .rst (rst),
    .enable (enable),
    .direction (direction),
    .clk (clk),
    .counter_out (counter_out));


endmodule 
