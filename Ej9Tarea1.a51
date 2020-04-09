/*9)	Hacer un programa para determinar la cantidad de ceros, de números positivos (aquellos cuyo bit más significativo es cero) y de
 números negativos (aquellos cuyo bit más significativo es uno) que hay en un bloque de memoria externa. La dirección inicial del bloque 
 está en las localidades 1940H y 1941H, la longitud del bloque está en la localidad 1942H. El número de elementos
 negativos debe colocarse en la localidad 1943H, el número de ceros en la 1944H y el número de elementos positivos en la localidad 1945H. */
	ADDRESS_H   EQU 1940H
	ADDRESS_L   EQU 1941H
	LENGTH EQU 1942H
	POSITIVOS EQU R5
	CEROS EQU R4
	NEGATIVOS EQU R3

	ORG 0000H
		SJMP MAIN
	ORG 0040H
MAIN:	
	MOV DPTR, #LENGTH
	MOVX A, @DPTR 
	MOV R0, A
	INC R0
	
	MOV DPTR, #ADDRESS_L
	MOVX A, @DPTR
	MOV R1, A
	
	MOV DPTR, #ADDRESS_H
	MOVX A, @DPTR
	MOV R2, A
	
	MOV DPH, R2
	MOV DPL, R1

	MOV POSITIVOS, #0H
	MOV NEGATIVOS, #0H
	MOV CEROS, #0H
	
BUCLE:
	DJNZ R0, OPERACIONES
		
	MOV A, NEGATIVOS
	MOV DPTR, #1943
	MOVX @DPTR, A
	
	MOV A, CEROS
	MOV DPTR, #1944
	MOVX @DPTR, A
		
	MOV A, POSITIVOS
	MOV DPTR, #1945
	MOVX @DPTR, A
		
	SJMP $

OPERACIONES:	
		MOVX A, @DPTR
		INC DPTR
			
CHECKZERO:
	JNZ CHECKPOS
	INC CEROS
	SJMP BUCLE
CHECKPOS:
	ANL A, #10000000B
	JNZ CHECKNEG
	INC POSITIVOS
	SJMP BUCLE

CHECKNEG:
	INC NEGATIVOS
	SJMP BUCLE	
				
END
	