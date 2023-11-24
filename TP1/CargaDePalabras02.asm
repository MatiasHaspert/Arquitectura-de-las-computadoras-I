            .data
palabra:    .word        0x10203040
            .text        # zona de instrucciones
main:       lui $1,0x00001001
            addu $1, $1, $0
            lw $16, 0x00000000($1)