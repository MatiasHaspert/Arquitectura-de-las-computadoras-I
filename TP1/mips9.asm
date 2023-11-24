# 9) Diseña un programa ensamblador que, dada la palabra 0x10203040 almacenada en 
#   una posición de memoria, la reorganice en otra posición, invirtiendo el orden de
#   sus bytes.

.data

palabra: .word 0x10203040

.text
main:
	lb $s0, palabra+3($0) # Cargo el ultimo byte de palabra
	sb $s0, palabra+4($0) # Y lo almaceno en el primer byte de la siguiente posicion memoria
	lb $s0, palabra+2($0)
	sb $s0, palabra+5($0)
	lb $s0, palabra+1($0)
	sb $s0, palabra+6($0)
	lb $s0, palabra($0)
	sb $s0, palabra+7($0)
	
