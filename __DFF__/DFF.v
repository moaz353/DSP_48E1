module dff (clk , rst , in , ce, out ) ; 

parameter signal_width = 1    ; 

input  clk , rst , ce  ; 

input  [signal_width-1:0] in   ; 

output reg [signal_width-1:0] out ; 

always @(posedge clk or posedge rst) begin
    if(rst) 
        out <= 0  ; 
    else begin 
        if (ce)
            out <= in ; 
    end
end

endmodule 

