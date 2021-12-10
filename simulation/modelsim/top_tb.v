// Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, the Altera Quartus II License Agreement,
// the Altera MegaCore Function License Agreement, or other 
// applicable license agreement, including, without limitation, 
// that your use is for the sole purpose of programming logic 
// devices manufactured by Altera and sold by Altera or its 
// authorized distributors.  Please refer to the applicable 
// agreement for further details.

// *****************************************************************************
// This file contains a Verilog test bench template that is freely editable to  
// suit user's needs .Comments are provided in each section to help the user    
// fill out necessary details.                                                  
// *****************************************************************************
// Generated on "11/25/2020 01:28:30"
                                                                                
// Verilog Test Bench template for design : top
// 
// Simulation tool : ModelSim-Altera (Verilog)
// 

`timescale 100 us/ 1 ps
module top_vlg_tst();
// constants                                           
// general purpose registers
//reg eachvec;
// test vector input registers
reg A1;
reg [7:0] D;
reg SW1;
reg SW2;
reg SW_choose;
reg clk;
reg rst;
// wires                                               
wire [6:0]  HEX0;
wire [6:0]  HEX1;
wire [6:0]  HEX2;
wire [6:0]  HEX3;
wire [6:0]  HEX4;
wire [6:0]  HEX5;
wire [6:0]  HEX6;
wire [6:0]  HEX7;
wire acbus_led;
wire [7:0]  acdbus;
wire acload_led;
wire [15:0]  addr;
wire arinc_led;
wire arload_led;
wire busmem_led;
wire [7:0]  check_out;
wire clr_led;
wire [1:0]  cpustate_led;
wire [7:0]  data;
wire drhbus_led;
wire drlbus_led;
wire drload_led;
wire irload_led;
wire membus_led;
wire pcbus_led;
wire pcinc_led;
wire pcload_led;
wire quick_low_led;
wire [7:0]  rambus;
wire rbus_led;
wire [7:0]  rdbus;
wire read_led;
wire rload_led;
wire trbus_led;
wire trload_led;
wire write_led;
wire zload_led;

// assign statements (if any)                          
top i1 (
// port map - connection between master ports and signals/registers   
	.A1(A1),
	.D(D),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5),
	.HEX6(HEX6),
	.HEX7(HEX7),
	.SW1(SW1),
	.SW2(SW2),
	.SW_choose(SW_choose),
	.acbus_led(acbus_led),
	.acdbus(acdbus),
	.acload_led(acload_led),
	.addr(addr),
	.arinc_led(arinc_led),
	.arload_led(arload_led),
	.busmem_led(busmem_led),
	.check_out(check_out),
	.clk(clk),
	.clr_led(clr_led),
	.cpustate_led(cpustate_led),
	.data(data),
	.drhbus_led(drhbus_led),
	.drlbus_led(drlbus_led),
	.drload_led(drload_led),
	.irload_led(irload_led),
	.membus_led(membus_led),
	.pcbus_led(pcbus_led),
	.pcinc_led(pcinc_led),
	.pcload_led(pcload_led),
	.quick_low_led(quick_low_led),
	.rambus(rambus),
	.rbus_led(rbus_led),
	.rdbus(rdbus),
	.read_led(read_led),
	.rload_led(rload_led),
	.rst(rst),
	.trbus_led(trbus_led),
	.trload_led(trload_led),
	.write_led(write_led),
	.zload_led(zload_led)
);
initial
begin
	A1 = 1;
	SW1 = 0;
	SW2 = 0;
	SW_choose = 1;//选择快时钟
	clk = 0;
	rst = 1;
end

always #2 clk = ~clk;

initial
begin
	#50 rst = 0;
	SW1 = 1;
	#50 rst = 1;
//IN
	#50 D = 8'b00000011;//0,nop memorywzd: 1,MOVAC
	#100 A1 = 0;
	#300 A1 = 1;
	//以下补充自行设计的指令，每条指令的格式为D=8‘bxx...；A1=0；A1=1；
	//D是指令的二进制机器码，A1=0表示按下key1，A1=1表示key1弹起
	//这里的D最多有32个，因为memory只有32个存储单元
    
    
//CHECK
	#50 SW1 = 0;
		SW2 = 1;
		rst = 0;
	#50 rst = 1;
	#200 A1 = 0;
	#300 A1 = 1;
	//以下补充A1的按下和弹起，每按下一次检查一条指令
//RUN
	#20	rst = 0;
	#10 rst = 1;
	#20 SW1 = 1;
	
	#100 A1 = 0;
	#400 A1 = 1;
	//以下补充A1的按下和弹起，每按下一次运行指令
	
	
	#300 $finish;
end
                                              
endmodule

