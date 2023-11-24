.data

dato1: .word 20
dato2: .word 20
res: .space 1

.text
main: 
	lw $t0,dato1($0) # cargar dato1 en t0
 	lw $t1, dato2($0) # cargar dato2 en t1
 	slt $t2, $t0, $t1 # poner a 1 $t2 si t0 < t1
 	bne $t0,$t1,fineval # si t0 != t1 salta a fineval
 	ori $t2,$0,1 # poner a 1 t2 si t0 = t1
 
 fineval: 
	sb $t2,res($0) # almacenar $t2 en res

# cuestion 1.8

# el valor que se guarda en res es 1. primero la instruccion slt guarda cero en
# $t2 ya que los dos datos son iguales, luego la instruccion bne no salta ya que
# los dos datos son iguales y por ultimo la instruccion ori guarda 1 en $t2 ya
# que $t0 == $t1, lo que hace ori es cargar el valor 1 al hacer un or con 0 y 1
# el resultado es 1. por ultimo se guarda el valor 1 en res.

# cuestion 1.9

# la comparacion que se ha evaluado entre dato1 y dat2 es: si dato1 es menor que
# dato2, si es asi se guarda un 1, si no se guarda un 0.
