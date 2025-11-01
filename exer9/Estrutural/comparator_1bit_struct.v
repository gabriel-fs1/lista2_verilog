module comparator_1bit_struct(
    input wire a,
    input wire b,
    output wire a_maior_que_b, 
    output wire a_menor_que_b,
    output wire a_igual_b  
);

    wire not_a;   
    wire not_b;   
    wire xor_out; 

    not U_NOT_A (not_a, a);
    not U_NOT_B (not_b, b);
    and U_GT (a_maior_que_b, a, not_b);
    and U_LT (a_menor_que_b, not_a, b);
    xor U_XOR (xor_out, a, b);
    not U_EQ (a_igual_b, xor_out);

endmodule
