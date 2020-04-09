/*14)	Hacer un programa para que ordene una lista de números binarios de 8 bits con signo en orden ascendente (menor a mayor). 
La longitud de la lista está en la localidad de memoria 1B00H y la lista misma comienza en la localidad de memoria 1B01H.
Los números están en complemento a dos. */


;BUBBLE SORT
ORG 0000H
	SJMP MAIN
	
ORG 0040H
MAIN:
	MOV DPTR, #1B00H
	MOVX A, @DPTR
	INC A
	MOV R0, A
	MOV R4, A
LOOP:
	MOV DPTR, #1B01H
	MOV A, R0
	DEC A
	MOV R3, A
	DJNZ R4, INNERLOOP
	SJMP $

INNERLOOP:
	DJNZ R3, COMPARE
	SJMP LOOP

COMPARE:
	MOVX A, @DPTR
	MOV R1, A ;R1 FIRST NUM
	
	MOV R7, DPH
	MOV R6, DPL
	
	INC DPTR
	MOVX A, @DPTR
	MOV R2, A ;R2 SECOND NUM
	
	MOV B, R1
	ANL B, #10000000B
	ANL A, #10000000B

	CJNE A, B, SIGN
	
	MOV A, R1
	
	SUBB A, R2
	
	JNB CY, SWAPNUMS
	SJMP INNERLOOP
	
SIGN:
	MOV A, B
	CJNE A, #80H, SWAPNUMS
	SJMP INNERLOOP


SWAPNUMS:
	CLR CY
	MOV DPH, R7
	MOV DPL, R6 
	MOV A,R2
	MOVX @DPTR, A
	INC DPTR
	MOV A, R1
	MOVX @DPTR, A
	SJMP INNERLOOP
	
	
	END