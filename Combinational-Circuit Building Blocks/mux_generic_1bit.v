module mux_generic_1bit #(parameter n=5)(
	input [n-1:0] w,
	input [$clog2(n)-1:0] sel,
	output  reg f

);
integer k;
always @ (*)
begin

for (k=0;k<n;k=k+1)
	if(k==sel)
		f=w[k];

end
endmodule