//组合逻辑控制单元，根据时钟生成为控制信号和内部信号

/*
输入：
       din：指令，8位，来自IR；
       clk：时钟信号，1位，上升沿有效；
       rst：复位信号，1位，与cpustate共同组成reset信号；
       cpustate：当前CPU的状态（IN，CHECK，RUN），2位；
       z：零标志，1位，零标志寄存器的输出，如果指令中涉及到z，可加上，否则可去掉；
输出：
      clr：清零控制信号
      自行设计的各个控制信号
*/

module controller(instr, clk, rst, CPUstate, 
                  ARload, PCinc, DRload, IRload,
                  Rload,
                  PCbus, 
                  ACbus,
                  alus,
                  mem_read, mem_write,
                  mem2bus, bus2mem);

input [7:0] instr;    //输入指令
input clk, rst;
input [1:0] CPUstate;

output ARload, PCinc, DRload, IRload,
       Rload,
       PCbus, 
       ACbus,
       mem_read, mem_write,
       mem2bus, bus2mem;
output [3:0] alus;
reg [3:0] alus;

//控制器状态
wire fetch1,fetch2,fetch3;
wire MOVAC1;

//译码器的输出,1为该指令有效,0为无效
reg i_NOP, i_LDAC, i_STAC, i_MOVAC;
reg i_MOVR, i_JUMP, i_JMPZ, i_JPNZ;
reg i_ADD, i_SUB, i_INAC, i_CLAC;
reg i_AND, i_OR, i_XOR, i_NOT;

//时钟节拍，8个为一个指令周期
reg t0, t1, t2, t3, t4, t5, t6, t7; 

//parameter's define
wire reset;

// signals for the counter
wire clr; //清零
wire inc; //自增
// assign signals for the cunter
assign reset = rst & (CPUstate == 2'b11);

//clr信号是每条指令执行完毕后必做的清零
assign clr = MOVAC1;//或上其他的末尾周期
assign inc = ~clr;

//生成指令信号
//取公过程
assign fetch1=t0;
assign fetch2=t1;
assign fetch3=t2;

assign MOVAC1 = i_MOVAC && t3;

//生成控制信号
assign ARload = fetch1 ||fetch3;
assign PCinc = fetch2;
assign DRload = fetch2;
assign IRload = fetch3;

assign Rload = MOVAC1;

assign PCbus = fetch1;
assign ACbus = MOVAC1;

assign mem_read = fetch2;
assign mem2bus = fetch2;

//assign alus = 
always @(MOVAC1) begin
	alus = 4'bxxxx;
end

//指令译码    
always @(posedge clk or negedge reset) begin
       if(!reset)
	begin//各指令清零，以下已为nop指令清零，请补充其他指令，为其他指令清零
	    i_NOP <= 1;
		i_LDAC <= 0;
		i_STAC <= 0;
		i_MOVAC <= 0;

		i_MOVR <= 0;
		i_JUMP <= 0;
		i_JMPZ <= 0;
		i_JPNZ <= 0;

		i_ADD <= 0;
		i_SUB <= 0;
		i_INAC <= 0;
		i_CLAC <= 0;

		i_AND <= 0;
		i_OR <= 0;
		i_XOR <= 0;
		i_NOT <= 0;
	end
else 
begin
	//alus初始化为x，加上将alus初始化为x的语句，后续根据不同指令为alus赋值
	
	if(instr[7:4] == 0000)//译码处理过程
	begin
		case(instr[3:0])
		0:  begin//指令低4位为0，应该是nop指令，因此这里inop的值是1，而其他指令应该清零，请补充为其他指令清零的语句
			i_NOP <= 1;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
		end
		1:  begin
			//指令低4位为0001，应该是ildac指令，因此ildac指令为1，其他指令都应该是0。
			//该指令需要做一个加0运算，详见《示例机的设计Quartus II和使用说明文档》中“ALU的设计”，因此这里要对alus赋值
			//后续各分支类似，只有一条指令为1，其他指令为0，以下分支都给出nop指令的赋值，需要补充其他指令，注意涉及到运算的都要对alus赋值
			i_NOP <= 0;
			i_LDAC <= 1;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		2:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 1;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		3:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 1;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		4:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 1;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		5:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 1;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		6:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 1;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		7:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 1;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		8:  begin
			i_NOP <= 1;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 1;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
		9:  begin
			i_NOP <= 1;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 1;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
			
		end
        10:  begin
            i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 1;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
              end
        11:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 1;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
              end
        12:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 1;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 0;
              end
        13:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 1;
			i_XOR <= 0;
			i_NOT <= 0;
              end
        14:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 1;
			i_NOT <= 0;
              end
        15:  begin
			i_NOP <= 0;
			i_LDAC <= 0;
			i_STAC <= 0;
			i_MOVAC <= 0;

			i_MOVR <= 0;
			i_JUMP <= 0;
			i_JMPZ <= 0;
			i_JPNZ <= 0;

			i_ADD <= 0;
			i_SUB <= 0;
			i_INAC <= 0;
			i_CLAC <= 0;

			i_AND <= 0;
			i_OR <= 0;
			i_XOR <= 0;
			i_NOT <= 1;
              end
		//如果还有分支，可以继续写，如果没有分支了，写上defuault语句	
		endcase
	end
end
end

//节拍生成
always @(posedge clk or negedge reset) begin
if(!reset) //reset清零
begin
	t0<=1;
	t1<=0;
	t2<=0;
	t3<=0;
	t4<=0;
	t5<=0;
	t6<=0;
	t7<=0;
end
else
begin
	if(inc) //运行
	begin
	t7<=t6;
	t6<=t5;
	t5<=t4;
	t4<=t3;
	t3<=t2;
	t2<=t1;
	t1<=t0;
	t0<=0;
	end
	else if(clr) //清零
	begin
	t0<=1;
	t1<=0;
	t2<=0;
	t3<=0;
	t4<=0;
	t5<=0;
	t6<=0;
	t7<=0;
	end
end
end

endmodule
