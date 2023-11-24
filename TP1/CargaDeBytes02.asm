.data
 
octeto: .byte 0x30
siguiente: .byte 0x20

.text #zona de instrucciones
main: lb $s0, octeto($0)
      lbu $s1, octeto($0)

# cuestion 2.14

# al cambiar la instruccion lb por lbu se soluciona el problema, el numero
# ahora se carga de manera perfecta en el registro $s0, ya que lb carga el
# numero con signo y lbu lo carga sin signo, por lo que el numero se carga de
# manera correcta. esto sucede porque el rango de lb es de -128 a 127, y el
# rango de lbu es de 0 a 255, por lo que el numero 243 se encuentra dentro
# del rango de lbu, pero no en el de lb.

# cuestion 2.15

# al cambiar el valor de octeto a 0x30, el valor ahora es igual a 48 en
# decimal, lo que hace que entre en el rango de carga de lb que va de -128 a
# 127, y lo mismo sucede con el rango de lbu que va de 0 a 255. por lo tanto,
# en este caso es lo mismo poner lb como lbu.