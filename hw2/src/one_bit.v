module one_bit (r_i, c_i_plus, a, b, c, alu_op_2, less, alu_op_0, alu_op_1);
	input a, b, c, alu_op_2, less, alu_op_0, alu_op_1;
	output r_i, c_i_plus;	
	
	wire r_0, r_1, r_2, r_3, r_less;
	wire answer_xor;
	wire and_2, and_3;
	wire or_2;
	wire not_1, not_2;
	
for_xor call_xor(answer_xor, b, alu_op_2);
	
	and and_for_r0(r_0, a, answer_xor);
	or or_for_r1(r_1, a, answer_xor);	
	
	not not_for_1(not_1, r_0);
	and and_for_2(and_2, not_1, r_1);
	
	and and_for_3(and_3, and_2, c);
	or or_for_2(or_2, and_2, c);
	
	or or_for_3(c_i_plus, and_3, r_0);
	
	not not_for_2(not_2, and_3);
	and and_for_less(r_less, not_2, or_2);
	and and_for_r2(r_2, not_2, or_2);
	
	
mux_module for_mux_module(r_i, r_0, r_1, r_2, r_less, alu_op_0, alu_op_1);
	
endmodule
