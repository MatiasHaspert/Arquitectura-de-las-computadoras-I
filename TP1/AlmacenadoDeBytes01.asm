.data

palabra: .word 0x10203040
octeto: .space 2

.text 		#zona de instrucciones
main: 
	lw $s0, palabra($0)
	sb $s0, octeto($0)
	
# cuestion 2.20 y 2.21
# se almacena en memoria palabra y octeto, en $s0 se carga el valor de la direccion de palabra
# y en la direccion que se encuentra octeto se almacena el byte menos significativo al que apunta $0 (la direccion de palabra)
# 0x00000040
	
	