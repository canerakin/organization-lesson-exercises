module for_xor (out, a, b);
	input a, b;
	output out;

	wire s0, s1;
	wire and_1, and_2;	
	
	not not_a(s0, a);
	not not_b(s1, b);

	and first(and_1, a, s1);
	and second(and_2, b, s0);
	or output_xor(out, and_1, and_2);
	
endmodule	
