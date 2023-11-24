.data

msg1: .asciiz "\nIntroduzca A: "
msg2: .asciiz "Introduzca B: "
msg3: .asciiz "Introduzca C: "
msg4: .asciiz "El area cuadrada es: "
msg5: .asciiz "\nFin de programa"

.text
main:
	la $a0, msg1
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	blez $v0, fin_main
	move $a1, $v0 # $a1 = A
	la $a0, msg2
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	blez $v0, fin_main
	move $a2, $v0 # $a2 = B
	la $a0, msg3
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	blez $v0, fin_main
	move $a3, $v0 # $s3 = C
	jal areasq
	move $t0, $v0 # no pierdo el area cuadrada
	la $a0, msg4
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	j main
fin_main:
	la $a0, msg5
	li $v0, 4
	syscall
	li $v0, 10
	syscall
	
#a1 = A
#a2 = B
#a3 = C
areasq:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	jal semip
	sub $t0, $v0, $a1 # (S-A)
	sub $t1, $v0, $a2 # (S-B)
	sub $t2, $v0, $a3 # (S-C)
	mult $v0, $t0
	mflo $v0
	mult $v0, $t1
	mflo $v0
	mult $v0, $t2
	lw $ra, 4($sp) # recupero la direccion de retorno al main
	addi $sp, $sp, 4
	jr $ra
	
# v0 = retorno el semiperimetro
semip:
	add $t0, $a1, $a2
	add $t0, $t0, $a3 
	li $t1, 2
	div $t0, $t1
	mflo $v0
	jr $ra
	
	
