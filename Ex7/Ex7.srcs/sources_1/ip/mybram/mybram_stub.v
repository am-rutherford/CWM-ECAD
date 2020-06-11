// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (lin64) Build 2700185 Thu Oct 24 18:45:48 MDT 2019
// Date        : Thu Jun 11 10:41:05 2020
// Host        : ip-172-31-6-222.eu-west-2.compute.internal running 64-bit CentOS Linux release 7.7.1908 (Core)
// Command     : write_verilog -force -mode synth_stub /home/centos/CWM-ECAD/Ex7/Ex7.srcs/sources_1/ip/mybram/mybram_stub.v
// Design      : mybram
// Purpose     : Stub declaration of top-level module interface
// Device      : xcvu9p-fsgd2104-2L-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module mybram(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[5:0],dina[5:0],douta[5:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [5:0]addra;
  input [5:0]dina;
  output [5:0]douta;
endmodule
