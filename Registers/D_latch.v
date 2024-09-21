module D_latch (
	input D,clk,
	output reg Q
);

always @ (*)
begin

	Q=Q;
	if(clk)
		Q=D;
	else
		Q=Q;

	end
		

endmodule