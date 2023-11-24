# 13) Diseña un programa ensamblador que divida los enteros 18,-1215 almacenados 
# a partir de la dirección 0x10000000 entre el número 5 y que a partir de la
# dirección 0x10010000 almacene el cociente de dichas divisiones.

.data 0x10000000

numero1: .word	18
numero2: .word	-1215
divisor: .word 5
.text	
main:
	lw $t0, numero1($0)
	lw $t1, numero2($0)
	lw $t2, divisor($0)
	div $t0, $t2
	mflo $t0
	sw $t0,0x10010000($0)
	div $t1,$t2
	mflo $t1
	sw $t1,0x10010004($0)