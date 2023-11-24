.data

dato: .byte 3	 #inicializo una posición de memoria a 3 
      .text
      .globl main	 #debe ser global
main: lw $t0,dato($0)

# 1) indica las etiquetas, directivas y comentarios en el mismo

# las etiquetas siempre deben ir seguidas de : (dos puntos)
# las etiquetas son dato y main

# las directivas siempre deben ir precedidas de . (punto)
# las directivas son .data, .byte, .text, .globl

# los comentarios siempre deben ir precedidos de # (numeral)
# los comentarios son: # inicializo una posicion de memoria a 3
#                      # debe ser global
