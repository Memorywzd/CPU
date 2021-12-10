library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        alus            : in     vl_logic_vector(3 downto 0);
        ac_n            : in     vl_logic_vector(7 downto 0);
        bus_n           : in     vl_logic_vector(7 downto 0);
        Dout            : out    vl_logic_vector(7 downto 0)
    );
end alu;
