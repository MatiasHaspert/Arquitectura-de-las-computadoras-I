.data

vector: .word 1, 2, 3, 4, 3, 3, 3, 5, 6, 3
tam: .word 10
dato: .word 3
res: .space 4

.text
main:
	la $a0, vector # a0 = &vector
	la $a1, tam # a1 = &tam
	la $a2, dato # a2 = &(dato a comparar)
	li $v0, 0 # contador
	jal subr
	sw $v0, res($0)
	li $v0, 10
	syscall

subr:
	lw $t0, ($a1) # t0 = *a1
	lw $t2, ($a2) # t2 = *a2
for:
	beq $t0, $0, fin
	lw $t1, ($a0) # t1 = &vector
	bne $t1, $t2, sino
	addi $v0, $v0, 1 #cont++
sino:
	addi $a0, $a0, 4
	addi $t0, $t0, -1
	j for
fin:
	jr $ra
	
	
	
