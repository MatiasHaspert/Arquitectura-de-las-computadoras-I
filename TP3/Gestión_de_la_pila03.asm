.text
main: 
	li $t0,10
	li $t1, 13 #inicializar reg. t0,$t1
	addi $sp, $sp, -4 #actualizar el sp
	sw $t0, 0($sp) #apilar t0
	addi $sp, $sp, -4 #actualizar el sp	
	sw $t1, 0($sp) #apilar t1
	
	addi $t0, $0, 0
	addi $t1, $0, 0
	lw $t1, 0($sp) #recupero el contenido en la pila, desapilar t1
	addi $sp, $sp, 4 #libero el espacio
	lw $t0, 0($sp) #desapilar t0
	addi $sp, $sp, 4	