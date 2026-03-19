program ejer3;
type finales = record
		legajo : integer;
		codigomateria: integer;
		fecha : integer;
		nota : integer;
	end;

info = record
	codmat : integer;
	fec: integer;
	nota: integer;
end;

listaFinal = ^nodolista;
nodolista = record
	dato : info;
	sig : listaFinal;
end;

infofinal = record
	lega : integer;
	lista : listaFinal;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : infofinal;
	hi : arbol;
	hd : arbol;
end;

regnuevo = record
	legajo : integer;
	promedio : real;
end;

listaNueva = ^nodonuevo;
nodonuevo = record
	dato : regnuevo;
	sig : listaNueva;
end;

procedure leerFinal(var f: finales);
begin
	writeln('ingresar legajo de alumno');
	readln(f.legajo);
	if (f.legajo <> 0 ) then begin
		writeln('ingresar cod materia');
		readln(f.codigomateria);
		writeln('ingresar fecha');
		readln(f.fecha);
		writeln('ingresar nota obtenida');
		readln(f.nota);
	end;
end;

procedure agregarEnLista(var l :listaFinal;f:finales);
var aux:listaFinal;
begin
	new(aux);
	aux^.dato.codmat := f.codigomateria;
	aux^.dato.fec := f.fecha;
	aux^.dato.nota := f.nota;
	aux^.sig := nil;
	if (l = nil) then
		l := aux
	else begin
		aux := l;
		while (aux^.sig <> nil) do 
			aux := aux^.sig;
		aux^.sig := aux;
	end;
end;

procedure insertar(var a:arbol;f: finales);
var aux:arbol;
begin
	if (a = nil) then begin
		new(aux);
		aux^.dato.lega := f.legajo;
		aux^.dato.lista := nil;
		agregarEnLista(aux^.dato.lista,f);
		aux^.hi := nil;
		aux^.hd := nil;
		a := aux; 
	end
	else if (f.legajo = a^.dato.lega) then
			agregarEnLista(a^.dato.lista,f)
		else if (f.legajo < a^.dato.lega) then
				insertar(a^.hi,f)
			else
				insertar(a^.hd,f);
end;

procedure cargarArbol(var a:arbol);
var f:finales;
begin
	leerFinal(f);
	while (f.legajo <> 0) do begin
		insertar(a,f);
		leerFinal(f);
	end;
end;

procedure legajosimpares(a:arbol; var cant:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.lega mod 2 = 1) then
			cant := cant + 1;
		legajosimpares(a^.hi,cant);
		legajosimpares(a^.hd,cant);
	end;
end;

function aprobo(l:listaFinal): integer;
var cantidad:integer;
begin
	cantidad :=0;
	while (l <> nil) do begin
		if (l^.dato.nota >= 4) then
			cantidad := cantidad + 1;
		l := l ^.sig;
	end;
	aprobo := cantidad;
end;

procedure finalesA(a: arbol);
begin
	if (a <> nil) then begin
		writeln('alumno : ',a^.dato.lega,'aprobo ' ,aprobo(a^.dato.lista));
		writeln('');
		finalesA(a^.hi);
		finalesA(a^.hd);
	end;
end;

procedure agregarEnLista2(var l:listaNueva; rn:regnuevo);
var nue:listaNueva;
begin
	new (nue);
	nue^.dato := rn;
	nue^.sig := l;
	l := nue;
end;

procedure sacarprom(l:listaFinal; var prom:real);
var cant,nota:integer;
begin
	cant := 0;
	nota := 0;
	while (l <> nil) do begin
		cant := cant + 1;
		nota  := nota + l^.dato.nota;
		l:= l^.sig;
	end;
	prom := nota/cant;
end;

procedure cumplenprom(a:arbol; var ln:listaNueva; prom:real);
var rn: regnuevo; p: real;
begin
	if (a <> nil) then begin
		sacarprom(a^.dato.lista,p);
		if (p > prom) then begin
			rn.legajo := a^.dato.lega;
			rn.promedio := p;
			agregarEnLista2(ln,rn)
		end;
		cumplenprom(a^.hi,ln,prom);
		cumplenprom(a^.hd,ln,prom);
	end;
end;

procedure imprimirListaNueva(ln: listaNueva);
begin
	while (ln <> nil) do begin	
		writeln('el alumno de legajo ', ln^.dato.legajo, 'tiene promedio ', ln^.dato.promedio:2:2);
		ln := ln^.sig;
	end;
end;

var
a:arbol;
cantimp:integer;
prom:real;
ln: listaNueva;
begin
a:= nil;
cargarArbol(a);

cantimp :=0;
legajosimpares(a,cantimp);
writeln('los legajos impares son : ',cantimp);

finalesA(a);

writeln('ingrese promedio a superar');
readln(prom);
cumplenprom(a,ln,prom);
imprimirListaNueva(ln);
end.
