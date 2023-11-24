.data
 
octeto: .byte 0xf3
siguiente: .byte 0x20

.text #zona de instrucciones
main: lb $s0, octeto($0)

# cuestion 2.12

# en la simulacion el valor de octeto se a desbordado
# el simulador lo detecta y me lo advierte aunque el programa
# sigue funcionando sin ningun problema.
# lo que sucede tambien es que el simulador trabaja con
# complemento a 2 y el valor de octeto es 0xf3 pasa a ser -13

# cuestion 2.13

# el programa no se ejecuta correctamente ya que el valor de octeto no es
# correcto por sufrir un desbordamiento, pero el programa lo que hace es tomar
# el numero que queda y seguir con el proceso llevando al espacio de los
# registros un valor erroneo.