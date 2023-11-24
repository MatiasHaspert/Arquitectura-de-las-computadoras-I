.data

dato1: .word 4
dato2: .word 4
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t0,$t0,$0
	and $t1,$t1,$0
	sle $t0, $t8, $t9
	sle $t1, $t8, 0
	or $t0, $t0, $t1
	sb $t0, res($0)
	li $v0, 10
	syscall