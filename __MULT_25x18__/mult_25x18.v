module mult_25x18 (in1 , in2 , out  ) ; 

parameter  data_width_in1 = 25 ;  // A_mult_widh
parameter  data_width_in2 = 18 ;  // B_mult_width 

localparam out_width      = data_width_in1 + data_width_in2 ;

input      [data_width_in1-1:0] in1 ; //** A_mult
input      [data_width_in2-1:0] in2 ; //** B_mult

output     [out_width-1:0]  out ;     //** MULT_25x15_out  

assign out = in1 * in2 ; 

endmodule 