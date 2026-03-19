program ejercicio2;

type auto = record
	patente : integer;
	anio : integer;
	marca : string;
	modelo : string;
end;

reglista = record
	patente : integer;
	anio : integer;
	modelo : string;
end;

lista = ^nodolista;
nodolista = record
	dato : reglista;
	sig : lista;
end;

reg2 = record
	marca: string;
	listademarca : lista;
end;

registro = record
	anio : integer;
	marca : string;
	modelo : string;
end;

reg1 = record
	patente : integer;
	dato : registro;
end;

arboluno = ^nodo1;
nodo1 = record
	dato1 : reg1;
	hi: arboluno;
	hd: arboluno;
end;

arboldos = ^nodo2;
nodo2 = record
	dato2 : reg2;
	hi : arboldos;
	hd : arboldos;
end;

reg3 = record
	patente: integer;
	marca: string;
	modelo: string;
end;

lista3 = ^nodolista3;
nodolista3 = record
	dato : reg3;
	sig : lista3;
end;

dato3 = record
anio : integer;
lista : lista3;
end;

arboltres = ^nodotres;
nodotres = record
	dato : dato3;
	hi: arboltres;
	hd: arboltres;
end;

procedure leerauto(var a: auto);
begin
	writeln('ingrese una marca'); readln(a.marca);
	if a.marca <> 'MMM' then begin
		a.patente := 100 + random(100)+1; writeln('patente', a.patente);
		a.anio := 2000 + random(26); writeln('anio ', a.anio);
		writeln('ingrese el modelo'); readln(a.modelo);
	end;
end;

procedure insertar1(var a : arboluno; at: auto);
var
	reg: registro;
begin
	if a = nil then begin
	new (a);
	a^.dato1.patente := at.patente;
	reg.anio := at.anio;
	reg.marca := at.marca;
	reg.modelo := at.modelo;
	a^.dato1.dato := reg;
	a^.hi := nil;
	a^.hd := nil;
	end
	else if a^.dato1.patente > at.patente then
		insertar1(a^.hi,at)
			else
				insertar1(a^.hd,at);
end;

procedure agregarLista(var l: lista; r: reglista);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := r;
	nue^.sig:= l;
	l:= nue;
end;

procedure insertar2(var a: arboldos; at: auto);
var
	r : reglista;
begin
	if a = nil then begin 
	new(a);
	a^.dato2.marca := at.marca;
	a^.dato2.listademarca := nil;
	r.patente := at.patente;
	r.anio := at.anio;
	r.modelo := at.modelo;
	agregarLista(a^.dato2.listademarca, r);
	a^.hi := nil;
	a^.hd := nil;
	end
	else if a^.dato2.marca = at.marca then begin
			r.patente := at.patente;
			r.anio := at.anio;
			r.modelo := at.modelo;
			agregarLista(a^.dato2.listademarca, r);
	end
		else if a^.dato2.marca > at.marca then
			insertar2(a^.hi,at)
			else
				insertar2(a^.hd,at);
end;

procedure cargarArboles(var a: arboluno; var a2: arboldos);
var
	at: auto;
begin
	leerauto(at);
	while (at.marca <> 'MMM') do begin
		insertar1(a,at);
		insertar2(a2,at);
		leerauto(at);
	end;
end;

procedure buscarMarcaA1(a: arboluno; marca : string; var cant: integer);
begin
	if a <> nil then begin
		if a^.dato1.dato.marca = marca then
			cant := cant +1;
		buscarMarcaA1(a^.hi,marca,cant);
		buscarMarcaA1(a^.hd,marca,cant);
	end;
end;

procedure recorre (l: lista; var cant: integer);
begin
	while l <> nil do begin
		cant := cant +1;
		l:= l^.sig;
	end;
end;

procedure buscarMarcaA2(a: arboldos; marca: string; var cant:integer);
begin
	if a <> nil then begin
		if a^.dato2.marca = marca then
			recorre(a^.dato2.listademarca,cant)
			else begin
				buscarMarcaA2(a^.hi,marca,cant);
				buscarMarcaA2(a^.hd,marca,cant);
			end;
	end;
end;

procedure agregarListaa3(var l3:lista3; r3: reg3);
var nue:lista3;
begin
	new(nue);
	nue^.dato := r3;
	nue^.sig := l3;
	l3:= nue;
end;

procedure insertar3(r: reg1;var a3: arboltres);
var
	r3: reg3;
begin
	if a3 = nil then begin
		new(a3);
		a3^.dato.anio := r.dato.anio;
		a3^.dato.lista := nil;
		r3.patente := r.patente;
		r3.marca := r.dato.marca;
		r3.modelo := r.dato.modelo;
		agregarListaa3(a3^.dato.lista,r3);
		a3^.hi := nil;
		a3^.hd := nil;
	end
	else if a3^.dato.anio = r.dato.anio then begin
		r3.patente := r.patente;
		r3.marca := r.dato.marca;
		r3.modelo := r.dato.modelo;
		agregarListaa3(a3^.dato.lista,r3);
		end
		else if a3^.dato.anio > r.dato.anio then
			insertar3(r,a3^.hi)
			else
				insertar3(r,a3^.hd);
end;

procedure generarA3(a: arboluno; var a3: arboltres);
begin
	if a <> nil then begin
		insertar3(a^.dato1,a3);
		generarA3(a^.hi,a3);
		generarA3(a^.hd,a3);
	end;
end;

function buscarpat(a: arboluno; pat: integer): string;
begin
	if a <> nil then begin
		if a^.dato1.patente = pat then
			buscarpat:= a^.dato1.dato.modelo
		else if a^.dato1.patente > pat then	
				buscarpat := buscarpat(a^.hi,pat)
				else
					buscarpat := buscarpat(a^.hd,pat);
	end;
end;

procedure busca (l: lista; pat : integer;var mode:string; var ok:boolean);
begin
	while (l <> nil) and (not ok) do begin
		if l^.dato.patente <> pat then
			l := l^.sig
		else begin
			ok := true;
			mode := l^.dato.modelo;
		end;
	end;
end;

function buscarpat2(a: arboldos; pat: integer): string;
var
	l: lista; mode : string; ok: boolean;
begin
	ok := false;
	if a <> nil then begin
		l := a^.dato2.listademarca;
		busca(l,pat,mode,ok);
		if ok = true then
			buscarpat2 := mode
			else begin
				buscarpat2 := buscarpat2(a^.hi,pat);
				buscarpat2:= buscarpat2(a^.hd,pat);
			end;
	end;
end;

var
a1: arboluno;
a2: arboldos;
a3: arboltres;
marca,marca2 : string;
cant, cant2,pat,pat2 : integer;
begin

randomize;
a1 := nil;
a2 := nil;
cargarArboles(a1,a2);

writeln('ingrese marca a buscar');readln(marca);
cant :=  0;
buscarMarcaA1(a1,marca,cant);
writeln('la cantidad de autos encontrados de la marca ', marca , 'son ' , cant);

writeln('ingrese marca buscar 2'); readln(marca2);
cant2:= 0;
buscarMarcaA2(a2,marca2,cant2);
writeln('la cantidad de autos encontrados de la marca ', marca2 , 'son ' , cant2);

generarA3(a1,a3);

writeln('ingrese una patente a buscar'); readln(pat);
writeln('el modelo del auto con la patente ',pat , ' es ', buscarpat(a1,pat));


writeln('ingrese otra patente a buscar'); readln(pat2);
writeln('el modelo del auto con la patente ', pat2, ' es ',buscarpat2(a2,pat2));


end.
