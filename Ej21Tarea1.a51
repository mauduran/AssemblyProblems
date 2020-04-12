/*
21)	Implementa un programa que haga la suma y multiplicaci�n de dos matrices. Los datos de entrada son:
i)	# de renglones de A -> 1000H de RAM
ii)	# de columnas de A  -> 1001H de RAM
iii)	# de renglones de B -> 1002H de RAM
iv)	# de columnas de B  -> 1003H de RAM

�	A partir de la localidad 2000H de RAM se encuentra la matriz A: a11, a12, .., a1n, a21, a22, .., amn.
�	A partir de la localidad 3000H de RAM se encuentra la matriz B: b11, b12, .., b1n, b21, b22, .., bmn.
Se espera que la suma de matrices se encuentre a partir de la localidad 4000H de RAM y la multiplicaci�n de matrices a partir 
de la localidad 5000H de RAM.
Los datos son de 8 bits con signo.
*/

MAT_A EQU 2000H
MAT_B EQU 3000H

ROWS_A EQU 30H
COLS_A EQU 31H

ROWS_B EQU 32H
COLS_B EQU 33H
	
PA_L EQU 34H
PA_H EQU 35H

PB_L EQU 36H
PB_H EQU 37H
	
PRES_L EQU 38H
PRES_H EQU 39H

N EQU 3AH
		
PATEMP_L EQU 3BH
PATEMP_H EQU 3CH
PBTEMP_L EQU 3DH
PBTEMP_H EQU 3EH
	
SUM_RES EQU 4000H
MULT_RES EQU 5000H
	
ORG 0000H
	SJMP INIT
	
ORG 0040H
INIT:
	MOV DPTR, #1000H
	MOVX A, @DPTR
	MOV ROWS_A, A //LECTURA DE NUM DE RENGLONES MAT A
	INC DPTR
	MOVX A, @DPTR
	MOV COLS_A, A //LECTURA DE NUM DE COLS DE MAT A
	
	INC DPTR
	MOVX A, @DPTR
	MOV ROWS_B, A //LECTURA DE NUM DE RENGLONES MAT B
	INC DPTR
	MOVX A, @DPTR
	MOV COLS_B, A //LECTURA DE NUM DE COLS DE MAT B
	
	MOV PA_L, #00H
	MOV PA_H, #20H
	
	MOV PB_L, #00H
	MOV PB_H, #30H
	
MAIN:
	ACALL SUM
	ACALL MULT
	SJMP $
		
		
SUM:
	PUSH PA_L
	PUSH PA_H
	PUSH PB_L
	PUSH PB_H
	
	MOV A, COLS_B
	CJNE A, COLS_A, ENDSUM //VALIDACION SOBRE COLUMNAS
	MOV A, ROWS_B
	CJNE A, ROWS_A, ENDSUM //VALIDACION SOBRE FILAS
	
	MOV DPTR, #SUM_RES
	MOV PRES_L, DPL
	MOV PRES_H, DPH
	 
	MOV R7, ROWS_A
	
	SUMLOOP:
	MOV R6, COLS_B
	SUMINNERLOOP:
		MOV DPH, PA_H
		MOV DPL, PA_L
		MOVX A, @DPTR
		INC DPTR
		MOV PA_H, DPH
		MOV PA_L, DPL
		MOV R5, A
		
		MOV DPH, PB_H
		MOV DPL, PB_L
		MOVX A, @DPTR
		INC DPTR
		MOV PB_H, DPH
		MOV PB_L, DPL
		
		ADD A, R5
		
		MOV DPH, PRES_H
		MOV DPL, PRES_L
		MOVX @DPTR, A
		INC DPTR
		MOV PRES_H, DPH
		MOV PRES_L, DPL	
	DJNZ R6, SUMINNERLOOP
	DJNZ R7, SUMLOOP
	
	ENDSUM:
	POP PB_H
	POP PB_L
	POP PA_H
	POP PA_L

	RET

MULT: 
	PUSH PA_L
	PUSH PA_H
	PUSH PB_L
	PUSH PB_H
	
	MOV A, ROWS_B
	CJNE A, COLS_A, ENDMULT //VALIDACION DE QUE LA MULTIPLICACION SEA POSIBLE
	MOV DPTR, #MULT_RES
	MOV PRES_L, DPL
	MOV PRES_H, DPH

	MOV R6, COLS_B
	
	MULTLOOP:
	MOV R7, ROWS_A
	INNERMULTLOOP:
	MOV R5, COLS_A
	MOV PATEMP_L, PA_L
	MOV PATEMP_H, PA_H
	MOV PBTEMP_L, PB_L
	MOV PBTEMP_H, PB_H
	MOV R0, #0H
	CALCULATECELL:

	MOV DPH, PATEMP_H
	MOV DPL, PATEMP_L
	MOVX A, @DPTR
	INC DPTR
	MOV PATEMP_H, DPH
	MOV PATEMP_L, DPL 
	
	MOV B, A
	
	MOV DPH, PBTEMP_H
	MOV DPL, PBTEMP_L
	MOVX A, @DPTR
	
	MOV N, COLS_B
	ACALL MOVEPOINTER
	MOV PBTEMP_H, DPH
	MOV PBTEMP_L, DPL 
	MUL AB 
	
	ADD A, R0
	MOV R0, A
	
	DJNZ R5, CALCULATECELL
	
	MOV A, R0
	MOV DPH, PRES_H
	MOV DPL, PRES_L
	MOVX @DPTR, A
	INC DPTR
	MOV PRES_H, DPH
	MOV PRES_L, DPL
	
	
	MOV DPH, PB_H
	MOV DPL, PB_L
	INC DPTR
	MOV PB_H,DPH
	MOV PB_L, DPL
	
	DJNZ R7, INNERMULTLOOP
	;;
	POP PB_H
	POP PB_L
	PUSH PB_L
	PUSH PB_H
	
	MOV N, ROWS_A
	MOV DPH, PA_H
	MOV DPL, PA_L
	ACALL MOVEPOINTER ;CAMBIAR DE FILA EN MATRIZ A
	MOV PA_H, DPH
	MOV PA_L, DPL	
	DJNZ R6, MULTLOOP
	
	ENDMULT:
	POP PB_H
	POP PB_L
	POP PA_H
	POP PA_L
	RET

MOVEPOINTER:
	MOV R3, N
	CJNE R3, #0, MOVEPTR
		SJMP ENDMOV
	MOVEPTR:
		INC DPTR
		DJNZ R3, MOVEPTR
	ENDMOV:
	RET
END