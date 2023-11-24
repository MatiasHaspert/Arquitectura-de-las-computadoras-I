.data 

numero1: .word 0x80000000 #max. Negativo represent.
numero2: .word 1
numero3: .word 1

.text
main:
	lw $t0,numero1($0)
	lw $t1,numero2($0)
	subu $t0,$t0,$t1
	lw $t1,numero3($0)
	subu $t0,$t0,$t1
	sw $t0,numero1($0)
	
# Cuestión 3.4:
# en el programa ocurre un desbordamiento al restar el maximo numero negativo a representar con - 1, como la instruccion subu
# ignora el desbordamiento se carga el Máx. Positivo representable 0x7FFFFFFF, y despues sigue corriendo el programa y resta
# el numero cargado en numero3 -1.

