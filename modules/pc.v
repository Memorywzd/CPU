//程序计数器，输出当前执行的指令地址

module pc(Din, clk, rst, PCload, PCinc, Dout);

input [15:0] Din; //16位地址输入 来自于总线
input clk,        //1位时钟信号，进行时序控制 来自qtsj.v的输出clk_choose
      rst,        //1位复位信号，该位为1时系统正常工作、为0时系统复位 来自控制器
      PCload,     //1位载入信号，该位有效且clk有上升沿来临时将输入din直接由dout输出 来自控制器
      PCinc;      //1位PC++信号，该信号为1时PC++ 来自控制器

output [15:0] Dout; //16位地址输出 送往总线
reg [15:0] Dout;

always @(posedge clk or negedge rst) begin
    if (!rst)
			Dout <= 0;	
    else if (PCload)		
	    Dout <= Din;
	  else if (PCinc)
	    Dout <= Dout + 1;
end

endmodule