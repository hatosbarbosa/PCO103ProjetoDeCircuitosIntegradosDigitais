#encerra qualquer simulacao
quit -sim

vlog *.sv

#cria simulacao apresentando a saida do console
vsim -displaymsgmode both work.alu_tb

#adiciona as formas de onda no simulador 
add wave sim:/alu_tb/*

#roda X unidades do timescale
run 1000