module up_counter #(parameter BITS = 4) (
	input clk,
	input reset_n,
	output [BITS -1 :0] Q
);

reg [BITS -1 : 0] Q_reg,Q_next;

always @ (posedge clk , negedge reset_n)
begin	

	if (~reset_n)
		Q_reg <= 0;
	else 
		Q_reg <= Q_next;
	
end
	
always @ (*)
begin

		Q_next = Q_reg+1;

end
	
assign Q=Q_reg;
 
endmodule