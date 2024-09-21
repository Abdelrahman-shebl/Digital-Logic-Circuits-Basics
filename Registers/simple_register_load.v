module simple_register_load #(parameter n=4 ) (
	input clk,
	input load,
	input [n-1:0] I,
	output [n-1:0] Q
);

genvar k;
generate

for (k=0;k<n;k=k+1)
begin : stage
	D_ff_pos (load ?I[k]:Q[k],clk,Q[k]);
end	

endgenerate




endmodule