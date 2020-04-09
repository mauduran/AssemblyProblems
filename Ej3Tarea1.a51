/* 3)	Hacer un programa para que el acumulador pase de 0 a 10 se uno en uno y luego se repita el proceso */

	ORG 0000H
		SJMP MAIN
		
	ORG 0040H
MAIN:
		
STARTSUM:

		MOV A, #0H

ADDONE:
		INC A
		CJNE A, #10, ADDONE
		
		SJMP STARTSUM; 
		
END