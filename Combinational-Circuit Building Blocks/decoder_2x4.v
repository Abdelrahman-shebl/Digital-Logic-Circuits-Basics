module decoder_2x4 (
	input [1:0] w,
	output reg [0:3] y
);

always @ (*)
begin
y=4'b0000;
case (w)
2'b00: y=4'b1000;
2'b01: y=4'b0100;
2'b10: y=4'b0010;
2'b11: y=4'b0001;
default : y=4'b0000;
 endcase
end

endmodule