module dual_B_register_tb;


reg         clk_tb      ;
reg         RSTB_tb     ;
reg         CEB1_tb     ;
reg         CEB2_tb     ;
reg         inmode_4_tb ;
reg  [17:0] BCIN_tb     ;
reg  [17:0] B_tb        ;


wire [17:0] out1_tb     ;
wire [17:0] out2_tb     ;
wire [17:0] out3_tb     ;


dual_B_register #(
    .input_sel_p("DIRECT"),
    .sel1_p(1),
    .sel2_p(0),
    .sel3_p(1)
) DUT (
    .clk (clk_tb)      ,
    .RSTB(RSTB_tb)     ,
    .CEB1(CEB1_tb)     ,
    .CEB2(CEB2_tb)     ,
    .in0 (inmode_4_tb) ,
    .B   (B_tb)        ,
    .BCIN(BCIN_tb)     ,
    .out1(out1_tb)     ,
    .out2(out2_tb)     ,
    .out3(out3_tb)  
                        );

// Clock generation
initial begin
    clk_tb = 0;
    forever #5 clk_tb = ~clk_tb; // 10ns period
end

// Stimulus
initial begin
    // Initialize inputs
    RSTB_tb = 1; 
    CEB1_tb = 0;
    CEB2_tb = 0;
    inmode_4_tb  = 18'h00000;
    B_tb         = 18'h00000;
    BCIN_tb      = 18'h00000;
    @(negedge clk_tb)
    RSTB_tb = 0;

    repeat(500) begin 
        CEB1_tb = 1       ;  
        CEB2_tb = 0       ;
        inmode_4_tb  = $random ;
        B_tb         = $random ;
        BCIN_tb      = $random ;
        display_message   ;
        @(negedge clk_tb) ;  

        CEB1_tb = 0       ;  
        CEB2_tb = 1       ;
        inmode_4_tb  = $random ;
        B_tb         = $random ;
        BCIN_tb      = $random ;
        display_message   ;
        @(negedge clk_tb) ;  

        CEB1_tb = 1       ;  
        CEB2_tb = 1       ;
        inmode_4_tb  = $random ;
        B_tb         = $random ;
        BCIN_tb      = $random ;
        display_message   ;
        @(negedge clk_tb) ; 

        CEB1_tb = 0       ;  
        CEB2_tb = 0       ;
        inmode_4_tb  = $random ;
        B_tb         = $random ;
        BCIN_tb      = $random ;
        display_message   ;
        @(negedge clk_tb) ;   

        CEB1_tb      = $random ;  
        CEB2_tb      = $random ;
        inmode_4_tb  = $random ;
        B_tb         = $random ;
        BCIN_tb      = $random ;
        display_message   ;
        @(negedge clk_tb) ; 
    end
    $stop;
end

task display_message ; 
begin 
    $display("Test : out1_tb = %d, out2_tb = %d, out3_tb = %d", out1_tb, out2_tb, out3_tb);
end
endtask 

endmodule
