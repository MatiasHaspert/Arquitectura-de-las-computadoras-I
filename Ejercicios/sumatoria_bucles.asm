.data
num:	.word 10
.text
.globl main
main:	lw $t0 num
	move $t1, $t0 #copia
lcount:	addi $t0, $t0, -1
	beq $t0, $0, lend
	add $t1, $t1, $t0 # t1 = t1 + 10
	j lcount
lend:	li $v0 10 # 10 is exit from C
	syscall