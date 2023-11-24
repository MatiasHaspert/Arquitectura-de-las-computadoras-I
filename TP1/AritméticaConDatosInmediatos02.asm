.data		 #zona de datos
#Máx. Positivo representable 0x7FFFFFFF
numero: .word 2147483647

.text 		#zona de instrucciones
main: 
	lw $t0,numero($0)
 	addi $t1,$t0,1	#addi detecta el desbordamiento
 
# Cuestión 3.3
# la instruccion addi detecta el desbordamiento e interrumpe el programa	