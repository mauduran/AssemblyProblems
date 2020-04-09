;4)	Hacer un programa para sumar el contenido de R4 con el contenido de R6 y colocar el resultado en R2

	ORG 0000H
		SJMP MAIN

	ORG 0040H
MAIN:
	MOV A, R4
	ADD A, R6
	MOV R2, A
	
	AQUI: SJMP AQUI 
END
	
