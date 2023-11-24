.data

n1: .word 4
vec1: .word 1,0,0,2
nul1: .space 4
.text

# primero se inicializan los registros s0,s1,s2 y fp
main: 
	li $s0,1 #iniciliza $s0
	li $s1,2 #iniciliza $s1
	li $s2,3 #iniciliza $s2
	li $fp,4 #iniciliza $fp
	addi $sp,$sp,-4
	sw $ra,0($sp) #apilar $ra (direccion de retorno de la etiqueta main
	addi $sp, $sp,-8 
	lw $t0, n1($0) # t0 = 4 (tamaño del vector) y se guarda en la pila
	sw $t0,4($sp)
	la $t0, vec1  #t0 = &vec
	sw $t0, 0($sp) # y se apila
	jal subr #llamada a la subrutina
ret: 
	addi $sp,$sp,8 
	sw $v0,nul1($0) 
	lw $ra,0($sp)
	addi $sp,$sp,4
	li $v0, 10
	syscall
subr: 
	addi $sp,$sp,-16
	sw $fp, 12($sp) #apila $fp = 4
	addi $fp,$sp,12 
	sw $s0,-4($fp) #apila s0 mediante $fp
	sw $s1,-8($fp) 
	sw $s2,-12($fp)
	lw $s0,4($fp) 
	lw $s1,8($fp)
	and $v0, $v0,$0
#bucle de cuenta de elementos nulos 
bucle: 
	beq $s1,$0,finb # si s1 = 0 saltar a finb 
	lw $s2, 0($s0) # cargar s2=Mem(s0)
	bne $s2, $0, finsi #si s3<>0 saltar a finsi
	addi $v0,$v0,1 #v0=s2
finsi: 
	addi $s0, $s0,4 # s0 = s0+4
	addi $s1, $s1,-1 # s1=s1-1, indice i
	j bucle #saltar a bucle
finb: 
	lw $s0,-4($fp)
	lw $s1,-8($fp)
	lw $s2,-12($fp)
	addi $sp,$fp,0
	lw $fp,0($sp)
	addi $sp,$sp,4
	jr $ra

# cuestion 2.17

# la instrucciones que realizan las siguientes acciones en el programa que hacen
# la llamada a la subrutina subr y en la subrutina:
# en el programa que hace la llamada:
# a) carga de parametros en la pila:
#   lw    $t0, n1($0)
#   sw    $t0, 4($sp)
#   la    $t0, vec1
#   sw    $t0, 0($sp)

# b) llamada a la subrutina:
#  jal   subr

# c) limpieza de la pila de los parametros pasados a traves de ella:
#   addi  $sp, $sp, 8

# d) almacenamiento del resultado:
#   sw    $v0, nul1($0)

# en la subrutina:
# a) acutializacion del bloque de activacion de la subrutina:
#   addi  $sp, $sp, -16
#   sw    $fp, 12($sp)
#   addi  $fp, $sp, 12
#   sw    $s0, -4($fp)
#   sw    $s1, -8($fp)
#   sw    $s2, -12($fp)

# b) lectura de los parametros de la pila y procesamiento de los mismos:
#   lw    $s0, 4($fp)
#   lw    $s1, 8($fp)

# c) carga del resultado en $v0
#   and   $v0, $v0, $0

# d) desapilar bloque de activacion los registros apilados y eliminar las
# variables locales. actualizar el puntero de pila:
#   lw    $s0, -4($fp)
#   lw    $s1, -8($fp)
#   lw    $s2, -12($fp)
#   addi  $sp, $fp, 0
#   lw    $fp, 0($sp)
#   addi  $sp, $sp, 4

# e) retorno al programa que ha hecho la llamada:
#   jr    $ra
