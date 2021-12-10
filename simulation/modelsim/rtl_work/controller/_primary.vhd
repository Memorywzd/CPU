library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        instr           : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        CPUstate        : in     vl_logic_vector(1 downto 0);
        ARload          : out    vl_logic;
        PCinc           : out    vl_logic;
        DRload          : out    vl_logic;
        IRload          : out    vl_logic;
        Rload           : out    vl_logic;
        PCbus           : out    vl_logic;
        ACbus           : out    vl_logic;
        alus            : out    vl_logic_vector(3 downto 0);
        mem_read        : out    vl_logic;
        mem_write       : out    vl_logic;
        mem2bus         : out    vl_logic;
        bus2mem         : out    vl_logic
    );
end controller;
