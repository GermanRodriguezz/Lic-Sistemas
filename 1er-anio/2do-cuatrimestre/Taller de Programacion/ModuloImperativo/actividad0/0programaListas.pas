program listas;
type lista = ^nodo;

nodo = record
dato : integer;
sig : lista;
end;

procedure agregaratras(var l,ult:lista;num:integer);
var
	nue:lista;
begin
	new(nue);nue^.dato:=num;nue^.sig:=nil;
	if(l=nil)then
		l:=nue
	else
		ult^.sig:=nue;
	ult:=nue;
end;

procedure cargarL(var l: lista);
var
min,max,n: integer;
ult : lista;
begin
	writeln('Ingrese el minimo'); readln(min);
	writeln('Ingrese el maximo'); readln(max);
	n := random(max-min+1)+min;
	while n <> 120 do begin
		agregaratras(l,ult,n);
		n := random(max-min+1)+min;
	end;
end;

procedure imprimir (l:lista);
begin
	while l <> nil do begin
		writeln(l^.dato);
		l := l^.sig;
	end;
end;

function buscar(l:lista; valor: integer):boolean;
var
	ok : boolean;
begin
	ok := false;
	while (l <> nil)AND(not ok) do begin
		if (l^.dato = valor) then
			ok := true;
		l := l^.sig;
	end;
	buscar := ok;
end;

var
l : lista;
v : integer;
begin
randomize;

l := nil;

cargarL(l);

imprimir(l);

writeln('Ingrese un valor a buscar'); readln(v);
if buscar(l,v)then
	writeln('Se encontro el valor')
else
	writeln('No se encontro el valor');
end.
