library verilog;
use verilog.vl_types.all;
entity ar is
    port(
        Din             : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        ARload          : in     vl_logic;
        ARinc           : in     vl_logic;
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end ar;
