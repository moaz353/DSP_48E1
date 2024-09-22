module DSP_48E1_tb ;  

reg         clk_tb         ;
reg  [29:0] A_tb           ; 
reg  [29:0] ACIN_tb        ; 
reg  [17:0] B_tb           ; 
reg  [17:0] BCIN_tb        ; 
reg  [47:0] C_tb           ;  
reg         carryin_tb     ; 
reg         carrycascin_tb ; 
reg  [2 :0] carryinsel_tb  ; 
reg  [24:0] D_tb           ;
reg  [4 :0] inmode_tb      ;
reg  [6 :0] opmode_tb      ; 
reg  [47:0] PCIN_tb        ;
reg  [3 :0] alumode_tb     ; 

// clk enable input  // 
reg  CEA1_tb , CEA2_tb , CEB1_tb , CEB2_tb , CEC_tb , CED_tb , CEM_tb , CEP_tb , CEAD_tb  ; 
reg  CECTRL_tb , CEalumode_tb , CECARRYIN_tb , CEinmode_tb ;

// rst input  // 
reg  RSTA_tb , RSTB_tb , RSTC_tb , RSTD_tb , RSTM_tb , RSTP_tb ; 
reg  RSTCTRL_tb , RSTinmode_tb , RSTALLCARTYIN_tb , RSTalumode_tb ; 
//****

output [29:0] ACOUT_tb              ; 
output [17:0] BCOUT_tb              ; 
output        carrycascout_tb       ; 
output        carryout_tb           ; 
output [47:0] P_tb                  ; 
output [47:0] PCOUT_tb              ; 


DSP_48E1 DUT ( .clk             (clk_tb)              ,
                .A              (A_tb)                , 
                .ACIN           (ACIN_tb)             , 
                .B              (B_tb)                , 
                .BCIN           (BCIN_tb)             , 
                .C              (C_tb)                , 
                .carryin        (carryin_tb)          , 
                .carrycascin    (carrycascin_tb)      , 
                .carryinsel     (carryinsel_tb)       , 
                .D              (D_tb)                , 
                .inmode         (inmode_tb)           , 
                .opmode         (opmode_tb)           , 
                .PCIN           (PCIN_tb)             , 
                .alumode        (alumode_tb)          , 
                .CEA1           (CEA1_tb)             , 
                .CEA2           (CEA2_tb)             , 
                .CEB1           (CEB1_tb)             , 
                .CEB2           (CEB2_tb)             , 
                .CEC            (CEC_tb)              , 
                .CED            (CED_tb)              , 
                .CEM            (CEM_tb)              , 
                .CEP            (CEP_tb)              , 
                .CEAD           (CEAD_tb)             ,  
                .CECTRL         (CECTRL_tb)           , 
                .CEalumode      (CEalumode_tb)        , 
                .CECARRYIN      (CECARRYIN_tb)        , 
                .CEinmode       (CEinmode_tb)         ,
                .RSTA           (RSTA_tb)             , 
                .RSTB           (RSTB_tb)             , 
                .RSTC           (RSTC_tb)             ,
                .RSTD           (RSTD_tb)             , 
                .RSTM           (RSTM_tb)             , 
                .RSTP           (RSTP_tb)             , 
                .RSTCTRL        (RSTCTRL_tb)          , 
                .RSTinmode      (RSTinmode_tb)        , 
                .RSTALLCARTYIN  (RSTALLCARTYIN_tb)    , 
                .RSTalumode     (RSTalumode_tb)       , 
                .ACOUT          (ACOUT_tb)            , 
                .BCOUT          (BCOUT_tb)            , 
                .carrycascout   (carrycascout_tb)     , 
                .carryout       (carryout_tb)         , 
                .P              (P_tb)                ,  
                .PCOUT          (PCOUT_tb)                   ); 

initial begin
    clk_tb = 0 ; 
    forever #1 clk_tb = ~clk_tb ; 
end

