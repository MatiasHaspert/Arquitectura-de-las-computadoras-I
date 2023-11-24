.data

palabra: .word 0x10203040
octeto: .space 2

.text 		#zona de instrucciones
main: 
	lw $s0, palabra+3($0)
	sb $s0, octeto+1($0)
	
# al querer cargar el valor de palabra+3 en $s0, se produce un error, esto
# sucede porque estamos tratando a acceder a otra parte de la memoria para
# querer cargar una palabra, ademas estamos usando una direccion de memoria
# que no es multiplo de 4, algo que hace que no se lean palabras por completo.