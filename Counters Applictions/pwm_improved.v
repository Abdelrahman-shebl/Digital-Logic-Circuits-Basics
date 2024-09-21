module pwm_improved #(parameter R=8 , TIMER_BITS = 15) (
    input clk,
    input reset_n,
    input [R:0] duty,
    input [TIMER_BITS - 1:0] FINAL_VALUE, 
    output pwm_out
);

wire tick;
wire cmp;
reg [R:0] Q_reg, Q_next;

always @ (posedge clk or negedge reset_n) begin
    if (~reset_n)
        Q_reg <= 0;
    else if (tick)
        Q_reg <= Q_next;
end

always @(*) begin
    Q_next = Q_reg + 1;
end

assign cmp = (duty > Q_reg);
timer_input #(.BITS(TIMER_BITS)) timer_instance (
    .clk(clk),
    .reset_n(reset_n),
    .enable(1'b1),
    .FINAL_VALUE(FINAL_VALUE),  
    .done(tick)
);

D_FF_reset dff_instance (
    .D(cmp),
    .clk(clk),
    .reset_n(reset_n),
    .enable(tick),
    .Q(pwm_out)
);

endmodule
