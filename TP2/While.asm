.data

tira1: .asciiz "hola"
tira2: .asciiz "adios"
	.align 2
n: .space 4

.text
main: 
	la $t1,tira1 #carga dir. tira1 en $t0
	la $t2, tira2  
	andi $t0,$t0, 0 #$t0=0 (int n=0, contador de caracteres)
mientras: 
	lb $t3, 0($t1) #almacenar byte en $t3
	lb $t4, 0($t2)
	beq $t3,$0,finmientras #si $t3=0 (encontro el caracter nulo) saltar a
	beq $t4,$0,finmientras 
 	#finmientras
	addi $t0,$t0, 1 #n++
	addi $t1,$t1, 1 #i++
	addi $t2,$t2, 1
	j mientras #saltar a mientras
finmientras: 
	sw $t0,n($0) #almacenar $t2 en n
