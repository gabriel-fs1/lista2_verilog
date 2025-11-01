`include "decoder2to4_behav.v"
`timescale 1ns/100ps

module decoder2to4_behav_tb;

  reg [1:0] in_tb;
  wire [3:0] out_tb;

  decoder2to4_behav uut (
    .in(in_tb),
    .out(out_tb)
  );

  initial begin
    $dumpfile("decoder2to4_behav.vcd");
    $dumpvars(0, decoder2to4_behav_tb);
    

    $monitor("Tempo=%0t | in[1:0] = %b | out[3:0] = %b", 
             $time, in_tb, out_tb);
    
 
    in_tb = 2'b00; 
    #10;           
    
    in_tb = 2'b01; 
    #10;
    
    in_tb = 2'b10;
    #10;

    in_tb = 2'b11;
    #10;
    
    #10 $finish;
  end

endmodule
