program ejer1;
type producto = record
		codigo: integer;
		cantidadtotalvendidos : integer;
		montofinal : real;
	end;
	
venta  = record
	codigoventa : integer;
	codigoproducto : integer;
	cantidadunidades : integer;
	preciouni : real;
end;

arbol = ^nodoarbol;
nodoarbol = record
	dato : producto;
	hi : arbol;
	hd : arbol;
end;

procedure leerVenta(var v:venta);
begin
	writeln('ingresar codigo de venta');
	readln(v.codigoventa);
	if (v.codigoventa <> 0 ) then begin
		v.codigoproducto := random(50);
		v.cantidadunidades := random(1000);
		v.preciouni := 15 + random(150);
	end;
end;

procedure armarProd(var p:producto; v:venta);
begin
	p.codigo := v.codigoproducto;
	p.cantidadtotalvendidos := v.cantidadunidades;
	p.montofinal := v.preciouni * v.cantidadunidades;
end;

procedure insertar(var a:arbol; v:venta);
var p:producto;
begin
	if (a = nil) then begin
		new(a);
		armarProd(p,v);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
	end
	else if (v.codigoproducto = a^.dato.codigo) then begin
		a^.dato.cantidadtotalvendidos := a^.dato.cantidadtotalvendidos + v.cantidadunidades;
		a^.dato.montofinal := a^.dato.montofinal + (v.preciouni * v.cantidadunidades);
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
	while (v.codigoventa <> 0) do begin
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

procedure menorCod(a:arbol; var menor:integer);
begin
	if (a <> nil) then
		if (a^.dato.codigo < menor)then
			menor := a^.dato.codigo;
		if (a^.hi <> nil) then
			menorCod(a^.hi,menor);
end;

procedure codsmenores(a:arbol; valor: integer; var cant: integer);
begin
	if (a <> nil) then begin
		if (valor > a^.dato.codigo) then begin
			cant := cant + 1;
			codsmenores(a^.hd,valor,cant);
			codsmenores(a^.hi,valor,cant);
		end
		else
			codsmenores(a^.hi,valor,cant);
	end;
end;

procedure montoEntreValores(a:arbol; var monto:real;valor1,valor2:integer);
begin
	if (a <> nil) then begin
		if (valor1 < a^.dato.codigo) then
			if (valor2 > a^.dato.codigo) then begin
				monto := monto + a^.dato.montoFinal;
				montoEntreValores(a^.hi,monto,valor1,valor2);
				montoEntreValores(a^.hd,monto,valor1,valor2);
			end
			else 
				montoEntreValores(a^.hi,monto,valor1,valor2)
		else
			montoEntreValores(a^.hd,monto,valor1,valor2);
	end;
end;

var
a:arbol;
cant,menor:integer;
monto : real;
begin
randomize;
a := nil;
cargarArbol(a);
writeln('imprimira ordenado');
imprimirOrd(a);

menor := 9999;
menorCod(a,menor);
writeln('el menor codigo de producto es : ' ,menor);

codsmenores(a,25,cant);
writeln('la cantidad de menores codigos a 25 son : ',cant);

montoEntreValores(a,monto,10,20);
writeln('el monto total entre los valor es : ',monto:2:2);
end.
