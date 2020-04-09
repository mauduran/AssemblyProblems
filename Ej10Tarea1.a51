;10)	Hacer un programa que calcule la suma de los N primeros números pares. 
;El rango de N es de 1 a 15. El número N se encuentra en el registro R0. 
;El resultado debe guardarse en R1.
N EQU 0AH

ORG 0000H
	SJMP MAIN
	
ORG 0040H
MAIN:
	MOV R0, #N
	INC R0
	
	MOV B, #02H
LOOP:
	DJNZ R0, SUM
	MOV R1, A
	SJMP $
	
	
SUM:
	ADD A, B
	INC B
	INC B
	SJMP LOOP
	
END