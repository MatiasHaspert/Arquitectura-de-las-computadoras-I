.data

vector: .word 1, 3, 1, 3, 1, 3, 1, 3, 1, 1
tam: .word 10
dato: .word 3
res: .space 4

.text
main:
	addi $sp, $sp, -16
	la $a0, vector # a0 = &vector
	sw $a0, 0($sp) #apilo &vector
	lw $a1, tam($t0) 
	sw $a1, 4($sp) # apilo tam
	lw $a2, dato($0) # a2 = (dato a comparar)
	sw $a2, 8($sp) # apilo dato
	li $a3, 0 # a3 (contador)
	sw $a3, 12($sp) #apilo contador
	jal subr
	sw $v0, res($0)
	li $v0, 10
	syscall

subr:
	lw $a0, ($sp) # a0 = &vector
	addi $sp, $sp, 4
	lw $a1, ($sp) # a1 = tam
	addi $sp, $sp, 4
	lw $a2, ($sp) # a2 = dato
	addi $sp, $sp, 4
	lw $a3, ($sp) # a3 = contador
for:
	beq $a1, $0, fin
	lw $t1, ($a0) # t1 = &vector
	bne $t1, $a2, sino
	addi $a3, $a3, 1 #cont++
sino:
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	j for
fin:
	move $v0, $a3
	jr $ra
	
	
	
