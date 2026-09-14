{Una biblioteca necesita un sistema para procesar la información de los libros. De cada libro se conoce: ISBN, código del
autor y código de género (1 a 15).

a) Implementar un módulo que lea información de los libros y retorne una estructura de datos eficiente para la
búsqueda por código de autor que contenga código de autor y una lista de todos sus libros. La lectura finaliza al
ingresar el valor 0 para un ISBN.

b) Realizar un módulo que reciba la estructura generada en el inciso a), un código de autor y un código de género.
El módulo debe retornar una lista con código de autor y cantidad de libros del código de género recibido, para
cada autor cuyo código sea superior al código de autor ingresado.

c) Realizar un módulo recursivo que reciba la estructura generada en inciso b) y retorne cantidad y código de autor
con mayor cantidad de libros.}


program parcial;
type 
libro = record
	isbn : integer;
	codgenero : integer;
end;

listaInfo = ^nodolista;
nodoLista = record
	dato : libro;
	sig : listaInfo;
end;

arbol = ^nodoarbol;

nodoarbol = record
	codautor : integer;
	lista: listaInfo;
	HI : arbol;
	HD : arbol;
end;

listaR = ^nodolistaR;
nodoListaR = record
	codigo : integer;
	cant : integer;
	sig : listaR;
end;
	// 
procedure leer(var l : libro; var cod : integer);
begin
	readln(l.isbn);
	if (l.isbn <> 0) then begin
		readln(cod);
		readln(l.codgenero);
	end;
end;
//modulo a 
procedure agregarLista(var l: listaInfo; lib : libro);
var nue: listaInfo;
begin
	new(nue);
	nue^.dato := lib;
	nue^.sig := l;
	l := nue;
end;

procedure insertar(var a: arbol; lib : libro; cod : integer);
var nue: arbol;
begin
	if (a = nil) then begin
		new(nue);
		nue^.codautor := cod;
		nue^.lista := nil;
		agregarLista(nue^.lista,lib);
		nue^.HI := nil;
		nue^.HD := nil;
		a := nue;
	end
	else begin
		if (a^.codautor = cod) then
			agregarLista(a^.lista, lib);
		else begin
			if (a^.codautor > cod) then 
				insertar(a^.HI, lib,cod)
			else
				insertar(a^.HD,lib,cod);
		end
	end
end;

procedure cargarArbol( var a: arbol);
var cod : integer; l : libro;
begin
	leer(l,cod);
	while (l.isbn <> 0) do begin
		insertar(a,l,cod);
		leer(l,cod);
	end;
end;

// inciso B
procedure agregarLista(var l: listaR; cant,codigo : integer);
var nue : listaR;
begin
	new(nue);
	nue^.codigo := codigo;
	nue^.cant := cant;
	nue^.sig := l;
	l := nue;
end;
procedure recorrerLista(l : listaR; var ln : listaR; genero :integer; codautor : integer);
var cant : integer;
begin	
	cant := 0;
	while (l <> nil) do begin
		if (l^.dato.codgenero = genero) then begin
			cant := cant + 1;
			l := l^,sig;
		end
	end;
	if (cant <> 0) then
		agregarLista(ln,cant,codautor);
end;
procedure retornarLista(a : arbol; autor,genero : integer; var ln: listaR);
begin 
	if (a <> nil) then begin
		if (a^.codautor > autor) then begin
			retornarLista(a^.HI,autor,genero,ln);
			recorrerLista(a^.lista,ln,genero,a^.codautor);
			retornarLista(a^.HD,autor,genero,ln);
		end
		else
			retornarLista(a^.HD,autor,genero,ln);
	end
end;

procedure masLibro(l : listaR; var autorMax, librosMax : integer);
begin
	if (l <> nil) then begin
		if (l^.cant > librosMax) then begin
			librosMax := l^.cant;
			autorMax := l^.codigo;
		end;
	masLibro(l^.sig,autorMax,librosMax);
	end;
end;
