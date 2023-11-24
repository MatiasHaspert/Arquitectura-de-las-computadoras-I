.text
main: 
B
#a2 = C
areasq:
	addi $sp, $sp, 4
	sw $ra, 4($sp)
	jal semip
	sub $t0, $v0, $a0 # (S-A)
	sub $t1, $v0, $a1 # (S-B)
	sub $t2, $v0, $a2 # (S-C)
	mult $v0, $t0
	mflo $v0
	mult $v0, $t1
	mflo $v0
	mult $v0, $t2
	
	
# v0 = retorno el semiperimetro
semip:
	add $t0, $a0, $a1
	add $t0, $t0, $a2 
	li $t1, 2
	div $t0, $t1
	mflo $v0
	jr $ra
	