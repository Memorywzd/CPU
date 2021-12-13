transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/CPU_dataflow.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/controller.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/top.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/r.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/qtsj.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/pc.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/memory.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/light_show.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/ir.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/dr.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/CPU_Controller.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/clk_div.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/ar.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/alu.v}
vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/modules {D:/Principles of Computer Organization/CPU/modules/ac.v}

vlog -vlog01compat -work work +incdir+D:/Principles\ of\ Computer\ Organization/CPU/simulation/modelsim {D:/Principles of Computer Organization/CPU/simulation/modelsim/top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_vlg_tst

add wave *
view structure
view signals
run -all
