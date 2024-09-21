module adder_subtractor_4_bit (

	input [3:0] x,y,
	input add_n,
	output [3:0] s,
	output c_out

);
wire [3:0] y_xored ;
genvar k;

generate


for (k=0;k<4;k=k+1)
	begin:stage
	assign y_xored[k]= y[k]^add_n;

end
endgenerate

rca_nbit #(.n(4)) (
	
	.x(x),.y(y),
	.cin(add_n),
	.s(s),
	.cout(cout)
	
);

endmodule