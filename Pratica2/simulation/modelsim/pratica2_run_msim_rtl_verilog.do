transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/ifetch.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/tlb.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/pratica2.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/dec3to5.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/proc.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/multiplex.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/ramlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/romlpm.v}
vlog -vlog01compat -work work +incdir+C:/Users/erick/Downloads/aoc2-cefet-main\ (1)/Pratica2/code {C:/Users/erick/Downloads/aoc2-cefet-main (1)/Pratica2/code/counterlpm.v}

