//R通用寄存器，用来存放第二个操作数

module r(Din, clk, rst, Rload, Dout);

input [7:0] Din;
input clk, rst, Rload;

output [7:0] Dout;
reg [7:0] Dout;

always @(posedge clk or negedge rst) begin
    if (!rst)
        Dout <= 0;
    else if (Rload)
        Dout <= Din;
end

endmodule
