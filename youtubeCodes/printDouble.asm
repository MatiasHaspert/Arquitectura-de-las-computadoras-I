.data

myDouble:   .double 10.505
zeroDouble: .double 0.0

.text
	ldc1 $f0, myDouble
	ldc1 $f2, zeroDouble
	
	li $v0, 3
	add.d $f12, $f0, $f2
	syscall