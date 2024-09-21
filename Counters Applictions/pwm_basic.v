module pwm_basic #(parameter R=8) (
	input clk,reset_n,
	input [R-1:0] duty,
	output pwm_out

);
 

reg [R -1 : 0] Q_reg,Q_next;

always @ (posedge clk , negedge reset_n)
begin	

	if (~reset_n)
		Q_reg <= 0;
	else 
		Q_reg <= Q_next;
	
end
	
always @ (*)

		Q_next = Q_reg+1;
		
assign pwm_out = (duty > Q_reg);	


 
endmodule