program arboles2;
type rangodia = 1..31;
rangomes = 1..12;

venta = record
		codprodu: integer;
		fecha: integer;
		cantuni: integer;
end;

ventita = record
	codigo : integer;
	cantidad : integer;
end;

facu = record
	fecha : integer;
	cant: integer;
end;
lista =^nod;
nod = record
	dato: facu;
	sig: lista;
end;
otro = record
	cod: integer;
	ventas : lista;
end;

arbo1 = ^nodo1;
nodo1 = record	
	dato : venta;
	hi: arbo1;
	hd: arbo1;
end;

arbo2 = ^nodo2;
nodo2= record
	dato : ventita;
	hi :arbo2;
	hd: arbo2;
end;

arbo3= ^nodo3;
nodo3 = record
	dato : otro;
	hi : arbo3;
	hd: arbo3;
end;
procedure generarVentas(var v:venta);
begin
	v.codprodu:= random(100)*50;
	v.fecha := random(30)+1;
	v.cantuni := random(100)+1;
end;

procedure agregar1(var a1: arbo1; v: venta);
var
	aux: arbo1;
begin
	if a1 = nil then begin
		new(aux);
		aux^.dato := v;
		aux^.hi := nil;
		aux^.hd:= nil;
		a1 := aux;
		end
		else begin
			if a1^.dato.codprodu > v.codprodu then
				agregar1(a1^.hi,v)
				else
					agregar1(a1^.hd,v);
		end; 
	end;

procedure agregar2(var a2:arbo2;v:venta);
var aux: arbo2;
begin
	if a2 = nil then begin
		new(aux);
		aux^.dato.codigo := v.codprodu;
		aux^.dato.cantidad := v.cantuni;
		aux^.hi := nil;
		aux^.hd := nil;
		a2 := aux;
	end
	else begin
		if a2^.dato.codigo = v.codprodu then begin
			a2^.dato.cantidad := a2^.dato.cantidad + v.cantuni;
			end
			else if a2^.dato.codigo > v.codprodu then
				agregar2(a2^.hi,v)
				else 
					agregar2(a2^.hd,v);
	end;
end;
procedure agregarAlaLista(var l:lista;f:facu);
var
nue,aux: lista;
begin
	new(nue);
	nue^.dato:= f;
	nue^.sig := nil;
	if l = nil then 
		l := nue
	else begin
		aux := l;
		while aux^.sig <> nil do
			aux:= aux^.sig;
		aux^.sig := nue;
		end;
end;
procedure agregar3(var a3: arbo3;v:venta);
var
nue: arbo3; f: facu;
begin
	if a3 = nil then begin
	new(nue);
	nue^.dato.cod := v.codprodu;
	nue^.dato.ventas := nil;
	nue^.hi := nil;
	nue^.hd := nil;
	a3 := nue;
	end
	else begin
		if a3^.dato.cod = v.codprodu then begin
			f.fecha := v.fecha;
			f.cant := v.cantuni;
			agregarAlaLista(a3^.dato.ventas,f);
		end
		else if a3^.dato.cod > v.codprodu then
			agregar3(a3^.hi,v)
			else
				agregar3(a3^.hd,v);
	end;
end;
procedure cargararboles(var a1: arbo1;var a2: arbo2; var a3:arbo3);
var
	v:venta;
begin
	generarVentas(v);
		while v.codprodu <> 0 do begin
			agregar1(a1,v);
			agregar2(a2,v);
			agregar3(a3,v);
			generarVentas(v);
		end;
end;
 
procedure buscarFecha(a1: arbo1;fc: integer; var cant: integer);
begin
	if a1 = nil then
		cant := cant + 0
	else if a1^.dato.fecha = fc then
		cant := cant + 1
		else begin
			buscarFecha(a1^.hi,fc,cant);
			buscarFecha(a1^.hd,fc,cant);
		end;
end;

procedure prodmax(a2: arbo2; var cm: integer);
var
	maximo: integer;
begin
	maximo := -1;
	if a2 = nil then
		cm := -1
	else if a2^.dato.cantidad > maximo then begin
			maximo := a2^.dato.cantidad;
			cm := a2^.dato.codigo;
		end
		else begin
			prodmax(a2^.hi,cm);
			prodmax(a2^.hd,cm);
		end;
end;

procedure codmasvendido(a3 :arbo3; var cd: integer; var mx:integer);
var
l: lista; cant: integer;
begin
	if a3 = nil then
		cd := -1
	else begin
		l := a3^.dato.ventas;
		cant := 0;
		while l <> nil do begin
			cant := cant + l^.dato.cant;
			l:= l^.sig;
		end;
		if cant > mx then begin
			mx := cant;
			cd := a3^.dato.cod;
		end;
		codmasvendido(a3^.hi,cd,mx);
		codmasvendido(a3^.hd,cd,mx);
	end;
end;

var
a1: arbo1;
a2: arbo2;
a3: arbo3;
fecha, c : integer;
codmax : integer;
cd,mx: integer;
begin
randomize;
a1:= nil;
a2:= nil;
a3:= nil;
cargararboles(a1,a2,a3);

writeln('Ingrese una fecha'); readln(fecha);
c := 0;
buscarFecha(a1,fecha,c);
	writeln('la cantidad de productos vendidos en esa fecha es de ',c);
	
prodmax(a2,codmax);
	writeln('el codigo con maximas cantidad de unidades vendidas es ',codmax);

mx := 0;
codmasvendido(a3,cd,mx);
end.
