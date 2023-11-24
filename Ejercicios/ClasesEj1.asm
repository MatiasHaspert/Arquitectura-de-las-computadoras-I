.data

letra: .byte 0x48
msj: .asciiz "Hola mundo\n"
cont: .word 0  # declaro e inicializo un contador

.text
main:
	lw $t0, cont($0)

bucle:
	add $t0, $t0, 1		# cont++
	la $a0, msj($0)
	li $v0, 4
	syscall
	beq $t0, 2, fin
	j bucle

fin:
	li $v0, 10
	syscall