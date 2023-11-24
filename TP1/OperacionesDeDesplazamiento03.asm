.data

numero: .word 0xffffff41

.text
main: 
	lw $t0,numero($0)
	sll $t1,$t0,2
	
# cuestion 3.12

# para correr el programa 2 bits a la izquierda la instruccion es
# sll $t1, $t0, 2. hacer un un sll de 2 bits a la izquierda es lo mismo que
# multiplicar por 4.

# cuestion 3.13

# acabamos de multiplicar por 4 a el numero que le aplicamos el corrimiento,
# cada bit que se corre a la izquierda es una multiplicacion por 2, o tambien
# se puede decir que es una multiplicacion por 2^n donde n es la cantidad de
# bits que se corrio a la izquierda.