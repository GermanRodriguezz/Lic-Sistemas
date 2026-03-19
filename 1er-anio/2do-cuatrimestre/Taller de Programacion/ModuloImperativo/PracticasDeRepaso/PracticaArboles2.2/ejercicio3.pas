program ejer3;
type venta = record
		codigoventa : integer;
		codigoproducto : integer;
		cantunidadesven: integer;
		preciouni: real;
	end;
	
producto = record
	codigo : integer;
	cantidadTotalVendida: integer;
	montoTotal : real;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : producto;
	hi : arbol;
	hd : arbol;
end;

procedure leerVenta(var v:venta);
begin
		writeln('ingrese codigo de venta');
		readln(v.codigoventa); 
	if (v.codigoventa <> -1) then begin
		v.codigoproducto := random(1500);
		v.cantunidadesven:= random(500);
		v.preciouni := 100 + random(350-100);
	end;
end;

procedure armarProd(var p:producto; v:venta);
begin
	p.codigo := v.codigoproducto;
	p.cantidadTotalVendida := v.cantunidadesven;
	p.montoTotal := v.preciouni * v.cantunidadesven;
end;

procedure insertar(var a :arbol; v: venta);
var p:producto;
begin
	if (a = nil) then begin
		new(a);
		armarProd(p,v);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (a^.dato.codigo = v.codigoproducto) then begin
			a^.dato.cantidadTotalVendida:= a^.dato.cantidadTotalVendida + v.cantunidadesven;
			a^.dato.montoTotal := a^.dato.montoTotal + (v.preciouni * v.cantunidadesven);
		end
		else if (v.codigoproducto < a^.dato.codigo) then
				insertar(a^.hi,v)
			else
				insertar(a^.hd,v);
end;

procedure cargarArbol(var a:arbol);
var v:venta;
begin
	leerVenta(v);
	while (v.codigoventa <> - 1) do begin
		insertar(a,v);
		leerVenta(v);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if (a <> nil) then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.codigo);
		imprimirOrd(a^.hd);
	end;
end;

procedure codmasventas(a:arbol; var cantMax,codMax:integer);
begin
	if (a <> nil) then begin
		if (a^.dato.cantidadTotalVendida > cantMax) then begin
			cantMax := a^.dato.cantidadTotalVendida;
			codMax := a^.dato.codigo;
		end;
		codmasventas(a^.hi,cantMax,codMax);
		codmasventas(a^.hd,cantMax,codMax);
	end;
end;

procedure codsmenores(a:arbol; var cantidad:integer; valor:integer);
begin
	if (a <> nil) then begin
		if (valor > a^.dato.codigo) then begin
			cantidad := cantidad + 1;
			codsmenores(a^.hd,cantidad,valor);
			codsmenores(a^.hi,cantidad,valor);
		end
		else
			codsmenores(a^.hi,cantidad,valor);
	end;
end;

procedure montoEntreValores(a:arbol;v1,v2: integer; var monto:real);
begin
	if (a <> nil) then
		if (v1 < a^.dato.codigo) then 
			if(v2 > a^.dato.codigo) then begin
				monto := monto + a^.dato.montoTotal;
				montoEntreValores(a^.hi,v1,v2,monto);
				montoEntreValores(a^.hd,v1,v2,monto);
			end
			else
				montoEntreValores(a^.hi,v1,v2,monto)
		else
			montoEntreValores(a^.hd,v1,v2,monto);
end;

var
	a:arbol;
	cantidadMaxima,codigoMaximo: integer;
	cantmenores : integer;
	monto : real;
begin
randomize;
a := nil;
cargarArbol(a);

writeln('imprimira ordenado');
imprimirOrd(a);

codmasventas(a,cantidadMaxima,codigoMaximo);
writeln('el codigo con mayor cantidad de unidades vendidas es : ' , codigoMaximo);

codsmenores(a,cantmenores,500);
writeln('la cantidad de codigos que son menores a 500 son ' ,cantmenores);

montoEntreValores(a,250,500,monto);
writeln('el monto total es de : ' , monto:2:2);
end.
