.data

dato1: .word 0
dato2: .word -50
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t0,$t0,$0
	and $t1,$t1,$0
	beq $t8,$0,igual
	ori $t0,$0,1

igual: 
	beq $t9,$0,fineval
	ori $t1,$0,1

fineval: 
	and $t0,$t0,$t1 
	sb $t0,res($0)

# cuestion 1.13

# el valor que se carga en la posicion de memoria res es 1. primero cargo en
# $t8 el dato1, y en $t9 el dato2, luego inicializo $t0 y $t1 en cero. pregunto
# si $t8 y $t0 son iguales, al no serlos, $t0 se carga con 1. luego pregunto si
# $t9 y $0 son iguales, al no serlos, $t1 se carga con 1. luego pregunto si $t0
# y $t1 son iguales, al serlos, $t0 se carga con 1. finalmente, se guarda en res
# el valor de $t0, que es 1.
