program repaso;

type compra = record
	codcli: integer;
	dia : integer;
	cantprodu: integer;
	monto: real;
end;

reglista = record
	dia : integer;
	cant: integer;
	monto: real;
end;

lista = ^nodolista;
nodolista = record
	dato : reglista;
	sig: lista;
end;

reg1 = record
	cod: integer;
	listacompra: lista;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : reg1;
	hi: arbol;
	hd: arbol;
end;

procedure leercompra(var c: compra);
begin
	c.cantprodu := random(10); writeln('los productos son', c.cantprodu);
	if c.cantprodu <> 0 then begin
		c.dia := random(31)+1; writeln('el dia fue ',c.dia);
		c.codcli:= random(9)+1; writeln('el cod de cliente es ', c.codcli);
		c.monto := random(8000)+150.80; writeln('el monto es ', c.monto:0:2);
	end;
end;

procedure agregar(VAR l: lista; r:reglista);
var
	nue: lista;
begin
	new(nue);
	nue^.dato:= r;
	nue^.sig := l;
	l:= nue;
end;

procedure insertar(var a: arbol; c:compra);
var
	regl: reglista;
begin
	if a = nil then begin
		new(a);
		a^.dato.cod := c.codcli;
		a^.dato.listacompra := nil;
		regl.dia:=c.dia;
		regl.cant:=c.cantprodu;
		regl.monto:=c.monto;
		agregar(a^.dato.listacompra,regl);
		a^.hi:= nil;
		a^.hd:= nil;
	end
	else begin
		if a^.dato.cod = c.codcli  then
			agregar(a^.dato.listacompra,regl)
			else if a^.dato.cod > c.codcli then
				insertar(a^.hi,c)
				else
					insertar(a^.hd,c);
	end;
end;

procedure cargararbol(var a:arbol);
var
	c: compra;
begin
	leercompra(c);
	while c.cantprodu <> 0 do begin
		insertar(a,c);
		leercompra(c);
	end;
end;

procedure incisoB(a : arbol; cliente: integer; var ln: lista);
begin
	if a <> nil then begin
		if a^.dato.cod = cliente then
			ln := a^.dato.listacompra
		else
			if a^.dato.cod > cliente then
				incisoB(a^.hi,cliente,ln)
			else
				incisoB(a^.hd,cliente,ln);
	end;
		
end;

procedure incisoC(ln: lista; var monto:real; var max: integer);
var
	prod: integer;
begin
	if ln <> nil then begin
		prod := ln^.dato.cant;
		if prod > max then begin
			max := prod;
			monto := ln^.dato.monto;
		end;
		incisoC(ln^.sig,monto,max);
	end;
end;


var
a: arbol;
ln : lista;
cliente : integer;
monto: real;
max: integer;
begin
randomize;
a := nil;
cargararbol(a);

ln:= nil;
writeln('ingrese un codigo de cliente'); readln(cliente);
incisoB(a,cliente,ln);
while (ln <> nil) do begin
	writeln(ln^.dato.monto:0:2);
	ln:=ln^.sig;
end;

max:= -1;
incisoC(ln,monto,max);
writeln('el monto de la compra con mayor cantidad de productos del cliente ',cliente, ' es ', monto);
end.
