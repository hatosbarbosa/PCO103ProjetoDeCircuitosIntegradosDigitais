`timescale 100ns/100ns

module mux4_tb_vector;

    logic [3:0] d0, d1, d2, d3, y;
    logic [1:0] s;
    mux4 DUT (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .y(y),
        .s(s)  
    );

    logic [7:0] i; // variável para indexar o vetorTeste
    logic [3:0] y_esperado;
    initial begin
    $readmemb("vector", vetorTeste);
    i = 0;

    end

    always begin
        {d0, d1, d2, d3, s, y_esperado} = vetorTeste [i];
    end


endmodule