initial begin
    RSTA_tb          = 1 ; 
    RSTB_tb          = 1 ; 
    RSTC_tb          = 1 ; 
    RSTD_tb          = 1 ; 
    RSTM_tb          = 1 ; 
    RSTP_tb          = 1 ; 
    RSTCTRL_tb       = 1 ; 
    RSTinmode_tb     = 1 ; 
    RSTALLCARTYIN_tb = 1 ; 
    RSTalumode_tb    = 1 ;
    //*****
    CEA1_tb          = 0 ; 
    CEA2_tb          = 0 ; 
    CEB1_tb          = 0 ; 
    CEB2_tb          = 0 ; 
    CEC_tb           = 0 ; 
    CED_tb           = 0 ; 
    CEM_tb           = 0 ; 
    CEP_tb           = 0 ; 
    CEAD_tb          = 0 ;
    CECTRL_tb        = 0 ; 
    CEalumode_tb     = 0 ; 
    CECARRYIN_tb     = 0 ; 
    CEinmode_tb      = 0 ;
    //*****
    A_tb             = 0 ; 
    ACIN_tb          = 0 ; 
    B_tb             = 0 ; 
    BCIN_tb          = 0 ; 
    C_tb             = 0 ;  
    carryin_tb       = 0 ; 
    carrycascin_tb   = 0 ; 
    carryinsel_tb    = 0 ; 
    D_tb             = 0 ;
    inmode_tb        = 0 ;
    opmode_tb        = 0 ; 
    PCIN_tb          = 0 ;
    alumode_tb       = 0 ; 
    //****
    #50 ; 
    //********************
    RSTA_tb          = 0 ; 
    RSTB_tb          = 0 ; 
    RSTC_tb          = 0 ; 
    RSTD_tb          = 0 ; 
    RSTM_tb          = 0 ; 
    RSTP_tb          = 0 ; 
    RSTCTRL_tb       = 0 ; 
    RSTinmode_tb     = 0 ; 
    RSTALLCARTYIN_tb = 0 ; 
    RSTalumode_tb    = 0 ;
    //*****
    CEA1_tb          = 1 ; 
    CEA2_tb          = 1 ; 
    CEB1_tb          = 1 ; 
    CEB2_tb          = 1 ; 
    CEC_tb           = 1 ; 
    CED_tb           = 1 ; 
    CEM_tb           = 1 ; 
    CEP_tb           = 1 ; 
    CEAD_tb          = 1 ;
    CECTRL_tb        = 1 ; 
    CEalumode_tb     = 1 ; 
    CECARRYIN_tb     = 1 ; 
    CEinmode_tb      = 1 ;
    @(negedge clk_tb); 
    //********************
    repeat(600) begin 
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb);
    end
    //*****
    CEA1_tb          = 0 ; 
    CEA2_tb          = 0 ; 
    CEB1_tb          = 0 ; 
    CEB2_tb          = 0 ; 
    CEC_tb           = 0 ; 
    CED_tb           = 0 ; 
    CEM_tb           = 0 ; 
    CEP_tb           = 0 ; 
    CEAD_tb          = 0 ;
    CECTRL_tb        = 0 ; 
    CEalumode_tb     = 0 ; 
    CECARRYIN_tb     = 0 ; 
    CEinmode_tb      = 0 ;
    @(negedge clk_tb) ; 
    //************************************************************************************************************************
    repeat(100) begin 
        CEA1_tb          = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEA2_tb          = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEB1_tb          = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEB2_tb          = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEC_tb           = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CED_tb           = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEM_tb           = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEP_tb           = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEAD_tb           = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CECTRL_tb        = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEalumode_tb     = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CECARRYIN_tb     = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(100) begin 
        CEinmode_tb      = 1 ;     
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    repeat(600) begin 
        CEA1_tb          = $random ; 
        CEA2_tb          = $random ; 
        CEB1_tb          = $random ; 
        CEB2_tb          = $random ; 
        CEC_tb           = $random ; 
        CED_tb           = $random ; 
        CEM_tb           = $random ; 
        CEP_tb           = $random ; 
        CEAD_tb          = $random ;
        CECTRL_tb        = $random ; 
        CEalumode_tb     = $random ; 
        CECARRYIN_tb     = $random ; 
        CEinmode_tb      = $random ;        
        A_tb             = $random ; 
        ACIN_tb          = $random ; 
        B_tb             = $random ; 
        BCIN_tb          = $random ; 
        C_tb             = $random ;  
        carryin_tb       = $random ; 
        carrycascin_tb   = $random ; 
        carryinsel_tb    = $random ; 
        D_tb             = $random ;
        inmode_tb        = $random ;
        opmode_tb        = $random ; 
        PCIN_tb          = $random ;
        alumode_tb       = $random ;    
        @(negedge clk_tb); 
    end
    $stop ; 
end

endmodule 