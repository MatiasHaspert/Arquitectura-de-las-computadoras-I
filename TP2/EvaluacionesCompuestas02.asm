.data

dato1: .word 0
dato2: .word 20
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
	
# se cargan dato1 en $t8 y dato2 en $t9, se inicializan los registros $t0 y $t1, se comparan si son iguales %t8 y $t0 verdadero salta
# a la funcion igual, se comparan si son iguales $t9 falso, en $t1 se guarda un 1, en $t0 se guarda un 0 y en res se guarda un 0