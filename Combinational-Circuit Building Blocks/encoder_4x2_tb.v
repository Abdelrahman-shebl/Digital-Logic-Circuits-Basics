`timescale 1ns / 1ps



module encoder_4x2_tb(

    );
    // 1) Declare local reg and wire identifiers
    reg [3:0] w;
    wire [1:0] y;
    integer k;
    
    // 2) Instantiate the unit under test
    encoder_4x2 uut0(
        .w(w),
        .y(y)
    );
   
    initial 
    begin
        w = 0;
        for (k = 0; k < 32; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule