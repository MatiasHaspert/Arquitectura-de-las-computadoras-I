.data

dato1: .word 10
dato2: .word 20
res: .space 1

.text
main:
	lw $t8, dato1($0)
	lw $t9, dato2($0)
	and $t0, $0, 0
	and $t1, $0, 0
	beq $t8, $t9, igual
	addi $t0, $0, 1
igual:
	sle $t1, $t8, $t9
	and $t0, $t0, $t1
	sb $t0, res($0)