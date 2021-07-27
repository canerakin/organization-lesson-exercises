library verilog;
use verilog.vl_types.all;
entity thirty_two_bit is
    port(
        r_i             : out    vl_logic_vector(31 downto 0);
        c_i_plus        : out    vl_logic_vector(31 downto 0);
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        c               : in     vl_logic_vector(31 downto 0);
        alu_op_2        : in     vl_logic;
        less            : in     vl_logic_vector(31 downto 0);
        alu_op_0        : in     vl_logic;
        alu_op_1        : in     vl_logic
    );
end thirty_two_bit;
