module DSP_48E1 ( clk , A , ACIN , B , BCIN , C , carryin , carrycascin , carryinsel , D , inmode , opmode , PCIN , alumode , 
                    CEA1 , CEA2 , CEB1 , CEB2 , CEC , CED , CEM , CEP , CEAD ,  CECTRL , CEalumode , CECARRYIN , CEinmode   ,
                    RSTA , RSTB , RSTC , RSTD , RSTM , RSTP , RSTCTRL , RSTinmode , RSTALLCARTYIN , RSTalumode , 
                    ACOUT , BCOUT , carrycascout , carryout , P , PCOUT ); 

parameter Areg_p          = 1      ; // 0 , 1 , 2 ; 
parameter A_INPUT_p       = "DIRECT" ; // DIRECT , CASCADE ;  
parameter ACASCreg_p      = 1      ; // 0 , 1 , 2 ;  
parameter alumodereg_p    = 1      ; // 0 , 1 ;  
parameter ADreg_p         = 1      ; // 0 , 1 ;  

parameter Breg_p          = 1      ; // 0 , 1 , 2 ;  
parameter B_INPUT_p       = "DIRECT" ; // DIRECT , CASCADE ;  
parameter BCASCreg_p      = 1      ; // 0 , 1 , 2 ;  

parameter Creg_P          = 1      ; // 0 , 1 ;  
parameter CARRYINreg_P    = 1      ; // 0 , 1 ; 
parameter CARRYINSELreg_p = 1      ; // 0 , 1 ;  

parameter Dreg_p          = 1      ; // 0 , 1 ;  

parameter inmodereg_p     = 1      ; // 0 , 1 ;  
parameter Mreg_p          = 1      ; // 0 , 1 ;  
parameter Preg_p          = 1      ; // 0 , 1 ;  
parameter opmodereg_P     = 1      ; // 0 , 1 ;
parameter USE_DPORT       = "FALSE"; // TRUE , FALSE ; 
//**** 
input        clk         ;
input [29:0] A           ; 
input [29:0] ACIN        ; 
input [17:0] B           ; 
input [17:0] BCIN        ; 
input [47:0] C           ;  
input        carryin     ; 
input        carrycascin ; 
input [2 :0] carryinsel  ; 
input [24:0] D           ;
input [4 :0] inmode      ;
input [6 :0] opmode      ; 
input [47:0] PCIN        ;
input [3 :0] alumode     ; 

// clk enable input // 
input CEA1 , CEA2 , CEB1 , CEB2 , CEC , CED , CEM , CEP , CEAD  ; 
input CECTRL , CEalumode , CECARRYIN , CEinmode ; 
// rst input // 
input RSTA , RSTB , RSTC , RSTD , RSTM , RSTP ; 
input RSTCTRL , RSTinmode , RSTALLCARTYIN , RSTalumode ; 
//****
output [29:0] ACOUT              ; 
output [17:0] BCOUT              ; 
output        carrycascout       ; 
output        carryout           ; 
output [47:0] P                  ; 
output [47:0] PCOUT              ; 
//*--------------------------------------------------------------


//** (--dual_B_register--) 
wire   [17:0] B_X_mux            ; 
wire   [17:0] B_MULT             ; 

dual_B_register #(
        .input_sel_p(B_INPUT_p) , 
        .sel1_p(|Breg_p)        , 
        .sel2_p(Breg_p[1])      , 
        .sel3_p(BCASCreg_p) 
        ) 
    dual_B_reg (
        .clk (clk)       , 
        .CEB1(CEB1)      ,
        .CEB2(CEB2)      ,
        .RSTB(RSTB)      , 
        .B   (B)         , 
        .BCIN(BCIN)      , 
        .in0 (inmode_mux_out[4]) , 
        .out1(BCOUT)     ,
        .out2(B_X_mux)   ,
        .out3(B_MULT)
                            );
//****
//** (-- dual_A_D_pre_adder --) 
wire   [29:0] A_X_mux            ; 
wire   [24:0] A_MULT             ; 

dual_A_D_pre_adder #(
        .input_A_sel_p (A_INPUT_p)    , 
        .sel1_A_p      (|Areg_p)      ,
        .sel2_A_p      (Areg_p[1])    ,
        .sel3_A_p      (ACASCreg_p[0]),
        .sel_D_p       (Dreg_p)       ,
        .sel_AD_p      (ADreg_p)      ,
        .use_D_port_p  (USE_DPORT)
    )
    Dual_A_D_and_pre_adder (
        .clk  (clk)       ,  
        .CEA1 (CEA1)      , 
        .CEA2 (CEA2)      , 
        .CED  (CED)       ,
        .CEAD (CEAD)      ,
        .RSTA (RSTA)      , 
        .RSTD (RSTD)      , 
        .RSTAD(RSTAD)     , 
        .A    (A)         ,
        .Acin (ACIN)      , 
        .D    (D)         , 
        .in0  (inmode_mux_out[0]) , 
        .in1  (inmode_mux_out[1]) , 
        .in2  (inmode_mux_out[2]) , 
        .in3  (inmode_mux_out[3]) , 
        .out1 (ACOUT)     ,  
        .out2 (A_X_mux)   , 
        .out3 (A_MULT)
                            );
//****
//** (-- mult_25x18 --)
wire   [42:0] MULT_25x15_out ; 

mult_25x18 #(
        .data_width_in1(25) , 
        .data_width_in2(18)
)
    MULT_25x18 (
        .in1 (A_MULT) , 
        .in2 (B_MULT) , 
        .out (MULT_25x15_out)
);
//****

//** (--M_reg--)
wire [42:0] M_reg     ; 
wire [42:0] M_mux_out ;

