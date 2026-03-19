program parcial;
type rangogenero = 1..15;
libro = record
	isbn : integer;
	anioedicion : integer;
	codautor: integer;
	codgenero : rangogenero;
end;

reg = record
	isbn: integer;
	anio: integer;
	genero: rangogenero;
end;

listaLibros= ^nodolista1;
nodolista1 = record
	dato : reg;
	sig : listaLibros;
end;

info = record
	cod: integer;
	lista: listaLibros;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

info2 = record
	codautor: integer;
	cantLibros: integer;
end;

listaNueva = ^nodolista2;
nodolista2 = record
	dato : info2;
	sig : listaNueva;
end;

procedure leerLibro(var l:libro);
begin
	l.isbn := random(100);
	if (l.isbn <> 0) then begin
		l.anioedicion:= 2000 + (random(24)+1);
		l.codautor := random(100);
		l.codgenero:= random(15)+1;
	end;
end;

procedure agregarEnLista(var l: listaLibros;li:libro);
var nue: listaLibros;
begin
	new(nue);
	nue^.dato.isbn := li.isbn;
	nue^.dato.anio := li.anioedicion;
	nue^.dato.genero := li.codgenero;
	nue^.sig := l;
	l := nue;
end;

procedure insertar(var a :arbol; l:libro);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.cod := l.codautor;
		a^.dato.lista := nil;
		agregarEnLista(a^.dato.lista,l);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.cod = l.codautor) then
			agregarEnLista(a^.dato.lista,l)
		else if (a^.dato.cod > l.codautor) then
				insertar(a^.hi,l)
			else
				insertar(a^.hd,l);
end;

procedure cargarArbol(var a:arbol);
var l:libro;
begin
	leerLibro(l);
	while(l.isbn <> 0) do begin
		insertar(a,l);
		leerLibro(l);
	end;
end;

procedure imprimir(l:listaLibros);
begin
	if (l <> nil) then begin
		writeln('isbn ', l^.dato.isbn, ' anio ', l^.dato.anio, ' genero ', l^.dato.genero);
		imprimir(l^.sig);
	end;
end;

procedure imprimirOrdA(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrdA(a^.hi);
		writeln(a^.dato.cod);
		writeln('imprimira la lista del autor ');
		imprimir(a^.dato.lista);
		imprimirOrdA(a^.hd);
	end;
end;

procedure cant(l:listaLibros; var cantidad:integer);
begin
	if (l <> nil) then begin
		cantidad := cantidad + 1;
		cant(l^.sig,cantidad);
	end;
end;

procedure agregarEnLista2(var l:listaNueva; i:info2);
var nue: listaNueva;
begin
	new(nue);
	nue^.dato := i;
	nue^.sig := l;
	l := nue;
end;

procedure moduloB(a:arbol; codigo:integer; var ln:listaNueva);
var inf2 : info2; cantidad:integer;
begin
	if (a <> nil) then begin
		if (codigo < a^.dato.cod) then begin
			cant(a^.dato.lista,cantidad);
			inf2.cantLibros := cantidad;
			inf2.codautor := a^.dato.cod;
			agregarEnLista2(ln,inf2);
			moduloB(a^.hd,codigo,ln);
			moduloB(a^.hi,codigo,ln);
		end
		else
			moduloB(a^.hd,codigo,ln);
	end;
end;

procedure imprimirOrd(l:listaNueva);
begin
	if (l <> nil) then begin
		writeln('el autor ', l^.dato.codautor ,' tiene ', l^.dato.cantLibros ,' libros ');
		imprimirOrd(l^.sig);
	end;
end;

procedure moduloC(l:listaNueva; var cantMax,codMax:integer);
begin
	if (l <> nil) then begin
		if (l^.dato.cantLibros > cantMax) then begin
			cantMax := l^.dato.cantLibros;
			codMax := l^.dato.codautor;
		end;
		moduloC(l^.sig,cantMax,codMax);
	end;
end;

var
a: arbol;
codigo: integer;
ln: listaNueva;
cantidadMax,codigoMax : integer;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('imprimira arbol ordenado');
imprimirOrdA(a);

writeln('ingresar codigo');
readln(codigo);
ln := nil;
moduloB(a,codigo,ln);
writeln('imprimira los datos de la lista nueva');
imprimirOrd(ln);

cantidadMax := -1;
moduloC(ln,cantidadMax,codigoMax);
writeln('el codigo del autor con maxima cantidad de libros es ', codigoMax , ' y posee ', cantidadMax , ' de libros');
end.
