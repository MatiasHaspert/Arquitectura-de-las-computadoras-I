.data

msg1: .asciiz "Introduzca una cantidad: "
msg2: .asciiz "Introduzca el elementro["
msg3: .asciiz "]: "
msg4: .asciiz "La lista de cuadrados es: "
msg5: .asciiz "\nFin del programa"
#tamaño del vector
vecs: .word 0x2
#direccion del vector
vecn:	.word 4, 5

.text
main:
	#solicite la cantidad de numeros
	la $a0, msg1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, vecs
	#reserve memoria dinamica para la cantidad pedida
	# la direccion debe ser archivada en vecn
	move $a0, $v0
	li $v0, 9
	syscall
	sw $v0, vecn # vecn direccion del vector dinamico
	#solicitar los enteros y cargarlos en el vector
	li $t0, 1 #contador de numeros
	lw $t1, vecs
	lw $t2, vecn
loop1:
	la $a0, msg2
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	la $a0, msg3
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	sw $v0, ($t2)
	addi $t0, $t0, 1
	addi $t1, $t1, -1
	addi $t2, $t2, 4
	bnez $t1, loop1
	#llame ala funcion que calcula los cuadrados y los almacena en el mismo
	lw $a0, vecs
	lw $a1, vecn
	jal sqr
	#imprima la lista
	lw $t0, vecn
	lw $t1, vecs
	la $a0, msg4
	li $v0, 4
	syscall
loop2:
	lw $a0, ($t0)
	li $v0, 1
	syscall
	li $a0, 0x20
	li $v0, 11
	syscall
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	bnez $t1, loop2
	#imprimir mensaje de cierre
	la $a0, msg5
	li $v0, 4
	syscall
	#end
	li $v0, 10
	syscall

#a0 = tamaño del vector
#a1 = direccion del vector
sqr:
	lw $t0, ($a1)
	mult $t0, $t0
	mflo $t0
	sw $t0, ($a1)
	addi $a0, $a0, -1
	addi $a1, $a1, 4
	bnez $a0, sqr
	jr $ra
	
	
	
	