dff #(.signal_width(43)) Mreg (.clk(clk),.rst(RSTM),.in(MULT_25x15_out),.ce(CEM),.out(M_reg)) ;
assign M_mux_out = (Mreg_p)? M_reg : MULT_25x15_out ;
//****

//** (--inmode--)
wire [4:0] inmode_reg     ; 
wire [4:0] inmode_mux_out ; 

dff #(.signal_width(5)) inmodereg (.clk(clk),.rst(RSTinmode),.in(inmode),.ce(CEinmode),.out(inmode_reg)) ;
assign inmode_mux_out = (inmodereg_p)? inmode_reg : inmode ; 
//****

//** (--opmode--)
wire [6:0] opmode_reg     ; 
wire [6:0] opmode_mux_out ; 

dff #(.signal_width(7)) opmodereg (.clk(clk),.rst(RSTCTRL),.in(opmode),.ce(CECTRL),.out(opmode_reg)) ;
assign opmode_mux_out = (opmodereg_P)? opmode_reg : opmode ; 
//****

//** (--carryinsel--)
wire [2:0] carryinsel_reg     ; 
wire [2:0] carryinsel_mux_out ; 

dff #(.signal_width(3)) carryinselreg (.clk(clk),.rst(RSTCTRL),.in(carryinsel),.ce(CECTRL),.out(carryinsel_reg)) ;
assign carryinsel_mux_out = (CARRYINSELreg_p)? carryinsel_reg : carryinsel ; 
//****

//** (--C--)
wire [47:0] C_reg     ; 
wire [47:0] C_mux_out ; 

dff #(.signal_width(48)) Creg (.clk(clk),.rst(RSTC),.in(C),.ce(CEC),.out(C_reg)) ;
assign C_mux_out = (Creg_P)? C_reg : C ; 
//**** 

//** (-- X_mux -- ) 
wire [47:0] X_mux_out ;

x_mux  X (
    .in0 (48'b0)             ,
    .in1 (M_mux_out)         , 
    .in2 (P)                 ,
    .in3 ({A_X_mux,B_X_mux}) , 
    .sel1(opmode_mux_out[1:0])       ,
    .sel2(opmode_mux_out[3:2])       ,
    .out (X_mux_out)           );
//****

//** (-- Y_mux -- ) 
wire [47:0] Y_mux_out ;

y_mux  Y (
    .in0 (48'b0)                   ,
    .in1 (M_mux_out)               , 
    .in2 (48'b0)    ,
    .in3 ({A_X_mux,B_X_mux})       , 
    .sel1(opmode_mux_out[1:0])             ,
    .sel2(opmode_mux_out[3:2])             ,
    .out (Y_mux_out)                 );
//****

//** (-- Z_mux -- ) 
wire [47:0] Z_mux_out ;

z_mux Z (
    .in0 (48'b0)             ,
    .in1 (PCIN)              , 
    .in2 (P)                 ,
    .in3 (C_mux_out)         , 
    .in4 ({PCIN[30:0],17'b0}), 
    .in5 ({P   [30:0],17'b0}),
    .sel1(opmode_mux_out[1:0])       , 
    .sel2(opmode_mux_out[3:2])       , 
    .sel3(opmode_mux_out[6:4])       ,
    .out (Z_mux_out)           );

//** (---CIN---) 
wire CIN ; 

CARRYin  #(
    .carryinreg_p(CARRYINreg_P)
)
    carryin_to_alu 
(
        .carryin       (carryin), 
        .MSB_Pcin      (PCIN[47]), 
        .carrycascin   (carrycascin), 
        .MSB_Pcin_n    (~PCIN[47]), 
        .carrycascout  (carrycascout),
        .MSB_P         (P[0]), 
        .Xnor_A24_B17  (~(A[24] ^ B[17])), 
        .MSB_P_n       (~P[47]),  
        .carryinsel    (carryinsel_mux_out),
        .RSTALLCARTYIN (RSTALLCARTYIN), 
        .CECARRYIN     (CECARRYIN), 
        .clk           (clk), 
        .CIN           (CIN)
);
//****

//** (--alumode--)
wire [3:0] alumode_reg     ; 
wire [3:0] alumode_mux_out ; 

dff #(.signal_width(4)) alumodereg (.clk(clk),.rst(RSTalumode),.in(alumode),.ce(CEalumode),.out(alumode_reg)) ;
assign alumode_mux_out = (alumodereg_p)? alumode_reg : alumode ; 
//****

//****
//** (--- ALU --- ) 
wire [47:0] ALU_OUT   ; 
wire        carry_out ;

ALU alu_inst (
    .in1        (X_mux_out), 
    .in2        (Y_mux_out), 
    .in3        (Z_mux_out), 
    .carry_in   (CIN), 
    .alumode    (alumode_mux_out), 
    .opmode     (opmode_mux_out), 
    .out        (ALU_OUT), 
    .carry_out  (carry_out)
                                    );
//****

//** (--carryout--)
wire     carryout_reg     ; 

dff #(.signal_width(1)) carryoutreg (.clk(clk),.rst(RSTP),.in(carry_out),.ce(CEP),.out(carryout_reg)) ;
assign carryout = (Preg_p)? carryout_reg : carry_out ; 

assign carrycascout = carryout ; 
//****

//** (--P--)
wire [47:0] P_reg     ;  

dff #(.signal_width(48)) Preg (.clk(clk),.rst(RSTP),.in(ALU_OUT),.ce(CEP),.out(P_reg)) ;
assign P = (Preg_p)? P_reg : ALU_OUT ; 

assign PCOUT = P ; 
//****


endmodule