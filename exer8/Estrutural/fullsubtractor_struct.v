module fullsubtractor_struct(
    input wire a,
    input wire b,
    input wire borrow_in,
    output wire diff,
    output wire borrow_out
);

    wire diff_wire;
    
    wire not_a;     
    
    wire and1_out;  
    wire and2_out; 
    wire and3_out; 

    xor U_XOR1 (diff_wire, a, b);
    xor U_XOR2 (diff, diff_wire, borrow_in);
    not U_NOT (not_a, a);
    and U_AND1 (and1_out, not_a, b);
    and U_AND2 (and2_out, not_a, borrow_in);
    and U_AND3 (and3_out, b, borrow_in);
    or  U_OR1 (borrow_out, and1_out, and2_out, and3_out);

endmodule
