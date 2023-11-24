.data

octeto: .word 0x10203040
siguiente: .byte 0x20

.text		 #zona de instrucciones
main: 
	lb $s0, octeto($0)
	lbu $s1, octeto($0)
	
# cuestion 2.16
# al cambiar el valor de octeto de un byte a un word, y almacenar 0x10203040
# en vez de 0x30. lo que termina sucediendo que tanto la instruccion lbu y lu
# solo cargan el byte menos significativo de la direccion de memoria, por lo
# que el valor de $s0 y $s1 es 0x40. esto sucede porque byte esta compuesto
# por 8 bits mientras que octeto es un word que son 32 bits, por lo tanto
# cuando se realiza la carga al registro solo se carga el byte menos significativo.


