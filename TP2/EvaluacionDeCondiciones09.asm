.data

dato1: .word 10
dato2: .word 20
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
 	lw $t1, dato2($0) # cargar dato2 en t1
 	
 	sgt $t2, $t0, $t1 # poner a 1 $t2 si $t0 > $t1
 	beq $t0, $t1, mayorOigual # salto a mayorOigual si $t0 == $t1

 	bne $t0,$t1,menor # si t0 != t1 salta a fineval
 	
 
 mayorOigual:
 	ori $t2, $0, 1 #$t2 = 1 
	sb $t2,res($0) # almacenar $t2 en res
	li $v0, 10     # fin del programa
	syscall

menor:
	addi $t2, $0, 2	#$t2 = 2 si es menor
	sb $t2,res($0) # almacenar $t2 en res
	li $v0, 10     # fin del programa
	syscall
	