program ejer4;
type 
reclamo = record
	codigo : integer;
	dni: integer;
	anio : integer;
	tipo : integer;
end;

recla = record
	codigo: integer;
	anio : integer;
	tipo: integer;
end;

listaReclamo = ^nodolistaReclamo;
nodolistaReclamo = record
	dato : recla;
	sig : listaReclamo;
end;

info = record
	dni : integer;
	cantRe: integer;
	lista: listaReclamo;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato: info;
	hi : arbol;
	hd : arbol;
end;

reg1 = record
	dni : integer;
	cant: integer;
end;

lista2 = ^nodolista;
nodolista = record
	dato : reg1;
	sig : lista2;
end;

lista3 = ^nodolista3;
nodolista3 = record
	cod : integer;
	sig : lista3;
end;

procedure leerReclamo(var r:reclamo);
begin
	r.codigo := random(500);
	if (r.codigo <> 0) then begin
		r.dni := 1000+ random(1500);
		r.anio := 2020 + random(4);
		r.tipo := random(10)+1;
	end;
end;

procedure agregarEnLista(var l:listaReclamo; r:reclamo);
var nue: listaReclamo;
begin
	new(nue);
	nue^.dato.codigo  := r.codigo;
	nue^.dato.anio := r.anio;
	nue^.dato.tipo := r.tipo;
	nue^.sig := l;
	l :=  nue;
end;

procedure insertar(var a: arbol; r:reclamo);
begin
	if (a = nil ) then begin
		new(a);
		a^.dato.dni := r.dni;
		a^.dato.cantRe := 1;
		a^.dato.lista := nil;
		agregarEnLista(a^.dato.lista,r);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.dni = r.dni) then begin
			a^.dato.cantRe := a^.dato.cantRe + 1;
			agregarEnLista(a^.dato.lista,r);
		end
		else if (a^.dato.dni > r.dni) then
			insertar(a^.hi,r)
			else
				insertar(a^.hd,r);
end;

procedure cargarArbol(var a :arbol);
var r:reclamo;
begin
	leerReclamo(r);
	while (r.codigo <> 0) do begin
		insertar(a,r);
		leerReclamo(r);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.dni);
		imprimirOrd(a^.hd);
	end;
end;

procedure cantReclamosDni(a:arbol; dni: integer;var cant:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.dni = dni) then
			cant := a^.dato.cantRe
		else if (a^.dato.dni > dni) then
			cantReclamosDni(a^.hd,dni,cant)
			else
				cantReclamosDni(a^.hd,dni,cant);
	end;
end;

procedure agregarEnLista2(var l:lista2; r:reg1);
var nue: lista2;
begin
	new(nue);
	nue^.dato := r;
	nue^.sig := l;
	l := nue;
end;

procedure cantidadEntreValores(a:arbol; d1,d2:integer; var ln: lista2);
var r: reg1;
begin
	if (a <> nil) then begin
		if (d1 < a^.dato.dni) then
			if (d2 > a^.dato.dni) then begin
				r.dni := a^.dato.dni;
				r.cant := a^.dato.cantRe;
				agregarEnLista2(ln,r);
				cantidadEntreValores(a^.hi,d1,d2,ln);
				cantidadEntreValores(a^.hd,d1,d2,ln);
			end
			else
				cantidadEntreValores(a^.hi,d1,d2,ln)
		else
			cantidadEntreValores(a^.hd,d1,d2,ln);
	end;
end;

procedure retornarLosDni(l:lista2);
begin
	if (l <> nil) then begin
		writeln('la cantidad de reclamos del dni ',l^.dato.dni , ' son ' , l^.dato.cant);
		retornarLosDni(l^.sig);
	end;
end;

procedure agg(var l:lista3; cod: integer);
var nue: lista3;
begin
	new(nue);
	nue^.cod := cod;
	nue^.sig := l;
	l := nue;
end;

procedure recorre(l:listaReclamo;anio:integer;  var ln:lista3);
begin
	if (l <> nil) then begin
		if (l^.dato.anio = anio) then
			agg(ln,l^.dato.codigo);	
		recorre(l^.sig,anio,ln);
	end;
end;

procedure retornarCodDelAnio(a:arbol; anio: integer; var l:lista3);
var lista: listaReclamo;
begin
	if (a <> nil) then begin
		lista:= a^.dato.lista;
		recorre(lista,anio,l);
		retornarCodDelAnio(a^.hi,anio,l);
		retornarCodDelAnio(a^.hd,anio,l)
	end;
end;

procedure retorarL3(l:lista3; anio:integer);
begin
	
	if (l <> nil) then begin
		writeln('el codigo ', l^.cod , 'realizo un reclamo en el año ', anio);
		retorarL3(l^.sig,anio);
	end;
end;

var
a:arbol;
dni,cantidad,d1,d2,anio:integer;
l2: lista2;
l3: lista3;
begin
randomize;
cargarArbol(a);
imprimirOrd(a);


writeln('ingrese dni');
readln(dni);
cantReclamosDni(a,dni,cantidad);
writeln('la cantidad de reclamos del dni : ',dni, ' es ', cantidad);

writeln('ingrese los dos dni ');
readln(d1);
readln(d2);
cantidadEntreValores(a,d1,d2,l2);
retornarLosDni(l2);

writeln('ingrese anio');
readln(anio);
retornarCodDelAnio(a,anio,l3);
retorarL3(l3,anio);
end.
