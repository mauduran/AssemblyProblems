;12) Hacer un programa que multiplique el contenido binario del registro R0 (<20h)
;por 7 y guarde el resultado en el registro R1. Hacer en dos versiones, 
;con y sin utilizar la instrucción de multiplicación.

N EQU 20H

ORG 0000H
	SJMP MAIN
	
ORG 0040H
MAIN:
	MOV R0, #N
	MOV A, R0
	MOV B, #07H
	
	MUL AB
	MOV R1, A
	SJMP $
END 
