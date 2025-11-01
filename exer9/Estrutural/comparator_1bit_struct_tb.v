`include "comparator_1bit_struct.v"
`timescale 1ns/100ps

module comparator_1bit_struct_tb;

    reg a_tb, b_tb;

    wire gt_tb, lt_tb, eq_tb;

    comparator_1bit_struct uut (
        .a(a_tb),
        .b(b_tb),
        .a_maior_que_b(gt_tb),
        .a_menor_que_b(lt_tb),
        .a_igual_b(eq_tb)
    );

    initial begin
        $dumpfile("comparator_1bit_struct.vcd");
        $dumpvars(0, comparator_1bit_struct_tb);

        $monitor("Tempo=%0t | a=%b b=%b | Maior(gt)=%b Menor(lt)=%b Igual(eq)=%b",
                 $time, a_tb, b_tb, gt_tb, lt_tb, eq_tb);

        a_tb=0; b_tb=0; #10; // Esperado: eq=1
        a_tb=0; b_tb=1; #10; // Esperado: lt=1
        a_tb=1; b_tb=0; #10; // Esperado: gt=1
        a_tb=1; b_tb=1; #10; // Esperado: eq=1
        
        #10 $finish;
    end

endmodule
