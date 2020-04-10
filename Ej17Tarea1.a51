/* 17)	A partir de la localidad 500H de RAM se encuentra una lista de palabras de 16 bits. 
		En el registro R4 se encuentra el número de elementos de la lista. 
		Se requiere implementar un programa que genere el promedio de los elementos de la lista y que guarde 
		dicho promedio en los registros R6 y R7.
*/

	RESULT EQU R3
	RESULTH EQU R2
	ORG 0000H
		SJMP MAIN
	ORG 0040H
MAIN:
	MOV DPTR, #0500H
	MOV A, R4
	MOV B, #02H
	MUL AB
	MOV R4, A
	MOV R5, A
	MOV R0, #0H ; PARTE BAJA
	MOV R1, #0H ;PARTE ALTA
	MOV RESULT, #0H ;RESULTADO
	
SUM:
	MOVX A, @DPTR //LECTURA PARTE ALTA
	MOV B, A
	INC DPTR
	
	MOVX A, @DPTR // LECTURA PARTE BAJA
	ADD A, R0 //SUMA PARTE BAJA (PUEDE GENERAR CARRY)
	MOV R0, A
	
	MOV A, B 
	ADDC A, R1 //SUMA PARTE ALTA (CON POSIBLE CARRY)
	MOV R1, A
	CLR CY
	DJNZ R4, SUM
	
DIVISION:
	INC RESULT
	MOV A, RESULTH
	ADDC A, #00H
	MOV RESULTH, A
	CLR CY
	
	MOV A, R0
	SUBB A, R5
	MOV R0, A
	MOV A, R1
	SUBB A, #00H //SE INCLUYE POSIBLE CARRY DE BIT INFERIOR
	MOV R1, A
 
	CJNE R1, #00H, DIVISION
	MOV A, R0 ;CHECAMOS SI PARTE BAJA ES IGUAL AL DIVISOR SI NO CHECAMOS SI EL NUMERO SE HACE NEGATIVO
	MOV B, R5
	CJNE A, B, CONDITION

FINAL:
	INC RESULT
	ADDC A, #00H
	MOV RESULTH, A
	MOV A, RESULT //SE PONE RESULTADO EN R6
	MOV R6, A
	MOV A, RESULTH
	MOV R7, A
	SJMP $
		
CONDITION:
	JC FINAL
	SJMP DIVISION
END 