# AssemblyProblems
Series of 21 coding problems in assembly language written for the microcomponents course.

1)	Hacer un programa para cargar los registros con los siguientes valores: A 0FH, R0 12H, R1 34H, R2 56H, R3 78H, R4 09H, R5 ACC.

2)	Hacer un programa para que el acumulador cuente del 25H al 31H, de uno en uno, se decremente de la misma forma hasta llegar al valor 
inicial.

3)	Hacer un programa para que el acumulador pase de 0 a 10 se uno en uno y luego se repita el proceso

4)	Hacer un programa para sumar el contenido de R4 con el contenido de R6 y colocar el resultado en R2

5)	Hacer un programa que sume 10 datos que están en la RAM interna a partir de la dirección 30H y guarde el resultado en la dirección 
40H.

6)	Hacer un programa para que en el acumulador aparezca la siguiente secuencia: 10H-11H-22H-33H-44H-55H-66H-33H-11H-10H y luego 
se repita el proceso. Se puede utilizar cualquier instrucción, pero NINGUNA repetida.

7)	Hacer un programa para separar el contenido del R0 en dos grupos de 4 bits. Guardar el grupo de los 4 bits más significativos en
los 4 bits menos significativos del registro R1 y los 4 bits menos significativos en los 4 bits menos significativos del registro R2. 
Los 4 bits más significativos de R1 y R2, deben quedar en cero.


8)	Hacer un programa para combinar los 4 bits menos significativos del registro R2 y los 4 bits menos significativos del registro R1
en una sola localidad de 8 bits y guardarla en el registro R0. Los 4 bits menos significativos de R2 deberán ocupar los 4 bits menos 
significativos de R0.

9)	Hacer un programa para determinar la cantidad de ceros, de números positivos (aquellos cuyo bit más significativo es cero) y 
de números negativos (aquellos cuyo bit más significativo es uno) que hay en un bloque de memoria externa. La dirección inicial del
bloque está en las localidades 1940H y 1941H, la longitud del bloque está en la localidad 1942H. El número de elementos negativos 
debe colocarse en la localidad 1943H, el número de ceros en la 1944H y el número de elementos positivos en la localidad 1945H.

10)	Hacer un programa que calcule la suma de los N primeros números pares. El rango de N es de 1 a 15. El número N se encuentra en 
el registro R0. El resultado debe guardarse en R1.

11)	Hacer un programa para mover el bloque de memoria que comienza en la dirección 1A00H y termina en la dirección 1BFFH, a la secció
n de memoria que comienza en la 1C00H. El programa debe terminar cuando se haya transferido todo el bloque  o cuando se encuentre un
dato con valor FFH.

12)	 Hacer un programa que multiplique el contenido binario del registro R0 (<20h) por 7 y guarde el resultado en el registro R1. 
Hacer en dos versiones, con y sin utilizar la instrucción de multiplicación.

13)	Hacer un programa para que encuentre el elemento más pequeño de una lista de números de 16 bits sin signo que están en localidades 
consecutivas de memoria. La dirección del primer elemento de la lista se encuentra en las localidades 1900H y 1901H, el número de 
elementos del arreglo está en la localidad 1902H. El elemento más pequeño encontrado debe guardarse en la localidad 1903H.

14)	Hacer un programa para que ordene una lista de números binarios de 8 bits con signo en orden ascendente (menor a mayor). 
La longitud de la lista está en la localidad de memoria 1B00H y la lista misma comienza en la localidad de memoria 1B01H. 
Los números están en complemento a dos.

15)	Hacer un programa para contar el número de bits con valor 1 que hay en un bloque de memoria cuya dirección inicial se encuentra 
almacenada en las localidades 1A00H y 1A01H y cuya dirección final esta almacenada en las localidades 1A02H y 1A03H. El número total
de unos debe guardarse en las localidades 1A04H y 1A05H. Se sugiere  utilizar un lazo para contar los unos dentro de cada localidad 
del bloque, anidado en otro lazo que se encargue de acumular los unos resultantes de todas las localidades.

16)	Hacer un programa que justifique una fracción binaria de 16 bits que se encuentra en las localidades 1C00H y 1C01H desplazando 
el número hacia la izquierda hasta que el bit más significativo sea 1. Guardar el resultado en las direcciones 1C02H y 1C03H y el 
número de desplazamientos en la dirección 1C04H. Si el contendido de las direcciones 1C00H y 1C01H es cero, entonces escribir ceros
en las direcciones 1C02H, 1C03H y 1C04H. Este proceso se utiliza para convertir un número a notación científica.

