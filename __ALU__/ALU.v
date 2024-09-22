module ALU (in1 , in2 ,in3 , carry_in , alumode , opmode , out , carry_out);

input      [47:0]  in1      ; // x 
input      [47:0]  in2      ; // y 
input      [47:0]  in3      ; // z

input             carry_in  ; // carryin

input      [6:0]  opmode    ; //opmode
input      [3:0]  alumode   ; //alumode

output reg [47:0] out       ; // p 
output reg        carry_out ; //carryout

always @(*) begin

    casex({opmode , alumode})
    
        10'bxx_xxxx_0000 : {carry_out , out } =    in3   +   in1 + in2 + carry_in    ; 
    
        10'bxx_xxxx_0001 : {carry_out , out } =  (~in3 ) +   in1 + in2 + carry_in    ;  
    
        10'bxx_xxxx_0010 : {carry_out , out } = ~( in3 )  +  in1 + in2 + carry_in    ;
    
        10'bxx_xxxx_0011 : {carry_out , out } =    in3   - ( in1 + in2 + carry_in )  ; 
    
        10'bxx_xx00_0100 : {carry_out , out } =    in1   ^    in3    ;  
    
        10'bxx_xx00_0101 : {carry_out , out } = ~( in1   ^    in3 )  ; 
    
        10'bxx_xx00_0110 : {carry_out , out } = ~( in1   ^    in3 )  ; 
    
        10'bxx_xx00_0111 : {carry_out , out } =    in1   ^    in3    ;  
    
        10'bxx_xx00_1100 : {carry_out , out } =    in1   &    in3    ; 
    
        10'bxx_xx00_1101 : {carry_out , out } =    in1   & (~ in3)   ; 
    
        10'bxx_xx00_1110 : {carry_out , out } = ~( in1   &    in3 )  ; 
    
        10'bxx_xx00_1111 : {carry_out , out } = (~ in1 )  |   in3    ;
    
        10'bxx_xx10_0100 : {carry_out , out } = ~( in1   ^    in3)   ;
    
        10'bxx_xx10_0101 : {carry_out , out } =    in1   ^    in3    ; 
    
        10'bxx_xx10_0110 : {carry_out , out } =    in1   ^    in3    ; 
    
        10'bxx_xx10_0111 : {carry_out , out } = ~( in1   ^    in3)   ; 
    
        10'bxx_xx10_1100 : {carry_out , out } =    in1   |    in3    ; 
    
        10'bxx_xx10_1101 : {carry_out , out } =    in1   ^ (~ in3)   ; 
    
        10'bxx_xx10_1110 : {carry_out , out } = ~( in1   |    in3 )  ;
    
        10'bxx_xx10_1111 : {carry_out , out } = (~ in1   ) &  in3    ;
    
        default          : {carry_out , out } = 48'b0000             ; 
    endcase
end

endmodule 