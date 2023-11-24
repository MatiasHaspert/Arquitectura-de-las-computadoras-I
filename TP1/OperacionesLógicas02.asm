# Cuestión 3.8: 
# Modifica el código para obtener, en la siguiente palabra, que los 
# 16 bits más significativos de numero permanezcan tal cual, y que los 16 bits menos 
# significativos queden a cero, excepto el bit cero que también debe quedar como estaba.

.data

numero: .word 0x3ff41
	.space 4

.text
main: 
	lw $t0,numero($0)
	andi $t1,$t0,0xf00be 
	sw $t1,numero+4($0)

# cuestion 3.8

# modificando el codigo para que solo los 16 bits mas significativos queden
# iguales y los otros 16 bits sean 0, a la intruccion and se le puede poner
# tanto 0x30000 como 0xf00be, ya que lo que hay que lograr es que cada
# comparacion bit a bit sea cero, y para esto se necesita poner 0 para que se
# comparen con unos o solo poner unos cuando ya hay ceros
