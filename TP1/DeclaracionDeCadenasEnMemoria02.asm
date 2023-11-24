.data

cadena: .asciiz "abcde"	#defino una cadena
octeto: .byte 0xff

# cuestion 1.12
# la cadena de caracteres se encuentra en la direccion de memoria 0x10010000
# y continua hasta 0x10010005 esto incluye las 5 letras
# y luego en la direccion 0x10010006 se encuentra el 0xff

# cuestion 1.13
# la directiva .asciiz agrega el caracter nulo "\0" al terminar la cadena(ocupa un byte)
# por lo tanto, la cadena se almacena en la direccion de memoria 0x1001000 y continua hasta
# la direccion 0x10010006. (5 letras mas el caracter nulo)
# luego en la direccion 0x10010007 se encuentra el valor 0xff


