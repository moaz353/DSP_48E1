module dual_B_register (B , BCIN , in0 ,  clk , CEB1 , CEB2 , RSTB ,  out1 , out2 , out3 ); 

parameter input_sel_p = "DIRECT" ; //** direct , cascade // B_input_p ; 
parameter sel1_p      = 1        ; //** = |Breg_p  ; red_or ; B1 ; 
parameter sel2_p      = 0        ; //** = Breg[1]  ; B2 ; 
parameter sel3_p      = 1        ; //** Bcascadereg [0]  ;  and it depend on Breg ;  

input        clk  ;
input        RSTB ;
input        CEB1 ;
input        CEB2 ;

input [17:0] B    ; //** B ;  
input [17:0] BCIN ; //** Bcin ; 
input        in0  ; //** inmode[4] ;

output [17:0] out1 ; //** to Bcout  ;
output [17:0] out2 ; //** to X_mux  ; 
output [17:0] out3 ; //** to B_mult ; 

wire   [17:0] mux1_out ;
wire   [17:0] B1       ;
wire   [17:0] mux2_out ; 
wire   [17:0] B2       ;
wire   [17:0] mux3_out ; 


assign mux1_out = (input_sel_p == "DIRECT")? B : BCIN ; // > B ; 

dff #(.signal_width(18)) B1reg (.clk(clk),.rst(RSTB),.in(mux1_out),.ce(CEB1),.out(B1)) ; 
assign mux2_out =(sel1_p)? B1 : mux1_out ;  // 1 > B1 ;

dff #(.signal_width(18)) B2reg (.clk(clk),.rst(RSTB),.in(mux2_out),.ce(CEB2),.out(B2)) ; 
assign mux3_out =(sel2_p)? B2 : mux2_out ;  // 1 > B2 ;

// Bcout_mux 
assign out1 =(sel3_p)? B1 : mux3_out   ; // 0 > mux3_out ; 

// B to X_mux
assign out2 = mux3_out ;  

// B to MULT 
assign out3 =(in0)? B1 : mux3_out ;  // 1 > B1 ;
endmodule 
