.data

cadena1: .asciiz "\nIngresa un indice y te devolvere el valor en él: "
vec: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
n: .word 9
res: .space 4

.text
main:
	lw $a1, n
	la $a0, cadena1
	li $v0, 4
	syscall
	li $v0, 5 #pido el indice
	syscall
	bltz $v0, main
	bgt $v0, $a1, main
	la $a0, vec
	move $a2, $v0	#v0 = indice
	jal subr
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
subr:
	li $t0, 0 # i
loop:
	beq $t0, $a2, end_subr
	addi $t0, $t0, 1
	addi $a0, $a0, 4 #vec++
	j loop
end_subr:
	lw $t1, ($a0)
	move $v0, $t1
	jr $ra

	
	
