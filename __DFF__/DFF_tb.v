module dff_tb ; 

reg  clk_tb , rst_tb , ce_tb  ; 

reg  [15:0] in_tb  ; 

wire [15:0] out_tb ; 


dff #(.signal_width(16)
    )  
    DUT  (.clk (clk_tb)  , 
            .rst (rst_tb)  , 
            .in  (in_tb)   , 
            .ce  (ce_tb)   , 
            .out (out_tb)     );  

initial begin
    clk_tb=0 ; 
    forever #2 clk_tb=~clk_tb ; 
end

initial begin 

    rst_tb = 1         ; 
    in_tb  = 0         ; 
    ce_tb  = 0         ; 
    display_message    ; 
    @(negedge clk_tb ) ; 
    rst_tb = 0         ; 
    ce_tb  = 0         ; 
    display_message    ;
    @(negedge clk_tb ) ; 
    rst_tb = 0         ;  
    ce_tb  = 1         ; 
    display_message    ;
    @(negedge clk_tb ) ; 

    repeat (500) begin 
        in_tb  = $random   ; 
        ce_tb  = $random   ; 
        display_message    ;        
        @(negedge clk_tb ) ; 
    end 
    $stop ; 
end 
task display_message ;
begin 
    $display(" rst = %d ; clk_enable = %d ; in= %d ;  > out = %d ;;",
                rst_tb , ce_tb , in_tb , out_tb ) ;
end
endtask 
endmodule    