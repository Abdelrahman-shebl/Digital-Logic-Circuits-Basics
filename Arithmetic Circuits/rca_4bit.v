module rca_4bit (
	
	input [3:0] x,y,
	input cin,
	output [3:0] s,
	output cout
	
);


wire [4:0] c;
assign c[0]=cin;
assign cout = c[4];

generate

genvar k ;

for (k=0;k<4;k=k+1)
begin : stage

	full_adder(x[k],y[k],c[k],s[k],c[k+1]);
end
endgenerate





endmodule