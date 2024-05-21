#encerra qualquer simulacao
quit -sim

vlog *.sv

#cria simulacao apresentando a saida do console
vsim -displaymsgmode both work.alu_enhanced_tb

#adiciona as formas de onda no simulador 
add wave sim:/alu_enhanced_tb/*

#roda X unidades do timescale
run 1000