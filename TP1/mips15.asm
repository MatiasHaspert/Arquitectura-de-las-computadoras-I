# 15) Cambia el valor de los bits 3,7,9 del entero 0xff0f1235 almacenado en
# memoria a partir de la dirección 0x10000000, sin modificar el resto.

.data 0x10000000

numero: .word 0xff0f1235

.text
main:
	lw $t0, numero($0)
	andi $t1, $t0, 0xfffffff1 #cambio el valor del bit 3
	ori $t1, $t1, 0x00000371  #cambio el valor del bit 7 y 9	
	sw $t1, numero+4($0)
