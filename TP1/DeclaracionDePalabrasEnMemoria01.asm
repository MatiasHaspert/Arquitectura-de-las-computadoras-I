.data  		#comieza zona de datos

palabra1: .word 15	#decimal
palabra2: .word 0x15	#hexadecimal

# cuestion 1.1
# el valor hexadecimal de la palabra1 es 0x0000000f
# el valor hexadecimal de la palabra2 es 0x00000015

# cuestion 1.2
# los datos de la palabra1 se almaceno en la direccion 0x10010000
# los datos de la palabra2 se almaceno en la direccion 0x10010004
# porque es la direccion de memoria por defecto
# empieza en el valor 0x10010000 y va aumentando, en este caso de 4 en 4 porque
# son palabras de 32 bits

# cuestion 1.3
# la etiqueta palabra1 toma el valor 15
# la etiqueta palabra2 toma el valor 21