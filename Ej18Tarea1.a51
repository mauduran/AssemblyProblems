/* 18) Hacer un programa para unir dos listas ordenadas ascendentemente en una sola lista ordenada de la misma forma. 
El registro DPTR contiene la dirección de la localidad de memoria donde está almacenado el número de elementos de la lista 1,
y la lista 1 comienza en la siguiente localidad. 
Para la lista 2 sucede algo similar, pero con los registros R6 y R7. 
Los registros R4y R5 contienen la dirección en donde debe comenzar la lista resultante. */

L1_L EQU 60H
L1_H EQU 61H

VAR1 EQU 71H
VAR2 EQU 72H	

LEN1 EQU R0
LEN2 EQU R1
ORG 0000H
	SJMP MAIN
ORG 0040H
MAIN:
	MOV DPTR, #1000H;SE DA UNA DIRECCION POR DEFAULT AL DPTR
	MOVX A, @DPTR
	MOV LEN1, A ;SE CARGA CANTIDAD DE DATOS EN LA LISTA 1
	INC DPTR
	MOV L1_L, DPL
	MOV L1_H, DPH
	
	MOV DPH, R7
	MOV DPL, R6
	MOVX A, @DPTR
	INC DPTR
	MOV R7, DPH
	MOV R6, DPL
	MOV LEN2, A ;SE CARGA CANDIDAD DE DATOS EN LA LISTA 2
	
LOOP:
	CJNE LEN1, #00H, COMPARE
	CJNE LEN2, #00H, COMPARE
	SJMP $
		
COMPARE:
	CJNE LEN1, #00H, CONT1
	SJMP PUTL2EL
CONT1:
	CJNE LEN2, #00H, CONTINUE
	SJMP PUTL1EL
CONTINUE:
	MOV DPH, L1_H
	MOV DPL, L1_L
	MOVX A, @DPTR 
	MOV VAR1, A ;OBTENCION DE ELEMENTO DE LA LISTA 1
	
	MOV DPH, R7
	MOV DPL, R6
	MOVX A, @DPTR ;OBTENCION DE ELEMENTO DE LA LISTA 2
	MOV VAR2, A
	SUBB A, VAR1
	
	JC PUTL2EL
	SJMP PUTL1EL

PUTL1EL:
	MOV DPH, L1_H
	MOV DPL, L1_L
	MOVX A, @DPTR 
	MOV DPH, R5
	MOV DPL, R4
	MOVX @DPTR, A
	INC DPTR
	MOV R5, DPH
	MOV R4, DPL

	MOV DPH, L1_H
	MOV DPL, L1_L	
	INC DPTR
	MOV L1_H, DPH
	MOV L1_L, DPL

	CLR CY
	DEC LEN1
	SJMP LOOP

PUTL2EL:
	MOV DPH, R7
	MOV DPL, R6
	MOVX A, @DPTR ;OBTENCION DE ELEMENTO DE LA LISTA 2
	MOV DPH, R5
	MOV DPL, R4
	MOVX @DPTR, A
	INC DPTR
	MOV R5, DPH
	MOV R4, DPL

	MOV DPH, R7
	MOV DPL, R6
	INC DPTR

	MOV R7, DPH
	MOV R6, DPL
	DEC LEN2
	SJMP LOOP
END

