.data

.text
main:
	addi $a0, $a0, 50 # argumentos
	addi $a1, $a1, 100
	jal addNumbers	
	
	#muestro por pantalla la suma
	li $v0, 1
	la $a0, ($v1)
	syscall
	
	li $v0, 10
	syscall

addNumbers:
	add $v1, $a0, $a1 # v1 = return value
	jr $ra
	
	