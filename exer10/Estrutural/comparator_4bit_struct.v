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



module comparator_4bit_struct(
    input wire [3:0] a,
    input wire [3:0] b,
    output wire a_maior_que_b, 
    output wire a_menor_que_b,
    output wire a_igual_b 
);

    wire gt3, lt3, eq3; 
    wire gt2, lt2, eq2; 
    wire gt1, lt1, eq1; 
    wire gt0, lt0, eq0; 

    comparator_1bit_struct C3 (
        .a(a[3]), .b(b[3]), 
        .a_maior_que_b(gt3), .a_menor_que_b(lt3), .a_igual_b(eq3)
    );
    
    comparator_1bit_struct C2 (
        .a(a[2]), .b(b[2]), 
        .a_maior_que_b(gt2), .a_menor_que_b(lt2), .a_igual_b(eq2)
    );
    
    comparator_1bit_struct C1 (
        .a(a[1]), .b(b[1]), 
        .a_maior_que_b(gt1), .a_menor_que_b(lt1), .a_igual_b(eq1)
    );

    comparator_1bit_struct C0 (
        .a(a[0]), .b(b[0]), 
        .a_maior_que_b(gt0), .a_menor_que_b(lt0), .a_igual_b(eq0)
    );


    assign a_igual_b = (eq3 & eq2 & eq1 & eq0);

    assign a_maior_que_b = gt3 | 
                    (eq3 & gt2) | 
                    (eq3 & eq2 & gt1) | 
                    (eq3 & eq2 & eq1 & gt0);

    assign a_menor_que_b = lt3 | 
                    (eq3 & lt2) | 
                    (eq3 & eq2 & lt1) | 
                    (eq3 & eq2 & eq1 & lt0);

endmodule
