transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Masters/PCO103ProjetoDeCircuitosIntegradosDigitais/Aula4/divideby3FSM {C:/Masters/PCO103ProjetoDeCircuitosIntegradosDigitais/Aula4/divideby3FSM/divideby3FSM.sv}

