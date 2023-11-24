.data

division: .space 4
dato1: .word 5
dato2: .word 20

.text
main: 
	addi $sp,$sp,-4 #apilar dir. ret.
	sw $ra,0($sp)
	lw $a0,dato1($0)
	lw $a1,dato2($0)
	jal subr
	sw $v0,division($0)
	lw $ra,0($sp) #desapilar dir. ret.
	addi $sp,$sp,4
	li $v0, 10
	syscall
comp:
	sgt $t0, $a0, $0
	sgt $t1, $a1, $0
	and $v1, $t0, $t1
	jr $ra
subr:
	addi $sp,$sp,-4 #apilar dir. de subr
	sw $ra, 0($sp) 
	jal comp
	beq $v1, 0,sino
	div $a1, $a0
	mflo $v0
	lw $ra,0($sp) #desapilar dir. subr
	addi $sp,$sp,4
	jr $ra 
sino:
	addi $v0, $0, -1
	lw $ra, 0($sp)
	addi $sp, $sp, 4 #desapilar dir subr
	jr $ra
