.data

palabra: .word 0x10203040
octeto: .space 2

.text 		#zona de instrucciones
main: 
	lw $s0, palabra($0)
	sb $s0, octeto+1($0)

# cuestion 2.22

# al realizar sb $s0, octeto+1($0) se guarda el byte menos significativo de la
# palabra en la posicion de memoria octeto+1, que significa, que en memoria no
# vemos 0x00000040, sino lo que vemos es 0x00004000, corriendo al byte menos
# significativo a la siguiente posicion a la izquierda.