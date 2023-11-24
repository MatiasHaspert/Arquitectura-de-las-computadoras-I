# Cuestión 3.9: Modifica el código para obtener, en la siguiente palabra, que los 
# 16 bits más significativos de numero permanezcan tal cual, y que los 16 bits menos 
# significativos queden a uno, excepto el bit cero que debe quedar como estaba

.data

numero: .word 0x3ff41
	.space 4

.text
main: 
	lw $t0,numero($0)
	ori $t1,$t0,0x0fff 
	sw $t1,numero+4($0)
	
# para hacer que los 16 bit mas significativos sigan iguales y que los 16 bit
# menos significativos sean 1. lo primero que hago es cambiar la instruccion de
# andi a ori, porque no puedo lograr hacer todo uno si lo que recibo posee ceros
# y la instruccion es un and. luego de el cambio de la instruccion ingreso cero
# en los 16 bits mas significativos y f en los menos significativos, haciendo
# que la primera parte quede igual y la segunda sean todos unos.