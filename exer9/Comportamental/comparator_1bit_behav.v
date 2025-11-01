module comparator_1bit_behav(
    input wire a,
    input wire b,
    output wire a_maior_que_b,
    output wire a_menor_que_b, 
    output wire a_igual_b  
);

    assign a_maior_que_b = (a & ~b);
    assign a_menor_que_b = (~a & b);
    assign a_igual_b = ~(a ^ b);

endmodule
