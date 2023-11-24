# 14) Pon a cero los bits 3,7,9 del entero 0xabcd12bd almacenado en memoria a 
# partir de la dirección 0x10000000, sin modificar el resto

.data 0x10000000

numero: .word 0xabcd12bd

.text
main:
	lw $t0, numero($0)
	andi $t1, $t0, 0xfffffffb
	sw $t1, numero+4($0)
