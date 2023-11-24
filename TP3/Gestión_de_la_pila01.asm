.text

main: 
	li $t0,10
	li $t1, 13 #inicializar reg. t0,$t1
	addi $sp, $sp, -4 #actualizar el sp
	sw $t0, 0($sp) #apilar t0
	addi $sp, $sp, -4 #actualizar el sp
	sw $t1, 0($sp) #apilar t1
	
	

# t0 se almacena en la direccion 0x7fffeff8 y t1 en la direccion 0x7fffeff4 
