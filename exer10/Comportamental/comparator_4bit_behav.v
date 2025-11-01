module comparator_4bit_behav(
    input wire [3:0] a,
    input wire [3:0] b, 
    output wire a_maior_que_b, 
    output wire a_menor_que_b, 
    output wire a_igual_b  
);
    
    assign a_maior_que_b = (a > b);
    assign a_menor_que_b = (a < b);
    assign a_igual_b = (a == b);

endmodule
