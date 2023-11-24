.data

mensaje: .asciiz "Hola mundo\n"

.text
	li $v0, 4
	la $la, mensaje
	syscall