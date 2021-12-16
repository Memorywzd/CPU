transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/ram.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/z.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/tr.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/top.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/r.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/pc.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/ir.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/dr.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/cpu.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/control.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/ar.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/alu.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/ac.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/light_show.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/clk_div.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/CPU_Controller.v}
vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU/rtl {D:/jizukeshe/CPU/rtl/qtsj.v}

vlog -vlog01compat -work work +incdir+D:/jizukeshe/CPU {D:/jizukeshe/CPU/top.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  top_vlg_tst

add wave *
view structure
view signals
run -all
