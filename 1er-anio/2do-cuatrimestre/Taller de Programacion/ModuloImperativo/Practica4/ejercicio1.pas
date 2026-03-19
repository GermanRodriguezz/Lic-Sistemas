program unodelcuatro;
type venta = record
		codventa: integer;
		codprod: integer;
		cantunidades: integer;
		preciounitario: real;
end;

produc= record
	codigo : integer;
	cantidadtotal: integer;
	montototal: real;
end;

arbol = ^nodo;
nodo = record
	dato : produc;
	hi : arbol;
	hd : arbol;
end;
procedure leerventas(var v: venta);
begin
	writeln('ingrese un codigo de venta'); readln(v.codventa);
	if v.codventa <> 0 then begin
		v.codprod := random(200-100)+100;
		writeln('el codigo del producto es ',v.codprod);
		v.cantunidades := random(50)+1;
		writeln('las unidades son ',v.cantunidades);
		v.preciounitario := (500 + random(100))/2;
		writeln('el precio unitario es ',v.preciounitario:2:2);
	end;
end;


procedure insertar(var a:arbol; v: venta);
var
	p: produc;
begin
	if a = nil then begin
		new(a);
		p.codigo := v.codprod;
		p.cantidadtotal := v.cantunidades;
		p.montototal := v.cantunidades * v.preciounitario;
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else
	if a^.dato.codigo = v.codprod then begin
		a^.dato.cantidadtotal := a^.dato.cantidadtotal + v. cantunidades;
		a^.dato.montototal := a^.dato.montototal+v.cantunidades * v.preciounitario;
		end
	else
		if a^.dato.codigo > v.codprod then
			insertar(a^.hi,v)
			else
				insertar(a^.hd,v);
end;

procedure cargarArbol(var a: arbol);
var
	v: venta;
begin
	leerventas(v);
	while v.codventa <> 0 do begin
		insertar(a,v);
		leerventas(v);
	end;
end;

procedure imprimirOrd(a: arbol);
begin
	if a <> nil then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.codigo);
		imprimirOrd(a^.hd);
	end;
end;

function minCod (a:arbol): integer;
begin
	if a <> nil then 
		if a^.hi <> nil then
			minCod := minCod(a^.hi);
	minCod:= a^.dato.codigo;
end;


procedure codsmenores(a: arbol; valor: integer; var cant:integer);
begin
	if a <> nil then begin
		if a^.dato.codigo > valor then 
			cant := cant + 0
			else
				cant:= cant+1;
		codsmenores(a^.hi,valor,cant);
		codsmenores(a^.hd,valor,cant);
	end;
end;

procedure retornarMonto(a: arbol; p1,p2: integer; var monto: real);
begin
	if a <> nil then begin
		if p1 < a^.dato.codigo then begin
			if p2 > a^.dato.codigo then begin
				monto := monto + a^.dato.montototal;
				retornarMonto(a^.hi,p1,p2,monto);
				retornarMonto(a^.hd,p1,p2,monto);
				end
			else
				retornarMonto(a^.hi,p1,p2,monto)
		end
		else 
			retornarMonto(a^.hd,p1,p2,monto);
end;
end;
var
a: arbol;
cant: integer;
monto: real;
valor:integer;
p1,p2: integer;
begin
a := nil;

cargarArbol(a);

imprimirOrd(a);

writeln('el min codigo es ',minCod(a));

writeln('ingrese un valor'); readln(valor);
codsmenores(a,valor,cant);
writeln('la cantidad que son menos al valor ingresado son', cant);

writeln('ingrese p1'); readln(p1); 
writeln('ingrese p2'); readln(p2);
monto := 0;
retornarMonto(a,p1,p2,monto);
writeln('el monto total entre los dos valores es ',monto:2:2);
end.
