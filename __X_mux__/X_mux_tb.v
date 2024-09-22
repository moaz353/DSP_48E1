module x_mux_tb ;

reg [47:0] in0_tb ; // 0            ; 
reg [42:0] in1_tb ; // M   >- [43]  ;
reg [47:0] in2_tb ; // P   >- [48]  ;
reg [47:0] in3_tb ; // A:B >- [48]  ; 
// sels 
reg [1:0] sel1_tb ; // x_mux_sel >- opmode[1:0] ;
reg [1:0] sel2_tb ; // y_mux_sel >- opmode[3:2] ;

wire[47:0] out_tb ; // x_mux_out   ;  



x_mux DUT (.in0  (in0_tb)  ,
            .in1 (in1_tb)  , 
            .in2 (in2_tb)  ,
            .in3 (in3_tb)  , 
            .sel1(sel1_tb) ,
            .sel2(sel2_tb) ,
            .out (out_tb)    );

initial begin
    in0_tb  = 0 ; 
    in1_tb  = 0 ; 
    in2_tb  = 0 ; 
    in3_tb  = 0 ;
    sel1_tb = 0 ; 
    sel2_tb = 0 ; 
    #10 ; 

    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        sel1_tb = 1       ; 
        sel2_tb = $random ; 
        #10 ; 
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        sel1_tb = 0       ; 
        sel2_tb = $random ; 
        #10 ; 
    end
    repeat(500)begin    
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = $random ; 
        #10 ;
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = 1       ; 
        #10 ; 
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = 0       ; 
        #10 ; 
    end 
$stop ; 
end
endmodule 