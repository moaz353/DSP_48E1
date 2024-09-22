module dual_A_D_pre_adder (A , Acin , D , in0 , in1 , in2 , in3 , 
                            clk , RSTA , RSTD, RSTAD , CEA1 , CEA2  , CED ,  CEAD  ,
                            out1 , out2 , out3 ); 
//****
parameter input_A_sel_p = "DIRECT" ; //* direct , cascade // A_input_p ; 
parameter sel1_A_p      = 1        ; //* = |Areg_p  ; red_or ; A1 ; 
parameter sel2_A_p      = 0        ; //* = Areg[1]  ; A2 ; 
parameter sel3_A_p      = 1        ; //* Acascadereg [0]  ;  and it depend on Areg ;  
//****
parameter sel_D_p       = 1        ; //* Dreg > 1 , 0 ; 
//****
parameter sel_AD_p      = 1        ; //* ADreg > 1 , 0 ; 
parameter use_D_port_p  = "FALSE"  ; //* use_D_port_p > TRUE , FALSE ; 
//****
input        clk  ;
input        RSTA ;
input        CEA1 ;
input        CEA2 ;
input        CED  ;
input        CEAD ;
input        RSTD ;
input        RSTAD;
//****
input [29:0] A    ; //* A    ;  
input [29:0] Acin ; //* Acin ; 
input [24:0] D    ; //* D    ;
input        in0  ; //* inmode[0]
input        in1  ; //* inmode[1]
input        in2  ; //* inmode[2]
input        in3  ; //* inmode[3]
//****
output [29:0] out1 ; //* to Acout  ;
output [29:0] out2 ; //* to X_mux  ; 
output [24:0] out3 ; //* to A_mult ; 
//****
wire   [29:0] mux_A_1_out ;
wire   [29:0] A1          ;
wire   [29:0] mux_A_2_out ; 
wire   [29:0] A2          ;
wire   [29:0] mux_A_3_out ; 
wire   [29:0] mux_A_4_out ; //* to AND gate with ~inmode[1] ; 
wire   [24:0] and_A_out   ; 
//****
wire   [24:0] D_reg       ; 
wire   [24:0] mux_D_out   ;
wire   [24:0] and_D_out   ;
//****
wire   [24:0] pre_adder_out ;
//****
wire   [24:0] AD_reg      ; 
wire   [24:0] mux_AD_out  ;

//****  (--A--)

assign mux_A_1_out = (input_A_sel_p == "DIRECT")? A : Acin ; // > A ; 

dff #(.signal_width(30)) A1reg (.clk(clk),.rst(RSTA),.in(mux_A_1_out),.ce(CEA1),.out(A1)) ; 
assign mux_A_2_out =(sel1_A_p)? A1 : mux_A_1_out ;  // 1 > A1 ;

dff #(.signal_width(30)) A2reg (.clk(clk),.rst(RSTA),.in(mux_A_2_out),.ce(CEA2),.out(A2)) ; 
assign mux_A_3_out =(sel2_A_p)? A2 : mux_A_2_out ;  // 1 > A2 ;

assign mux_A_4_out =(in0)? A1 : mux_A_3_out ;  // 1 > A1 ;         //**  in0 > inmode[0]  ; 

//***  Acout_mux 
assign out1 =(sel3_A_p)? A1 : mux_A_3_out   ; // 0 > mux_A_3_out ; 
//***  A to X_mux
assign out2 = mux_A_3_out ;  

assign and_A_out = ~in1 & mux_A_4_out ;  

//**** (--D--)

dff #(.signal_width(25)) Dreg (.clk(clk),.rst(RSTD),.in(D),.ce(CED),.out(D_reg)) ; 
assign mux_D_out = (sel_D_p)? D_reg : D ; 

assign and_D_out = mux_D_out & in2 ;                               //** in2 > inmode[2] ; 

assign pre_adder_out = (in3)? ( and_D_out - and_A_out ) : ( and_D_out + and_A_out );  //** in3 > inmode[3] ; 

//**** (--AD--)

dff #(.signal_width(25)) ADreg (.clk(clk),.rst(RSTAD),.in(pre_adder_out),.ce(CEAD),.out(AD_reg)) ; 
assign  mux_AD_out = (sel_AD_p)? AD_reg :  pre_adder_out ; 


assign out3 = (use_D_port_p == "TRUE")? mux_AD_out : and_A_out ;   

endmodule 
