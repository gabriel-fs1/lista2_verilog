
// MÓDULO 1: O FLIP-FLOP D

module ffd (
    input wire clk,
    input wire rst,
    input wire d,
    output reg q   
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

// MÓDULO 2: O CONTADOR ESTRUTURAL

module counterbin_struct (
    input wire clk,
    input wire rst,
    output wire [3:0] q
);

    wire [3:0] d;          
    wire [3:0] q_interno; 

    assign d = q_interno + 1;
    
    ffd U0_ffd ( .clk(clk), .rst(rst), .d(d[0]), .q(q_interno[0]) );
    ffd U1_ffd ( .clk(clk), .rst(rst), .d(d[1]), .q(q_interno[1]) );
    ffd U2_ffd ( .clk(clk), .rst(rst), .d(d[2]), .q(q_interno[2]) );
    ffd U3_ffd ( .clk(clk), .rst(rst), .d(d[3]), .q(q_interno[3]) );

    assign q = q_interno;

endmodule

