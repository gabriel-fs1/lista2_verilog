module halfadder_struct(
  input a, b,
  output sum, carry
);

  xor U1_Xor (sum, a, b);
  and U2_And (carry, a, b);

endmodule
