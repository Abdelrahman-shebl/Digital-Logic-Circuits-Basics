module adder_subtractor_n_bit #(parameter n = 4) (

	input [n-1:0] x,y,
	input add_n,
	output [n-1:0] s,
	output c_out,
	output over_flow

);
wire [n-1:0] y_xored ;
genvar k;

generate


for (k=0;k<n;k=k+1)
	begin:stage
	assign y_xored[k]= y[k]^add_n;

end
endgenerate

rca_nbit #(.n(n)) (
	
	.x(x),.y(y),
	.cin(add_n),
	.s(s),
	.cout(cout)
	
);

assign over_flow = x [n-1] & y_xored[n-1] & ~s [n-1]  | ~x [n-1] & ~y_xored[n-1] & s [n-1]    ;

endmodule