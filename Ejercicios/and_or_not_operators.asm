.data

num1: .word 0xfff0 #1111 1111 1111 0000 0.A = 0  1.A = 1
num2: .word 0x3478
num3: .word 0xfff7 #1111 1111 1111 0111
num4: .word 0x0008 # 0000 0000 0000 1000 mascara
num5: .word 0x1	   # 0000 0000 0000 0001 mascara
.text
.globl main
main:	lw $t1, num5
	#not $t1, $t1
	lw $t2, num2
	or $t0, $t1, $t2  
syscall 
