module z_mux_tb ;

reg [47:0] in0_tb ;
reg [47:0] in1_tb ;
reg [47:0] in2_tb ; 
reg [47:0] in3_tb ;
reg [47:0] in4_tb ;  
reg [47:0] in5_tb ; 
// sels 
reg [1:0] sel1_tb ; // x_mux_sel >- opmode[1:0] ;
reg [1:0] sel2_tb ; // y_mux_sel >- opmode[3:2] ;
reg [2:0] sel3_tb ; // z_mux_sel >- opmode[6:4] ;

wire[47:0] out_tb ; // z_mux_out   ;  

z_mux DUT (.in0  (in0_tb)  ,
            .in1 (in1_tb)  , 
            .in2 (in2_tb)  ,
            .in3 (in3_tb)  , 
            .in4 (in4_tb)  , 
            .in5 (in5_tb)  , 
            .sel1(sel1_tb) ,
            .sel2(sel2_tb) ,
            .sel3(sel3_tb) ,
            .out (out_tb)    );

initial begin
    in0_tb  = 0 ; 
    in1_tb  = 0 ; 
    in2_tb  = 0 ; 
    in3_tb  = 0 ;
    in4_tb  = 0 ;
    in5_tb  = 0 ;
    sel1_tb = 0 ; 
    sel2_tb = 0 ; 
    sel3_tb = 0 ; 
    #10 ; 

    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = 1       ; 
        sel2_tb = $random ; 
        sel3_tb = $random ; 
        #10 ; 
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = 0       ; 
        sel2_tb = $random ; 
        sel3_tb = $random ; 
        #10 ; 
    end
    repeat(500)begin    
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = 0       ; 
        sel3_tb = $random ; 
        #10 ;
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = 1       ; 
        sel3_tb = $random ; 
        #10 ; 
    end
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = $random ; 
        sel3_tb = 0       ; 
        #10 ; 
    end 
    repeat(500)begin
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        in4_tb  = $random ;
        in5_tb  = $random ;
        sel1_tb = $random ; 
        sel2_tb = $random ; 
        sel3_tb = 1       ; 
        #10 ; 
    end 
$stop ; 
end
endmodule 


























