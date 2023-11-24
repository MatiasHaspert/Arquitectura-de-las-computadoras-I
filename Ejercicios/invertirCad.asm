.data

cadena: .asciiz "Ingrese una cadena: "
buffer: .space 10
bufferSalida: .space 10

.text
main:
	la $a0, cadena
	li $v0, 4
	syscall
	la $a0, buffer
	li $a1, 10
	li $v0, 8
	syscall
	la $t0, buffer
push_caracteres:
	lb $t1, ($t0)
	addi $sp, $sp, -4
	sw $t1, ($sp)
	addi $t0, $t0, 1
	bnez $t1, push_caracteres
	la $t0, buffer
pop_caracteres:
	addi $sp, $sp, 4
	lw $t1, ($sp)
	sb $t1, ($t0)
	addi $t0, $t0, 1
	bnez $t1, pop_caracteres
print_cadena_invertida:
	la $a0, buffer
	li $v0, 4
	syscall
	li $v0, 10
	syscall
 
	
	