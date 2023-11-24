.data

dato1: .word 50
dato2: .word 20
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

# Cuestión 1.7:
# en la posicion de memoria res se almacena un 0 por la comparacion de la instruccion slt(guarda un 0 en $t2 porque $t0 > $t1)
# y bne (salta a fineval porque $t0 != $t1), fineval almacena en res el valor almacenado en $t2 (que es un cero) 