17)	A partir de la localidad 500H de RAM se encuentra una lista de palabras de 16 bits. En el registro R4 se encuentra el número de
elementos de la lista. Se requiere implementar un programa que genere el promedio de los elementos de la lista y que guarde dicho 
promedio en los registros R6 y R7.

18)	Hacer un programa para unir dos listas ordenadas ascendentemente en una sola lista ordenada de la misma forma. El registro DPTR
contiene la dirección de la localidad de memoria donde está almacenado el número de elementos de la lista 1, y la lista 1 comienza
en la siguiente localidad. Para la lista 2 sucede algo similar, pero con los registros R6 y R7. Los registros R4y R5 contienen la 
dirección en donde debe comenzar la lista resultante.

19)	Realiza las siguientes rutinas para el manejo de cadenas:
	Insertar una subcadena (SUB) en una cadena (CAD) a partir de cierta posición (POS).
	Encontrar una subcadena (SUB) en una cadena (CAD), indicando la posición donde inicia (POS).
	Borrar una cierta cantidad de caracteres (N) de una cadena (CAD) a partir de una posición (POS).
	Copiar de una cadena (CAD) una cierta cantidad de caracteres (N) a una subcadena (SUB).
* Las cadenas terminan con el ASCII 0.
* La cadena CAD inicia en la localidad 400H de RAM.
* La cadena SUB inicia en la localidad 450H de RAM
* El número POS está en el registro R2.
* El número N está en el registro R3.

20)	Se tiene una tabla 1 (bloque de números BCD de dos dígitos, 1 byte) en la memoria RAM. La dirección inicial de la tabla 1 se 
encuentra en la localidad 18F0H y la dirección final en la localidad 18F2H. Se pide un programa en el cual haga tres cosas:
	El programa principal deberá agregar un checksum (el complemento a dos de la suma de N bytes en binario, despreciando los acarreos) 
  al final de una tabla 2 (descrita en el inciso "b").
  
	La subrutina 1 deberá pasar todos los datos BCD que estén en la tabla 1, a una tabla 2  (que tú crearás y cuya dirección inicial es 
  1900H), convertidos a BINARIO.
  
	Al comenzar la subrutina 1 antes de la conversión, hay que checar si el número a convertir es diferente de cero. Si lo es, 
  entonces convierte el número BCD a BINARIO y escríbelo en la tabla 2. Pero si no lo es, es decir si es cero, llama a una subrutina 2
  (anidada dentro de la 1), la cual deberá borrar el cero de la tabla 1, recorrer la lista y actualizar la longitud de la misma 
  COMPRIMIENDOLA, de tal forma que al final del programa la tabla 1, NO contenga ningún cero.
	
  NOTAS:
  i)	Es necesario que la eliminación de ceros y la conversión de datos sea en paralelo. Por lo anterior, el programa deberá consistir en un programa principal (el que calcula y escribe el checksum al final de la tabla dos), una subrutina uno (que convierta los números en la tabla 1 de BCD a BINARIO a escribirse en la tabla dos) y una subrutina dos (que elimine de la tabla uno los ceros y la comprima).
  ii)	Se deberá anidar forzosamente la subrutina dos dentro de la uno, es decir, no se puede en un primer momento eliminar los ceros de la tabla 1 y después convertir, si no que la conversión de BCD a BINARIO y la compresión de la tabla 1, deben ser en paralelo.
  iii)	Cualquier transferencia de datos entre las subrutinas o el programa principal, sólo se podrá hacer a través de la pila, NO se vale utilizar ningún registro.
  iv)	El programa deberá estar codificado a partir de la 1800H.
  v)	La pila deberá estar en la dirección 3FH
  vi)	La longitud del bloque no excede de 256 bytes.
  vii)	La tabla 1 puede tener una cadena de varios ceros consecutivos.

21)	Implementa un programa que haga la suma y multiplicación de dos matrices. Los datos de entrada son:
  i)	# de renglones de A -> 1000H de RAM
  ii)	# de columnas de A  -> 1001H de RAM
  iii)	# de renglones de B -> 1002H de RAM
  iv)	# de columnas de B  -> 1003H de RAM

  •	A partir de la localidad 2000H de RAM se encuentra la matriz A: a11, a12, .., a1n, a21, a22, .., amn.
  •	A partir de la localidad 3000H de RAM se encuentra la matriz B: b11, b12, .., b1n, b21, b22, .., bmn.
  
  Se espera que la suma de matrices se encuentre a partir de la localidad 4000H de RAM y la multiplicación de matrices a partir de 
  la localidad 5000H de RAM.
  Los datos son de 8 bits con signo.
