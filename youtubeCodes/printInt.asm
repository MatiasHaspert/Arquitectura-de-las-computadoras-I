.data

numero: .word 10

.text
	li $v0, 1
	lw $a0, numero
	syscall