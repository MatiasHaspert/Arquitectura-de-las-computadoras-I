.data

dato1: .word 50
dato2: .word 20
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
	lw $t1,dato2($0) # cargar dato2 en t1
	slt $t2,$t0, $t1 # poner a 0 $t2 si t0>t1
	sb $t2,res($0)	 # almacenar $t2 en res

# Cuestión 1.2:
# En la posicion de memoria res se carga el resultado de hacer la comparacion slt (pone el registro $t2 a 0 porque
# t0 > t1)

# Cuestion 1.3:
# La comparacion que se realizo entre dato1 y dato2 es si dato1 es menor que dato2, como es mayor devuelve un 1 y lo almacena en $t2