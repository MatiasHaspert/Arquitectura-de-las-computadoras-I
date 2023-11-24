.data

msj1: .asciiz "Ingrese una palabra: "
cadena: .space 10

.text
main:
	li $v0, 4
	la $a0, msj1
	syscall
	
	addi $sp, $sp, -11
	li $v0, 8
	la $a0, 0($sp) #almaceno la cadena en la pila
	li $a1, 11
	syscall

	la $t1, cadena		
for:
	lb $t0, 0($sp)
	sb $t0, ($t1)
	beq $t0, 0, fin
	addi $t1, $t1, 1
	addi $sp, $sp, 1
	j for 

fin:
	li $v0, 4
	la $a0, cadena
	syscall
	
	
	
	
