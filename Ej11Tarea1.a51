; 11)	Hacer un programa para mover el bloque de memoria que comienza en 
;la dirección 1A00H y termina en la dirección 1BFFH, 
;a la sección de memoria que comienza en la 1C00H. 
;El programa debe terminar cuando se haya transferido todo el bloque  
;o cuando se encuentre un dato con valor FFH.

ORIGIN_L EQU 000H
ORIGIN_H EQU 01AH

ORIGIN_F_L EQU 00H
ORIGIN_F_H EQU 01CH


DEST_L EQU 00H
DEST_H EQU 01CH
	
CUR_ORG_H EQU R7
CUR_ORG_L EQU R6
	
CUR_DST_H EQU R5
CUR_DST_L EQU R4

ORG 0000H 
	SJMP MAIN

ORG 0040H
MAIN:
	MOV DPH, #ORIGIN_H
	MOV DPL, #ORIGIN_L
	MOV CUR_DST_H, #DEST_H
	MOV CUR_DST_L, #DEST_L
	
START:
	MOV CUR_ORG_H, DPH
	MOV CUR_ORG_l, DPL
	CJNE CUR_ORG_H, #ORIGIN_F_H, LOOP
	CJNE CUR_ORG_L, #ORIGIN_F_L, LOOP
FIN:
	
	SJMP $
		
LOOP:
	MOVX A, @DPTR
	INC DPTR
	CJNE A, #0FFH, CONT
	SJMP FIN
CONT:
	MOV CUR_ORG_L, DPL
	MOV CUR_ORG_H, DPH
	
	MOV DPL, CUR_DST_L
	MOV DPH, CUR_DST_H
	
	MOVX @DPTR, A
	
	INC DPTR 
	MOV CUR_DST_L, DPL
	MOV CUR_DST_H, DPH
	
	MOV DPL, CUR_ORG_L
	MOV DPH, CUR_ORG_H
	SJMP START
	
	
	END
		
