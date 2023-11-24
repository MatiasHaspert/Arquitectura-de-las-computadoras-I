.data

dato1: .word 5
dato2: .word 10
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t0,$t0,$0
	and $t1,$t1,$0
	bgtz $t8, fin
	bgt $t8, $t9, fin
	ori $t0, $0, 1
fin:
 	or $t0, $t0, $t1
 	sb $t0, res($0)
 	li $v0, 10
 	syscall
		
