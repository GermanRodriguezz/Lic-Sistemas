program act4;
type
	lista = ^nodo;
	nodo = record
	dato: integer;
	sig: lista;
	end;

procedure insertarOrd(var l :lista; n:integer);
var
	aux,act,ant:lista;
begin
	new(aux);
	aux^.dato := n;
	aux^.sig := nil; 
	if (l = nil) then
		l:= aux
	else begin
		act:= l;
		ant:= l;
		while (act <> nil) and (act^.dato < aux^.dato) do begin
			ant:= act;
			act := act^.sig;
		end;
		if (l = act) then begin
			aux^.sig:= l;
			l:= aux
		end
		else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;
end;

procedure cargarL(var l:lista);
var
	n:integer;
begin
	n := 100 + random(150-100)+1;
	while (n <> 120) do begin
		insertarOrd(l,n);
		n := 100 + random(150-100)+1;
	end;
end;

procedure imprimirL(l:lista);
begin
	while (l<>nil) do begin
		writeln (l^.dato);
		l:= l^.sig;
	end;
end;

function buscarElem(l:lista; num:integer):boolean;
var
	ok:boolean;
begin
ok:= false;
	while (l<> nil) and (not ok) do begin
		if (l^.dato = num) then
			ok:= true;
		l:= l^.sig;
	end;
	buscarElem:= ok;
end;

var l:lista;
	n:integer;
	ok:boolean;
begin
randomize;
l:= nil;
cargarL(l);
imprimirL(l);
writeln('ingrese num a buscar');
readln(n);
ok := buscarElem(l,n);
if (ok = false) then
	writeln('no se encontro')
else
	writeln('se encontro');
end.
