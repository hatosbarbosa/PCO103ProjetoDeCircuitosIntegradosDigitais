
`timescale 100ns/100ns

module sync_tb_vector;
    logic d,q,n;
    logic clk;

    logic q_esperado;
    logic [15:0]i;


    sync DUT (
        .d(d),
        .q(q),
        .n(n),
        .clk(clk)
    );

    logic [2:0] vetorTeste[15:0];
     //esquerda: tamanho da linha, direita: quantos elementos
    initial begin
    $readmemb("vector", vetorTeste);
    i = 0;
    end

    always begin
        {clk, d, q_esperado} = vetorTeste [i]; #1;
        i = i + 1; #1;
    end

    


endmodule