.data

dato1: .word 0
dato2: .word 30
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
        and $t0, $0, $0
        beq $t8, $t9, fin
        beq $t8, $0, fin
        addi $t0, $t0, 1

fin:
        sb   $t0, res($0)
        li   $v0, 10
        syscall
	