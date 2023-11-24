.data

numero: .word 0x3ff41
	.space 4

.text
main: 
	lw $t0,numero($0)
	andi $t1,$t0,0xfffe # 0xffe en binario es 0...01111111111111110
	sw $t1,numero+4($0)

# el codigo lo que hace primero es cargar el valor de numero en $t0. luego se
# realiza la instruccion andi que hace un and inmediato entre el valor en $t0 y
# 0xfffe. el resultado de esta operacion se guarda en $t1. como realiza el and,
# lo primero recordemos que los dos numeros son convertidos a binario. luego se
# realiza el and bit a bit entre los dos numeros. osea, al final solo dara uno
# si en los dos bits que compara hay un uno, y en el resto de los casos da cero.
# cuando este proceso termina el numero resultante se guarda en $t1. por ultimo
# y para terminar se guarda ese resultado en memoria al lado de la variable
# numero.
