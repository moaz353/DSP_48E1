module y_mux (in0 ,in1 , in2 ,in3 , sel1 ,sel2 ,out);

input [47:0] in0 ; // 0                                  ; 
input [42:0] in1 ; // M                         >- [43]  ;
input [47:0] in2 ; // 12'hffff_ffff_ffff_ffff   >- [48]  ;
input [47:0] in3 ; // A:B >- [48]                        ; 

// sels 

input [1:0] sel1 ; // x_mux_sel >- opmode[1:0] ;
input [1:0] sel2 ; // y_mux_sel >- opmode[3:2] ;

output reg [47:0] out ; // y_mux_out   ;  

always @(*) begin
    case(sel2) 
    2'b00:      out = in0 ; 
    2'b01:begin
        if(sel1 == 2'b01)
                out = in1 ; 
        else 
                out = in0 ; 
    end
    2'b10:      out = in2 ; 
    2'b11:      out = in3 ; 
    default :   out = in0 ; 
    endcase 

end
endmodule 