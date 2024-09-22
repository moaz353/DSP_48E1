module mux_2x1 (in0 , in1  , out ) ; 

parameter   data_width = 1 ;
parameter   sel_p        = 1 ;             

input  [data_width-1:0] in0 , in1 ;

output [data_width-1:0] out ; 

assign out = (sel_p)? in1 : in0  ; 

endmodule 