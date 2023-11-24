.data

byte1: .byte 0x10
espacio: .space 4
byte2: .byte 0x20
palabra: .word 10

# cuestion 1.17
# el rango de posiciones de la variable espacio va desde la direccion 0x10010001 hasta 0x10010004

# cuestion 1.18
# los 4 bytes de espacio pueden constituir el espacio para una palabra
# pero en este caso no, porque al tener un byte ocupado por byte1,
# la variable word no puede empezar en la direccion 0x10010001,
# si o si se corre y comienza en la direccion 0x10010004

# cuestion 1.19
# byte1 se inicializo en la direccion 0x10010000
# byte2 se inicializo en la direccion 0x10010005

# cuestion 1.20
# palabra se inicializo en la direccion 0x10010008 porque la direccion de palabra debe estar alineada en posiciones
# de multiplo de 4
