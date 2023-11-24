.data

dato1: .word 20
dato2: .word 0
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t0,$t0,$0
	and $t1,$t1,$0
	beq $t8,$0,igual
	ori $t0,$0,1

igual: 
	beq $t9,$0,fineval
	ori $t1,$0,1

fineval: 
	and $t0,$t0,$t1 
	sb $t0,res($0)

# cuestion 1.15

# el resultado que se guarda en res es cero. porque al cumplirse el beq en igual
# nunca se le cambia el valor de cero a $t1, por lo tanto el and se realiza
# entre cero y uno, dando como resultado cero.
