/* 16)	Hacer un programa que justifique una fracción binaria de 16 bits que se encuentra en las localidades 1C00H y 1C01H 
		desplazando el número hacia la izquierda hasta que el bit más significativo sea 1. Guardar el resultado
		en las direcciones 1C02H y 1C03H y el número de desplazamientos en la dirección 1C04H. 
		Si el contendido de las direcciones 1C00H y 1C01H es cero, entonces escribir ceros en las direcciones 1C02H, 1C03H y 1C04H. 
		Este proceso se utiliza para convertir un número a notación científica.		
*/

	COUNT EQU R5

	ORG 0000H
		SJMP MAIN
	
	ORG 0040H
MAIN:
	MOV DPTR, #1C00H ;OBTENCION DE LA PARTE ALTA
	MOVX A, @DPTR
	MOV R1, A
	
	INC DPTR
	MOVX A, @DPTR ;OBTENCION DE LA PARTE BAJA
	MOV R0, A
	MOV COUNT, #0H
	
	CJNE R1, #0H, CICLO
	CJNE R0, #0H, CICLO
	
	MOV DPTR, #1C02H
	MOV A, #0H
	MOVX @DPTR, A
	INC DPTR
	MOVX @DPTR, A
	INC DPTR
	MOVX @DPTR, A
	SJMP $
		
CICLO:

	MOV A, R1
	ANL A, #10000000B
	CJNE A, #80H, ROTATE
	MOV A, R1
	MOV DPTR, #1C02H
	MOVX @DPTR, A
	
	INC DPTR
	MOV A, R0
	MOVX @DPTR, A
	
	INC DPTR
	MOV A, COUNT
	MOVX @DPTR, A
	SJMP $
		
ROTATE:
	MOV R7, #0H
	MOV R6, #0H
	MOV A, R0 
	RLC A
	ANL A, #11111110B
	MOV R0, A
	JC MOVETOHIGH
RETURNHIGH:
	MOV A, R1
	RLC A
	ANL A, #11111110B
	JC MOVETOLOW
RETURNLOW:
	ORL A, R7
	MOV R1, A
	
	MOV A, R0
	ORL A, R6
	MOV R0, A
	INC COUNT
	SJMP CICLO
	
	
MOVETOHIGH:
	INC R7
	CLR C
	SJMP RETURNHIGH
	
MOVETOLOW:
	INC R6
	CLR C
	SJMP RETURNLOW

END
	
// 33 01 -> 0011 0011 0000 0001
// 66 02 -> 0110 0110 0000 0010
// CC 04 -> 1100 1100 0000 0100