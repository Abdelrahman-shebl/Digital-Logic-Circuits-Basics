module multi_decade_counter (
    input clk,
    input reset_n,
    input enable,
    output done, // to cascade it even more
    output [3:0] ones, tens, hundreds
);

wire done0;
BCD_counter counter0 (
    .clk(clk),
    .reset_n(reset_n),
    .enable(enable),
    .done(done0),
    .Q(ones)
);

wire done1;
BCD_counter counter1 (
    .clk(clk),
    .reset_n(reset_n),
    .enable(done0),
    .done(done1),
    .Q(tens)
);

wire done2 ;
assign done2 = done1 &  done0;

BCD_counter counter2 (
    .clk(clk),
    .reset_n(reset_n),
    .enable(done2),
    .done(done),
    .Q(hundreds)
);
endmodule 