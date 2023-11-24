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

# cuestion 2.18

# registro                          |    $s0    |    $s1    |    $s2    |    $fp    |    $sp    |    $ra    |    PC    |
# inicio                            |0x00000000 |0x00000000 |0x00000000 |0x00000000 |0x7ffffffc |0x00000000 |0x00400000|
# addi $sp, $sp, -8                 |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffeff8 |0x00000000 |0x00400014|
# jal subr                          |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffeff0 |0x00000000 |0x00400038|
# addi $sp, $sp, -16                |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffeff0 |0x0040003c |0x00400058|
# sw $fp, 12($sp)                   |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffefe0 |0x0040003c |0x0040005c|
# addi $fp, $sp, 12                 |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffefe0 |0x0040003c |0x00400060|
# sw $s2, -12($fp)                  |0x00000001 |0x00000002 |0x00000003 |0x7fffefec |0x7fffefe0 |0x0040003c |0x0040006c|
# lw $s0, 4($fp)                    |0x00000001 |0x00000002 |0x00000003 |0x7fffefec |0x7fffefe0 |0x0040003c |0x00400070|
# lw $s1, 8($fp)                    |0x10010004 |0x00000002 |0x00000003 |0x7fffefec |0x7fffefe0 |0x0040003c |0x00400074|
# bucle                             |0x10010004 |0x00000004 |0x00000003 |0x7fffefec |0x7fffefe0 |0x0040003c |0x00400078|
# addi $sp, $fp, 0                  |0x00000001 |0x00000002 |0x00000003 |0x7fffefec |0x7fffefe0 |0x0040003c |0x004000a4|
# lw #fp, 0($sp)                    |0x00000001 |0x00000002 |0x00000003 |0x7fffefec |0x7fffefec |0x0040003c |0x004000a8|
# addi $sp, $sp, 4                  |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffefec |0x0040003c |0x004000ac|
# jr $ra                            |0x00000001 |0x00000002 |0x00000003 |0x00000004 |0x7fffeff0 |0x0040003c |0x004000b0|
