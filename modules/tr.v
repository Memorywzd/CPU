//数据暂存器,处理双字节指令时使用，用来存储低八位的地址或数值

module tr(Din, clk, rst, TRload, Dout);

input [7:0] Din;
input clk, rst, TRload;

output [7:0] Dout;
reg [7:0] Dout;

always @(posedge clk or negedge rst) begin
    if (!rst)
        Dout <= 0;
    else if (TRload)
        Dout <= Din;
end

endmodule