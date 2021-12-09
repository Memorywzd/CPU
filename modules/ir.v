//指令寄存器，存储要执行的指令
//注意：该寄存器是时钟的下降沿有效

module ir(Din, clk, rst, IRload, Dout);

input [7:0] Din;
input clk, rst, IRload;

output [7:0] Dout;
reg [7:0] Dout;

always @ (negedge clk) begin
	if(!rst)
        Dout <= 0;
	else if (IRload)
        Dout <= Din;
end

endmodule