module CARRYin (carryin , MSB_Pcin , carrycascin , MSB_Pcin_n , carrycascout ,
                    MSB_P , Xnor_A24_B17 , MSB_P_n  , carryinsel ,
                    RSTALLCARTYIN , CECARRYIN , clk , CIN );

parameter carryinreg_p = 1 ; 

input        clk           ; 
input        RSTALLCARTYIN ;
input        CECARRYIN     ; 

input  [2:0] carryinsel    ; 
input        carryin       ; 
input        MSB_Pcin      ; // in1 
input        carrycascin   ; // in2 
input        MSB_Pcin_n    ; // in3 
input        carrycascout  ; // in4
input        MSB_P         ; // in5
input        Xnor_A24_B17  ;
input        MSB_P_n       ; // in7



output       CIN           ;

//internal signals 

wire carryin_reg  ; 
wire carryin_mux  ; // in0 ;  

wire Xnor_A24_B17_reg ; 
wire Xnor_A24_B17_mux ; // in6 

// in0 
dff carryinreg (.clk(clk)          ,
                .rst(RSTALLCARTYIN),
                .in(carryin)       ,
                .ce(CECARRYIN)     ,
                .out(carryin_reg)   ); 

mux_2x1  #(.sel_p(carryinreg_p)) carryinput_mux (.in0(carryin)       ,
                                                    .in1(carryin_reg),
                                                    .out(carryin_mux) ); 

// in6 
dff Xnor_A24_B17reg (.clk(clk)                ,
                        .rst(RSTALLCARTYIN)   ,
                        .in(Xnor_A24_B17)     ,
                        .ce(CECARRYIN)        ,
                        .out(Xnor_A24_B17_reg) ); 

mux_2x1  #(.sel_p(carryinreg_p)) Xnor_A24_B17mux (.in0(Xnor_A24_B17)      ,
                                                    .in1(Xnor_A24_B17_reg),
                                                    .out(Xnor_A24_B17_mux) ); 


mux_8x1 CINmux (.sel(carryinsel)       ,
                .in0(carryin_mux)      ,
                .in1(MSB_Pcin)         ,
                .in2(carrycascin)      ,
                .in3(MSB_Pcin_n)       , 
                .in4(carrycascout)     , 
                .in5 (MSB_P)           , 
                .in6(Xnor_A24_B17_mux) ,
                .in7(MSB_P_n)          , 
                .out(CIN)               );

endmodule

//***************************************************************************/ 

module mux_8x1 (in0 , in1 , in2 , in3 , in4 , in5 , in6 , in7 , sel , out  ) ; 

input [2:0] sel ;  // carryinsel ;

input       in0 ; // out of  mux to in {carryin , reg it} ; 
input       in1 ; //pcin[47] ; 
input       in2 ; //carrycascin ; 
input       in3 ; // ~pcin[47] ; 
input       in4 ; //carrycascout {feedback} ; 
input       in5 ; // p[47] ;  
input       in6 ; // out of mux {~(A[24]^B[17]) , reg it}
input       in7 ; // ~p[47] ; 

output reg  out ; // cin ; 

always @(*) begin
    case(sel) 
    3'b000  : out = in0 ; 
    3'b001  : out = in1 ; 
    3'b010  : out = in2 ; 
    3'b011  : out = in3 ; 
    3'b100  : out = in4 ; 
    3'b101  : out = in5 ; 
    3'b110  : out = in6 ; 
    3'b111  : out = in7 ; 
    default : out = in0 ; 
    endcase  
end
endmodule 