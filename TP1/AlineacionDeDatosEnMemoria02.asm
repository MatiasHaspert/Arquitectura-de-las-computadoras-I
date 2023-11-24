.data

byte1: .byte 0x10
	.align 2
espacio: .space 4
byte2: .byte 0x20
palabra: .word 10

# cuestion 1.21
# la variable espacio se reservo desde la direccion 0x10010004 hasta 0x10010007

# cuestion 1.22
# estos 4 bytes si podrian constituir los bytes de una palabra, porque lo que hace .align es rediccionar 
# a una siguiente direccion multiplo de 4, en este caso 2 a la 2 = 4 (0x10010004)