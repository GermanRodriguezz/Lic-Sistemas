program act3;
type lista = ^nodo;
nodo = record
	dato: integer;
	sig: lista;
end;

procedure agregarAtras(var l:lista; var ult:lista; n:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:= n;
	nue^.sig:= nil;
	if (l = nil) then
		l := nue
	else
		ult^.sig:= nue;
	ult := nue;
end;

procedure cargarL(var l:lista);
var
	n:integer;
	ult:lista;
begin
	n:= 100 + random(150-100)+1;
	while (n <> 120) do begin
		agregarAtras(l,ult,n);
		n:= 100 + random(150-100)+1;
	end;
end;

procedure imprimirL(l:lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

procedure buscarElemento(l:lista; num:integer;var ok:boolean);
begin
	ok:= false;
	while (l <> nil) and (ok) do begin
		if (l^.dato = num) then
			ok:= true;
		l:= l^.sig;
	end;
end;

var
	l: lista;
	v: integer;
	ok : boolean;
begin
randomize;
l:= nil;
cargarL(l);
imprimirL(l);
writeln('ingrese valor a buscar');
readln(v);
ok:= false;
buscarElemento(l,v,ok);
if (ok) then
	writeln('no se encontro')
else
	writeln('se encontro');
end.
