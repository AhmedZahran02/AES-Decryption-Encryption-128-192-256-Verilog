transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/AES.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/subBytes.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/sbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/Shift_Rows.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/MixColumns.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/rotword.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/invsbox.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/invsubBytes.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/Rcon.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/KeyExpansion.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/inv_Shift_Rows.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/main.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/AES2.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/main2.v}
vlog -vlog01compat -work work +incdir+C:/Users/ASUS/Documents/GitHub/Logic-Project {C:/Users/ASUS/Documents/GitHub/Logic-Project/inv_MixColumns.v}

