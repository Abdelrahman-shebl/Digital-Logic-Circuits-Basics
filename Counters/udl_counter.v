module udl_counter #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    input up, //when asserted the counter is up counter; otherwise, it is a down counter
    input load,
    input [BITS - 1:0] D,
    output [BITS - 1:0] Q
);

	 
reg [BITS -1 : 0] Q_reg,Q_next;

always @ (posedge clk , negedge reset_n)
begin	

	if (~reset_n)
		Q_reg <= 0;
		
	else if (enable) 
		Q_reg <= Q_next;
	else
		Q_reg <= Q_reg;
	
end
	
always @ (*)
begin
	
	if (load)
		Q_next = D;
	else
		if (up)
			Q_next = Q_reg+1;
		else
			Q_next = Q_reg-1;

end
	
assign Q=Q_reg;
 
endmodule