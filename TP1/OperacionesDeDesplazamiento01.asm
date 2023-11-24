.data

numero: .word 0xffffff41

.text
main: 
	lw $t0,numero($0)
	sra $t1,$t0,4
	
# Cuestión 3.10:
# Completa a numero con bits de signo asi sigue siendo negativo
# se llena el numero con bit de signo porque se hace un shift aritmetico a la
# derecha lo que hace que se rellene con el bit de signo a diferencia de un
# shift logico que se rellena con 0, este shift aritmetico funciona como una
# division por 2 elevado a la cantidad de bits que se hace el shift.

# cuestion 3.14

# la operacion sra se puede entender como estar dividiendo por 2^4 el numero,
# la division es entera por lo que se trunca el resultado