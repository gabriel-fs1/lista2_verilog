module decoder2to4_behav (
    input  [1:0] in,   // 2-bit input
    output  [3:0] out    // 4-bit output
);

  assign out[0] = (~in[1] & ~in[0]);
  assign out[1] = (~in[1] &  in[0]);
  assign out[2] = ( in[1] & ~in[0]);
  assign out[3] = ( in[1] &  in[0]);

endmodule