transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/proc.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/ULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/MUX.v}
vlog -vlog01compat -work work +incdir+C:/Users/Usuário/Documents/GitHub/Pratica-II-LAOC-II/Pratica\ 2 {C:/Users/Usu�rio/Documents/GitHub/Pratica-II-LAOC-II/Pratica 2/counterlpm.v}

