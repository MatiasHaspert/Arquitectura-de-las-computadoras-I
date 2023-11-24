		.macro read_int
		li $v0,5
		syscall
		.end_macro

		.macro print_label (%label)
		la $a0, %label
		li $v0, 4
		syscall
		.end_macro

		.macro done
		li $v0,10
		syscall
		.end_macro	

		.macro print_error (%errno)
		print_label(error)
		li $a0, %errno
		li $v0, 1
		syscall
		print_label(return)
		.end_macro
		
		.data
slist:	.word 0 # puntero que lo utilizan smalloc y sfree
cclist: .word 0 # puntero a la lista circular de categorias
wclist: .word 0 # puntero a la categoria seleccionada en curso
schedv: .space 32
menu:	.ascii "\nColecciones de objetos categorizados\n"
		.ascii "====================================\n"
		.ascii "1-Nueva categoria\n"
		.ascii "2-Siguiente categoria\n"
		.ascii "3-Categoria anterior\n"
		.ascii "4-Listar categorias\n"
		.ascii "5-Borrar categoria actual\n"
		.ascii "6-Anexar objeto a la categoria actual\n"
		.ascii "7-Listar objetos de la categoria\n"
		.ascii "8-Borrar objeto de la categoria\n"
		.ascii "0-Salir\n"
		.asciiz "Ingrese la opcion deseada: "
error:	.asciiz "Error: "
return:	.asciiz "\n"
catName:.asciiz "\nIngrese el nombre de una categoria: "
selCat:	.asciiz "\nSe ha seleccionado la categoria:"
idObj:	.asciiz "\nIngrese el ID del objeto a eliminar: "
objName:.asciiz "\nIngrese el nombre de un objeto: "
success:.asciiz "La operación se realizo con exito\n\n"
symbol: .asciiz "\n> "
notFound: .asciiz "\nnotFound\n"

		.text
main:
	# initialization scheduler vector
	la $t0, schedv
	la $t1, newcaterogy
	sw $t1, 0($t0)
	la $t1, nextcategory
	sw $t1, 4($t0)
	la $t1, prevcaterogy
	sw $t1, 8($t0)
	la $t1, listcategories
	sw $t1, 12($t0)
	la $t1, delcaterogy
	sw $t1, 16($t0)
	la $t1, newobject
	sw $t1, 20($t0)
	la $t1, listobjects
	sw $t1, 24($t0)
	la $t1, delobject
	sw $t1, 28($t0)
main_loop:
	# show menu
	jal menu_display
	beqz $v0, main_end
	addi $v0, $v0, -1		# dec menu option
	sll $v0, $v0, 2         # multiply menu option by 4
	la $t0, schedv
	add $t0, $t0, $v0
	lw $t1, ($t0)
    	la $ra, main_ret 		# save return address
    	jr $t1					# call menu subrutine
main_ret:
    j main_loop		
main_end:
	done

menu_display:
	print_label(menu)
	read_int
	# test if invalid option go to L1
	bgt $v0, 8, menu_display_L1
	bltz $v0, menu_display_L1
	# else return
	jr $ra
	# print error 101 and try again
menu_display_L1:
	print_error(101)
	j menu_display
	

newcaterogy:
	addiu $sp, $sp, -4
	sw $ra, 4($sp)
	la $a0, catName		# input category name
	jal getblock
	move $a2, $v0		# $a2 = *char to category name
	la $a0, cclist		# $a0 = list
	li $a1, 0		# $a1 = NULL
	jal addnode
	lw $t0, wclist
	bnez $t0, newcategory_end
	sw $v0, wclist		# update working list if was NULL
newcategory_end:
	li $v0, 0		# return success
	lw $ra, 4($sp)
	addiu $sp, $sp, 4
	jr $ra

nextcategory:
	lw $t0, cclist 
	beqz $t0, menu_display_L2 # si cclist apunta a 0, no hay categorias
	lw $t1, ($t0)
#cclist apunta al primer nodo, si el puntero anterior tiene la misma direccion quiere decir que se apunta a si mismo y hay un unico nodo
	beq $t0, $t1, menu_display_L3
	lw $t0, wclist
	lw $t1, 12($t0) #al sumar 12 bytes a la direccion del nodo tenemos el cuarto campo que apunta al siguiente nodo
	sw $t1, wclist  # wclist ahora apunta a la categoria siguiente
	j selected_category
	
