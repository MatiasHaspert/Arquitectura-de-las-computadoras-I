.data
list:	.word 10, 5, 8, 9, 1, 2
size:	.word 6
.text
.globl main
main:	lw $s0, size
	addi $s0, $s0, -1 #s0 <- 5
sort:	la $a0, list
	lw $t0, ($a0)
	lw $t1, 4($a0)
	addi $a1, $a0, 4
	
	bgt $t0, $t1, swap #t0 > $t1 then swap
	# si no es mayor decrementar la lista
	
	j sort
	
	la $a0, num1
	la $a1, num2
	jal swap
exit:	li $v0 10
	syscall


# void swap (* int, * int)
swap: 	lw $t0, ($a0)
	lw $t1, ($a1)
	sw $t1, ($a0)
	sw $t0, ($a1)
	jr $ra        #return 