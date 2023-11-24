.data		 #zona de datos
#Máx. Positivo representable 0x7FFFFFFF
numero: .word 2147483647

.text 		#zona de instrucciones
main: 
	lw $t0,numero($0)
 	addiu $t1,$t0,1		# addiu no detecta desbordamiento
	
# Cuestión 3.1
# ocurre un desbordamiento porque sobrepasa los bits