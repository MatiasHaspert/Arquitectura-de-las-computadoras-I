# 16) Multiplica el número 0x1237, almacenado en memoria a partir de la dirección
# 0x10000000, por 32 (2 a la 5) sin utilizar las instrucciones de multiplicación ni las
# pseudoinstrucciones de multiplicación.

.data 0x10000000

entero:.word	0x1237

.text
main:
	lw   $t0, entero($0)
        sll  $t0, $t0, 5
        sw   $t0, entero+4($0)