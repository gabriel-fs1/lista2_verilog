`include "counterbin_behav.v"
`timescale 1ns/100ps

module counterbin_behav_tb;

  // Sinais que vamos controlar
  reg clk_tb;
  reg rst_tb;
  
  // Sinal que vamos observar
  wire [3:0] count_tb;
  
  // Instanciação do Contador
  counterbin_behav uut (
    .clk(clk_tb),
    .rst(rst_tb),
    .count(count_tb)
  );
  
  // 1. Geração de Clock
  // Este bloco 'always' roda para sempre,
  // invertendo o clk_tb a cada 5ns.
  // Isso cria um clock com período de 10ns (5ns LOW, 5ns HIGH).
  always begin
    #5 clk_tb = ~clk_tb;
  end

  // 2. Bloco de Estímulos e Simulação
  initial begin
    $dumpfile("counterbin_behav.vcd");
    $dumpvars(0, counterbin_behav_tb);
    
    // Inicializa os sinais
    clk_tb = 0; // Começa o clock em 0
    rst_tb = 1; // Começa com o reset ATIVADO
    
    // Monitora os sinais. %d mostra o valor em decimal (útil!)
    $monitor("Tempo=%0t | clk=%b rst=%b | count[3:0] = %d (%b)",
             $time, clk_tb, rst_tb, count_tb, count_tb);
             
    // 1. Mantém o reset por 20ns (2 ciclos de clock)
    #20;
    
    // 2. Desliga o reset. Agora o contador deve começar a contar.
    rst_tb = 0;
    
    // 3. Deixa a simulação rodar por 200ns (20 ciclos de clock)
    // Isso é suficiente para ver o contador ir de 0 a 15 e "virar" (overflow)
    #200;
    
    $finish; // Termina a simulação
  end

endmodule
