`include "halfadder_behav.v"
`timescale 1ns/100ps

module halfadder_behav_tb;

  reg a_tb, b_tb;
  wire sum_tb, carry_tb;
  

  halfadder_behav uut (
    .a(a_tb),
    .b(b_tb),
    .sum(sum_tb),
    .carry(carry_tb)
  );


  initial begin
    $dumpfile("halfadder_behav.vcd");
    $dumpvars(0, halfadder_behav_tb);
    
    $monitor("Tempo=%0t | a=%b b=%b | carry=%b sum=%b", 
             $time, a_tb, b_tb, carry_tb, sum_tb);
    
    a_tb = 0; b_tb = 0; #10; // Espera: carry=0 sum=0
    a_tb = 0; b_tb = 1; #10; // Espera: carry=0 sum=1
    a_tb = 1; b_tb = 0; #10; // Espera: carry=0 sum=1
    a_tb = 1; b_tb = 1; #10; // Espera: carry=1 sum=0
    
    #10 $finish;
  end
  
endmodule
