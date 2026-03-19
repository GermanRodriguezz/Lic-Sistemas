program ejercicio1;
type venta= record
		dia:integer;
		cod: integer;
		cantVendida: integer;
	end;
vector = array [1..50] of venta;

ven = record
	cod: integer;
	cant: integer;
end;
lista = ^nodo;
nodo = record
	dato: ven;
	sig: lista;
end;

procedure cargarVector(var v:vector;var diml:integer);{A}
var
	ve: venta;
begin
		ve.dia := random(32);
		while (ve.dia <> 0) and (diml < 50)do begin
			diml:= diml + 1;
			ve.cod:= random(15)+1;
			writeln('ingrese cant vendida del prod');
			readln(ve.cantVendida);
			v[diml] := ve;
			ve.dia:= random(32);
		end;
end;

procedure impVec(v:vector; diml:integer);{B}
var
	i :integer;
begin
	for i:= 1 to diml do begin
		writeln(v[i].dia);
		writeln(v[i].cod);
		writeln(v[i].cantVendida);
		writeln('----------');
		write();
		end;
end;

procedure ordenar(v:vector; diml:integer);{C}
var
	pos,i,j:integer;
	item: venta;
begin
	for i:= 1 to diml+1 do begin
		pos:= i;
		for j:= i+1 to diml do
			if (v[j].cod < v[pos].cod) then
				pos := j;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;
end;

procedure imprimirVector(v:vector; diml:integer);{D}
var
	i:integer;
begin
	for i:= 1 to diml do begin
		writeln(v[i].cod);
		writeln(v[i].dia);
		writeln(v[i].cantVendida);
		writeln('-------');
	end;
end;

procedure generarEstructura(var l:lista; v: vector;diml:integer);
	procedure insertarOrd(var l:lista; v:venta);
	var
		aux,act,ant:lista;
	begin
		new(aux);
		aux^.dato.cod:= v.cod;
		aux^.dato.cant:= v.cantVendida;
		aux^.sig:= nil;
		if (l = nil) then
			l:= aux
		else begin
			ant:= l;
			act:= l;
			while (act <> nil) and (act^.dato.cod < aux^.dato.cod) do begin
				ant := act;
				act := act^.sig;
			end;
			if (act = l) then begin
				aux^.sig:= l;
				l:= aux;
			end
			else begin
				ant^.sig:= aux;
				aux^.sig:= act;
			end;
		end;
	end;
var
	i:integer;
begin
	for i := 1 to diml do begin
		if (v[i].cod mod 2 = 0) then
			insertarOrd(l,v[i]);
	end;
end;

procedure imprimirEstructura(l:lista);
begin
	while (l<>nil) do begin
		writeln('cod');
		writeln(l^.dato.cod);
		writeln('cant');
		writeln(l^.dato.cant);
		l:= l^.sig;
	end;
end;

var
	v:vector;
	diml:integer;
	l: lista;
begin
randomize;
diml:=0;
cargarVector(v,diml);
impVec(v,diml);
ordenar(v,diml);
imprimirVector(v,diml);
l:= nil;
generarEstructura(l,v,diml);
imprimirEstructura(l);
end.
