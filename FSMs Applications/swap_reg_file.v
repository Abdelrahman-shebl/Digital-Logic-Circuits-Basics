module swap_reg_file #(parameter address_width = 7 , data_width = 8)(

	input clk,reset_n,
	input [address_width-1:0] address_a,address_b,
	input [address_width-1:0] address_w,address_r ,
	input [data_width-1:0] data_w ,
	output [data_width-1:0] data_r ,
	input we,
	input swap

);

wire [address_width-1:0] out_address_r_mux;
wire [address_width-1:0] out_address_w_mux;
wire [1:0] sel;
wire w;

reg_file #(.address_width(address_width) , .data_width (data_width)) my_reg( 
	.clk(clk),
	.address_w(out_address_w_mux),.address_r(out_address_r_mux) ,
	.data_w(w?data_r:data_w),
	.data_r(data_r) ,
	.we(w?1'b1:we)

);

mux_4x1_nbit #(.n(address_width)) address_r_mux (
	.w0(address_r),
	.w1(address_a),
	.w2(address_b),
	.w3(7'b0),
	.sel(sel),
	.f(out_address_r_mux)
);


mux_4x1_nbit #(.n(address_width)) address_w_mux (
	.w0(address_w),
	.w1(7'b0),
	.w2(address_a),
	.w3(address_b),
	.sel(sel),
	.f(out_address_w_mux)
);

swap_fsm fsm (

	.clk(clk),
	.reset_n(reset_n),
	.swap(swap),
	.w(w),
	.sel(sel)

);





endmodule