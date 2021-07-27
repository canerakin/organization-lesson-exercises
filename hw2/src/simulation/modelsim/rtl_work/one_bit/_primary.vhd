library verilog;
use verilog.vl_types.all;
entity one_bit is
    port(
        r_i             : out    vl_logic;
        c_i_plus        : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        c               : in     vl_logic;
        alu_op_2        : in     vl_logic;
        less            : in     vl_logic;
        alu_op_0        : in     vl_logic;
        alu_op_1        : in     vl_logic
    );
end one_bit;
