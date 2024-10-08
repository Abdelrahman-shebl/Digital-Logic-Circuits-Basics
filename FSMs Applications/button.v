module button(
    input clk, reset_n,
    input noisy,
    output debounced,
    output p_edge, n_edge, _edge
);

debouncer_delayed dd (
	.clk(clk),
   .reset_n(reset_n),
	.noisy(noisy),
	.debounced(debounced)

);

edge_detector ed (

	.clk(clk),
   .reset_n(reset_n),
	.level(debounced),
	.p_edge(p_edge),
   .n_edge(n_edge),
	._edge(_edge)

);

endmodule