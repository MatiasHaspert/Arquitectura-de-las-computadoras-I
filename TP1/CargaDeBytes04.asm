.data

octeto: .word 0x10203040
siguiente: .byte 0x20

.text		 #zona de instrucciones
main: 
	lb $s0, octeto+1($0)
	
# cuestion 2.17
# el valor que se almacena en el registro $s0 es 0x30 porque se desplaza un byte a la izquierda
# que es la direccion 0x10010001( segundo byte de word) donde se encuentra el 0x30
# en este caso no se produce un error de direccionamiento porque se esta
# apuntando al segundo byte de un word, y no al primero. si esto se hiciera
# en siguiente si produciria un error de direccionamiento.
