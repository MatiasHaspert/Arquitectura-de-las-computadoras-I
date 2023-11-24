.data
string:  .asciiz "dabalearrozalazorraelabad"
	.align 2
palin:   .byte 0x1

.text
main:    la $t0, string
         move $t1, $t0
l1:      lb $t2, ($t1)
         beqz $t2, el1
         addi $t1, $t1, 1
         j l1 #hasta llegar al final de la string
el1:     addi $t1, $t1, -1
         # t0 point to string
         # t1 point to end of string
l2:      lb $t2, ($t0)
         lb $t3, ($t1)
         bne $t2, $t3, exit
         addi $t0, $t0, 1
         addi $t1, $t1, -1
         beq $t1, $t0, pal
         j l2
pal:     sb $0, palin
exit:
