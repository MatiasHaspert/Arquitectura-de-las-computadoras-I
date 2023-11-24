.data

dir: .asciiz "Introduce el entero: "
	.align 2
entero: .space 4

.text
main: 
	li $v0, 4 # código de imprimir cadena
	la $a0, dir # dirección de la cadena
	syscall # Llamada al sistema 
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
