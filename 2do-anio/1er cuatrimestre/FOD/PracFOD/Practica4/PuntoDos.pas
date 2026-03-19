///A
persona = record
	dni : LongInt;
	nombreyape : string[40];
	legajo : LongInt; 
	anio: integer; 
end;

indice = record
	clave : integer;
	refe : longint;
end;

nodoArbol2 = record
	claves : array [1..M-1] of indice;
	hijos : array [1..M] of integer;
	cantClaves : integer;
end;

archivoPersona = file of persona;

archivoDniPersona = file of nodoArbol2;

///B
N = (M - 1) * (A + M) * (B + C)
N: tamaño del nodo
A : tamaño registro(4 + 4)
B: tamaño enlace a un hijo
C: tamaño cantidad claves

512 = (M - 1) * (4+4) + M * 4 + 4
512 = 8M - 8 + 4M + 4
512 = 12M - 4
512	= 12M 
512 + 4 = 12M
516 = 12M
516/12 = M
43 = M
El orden del arbol seria de 43, en cada nodo tendre 42 claves

///C
Implica que ahora entran mas claves en CADA NODO DEL ARBOL, logrando que
el arbol no tenga demasiados niveles,haciendo menos accesos a disco de los que hacia

///D
Para buscar el DNI 12345678, se comienza desde la raíz del árbol B. 
En cada nodo, se comparan las claves (DNI) secuencialmente hasta encontrar una igual o mayor. 
Si se encuentra una clave mayor, se sigue al hijo izquierdo correspondiente. 
Si es igual, se accede directamente al registro en el archivo de datos usando la referencia almacenada. 
Si el nodo es hoja y no se encuentra la clave, el DNI no está en el archivo.

///E
Si desea buscar un alumno por su numero de legajo no tendria sentido el orden del arbol.
No se recomienda recorrer el arbol B por dni para buscar por legajo porque es ineficiente.
No, no tiene sentido ya que el indice de la clave, hace referencia a un DNI ESPECIFICO,
si quiero obtener un legajo no seria la forma correcta.
Lo que se puede hacer es crear otro indicie estructurado como arbol B por legajo
///F
El problema que tiene este tipo de busquedas es que el recorrido comienzo si o si 
siempre desde la raiz y debe buscar el primer DNI mayor o igual a 40000000.
Y ese recorrido es en orden desde el primer nodo con dni >= 40000000 hasta superar el dni con 45000000
