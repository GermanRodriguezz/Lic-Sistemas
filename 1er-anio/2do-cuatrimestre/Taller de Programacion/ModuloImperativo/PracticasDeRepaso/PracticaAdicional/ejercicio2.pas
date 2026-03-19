program ejer2;
type
rangoanios = 2010..2018;
 autos = record
	patente : integer;
	aniofabricacion : rangoanios;
	marca : string;
	modelo : string;
 end;

arboluno = ^nodoarboluno;
nodoarboluno = record
	dato : autos;
	hi : arboluno;
	hd : arboluno;
end;

infoauto = record
	patente : integer;
	aniofabri : integer;
	modelo : string;
end;

listaMarca = ^nodolista;
nodolista = record
	dato : infoauto;
	sig : listaMarca;
end;

autos2 = record
marca : string;
lista : listaMarca;
end;

arboldos = ^nodoarboldos;
nodoarboldos = record
	dato : autos2;
	hi : arboldos;
	hd : arboldos;
end;

infoauto2 = record
	patente : integer;
	modelo : string;
	marca : string;
end;

listafabri = ^nodolista2;
nodolista2 = record
	dato : infoauto2;
	sig : listafabri;
end;

auto3 = record
	anio : integer;
	lista : listafabri;
end;

arboltres = ^nodoarboltres;
nodoarboltres = record
	dato : auto3;
	hi : arboltres;
	hd : arboltres;
end;

procedure leerAuto(var a :autos);
begin
	writeln('ingrese marca');
	readln(a.marca);
	if(a.marca <> 'MMM') then begin
		writeln('ingrese modelo');
		readln(a.modelo);
		a.patente := 100 + random(300)+1;
		a.aniofabricacion := 2010 + random(19);
	end;
end;

procedure insertar1(var a:arboluno; at: autos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato := at;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (at.patente < a^.dato.patente) then
			insertar1(a^.hd,at)
		else
			insertar1(a^.hd,at);
end;

procedure agregarEnLista(var l:listaMarca; a: autos);
var nue:listaMarca;
begin
	new(nue);
	nue^.dato.patente := a.patente;
	nue^.dato.aniofabri := a.aniofabricacion;
	nue^.dato.modelo := a.modelo;
	nue^.sig := l;
	l := nue;
end;

procedure insertar2(var a:arboldos;at : autos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.marca := at.marca;
		a^.dato.lista := nil;
		agregarEnLista(a^.dato.lista,at);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.marca = at.marca)then
			agregarEnLista(a^.dato.lista,at)
		else if (a^.dato.marca > at.marca) then
				insertar2(a^.hi,at)
			else
				insertar2(a^.hd,at);
end;

procedure cargarArboles(var a1:arboluno; var a2: arboldos);
var a:autos;
begin
	leerAuto(a);
	while(a.marca <> 'MMM') do begin
		insertar1(a1,a);
		insertar2(a2,a);
		leerAuto(a);
	end;
end;

procedure buscarmarcarA1(a:arboluno; marca:string; var cant: integer);
begin
	if (a <> nil) then begin
		if(a^.dato.marca = marca) then
			cant := cant + 1;
		buscarmarcarA1(a^.hi,marca,cant);
		buscarmarcarA1(a^.hd,marca,cant);
	end
end;

procedure buscarmarcarA2(a:arboldos;marca:string; var cant:integer);
var l: listaMarca;
begin
	if (a <> nil) then begin
		if (a^.dato.marca = marca)then begin
			l := a^.dato.lista;
			while (l <> nil) do begin
				cant := cant + 1;
				l:= l^.sig;
			end;
		end
		else begin
			buscarmarcarA2(a^.hi,marca,cant);
			buscarmarcarA2(a^.hd,marca,cant);
		end;
	end;
end;

procedure agregarAdelante(var l:listafabri; a: autos);
var nue: listafabri;
begin
	new(nue);
	nue^.dato.patente := a.patente;
	nue^.dato.modelo := a.modelo;
	nue^.dato.marca := a.marca;
	nue^.sig := l;
	l := nue;
end;

procedure insertar3(var a:arboltres; at:autos);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.anio := at.aniofabricacion;
		a^.dato.lista := nil;
		agregarAdelante(a^.dato.lista,at);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.anio = at.aniofabricacion) then
			agregarAdelante(a^.dato.lista,at)
		else if (a^.dato.anio > at.aniofabricacion) then
				insertar3(a^.hi,at)
			else
				insertar3(a^.hd,at);
end;

procedure generarArbol3(a:arboluno; var a3:arboltres);
begin
	if (a <> nil) then begin
		insertar3(a3,a^.dato);
		generarArbol3(a^.hi,a3);
		generarArbol3(a^.hd,a3);
	end;
end;

procedure buscarpatente1(a:arboluno; p: integer;var model :string);
begin
	if (a <> nil) then begin
		if (a^.dato.patente = p) then
			model := a^.dato.modelo
		else if (a^.dato.patente > p) then
			buscarpatente1(a^.hi,p,model)
			else
				buscarpatente1(a^.hd,p,model);
	end;
end;

procedure buscar(l:listaMarca; p:integer;var model:string;var ok:boolean);
begin
	 if (l = nil) then
		ok := false
	else begin
		if (l^.dato.patente = p) then begin
			ok := true;
			model := l^.dato.modelo;
		end
		else
			buscar(l^.sig,p,model,ok);
	end;
end;

procedure buscarpatente2(a:arboldos;p:integer;var model:string; var ok:boolean);
begin
	if (a <> nil) and (not ok) then begin
		buscar(a^.dato.lista,p,model,ok);
		buscarpatente2(a^.hi,p,model,ok);
		buscarpatente2(a^.hd,p,model,ok);
	end;
end;

procedure imprimirOrd(a:arboltres);
begin
	if (a <> nil)then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.anio);
		imprimirOrd(a^.hd);
		writeln('');
	end;
end;

var
a1: arboluno;
a2: arboldos;
a3 : arboltres;
marca,modelo : string;
cant: integer;
pat: integer;
ok:boolean;
begin
randomize;
a1 := nil;
a2 := nil;
a3 := nil;
cargarArboles(a1,a2);

writeln('ingrese marca a buscar en arbol 1');
readln(marca);
cant :=0;
buscarmarcarA1(a1,marca,cant);
writeln('la cantidad de autos de dicha marca son: ' ,cant);

writeln('ingrese marca a buscar en arbol 2');
readln(marca);
cant := 0;
buscarmarcarA2(a2,marca,cant);
writeln('la cantidad de autos de dicha marca son: ' ,cant);

generarArbol3(a1,a3);
writeln('imprimira el arbol de anios');
imprimirOrd(a3);

writeln('ingresar patente a buscar en a1');
readln(pat);
buscarpatente1(a1,pat,modelo);
writeln('el modelo de la patente ', pat ,' es : ' , modelo);


writeln('ingresar patente a buscar en a2');
readln(pat);
ok := false;
buscarpatente2(a2,pat,modelo,ok);
if (ok) then
	writeln('el modelo de la patente ',pat ,' es : ' , modelo)
else
	writeln('no se encontro la patente');
end.
