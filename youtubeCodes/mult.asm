.data

.text
	addi $t0, $0, 2000 # $t0 = 2000
	addi $t1, $0, 10 # $t1 = 10
	
	mult $t0, $t1
	
	mflo $s0	# muevo el producto a $s0
	
	
	# muestro por pantalla el producto
	li $v0, 1
	move $a0, $s0
	syscall