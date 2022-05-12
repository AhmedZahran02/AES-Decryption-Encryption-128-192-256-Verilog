transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/AES.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/subBytes.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/Shift_Rows.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/MixColumns.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/rotword.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/Rcon.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/KeyExpansion.v}
vlog -vlog01compat -work work +incdir+C:/Users/AOZ/Desktop/Logic-Project {C:/Users/AOZ/Desktop/Logic-Project/main.v}
