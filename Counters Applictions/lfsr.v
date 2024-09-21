module lfsr #(parameter N=3) (

	input clk,reset_n,
	output [1:N] Q
	
);

reg [1:N] Q_reg,Q_next;

always @ (posedge clk,negedge reset_n)
begin
	Q_reg<=Q_reg;

	if(~reset_n)
		Q_reg<='b1;
	else
		Q_reg<=Q_next;

end

wire tape;
assign tape = Q_reg [2] ^ Q_reg [3];

always @ (*)
begin
	
		Q_next={tape , Q_reg[1:N-1]};

end

assign Q= Q_reg;

endmodule