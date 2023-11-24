# 11) Diseña un programa en ensamblador que inicialice cuatro bytes a partir de la
#     posición 0x10010002 a los siguientes valores 0x10, 0x20, 0x30, 0x40, y reserve
#     espacio para una palabra a partir de la dirección 0x1001010. El programa
#     transferirá los cuatro bytes contenidos a partir de la posición 0x10010002 a la
#     dirección 0x1001010.

.data	0x10010002

valores: .byte 0x10, 0x20, 0x30, 0x40 	# llego hasta la direccion 0x10010006
espacio: .space 4			# aca me paro en la direccion 0x10010010
palabra: .word  		        # espacio reservado para una palabra

.text
main:
	lb $s0, valores($0)
	sb $s0, palabra($0)
	lb $s0, valores+1($0)
	sb $s0, palabra+1($0)
	lb $s0, valores+2($0)
	sb $s0, palabra+2($0)
	lb $s0, valores+3($0)
	sb $s0, palabra+3($0)
	
