module mod_counter_hardcoded #(parameter BITS = 4)(
    input clk,
    input reset_n,
    input enable,
    output [BITS - 1:0] Q
);


reg [BITS -1 : 0] Q_reg,Q_next;
wire done;
assign done = Q_reg == 12;
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