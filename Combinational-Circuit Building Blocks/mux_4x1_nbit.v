module mux_4x1_nbit #(parameter n=3) (
	input [n-1 : 0] w0,w1,w2,w3,
	input [1:0] sel,
	output reg [n-1:0] f
);

always @ (*)
begin
case (sel)
2'b00: f = w0;
2'b01: f = w1;
2'b10: f = w2;
2'b11: f = w3;
default: f = 'bx;
endcase
end


endmodule