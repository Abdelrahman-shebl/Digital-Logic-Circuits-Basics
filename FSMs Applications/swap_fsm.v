module swap_fsm (

	input clk,reset_n,
	input swap,
	output w,
	output [1:0]sel

);

reg [1:0] state_reg,state_next;
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
	
	s0: if(swap)
			state_next = s1;
		else
			state_next = s0;
			
	s1: state_next = s2;
	s2: state_next = s3;
	s3: state_next = s0;
			
	default : state_next = state_reg;
	endcase
	

end

assign w = !(state_reg == s0);
assign sel = state_reg;

endmodule