transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/u1014583/Documents/School/ECE\ 3710\ -\ Computer\ Design\ Lab/HexDefenders/Controller/VGA {C:/Users/u1014583/Documents/School/ECE 3710 - Computer Design Lab/HexDefenders/Controller/VGA/vga.v}
vlog -vlog01compat -work work +incdir+C:/Users/u1014583/Documents/School/ECE\ 3710\ -\ Computer\ Design\ Lab/HexDefenders/Controller/VGA {C:/Users/u1014583/Documents/School/ECE 3710 - Computer Design Lab/HexDefenders/Controller/VGA/vga_control.v}
vlog -vlog01compat -work work +incdir+C:/Users/u1014583/Documents/School/ECE\ 3710\ -\ Computer\ Design\ Lab/HexDefenders/Controller/VGA {C:/Users/u1014583/Documents/School/ECE 3710 - Computer Design Lab/HexDefenders/Controller/VGA/glyphs.v}
vlog -vlog01compat -work work +incdir+C:/Users/u1014583/Documents/School/ECE\ 3710\ -\ Computer\ Design\ Lab/HexDefenders/Controller/VGA {C:/Users/u1014583/Documents/School/ECE 3710 - Computer Design Lab/HexDefenders/Controller/VGA/bitgen.v}

