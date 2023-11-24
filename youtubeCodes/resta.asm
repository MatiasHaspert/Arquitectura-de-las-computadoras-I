.data

numero1: .word 20
numero2: .word 8

.text
	lw $s0, numero1($0)
	lw $s1, numero2($0)
	sub $t0, $s0, $s1
	
	li $v0, 1
	move $a0, $t0
	syscall