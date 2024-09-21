`timescale 1ns / 1ps

module decoder_generic_tb(

    );
    // 1) Declare local reg and wire identifiers
    parameter N = 4;
    reg [N - 1:0] w;
    reg en;
    wire [0:2 ** N - 1] y;
    integer k;
    
    // 2) Instantiate the unit under test
    decoder_generic #(.n(N)) uut0(
        .w(w),
        .en(en),
        .y(y)
    );
    
  
    initial
    begin
        en = 1'b0;
    end    
    
    always 
    begin
        #5 en = ~en;
        w = 0;
        for (k = 0; k < 2 ** N; k = k + 1)
        begin
            #5 w = w + 1;
        end        
    end
    // 5) Display the output response (text or graphics (or both))
     
endmodule