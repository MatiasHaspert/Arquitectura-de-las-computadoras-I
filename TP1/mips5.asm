.data

palabra1:       .ascii  "Esto es un problema"
		.align 2
palabra2:       .byte   0x45, 0x73, 0x74, 0x6f, 0x20, 0x65, 0x73, 0x20, 0x75,
                        0x6e, 0x20, 0x70, 0x72, 0x6f, 0x62, 0x6c, 0x65, 0x6d, 0x61
    		.align 2 
palabra3:       .word   0x45657374, 0x6f206573, 0x20756e20, 0x70726f62, 0x6c656d61

# en este caso tanto byte como word no almacenan caracteres
# por eso en el caso de byte tomo letra por letra y guardo su valor en hexadecimal
# luego lo leo en ascii, en este caso la pagabra se guarda igual que en el caso de .ascii
# en el caso de word, tomo de a 4 caracteres y los guardo en hexadecimal,
# la diferencia aqui es que se guardan en orden inverso