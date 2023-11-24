.data

dir: .asciiz "Introduce el entero: "
	#.align 2
entero: .space 4

.text
main: 
	li $v0, 4 # código de imprimir cadena
	la $a0, dir # dirección de la cadena
	syscall # Llamada al sistema 
	li $v0, 5 # código de leer entero
	syscall # Llamada al sistema 
	sw $v0, entero

# cuestion 1.8

# al eliminar la linea align 2, el programa no funciona correctamente. esto
# sucede porque la cadena de caracteres no esta alineada y los 4 bytes
# reservados no empiezan en una direccion de memoria que sea multiplo de 4. por
# lo tanto, al querer guardar el entero el programa da error.