.text

main: 
	li $t0,10
	li $t1, 13 #inicializar reg. t0,$t1
	addi $sp, $sp, -8 # espacio para dos registros en la pila
	sw $t0, 0($sp) #apilar t0
	sw $t1, 0($sp) #apilar t1