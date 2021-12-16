//标志寄存器

module z(Din, ACin, clk, rst, Zload,Dout);

input [7:0] Din;
input [7:0] ACin;
input clk, rst, Zload;

output Dout;
reg Dout;

always @(posedge clk or negedge rst) begin
    if (!rst)
        Dout <= 0;
    else if (Zload)
    begin
        if(ACin == 8'b00000000)
            Dout <= 1;
        else Dout <= 0;
    end
end

endmodule