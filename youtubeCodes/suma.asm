.data

numero1: .word 10
numero2: .word 4

.text
	lw $t0, numero1($0)
	lw $t1, numero2($0)
	add $t2, $t0, $t1
	
	li $v0, 1
	move $a0, $t2
	syscall
