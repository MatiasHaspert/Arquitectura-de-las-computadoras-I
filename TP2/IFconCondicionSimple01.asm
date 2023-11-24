.data

dato1: .word 40
dato2: .word 30
res: .space 4

.text
main: 
	lw $t0,dato1($0) #cargar dato1 en $t0
	lw $t1,dato2($0) #cargar dato2 en $t1
	and $t2,$t2,$0 #t2=0
Si: 
	beq $t1,$0,finsi #si $t1 = 0 finsi
entonces: 
	div $t0,$t1 #t0/$t1
	mflo $t2 #almacenar LO en $t2
finsi: 
	add $t3,$t0,$t1 #$t3=$t0+$t1
	add $t2,$t3,$t2 #$t2=$t3+$t2
	sw $t2,res($0) #almacenar en res $t2

# Cuestión 2.1:
# la instruccion que evalua la condicion es beq ($t1 != 0) para evitar una division por 0

# Cuestión 2.2:
# las instrucciones son:
# beq (si $t1 != 0)
# entonces se realiaza una division (div), se almacena el resultado en $t2
# si $t1 = 0 salta a la suma

# Cuestión 2.3:
# en res se almacena el resultado de 40($t0) + 30($t1) = $t3 + 1 (el resultado de la division almacenada en $t2)
