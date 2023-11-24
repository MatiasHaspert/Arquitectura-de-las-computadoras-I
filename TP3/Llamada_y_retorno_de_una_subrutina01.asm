.text

main:
	li $a0,10
	li $a1,20
	add $v1,$a0,$a1
	jr $ra

# cuestion 2.5

# el contenido del registro $ra antes y despues de la instruccion jal main es
# cero. el contenido de pc es 0x00400000 cuando comienza la ejecucion, y despues
# de jal main es 0x00400004 cuando se ejecuta la instruccion li $a0, 10, luego
# es 0x00400008 cuando se ejecuta la instruccion li $a1, 20, luego es 0x0040000c
# cuando se ejecuta la instruccion add $v1, $a0, $a1, luego es 0x00000000 cuando
# se ejecuta la instruccion jr $ra

# cuestion 2.6

# el contenido de $ra antes y despues de la instruccion jr $ra es cero, encambio
# pc cambia como se explico anteriormente.
