`include "not_gate_struct.v" 
`timescale 1ns/100ps

module not_gate_struct_tb;
  reg a0;
  wire y0;

  not_gate_struct uut (.a(a0), .y(y0));

  initial begin
    $dumpfile("not_gate_struct.vcd");
    $dumpvars(0, not_gate_struct_tb);

    $monitor("Tempo=%0t | a0=%b => y0=%b", $time, a0, y0);

    a0 = 0; #10; //  0 e 0
    a0 = 1; #10; //  0 e 1

    #10 $finish;

    
  end

endmodule
