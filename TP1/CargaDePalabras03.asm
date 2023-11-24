	.data 
palabra: .word 0x10203040
	.text #zona de instrucciones
main:       lw $s0, 0x10010001

# cuestion 2.10

# al modificar el codigo y tratar de cargar la direccion de memoria de la
# palabra+1 genero un error porque el procesador no puede cargar una direccion
# de memoria que no sea multiplo de 4 para una palabra
	