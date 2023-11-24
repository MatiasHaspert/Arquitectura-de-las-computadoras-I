# 1) Diseña un programa en ensamblador que defina un vector de booleanos, V. 
# Este se implementa a partir de un vector de bytes donde cada byte sólo puede 
# tomar dos valores, 0 ó 1, para el valor cierto o falso, respectivamente. V se 
# inicializará con los siguientes valores V=[0,1,1,1,0]. El programa obtendrá otro 
# vector de booleanos, res, de tres elementos tal que 
# res[1]= (V[1] and V[5]), 
# res[2]=(V[2] or V[4]) ,
# res[3]=((V[1] or V[2]) and V[3]).

.data

vector: .byte 0, 1, 1, 1, 0
res: .space 3

.text
main:
	#primera comparacion
	lb $t0, vector($0)
	lb $t1, vector+4($0)
	and $t4, $t0, $t1
	sb $t4, res($0)
	
	#segunda comparacion
	lb $t0, vector+1($0)
	lb $t1, vector+3($0)
	or $t5, $t0, $t1
	sb $t5, res+1($0)
	
	#tercera comparacion
	lb $t0, vector($0)
	lb $t1, vector+1($0)
	lb $t2, vector+2($0)
	or $t0, $t0, $t1
	and $t6, $t0, $t2
	sb $t6, res+2($0)