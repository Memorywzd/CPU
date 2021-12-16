//数据寄存器，存放双指令中低8位指向地址的存放值

module dr(Din, clk, rst, DRload, Dout);

input [7:0] Din;

input clk, rst, DRload;

output [7:0] Dout;
reg [7:0] Dout;

always @ (posedge clk or negedge rst) begin
	if(!rst)
	    Dout <= 0;
	else if(DRload)
	    Dout <= Din;
end

endmodule