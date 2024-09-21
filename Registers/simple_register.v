module simple_register #(parameter n=4 ) (
	input clk,
	input [n-1:0] I,
	output [n-1:0] Q
);

genvar k;
generate

for (k=0;k<n;k=k+1)
begin : stage
	D_ff_pos (I[k],clk,Q);
end	

endgenerate




endmodule