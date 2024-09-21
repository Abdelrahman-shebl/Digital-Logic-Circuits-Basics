module priority_encoder_4x2 (
	input [3:0] w,
	output z, // indication for wether there is a a 1 or not
	output reg [1:0] y
);

assign z = | w;


always @ (*)
begin
y = 2'bxx;
casex (w)

4'b0001: y= 2'b00;
4'b001x: y= 2'b01;
4'b01xx: y= 2'b10;
4'b1xxx: y= 2'b11;
default: y = 2'bxx;

endcase
end

endmodule