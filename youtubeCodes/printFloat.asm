.data

flotante: .float 20.5

.text
	li $v0, 2
	lwc1 $f12, flotante
	syscall