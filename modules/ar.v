//地址寄存器，输出要执行的下一指令地址

module ar(Din, clk, rst, ARload, ARinc, Dout);

input [15:0] Din;   //16位地址 来自于总线
input clk,          //1位时钟信号，进行时序控制 来自qtsj.v的输出clk_choose
      rst,          //1位复位信号，该位为1时系统正常工作、为0时系统复位 来自控制器
      ARload,       //1位载入信号，其有效且clk有上升沿来临时将输入din直接由dout输出 来自控制器
      ARinc;        //1位AR++信号，该信号为1时AR++ 来自控制器

output [15:0] Dout; //16位地址 送往存储器或连接到的数码管
reg [15:0] Dout;

always@(posedge clk or negedge rst) begin//clk上升沿 rst下降沿执行
if(!rst)
	Dout <= 0;             //复位信号 输出清零
else
	if(ARload)
		Dout <= Din;       //载入使能 din输出给dout
	else if(ARinc)
		Dout <= Dout + 1;  //自增使能 地址自增
end

endmodule
