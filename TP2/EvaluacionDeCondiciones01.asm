.data

dato1: .word 30
dato2: .word 40
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
	lw $t1,dato2($0) # cargar dato2 en t1
	slt $t2,$t0, $t1 # poner a 1 $t2 si t0<t1
	sb $t2,res($0)	 # almacenar $t2 en res
	
# Cuestión 1.1:
# En la posicion de memoria res se carga el resultado de hacer la comparacion slt (pone el registro $t2 a 1)



