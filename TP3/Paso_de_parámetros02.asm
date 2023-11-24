.data

rango1: .word 10
rango2: .word 20
dato: .word 12
res: .space 4

.text
main:
	#pasaje por referencia
	la $a0, rango1
	la $a1, rango2
	la $a2, dato
	la $a3, res
	jal subr
	li $v0, 10
	syscall

subr:
	lw $t0, ($a0) # t0 = *a0
	lw $t1, ($a1) # t1 = *a1
	lw $t2, ($a2) # t2 = *a2
	blt $t2,$t0,sino #Si t2<t0 saltar a sino
	bgt $t2,$t1,sino #si t2>t1 saltar a sino
	addi $v0, $0, 1
	j fin
sino:
	addi $v0, $0, 0
fin:
	sw $v0, ($a3) # guardo en *a3 = v0
	jr $ra