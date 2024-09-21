module debouncer_delayed (

	input clk,reset_n,
	input noisy,
	output debounced


);

wire timer_done,timer_reset;

debouncer_delayed_fsm FSM0 (
	.clk(clk),
   .reset_n(reset_n),
	.noisy(noisy),
	.timer_done(timer_done),
	.debounced(debounced),
	.timer_reset(timer_reset)

);

timer_input
    #(.FINAL_VALUE(1_999_999) ) T0(
    .clk(clk),
    .reset_n(~timer_reset),
    .enable(~timer_reset),
    .done(timer_done)
    );
	 
endmodule