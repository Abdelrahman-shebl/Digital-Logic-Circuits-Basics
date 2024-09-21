`timescale 1ns / 1ps


module priority_encoder_generic_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter N = 6;
    reg [N - 1:0] w;
    wire z;
    wire [$clog2(N) - 1:0] y;
    integer k;
    
    // 2) Instantiate the unit under test
    priority_encoder_generic #(.n(N))uut0(
        .w(w),
        .z(z),
        .y(y)
    );
    
   
    initial 
    begin
        w = 0;
        for (k = 0; k < 2**N * 2; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule