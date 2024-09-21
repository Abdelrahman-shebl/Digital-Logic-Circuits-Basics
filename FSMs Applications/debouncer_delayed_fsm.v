module debouncer_delayed_fsm (

	input clk,reset_n,
	input timer_done,
	input noisy,
	output debounced,
	output timer_reset

);
reg [1:0]state_reg,state_next;
localparam s0=0,s1=1,s2=2,s3=3;

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
	
	s0: if(noisy)
			state_next = s1;
		else
			state_next = s0;
			
	s1: if(~noisy)
			state_next = s0;
		else 
			if (timer_done)
				state_next = s2;
			else
				state_next = s1;
	
	s2: if(noisy)
			state_next = s2;
		else
			state_next = s3;
			
	s3: if(noisy)
			state_next = s2;
		else 
			if (~timer_done)
				state_next = s3;
			else
				state_next = s0;
				
			
	default : state_next = state_reg;
	endcase
	

end

assign debounced = (state_reg == s2) | (state_reg == s3);
assign timer_reset = (state_reg == s2) | (state_reg == s0);


endmodule