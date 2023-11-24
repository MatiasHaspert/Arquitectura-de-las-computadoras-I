# 5) Diseña un programa en ensamblador que dado un vector de enteros,
#    obtenga como resultado cuántos elementos son iguales a cero. Este
#    resultado se debe almacenar sobre la variable “total”. El programa deberá 
#    inicializar los elementos del vector en memoria, así como una variable que 
#    almacenará el número de elementos que tiene el vector y reservará espacio 
#    para la variable resultado.

.data 

vector: .word 1, 0, 1, 0, 1, 0, 1, 0, 1, 0
tam: .word 10
total: .space 4

.text
main:
	li $t0, 0 # $t0 = 0 (indice)
	la $t1, vector # t1 = &vector
	lw $t2, tam($0) # $t2 = 5 (tamaño del vector)
	li $t4, 0	# contador = 0
for:
	lw $t5, 0($t1) # cargo los elementos del vector en $t5
	beq $t0, $t2, fin
	bne $t5, 0, nosuma
	addi $t4, $t4, 1 #contador++
	addi $t0, $t0, 1 #indice++
	addi $t1, $t1, 4
	j for
nosuma:
	addi $t0, $t0, 1 # indice++
	addi $t1, $t1, 4 # vector++
	j for 
fin:
	sw $t4, total($0)
	li $v0, 10
	syscall

	
	
	


