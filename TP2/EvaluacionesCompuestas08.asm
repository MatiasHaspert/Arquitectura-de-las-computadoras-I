.data

dato1: .word 0
dato2: .word -20
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t1,$t1,$0
	and $t0,$t0,$0
	beq $t8,$0,igual
	ori $t0,$0,1

igual: 
	slt $t1,$t9,$t8

fineval: 
	and $t0,$t0,$t1 
	sb $t0,res($0)

#Cuestión 1.21
# en el res se guardo un 0 porque la la comparacion beq dio true y salto a la instruccion slt que dio verdadero y al hacer
# el ultimo and con 0 y 1 da 0.

#Cuestión 1.22
# la comparacion que esta haciendo para que de verdadero es $t8 != 0 and $t9 < $t8