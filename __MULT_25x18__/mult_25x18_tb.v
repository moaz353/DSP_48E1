module mult_25x18_tb ;  


reg  [24:0] in1_tb ; //** A_mult
reg  [17:0] in2_tb ; //** B_mult

wire [42:0] out_tb ; //** MULT_25x15_out  

mult_25x18 #(.data_width_in1(25),
                .data_width_in2(18)
                ) 
        DUT (.in1(in1_tb)    , 
                .in2(in2_tb) , 
                .out(out_tb)   ); 

initial begin
    in1_tb = 0 ; 
    in2_tb = 0 ; 
    #20 ; 
    repeat(600) begin
        in1_tb = $random ; 
        in2_tb = $random ;
        #10 ;  
    end 
    $stop ; 
end
initial begin
    $monitor(" in1= %d ; in2= %d  ; -> out = %d  ;;; " , in1_tb , in2_tb , out_tb ) ; 
end
endmodule 