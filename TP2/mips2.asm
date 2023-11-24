# 1) Diseña un programa en ensamblador que defina un vector de enteros, V, 
#    inicializado según los siguientes valores (V=[2, -4, -6]). Y obtenga un vector 
#    de booleanos, tal que cada elemento será 1 si el correspondiente elemento en el 
#    vector de enteros es mayor o igual que cero y 0 en caso contrario

.data

vector: .word 2, -4, -6
res: .space 3

.text
main:
	# comparacion del primer elemento
	lw $t0, vector($0)
	sge $t1, $t0, 0
	sb $t1, res($0)
	# comparacion del segundo elemento
	lw $t0, vector+4($0)
	sge $t2, $t0, 0
	sb $t2, res+1($0)
	# comparacion del segundo elemento
	lw $t0, vector+8($0)
	sge $t3, $t0, 0
	sb $t3, res+2($0)
