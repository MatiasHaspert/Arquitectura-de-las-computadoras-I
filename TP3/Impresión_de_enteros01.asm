.data
 
dir: .asciiz "Se va a imprimir el entero: "
entero: .word 7

.text
main: 
	li $v0, 4 # código de imprimir cadena
	la $a0, dir # dirección de la cadena
	syscall # Llamada al sistema 
	li $v0, 1 # código de imprimir entero
	li $a0, 5 # entero a imprimir
	syscall # Llamada al sistema