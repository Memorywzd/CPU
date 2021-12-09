//标志寄存器

module z(Din, clk, rst, Zload,Dout);

input [7:0] Din;
input clk, rst, Zload;

output [7:0] Dout;
reg [7:0] Dout;

always @(posedge clk) begin
    if (!rst)
        Dout <= 0;
    else if (Zload)
        Dout <= Din;
end

endmodule