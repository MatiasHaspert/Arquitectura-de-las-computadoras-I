.data

.text
	addi $t0, $0, 30
	addi $t1, $0, 8
	
	div $t0, $t1
	
	mflo $s0 #cociente
	mfhi $s1 #resto
	
	li $v0, 1
	move $a0, $s0
	syscall