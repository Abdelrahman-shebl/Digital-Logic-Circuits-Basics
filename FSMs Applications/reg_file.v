module reg_file #(parameter address_width = 7 , data_width = 8)( 
	input clk,
	input [address_width-1:0] address_w,address_r ,
	input [data_width-1:0] data_w ,
	output [data_width-1:0] data_r ,
	input we

);

reg [data_width-1:0] memory [0:2**address_width-1];

always @(posedge clk)

	if (we)
		memory [address_w] <= data_w;

assign data_r = memory[address_r];

endmodule