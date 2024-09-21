module T_FF (
	input T,clk,
	input reset_n,
	output Q

);

reg Q_reg,Q_next;

always @ (posedge clk , negedge reset_n)
begin	

	if (~reset_n)
		Q_reg <= 0;
	else 
		Q_reg <= Q_next;
	
end
	
always @ (*)
begin

	if (T)
		Q_next = ~Q_reg;
	else
		Q_next = Q_reg;

end
	
assign Q=Q_reg;
 
endmodule