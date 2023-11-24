.data
vector: .word 6, 2, 10, 1, 50, 3
lenght: .word 6

.text
main:
      lw $t0, lenght
      sll $t0, $t0, 2       #mul $t0, $t0, 4 # t0 <- t0*4
      la $t1, vector
      add $t0, $t1, $t0
      
lp2:  addi $t0, $t0, -4      
      move $t1, $t0
      
lp1:  addi $t1, $t1, -4
      
      # no swap between t0 and t1 if t3 >= $2
      # t2, t3 temporary
      lw $t2, ($t0)
      lw $t3, ($t1)
      bge $t2, $t3, noswap
      sw $t2, ($t1) #swap
      sw $t3, ($t0)
noswap:      
      la $t2, vector
      beq $t1, $t2, endl1
      j lp1
endl1:
      la $t2, vector+4
      beq $t0, $t2, endl2
      j lp2
endl2:
