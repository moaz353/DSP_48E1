module ALU_tb ;  

reg      [47:0]  in1_tb      ; // x 
reg      [47:0]  in2_tb      ; // y 
reg      [47:0]  in3_tb      ; // z

reg             carry_in_tb  ; // carryin

reg      [6:0]  opmode_tb    ; //opmode
reg      [3:0]  alumode_tb   ; //alumode

wire     [47:0] out_tb       ; // p 
wire            carry_out_tb ; //carryout

ALU DUT (
    .in1(in1_tb)             , 
    .in2(in2_tb)             ,
    .in3(in3_tb)             , 
    .carry_in (carry_in_tb)  , 
    .alumode(alumode_tb)     , 
    .opmode (opmode_tb)      , 
    .out (out_tb)            , 
    .carry_out(carry_out_tb)   );

initial begin
    in1_tb      = 0 ; 
    in2_tb      = 0 ; 
    in3_tb      = 0 ; 
    carry_in_tb = 0 ;
    opmode_tb   = 0 ;
    alumode_tb  = 0 ; 
    display_message ;
    #10 ; 
    repeat(1000)begin 
        in1_tb      = $random ; 
        in2_tb      = $random ; 
        in3_tb      = $random ; 
        carry_in_tb = $random ;
        opmode_tb   = $random ;
        alumode_tb  = $random ; 
        display_message       ; 
        #10 ; 
    end 
    $stop;
end
task display_message ;
begin 
    $display("in1= %d ; in2= %d ; in3= %d , CIN= %d , opmode= %b ; alumode = %b ;> out = %d ; COUT = %d ;;  ",
                in1_tb , in2_tb , in3_tb , carry_in_tb , opmode_tb , alumode_tb ,out_tb , carry_out_tb) ;
end
endtask 
endmodule 