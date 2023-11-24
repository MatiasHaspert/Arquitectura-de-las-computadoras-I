# 7) Diseña un programa en ensamblador que dado un vector de caracteres,
#    contabilice cuántas veces se repite un determinado carácter en el mismo. El 
#    programa deberá inicializar la cadena en memoria, y ésta deberá finalizar
#    con el carácter nulo. También deberá reservar espacio para la variable
#    resultado.

.data

cadena: .asciiz "hoolaa"
caracter: .ascii "a"
res: .space 4

.text
main:
	la $t0, cadena
	li $t1, 0 # t1 = 0 (contador)
	lb $t2, caracter($0)
for:
	lb $t3, 0($t0) #almaceno cada byte de la cadena en t3
	beq $t3, 0, fin
	bne $t3, $t2, fuera
	addi $t1, $t1, 1
	addi $t0, $t0, 1
	j for
fuera:
	addi $t0, $t0, 1
	j for
fin:
	sw $t1, res($0)
	li $v0,10
	syscall

