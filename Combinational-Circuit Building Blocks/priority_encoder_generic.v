module priority_encoder_generic #(parameter n=5) (
	input [n-1:0] w,
	output z ,
	output reg [$clog2(n)-1:0] y
);
assign z=|w;
always @ (*)
begin
integer k;
y='bx;

for (k=0;k<n;k=k+1)
	if(w[k])
		y=k;
end
endmodule