program actividad4;
type lista = ^nodo;
	nodo = record
	dato: integer;
	sig: lista;
	end;

procedure insertarord(var l:lista; n : integer);
var
ant,act,nue: lista;
begin
	new(nue);
	nue^.dato:= n;
	act := l;
	while (act <> nil) and (act^.dato < n) do begin
		ant := act;
		act := act^.sig;
	end;
	if (l = act) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig:= act;
end;

procedure cargarL(var l:lista);
var
	inf,sup,n:integer;
begin
	writeln('Ingrese el numero inferior'); readln(inf);
	writeln('Ingrese el numero superior'); readln(sup);
	n := random(sup-inf+1)+inf;
	while (n <> 120) do begin
		insertarord(l,n);
		n := random(sup-inf+1)+inf;
	end;
end;

procedure imprimirL(l:lista);
begin
	while (l <> nil) do begin
		writeln(l^.dato);
		l:= l^.sig;
	end;
end;

function buscar(l:lista; n: integer): boolean;
var
	ok: boolean;
begin
	ok:= false;
		while (l <> nil) and (not ok) do begin
			if (l^.dato = n) then
				ok := true;
			l := l^.sig;
		end;
	buscar := ok; 
end;

var
l : lista;
valor : integer;
begin
l := nil;

cargarL(l);

imprimirL(l);

writeln('Ingrese un valor a buscar'); readln(valor);

if (buscar(l,valor)) then
	writeln('Se encontro el valor a buscar!')
else
	writeln('No se encontro el valor a buscar!');
end.
