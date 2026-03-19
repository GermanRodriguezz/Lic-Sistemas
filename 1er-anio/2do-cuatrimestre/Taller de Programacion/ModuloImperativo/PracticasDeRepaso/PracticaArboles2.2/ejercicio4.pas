program ejer4;
type rangodia = 1..31;
rangomes = 1..12; 
prestamo = record
		isbn : integer;
		numerosocio : integer;
		dia : rangodia;
		mes : rangomes;
		cantdiaspres: integer;
	end;

infopres = record
	numsoc : integer;
	dia : rangodia;
	mes : rangomes;
	cdp : integer;
end;

listaPrestamos = ^nodolista;
nodolista = record
	dato : infopres;
	sig : listaPrestamos;
end;

info = record
	isbn : integer;
	lista: listaPrestamos;
end;

arboluno = ^nodoarboluno;
nodoarboluno = record
	dato :prestamo;
	hi : arboluno;
	hd : arboluno; 
end;

arboldos = ^nodoarboldos;
nodoarboldos = record
	dato : info;
	hi : arboldos;
	hd : arboldos;
end;

reg1 = record
	isbn : integer;
	cant : integer;
end;

listaF = ^nodolistaF;
nodolistaF = record
	dato : reg1;
	sig : listaF;
end;

procedure leerPrestamo(var p :prestamo);
begin
	p.isbn := random(150); writeln('num isbn es : ',p.isbn);
	if (p.isbn <> 0) then begin
		p.numerosocio := random(200)+1;
		p.dia := random(31)+1;
		p.mes := random(12)+1;
		p.cantdiaspres := random(15)+1;
	end;
end;

procedure insertar1(var a:arboluno; p:prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (p.isbn < a^.dato.isbn) then
			insertar1(a^.hi,p)
		else
			insertar1(a^.hd,p);
end;

procedure agregarEnLista(var l:listaPrestamos; p:prestamo);
var nue,aux:listaPrestamos;
begin
	new(nue);
	nue^.dato.numsoc := p.numerosocio;
	nue^.dato.dia := p.dia;
	nue^.dato.mes := p.mes;
	nue^.dato.cdp := p.cantdiaspres;
	nue^.sig := nil;
	if (l = nil) then
		l := nue
	else begin
		aux := l;
		while (aux^.sig <> nil) do 
			aux:= aux^.sig;
		aux^.sig := nue;
	end;	
end;

procedure insertar2(var a: arboldos; p:prestamo);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.isbn := p.isbn;
		a^.dato.lista := nil;
		agregarEnLista(a^.dato.lista,p);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (p.isbn = a^.dato.isbn) then
			agregarEnLista(a^.dato.lista,p)
		else if (p.isbn < a^.dato.isbn) then
				insertar2(a^.hi,p)
			else
				insertar2(a^.hd,p);
end;

procedure cargarArboles(var a1:arboluno; var a2:arboldos);
var
	p:prestamo;
begin
	leerPrestamo(p);
	while (p.isbn <> 0) do begin
		insertar1(a1,p);
		insertar2(a2,p);
		leerPrestamo(p);
	end;
end;

procedure sacarmaxA1(a:arboluno; var max:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.isbn > max) then
			max := a^.dato.isbn;
		sacarmaxA1(a^.hd,max);
	end;
end;

procedure sacarminA2(a:arboldos;var min:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.isbn > min) then
			min:= a^.dato.isbn;
		sacarminA2(a^.hi,min);
	end;
end;

procedure prestamosdelsocio1(a:arboluno; num:integer; var cantpres: integer);
begin
	if (a <> nil) then begin
		if (a^.dato.numerosocio = num) then
			cantpres := cantpres + 1;
		prestamosdelsocio1(a^.hi,num,cantpres);
		prestamosdelsocio1(a^.hd,num,cantpres);
	end;
end;

procedure busca(l:listaPrestamos; num:integer; var cant:integer);
begin
	while (l <> nil) do begin
		if (l^.dato.numsoc = num) then
			cant:= cant + 1;
		l:= l^.sig;
	end;
end;

procedure prestamosdelsocio2(a: arboldos; num:integer; var cantpres:integer);
begin
	if (a <> nil) then begin
		busca(a^.dato.lista,num,cantpres);
		prestamosdelsocio2(a^.hi,num,cantpres);
		prestamosdelsocio2(a^.hd,num,cantpres);
	end;
end;

procedure agregarAdelante(var lf:listaF; r: reg1);
var nue:listaF;
begin
	new(nue);
	nue^.dato := r;
	nue^.sig := lf;
	lf := nue;
end;

procedure actualizarCant(var l:listaF; r:reg1);
begin
	if (l <> nil) and (l^.dato.isbn =r.isbn) then
		l^.dato.cant := l^.dato.cant + 1
	else begin
		r.cant := 1;
		agregarAdelante(l,r)
	end;
end;

procedure generarEstructuraF(a:arboluno; var lf:listaF);
var r:reg1;
begin
	if (a <> nil) then begin
		generarEstructuraF(a^.hd,lf);
		r.isbn := a^.dato.isbn;
		actualizarCant(lf,r);
		generarEstructuraF(a^.hi,lf)
	end;
end;

procedure generarEstructuraG(a: arboldos; var lg:listaF);
var r:reg1; aux:listaPrestamos;
begin
	if (a <> nil) then begin
		generarEstructuraG(a^.hd,lg);
		r.isbn := a^.dato.isbn;
		r.cant := 0;
		aux := a^.dato.lista;
		while (aux <> nil) do begin
			r.cant := r.cant + 1;
			aux := aux^.sig;
		end;
		agregarAdelante(lg,r);
		generarEstructuraG(a^.hi,lg);
	end;
end;

procedure imprimirG(l:listaF);
begin
	if (l <> nil) then begin
		writeln('isbn : ',l^.dato.isbn);
		writeln('cant : ',l^.dato.cant);
		imprimirG(l^.sig);
	end;
end;

var
a1: arboluno;
a2: arboldos;
lf : listaF;
lg : listaF;
cant,num:integer;
min,max:integer;
begin
randomize;
a1 := nil;
a2 := nil;
lf := nil;
lg := nil;
cargarArboles(a1,a2);

sacarmaxA1(a1,max);
writeln('el isbn mas grande es : ', max);

sacarminA2(a2,min);
writeln('el isbn mas chico es : ', min);

writeln('numero de socio a buscar');
readln(num);
prestamosdelsocio1(a1,num,cant);
writeln('los prestamos al socio ' ,num, ' son : ' ,cant);

writeln('numero de socio a buscar 2');
readln(num);
prestamosdelsocio2(a2,num,cant);
writeln('los prestamos al socio ',num, ' son ' , cant);

generarEstructuraF(a1,lf);
generarEstructuraG(a2,lg);
writeln('imprimira la lista G');
imprimirG(lg);
end.
