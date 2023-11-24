	.data 
palabra: .word 0x10203040
	.text #zona de instrucciones
main:       lh $s0, palabra($0)

# Cuestión 2.11: Modifica el programa anterior para que guarde en el registro $s0
# los dos bytes de mayor peso de palabra. Nota: Utiliza la instrucción lh que permite 
# cargar medias palabras (16 bits) desde memoria a un registro (en los 16 bits de menor 
# peso del mismo).

# al modificar el codigo de esta forma se carga en el registro $s0 el valor 0x3040
# ya que se carga la mitad menos significativa
# lh hace referencia a load half word, que carga la mitad de la palabra