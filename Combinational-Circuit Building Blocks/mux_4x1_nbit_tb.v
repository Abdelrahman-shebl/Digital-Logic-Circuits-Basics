`timescale 1ns / 1ps


module mux_4x1_nbit_tb(

    );
    
    parameter n = 4;
    reg [n - 1: 0] w0, w1, w2, w3;
    reg [1:0] s;
    wire [n - 1: 0] f;
    
    mux_4x1_nbit #(.n(n))uut0(
        .w0(w0),
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .sel(s),
        .f(f)
    );

      
    // 4) Generate stimuli, using initial and always
    initial
    begin
            w0 = 4'd3;
            w1 = 4'd5;
            w2 = 4'd7;
            w3 = 4'd11;
            
            s = 2'b00;
        #5  s = 2'b01;
        #5  s = 2'b10;
        #5  s = 2'b11;
        #5;
        #5  w0 = 4'd2;
        #5  w1 = 4'd4;
        #5  w2 = 4'd6;
        #5  w3 = 4'd10;
                
    end
endmodule