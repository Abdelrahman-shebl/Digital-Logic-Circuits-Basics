module shift_register # (parameter n=4) (
	input SI,
	input clk,
	output SO

);


reg [n-1:0] Q_reg,Q_next;

always @ (posedge clk)
begin
	
		Q_reg<=Q_next;

end

always @ (*)
begin
	
		Q_next={SI,Q_reg[n-1:1]};

end

assign SO= Q_reg[0];

endmodule