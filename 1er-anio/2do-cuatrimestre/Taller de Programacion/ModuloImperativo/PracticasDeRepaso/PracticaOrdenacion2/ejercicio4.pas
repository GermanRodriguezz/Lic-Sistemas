program ejer4;
type rango = 1..8;
producto = record
		codProd: integer;
		codRub: rango;
		precio: real;
end;

lista = ^nodo;
nodo = record
	dato: producto;
	sig: lista;
end;

vectorRubros = array [rango] of lista;
vec2 = array [1..30] of producto;

procedure leerProducto(var p:producto);
begin
	writeln('precio');
	readln(p.precio);
	if (p.precio <> 0) then begin
		writeln('cod prod');
		readln(p.codProd);
		writeln('cod rubro');
		readln(p.codRub);
	write('');
	end;
end;

procedure inicializarListas(var v:vectorRubros);
var i: integer;
begin
	for i := 1 to 8 do
		v[i] := nil;
end;

procedure cargarLista(var l:lista; p:producto);
var
	act,ant,nue:lista;
begin
	new(nue);
	nue^.dato:= p;
	nue^.sig := nil;
	if (l = nil) then
		l:= nue
	else begin
		act:= l;
		while (act <> nil) and (act^.dato.codProd < p.codProd) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
		begin
			nue^.sig:= act;
			act:= nue;
		end
		else begin
			ant^.sig:= nue;
			nue^.sig:= act;
		end;
	end;
end;

procedure almacenar(var v:vectorRubros);
var
	p: producto;
begin
	leerProducto(p);
	while (p.precio <> 0) do begin
		cargarLista(v[p.codRub],p);
		leerProducto(p);
	end;
end;

procedure imprimir(l:lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato.codProd);
		l:= l^.sig;
	end;
end;

procedure mostrarCods(v:vectorRubros);
var i:integer;
begin
	for i := 1 to 8 do begin
		writeln('productos del rubro ' , i);
		imprimir(v[i]);
		writeln('');
	end;
end;

procedure generarVec2(v:vectorRubros; var v2: vec2; var diml2:integer);
var l:lista;
begin
	diml2 := 0;
	l := v[3];
	while (l <> nil) and (diml2 <= 30) do begin
		diml2 := diml2 + 1;
		v2[diml2] := l^.dato;
		l:= l^.sig;
	end;
end;

procedure ordenar(var v2:vec2;diml: integer);
var i,j,pos: integer; item: producto;
begin
	for i := 1 to diml -1 do begin
		pos:= i;
		for j:= i+1 to diml do
			if (v2[j].precio < v2[pos].precio) then
				pos:= j;
		item := v2[pos];
		v2[pos] := v2[i];
		v2[i]:= item; 
	end;
end;

procedure impVec(v2:vec2;diml:integer);
var i:integer;
begin
	writeln('vector 2 ordenado : ');
		for i := 1 to diml do begin
			writeln(v2[i].codProd);
			writeln(v2[i].codRub);
			writeln(v2[i].precio);
			writeln('');
		end;
end;

procedure preciosPromedios(v: vec2; diml:integer;var prom:real);
var i:integer; total:real;
begin
	total :=0;
	for i := 1 to diml do
		total := total + v[i].precio;
	prom := total/diml;
end;

var
v1:vectorRubros;
v2: vec2;
diml2: integer;
prom:real;
begin
inicializarListas(v1);
almacenar(v1);
mostrarCods(v1);
generarVec2(v1,v2,diml2);
ordenar(v2,diml2);
impVec(v2,diml2);
preciosPromedios(v2,diml2,prom);
writeln('el precio promedio del vec2 es : ',prom:2:2);
end.
