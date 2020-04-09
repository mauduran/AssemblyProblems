/* 13)	Hacer un programa para que encuentre el elemento más pequeño de una lista 
de números de 16 bits sin signo que están en localidades consecutivas de memoria. 
La dirección del primer elemento de la lista se encuentra en las localidades 1900H 
y 1901H, el número de elementos del arreglo está en la localidad 1902H. 
El elemento más pequeño encontrado debe guardarse en la localidad 1903H. 
*/

ORG 0000H
	SJMP MAIN
ORG 0040H
MAIN:
	MOV DPTR, #1900H 
	MOVX A, @DPTR
	MOV R1, A ;Guardar parte alta de la direccion de inicio
	
	INC DPTR
	MOVX A, @DPTR
	MOV R0, A ;Guardar parte baja de la direccion de inicio
	
	INC DPTR 
	MOVX A, @DPTR
	MOV R3, A ;Guardar tamaño de arreglo
	INC R3
	
	MOV DPH, R1
	MOV DPL, R0
	
	MOV R7, #0FFH ;Numero menor guardado en r7 y r6 (r7 parte alta, r6 parte baja)
	MOV R6, #0FFH
LOOP:
	DJNZ R3, COMPARE
	
ENDING:
	MOV DPTR, #1903H
	MOV A, R7
	MOVX @DPTR, A
	
	INC DPTR
	MOV A, R6
	MOVX @DPTR, A
	SJMP $
		
COMPARE:	
	MOVX A, @DPTR
	MOV R1, A ;MUEVE LA PARTE ALTA DEL DATO
	INC DPTR
	
	SUBB A, R7 //rESTA LA PARTE ALTA DEL DATO MENOS LA PARTE ALTA DEL MENOR ACTUAL
	MOV R2, A
	
	MOVX A, @DPTR
	MOV R0, A ;MUEVE LA PARTE BAJA DEL DATO

	INC DPTR
	JB CY, UPDATE
	CJNE R2, #00H, LOOP
	
	MOV A, R0
	SUBB A, R6 //RESTA PARTE BAJA DEL DATO MENOS PARTE ALTA DEL MENOR
	JB CY, UPDATE
	SJMP LOOP
UPDATE:
	MOV A, R1
	MOV R7, A
	MOV A, R0
	MOV R6, A
	CLR CY
	SJMP LOOP
END 
	