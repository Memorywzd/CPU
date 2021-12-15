//定义数据通路

module cpu(data_in,
           clk_quick, clk_slow, clk_delay,
           rst, SW_choose, A1, CPUstate, zout,
           memaddr, data_out, acdbus, rdbus, clr,
           arload, arinc, pcload, pcinc, drload,
           irload, acload, trload, acloadr,
           rload, zload, 
           pcbus, acbus, drhbus, drlbus, rbus, trbus,
           read, write, membus, busmem);

input [7:0] data_in;
input clk_quick, clk_slow, clk_delay;
input rst, SW_choose, A1;
input [1:0] CPUstate;

output [15:0] memaddr;
output [7:0] data_out;
output [7:0] acdbus;//AC寄存器的输出
output [7:0] rdbus;//R寄存器的输出
output clr, zout;
output arload, arinc, pcload, pcinc, drload, irload, acload, trload, acloadr, rload, zload;
output pcbus, acbus, drhbus, drlbus, rbus, trbus;
output read, write;
output membus, busmem;
//补充自行设计的控制信号的端口说明，都是output

//定义一些需要的内部信号
wire [3:0] alus;
wire clk_choose, clk_run;
wire [15:0] dbus;
wire [15:0] pcdbus;
wire [7:0] drdbus, trdbus, rdbus, acdbus, aludbus;
wire [7:0] instr;

//qtsj.v启停电路实例化
qtsj qtdl(.clk_quick(clk_quick),.clk_slow(clk_slow),.clk_delay(clk_delay),
          .clr(clr),.rst(rst),.SW_choose(SW_choose),.A1(A1),
          .cpustate(CPUstate),.clk_run(clk_run),.clk_choose(clk_choose));
//AR地址寄存器
ar mar(.Din(dbus),.clk(clk_choose),.rst(rst),.ARload(arload),.ARinc(arinc),.Dout(memaddr));
//PC程序计数器
pc mpc(.Din(dbus),.clk(clk_choose),.rst(rst),.PCload(pcload),.PCinc(pcinc),.Dout(pcdbus));
//DR数据寄存器
dr mdr(.Din(dbus[7:0]),.clk(clk_choose),.rst(rst),.DRload(drload),.Dout(drdbus));
//IR指令寄存器
ir mir(.Din(drdbus),.clk(clk_choose),.rst(rst),.IRload(irload),.Dout(instr));
//TR临时寄存器
tr mtr(.Din(drdbus),.clk(clk_choose),.rst(rst),.TRload(trload),.Dout(trdbus));
//R通用寄存器
r mr(.Din(dbus[7:0]),.clk(clk_choose),.rst(rst),.Rload(rload),.Dout(rdbus));
//AC累加寄存器
ac mac(.Din(aludbus),.Rin(dbus[7:0]),.clk(clk_choose),.rst(rst),.ACload(acload),.ACloadR(acloadr),.Dout(acdbus));
//ALU
alu malu(.alus(alus),.ac_n(acdbus),.bus_n(dbus[7:0]),.Dout(aludbus));
//Z状态字寄存器
z mz(.Din(aludbus),.clk(clk_choose),.rst(rst),.Zload(zload),.Dout(zout));
//controller控制器
control mcontroller(
    .instr(instr),.clk(clk_run),.rst(rst),.CPUstate(CPUstate),.Z(zout),
    .ARload(arload),.ARinc(arinc),.PCload(pcload),.PCinc(pcinc),.DRload(drload),.IRload(irload),.TRload(trload),
    .Rload(rload),.ACload(acload),.Zload(zload),.ACloadR(acloadr),
    .PCbus(pcbus),.DRlbus(drlbus),.DRhbus(drhbus),.TRbus(trbus),
    .Rbus(rbus),.ACbus(acbus),.alus(alus),.clr(clr),
    .mem_read(read),.mem_write(write),
    .mem2bus(membus),.bus2mem(busmem)
);

//allocate dbus
assign dbus[7:0]=(membus)?data_in[7:0]:8'bzzzzzzzz;
assign data_out=(busmem)?dbus[7:0]:8'bzzzzzzzz;

assign dbus[15:0]=(pcbus)?pcdbus[15:0]:16'bzzzzzzzzzzzzzzzz;

assign dbus[7:0]=(drlbus)?drdbus[7:0]:8'bzzzzzzzz;
assign dbus[15:8]=(drhbus)?drdbus[7:0]:8'bzzzzzzzz;

assign dbus[7:0]=(rbus)?rdbus[7:0]:8'bzzzzzzzz;

assign dbus[7:0]=(acbus)?acdbus[7:0]:8'bzzzzzzzz;
assign dbus[7:0]=(trbus)?trdbus[7:0]:8'bzzzzzzzz;

endmodule
