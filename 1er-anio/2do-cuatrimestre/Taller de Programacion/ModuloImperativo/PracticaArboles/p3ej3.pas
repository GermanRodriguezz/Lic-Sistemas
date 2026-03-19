program arboles3;

type notas = 1..10;
info = record
	legajo : integer;
	codmateria : integer;
	fecha : integer;
	nota : notas;
end;

info2 = record
	cmat : integer;
	fech : integer;
	notaa : notas;
end;

lista = ^nodo;
nodo = record
dato : info2;
sig : lista;
end;

alumno = record
lega : integer;
finales : lista;
end;

arbol = ^nodoArbol;
nodoArbol = record
dato : alumno;
hi : arbol;
hd : arbol;
end;

procedure leerInformacion (var i : info);
begin
	writeln('ingrese el legajo'); readln(i.legajo);
	if i.legajo <> 0 then begin
		writeln('ingrese la materia'); readln(i.codmateria);
		writeln('ingrese la fecha'); readln(i.fecha);
		writeln('ingrese la nota'); readln(i.nota);
	end;
end;
procedure agregarAlaLista(var l:lista; i: info2);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := i;
	nue^.sig :=l;
	l := nue;
end;
procedure insertar(var a : arbol; i : info);
var 
	i2 : info2;
begin
	if a = nil then begin
		new(a);
		a^.dato.lega := i.legajo;
		a^.dato.finales := nil;
		i2.cmat := i.codmateria;
		i2.fech := i.fecha;
		i2.notaa := i.nota;
		agregarAlaLista(a^.dato.finales,i2);
		a^.hi := nil;
		a^.hd := nil;
	end
	else begin
		if a^.dato.lega = i.legajo then begin
			i2.cmat := i.codmateria;
			i2.fech := i.fecha;
			i2.notaa := i.nota;
			agregarAlaLista(a^.dato.finales,i2);
			end
			else if a^.dato.lega > i.legajo then
				insertar(a^.hi,i)
				else
					insertar(a^.hd,i);
	end;
end;

procedure cargarArbol(var a :arbol);
var
	i: info;
begin
	leerInformacion(i);
	while i.legajo <> 0 do begin
		insertar(a,i);
		leerInformacion(i);
	end;
end;

procedure legasimpares(a: arbol; var cantidad: integer);
begin
	if a <> nil then begin
		if a^.dato.lega mod 2 = 1 then 
			cantidad := cantidad + 1;
		legasimpares(a^.hi,cantidad);
		legasimpares(a^.hd,cantidad);
		end;
end;

function cantAprobo(l: lista): integer;
var 
	aprobo: integer;
begin
	aprobo:= 0;
	while l <> nil do begin
			if l^.dato.notaa > 3 then
				aprobo := aprobo + 1;
			l:= l^.sig;
	end;
	 cantAprobo:= aprobo;
end;

procedure finalesA(a: arbol);
begin
	if a <> nil then begin
		writeln('el alumno ',a^.dato.lega, 'aprobo ', cantAprobo(a^.dato.finales));
		
		finalesA(a^.hi);
		finalesA(a^.hd);
	end;
end;

procedure promedio(l: lista; var promalu: real);
var
	cantfinales,total: integer;
begin
	cantfinales:= 0; total:= 0;
	while l <> nil do begin
		cantfinales := cantfinales + 1;
		total := total + l^.dato.notaa;
		l:=l^.sig;
	end;
	if cantfinales <> 0 then
		promalu := total/cantfinales
		else
			promalu := 0;
end;

procedure promedios(a: arbol; valor: real);
var
	pr: real;
begin
	if a <> nil then begin
		pr := 0;
		promedio(a^.dato.finales,pr);
		if pr > valor then
			writeln('el promedio del alumno',a^.dato.lega,'es de ',pr:2:2)
			else
				writeln('el promedio del alumno ',a^.dato.lega, 'no supera');
		promedios(a^.hi,valor);
		promedios(a^.hd,valor);
	end;
end;

var
a : arbol;
cant: integer;
valor : real;

begin
a := nil;
cargarArbol(a);

cant := 0;
legasimpares(a,cant);
	writeln('la cantidad de legajos impares son ',cant);

finalesA(a);

writeln('ingrese un valor real '); readln(valor);
promedios(a,valor);
end.
