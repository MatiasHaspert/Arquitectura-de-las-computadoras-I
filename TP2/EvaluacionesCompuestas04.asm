.data

dato1: .word 0
dato2: .word 0
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

# cuestion 1.16

# el resultado que se guarda en res es 0 porqu, el primer beq se cumple y no se
# le cambia el valor a $t0. despues en igual se cumple el segundo beq y no se le
# cambia el valor a $t1. por ultimo se hace un and entre $t0 y $t1 que son 0 y
# se guarda en res.

# cuestion 1.17

# la comparacion compuesta que se realiza entre los valores de dato1 y dato2 es
# un and entre los valores de dato1 y dato2. si ambos son 1, el resultado es 1.
# sino es 0.