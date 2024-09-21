module mux_2x1_nbit #(parameter n=3) (
	input [n-1 : 0] w0,w1,
	input sel,
	output reg [n-1:0] f
);

always @ (*)
begin
case (sel)
1'b0: f = w0;
1'b1: f = w1;

endcase
end


endmodule