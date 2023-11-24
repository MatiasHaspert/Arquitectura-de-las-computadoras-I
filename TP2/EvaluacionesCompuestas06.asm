.data

dato1: .word 30
dato2: .word -50
res: .space 1

.text
main: 
	lw $t8,dato1($0)
	lw $t9,dato2($0)
	and $t1,$t1,$0
	and $t0,$t0,$0
	beq $t8,$0,igual
	ori $t0,$0,1

igual: 
	slt $t1,$t9,$t8

fineval: 
	and $t0,$t0,$t1 
	sb $t0,res($0)

# cuestion 1.19

# el valor que es almacenado en res es 1. porque la instruccion beq que compra
# $t8 con $t0 es falsa, por ende sigue a la siguiente linea que convierte a $t0
# en 1. despues almacena 1 en $t1 ya que la instruccion slt es verdadera, $t9
# es menor a $t8. luego se hace un and entre $t0 y $t1, como $t0 es 1 y $t1 es
# 1, el resultado es 1. por ultimo se almacena 1 en res.