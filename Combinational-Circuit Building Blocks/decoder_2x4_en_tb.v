`timescale 1ns / 1ps



module decoder_2x4_en_tb(

    );
    
    reg [1:0] w;
    reg en;
    wire [0:3] y;
    
    decoder_2x4_en uut0(
        .w(w),
        .en(en),
        .y(y)
    );
    
    
    initial
    begin
           en = 1'b1;
        #5 w = 2'b00;
        #5 w = 2'b01;
        #5 w = 2'b10;
        #5 w = 2'b11;

        #10 en = 1'b0;
        #5 w = 2'b00;
        #5 w = 2'b01;
        #5 w = 2'b10;
        #5 w = 2'b11;
        #5;
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule