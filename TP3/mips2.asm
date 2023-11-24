.data

msjN: .asciiz "\nIngrese su nombre: "
msjA: .asciiz "\nIngrese su apellido: "
msjD: .asciiz "\Ingrese su DNI: "
res: .asciiz "\nDatos del usuario:\n"
resN: .asciiz "\nNombre: "
resA: .asciiz "\nApellido: "
resD: .asciiz "\nDNI: "
nombre: .space 10
apellido: .space 15
	.align 2 #luego de ingresar cadenas alinear las direccion al ingresar un entero
dni: .space 4

.text
main:
	# pido nombre y lo guardo
	li $v0, 4
	la $a0, msjN
	syscall
	li $v0, 8
	la $a0, nombre
	li $a1, 10
	syscall
	
	# pido apellido y lo guardo
	li $v0, 4
	la $a0, msjA
	syscall
	li $v0, 8
	la $a0, apellido
	li $a1, 15
	syscall
	
	# pido dni y lo guardo
	li $v0, 4
	la $a0, msjD
	syscall
	li $v0, 5
	syscall
	sw $v0, dni
	
	#muestro los datos
	li $v0, 4
	la $a0, res
	syscall
	
	li $v0, 4
	la $a0, resN
	syscall
	
	li $v0, 4
	la $a0, nombre
	syscall
	
	li $v0, 4
	la $a0, resA
	syscall
	
	li $v0, 4
	la $a0, apellido
	syscall

	li $v0, 4
	la $a0, resD
	syscall
	
	li $v0, 1
	lw $a0, dni
	syscall
	
	
	
	
	