.data

vector: .word 1, 2, 3, 4, 3, 3, 3, 5, 6, 3
tam: .word 10
dato: .word 3
res: .space 4

.text
main:
	la $a0, vector # a0 = &vector
	lw $a1, tam($t0) # a1 = 5(tamaño del vector)
	lw $a2, dato($0) # a2 = (dato a comparar)
	li $a3, 0 # a3 (contador)
	jal subr
	sw $v0, res($0)
	li $v0, 10
	syscall

subr:
	beq $a1, $0, fin
	lw $t1, ($a0) # t1 = &vector
	bne $t1, $a2, sino
	addi $a3, $a3, 1 #cont++
sino:
	addi $a0, $a0, 4
	addi $a1, $a1, -1
	j subr
fin:
	move $v0, $a3
	jr $ra
	
	
	
