# 6) Diseña un programa en ensamblador que dado un vector de enteros “V”
#    obtenga cuántos elementos de este vector están dentro del rango
#    determinado por dos variables “rango1” y “rango2”. El programa deberá
#    inicializar los elementos del vector en memoria, una variable que
#    almacenará el número de elementos que tiene ese vector y dos variables
#    donde se almacenarán los rangos. También deberá reservar espacio para la 
#    variable resultante.

.data

V: .word 1, 3, 6, 8, 9
tam: .word 5
rango1: .word 5
rango2: .word 10
res: .space 4

.text
main:
	la $t0, V # t0 = &vector
	li $t1, 0 # t1 = 0 (indice)
	li $t2,0  # t2 = 0 (contador)
	lw $t8, tam($0) # t8 = tam
	lw $t6, rango1($0)
	lw $t7, rango2($0)
for:
	beq $t1, $t8, fin
	lw $t3, 0($t0) # cargo en t3 los elementos del vector
	ble $t3, $t6, fuera
	bge $t3, $t7, fuera
	addi $t2, $t2, 1 # cont++
	addi $t0, $t0, 4 #vector++
	addi $t1, $t1, 1 #indice++
	j for
fuera:
	addi $t0, $t0, 4 #vector++
	addi $t1, $t1, 1 #indice++
	j for
fin:
	sw $t2, res($0)
	li $v0, 10
	syscall
	
	
