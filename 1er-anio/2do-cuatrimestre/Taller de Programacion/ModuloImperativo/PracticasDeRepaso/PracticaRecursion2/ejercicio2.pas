program ejer2;
type lista = ^nodo;
nodo = record
	dato: integer;
	sig: lista;
end;

procedure agregar(var l:lista; n:integer);
var nue: lista;
begin
	new(nue);
	nue^.dato := n;
	nue^.sig := l;
	l:= nue;
end;

procedure generarLista(var l:lista);
var n:integer;
begin
	n := 100 + random (200-100) + 1;
	if (n <> 100) then begin
		agregar(l,n);
		generarLista(l);
	end;
end;

procedure impListaRec(l:lista);
begin
	if (l <> nil) then begin
		writeln(l^.dato);
		impListaRec(l^.sig);
	end;
end;

procedure impListaInv(l:lista);
begin
	if (l <> nil) then begin
		impListaInv(l^.sig);
		writeln(l^.dato);
	end;
end;

procedure sacarMin(l:lista; var min:integer);
begin
	if (l <> nil) then begin
		if (l^.dato < min) then
			min:= l^.dato;
		sacarMin(l^.sig,min);
	end;
end;

function buscarValor(l:lista; v:integer): boolean;
begin
	if (l = nil) then
		buscarValor := false
	else
		if (l^.dato = v) then
			buscarValor := true
		else
			buscarValor := buscarValor(l^.sig,v);
end;

var
l:lista;
ok: boolean;
min,v: integer;
begin
randomize;
l:= nil;
generarLista(l);
writeln('imprimira lista normal');
impListaRec(l);
writeln('imprimira lista inversa');
impListaInv(l);
min:= 9999;
sacarMin(l,min);
writeln('el valor minimo de la lista es : ',min);
writeln('ingresar valor a buscar..');
readln(v);
ok := buscarValor(l,v);
if (ok) then
	writeln('se encontro')
else
	writeln('no se encontro');
end.
