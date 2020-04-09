; 6)	Hacer un programa para que en el acumulador aparezca la siguiente secuencia: 10H-11H-22H-33H-44H-55H-66H-33H-11H-10H 
;       y luego se repita el proceso. Se puede utilizar cualquier instrucción, pero NINGUNA repetida.

	ORG 0000H
		SJMP MAIN

	ORG 0040H
MAIN:
		MOV A, #010H
		
		INC A
		
INCREMENTO:
		ADD A, #11H
		
		CJNE A, #66H, INCREMENTO
		
		MOV R0, #02H
DECREMENTO:
		MOV B, R0  
		DIV AB

		INC R0
		CJNE A, #11H, DECREMENTO
		
		DEC A
		
		SJMP $
		
	END
		
		

	