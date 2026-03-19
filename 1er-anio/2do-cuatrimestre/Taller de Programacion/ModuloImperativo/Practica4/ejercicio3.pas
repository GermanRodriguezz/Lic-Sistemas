program ejercicio3;
type producto = record
	codp: integer;
	canttotal : integer;
	montototal: integer;
end;

venta = record
	codv: integer;
	codigoproducto: integer;
	cantvendidas: integer;
	preciounidad : integer;
end;

arbol = ^nodo;
nodo = record
	dato : producto;
	hi: arbol;
	hd: arbol;
end;

procedure leerventas(var v: venta);
begin
	writeln('ingrese un codigo de venta!'); readln(v.codv);
	if v.codv <> -1 then begin
		v.codigoproducto := random (100)+1;
		writeln('el codigo de producto es ',v.codigoproducto);
		v.cantvendidas := random(50)+1;
		writeln('la cantidad vendida del producto es ',v.cantvendidas);
		v.preciounidad := 100+random(400)+1;
		writeln('el precio de esta unidad es ',v.preciounidad);
	end;
end;

procedure insertar(var a:arbol; v: venta);
var
	p: producto;
begin
	if a = nil then begin
		new(a);
		p.codp := v.codigoproducto;
		p.canttotal := v.cantvendidas;
		p.montototal := (v.cantvendidas * v.preciounidad);
		a^.dato := p;
		a^.hi := nil;
		a^.hd := nil;
		end
		else if a^.dato.codp = v.codigoproducto then begin
			a^.dato.canttotal := a^.dato.canttotal + v.cantvendidas;
			a^.dato.montototal := a^.dato.montototal + (v.cantvendidas*v.preciounidad);
			end
			else if a^.dato.codp > v.codigoproducto then
				insertar(a^.hi,v)
				else
					insertar(a^.hd,v);
end;

procedure cargarArbol(var a:arbol);
var
	v: venta;
begin
	leerventas(v);
	while v.codv <> -1 do begin
		insertar(a,v);
		leerventas(v);
	end;
end;

procedure imprimirOrd(a:arbol);
begin
	if a <> nil then begin
		imprimirOrd(a^.hi);
		writeln(a^.dato.codp);
		imprimirOrd(a^.hd);
	end;
end;

procedure maximovendedor(a: arbol;var max: integer; var codmax: integer);
begin
	if a <> nil then begin
		if a^.dato.canttotal > max then begin
			max := a^.dato.canttotal;
			codmax := a^.dato.codp;
		end
		else begin
		maximovendedor(a^.hi,max,codmax);
		maximovendedor(a^.hd,max,codmax);
		end;
	end;
end;

procedure codsmenores(a: arbol; v: integer; var cant: integer);
begin
	if a <> nil then begin
		if a^.dato.codp > v then
			cant := cant +0
		else
			cant := cant +1;
		codsmenores(a^.hi,v,cant);
		codsmenores(a^.hd,v,cant);
	end;
end;

procedure retornarMonto(a: arbol; p1,p2: integer; var mt: real);
begin
	if a <> nil then 
		if p1 < a^.dato.codp then begin
			if p2 > a^.dato.codp then begin
				mt := mt + a^.dato.montototal;
				retornarMonto(a^.hi,p1,p2,mt);
				retornarMonto(a^.hd,p1,p2,mt);
				end
			else
				retornarMonto(a^.hi,p1,p2,mt)
			end
		else
			retornarMonto(a^.hd,p1,p2,mt);
end;
var
a: arbol;
max,codmax,cantidad: integer;
valor : integer;
p1,p2: integer;
monto: real;
begin
randomize;
a:= nil;
cargarArbol(a);

imprimirOrd(a);

codmax:= 0; max := 0;
maximovendedor(a,max,codmax);
	writeln('el codigo que tiene mas cantidades vendidas es ',codmax);

writeln('ingrese el valor'); readln(valor);
cantidad := 0;
codsmenores(a,valor,cantidad);
	writeln('la cantidad de cods que son menores que el valor ', valor , 'son ', cantidad);

writeln('ingrese parametro 1'); readln(p1);
writeln('ingrese parametro 2'); readln(p2);
monto := 0;
retornarMonto(a,p1,p2,monto);
	write('el monto total es ', monto:2:2);
end.
