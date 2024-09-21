module BCD_counter (
    input clk,
    input reset_n,
    input enable,
    output done,
    output [3:0] Q
    );
	 
reg [3 : 0] Q_reg,Q_next;
	 

assign done = Q_reg == 9;
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

		Q_next =done ? 1'b0 :Q_reg+1;

end
	
assign Q=Q_reg;
 
endmodule