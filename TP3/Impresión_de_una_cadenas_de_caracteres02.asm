.data

dir: .asciiz "Hola. Ha funcionado."

.text
main: 
	li $v0,4 # código de imprimir cadena
	la $a0,dir+6 # dirección de la cadena #aumento la direccion 6 bits
	syscall # Llamada al sistema