prevcaterogy:
	lw $t0, cclist 
	beqz $t0, menu_display_L2
	lw $t1, ($t0) 
	beq $t0, $t1, menu_display_L3
	lw $t0, wclist
	lw $t1, ($t0)
	sw $t1, wclist # wclist ahora apunta a la categoria anterior
	j selected_category
	
selected_category:
	print_label(selCat)
	lw $t0, wclist
	lw $t1, 8($t0) #al sumar 8 bytes a la direccion del nodo tenemos la direccion del tercer campo 
		       #que apunta al bloque de datos donde se almacena el nombre de la categoria
	la $a0, ($t1)
	li $v0, 4
	syscall	#imprimo la categoria seleccionada
	j end_selected_category
	
menu_display_L2:
	print_error(201)
	j end_selected_category
menu_display_L3:
	print_error(202)
end_selected_category:
	li $v0, 0	# return success
	jr $ra
	
listcategories:
	lw $t0, wclist  # $t0 puntero auxiliar
	beqz $t0, menu_display_L4
	move $t2, $t0	# $t2 = direccion del primer nodo
print_categories:
	print_label(symbol)
	lw $t1, 8($t0)
	la $a0, ($t1)
	li $v0, 4
	syscall
	lw $t0, 12($t0) # $t0 apunta al siguiente nodo
	beq $t2, $t0, end_listcategories # si $t0 apunta al primer nodo termino de listar las categorias
	j print_categories
menu_display_L4:
	print_error(301)
end_listcategories:
	li $v0, 0			# return success
	jr $ra

delcaterogy:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	lw $t0, wclist
	beqz $t0, menu_display_L5
	lw $t1, 4($t0)
	beq $t1, $0, free_category 	# si la categoria no tiene objetos
free_objects:
	lw $a0, ($t1)	# a0: node address to delete
	beqz $a0, free_category # si no hay mas objetos a eliminar en la categoria voy a eliminar la categoria
	la $a1, ($t1)# a1: list address where node is deleted
	jal delnode
	j free_objects # mientras existan objetos
free_category:
	lw $t0, wclist
	li $t1, 0
	sw $t1, 4($t0) # nulifico el segundo campo
	la $a0, ($t0)	# $a0: node address to delete
	la $a1, cclist  # $a1: list address where node is deleted
	jal delnode
	lw $t0, cclist  # cclist null no hay categoria siguiente
	beqz $t0, nulificar_punteros	# si no hay categorias
	lw $t0, 12($t0) # $t0 = direccion del siguiente nodo
	sw $t0, wclist	# wclist apunta a la siguiente categoria
	j end_delcategory
nulificar_punteros:
	li $t0, 0
	sw $t0, wclist
	sw $t0, cclist
	j end_delcategory
menu_display_L5:
	print_error(401)
end_delcategory:
	lw $ra, 4($sp)
	addi $sp $sp, 4
	print_label(success)
	li $v0, 0	# return success
	jr $ra

	
newobject:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	lw $t0, wclist
	beqz $t0, menu_display_L6 
	la $a0, objName # $a0: input name object  
	jal getblock
	move $a2, $v0	# $a2 = *char to object name
	lw $t0, wclist
	la $a0, 4($t0)  # $a0 = direccion del segundo campo del nodo de la categoria seleccionda
	li $a1, 1	# $a1 = ID default
	jal addobject
	print_label(success)
	lw $t0, wclist
	lw $t0, 4($t0)  # $t0 = direccion del segundo campo del nodo de la categoria seleccionda
	bnez $t0, end_newobject
	sw $v0, ($t0)   # segundo campo apunta al primer nodo de la lista de objetos
	j end_newobject
menu_display_L6:
	print_error(501)
end_newobject: 
	lw $ra, 4($sp)
	addi $sp, $sp, 4
	li $v0, 0	# return success
	jr $ra

# a0 = direccion del segundo campo del nodo de la categoria seleccionda
# a1 = ID default
# a2 = *char to object name
# v0 = node address added
addobject:
	addi $sp, $sp, -8
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	jal smalloc
	sw $a2, 8($v0) #set object name
	lw $a0, 4($sp)
	lw $t0, ($a0)  # first node address
	beqz $t0, addobject_empty_list
addobject_to_end:
	lw $t1, ($t0)  # last node address
	lw $t2, 4($t1) # $t2 = ID del ultimo nodo
	add $a1, $a1, $t2
	sw $a1, 4($v0) # set new ID
	sw $t1, 0($v0)
	sw $t0, 12($v0)
	sw $v0, 12($t1)
	sw $v0, 0($t0)
	j addobject_exit
