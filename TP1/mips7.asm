# 7) Diseña un programa ensamblador que defina el vector de enteros V=(10, 20, 25, 
# 500, 3) en la memoria de datos a partir de la dirección 0x10000000 y cargue todos 
# sus componentes en los registros $s0 - $s4.

.data	0x10000000		# comienzo de zona de datos

vector: .word 10, 20, 25, 500, 3

.text		# zona de instrucciones
main:
	lw $s0, vector($0)
	lw $s1, vector+4($0)
	lw $s2, vector+8($0)
	lw $s3, vector+12($0)
	lw $s4, vector+16($0)