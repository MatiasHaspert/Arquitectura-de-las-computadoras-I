# 3) Diseña un programa ensamblador que realiza la siguiente reserva de espacio en
#    memoria a partir de la dirección 0x10001000: una palabra, un byte y otra palabra 
#    alineada en una dirección múltiplo de 4.

.data 0x10001000

palabra1: .word 0x10
numero:  .byte 0x20
	 .align 2
palabra2: .word 0x30
