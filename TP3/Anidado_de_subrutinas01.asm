.data

suma: .space 4
dato1: .word 10
dato2: .word 20

.text
main: 
	addi $sp,$sp,-4 #apilar dir. ret.
	sw $ra,0($sp)
	lw $a0,dato1($0)
	lw $a1,dato2($0)
	jal subr
	sw $v0,suma($0)
	lw $ra,0($sp) #desapilar dir. ret.
	addi $sp,$sp,4
	jr $ra
subr: 
	add $v0,$a0,$a1
	jr $ra

# cuestion 2.8

# antes de la ejecucion de la instruccion jal main, el contenido de $ra es
# 0x00000000 y el de pc es 0x00400000
# despues de la ejecucion de la instruccion jal main, el contenido de $ra es
# 0x00400024 y el de pc cambia de 0x00400000 a 0x00400040 saltando de 4 en 4 y
# vuelve a 0x00400024 y enpieza a saltar de vuelta en 4 en 4 hasta 0x00400038

# cuestion 2.9

# en el tope de la pila se almacena el valor de $ra que en el momento que
# comienza la ejecucion del programa es 0x00000000

# cuestion 2.10

# antes de la ejecucion de la instruccion jal subr, el contenido de $ra es
# 0x00000000 y el de pc es 0x00400000 y varia en 4 en 4 hasta 0x00400020 y
# cambia a 0x0040003c.
# despues de la ejecucion de la instruccion jal subr, el contenido de $ra es
# 0x00400024 y el de pc cambia de 0x00400030 de 4 en 4 hasta 0x00400038 y por
# ultimo cambia a 0x00000000.

# cuestion 2.11

# antes de la ejecucion de la instruccion jr $ra, el contenido de $ra es
# 0x00000000 y cambia a 0x00400024 y el contenido de pc empieza en 0x00400000 y
# cambia de 4 en 4 a 0x00400024.
# despues de la ejecucion de la instruccion jr $ra, el contenido de $ra es
# 0x00400024 y el de pc cambia de 0x00400024 de 4 en 4 hasta 0x00400038 y por
# ultimo cambia a 0x00000000.
