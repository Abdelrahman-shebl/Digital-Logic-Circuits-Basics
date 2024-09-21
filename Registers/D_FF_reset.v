module D_FF_reset (
	input D,clk,
	input reset_n, //Asynchronous
	input enable, 
	output Q

);

reg Q_reg,Q_next;

always @ (posedge clk,negedge reset_n)
begin
	Q_reg<=Q_reg;

	if(~reset_n)
		Q_reg<=1'b0;
	else if (enable)
		Q_reg<=Q_next;
	else
		Q_reg<=Q_reg;

end

always @ (*)
begin
	
		Q_next=D;

end

assign Q= Q_reg;

endmodule