addobject_empty_list:
	sw $a1, 4($v0) # set id default
	sw $v0, ($a0)
	sw $v0, 0($v0)
	sw $v0, 12($v0)
addobject_exit:
	lw $ra, 8($sp)
	addi $sp $sp, 8
	jr $ra


listobjects:
	lw $t0, wclist
	beqz $t0, menu_display_L7 
	lw $t0, 4($t0)
	beqz $t0, menu_display_L8
	move $t2, $t0
print_objects:
	print_label(symbol)
	lw $t1, 8($t0)
	la $a0, ($t1)
	li $v0, 4
	syscall
	lw $t0, 12($t0)
	beq $t2, $t0, end_listobjects
	j print_objects
menu_display_L7:
	print_error(601)
	j end_listobjects
menu_display_L8:
	print_error(602)
end_listobjects:
	li $v0, 0	# return success	
	jr $ra

delobject:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	lw $t0, wclist
	beqz $t0, menu_display_L9 # si no hay categorias
	lw $t0, 4($t0)
	beqz $t0, menu_display_L9 # si la categoria no tiene objectos
	move $t2, $t0 # $t2 = direccion del primer nodo de la lista de objetos
	print_label(idObj)
	read_int
busqueda_id:
	lw $t1, 4($t0)	# $t1 = id del objecto
	bne $t1, $v0, siguiente_nodo
	move $a0, $t0	# a0: node address to delete
	lw $t3, wclist 
	la $a1, 4($t3) 	# a1: list address where node is deleted
	jal delnode
	print_label(success)
	j end_delobject
siguiente_nodo:
	lw $t0, 12($t0) # $t0 = apunta al siguiente nodo de la lista de objetos
	beq $t2, $t0, id_noencontrado
	j busqueda_id
menu_display_L9:
	print_error(701)
	j end_delobject
id_noencontrado:
	print_label(notFound)
end_delobject:
	lw $ra, 4($sp)
	addi $sp, $sp, 4
	li $v0, 0 #return success
	jr $ra
	
# a0: list address
# a1: NULL if category, node address if object
# v0: node address added
addnode:
	addi $sp, $sp, -8
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	jal smalloc
	sw $a1, 4($v0) # set node content
	sw $a2, 8($v0)
	lw $a0, 4($sp)
	lw $t0, ($a0) # first node address
	beqz $t0, addnode_empty_list
addnode_to_end:
	lw $t1, ($t0) # last node address
 	# update prev and next pointers of new node
	sw $t1, 0($v0)
	sw $t0, 12($v0)
	# update prev and first node to new node
	sw $v0, 12($t1)
	sw $v0, 0($t0)
	j addnode_exit
addnode_empty_list:
	sw $v0, ($a0)
	sw $v0, 0($v0)
	sw $v0, 12($v0)
addnode_exit:
	lw $ra, 8($sp)
	addi $sp, $sp, 8
	jr $ra

# a0: node address to delete
# a1: list address where node is deleted
delnode:
	addi $sp, $sp, -8
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	lw $a0, 8($a0) # get block address
	jal sfree # free block
	lw $a0, 4($sp) # restore argument a0
	lw $t0, 12($a0) # get address to next node of a0 node
	beq $a0, $t0, delnode_point_self
	lw $t1, 0($a0) # get address to prev node
	sw $t1, 0($t0)
	sw $t0, 12($t1)
	lw $t1, 0($a1) # get address to first node again
	bne $a0, $t1, delnode_exit
	sw $t0, ($a1) # list point to next node
	j delnode_exit
delnode_point_self:
	sw $zero, ($a1) # only one node
delnode_exit:
	jal sfree
	lw $ra, 8($sp)
	addi $sp, $sp, 8
	jr $ra

 # a0: msg to ask
 # v0: block address allocated with string
getblock:
	addi $sp, $sp, -4
	sw $ra, 4($sp)
	li $v0, 4
	syscall
	jal smalloc
	move $a0, $v0
	li $a1, 16
	li $v0, 8
	syscall
	move $v0, $a0
	lw $ra, 4($sp)
	addi $sp, $sp, 4
	jr $ra

smalloc:
	lw $t0, slist
	beqz $t0, sbrk
	move $v0, $t0
	lw $t0, 12($t0)
	sw $t0, slist
	jr $ra
sbrk:
	li $a0, 16 # node size fixed 4 words
	li $v0, 9
	syscall # return node address in v0
	jr $ra

sfree:
	lw $t0, slist
	sw $t0, 12($a0)
	sw $a0, slist # $a0 node address in unused list
	jr $ra
