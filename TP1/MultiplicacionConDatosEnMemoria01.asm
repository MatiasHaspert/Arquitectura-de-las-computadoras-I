.data

numero1: .word 0x7FFFFFFF #Máx. Positivo represent.
numero2: .word 16
	.space 8

.text
main: 
	lw $t0,numero1($0)
	lw $t1,numero2($0)
	mult $t0,$t1 # multiplica los dos números
	mfhi $t0
	mflo $t1
	sw $t0,numero2+4($0) #32 bits más peso
	sw $t1,numero2+8($0) #32 bits menos peso

#Cuestion 3.6
# despues de realizar la multiplicacion entre el numero mas grande positivo que
# se puede representar en 32 bits y 16 decimal o 0x10 hexadecimal, el resultado
# pasa a ser mas grande y lo almacena en dos partes, hi y lo. tanto hi como lo
# son valores de 32 bits, haciendo que el producto se pueda almacenar en 64 bits
# si supera el tamaño de 32 bits. por eso en el proceso de guardar el valor en
# memoria, se guarda tanto la parte de mayor peso que es hi primero y luego la
# parte de menor peso que es lo.
