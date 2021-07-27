library verilog;
use verilog.vl_types.all;
entity mux_module is
    port(
        \out\           : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        d               : in     vl_logic;
        s0              : in     vl_logic;
        s1              : in     vl_logic
    );
end mux_module;
