library verilog;
use verilog.vl_types.all;
entity for_xor is
    port(
        \out\           : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end for_xor;
