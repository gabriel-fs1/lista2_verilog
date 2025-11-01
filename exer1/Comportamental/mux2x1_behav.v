/* Primeiro exemplo Verilog */
// Multiplexador 2x1
module mux2x1_behav(a, b, sel, y);
 input a, b, sel; // Entradas
 output y; // Saída
 assign y = (sel) ? a : b;
endmodule