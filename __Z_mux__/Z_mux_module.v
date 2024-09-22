module z_mux (in0 ,in1 , in2 ,in3 , in4 , in5 ,  sel1 , sel2 , sel3 ,out);

input [47:0] in0 ; // 0              ; 
input [47:0] in1 ; // pcin  >- [48]  ;
input [47:0] in2 ; // P     >- [48]  ;
input [47:0] in3 ; // c     >- [48]  ; 
input [47:0] in4 ; // pcin_shL17b >- [48]  ; 
input [47:0] in5 ; // p_shL17b    >- [48]  ; 

// sels 

input [1:0] sel1 ; // x_mux_sel >- opmode[1:0] ;
input [1:0] sel2 ; // y_mux_sel >- opmode[3:2] ;
input [2:0] sel3 ; // z_mux_sel >- opmode[6:4] ;

output reg [47:0] out ; // z_mux_out   ;  

always @(*) begin
    case(sel3) 
    3'b000:      out = in0 ; // 0 
    3'b001:      out = in1 ; // pcin 
    3'b010:      out = in2 ; // p 
    3'b011:      out = in3 ; // c 
    3'b100: begin
        if(sel1 == 2'b00 && sel2 == 2'b10 )
            out = in2 ;      // p 
        else 
            out = in0 ;      // 0 
    end
    3'b101:      out = in4 ; // pcin_shL17b
    3'b110:      out = in5 ; // p_shL17b
    default :    out = in0 ; // 0 
    endcase 

end
endmodule 