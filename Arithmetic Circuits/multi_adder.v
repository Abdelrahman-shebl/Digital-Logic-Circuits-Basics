module multi_adder (
	
	input [15:0] x_ab,y_ab,
	input cin_ab,
	output cout_ab,
	output [15:0] s_ab,
	
	input [33:0] x_cd,y_cd,
	input cin_cd,
	output cout_cd,
	output [33:0] s_cd


);

rca_nbit #(.n(16)) (
	
	.x(x_ab),.y(y_ab),
	.cin(cin_ab),
	.s(s_ab),
	.cout(cout_ab)
	
);

rca_nbit #(.n(34)) (
	
	.x(x_cd),.y(y_cd),
	.cin(cin_cd),
	.s(s_cd),
	.cout(cout_cd)
	
);

endmodule 