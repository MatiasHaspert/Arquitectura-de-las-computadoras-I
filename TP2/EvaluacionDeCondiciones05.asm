.data

dato1: .word 30
dato2: .word 40
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
 	lw $t1, dato2($0) # cargar dato2 en t1
 	slt $t2, $t0, $t1 # poner a 1 $t2 si t0 < t1
 	bne $t0,$t1,fineval # si t0 != t1 salta a fineval
 	ori $t2,$0,1 # poner a 1 t3 si t0 = t1

fineval: 
	sb $t2,res($0) # almacenar $t2 en res

# Cuestión 1.6:
# en la direccion de memoria a la que apunta res se almacena un 1 porque es el resultado de la instruccion slt y por la instruccion
# bne salta a almacenar el resultado

