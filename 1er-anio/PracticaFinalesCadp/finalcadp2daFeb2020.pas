program final;
type rango = 1..12;
publicacion = record
	titulopublicacion: string;
	nombreAutor: string;
	DniAutor : integer;
	tipoPublicacion : rango;
end;

reg2 = record
	titulo : string;
	nombre: string;
	tipo: integer;
end;

lista2 = ^nododos;
nododos = record
	dato : reg2;
	sig : lista2;
end;

reg1 = record
	dni : integer;
	listaAutor : lista2;
	cantidadPublicaciones : integer;
end;

ListaD = ^nodouno;
nodouno = record
	dato : reg1;
	sig : ListaD;
end;

vector = array [rango] of integer;

procedure leer(var p:publicacion);
begin
	readln(p.titulopublicacion);
	readln(p.nombreAutor);
	readln(p.DniAutor);
	readln(p.tipoPublicacion);
end;

procedure agregarEnLista(var l:lista2; p:publicacion);
var
	nue: lista2;
begin
	new(nue);
	nue^.dato.titulo := p.titulo;
	nue^.dato.nombre := p.nombreAutor;
	nue^.dato.tipo := p.tipoPublicacion;
	nue^.sig := nil;
	l := nue;
end;

procedure insertar(var l:ListaD; p : publicacion);
var nue: ListaD;
begin
	new(nue);
	nue^.dato.dni := p.DniAutor;
	nue^.dato.listaAutor := nil;
	nue^.dato.listaAutor^.dato.cantidadPublicacion := 1;
	if (l = nil) then begin
		l := nue;
		agregarEnLista(l^.dato.listaAutor,p);
	end
	else begin
		if (l^.dato.dni = p.DniAutor) then begin
			l^.dato.cantidadPublicacion := l^.dato.cantidadPublicacion + 1;
			agregarEnLista(l^.dato.listaAutor,p);
		end
		else begin
			l^.sig := nue;
			l := nue;
			agregarEnLista(l^.dato.listaAutor,p)
		end;
	end;
end;

procedure incializarVector(var v:vector);
var i: rango;
begin
	for i := 1 to 12 do
		v[i] := 0;
end;

procedure cargarLista(var l: ListaD; var v:vector);
var p: publicacion;
begin
	leer(p);
	inicializarVector(v);
	while (p.DniAutor <> 0) do begin
		insertar(l,p);
		v[p.tipoPublicacion] := v[p.tipoPublicacion] + 1;
		leer(p);
	end;
end;

procedure maximoDelVector(v:vector; var tipo:integer);
var i,max: integer;
begin
	max := -1;
	for i := 1 to 12 do begin
		if (v[i] > max) then begin
			max := v[i];
			tipo := i;
		end;
	end;
end;

procedure cantPublicaciones(l: ListaD);
begin
	while (l <> nil) do begin
		writeln(l^.dato.cantPublicaciones);
		l := l ^.sig;
	end;
end;

var
	l: listaD; v: vector; max: integer;
begin
l := nil;
cargarLista(l,v);
maximoDelVector(v,max);
writeln('el tipo de publicacion con mayor publicaciones es ', max);
cantPublicaciones(l);
end.

///PUNTO 2
Calculo de memoria estatica del programa del ejercicio 1;
l : listaD = 4
v :vector = 12 * 4 = 48
max : integer = 4         
rango : integer = 4       :=  60 bytes.


///PUNTO 3
program prueba
var c : integer;
procedure calcular (var b,a: integer);	{b = 0 ; a = 80}
begin
	b := 10;	{variable local no hay, pero si parametro entonces tomara la variable del parametro} {b = a}
	while (b > 0) do begin
		a := a + b; {a vale 80} {80 + 10 + 8 + 6 + 4 + 2} {a tendra el valor 110}
		b := b - 2; {b vale 10 y se ira descontando de 2 en 2 en cada ejecucion, el while se ejecutara 5 veces por ende}
		c := c - b; {no es variable local,ni parametro, es variable global} {c = 30 - 8 -6 -4 -2 - 0} {c tendra el valor 10}
	end;
	writeln('a = ',a , ' b = ', b , ' c = ', c); { 110 , 0 , 10}
end;

var
a,b : integer;
begin
	b := 80;	{variable local}
	c := 30;	{variable global}
	writeln('a = ',a , ' b = ', b , ' c = ', c);	{a imprime basura, b imprime 80, c imprime 30}
	calcular(a,b);	{a = basura ; b = 80}
	writeln('a = ',a , ' b = ', b , ' c = ', c); {0 , 110, 10}
end;

///PUNTO 4
defina el tipo de datos arreglo y describa los pasos necesarios en pseudocodigo para BUSCAR UN ELEMENTO EN UN ARREGLO ORDENADO E INSERTAR UN ELEMENTO 
							EN UNA POSICION DETERMINADA.
	El tipo de dato arreglo es una coleccion de elementos almacenados uno al lado del otro, es un tipo de dato indexado,compuesto, estatico,homogeneo
	
	para buscar un elemento en un arreglo debo realizar los siguiente pasos.
		necesito la dimension logica del arreglo
		mientras (la posicion siguiente sea menor a la dimension logica) y (el dato a buscar < el contenido en la posicion a evaluar)
				aumento la posicion para evaluar si se encuentra en la proxima posicion
				no encontre la dato
		si (la posicion < dimension logica) y (el dato es = el contenido en la posicion a evaluar)
			encontre el dato
///PUNTO 5
calcular el tiempo de ejecucion del programa del punto 3

program prueba
var c : integer;
procedure calcular (var b,a: integer);					
begin													
	b := 10;											1ut
	while (b > 0) do begin								c(n + 1) + n(cuerpo)  n = 5   cuerpo = 6     1(5+1) + 5 (6) / 6 + (30) = 36
		a := a + b; 									2ut
		b := b - 2; 									2ut
		c := c - b; 									2ut
	end;												1 + 36 = 37ut
	writeln('a = ',a , ' b = ', b , ' c = ', c); 		
end;													

var														
a,b : integer;											
begin													
	b := 80;											1ut
	c := 30;											1ut
	writeln('a = ',a , ' b = ', b , ' c = ', c);		
	calcular(a,b);										37ut
	writeln('a = ',a , ' b = ', b , ' c = ', c); 		
end;													1+1+37 = 39.
			
///PUNTO 6
Estructuras de control de seleccion
	if 		permite al algoritmo mediante el valor de una variable tomar decisiones.
	case 	permiten realizar acciones dependiendo el valor de una variable de tipo ordinal.
