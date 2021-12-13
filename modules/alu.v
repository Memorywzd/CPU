//算术逻辑单元

module alu(alus, ac_n, bus_n, Dout);

input [3:0] alus;  //4位alu功能选择信号 来自控制器
input [7:0] ac_n;  //8位来自AC的操作数
input [7:0] bus_n; //8位来自总线的操作数

output [7:0] Dout; //8位运算输出 送往AC
reg [7:0] Dout;

always @(ac_n or bus_n or alus) begin
    case (alus)
        4'b0000:
        begin
            Dout = 8'b00000000;//clac 清零
        end
        4'b0001:
        begin
            Dout = ac_n + bus_n;//add 加法
        end
        4'b0010:
        begin
            Dout = ac_n - bus_n;//sub 减法
        end
        4'b0011:
        begin
            Dout = ac_n + 8'b00000001;//inac 自加
        end
        4'b0100:
        begin
            Dout = ac_n & bus_n;//and
        end
        4'b0101:
        begin
            Dout = ac_n | bus_n;//or
        end
        4'b0110:
        begin
            Dout = ~ac_n;//not
        end
        4'b0111:
        begin
            Dout = (~ac_n & bus_n) | (ac_n & ~bus_n);//xor
        end
        4'b1000:
        begin
            Dout = bus_n;//ldac
        end
        default:
            Dout = 8'bzzzzzzzz;
    endcase
end

endmodule
