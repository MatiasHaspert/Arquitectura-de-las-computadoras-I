.data

dato1: .word 40
dato2: .word 0
res: .space 4

.text
main: 
	lw $t0,dato1($0) #cargar dato1 en $t0
	lw $t1,dato2($0) #cargar dato2 en $t1
	
si:
	blez $t1, finsi  # si dato2 > 0
	#entonces realizo la division
	div $t0, $t1
	mflo $t2

finsi:
	add $t3, $t0,$t1 
	add $t2, $t2, $t3 # res= res+dato1+dato2
	sw $t2, res($0)
	li $v0, 10
	syscall		
	