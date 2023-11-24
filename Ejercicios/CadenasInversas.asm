.data

mensaje1: .asciiz "\nIngrese cadena 1: "
mensaje2: .asciiz "\nIngrese cadena 2: "
salida1: .asciiz "\nSon inversas"
salida2: .asciiz "\nNo son inversas"
cadena1: .space 12
cadena2: .space 12

.text
	la $a0, mensaje1
	li $v0, 4
	syscall # muestro el primer mensaje
	la $a0, cadena1
	li $a1, 11
	li $v0, 8 
	syscall # pido que ingrese la cadena
	la $a0, mensaje2
	li $v0, 4
	syscall
	la $a0, cadena2
	li $a1, 11
	li $v0, 8 
	syscall
	la $a0, cadena1
	la $a1, cadena2
	jal subr
	beqz $v0, sino
	la $a0, salida1
	li $v0, 4
	syscall
	j end_main
sino:
	la $a0, salida2
	li $v0, 4
	syscall
end_main:
	li $v0, 10
	syscall
# a0 = direccion de la cadena 1
# a1 = direccion de la cadena 2
# v0 = (1 si son inversas, 0 si no)
subr:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	move $a2, $a0
	jal length_cadena
	move $s0, $v0 # s0 = cantidad de caracter de la cadena 1
	move $a2, $a1
	jal length_cadena
	move $s1, $v0 # s1 = cantidad de caracter de la cadena 2
	bne $s0, $s1, sino
loop1: #recorro la cadena 1 hasta el ultimo caracter
	addi $s0, $s0, -1
	beqz $s0, loop2
	addi $a0, $a0, 1
	j loop1
loop2:	# chequeo caracter a caracter
	beqz $s1, si 
	lb $t0, ($a0)
	lb $t1, ($a1)
	bne $t0, $t1, si_no
	addi $a0, $a0, -1
	addi $a1, $a1, 1
	addi $s1, $s1, -1
	j loop2
si_no:
	li $v0, 0	# si no son inversas retorno 0
	j end_subr
si:
	li $v0, 1
end_subr:
	lw $ra, 4($sp)
	addi $sp, $sp, 4
	jr $ra
	
# a2 = direccion de la cadena
length_cadena:
	li $v0, 0	# v0 = contador de caracteres
loop:
	lb $t0, ($a2)
	beq $t0, $0, fin_length_cadena
	addi $v0, $v0, 1
	addi $a2, $a2, 1
	j loop
fin_length_cadena:
	addi $v0, $v0, -1 # poque cuenta el caracter de salto de linea '\n'
	jr $ra
	
