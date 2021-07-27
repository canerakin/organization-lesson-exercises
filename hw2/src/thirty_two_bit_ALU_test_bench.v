`define DELAY 20
module thirty_two_bit_ALU_test_bench();
reg [31:0] b;  
reg  ALUop2;
reg [31:0] a;
reg [31:0] less;
reg [31:0] c;
reg  ALUop0;
reg  ALUop1;
wire [31:0] carryout; 
wire [31:0] result;
  
 thirty_two_bit   thirty_two_bit_ALU_test(result,carryout,a, b,c,ALUop2,less,ALUop0,ALUop1);

initial begin

a =      32'b10001000000001000100000000000101;
b =      32'b10001000001000000100000000001101;
less =   32'b00000000000000000000000000000000;
c =      32'b00000000000000000000000000000000;
ALUop2 = 0;
ALUop0 = 0;
ALUop1 = 0;

#`DELAY;





end
initial
begin
$monitor(" S0 = %1b \n S1 = %1b \n      a = %32b \n      b = %32b \n result = %32b \n carry out = %32b\n",ALUop0 ,ALUop1 ,a ,b ,result,carryout);
end
 
endmodule