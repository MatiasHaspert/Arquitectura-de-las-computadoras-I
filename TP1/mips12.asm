# 12) Diseña un programa ensamblador que defina el vector de enteros de dos
# elementos V=(10,20) en la memoria de datos a partir de la dirección
# 0x10000000 y almacene su suma a partir de la dirección donde acaba el vector.


.data 0x10000000	#zona de datos

vector: .word	10,20

.text		#zona de instrucciones
main:
	lw $t0, vector($0)
	lw $t1, vector+4($0)
	add $t1, $t0, $t1
	sw $t1, vector+8($0)