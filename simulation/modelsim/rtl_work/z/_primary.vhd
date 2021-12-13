library verilog;
use verilog.vl_types.all;
entity z is
    port(
        Din             : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Zload           : in     vl_logic;
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end z;
