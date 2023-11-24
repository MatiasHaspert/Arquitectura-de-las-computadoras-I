.data
	message: .asciiz "Hola a todos\n Mi nombre es Matias\n"
	
.text
	jal displayMessage
	
	addi $s0, $zero, 5
	
	#display number 5 in the screen
	
	li $v0, 1
	add $a0, $zero, $s0
	syscall

	# decirle al programa que termino
	
	li $v0, 10
	syscall
	
	#display message in the screen
	displayMessage:
	li $v0, 4
	la $a0, message
	syscall
	
	jr $ra