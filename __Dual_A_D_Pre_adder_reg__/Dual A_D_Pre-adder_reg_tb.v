module dual_A_D_pre_adder_tb ; 

reg       clk_tb  ;
reg       RSTA_tb ;
reg       CEA1_tb ;
reg       CEA2_tb ;
reg       CED_tb  ;
reg       CEAD_tb ;
reg       RSTD_tb ;
reg       RSTAD_tb;
//****
reg[29:0] A_tb    ; //* A    ;  
reg[29:0] Acin_tb ; //* Acin ; 
reg[24:0] D_tb    ; //* D    ;
reg       in0_tb  ; //* inmode[0]
reg       in1_tb  ; //* inmode[1]
reg       in2_tb  ; //* inmode[2]
reg       in3_tb  ; //* inmode[3]
//****
wire [29:0] out1_tb ; //* to Acout  ;
wire [29:0] out2_tb ; //* to X_mux  ; 
wire [24:0] out3_tb ; //* to A_mult ; 


dual_A_D_pre_adder Dual_A_D_and_pre_adder (
        .clk  (clk_tb)     ,  
        .CEA1 (CEA1_tb)    , 
        .CEA2 (CEA2_tb)    , 
        .CED  (CED_tb)     ,
        .CEAD (CEAD_tb)    ,
        .RSTA (RSTA_tb)    , 
        .RSTD (RSTD_tb)    , 
        .RSTAD(RSTAD_tb)   , 
        .A    (A_tb)       ,
        .Acin (Acin_tb)    , 
        .D    (D_tb)       , 
        .in0  (in0_tb)     , 
        .in1  (in1_tb)     , 
        .in2  (in2_tb)     , 
        .in3  (in3_tb)     ,  
        .out1 (out1_tb)    ,  
        .out2 (out2_tb)    , 
        .out3 (out3_tb)
                                );

initial begin
    clk_tb = 0 ; 
    forever #1 clk_tb = ~clk_tb ; 
end

initial begin 
    RSTA_tb = 1 ;
    RSTD_tb = 1 ;
    RSTAD_tb= 1 ;
    CEA1_tb = 0 ;
    CEA2_tb = 0 ;
    CED_tb  = 0 ;
    CEAD_tb = 0 ;
//****
    A_tb    = 0 ;   
    Acin_tb = 0 ; 
    D_tb    = 0 ; 
    in0_tb  = 0 ; 
    in1_tb  = 0 ; 
    in2_tb  = 0 ; 
    in3_tb  = 0 ;
    @(negedge clk_tb) ; 

    RSTA_tb = 0 ;
    RSTD_tb = 1 ;
    RSTAD_tb= 1 ;

    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 0 ;
        CED_tb  = 0 ;
        CEAD_tb = 0 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 0 ;
        CED_tb  = 0 ;
        CEAD_tb = 0 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 0 ;
        CED_tb  = 0 ;
        CEAD_tb = 0 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 1 ;
        CED_tb  = 0 ;
        CEAD_tb = 0 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 1 ;
        CED_tb  = 1 ;
        CEAD_tb = 0 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = 1 ;
        CEA2_tb = 1 ;
        CED_tb  = 1 ;
        CEAD_tb = 1 ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
    repeat (200) begin 
        CEA1_tb = $random ;
        CEA2_tb = $random ;
        CED_tb  = $random ;
        CEAD_tb = $random ;
//****
        A_tb    = $random ;   
        Acin_tb = $random ; 
        D_tb    = $random ; 
        in0_tb  = $random ; 
        in1_tb  = $random ; 
        in2_tb  = $random ; 
        in3_tb  = $random ;
        @(negedge clk_tb) ;
end
$stop ;
end
endmodule
