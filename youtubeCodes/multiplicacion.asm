.data

.text
	addi $s0, $0, 10 # $s0 = 10
	addi $s1, $0, 5 # $s1 = 5
	
	mul $t0, $s0, $s1
	
	li $v0, 1
	move $a0, $t0
	syscall