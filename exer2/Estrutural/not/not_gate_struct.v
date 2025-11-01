module not_gate_struct(a, y);
  input a;
  output y;
  wire not_a;

  not U1 (not_a, a);
  not U2 (y, not_a, a);


endmodule