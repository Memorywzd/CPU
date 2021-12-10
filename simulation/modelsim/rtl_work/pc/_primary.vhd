library verilog;
use verilog.vl_types.all;
entity pc is
    port(
        Din             : in     vl_logic_vector(15 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PCload          : in     vl_logic;
        PCinc           : in     vl_logic;
        Dout            : out    vl_logic_vector(15 downto 0)
    );
end pc;
