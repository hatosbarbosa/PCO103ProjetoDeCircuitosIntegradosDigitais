#encerra qualquer simulacao
quit -sim

vlog *.sv

#cria simulacao apresentando a saida do console
vsim .displaymsgmode both work mux_4_tb_vector

#adiciona as formas de onda no simulador 
add wave sim:/mux4_tb_vector/*

#roda X unidades do timescale
run 1000