/* 7)	Hacer un programa para separar el contenido del R0 en dos grupos de 4 bits. 
Guardar el grupo de los 4 bits más significativos en los 4 bits menos significativos del registro R1
y los 4 bits menos significativos en los 4 bits menos significativos del registro R2. 
Los 4 bits más significativos de R1 y R2, deben quedar en cero.
*/

ORG 0000H
	SJMP MAIN
	
ORG 0040H

MAIN:
	MOV A, R0
	MOV B, R0
	
	ANL A, #11110000B
	ANL B, #00001111B
	
	MOV R5, #00H
ROTATION:
	RR A
	INC R5
	CJNE R5, #04H, ROTATION
	
	MOV R1, A
	MOV R2, B
	
	SJMP $

END