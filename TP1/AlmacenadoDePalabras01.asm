.data 

palabra1: .word 0x10203040
palabra2: .word 0x00003400
palabra3: .word 0xffffffff

.text	 #zona de instrucciones
main: 
	lw $s0, palabra1($0)
	sw $s0, palabra2($0)
	sw $s0, palabra3($0)
	
# cuestion 2.18
# comienza la zona de datos, en la direccion 0x10010000 se almacena palabra1, en la direccion 0x10010004 se almacena palabra2
# y en la direccion 0x10010008 se almacena palabra3, entonces con la instruccion lw cargamos en el registro $s0 el valor que se encuentra
# en la direccion al que apunta $0 que es la direccion 0x10010000, luego almacenamos en la direccion de palabra2 el valor
# que se encuentra en la direccion que apunta $0 (0x10010000) el valor 0x10203040 y lo mismo para almacenar el valor en la direccion de palabra3
 


