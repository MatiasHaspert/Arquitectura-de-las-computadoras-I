.data 
dir: .asciiz "Introduce los caracteres: \n"
buffer: .space 10 # zona para los caracteres

.text
main: 
	li $v0,4  #código de imprimir cadena
	la $a0,dir # dirección de la cadena
	syscall # Llamada al sistema 
	li $v0,8 # código de leer el string
	la $a0,buffer # dirección lectura cadena
	li $a1,10 # espacio máximo cadena
	syscall # Llamada al sistema