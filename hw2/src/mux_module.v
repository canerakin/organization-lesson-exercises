module mux_module (out, a, b, c, d, s0, s1);
	input a, b, c, d, s0, s1;
	output out;
	
	wire not_s0, not_s1, and_a, and_b, and_c, and_d;
	wire and_for_a, and_for_b, and_for_c, and_for_d;
	wire out_up, out_down;
	
	not not_0(not_s0, s0);
	not not_1(not_s1, s1);

	and and_1_1(and_for_a, not_s0, not_s1);	
	and and_2_1(and_for_b, not_s0, s1);
	and and_3_1(and_for_c, s0, not_s1);
	and and_4_1(and_for_d, s0, s1);	

	and and_1_2(and_a, and_for_a, a);	
	and and_2_2(and_b, and_for_b, b);
	and and_3_2(and_c, and_for_c, c);
	and and_4_2(and_d, and_for_d, d);

	or for_up(out_up, and_a, and_b);
	or for_down(out_down, and_c, and_d);
	
	or output_that(out, out_up, out_down);
		
endmodule	
