program ejer2;
type venta = record	
		codProd : integer;
		fecha : integer;
		cantunidades : integer;
	end;
	
venta2 = record
	cod: integer;
	cant: integer;
end;

ventita = record
	fec:integer;
	cant: integer;
end;

listaunidades = ^nodolista;
nodolista = record
	dato : ventita;
	sig: listaunidades;
end;

venta3 = record
	cod : integer;
	lista: listaunidades;
end;

arboluno = ^nodouno;
nodouno = record
	dato : venta;
	hi : arboluno;
	hd : arboluno;
end;
	
arboldos = ^nododos;
nododos = record
	dato : venta2;
	hi : arboldos;
	hd : arboldos;
end;
	
arboltres = ^nodotres;
nodotres = record
	dato : venta3;
	hi : arboltres;
	hd : arboltres;
end;
	
procedure leerVenta(var v:venta);
begin
	v.codProd := random(150);
	if(v.codProd <> 0) then begin
		v.fecha := random(31)+1;
		v.cantunidades := random(500)+1;
	end;
end;

procedure insertar1(var a: arboluno; v:venta);
var aux:arboluno;
begin
	if (a = nil) then begin
		new(aux);
		aux^.dato := v;
		aux^.hi := nil;
		aux^.hd := nil;
		a := aux;
	end
	else
		if (v.codProd < a^.dato.codProd) then
			insertar1(a^.hi,v)
		else
			insertar1(a^.hd,v);
end;

procedure insertar2(var a:arboldos; v:venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.cod := v.codProd;
		a^.dato.cant := v.cantunidades;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (v.codProd = a^.dato.cod) then
		a^.dato.cant := a^.dato.cant + v.cantunidades
		else if (v.codProd < a^.dato.cod) then
				insertar2(a^.hi,v)
			else
				insertar2(a^.hd,v);
end;

procedure agregarLista(var l:listaunidades; v:venta);
var nue,aux:listaunidades;
begin
	new(nue);
	nue^.dato.fec := v.fecha;
	nue^.dato.cant := v.cantunidades;
	nue^.sig := nil;
	if (l = nil) then 
		l:= nue
	else begin
		aux := l;
		while (aux^.sig <> nil) do
			aux := aux^.sig;
		aux^.sig := nue;
	end;
end;

procedure insertar3(var a:arboltres; v:venta);
begin
	if (a = nil) then begin
		new(a);
		a^.dato.lista := nil;
		a^.dato.cod := v.codProd;
		agregarLista(a^.dato.lista,v);
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (v.codProd = a^.dato.cod) then
			agregarLista(a^.dato.lista,v)
		else
			if (v.codProd < a^.dato.cod)then
				insertar3(a^.hi,v)
			else
				insertar3(a^.hd,v);
end;

procedure cargarArboles(var a1:arboluno; var a2:arboldos; var a3:arboltres);
var v:venta;
begin
	leerVenta(v);
	while (v.codProd <> 0) do begin
		insertar1(a1,v);
		insertar2(a2,v);
		insertar3(a3,v);
		leerVenta(v);
	end;
end;
	
procedure buscarFecha(a:arboluno; f:integer;var cant:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.fecha = f) then
			cant := cant + a^.dato.cantunidades;
		buscarFecha(a^.hi,f,cant);
		buscarFecha(a^.hd,f,cant);
	end;
end;
	
procedure maximasUnidadesVendidas(a:arboldos; var maxCod,maxCant:integer);
begin
	if (a <> nil)then begin
		if (a^.dato.cant > maxCant) then begin
			maxCant := a^.dato.cant;
			maxCod := a^.dato.cod;
		end;
		maximasUnidadesVendidas(a^.hi,maxCod,maxCant);
		maximasUnidadesVendidas(a^.hd,maxCod,maxCant);
	end;
end;
	
procedure saberVentas(l:listaunidades;var c:integer);
begin
	if (l <> nil) then
		c:= c + 1;
	saberVentas(l^.sig,c);
end;

procedure mayorVentas(a:arboltres; var maxCod,cantVentas:integer);
var cant:integer;
begin
	if (a <> nil) then begin
		cant := 0;
		saberVentas(a^.dato.lista,cant);
		if (cant > cantVentas) then begin
			cantVentas := cant;
			maxCod := a^.dato.cod;
		end;
		mayorVentas(a^.hi,maxCod,cantVentas);
		mayorVentas(a^.hd,maxCod,cantVentas);
	end;
end;
	
var
	a1: arboluno;
	a2: arboldos;
	a3: arboltres;
	f,cant,codMax,cantMax,codMx,cantt: integer;
begin
a1 := nil;
a2 := nil;
a3 := nil;
cargarArboles(a1,a2,a3);

cant := 0;
writeln('ingrese fecha a buscar');
readln(f);
buscarFecha(a1,f,cant);
writeln('la cantidad de ventas de esa fecha son: ',cant);

cantMax := 0;
maximasUnidadesVendidas(a2,codMax,cantMax);
writeln('el codigo con max cant total de unidades vendidas es el : ',codMax);

cantt := 0;
mayorVentas(a3,codMx,cantt);
writeln('el cod con max cant de ventas es : ',codMx);
end.
