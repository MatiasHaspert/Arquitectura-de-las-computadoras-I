.data

rango1: .word 10
rango2: .word 30
dato: .word 12
res: .space 4

.text
main:
	lw $t0, rango1($0)
	lw $t1, rango2($0)
	lw $t2, dato($0)
	la $t3, res($0) 
	addi $sp, $sp, -4
	sw $t0, 0($sp) # apilo rango1
	addi $sp, $sp, -4
	sw $t1, 0($sp) # apilo rango2
	addi $sp, $sp, -4
	sw $t2, 0($sp) # apilo dato
	addi $sp, $sp, -4
	sw $t3, 0($sp) # apilo res por referencia
	jal subr
	li $v0, 10
	syscall

subr:
	lw $a0, ($sp) # a0 = &res
	addi $sp, $sp, 4
	lw $a1, ($sp) # a1 = dato
	addi $sp, $sp, 4
	lw $a2, ($sp) # a2 = rango2
	addi $sp, $sp, 4
	lw $a3, ($sp) # a3 = rango1
	blt $a1,$a3,sino #Si a1<a3 saltar a sino
	bgt $a1,$a2,sino #si a1>t2 saltar a sino
	addi $v0, $0, 1
	j fin
sino:
	addi $v0, $0, 0
fin:
	sw $v0, ($a0) # guardo en *a0(res) = v0
	jr $ra
