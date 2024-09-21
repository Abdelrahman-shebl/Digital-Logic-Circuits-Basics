module decoder_2x4_en (
	input [1:0] w,
	input en,
	output reg [0:3] y
	
);

always @ (*)
begin
y=4'b0000;
casex ({en,w})
3'b100: y=4'b1000;
3'b101: y=4'b0100;
3'b110: y=4'b0010;
3'b111: y=4'b0001;
3'b0xx: y=4'b0000;
default : y=4'b0000;
 endcase
end

endmodule