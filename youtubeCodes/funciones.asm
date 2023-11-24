.data

mensaje: .asciiz "Hola a todos.\nMi nombre es Matias.\n"

.text
main:
	jal mostrar
	
	addi $s0, $s0, 5 # s0 = 5
	#lo muestro por pantalla
	la $a0, ($s0)
	li $v0, 1
	syscall
	
	
	li $v0, 10
	syscall

mostrar:
	la $a0, mensaje
	li $v0, 4
	syscall
	jr $ra
	
