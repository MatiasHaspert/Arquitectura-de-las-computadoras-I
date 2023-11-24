.data 
	palabra: .word 0x10203040
	
.text 		#zona de instrucciones
	main: lw $s0, palabra($0)

# cuestion 2.5
# cuando se carga el programa, en la memoria de datos se guarda la
# palabra 0x10203040, en la direccion de memoria 0x10010000.
# luego se ejecuta la instruccion lw y
# se carga en el registro $s0 el valor 0x10203040

# cuestion 2.6
# lo que hace el simulador es cargar en el registro $s0 el valor que este en la
# memoria, como hace esto?. primero se fija en el registro $0 que tiene el
# valor 0, luego se fija en la palabra que esta en la memoria de datos, en la
# direccion 0x10010000, y como el registro $0 tiene el valor 0, entonces se
# carga en el registro $s0 el valor que esta en la direccion 0x10010000, que
# es 0x10203040. ademas usa tres instrucciones para poder hacer el proceso,
# que son las siguientes: lui, addu y lw. con lui carga en el registro $at el
# valor 0x1001, luego con addu carga en el registro $at el valor 0x10010000,
# y por ultimo con lw carga en el registro $s0 el valor que esta en la
# direccion 0x10010000, que es 0x10203040.

# cuestion 2.7

# la instruccion lui $1,0x00001001 carga en el registro $1 el valor 0x00001001.
# la instruccion addu $1,$1,$0 carga en el registro $1 el valor 0x00001001.
# la instruccion lw $16,0x00000000($1) carga en el registro $16 el valor 0x10203040.
