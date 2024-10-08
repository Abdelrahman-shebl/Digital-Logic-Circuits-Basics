module edge_detector (

	input clk,reset_n,
	input level,
	output p_edge,n_edge,_edge

);
reg state_reg,state_next;
localparam s0=0,s1=1;

always @(posedge clk,negedge reset_n)
begin

	if(!reset_n)
		state_reg<=s0;
	else
		state_reg<= state_next;
end
		
always @ (*)
begin

	state_next = state_reg;
	case(state_reg)
	
	s0: if(level)
			state_next = s1;
		else
			state_next = s0;
			
	s1: if(~level)
			state_next = s0;
		else 
			state_next = s1;
				
	default : state_next = state_reg;
	endcase
	

end

assign p_edge = (state_reg == s0) & level ;
assign n_edge = (state_reg == s1) & ~level  ;
assign _edge = p_edge | n_edge;


endmodule