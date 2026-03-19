program parcial1;
type
venta = record
	dnicliente : integer;
	codsucursal : integer;
	numfactura: integer;
	monto: real;
end;

factura = record
	numfac : integer;
	monto : real;
end;

listaCompra = ^nodolista;
nodolista = record
	dato : factura;
	sig : listaCompra;
end;

info = record
	dni : integer;
	lista: listaCompra;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : info;
	hi : arbol;
	hd : arbol;
end;

vectorSucursal = array [1..10] of integer;

procedure leerVenta(var v:venta);
begin
	v.dnicliente := random(1000);
	if (v.dnicliente <> 0) then begin
		v.codsucursal := random(10)+1;
		v.numfactura := 100 + random(550);
		v.monto := 2000 + random(1500)+1;
	end;
end;

procedure inicializarVector(var v:vectorSucursal);
var i: integer;
begin
	for i := 1 to 10 do
		v[i]:= 0;
end;

procedure agregarEnLista(var l:listaCompra; f:factura);
var nue : listaCompra;
begin
	new(nue);
	nue^.dato := f;
	nue^.sig := l;
	l := nue;
end;

procedure insertar(var a:arbol; v:venta);
var f:factura;
begin
	if (a = nil) then begin
		new(a);
		a^.dato.dni := v.dnicliente;
		a^.dato.lista := nil;
		f.numfac := v.numfactura;
		f.monto := v.monto;
		agregarEnLista(a^.dato.lista,f);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.dni = v.dnicliente) then begin
			f.numfac := v.numfactura;
			f.monto := v.monto;
			agregarEnLista(a^.dato.lista,f);
		end
		else if (a^.dato.dni > v.dnicliente) then
				insertar(a^.hi,v)
			else
				insertar(a^.hd,v);
end;

procedure cargarArbol(var a :arbol; var vs:vectorSucursal);
var v:venta;
begin
	leerVenta(v);
	while(v.dnicliente <> 0) do begin
		vs[v.codsucursal] := vs[v.codsucursal] + 1;
		insertar(a,v);
		leerVenta(v);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil)then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.dni);
		imprimirOrd(a^.hd);
	end;
end;

procedure imprimirFacturas(l:listaCompra);
begin
	while (l <> nil) do begin
		writeln('factura = ', l^.dato.numfac , ' : ', l^.dato.monto);
		l := l^.sig;
	end;
end;

procedure conta(l:listaCompra; monto:real; var cant:integer);
begin
	if (l <> nil) then begin
		if (l^.dato.monto > monto) then
			cant := cant + 1;
		conta(l^.sig,monto,cant);
	end;
end;

procedure moduloB(a:arbol; dni : integer; monto: real; var cant:integer);
begin
	if (a <> nil) then
		if (a^.dato.dni = dni) then begin
			imprimirFacturas(a^.dato.lista);
			conta(a^.dato.lista,monto,cant)
		end
		else if (a^.dato.dni > dni) then
				moduloB(a^.hi,dni,monto,cant)
			else
				moduloB(a^.hd,dni,monto,cant);
end;

procedure moduloC(v: vectorSucursal; var codSuc:integer; var maxCant:integer;pos:integer);
begin
	if (pos < 11) then begin
		if (v[pos] > maxCant) then begin
			maxCant := v[pos];
			codSuc := pos;
		end;
	moduloC(v,codSuc,maxCant,pos+1);
	end;
end;

procedure imprimirVector(v:vectorSucursal);
var i: integer;
begin
	for i := 1 to 10 do
		writeln('sucursal ' ,i , ' : ' , v[i]);
end;

var
a:arbol;
v:vectorSucursal;
dni:integer;
monto:real;
cantidad: integer;
suc,i: integer;
begin
randomize;
a := nil;
inicializarVector(v);
cargarArbol(a,v);
writeln('imprimira arbol ordenada');
imprimirOrd(a);


writeln('ingrese dni y el monto!');
readln(dni);
readln(monto);
moduloB(a,dni,monto,cantidad);
writeln('la cant de facturas del dni ', dni, ' que superan el monto ',monto , ' son ', cantidad);


imprimirVector(v);
i:=1;
cantidad := -1;
moduloC(v,suc,cantidad,i);
writeln('el codigo con mayor cantidad de ventas es : ' , suc );
end.
