.data

dir: .asciiz "Hola. Ha funcionado."

.text
main: 
	li $v0,4 # código de imprimir cadena
	la $a0,dir # dirección de la cadena
	syscall # Llamada al sistema

# cuestion 1.1

# se imprime el mensaje "Hola. Ha Funcionado." en la consola run I/O de MARS.
# que no es la misma consola que nos muestra los errores de compilacion y
# ejecucion.