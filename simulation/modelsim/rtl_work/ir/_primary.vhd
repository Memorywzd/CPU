library verilog;
use verilog.vl_types.all;
entity ir is
    port(
        Din             : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        IRload          : in     vl_logic;
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end ir;
