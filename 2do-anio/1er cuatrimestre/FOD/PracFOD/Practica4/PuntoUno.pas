program PuntoUno;
///A
const M = 5;
type
persona = record
	dni : LongInt;
	nombreyape : string[40];
	legajo : LongInt; 
	anio: integer; 
end;

nodoArbol = record
	claves = array [1..M-1] of persona;
	hijos = array [1..M] of nodoArbol;
	cantClaves = integer; 
end;
///B
N = (M - 1) * (A + M) * (B + C)

512 = (M - 1) * 64 + M * 4 + 4

512 = 64M - 64 + 4M + 4 

512 = 68M - 60 
512 + 60 = 68M
572 = 68M
572 / 68 = M
8.41 = M
M = 8

Con estos numeros nos damos cuenta que pueden entrar en un nodo de arbol B M-1 osea 7 registros
Y el orden del arbol seria 8 
///C

El impacto que tiene es que al guardar toda la informacion de los alumnos
cada clave ocupa mas espacio en bytes, haciendo que haya menos cantidad
de claves por nodo, como el nodo tiene un tamaño fijo. Ademas de que M disminuye
el arbol tendra mas niveles para almacenar la misma cantidad de datos.

///D
seleccionaria un campo como el dni o legajo, ya que son datos que no se pueden repetir.
Si hay mas de una opcion, pueden ser los integers ya que solamente pesan 4 bytes.

///E
La cantidad de lecturas de nodos que se necesitan para encontrar un alumno
por su clave de identificacion en el peor caso son H lecturas, siendo H
el numero de niveles del arbol. Y en el mejor caso seria 1 lectura.
El peor caso seria que busque en todos los niveles del arbol y no lo encuentre
y el mejor caso seria que la clave sea la raiz.

El proceso de busqueda de un alumno por el criterio de ordenamiento por DNI/LEGAJO sera de la siguiente manera:
Se arranca siempre por la raiz, preguntara si es la clave que se busca, si no lo es, pregunta si es mas grande o mas chico,
dependiendo si es mas grande o mas chico seguira su recorrido hacia izquierda o derecha esto lo repetira hasta que;
o se termine el arbol y no queden mas nodos por recorrer, encuentre en algun nodo la clave a buscar

///F
Si desea buscar un alumno por un criterio distinto al que esta ordenado el arbol
perderia eficiencia el algoritmo. En cada clave que seria dni/legajo del registro.
En el peor de los casos recorreria todos los nodos del arbol.

