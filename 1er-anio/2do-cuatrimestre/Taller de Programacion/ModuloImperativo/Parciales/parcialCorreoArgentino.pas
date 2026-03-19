program parcial;
type envio = record
	codigocliente : integer;
	dia : integer;
	codpostal: integer;
	pesopaquete: real;
end;

envio2 = record
	codcli: integer;
	dia : integer;
	pesop: real;
end;

infolista = ^nodolista;
nodolista = record
	dato : envio2;
	sig : infolista;
end;

info = record
	codp: integer;
	lista: infolista;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

procedure leerEnvio(var e:envio);
begin
	e.codigocliente := random(10000);
	if (e.codigocliente <> 0) then begin
		e.codpostal := random(200)+1;
		e.dia := random (30)+1;
		e.pesopaquete := random(20000)/(random(10)+1);
	end;
end;

procedure agregarEnLista(var l:infolista;e:envio2);
var nue : infolista;
begin
	new(nue);
	nue^.dato := e;
	nue^.sig := l;
	l := nue;
end;

procedure insertar(var a:arbol; e:envio);
var e2: envio2;
begin
	if (a = nil) then begin
		new(a);
		a^.dato.codp := e.codpostal;
		a^.dato.lista := nil;
		e2.codcli := e.codigocliente;
		e2.dia := e.dia;
		e2.pesop := e.pesopaquete;
		agregarEnLista(a^.dato.lista,e2);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.codp = e.codpostal) then begin
			e2.codcli := e.codigocliente;
			e2.dia := e.dia;
			e2.pesop := e.pesopaquete;
			agregarEnLista(a^.dato.lista,e2);
		end
		else if (a^.dato.codp > e.codpostal) then
				insertar(a^.hi,e)
			else
				insertar(a^.hd,e);
end;
procedure cargarArbol(var a:arbol);
var e:envio;
begin
	leerEnvio(e);
	while (e.codigocliente <> 0 ) do begin
		insertar(a,e);
		leerEnvio(e);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.codp);
		imprimirOrd(a^.hd);
	end;
end;

procedure moduloB(a:arbol; codigo:integer; var ln: infolista);
begin
	if (a <> nil) then begin
		if (a^.dato.codp = codigo) then
			ln := a^.dato.lista
		else if (a^.dato.codp > codigo) then
			moduloB(a^.hi,codigo,ln)
			else
				moduloB(a^.hd,codigo,ln);
	end;
end;

procedure imprimirEnvios(l: infolista);
begin
	if (l <> nil) then begin
		writeln('cliente ',l^.dato.codcli, ' dia ', l^.dato.dia, ' peso ', l^.dato.pesop:3:2);
		imprimirEnvios(l^.sig);
	end;
end;

procedure moduloC(l: infolista;var codmin: integer; var codmax:integer;var min,max:real);
begin
	if (l <> nil) then begin
		if (l^.dato.pesop > max) then begin
			max := l^.dato.pesop;
			codmax := l^.dato.codcli;
		end;
		if (l^.dato.pesop < min) then begin
			min := l^.dato.pesop;
			codmin := l^.dato.codcli;
		end;
		moduloC(l^.sig,codmin,codmax,min,max);
	end;
end;

var
a:arbol;
ln : infolista;
codigo : integer;
min,max: real;
codmin,codmax: integer;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('imprimira arbol ordenado por cod postales');
imprimirOrd(a);


writeln('ingresar un cod postal');
readln(codigo);
moduloB(a,codigo,ln);
writeln('imprimira los envios del codigo postal ', codigo);
imprimirEnvios(ln);


min := 9999; max := -1;
moduloC(ln,codmin,codmax,min,max);
writeln('el cod del envio con menor peso fue ',codmin);
writeln('el cod del envio con mayor peso fue ',codmax);
end.
