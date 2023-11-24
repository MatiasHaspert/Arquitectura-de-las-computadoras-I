# 10) Diseña un programa ensamblador que, dada la palabra 0x10203040 definida en
#     memoria la reorganice en la misma posición, intercambiando el orden se sus
#     medias palabras. Nota: utiliza la instrucción lh y sh.

.data

palabra: .word 0x10203040

.text
main:
	# cargo las medias palabras
	lh $s0, palabra($0) 
	lh $s1, palabra+2($0)
	
	#intercambio el orden
	sh $s1, palabra($0)
	sh $s0, palabra+2($0)
	
	  