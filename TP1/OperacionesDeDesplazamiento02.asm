.data

numero: .word 0xffffff41

.text
main: 
	lw $t0,numero($0)
	srl $t1,$t0,4

# al sustituir sra por srl, se obtienen resultados distintos porque el valor de
# numero es negativo, por lo que al hacer srl se rellena con 0s a la izquierda,
# mientras que con sra se rellena con 1s a la izquierda. lo que provoca que los
# dos resultados sean distintos.