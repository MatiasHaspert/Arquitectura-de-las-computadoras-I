.data

dato1: .word 40
dato2: .word 40
res: .space 1

.text
main:
	lw $t0,dato1($0) # cargar dato1 en t0
 	lw $t1, dato2($0) # cargar dato2 en t1
 	
 	sne $t2, $t0, $t1 # poner a 1 $t2 si t0 != t1
 	bne $t0, $t1, distinto # si $t0 != $t1 salta a distinto
 	
 	seq $t2, $t0, $t1 # poner a 1 t2 si t0 = t1
 	beq $t0, $t1, iguales # # si $t0 == $t1 salta a iguales

distinto:
	sb $t2,res($0) # almacenar $t2 en res
	li $v0, 10     # finaliza el programa
	syscall
	 
iguales:
	addi $t2, $t2, 1 # almaceno un 2 en $t2 si los dstos son iguales
	sb $t2,res($0) # almacenar $t2 en res
	li $v0, 10     # finaliza el programa
	syscall
	