.data

dato1: .word 10
dato2: .word 20
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
 	lw $t1, dato2($0) # cargar dato2 en t1
 	bge $t0,$t1,mayor # si t0 >= t1 salta a mayor
 	
 	ori $t2,$0,1 # poner a 1 t2 si t0 < t1
 	sb $t2,res($0) # almacenar $t2 en res
 	li $v0, 10 #fin del programa
 	syscall
 	
 mayor:
 	addi $t2, $t2, 2 # si dato1 >= dato2 almaceno un 2 
	sb $t2,res($0) # almacenar $t2 en res
