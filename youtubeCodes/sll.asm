.data

.text
	addi $t0, $0, 10
	sll $t1, $t0, 2
	
	# muestro por pantalla el producto
	li $v0, 1
	move $a0, $t1
	syscall