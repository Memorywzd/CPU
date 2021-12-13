library verilog;
use verilog.vl_types.all;
entity CPU_dataflow is
    port(
        data_in         : in     vl_logic_vector(7 downto 0);
        clk_quick       : in     vl_logic;
        clk_slow        : in     vl_logic;
        clk_delay       : in     vl_logic;
        rst             : in     vl_logic;
        SW_choose       : in     vl_logic;
        A1              : in     vl_logic;
        CPUstate        : in     vl_logic_vector(1 downto 0);
        memaddr         : out    vl_logic_vector(15 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        acdbus          : out    vl_logic_vector(7 downto 0);
        rdbus           : out    vl_logic_vector(7 downto 0);
        clr             : out    vl_logic;
        arload          : out    vl_logic;
        arinc           : out    vl_logic;
        pcload          : out    vl_logic;
        pcinc           : out    vl_logic;
        drload          : out    vl_logic;
        irload          : out    vl_logic;
        rload           : out    vl_logic;
        acload          : out    vl_logic;
        pcbus           : out    vl_logic;
        acbus           : out    vl_logic;
        drhbus          : out    vl_logic;
        drlbus          : out    vl_logic;
        rbus            : out    vl_logic;
        read            : out    vl_logic;
        write           : out    vl_logic;
        membus          : out    vl_logic;
        busmem          : out    vl_logic
    );
end CPU_dataflow;
