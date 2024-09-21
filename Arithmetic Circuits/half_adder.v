module half_adder (
	input x,y,
	output c,s

);
	assign c = x&y;
	assign s = x^y;


endmodule