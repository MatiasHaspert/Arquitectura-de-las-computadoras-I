# 1) Diseña un programa ensamblador que pida por la consola dos enteros “A” 
#    y “B” dando como resultado su suma “A+B”

.data
msj1: .asciiz "\nIngrese un entero A: "
msj2: .asciiz "\nIngrese un entero B: "
msj3: .asciiz "\nA + B = "

.text
main:
	li $v0, 4 
	la $a0, msj1
	syscall
	li $v0, 5 #leo el primer entero
	syscall
	move $t0, $v0 # t0 = A
	li $v0, 4 
	la $a0, msj2
	syscall
	li $v0, 5 #leo el segundo entero
	syscall
	move $t1, $v0 # t1 = B
	add $t2, $t0, $t1 # a+ b
	li $v0, 4
	la $a0, msj3
	syscall
	li $v0, 1
	la $a0, ($t2) #muestro la suma
	syscall
	li $v0, 10
	syscall
	
	