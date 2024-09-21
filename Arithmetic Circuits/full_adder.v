module full_adder (
	input x,y,cin,
	output s,cout

);

wire f1,c1,c2;

half_adder stage0 (
	.x(x),.y(y),
	.c(c1),.s(f1)

);

half_adder stage1 (
	.x(f1),.y(cin),
	.c(c2),.s(s)

);

assign cout = c1 | c2;


endmodule