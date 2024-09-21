module shift_register_load #(parameter n = 4)(
        input clk,
        input  SI,
        input [n - 1:0] I,
        input load,
        input reset_n,
        output [n - 1:0] Q, 
        output SO        
    );


reg [n-1:0] Q_reg,Q_next;

always @ (posedge clk,negedge reset_n )
begin
	Q_reg<=Q_reg;
	if(!reset_n)
		Q_reg<=1'b0;
	else
		Q_reg<=Q_next;

end

always @ (*)
begin
	
	if (!load)
		Q_next={SI,Q_reg[n-1:1]};
	else
		Q_next=I;

end

assign SO= Q_reg[0];
assign Q = Q_reg;

endmodule