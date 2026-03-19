///A
Los elementos (claves) de un arbol B+ se organizan : los valores reales
se encuentran en los nodos hojas y unos enlazados con otros. 
Las copias de las claves se encuentran un nivel arriba como padres, 
las copias son los en "separadores" o "enganches" entre hijos izq y der

Los elementos que se encuentran en los nodos internos son las copias de las claves
Los elementos que se encuentran en los nodos hojas son los valores reales.

///B
La caracteristica distintiva de los nodos hojas de un arbol B+ es que estan
enlazados desde el nodo inicial hasta el ultimo nodo hoja, logrando un recorrido secuencial rapido

///C
persona = record
	dni : LongInt;
	nombreyape : string[40];
	legajo : LongInt; 
	anio: integer; 
end;

nodoArbol = record;
	esHoja : boolean;
	claves : array [1..M-1] of integer; 		{este arreglo son las claves del nodo}
	hijos : array [1..M] of integer; 			{son de tipo integer ya que son direcciones no punteros}
	enlace = array [1..M]of integer				{esto lo uso cuando este nodo NO SEA una hoja,osea boolean sea FALSE}
	siguiente : integer;						{esto lo uso cuando este nodo sea una hoja, osea el boolean sea TRUE}
	{siguiente : es de tipo integer ya que este campo hace referencia a una direccion osea un numero, por eso integer}
	cantClaves : integer:					{cantidad de claves del nodo}
end;

como me pide que ocupe el mismo espacio el nodo interno y nodo hoja, lo que defino es un nodo que dentro tenga:
1:  campo donde tengo un booleano que me determina si el nodo es hoja o interno
2:  campo donde obtengo la clave y la referencia de esa clave del archivo
3:  campo donde tengo un arreglo con los hijos del nodo, es de tipo de dato PunteroAlNodo porque son hijos son otros nodos que tendran el mismo contenido, tendra importancia cuando campo 1 es FALSE
4:  campo enlace de los nodos hoja, solo tendra importancia cuando el campo 1 es TRUE
5:  campo que cuenta la cantidad de claves del nodo.

///D
El proceso de busqueda en un arbol B+ ahora cambia, ya que el recorrido lo hare desde
el nodo de mas a la izquierda,¿porque? porque alli es donde tengo el NODO INICIAL DEL ARBOL SIEMPRE
y como los arboles B+ estan enlazados en sus hojas, puedo hacer un recorrido secuencial rapido evitandome
recorrer todo el arbol y aprovechando ese orden enlazado que tiene.
Arrancara desde mas a la izquierda preguntando si es igual o mas grande, si no es igual pasara al siguiente nodo que este apuntando.
si es igual tomara la referencia al dni e ira a buscarlo al archivo.

///E
La ventaja es que ahora con este tipo de arbol el recorrido se hace secuencialmente al encontrar una clave que este dentro
de los parametros, este recorrido se hara mas rapido ya que necesita menos lecturas, los nodos hojas estan enlazados por lo tanto
es facil pasar al siguiente.
