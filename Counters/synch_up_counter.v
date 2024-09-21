module synch_up_counter(
    input clk,
    input reset_n,
    output [3:0] Q
);

T_FF FF0 (
	.T(1'b1),.clk(clk),
	.reset_n(reset_n),
	.Q(Q[0])

);
wire q1;
assign q1 = Q[0] & 1'b1;

T_FF FF1 (
	.T(q1),.clk(clk),
	.reset_n(reset_n),
	.Q(Q[1])

);
wire q2;
assign q2 = Q[1] & q1;

T_FF FF2 (
	.T(q2),.clk(clk),
	.reset_n(reset_n),
	.Q(Q[2])

);
wire q3;
assign q3 = Q[2] & q2;

T_FF FF3 (
	.T(q3),.clk(clk),
	.reset_n(reset_n),
	.Q(Q[3])

);




endmodule