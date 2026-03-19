program final;
type
venta = record
	codventa : integer;
	codprod : integer;
	cantven : integer;
	total : integer;
end;

lista = ^nodo;
nodo = record
	dato : venta;
	sig : lista;
end;

procedure leer(var v:venta);
begin
	readln(v.codventa);
	readln(v.codprod);
	readln(v.cantven);
end;

procedure insertar(var l:lista; v: venta);
var act,ant,nue:lista;
begin
	new(nue);
	nue^.dato := v;
	nue^.sig := nil;
	if (l = nil) then begin
		l := nue;
		l^.dato.total := l^.dato.cantven;
	end
	else begin
		act := l;
		while (act <> nil) and (l^.dato.codprod < v.codprod) do begin
			ant := act;
			act := act^.sig;
		end;
		if (act <> nil) and (v.codprod = l^.dato.codprod) then
			l^.dato.total := l^.dato.total + l^.dato.cantven;
		if (act = l) then begin
			nue^.sig := l;
			l := nue;
		end
		else
			ant^.sig := nue;
		nue^.sig := act;
	end;
end;

procedure cargarLista(var l: lista);
var
	v: venta;
begin
	leer(v);
	while (v.codventa <> 9999) do begin
		insertar(l,v);
		leer(v);
	end;
end;

procedure informarTotal(l:lista; cod: integer);
begin
	while (l <> nil) and (cod < l^.dato.codprod) do
		l := l^.sig;
	if (l <> nil) and (cod = l^.dato.codprod) then
		writeln(l^.dato.total)
	else
		writeln('la lista no contiene al codigo buscado');
end;

var
l : lista; cod: integer;

begin
l := nil;
cargarLista(l);
readln(cod);
informarTotal(l,cod);
end.
/// PUNTO 2
las principales diferencias entre las estructuras de control for,while, repeat until son:
La estructura de datos FOR no depende de una condicion y se ejecutara 1 o mas veces
La estructura de control while, si depende su ejecucion de una condicion, por lo tanto puede ejecutarse 0,1 o mas veces
La estructura de control repeat until, en cambio, "junta" las otras dos estructuras y contiene condicion pero su ejecucion no dependera tanto de ello, ya que 
	primero ejecuta y luego consulta la condicion que contiene, por lo tanto puede ejecutarse al igual que el FOR, 1 o mas veces.
	
CASO FOR 
for i:= 1 to 1 do 
	cant := cant + 1 ( aunque el for sea de 1 to 1 se ejecutara esa unica vez,haciendo que siempre se ejecute la estructura)
	
CASO WHILE
i := 5
while (i <> 5) do begin
	cant :=cant + 1;   ( en este caso la ejecucion no entra al while ya que no se cumple la condicion de que I sea distinto de 5,
						por lo tanto la estructura se ejecuta 0 veces)
end;

CASO REPEAT UNTIL
i := 5

repeat
cant := cant + 1;    (como esta estructura evalua luego de ejecutar, se ejecutara una vez y ahi terminara ya que la condicion no es verdadera.
until(i <> 5);

///PUNTO 3
el concepto de eficiencia de un programa estudia el tiempo de ejecucion de un algoritmo y memoria que requiere para su ejecucion.
La memoria de un programa se mide mediante los calculos de las variables declaradas en memoria estatica y el espacio reservado en memoria dinamica.	
El tiempo de ejecucion depende de las estructuras de control que hay en el programa y las operaciones de asignaciones y operaciones aritmeticas/logicas que hay.

///PUNTO 5
El tipo de datos vector es una coleccion de elementos almacenados uno al lado del otro. Es una estrucutra de datos no lineal, indexada,
 homogenea, compuesta y estatica.

///PUNTO 6
es una variable que se usa para almacenar una direccion en memoria dinamica. Es capaz de reservar y liberar espacio en la memoria dinamica. es un tipo de dato simple.
	A una variable puntero no se le puede hacer un read ni write
	Tampoco asignarle una direccion de memeoria de manera directa. p := 1122.
	No se pueden comparar direcciones de memoria. p < q.

///PUNTO 7
	el concepto de modularizacion consiste en dividir tareas que requiere el programa en partes funcionalmente independientes.
	Las ventajas son la reusabilidad del modulo, la legibilidad, y mayor productividad.
