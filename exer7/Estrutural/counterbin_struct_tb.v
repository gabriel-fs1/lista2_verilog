`include "counterbin_struct.v"
`timescale 1ns/100ps

module counterbin_struct_tb;


  reg clk_tb;
  reg rst_tb;

  wire [3:0] count_tb;
  
  counterbin_struct uut (
    .clk(clk_tb),
    .rst(rst_tb),
    .q(count_tb)
  );
  
  
  always begin
    #5 clk_tb = ~clk_tb;
  end

 
  initial begin
    $dumpfile("counterbin_struct.vcd");
    $dumpvars(0, counterbin_struct_tb);
    
    
    clk_tb = 0; 
    rst_tb = 1; 
    
    $monitor("Tempo=%0t | clk=%b rst=%b | count[3:0] = %d (%b)",
             $time, clk_tb, rst_tb, count_tb, count_tb);

    #20;

    rst_tb = 0;

    #200;
    
    $finish; 
  end

endmodule
