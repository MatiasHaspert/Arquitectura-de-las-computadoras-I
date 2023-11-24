.data

dato1: .word 10
dato2: .word 20
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

# cuestion 1.20

# se guarda en res el valor de 0 porque, cuando se compara si $t9 es menor a
# $t8, esto es falso, por lo que $t1 es 0. luego en el momento que se hace el
# and entre $t0 y $t1, el resultado da 0 ya que los valores a comparar son
# 1 y 0, por lo que el resultado es 0.