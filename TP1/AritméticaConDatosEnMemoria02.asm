.data 

numero1: .word 0x80000000 #max. Negativo represent.
numero2: .word 1
numero3: .word 1

.text
main:
	lw $t0,numero1($0)
	lw $t1,numero2($0)
	sub $t0,$t0,$t1
	lw $t1,numero3($0)
	sub $t0,$t0,$t1
	sw $t0,numero1($0)

# cuestion 3.5
# al sustituir la instruccion subu por sub y restarle 1 al numero mas negativo
# representable en 32 bits en complemento a 2, se obtiene un resultado erroneo
# pero en este caso la instruccion sub detecta el desbordamiento y no lo
# permite. y por esto se llega a un error donde termina el programa.