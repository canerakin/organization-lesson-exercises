module thirty_two_bit (r_i, c_i_plus, a, b, c, alu_op_2, less, alu_op_0, alu_op_1);
	input [31:0] a;
	input [31:0] b;
	input [31:0] less;
	input [31:0] c;
	input alu_op_0;
	input alu_op_1;
	input alu_op_2;
	output [31:0] r_i;
	output [31:0] c_i_plus;	
one_bit for_operation_0(r_i[0], c_i_plus[0], a[0], b[0], c[0], alu_op_2, less[0], alu_op_0, alu_op_1);

one_bit for_operation_1(r_i[1], c_i_plus[1], a[1], b[1], c_i_plus[0], alu_op_2, less[1], alu_op_0, alu_op_1);

one_bit for_operation_2(r_i[2], c_i_plus[2], a[2], b[2], c_i_plus[1], alu_op_2, less[2], alu_op_0, alu_op_1);

one_bit for_operation_3(r_i[3], c_i_plus[3], a[3], b[3], c_i_plus[2], alu_op_2, less[3], alu_op_0, alu_op_1);

one_bit for_operation_4(r_i[4], c_i_plus[4], a[4], b[4], c_i_plus[3], alu_op_2, less[4], alu_op_0, alu_op_1);

one_bit for_operation_5(r_i[5], c_i_plus[5], a[5], b[5], c_i_plus[4], alu_op_2, less[5], alu_op_0, alu_op_1);

one_bit for_operation_6(r_i[6], c_i_plus[6], a[6], b[6], c_i_plus[5], alu_op_2, less[6], alu_op_0, alu_op_1);

one_bit for_operation_7(r_i[7], c_i_plus[7], a[7], b[7], c_i_plus[6], alu_op_2, less[7], alu_op_0, alu_op_1);

one_bit for_operation_8(r_i[8], c_i_plus[8], a[8], b[8], c_i_plus[7], alu_op_2, less[8], alu_op_0, alu_op_1);

one_bit for_operation_9(r_i[9], c_i_plus[9], a[9], b[9], c_i_plus[8], alu_op_2, less[9], alu_op_0, alu_op_1);

one_bit for_operation10(r_i[10], c_i_plus[10], a[10], b[10], c_i_plus[9], alu_op_2, less[10], alu_op_0, alu_op_1);

one_bit for_operation11(r_i[11], c_i_plus[11], a[11], b[11], c_i_plus[10], alu_op_2, less[11], alu_op_0, alu_op_1);

one_bit for_operation12(r_i[12], c_i_plus[12], a[12], b[12], c_i_plus[11], alu_op_2, less[12], alu_op_0, alu_op_1);

one_bit for_operation13(r_i[13], c_i_plus[13], a[13], b[13], c_i_plus[12], alu_op_2, less[13], alu_op_0, alu_op_1);

one_bit for_operation14(r_i[14], c_i_plus[14], a[14], b[14], c_i_plus[13], alu_op_2, less[14], alu_op_0, alu_op_1);

one_bit for_operation15(r_i[15], c_i_plus[15], a[15], b[15], c_i_plus[14], alu_op_2, less[15], alu_op_0, alu_op_1);

one_bit for_operation16(r_i[16], c_i_plus[16], a[16], b[16], c_i_plus[15], alu_op_2, less[16], alu_op_0, alu_op_1);

one_bit for_operation17(r_i[17], c_i_plus[17], a[17], b[17], c_i_plus[16], alu_op_2, less[17], alu_op_0, alu_op_1);

one_bit for_operation18(r_i[18], c_i_plus[18], a[18], b[18], c_i_plus[17], alu_op_2, less[18], alu_op_0, alu_op_1);

one_bit for_operation19(r_i[19], c_i_plus[19], a[19], b[19], c_i_plus[18], alu_op_2, less[19], alu_op_0, alu_op_1);

one_bit for_operation20(r_i[20], c_i_plus[20], a[20], b[20], c_i_plus[19], alu_op_2, less[20], alu_op_0, alu_op_1);

one_bit for_operation21(r_i[21], c_i_plus[21], a[21], b[21], c_i_plus[20], alu_op_2, less[21], alu_op_0, alu_op_1);

one_bit for_operation22(r_i[22], c_i_plus[22], a[22], b[22], c_i_plus[21], alu_op_2, less[22], alu_op_0, alu_op_1);

one_bit for_operation23(r_i[23], c_i_plus[23], a[23], b[23], c_i_plus[22], alu_op_2, less[23], alu_op_0, alu_op_1);

one_bit for_operation24(r_i[24], c_i_plus[24], a[24], b[24], c_i_plus[23], alu_op_2, less[24], alu_op_0, alu_op_1);

one_bit for_operation25(r_i[25], c_i_plus[25], a[25], b[25], c_i_plus[24], alu_op_2, less[25], alu_op_0, alu_op_1);

one_bit for_operation26(r_i[26], c_i_plus[26], a[26], b[26], c_i_plus[25], alu_op_2, less[26], alu_op_0, alu_op_1);

one_bit for_operation27(r_i[27], c_i_plus[27], a[27], b[27], c_i_plus[26], alu_op_2, less[27], alu_op_0, alu_op_1);

one_bit for_operation28(r_i[28], c_i_plus[28], a[28], b[28], c_i_plus[27], alu_op_2, less[28], alu_op_0, alu_op_1);

one_bit for_operation29(r_i[29], c_i_plus[29], a[29], b[29], c_i_plus[28], alu_op_2, less[29], alu_op_0, alu_op_1);

one_bit for_operation30(r_i[30], c_i_plus[30], a[30], b[30], c_i_plus[29], alu_op_2, less[30], alu_op_0, alu_op_1);

one_bit for_operation31(r_i[31], c_i_plus[31], a[31], b[31], c_i_plus[30], alu_op_2, less[31], alu_op_0, alu_op_1);

endmodule
