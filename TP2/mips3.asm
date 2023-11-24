# 3) Diseña un programa en ensamblador que defina un vector de enteros, V, 
# inicializado a los siguientes valores V=[1, -4, -5, 2] y obtenga como resultado 
# una variable booleana que será 1 si todos los elementos de este vector son
# menores que cero.

.data

vector: .word -1, -4, -5, -2
res: .space 1

.text
main:
	lw $t0, vector($0)
	bge $t0, 0, fin
	lw $t0, vector+4($0)
	bge $t0, 0, fin
	lw $t0, vector+8($0)
	bge $t0, 0, fin
	lw $t0, vector+12($0)
	bge $t0, 0, fin
	addi $t1, $0, 1
	
fin:
	and $t1, $t1, 1
	sb $t1, res($0)
	li $v0, 10
	syscall
		