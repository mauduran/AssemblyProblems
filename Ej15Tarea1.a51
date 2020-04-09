;15)	Hacer un programa para contar el número de bits con valor 1 que hay en un bloque de memoria cuya dirección inicial 
;se encuentra almacenada en las localidades 1A00H y 1A01H y cuya dirección final esta almacenada en las localidades 1A02H y 1A03H. 
;El número total de unos debe guardarse en las localidades 1A04H y 1A05H. 
;Se sugiere  utilizar un lazo para contar los unos dentro de cada localidad del bloque, 
;anidado en otro lazo que se encargue de acumular los unos resultantes de todas las localidades.

ORG 0000H
	SJMP MAIN

ORG 0040H
MAIN:
	MOV DPTR, #01A00H
	MOVX A, @DPTR
	MOV R1, A
	INC	DPTR
	MOVX A, @DPTR
	MOV R0, A
	
	INC DPTR
	MOVX A, @DPTR
	MOV R3, A
	INC DPTR 
	MOVX A, @DPTR
	MOV R2, A
	INC R2
	
	MOV R7, #00H
	MOV R6, #00H
	
CICLO:
	MOV DPH, R1
	MOV DPL, R0
	
	MOV A, R1
	MOV B, R3
	
	CJNE A, B, CHECKREG
	MOV A, R0
	MOV B, R2
	CJNE A, B, CHECKREG
	
	MOV DPTR, #1A03H
	MOV A, R7
	MOVX @DPTR, A
	INC DPTR
	MOV A, R6
	MOVX @DPTR, A
	SJMP $
	
	
CHECKREG:
	MOVX A, @DPTR
	MOV B, A
	MOV 055H, A
	INC DPTR
	MOV A, #01H
	
	MOV R4, #9
CHK:	
	DJNZ R4, COUNTBITS
	SJMP CICLO
	
COUNTBITS:
	ANL B, A
	RL A
	MOV R5, B
	MOV B, 055H
	CJNE R5, #0H, INCREASECOUNT
	SJMP CHK
	
INCREASECOUNT:
	MOV R1, DPH
	MOV R0, DPL
	
	MOV DPH, R7
	MOV DPL, R6
	
	INC DPTR
	
	MOV R7, DPH
	MOV R6, DPL
	
	MOV DPH, R1
	MOV DPL, R0
	
	SJMP CHK
	
	END