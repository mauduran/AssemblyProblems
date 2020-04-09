/* 5)	Hacer un programa que sume 10 datos que est�n en la RAM interna a partir de la direcci�n 30H y 
		guarde el resultado en la direcci�n 40H.*/

	ORG 0000H
		SJMP MAIN

	ORG 0040H
MAIN:
	MOV A, #0H
	MOV R0, #30H
	
	MOV R1, #40H
	
REL1:
	ADD A, @R0
	INC R0
	
	CJNE R0, #39H, REL1
	
	MOV @R1, A
	
	SJMP $
END
	