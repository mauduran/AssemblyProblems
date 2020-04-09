/* 2)	Hacer un programa para que el acumulador cuente del 25H al 31H, de uno en uno,
		se decremente de la misma forma hasta llegar al valor inicial. */

ORG 0000H
	SJMP MAIN
	
	ORG 0040H
MAIN:
	MOV A, #25H
	
INCREMENTAR:
	INC A
	CJNE A, #31H, INCREMENTAR

DISMINUIR:
	DEC A
	CJNE A, #25H, DISMINUIR
	
	AQUI: SJMP AQUI
END
	
		