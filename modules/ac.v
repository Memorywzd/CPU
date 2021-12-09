//AC通用寄存器，存储第一个操作数

module ac(Din, clk, rst, ACload, Dout);

input [7:0] Din; //8位操作数 来自ALU
input clk,       //1位时钟信号，进行时序控制 来自qtsj.v的输出clk_choose
      rst,       //1位复位信号，该位为1时系统正常工作、为0时系统复位 来自控制器
      ACload;    //1位载入信号，其有效且clk有上升沿来临时将输入din直接由dout输出 来自控制器

output [7:0] Dout;
reg [7:0] Dout;

always @(posedge clk) begin
    if (!rst)
        Dout <= 0;
    else if (ACload)
        Dout <= Din;
end

endmodule
