`include "comparator_4bit_struct.v" 
`timescale 1ns/100ps

module comparator_4bit_struct_tb;


    reg [3:0] a_tb;
    reg [3:0] b_tb;
    
    wire gt_tb, lt_tb, eq_tb;

    comparator_4bit_struct uut (
        .a(a_tb),
        .b(b_tb),
        .a_maior_que_b(gt_tb),
        .a_menor_que_b(lt_tb),
        .a_igual_b(eq_tb)
    );

    initial begin
        $dumpfile("comparator_4bit_struct.vcd");
        $dumpvars(0, comparator_4bit_struct_tb);

        $monitor("Tempo=%0t | a=%d (%b) b=%d (%b) | Maior(gt)=%b Menor(lt)=%b Igual(eq)=%b",
                 $time, a_tb, a_tb, b_tb, b_tb, gt_tb, lt_tb, eq_tb);

        a_tb = 4'b0101; 
        b_tb = 4'b0011;
        #10;
        
        a_tb = 4'b1010; 
        b_tb = 4'b1010; 
        #10;

        a_tb = 4'b0011; 
        b_tb = 4'b0101; 
        #10;
        
        #10 $finish;
    end

endmodule
