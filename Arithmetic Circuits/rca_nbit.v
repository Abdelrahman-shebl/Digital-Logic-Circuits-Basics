module rca_nbit #(parameter n=4) (
	
	input [n-1:0] x,y,
	input cin,
	output [n-1:0] s,
	output cout
	
);

genvar k ;

wire [n:0] c;
assign c[0]=cin;
assign cout = c[n];

generate

for (k=0;k<3;k=k+1)
begin : stage

	full_adder(x[k],y[k],c[k],s[k],c[k+1]);
end
endgenerate





endmodule