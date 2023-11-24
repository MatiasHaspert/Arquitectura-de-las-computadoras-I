.data

.text
main:
	addi $s0, $s0, 10
	
	jal increaseRegister
	
	#print valor
	li $v0, 1
	la $a0 ($s0)
	syscall
	
	#fin
	li $v0, 10
	syscall

increaseRegister:
		addi $sp, $sp, -4 # muevo el puntero al stack 4bytes hacia abajo para almacenar otro valor
		sw $s0, 0($sp) # almaceno el valor en el stack
		
		addi $s0, $s0, 30
		
		#print nuevo valor en la funcion
		li $v0, 1
		la $a0, ($s0)
		syscall
		
		lw $s0, 0($sp)
		addi $sp, $sp, 4 # vuelvo a apuntar al valor anterior 
		
		jr $ra
		
		
		
		
	