/* 8)	Hacer un programa para combinar los 4 bits menos significativos del registro R2 
		y los 4 bits menos significativos del registro R1 en una sola localidad de 8 bits
		guardarla en el registro R0. 
		Los 4 bits menos significativos de R2 deberán ocupar los 4 bits menos significativos de R0.
		*/

	ORG 0000H
		SJMP MAIN
		
	ORG 0040H
MAIN:
		MOV A, R2
		ANL A, #00001111B
		MOV R2, A
		
		MOV A, R1
		ANL A, #00001111B
		MOV R1, A
		
		MOV A, R1
		
		RL A
		RL A
		RL A
		RL A
		
		
		MOV B, R2
		ORL A, B

		MOV R0, A
		
END		

	
	