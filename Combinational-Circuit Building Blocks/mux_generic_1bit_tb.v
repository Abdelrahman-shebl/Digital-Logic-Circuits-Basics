`timescale 1ns / 1ps


module mux_generic_1bit_tb(

    );
    parameter N = 4;
    reg [N - 1: 0] w;
    reg [$clog2(N) - 1:0] s;
    wire f;
    
    mux_generic_1bit #(.n(N))uut0(
        .w(w),
        .sel(s),
        .f(f)
    );
	 
  
    initial
    begin
            w = 4'd10;
            
            s = 2'b00;
        #5  s = 2'b01;
        #5  s = 2'b10;
        #5  s = 2'b11;
        #5;
        #5  w = 4'd2;
        #5  w = 4'd4;
        #5  w = 4'd6;
        #5  w = 4'd10;
                
    end
    // 5) Display the output response (text or graphics (or both))
endmodule