.data

vector1: .word 6,7,8,9,10,-1,34,23
vectorS: .space 32

.text
main: 
	la $t0, vector1
	la $t1, vectorS
	li $t2, 0
	li $t3,8
bucle:
	bgt $t2, $t3, finbucle
	lw $t4, 0($t0) # cargo en $t4 los elementos del vector
	addi $t4, $t4, 1
	sw $t4, 0($t1)
	addi $t2, $t2, 1
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	j bucle
finbucle:
	li $v0, 10
	syscall