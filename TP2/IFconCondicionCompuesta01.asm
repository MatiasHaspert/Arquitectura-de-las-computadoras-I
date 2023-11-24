.data

dato1: .word 0
dato2: .word 30
res: .space 4

.text
main:
	lw $t0,dato1($0) #cargar dato1 en t0
	lw $t1,dato2($0) #cargar dato2 en $t1
	and $t2,$t2,$0 #pone a 0 $t2
Si: 
	beq $t1,$0,finsi #si $t1=0 saltar finsi
	beq $t0,$0,finsi #si $t0 =0 saltar finsi

entonces: 
	div $t0,$t1 #t0/$t1
	mflo $t2 #almacenar LO en t2
finsi: 
	add $t3,$t0,$t1 #t3=t0+$t1
	add $t2,$t3,$t2 #$t2=t3+$t2
	sw $t2,res($0) #almacenar en res $t2
	
# Cuestión 2.7:
# si ($tt1 != 0 && $t0 != 0) realiza la division
# si no pasa a la linea 20 y se realizan las sumas

# Cuestión 2.8 y Cuestión 2.9:
# en res se almacena el resultado de la division $t0/$t1 = 71, si dato1 = 0, el resultado de res seria 30, porque no se ejecutaria la parte
# de la division y la suma de res = dato2 + dato1 + res = 30. res = 30 + 0 + 0 = 30.
# si dato2 = 0, el resultado de res seria 40, porque no se ejecutaria la parte
# de la division y la suma de res = dato2 + dato1 + res = 40.res = 40 + 0 + 0 = 40.
