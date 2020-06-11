//////////////////////////////////////////////////////////////////////////////////
// Exercise #8
// Student Name: Alexander Rutherford
// Date: 11/06/2020
//
//  Description: In this exercise, you need to implement a times table of 0..7x0..7
//  using a memory and AXI-4-lite interface.
//
//  inputs:
//           clk, rst, a[2:0], b[2:0], read
//
//  outputs:
//           result[5:0]
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 100ps

module top(
	input clk,
	input rst,
	input [2:0] a,
	input [2:0] b,
	input read,
	output [5:0] result
	);

	//registers and wires
	wire [31:0] rdata;

	assign result[0] = rdata[0];
	assign result[1] = rdata[1];
	assign result[2] = rdata[2];
	assign result[3] = rdata[3];
	assign result[4] = rdata[4];
	assign result[5] = rdata[5]


blk_mem_gen_0 blk_mem_gen_0 (
  //.rsta_busy(rsta_busy),          // output wire rsta_busy -- Noa "can write values directly"
  //.rstb_busy(rstb_busy),          // output wire rstb_busy
  .s_aclk(clk),                // input wire s_aclk
  .s_aresetn(rst),          // input wire s_aresetn
  .s_axi_awaddr(32'b0),    // input wire [31 : 0] s_axi_awaddr  
  .s_axi_awvalid(1'b0),  // input wire s_axi_awvalid
  //.s_axi_awready(s_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(32'b0),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(4'b0),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(1'b0),    // input wire s_axi_wvalid
  //.s_axi_wready(s_axi_wready),    // output wire s_axi_wready
  //.s_axi_bresp(s_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  //.s_axi_bvalid(s_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(1'b0),    // input wire s_axi_bready
  .s_axi_araddr({26'b0, a, b}),    // input wire [31 : 0] s_axi_araddr --- {26'b0, a, b}
  .s_axi_arvalid(1'b1),  // input wire s_axi_arvalid
  //.s_axi_arready(s_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(rdata),      // output wire [31 : 0] s_axi_rdata ---- 
  //.s_axi_rresp(s_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  //.s_axi_rvalid(1'b1),    // output wire s_axi_rvalid
  .s_axi_rready(1'b1)     // input wire s_axi_rready
);

endmodule
