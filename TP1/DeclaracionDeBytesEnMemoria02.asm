.data

palabra1: .byte 0x10, 0x20, 0x30, 0x40	# hexadecimal
palabra2: .word 0x10203040		# hexadecimal

# cuestion 1.9
# los valores almacenados en con la etiqueta palabra1 se ve en
# memoria como: 0x40302010
# mientras que el valor almacenado en con la etiqueta palabra2 se ve en
# memoria como: 0x10203040

# cuestion 1.10
# el simulador utiliza el formato little endian,
# porque esto permite leer con mayor facilidad los datos.
# el simulador utiliza este formato porque si uno guarda un byte,
# el sistema tiene el lugar para poder guardar 3 mas,
# mientras que en otro formato no se podria guardar nada mas

# cuetion 1.11
# los valores que toma las etiquetas palabra1 y palabra2 son:
# 0x10010000 y 0x10010004 respectivamente

