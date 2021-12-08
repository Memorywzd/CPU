//存储器，完成IN状态的输入，CHECK状态的检查，RUN状态的写入

/*输入clk：时钟信号，进行时序控制；1位，来自分频程序clk_div的输出；只在IN和CHECK状态时，其上升沿有效；
   输入data_in：数据输入；8位，来自于cpu模块的data_out，即cpu写入存储器的数据；
   输入addr：地址；16位，来源于地址寄存器ar模块的输出；
   输入A1：为按钮key1，按下时（置0）有效，在IN状态下进行存储操作，在CHECK状态下进行检查操作；
   输入reset：为清零信号，1位，为零时有效，将内部计数器清零，将内部延时信号置1；
   输入read：为控制信号，1位，1为有效，读出存储器ram[addr2]或memory[addr1]的值；
   输入write：为控制信号，1位，1为有效，将data_in写入ram[addr2]；
   输入cpustate：cpu的状态，2位，01表示输入（IN状态），10表示检查（CHECK状态），11表示运行（RUN状态）
   输入D：由实验开发板上SW7-SW0拨动开关的值组成，IN状态下按下A1按钮时进行存储操作，将指令存在内部寄存器memory中；
   输出data_out：8位，只在RUN状态下有效，其余状态时为高阻态，有效时如果addr[15:5]=0（即当前地址在0-31）则输出memeory[addr1]的内容，如果addr[15:5]!=0，则输出ram[addr2] 的内容；
   输出check_out：8位，只在CHECK状态下有效，其余状态为高阻态，有效时输出当前地址cnt在memory存储的指令。
*/

module memory(clk,data_in,addr,A1,reset,read,write,cpustate,D,data_out,check_out);


endmodule
