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
    logic [21:0] vetorTeste [15:0]; //esquerda: tamanho da linha, direita: quantos elementos
    
    initial begin
    $readmemb("vector", vetorTeste);
    i = 'b0;
    end

    always begin
        {d0, d1, d2, d3, s, y_esperado} = vetorTeste [i]; #1;
        begin if (y_esperado != y)
            $display("Saída incorreta!");
        else
            $$display("Saída correta: y = %b", y);
        end
        i = i + 1; #1;
    end
    
    
   
endmodule