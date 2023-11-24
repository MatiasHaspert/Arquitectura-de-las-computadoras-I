.data

rango1: .word 10
rango2: .word 15
dato: .word 12
res: .space 4

.text
main:
	lw $a0, rango1($0)
	lw $a1, rango2($0)
	lw $a2, dato($0)
	jal subr
	sw $v0, res($0)
	li $v0, 10
	syscall

subr:
	blt $a2,$a0,sino #Si a2<a0 saltar a sino
	bgt $a2,$a1,sino #si a2>a1 saltar a sino
	addi $v0, $0, 1
	jr $ra
sino:
	addi $v0, $0, 0
	jr $ra
 
 # cuestion 2.14

# las instrucciones que se nesesitan para que el programa que hacen la llamada para:
# a) la carga de parametros en los registros:
# lw     $a0, rango1($0)    # a0 = rango1
# lw     $a1, rango2($0)    # a1 = rango2
# lw     $a2, dato($0)      # a2 = dato

# b) la llamada a la subrutina:
# jal    subr               # saltar a subr

# c) el almacenamiento del resultado:
# sw     $v0, res($0)       # res = v0

# las instrucciones que se nesesitan para que la subrutina:
# a) la lectura y procesamiento de parametros:
# blt    $a2, $a0, sino     # si a2<a0 saltar a sino
# bgt    $a2, $a1, sino     # si a2>a1 saltar a sino

# b) la carta del resultado en $v0:
# addi   $v0, $0, 1         # v0 = 1
# add    $v0, $0, $0        # v0 = 0

# c) el retorno al programa que ha hecho la llamada:
# jr     $ra                # retornar

