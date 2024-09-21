module univ_shift_reg #(parameter n = 4)(
        input clk,reset_n,
        input [n - 1:0] I,
		  input MSB_IN,
		  input LSB_IN,
        input [1:0] s,
        output [n - 1:0] Q       
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
	case (s)
	2'b00:Q_next = Q_reg;
	2'b01:Q_next={MSB_IN,Q_reg[n-1:1]};
	2'b10:Q_next={Q_reg[n-2:0] ,LSB_IN};
	2'b11:Q_next=I;
	default:Q_next = Q_reg;
	endcase 
		
end

assign Q = Q_reg;

endmodule