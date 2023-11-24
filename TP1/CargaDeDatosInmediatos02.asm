.text 		#zona de instrucciones
main:
	li $s0, 0x12345678

# cuestion 2.3
# cuando se ejecuta el programa se inicializan los registros
# $s0 = 0x12345678 y $at = 0x12340000
# en el primer paso se inicializa $at y luego $s0

# cuestion 2.4
# cuando el programa es ejecutado se realizan dos instrucciones
# las instrucciones son: lui y ori