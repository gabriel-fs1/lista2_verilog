`include "fullsubtractor_behav.v"
`timescale 1ns/100ps

module fullsubtractor_behav_tb;


    reg a_tb, b_tb, bin_tb;

    wire diff_tb, bout_tb;

    fullsubtractor_behav uut (
        .a(a_tb),
        .b(b_tb),
        .borrow_in(bin_tb),
        .diff(diff_tb),
        .borrow_out(bout_tb)
    );


    initial begin
        $dumpfile("fullsubtractor_behav.vcd");
        $dumpvars(0, fullsubtractor_behav_tb);

        $monitor("Tempo=%0t | a=%b b=%b bin=%b | bout=%b diff=%b",
                 $time, a_tb, b_tb, bin_tb, bout_tb, diff_tb);

        a_tb=0; b_tb=0; bin_tb=0; #10; // 0-0-0 = 0 (bout=0, diff=0)
        a_tb=0; b_tb=0; bin_tb=1; #10; // 0-0-1 = -1 (bout=1, diff=1)
        a_tb=0; b_tb=1; bin_tb=0; #10; // 0-1-0 = -1 (bout=1, diff=1)
        a_tb=0; b_tb=1; bin_tb=1; #10; // 0-1-1 = -2 (bout=1, diff=0)
        a_tb=1; b_tb=0; bin_tb=0; #10; // 1-0-0 = 1 (bout=0, diff=1)
        a_tb=1; b_tb=0; bin_tb=1; #10; // 1-0-1 = 0 (bout=0, diff=0)
        a_tb=1; b_tb=1; bin_tb=0; #10; // 1-1-0 = 0 (bout=0, diff=0)
        a_tb=1; b_tb=1; bin_tb=1; #10; // 1-1-1 = -1 (bout=1, diff=1)
        
        $finish;
    end

endmodule
